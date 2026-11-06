package jp.futabanet.gaugau.patch;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.net.Uri;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

/** JSON file export/import for manga favorites stored by the GauGau account. */
public final class FavoritesTransfer {
    private static final int REQUEST_EXPORT = 0x47A1;
    private static final int REQUEST_IMPORT = 0x47A2;
    private static final int MAX_FILE_BYTES = 2 * 1024 * 1024;
    private static final String FORMAT = "gaugau-favorites";
    private static final ExecutorService IO = Executors.newSingleThreadExecutor(r -> {
        Thread thread = new Thread(r, "gaugau-favorites-transfer");
        thread.setDaemon(true);
        return thread;
    });

    private FavoritesTransfer() { }

    public static void showMenu(Activity activity) {
        new AlertDialog.Builder(activity)
                .setTitle("お気に入りの移行")
                .setItems(new CharSequence[]{"エクスポート", "インポート"}, (dialog, which) -> {
                    if (which == 0) startExportPicker(activity);
                    else startImportPicker(activity);
                })
                .setNegativeButton("キャンセル", null)
                .show();
    }

    private static void startExportPicker(Activity activity) {
        Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("application/json");
        intent.putExtra(Intent.EXTRA_TITLE, "gaugau-favorites.json");
        try {
            activity.startActivityForResult(intent, REQUEST_EXPORT);
        } catch (Throwable error) {
            toast(activity, "保存先を開けませんでした");
        }
    }

    private static void startImportPicker(Activity activity) {
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("application/json");
        try {
            activity.startActivityForResult(intent, REQUEST_IMPORT);
        } catch (Throwable error) {
            toast(activity, "ファイルを開けませんでした");
        }
    }

    /** Called from the app's existing Activity.onActivityResult implementation. */
    public static void onActivityResult(Activity activity, int requestCode, int resultCode, Intent data) {
        if (activity == null || !activity.getClass().getName().equals("jp.co.link_u.gaugau.feature.MainActivity") ||
                resultCode != Activity.RESULT_OK || data == null || data.getData() == null) return;
        Uri uri = data.getData();
        if (requestCode == REQUEST_EXPORT) exportTo(activity, uri);
        else if (requestCode == REQUEST_IMPORT) readImport(activity, uri);
    }

    private static void exportTo(Activity activity, Uri uri) {
        IO.execute(() -> {
            try {
                JSONArray favorites = fetchFavorites();
                JSONObject document = new JSONObject();
                document.put("format", FORMAT);
                document.put("version", 1);
                document.put("favorites", favorites);
                try (OutputStream output = activity.getContentResolver().openOutputStream(uri, "wt")) {
                    if (output == null) throw new IllegalStateException("No output stream");
                    output.write(document.toString(2).getBytes(StandardCharsets.UTF_8));
                }
                toast(activity, "お気に入り " + favorites.length() + " 件を書き出しました");
            } catch (Throwable error) {
                toast(activity, "エクスポートに失敗しました: " + message(error));
            }
        });
    }

    private static JSONArray fetchFavorites() throws Exception {
        Object page = invokeSuspend("L", new Class<?>[]{int.class}, new Object[]{0});
        if (page == null) throw new IllegalStateException("お気に入りを取得できませんでした");
        @SuppressWarnings("unchecked")
        List<Object> bookmarks = (List<Object>) page.getClass().getMethod("getBookmarksList").invoke(page);
        JSONArray favorites = new JSONArray();
        for (Object manga : bookmarks) {
            int titleId = (Integer) manga.getClass().getMethod("getTitleId").invoke(manga);
            JSONObject item = new JSONObject();
            item.put("titleId", titleId);
            try {
                item.put("title", manga.getClass().getMethod("getTitleName").invoke(manga));
            } catch (NoSuchMethodException ignored) { }
            favorites.put(item);
        }
        return favorites;
    }

    private static void readImport(Activity activity, Uri uri) {
        IO.execute(() -> {
            try {
                List<Integer> ids = parseIds(readText(activity, uri));
                if (ids.isEmpty()) {
                    toast(activity, "読み込めるお気に入りがありません");
                    return;
                }
                activity.runOnUiThread(() -> confirmImport(activity, ids));
            } catch (Throwable error) {
                toast(activity, "ファイルを読み込めませんでした: " + message(error));
            }
        });
    }

    private static String readText(Activity activity, Uri uri) throws Exception {
        try (InputStream input = activity.getContentResolver().openInputStream(uri);
             ByteArrayOutputStream output = new ByteArrayOutputStream()) {
            if (input == null) throw new IllegalStateException("No input stream");
            byte[] buffer = new byte[8192];
            int count;
            int total = 0;
            while ((count = input.read(buffer)) != -1) {
                total += count;
                if (total > MAX_FILE_BYTES) throw new IllegalArgumentException("ファイルが大きすぎます");
                output.write(buffer, 0, count);
            }
            return new String(output.toByteArray(), StandardCharsets.UTF_8).replace("\uFEFF", "").trim();
        }
    }

    private static List<Integer> parseIds(String text) throws Exception {
        JSONObject document = new JSONObject(text);
        JSONArray entries = document.getJSONArray("favorites");
        Set<Integer> unique = new LinkedHashSet<>();
        for (int index = 0; index < entries.length() && unique.size() < 5000; index++) {
            Object value = entries.get(index);
            int id = 0;
            if (value instanceof Number) id = ((Number) value).intValue();
            else if (value instanceof JSONObject) {
                JSONObject item = (JSONObject) value;
                if (item.has("titleId")) id = item.optInt("titleId", 0);
                else if (item.has("title_id")) id = item.optInt("title_id", 0);
                else id = item.optInt("id", 0);
            }
            if (id > 0) unique.add(id);
        }
        return new ArrayList<>(unique);
    }

