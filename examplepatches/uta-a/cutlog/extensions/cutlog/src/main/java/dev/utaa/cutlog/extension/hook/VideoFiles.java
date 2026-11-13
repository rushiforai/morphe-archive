package dev.utaa.cutlog.extension.hook;

import android.content.Context;
import android.media.MediaMetadataRetriever;
import android.net.Uri;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/** 録画ファイルの読み取りと置き換え。 */
public final class VideoFiles {
    private VideoFiles() {}

    /** 書き出し・録画した mp4 のメタデータ。表示上の向きの幅・高さを返す。 */
    public static CaptureReplacement readMetadata(File file) throws IOException {
        MediaMetadataRetriever retriever = new MediaMetadataRetriever();
        try {
            retriever.setDataSource(file.getPath());
            if (!"video/mp4".equals(retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_MIMETYPE))) {
                throw new IOException("Not an mp4 file: " + file);
            }
            return read(retriever, file.toString());
        } catch (RuntimeException e) {
            throw new IOException("Cannot read video metadata: " + file, e);
        } finally {
            retriever.release();
        }
    }

    /** 端末内から選んだ動画のメタデータ。コンテナは問わない。 */
    public static CaptureReplacement readMetadata(Context context, Uri uri) throws IOException {
        MediaMetadataRetriever retriever = new MediaMetadataRetriever();
        try {
            retriever.setDataSource(context, uri);
            if (!"yes".equals(retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_HAS_VIDEO))) {
                throw new IOException("No video track: " + uri);
            }
            return read(retriever, uri.toString());
        } catch (RuntimeException e) {
            throw new IOException("Cannot read video metadata: " + uri, e);
        } finally {
            retriever.release();
        }
    }

    private static CaptureReplacement read(MediaMetadataRetriever retriever, String name) throws IOException {
        long durationMs = Long.parseLong(
                retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION));
        int width = Integer.parseInt(
                retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_VIDEO_WIDTH));
        int height = Integer.parseInt(
                retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_VIDEO_HEIGHT));
        String rotation = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_VIDEO_ROTATION);
        int[] size = displaySize(width, height, rotation == null ? 0 : Integer.parseInt(rotation));
        width = size[0];
        height = size[1];
        if (durationMs <= 0 || width <= 0 || height <= 0) {
            throw new IOException("Invalid video metadata: " + name);
        }
        boolean hasAudio = "yes".equals(
                retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_HAS_AUDIO));
        return new CaptureReplacement(durationMs, width, height, hasAudio);
    }

    /** cutlog が録画ファイルの隣に作る一時ファイルか。 */
    static boolean isTemporary(String name) {
        return name.endsWith(".cutlog.mp4") || name.endsWith(".cutlog.tmp.mp4") || name.endsWith(".cutlog.tmp");
    }

    /** dir にある cutlog の一時ファイルを消す。書き出し中でないときにだけ呼ぶ。 */
    static void deleteStaleTemporaries(File dir) {
        File[] files = dir.listFiles();
        if (files == null) {
            return;
        }
        for (File file : files) {
            if (isTemporary(file.getName())) {
                file.delete();
            }
        }
    }

    /** 回転メタデータを反映した表示上の {幅, 高さ}。本体の ac0 と同じく 90 / 270 度で入れ替える。 */
    static int[] displaySize(int width, int height, int rotationDegrees) {
        int rotation = ((rotationDegrees % 360) + 360) % 360;
        return rotation == 90 || rotation == 270 ? new int[] {height, width} : new int[] {width, height};
    }

    /** 途中で失敗しても target を壊さないよう、同じディレクトリの一時ファイルへ全量を書いてから置き換える。 */
    public static void copyOver(File source, File target) throws IOException {
        File temp = new File(target.getPath() + ".cutlog.tmp");
        try {
            try (InputStream in = new FileInputStream(source);
                    OutputStream out = new FileOutputStream(temp)) {
                byte[] buffer = new byte[64 * 1024];
                int read;
                while ((read = in.read(buffer)) != -1) {
                    out.write(buffer, 0, read);
                }
            }
            moveOver(temp, target);
        } finally {
            temp.delete();
        }
    }

    /** source を target の位置へ移す。同じファイルシステム上での rename なので途中状態は残らない。 */
    public static void moveOver(File source, File target) throws IOException {
        if (!source.renameTo(target)) {
            throw new IOException("Failed to replace " + target);
        }
    }
}
