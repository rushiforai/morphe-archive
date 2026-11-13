package dev.utaa.cutlog.extension.editor;

import android.content.Context;
import android.graphics.Typeface;
import android.util.Log;
import dev.utaa.cutlog.extension.hook.CaptureInterceptor;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/**
 * 文字のフォント。端末のフォントと、パッチが {@code res/raw/cutlog_font_*.ttf} として追加した
 * Google Fonts の OFL 書体（ライセンス文は {@code res/raw/cutlog_fonts_license.txt}）。
 *
 * <p>raw の resource は圧縮されていることがあり {@code Typeface} へ直接渡せないため、初回だけ
 * アプリの領域へ書き出してから読む。読めなければ端末の太字ゴシックで代用する。
 */
public enum TextFont {
    GOTHIC("ゴシック", null),
    SERIF("明朝", null),
    ROUNDED("丸ゴシック", "rounded"),
    HEAVY("極太", "heavy"),
    HAND("手書き", "hand"),
    DOT("ドット", "dot");

    public final String label;
    private final String bundled;
    private Typeface typeface;

    TextFont(String label, String bundled) {
        this.label = label;
        this.bundled = bundled;
    }

    /** 書き出し中の GL スレッドからも呼ばれる。 */
    public synchronized Typeface typeface() {
        if (typeface == null) {
            typeface = load();
        }
        return typeface;
    }

    private Typeface load() {
        if (this == GOTHIC) {
            return Typeface.DEFAULT_BOLD;
        }
        if (this == SERIF) {
            return Typeface.create(Typeface.SERIF, Typeface.BOLD);
        }
        Context context = CaptureInterceptor.appContext();
        try {
            return Typeface.createFromFile(extract(context));
        } catch (IOException | RuntimeException e) {
            Log.w(CaptureInterceptor.TAG, "Cannot load font " + bundled + ".", e);
            return Typeface.DEFAULT_BOLD;
        }
    }

    @SuppressWarnings("DiscouragedApi")
    private File extract(Context context) throws IOException {
        int id = context.getResources().getIdentifier("cutlog_font_" + bundled, "raw", context.getPackageName());
        if (id == 0) {
            throw new IOException("Missing font resource: " + bundled);
        }
        File dir = new File(context.getNoBackupFilesDir(), "cutlog-fonts");
        if (!dir.isDirectory() && !dir.mkdirs()) {
            throw new IOException("Cannot create " + dir);
        }
        // APK を更新したらフォントも入れ替わりうるため、resource ID とサイズで書き出し直すかを決める。
        File file = new File(dir, bundled + "-" + Integer.toHexString(id) + ".ttf");
        try (InputStream in = context.getResources().openRawResource(id)) {
            int expected = in.available();
            if (file.length() == expected && expected > 0) {
                return file;
            }
            File temp = new File(dir, file.getName() + ".tmp");
            try (OutputStream out = new FileOutputStream(temp)) {
                byte[] buffer = new byte[64 * 1024];
                int read;
                while ((read = in.read(buffer)) > 0) {
                    out.write(buffer, 0, read);
                }
            }
            if (!temp.renameTo(file)) {
                temp.delete();
                throw new IOException("Cannot write " + file);
            }
        }
        return file;
    }

    /** 編集画面を開いたときに裏で読んでおき、最初に選んだときの待ちをなくす。 */
    public static void preload() {
        new Thread(() -> {
            for (TextFont font : values()) {
                font.typeface();
            }
        }, "cutlog-fonts").start();
    }
}
