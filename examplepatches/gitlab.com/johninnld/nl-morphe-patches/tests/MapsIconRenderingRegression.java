import android.content.Context;
import android.content.pm.PackageInfo;
import android.graphics.*;
import android.graphics.drawable.*;
import java.io.*;

/** Render an actual APK's application icon without installing or launching it. */
public class MapsIconRenderingRegression {
    public static void main(String[] args) throws Exception {
        android.os.Looper.prepareMainLooper();
        Object thread = Class.forName("android.app.ActivityThread").getMethod("systemMain").invoke(null);
        Context context = (Context) thread.getClass().getMethod("getSystemContext").invoke(thread);
        PackageInfo info = context.getPackageManager().getPackageArchiveInfo(args[0], 0);
        if (info == null) throw new AssertionError("Cannot read APK");
        info.applicationInfo.sourceDir = args[0];
        info.applicationInfo.publicSourceDir = args[0];
        Drawable loaded = context.getPackageManager().getApplicationIcon(info.applicationInfo);
        if (!(loaded instanceof AdaptiveIconDrawable)) throw new AssertionError("Expected adaptive icon, got " + loaded);
        Drawable background = ((AdaptiveIconDrawable) loaded).getBackground().getConstantState().newDrawable();
        background.setBounds(0, 0, 1, 1);
        Bitmap backgroundCheck = Bitmap.createBitmap(1, 1, Bitmap.Config.ARGB_8888);
        background.draw(new Canvas(backgroundCheck));
        if (backgroundCheck.getPixel(0, 0) != 0xff171a21)
            throw new AssertionError("Use a custom dark icon: this test excludes the dark background from artwork coverage");
        backgroundCheck.recycle();
        float density = context.getResources().getDisplayMetrics().density;
        new File(args[1]).mkdirs();
        boolean passed = true;
        for (int sizeDp : new int[]{16, 24, 32, 48, 64, 72, 96}) {
            AdaptiveIconDrawable icon = (AdaptiveIconDrawable) loaded.getConstantState().newDrawable();
            int size = Math.round(sizeDp * density);
            icon.setBounds(0, 0, size, size);
            Bitmap output = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888);
            icon.draw(new Canvas(output));
            int art = 0;
            for (int y = 0; y < size; y++) for (int x = 0; x < size; x++) {
                int color = output.getPixel(x, y);
                if (Color.alpha(color) > 200 && (color & 0xffffff) != 0x171a21) art++;
            }
            double coverage = (double) art / (size * size);
            boolean visible = coverage > 0.1;
            passed &= visible;
            try (FileOutputStream stream = new FileOutputStream(new File(args[1], "icon-" + sizeDp + ".png"))) {
                output.compress(Bitmap.CompressFormat.PNG, 100, stream);
            }
            System.out.println("sizeDp=" + sizeDp + " density=" + density + " artworkPixels=" + art +
                " coverage=" + coverage + " passed=" + visible);
            output.recycle();
        }
        if (!passed) throw new AssertionError("APK artwork disappears or collapses at one or more icon sizes");
        System.out.println("PASS: compiled APK icon remains visible at 16..96dp");
    }
}
