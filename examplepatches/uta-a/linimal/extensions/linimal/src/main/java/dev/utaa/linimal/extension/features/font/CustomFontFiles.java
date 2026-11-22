package dev.utaa.linimal.extension.features.font;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.OpenableColumns;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;

/**
 * 取り込んだフォントファイルの保存と検証。
 *
 * <p>ファイルは LINE のアプリ専用領域の {@code files/linimal_custom_font/} に 1 つだけ置きます。
 * LINE の公式フォントの保存先（{@code files/premium_font/}）とは分け、公式の「全フォント削除」で
 * 消えないようにします。選んだファイルは、大きさの上限、先頭の形式、Android のフォントとして
 * 読み込めるかを確かめてから置き換えます。途中で失敗したときは、前に取り込んだファイルを残します。</p>
 */
public final class CustomFontFiles {
    /** 日本語のフォントは 1 ファイルで 20 MB 前後になるものがあるため、余裕を見た上限にします。 */
    static final long MAX_FONT_BYTES = 64L * 1024 * 1024;
    static final String DIRECTORY = "linimal_custom_font";
    static final String FONT_FILE = "font";
    static final String NAME_FILE = "font.name";
    private static final String TEMPORARY_SUFFIX = ".tmp";
    private static final int MAX_NAME_LENGTH = 200;

    public enum ImportResult {
        OK,
        TOO_LARGE,
        NOT_A_FONT,
        READ_FAILED,
    }

    private CustomFontFiles() {
    }

    public static File fontFile(Context context) {
        return new File(directory(context), FONT_FILE);
    }

    /** 取り込み済みのフォントがあるかどうか。 */
    public static boolean hasFont(Context context) {
        File file = fontFile(context);
        return file.isFile() && file.length() > 0;
    }

    /** 取り込んだときのファイル名。分からないときは null を返します。 */
    public static String displayName(Context context) {
        File file = new File(directory(context), NAME_FILE);
        if (!file.isFile() || file.length() > MAX_NAME_LENGTH * 4L) {
            return null;
        }
        try (InputStream input = new FileInputStream(file)) {
            byte[] bytes = new byte[(int) file.length()];
            int read = 0;
            while (read < bytes.length) {
                int count = input.read(bytes, read, bytes.length - read);
                if (count < 0) {
                    break;
                }
                read += count;
            }
            String name = new String(bytes, 0, read, StandardCharsets.UTF_8).trim();
            return name.isEmpty() ? null : name;
        } catch (IOException | RuntimeException exception) {
            return null;
        }
    }

    /**
     * {@code uri} のファイルを取り込みます。UI スレッドの外で呼びます。
     *
     * <p>上限を超えた時点で読み込みを止めます。先頭が TrueType / OpenType / TrueType Collection の
     * 形式でないものと、Android のフォントとして読み込めないものは取り込みません。</p>
     */
    public static ImportResult importFont(Context context, Uri uri) {
        File directory = directory(context);
        if (!directory.isDirectory() && !directory.mkdirs()) {
            return ImportResult.READ_FAILED;
        }
        File temporary = new File(directory, FONT_FILE + TEMPORARY_SUFFIX);
        try {
            ImportResult copied = copyWithLimit(context.getContentResolver(), uri, temporary);
            if (copied != ImportResult.OK) {
                return copied;
            }
            if (!hasFontSignature(readHeader(temporary)) || !isLoadableFont(temporary)) {
                return ImportResult.NOT_A_FONT;
            }
            File target = fontFile(context);
            if (!temporary.renameTo(target)) {
                return ImportResult.READ_FAILED;
            }
            writeDisplayName(directory, queryDisplayName(context.getContentResolver(), uri));
            CustomFontGuard.reset(context);
            return ImportResult.OK;
        } finally {
            if (temporary.exists()) {
                temporary.delete();
            }
        }
    }

    /**
     * 先頭 4 バイトが TrueType（{@code 00 01 00 00} / {@code true}）、OpenType（{@code OTTO}）、
     * TrueType Collection（{@code ttcf}）のどれかかどうか。WOFF などは Android が読めないため除きます。
     */
    static boolean hasFontSignature(byte[] header) {
        if (header == null || header.length < 4) {
            return false;
        }
        if (header[0] == 0x00 && header[1] == 0x01 && header[2] == 0x00 && header[3] == 0x00) {
            return true;
        }
        String tag = new String(header, 0, 4, StandardCharsets.US_ASCII);
        return tag.equals("OTTO") || tag.equals("true") || tag.equals("ttcf");
    }

    /** 上限を超えたかどうかを、読んだバイト数で判定します。 */
    static boolean exceedsLimit(long bytes) {
        return bytes > MAX_FONT_BYTES;
    }

    /** 表示用のファイル名から、改行などの制御文字を除いて長さを抑えます。 */
    static String sanitizeDisplayName(String name) {
        if (name == null) {
            return null;
        }
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < name.length() && builder.length() < MAX_NAME_LENGTH; i++) {
            char c = name.charAt(i);
            if (!Character.isISOControl(c)) {
                builder.append(c);
            }
        }
        String sanitized = builder.toString().trim();
        return sanitized.isEmpty() ? null : sanitized;
    }

    private static File directory(Context context) {
        return new File(context.getFilesDir(), DIRECTORY);
    }

    private static ImportResult copyWithLimit(ContentResolver resolver, Uri uri, File destination) {
        try (InputStream input = resolver.openInputStream(uri);
             OutputStream output = new FileOutputStream(destination)) {
            if (input == null) {
                return ImportResult.READ_FAILED;
            }
            byte[] buffer = new byte[64 * 1024];
            long total = 0;
            int count;
            while ((count = input.read(buffer)) >= 0) {
                total += count;
                if (exceedsLimit(total)) {
                    return ImportResult.TOO_LARGE;
                }
                output.write(buffer, 0, count);
            }
            return total == 0 ? ImportResult.NOT_A_FONT : ImportResult.OK;
        } catch (IOException | RuntimeException exception) {
            return ImportResult.READ_FAILED;
        }
    }

    private static byte[] readHeader(File file) {
        try (InputStream input = new FileInputStream(file)) {
            byte[] header = new byte[4];
            int read = 0;
            while (read < header.length) {
                int count = input.read(header, read, header.length - read);
                if (count < 0) {
                    return null;
                }
                read += count;
            }
            return header;
        } catch (IOException | RuntimeException exception) {
            return null;
        }
    }

    /** provider から返したときと同じく、Android のフォントとして読み込めるかを確かめます。 */
    private static boolean isLoadableFont(File file) {
        try {
            new android.graphics.fonts.Font.Builder(file).build();
            return true;
        } catch (IOException | RuntimeException exception) {
            return false;
        }
    }

    private static String queryDisplayName(ContentResolver resolver, Uri uri) {
        try (Cursor cursor = resolver.query(uri, new String[] {OpenableColumns.DISPLAY_NAME}, null, null, null)) {
            if (cursor != null && cursor.moveToFirst() && !cursor.isNull(0)) {
                return cursor.getString(0);
            }
        } catch (RuntimeException ignored) {
            // 名前は表示のためだけに使うため、取れなくても取り込みは続けます。
        }
        return null;
    }

    private static void writeDisplayName(File directory, String name) {
        File file = new File(directory, NAME_FILE);
        String sanitized = sanitizeDisplayName(name);
        if (sanitized == null) {
            file.delete();
            return;
        }
        try (OutputStream output = new FileOutputStream(file)) {
            output.write(sanitized.getBytes(StandardCharsets.UTF_8));
        } catch (IOException | RuntimeException ignored) {
            file.delete();
        }
    }
}
