package dev.utaa.cutlog.extension.hook;

import android.net.Uri;
import android.util.Log;
import java.io.File;
import java.io.IOException;

/**
 * 端末内から選んだ動画 1 件（F4）。公式撮影分の仕様へ揃えて書き出し、本体の録画ファイルと同じ場所・
 * 同じ名前の付け方で置いてから、撮影時と同じ CaptureContext で本体へ返す。
 */
public final class ImportSession implements EditSession {
    private final CaptureHost host;
    private final Uri picked;
    private final File target;
    private boolean finished;

    ImportSession(CaptureHost host, Uri picked, File cameraDir) {
        this.host = host;
        this.picked = picked;
        this.target = new File(cameraDir, "collection_camera_" + System.currentTimeMillis() + ".mp4");
    }

    @Override
    public Uri source() {
        return picked;
    }

    @Override
    public boolean requiresNormalization() {
        return true;
    }

    @Override
    public File exportFile() {
        return new File(target.getParentFile(), target.getName() + ".cutlog.tmp.mp4");
    }

    @Override
    public CaptureReplacement install(File exported) throws IOException {
        CaptureReplacement replacement = VideoFiles.readMetadata(exported);
        VideoFiles.moveOver(exported, target);
        return replacement;
    }

    @Override
    public void deliver(CaptureReplacement replacement) {
        if (finished) {
            return;
        }
        finished = true;
        Log.i(CaptureInterceptor.TAG, "Delivering imported video: " + replacement);
        CaptureInterceptor.deliverImported(host, Uri.fromFile(target), replacement);
    }

    @Override
    public void deliverOriginal() {
        throw new UnsupportedOperationException("Imported videos must be normalized.");
    }

    /** 撮影画面はそのまま残す。 */
    @Override
    public void cancel() {
        finish();
    }

    @Override
    public String cancelMessage() {
        return "動画の取り込みをやめますか？";
    }

    @Override
    public void abandon() {
        finish();
    }

    private void finish() {
        if (finished) {
            return;
        }
        finished = true;
        target.delete();
    }
}
