package dev.utaa.linimal.extension.features.theme;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.content.res.Resources;
import android.content.res.loader.AssetsProvider;
import android.content.res.loader.ResourcesLoader;
import android.content.res.loader.ResourcesProvider;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.os.ParcelFileDescriptor;
import android.util.TypedValue;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import dev.utaa.linimal.extension.config.LinimalConfig;
import dev.utaa.linimal.extension.config.LinimalConfigHealth;

/**
 * ダークモードの背景を黒にする AMOLED テーマ。
 *
 * <p>LINE の DEX は書き換えず、起動時に夜間設定の背景色と下部タブの背景画像だけを黒にした
 * resource table を {@link ResourcesLoader} として Application と各 Activity の {@link Resources} へ
 * 重ねます。昼間の設定には値を持たないため、端末がライトモードのときは何も変わりません。</p>
 *
 * <p>設定 OFF・未初期化・適用不可・例外のときは loader を追加せず、LINE の元の色を使います。
 * 画像を用意できないときは色だけを上書きします。変更は再起動後に反映します。</p>
 */
public final class AmoledThemeHooks {
    private static final Object LOCK = new Object();
    private static boolean initialized;

    private AmoledThemeHooks() {
    }

    /** {@code LinimalBootstrap} から 1 度だけ呼ばれます。 */
    public static void initialize(Context context) {
        try {
            synchronized (LOCK) {
                if (initialized || context == null) {
                    return;
                }
                initialized = true;
            }
            LinimalConfig config = LinimalConfig.get();
            if (config.getRuntimeHealth() != LinimalConfigHealth.OK || !config.isAmoledThemeEnabled()) {
                return;
            }
            Context applicationContext = context.getApplicationContext();
            if (!(applicationContext instanceof Application)) {
                return;
            }
            Application application = (Application) applicationContext;
            ResourcesLoader loader = createLoader(application);
            if (loader == null) {
                return;
            }
            application.getResources().addLoaders(loader);
            application.registerActivityLifecycleCallbacks(new Callbacks(loader));
        } catch (Throwable ignored) {
            // loader を作れない場合は LINE の元の色のまま動かします。
        }
    }

    private static ResourcesLoader createLoader(Application application) throws IOException {
        Resources resources = application.getResources();
        File directory = new File(application.getCodeCacheDir(), "linimal");
        if (!directory.isDirectory() && !directory.mkdirs()) {
            return null;
        }
        AndroidResolver resolver = new AndroidResolver(resources, application.getPackageName());
        AmoledThemeColors.Table table = AmoledThemeColors.buildTable(resolver);
        if (table == null) {
            return null;
        }
        Map<String, ParcelFileDescriptor> files = new HashMap<>();
        for (Map.Entry<String, Integer> file : table.files.entrySet()) {
            byte[] png = resolver.images.get(file.getValue());
            if (png == null) {
                return null;
            }
            files.put(file.getKey(), openDetached(directory, ".png", png));
        }
        try (ParcelFileDescriptor descriptor = openDetached(directory, ".arsc", table.arsc)) {
            // provider は file descriptor を複製して読むため、閉じても参照は残ります。
            ResourcesProvider provider = ResourcesProvider.loadFromTable(descriptor, new ImageAssets(files));
            ResourcesLoader loader = new ResourcesLoader();
            loader.addProvider(provider);
            return loader;
        }
    }

    /**
     * 一時ファイルへ書き出して開き、すぐ削除します。LINE は複数の process で起動するため、
     * ファイル名を共有せず、process ごとに開いた descriptor だけを使います。
     */
    private static ParcelFileDescriptor openDetached(File directory, String suffix, byte[] bytes)
            throws IOException {
        File file = File.createTempFile("amoled-", suffix, directory);
        try {
            try (FileOutputStream out = new FileOutputStream(file)) {
                out.write(bytes);
            }
            return ParcelFileDescriptor.open(file, ParcelFileDescriptor.MODE_READ_ONLY);
        } finally {
            //noinspection ResultOfMethodCallIgnored
            file.delete();
        }
    }

