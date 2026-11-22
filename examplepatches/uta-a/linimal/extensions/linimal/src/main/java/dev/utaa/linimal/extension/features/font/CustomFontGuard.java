package dev.utaa.linimal.extension.features.font;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 * 取り込んだフォントで LINE が起動直後に落ち続けるのを防ぎます。
 *
 * <p>LINE の設定画面は LINE の中にあるため、起動のたびに落ちると設定を OFF に戻せません。
 * 取り込んだフォントを使って起動するたびに回数を数えてディスクへ同期し、起動から
 * {@link #STABLE_DELAY_MS} 経っても動いていれば 0 に戻します。0 に戻らないまま
 * {@link #MAX_UNSTABLE_LAUNCHES} 回続いたら、取り込んだフォントを使うのを止めます。
 * ファイルを選び直すと数え直します。</p>
 *
 * <p>回数は Linimal の設定ではなく、フォントと同じフォルダの小さなファイルに置きます。
 * 設定の保存は {@code LinimalConfigStore} だけが扱う決まりのためです。</p>
 */
final class CustomFontGuard {
    static final int MAX_UNSTABLE_LAUNCHES = 2;
    static final long STABLE_DELAY_MS = 10_000L;
    static final String COUNTER_FILE = "unstable_launches";

    private CustomFontGuard() {
    }

    /** 落ち続けたため、取り込んだフォントを使うのを止めているかどうか。 */
    static boolean isBlocked(Context context) {
        return isBlocked(read(counterFile(context)));
    }

    static boolean isBlocked(int unstableLaunches) {
        return unstableLaunches >= MAX_UNSTABLE_LAUNCHES;
    }

    /**
     * 取り込んだフォントを使って起動することを記録します。止めている状態か、記録できなかったときは
     * false を返します。プロセスが落ちても記録が残るよう、書いたあとに同期します。
     */
    static boolean beginLaunch(Context context) {
        File file = counterFile(context);
        int unstableLaunches = read(file);
        if (isBlocked(unstableLaunches) || !write(file, unstableLaunches + 1)) {
            return false;
        }
        new Handler(Looper.getMainLooper()).postDelayed(() -> write(file, 0), STABLE_DELAY_MS);
        return true;
    }

    /** ファイルを選び直したときに数え直します。 */
    static void reset(Context context) {
        write(counterFile(context), 0);
    }

    /** 保存した回数を読みます。ファイルがない、壊れているときは 0 とします。 */
    static int parse(String text) {
        if (text == null) {
            return 0;
        }
        try {
            int value = Integer.parseInt(text.trim());
            return Math.max(0, value);
        } catch (NumberFormatException exception) {
            return 0;
        }
    }

    private static File counterFile(Context context) {
        return new File(new File(context.getFilesDir(), CustomFontFiles.DIRECTORY), COUNTER_FILE);
    }

    private static int read(File file) {
        if (!file.isFile() || file.length() > 16) {
            return 0;
        }
        try (InputStream input = new FileInputStream(file)) {
            byte[] bytes = new byte[(int) file.length()];
            int read = input.read(bytes);
            return parse(read <= 0 ? null : new String(bytes, 0, read, java.nio.charset.StandardCharsets.US_ASCII));
        } catch (IOException | RuntimeException exception) {
            return 0;
        }
    }

    private static boolean write(File file, int value) {
        File directory = file.getParentFile();
        if (directory != null && !directory.isDirectory() && !directory.mkdirs()) {
            return false;
        }
        try (FileOutputStream output = new FileOutputStream(file)) {
            output.write(Integer.toString(value).getBytes(java.nio.charset.StandardCharsets.US_ASCII));
            output.getFD().sync();
            return true;
        } catch (IOException | RuntimeException exception) {
            return false;
        }
    }
}