    private static void confirmImport(Activity activity, List<Integer> ids) {
        if (activity.isFinishing()) return;
        new AlertDialog.Builder(activity)
                .setTitle("お気に入りをインポート")
                .setMessage(ids.size() + " 件を追加します。すでに登録済みの漫画はスキップします。")
                .setNegativeButton("キャンセル", null)
                .setPositiveButton("インポート", (dialog, which) -> importIds(activity, ids))
                .show();
    }

    private static void importIds(Activity activity, List<Integer> ids) {
        IO.execute(() -> {
            int added = 0;
            int skipped = 0;
            int failed = 0;
            try {
                Set<Integer> existing = new LinkedHashSet<>();
                JSONArray current = fetchFavorites();
                for (int index = 0; index < current.length(); index++)
                    existing.add(current.getJSONObject(index).getInt("titleId"));
                for (Integer id : ids) {
                    if (existing.contains(id)) {
                        skipped++;
                        continue;
                    }
                    try {
                        invokeSuspend("E", new Class<?>[]{int.class}, new Object[]{id});
                        added++;
                    } catch (Throwable error) {
                        failed++;
                    }
                    try { Thread.sleep(80L); } catch (InterruptedException interrupted) {
                        Thread.currentThread().interrupt();
                        throw interrupted;
                    }
                }
                final int addedCount = added;
                final int skippedCount = skipped;
                final int failedCount = failed;
                toast(activity, "追加 " + addedCount + " 件、登録済み " + skippedCount +
                        " 件、失敗 " + failedCount + " 件");
            } catch (Throwable error) {
                toast(activity, "インポートに失敗しました: " + message(error));
            }
        });
    }

    private static Object invokeSuspend(String methodName, Class<?>[] parameterTypes, Object[] arguments) throws Exception {
        Class<?> apiType = Class.forName("kg.c");
        Class<?> continuationType = Class.forName("kotlin.coroutines.Continuation");
        Class<?>[] fullTypes = new Class<?>[parameterTypes.length + 1];
        System.arraycopy(parameterTypes, 0, fullTypes, 0, parameterTypes.length);
        fullTypes[parameterTypes.length] = continuationType;
        Method apiMethod = apiType.getMethod(methodName, fullTypes);
        Object api = Class.forName("kg.z1").getMethod("d").invoke(null);

        CountDownLatch resumed = new CountDownLatch(1);
        AtomicReference<Object> result = new AtomicReference<>();
        Object context = singleton("kotlin.coroutines.EmptyCoroutineContext");
        InvocationHandler handler = (proxy, method, args) -> {
            if (method.getName().equals("getContext")) return context;
            if (method.getName().equals("resumeWith")) {
                result.set(args == null || args.length == 0 ? null : args[0]);
                resumed.countDown();
                return null;
            }
            if (method.getName().equals("toString")) return "GauGauFavoritesContinuation";
            if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
            if (method.getName().equals("equals")) return proxy == (args == null ? null : args[0]);
            return null;
        };
        Object continuation = Proxy.newProxyInstance(continuationType.getClassLoader(),
                new Class<?>[]{continuationType}, handler);
        Object[] callArguments = new Object[arguments.length + 1];
        System.arraycopy(arguments, 0, callArguments, 0, arguments.length);
        callArguments[arguments.length] = continuation;
        Object immediate;
        try {
            immediate = apiMethod.invoke(api, callArguments);
        } catch (java.lang.reflect.InvocationTargetException error) {
            Throwable cause = error.getCause();
            if (cause instanceof Exception) throw (Exception) cause;
            throw new IllegalStateException(cause);
        }
        if (!isSuspended(immediate)) return immediate;
        if (!resumed.await(90, TimeUnit.SECONDS)) throw new IllegalStateException("通信がタイムアウトしました");
        Object finalResult = result.get();
        Class<?> resultKt = Class.forName("kotlin.ResultKt");
        resultKt.getMethod("throwOnFailure", Object.class).invoke(null, finalResult);
        return finalResult;
    }

    private static Object singleton(String className) throws Exception {
        Class<?> type = Class.forName(className);
        for (java.lang.reflect.Field field : type.getDeclaredFields()) {
            if (java.lang.reflect.Modifier.isStatic(field.getModifiers()) && field.getType() == type) {
                field.setAccessible(true);
                return field.get(null);
            }
        }
        throw new NoSuchFieldException(className);
    }

    private static boolean isSuspended(Object value) {
        return value != null && value.getClass().getName().contains("CoroutineSingletons") &&
                "COROUTINE_SUSPENDED".equals(String.valueOf(value));
    }

    private static String message(Throwable error) {
        Throwable cause = error;
        while (cause.getCause() != null && cause.getCause() != cause) cause = cause.getCause();
        String text = cause.getMessage();
        return text == null || text.isEmpty() ? "通信またはファイル処理のエラー" : text;
    }

    private static void toast(Activity activity, String message) {
        if (activity == null) return;
        activity.runOnUiThread(() -> {
            if (!activity.isFinishing())
                Toast.makeText(activity, message, Toast.LENGTH_LONG).show();
        });
    }
}
