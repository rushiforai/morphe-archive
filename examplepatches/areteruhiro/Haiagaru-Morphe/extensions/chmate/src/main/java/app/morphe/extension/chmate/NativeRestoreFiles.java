package app.morphe.extension.chmate;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.UUID;

/** Database-sized transaction; never buffers a ZIP or database in memory. */
public final class NativeRestoreFiles {
    private NativeRestoreFiles() { }

    public interface Validator { void validate(File file) throws IOException; }

    public static long size(File file) throws IOException {
        if (Thread.currentThread().isInterrupted()) throw new IOException("復元が中断されました");
        if (!file.exists()) throw new IOException("復元元のファイルが存在しません: " + file.getName());
        if (!file.isDirectory()) return file.length();
        File[] children = file.listFiles();
        if (children == null) throw new IOException("復元元のフォルダを読み込めません");
        long total = 0;
        for (File child : children) {
            if (!child.getCanonicalPath().startsWith(file.getCanonicalPath() + File.separator))
                throw new IOException("復元元フォルダ外へのリンクがあります");
            long length = size(child);
            if (length > Long.MAX_VALUE - total) throw new IOException("復元サイズが大きすぎます");
            total += length;
        }
        return total;
    }

    public static void install(File source, File target, Validator validator) throws IOException {
        if (!source.isFile() || source.length() == 0
                || source.getCanonicalFile().equals(target.getCanonicalFile()))
            throw new IOException("復元元データベースが存在しないか不正です");
        if (target.exists() && !target.isFile()) throw new IOException("復元先が通常のファイルではありません");
        File parent = target.getParentFile();
        if (parent == null || (!parent.isDirectory() && !parent.mkdirs()))
            throw new IOException("データベース保存先を作成できません");
        // A live/journaled database must not be replaced as a standalone file.
        for (String suffix : new String[]{"-wal", "-shm", "-journal"}) {
            if (new File(source.getPath() + suffix).length() > 0)
                throw new IOException("復元元データベースの補助ファイルが残っています: " + suffix);
            if (new File(target.getPath() + suffix).length() > 0)
                throw new IOException("復元先データベースの補助ファイルが残っています: " + suffix);
        }
        File staged = File.createTempFile("haiagaru-restore-", ".sqlite", parent);
        File previous = new File(parent, target.getName() + ".before-restore-" + UUID.randomUUID());
        boolean movedPrevious = false;
        try {
            MessageDigest copied = digest();
            long count = 0;
            try (FileInputStream input = new FileInputStream(source);
                 FileOutputStream output = new FileOutputStream(staged)) {
                byte[] buffer = new byte[65536];
                int size;
                while ((size = input.read(buffer)) != -1) {
                    if (Thread.currentThread().isInterrupted()) throw new IOException("復元が中断されました");
                    output.write(buffer, 0, size);
                    copied.update(buffer, 0, size);
                    count += size;
                }
                output.getFD().sync();
            }
            MessageDigest checked = digest();
            try (FileInputStream input = new FileInputStream(staged)) {
                byte[] buffer = new byte[65536];
                int size;
                while ((size = input.read(buffer)) != -1) checked.update(buffer, 0, size);
            }
            if (count != source.length() || count != staged.length()
                    || !Arrays.equals(copied.digest(), checked.digest()))
                throw new IOException("データベースのコピー検証に失敗しました");
            validator.validate(staged);
            if (Thread.currentThread().isInterrupted()) throw new IOException("復元が中断されました");
            if (target.exists()) {
                if (!target.renameTo(previous)) throw new IOException("元のデータベースを退避できません");
                movedPrevious = true;
            }
            if (!staged.renameTo(target)) {
                if (movedPrevious && !previous.renameTo(target))
                    throw new IOException("DBの切替と復旧に失敗しました。退避先: " + previous);
                throw new IOException("データベースを切り替えられません");
            }
            // Keep the previous database for recovery, even after success.
        } finally {
            // Only our own uninstalled staging file; never source or previous.
            if (staged.exists()) staged.delete();
        }
    }

    private static MessageDigest digest() {
        try { return MessageDigest.getInstance("SHA-256"); }
        catch (NoSuchAlgorithmException impossible) { throw new AssertionError(impossible); }
    }
}