    /** loader の table が参照する画像だけを返します。それ以外は LINE の元の resource から読みます。 */
    private static final class ImageAssets implements AssetsProvider {
        private final Map<String, ParcelFileDescriptor> files;

        ImageAssets(Map<String, ParcelFileDescriptor> files) {
            this.files = files;
        }

        @Override
        public AssetFileDescriptor loadAssetFd(String path, int accessMode) {
            ParcelFileDescriptor file = files.get(path);
            if (file == null) {
                return null;
            }
            try {
                return new AssetFileDescriptor(file.dup(), 0, file.getStatSize());
            } catch (IOException ignored) {
                return null;
            }
        }
    }

    private static final class AndroidResolver implements AmoledThemeColors.Resolver {
        private final Resources resources;
        private final String packageName;
        final Map<Integer, byte[]> images = new HashMap<>();

        AndroidResolver(Resources resources, String packageName) {
            this.resources = resources;
            this.packageName = packageName;
        }

        @Override
        public int id(String name, String type) {
            return resources.getIdentifier(name, type, packageName);
        }

        @Override
        public String typeName(int resourceId) {
            try {
                return resources.getResourceTypeName(resourceId);
            } catch (Resources.NotFoundException ignored) {
                return null;
            }
        }

        @Override
        public String packageName(int resourceId) {
            try {
                return resources.getResourcePackageName(resourceId);
            } catch (Resources.NotFoundException ignored) {
                return null;
            }
        }

        /** 元の画像を同じ density・同じ寸法のまま読み、不透明な部分を黒にした PNG を用意します。 */
        @Override
        public int imageDensity(int resourceId) {
            try {
                TypedValue value = new TypedValue();
                resources.getValue(resourceId, value, true);
                String file = value.string != null ? value.string.toString() : "";
                boolean bitmap = (file.endsWith(".png") || file.endsWith(".webp")) && !file.endsWith(".9.png");
                if (!bitmap || value.density <= 0 || value.density >= TypedValue.DENSITY_NONE) {
                    return 0;
                }
                Bitmap source;
                try (InputStream in = resources.openRawResource(resourceId, value)) {
                    source = BitmapFactory.decodeStream(in);
                }
                if (source == null) {
                    return 0;
                }
                int width = source.getWidth();
                int height = source.getHeight();
                int[] pixels = new int[width * height];
                source.getPixels(pixels, 0, width, 0, 0, width, height);
                source.recycle();
                AmoledThemeColors.blackenOpaquePixels(pixels);
                Bitmap black = Bitmap.createBitmap(pixels, width, height, Bitmap.Config.ARGB_8888);
                ByteArrayOutputStream png = new ByteArrayOutputStream();
                boolean written = black.compress(Bitmap.CompressFormat.PNG, 100, png);
                black.recycle();
                if (!written) {
                    return 0;
                }
                images.put(resourceId, png.toByteArray());
                return value.density;
            } catch (Throwable ignored) {
                return 0;
            }
        }
    }

    /** Activity の Resources は Application とは別のため、onCreate の前に同じ loader を重ねます。 */
    private static final class Callbacks implements Application.ActivityLifecycleCallbacks {
        private final ResourcesLoader loader;

        Callbacks(ResourcesLoader loader) {
            this.loader = loader;
        }

        @Override
        public void onActivityPreCreated(Activity activity, Bundle savedInstanceState) {
            try {
                activity.getResources().addLoaders(loader);
            } catch (Throwable ignored) {
                // この Activity は LINE の元の色のまま表示します。
            }
        }

        @Override
        public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
        }

        @Override
        public void onActivityStarted(Activity activity) {
        }

        @Override
        public void onActivityResumed(Activity activity) {
        }

        @Override
        public void onActivityPaused(Activity activity) {
        }

        @Override
        public void onActivityStopped(Activity activity) {
        }

        @Override
        public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
        }

        @Override
        public void onActivityDestroyed(Activity activity) {
        }
    }
}
