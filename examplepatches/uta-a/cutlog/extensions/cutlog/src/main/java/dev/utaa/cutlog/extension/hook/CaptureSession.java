package dev.utaa.cutlog.extension.hook;

import android.net.Uri;
import android.util.Log;
import java.io.File;
import java.io.IOException;

/** 撮影した動画 1 件。完了・キャンセルを一度だけ本体へ返す。 */
public final class CaptureSession implements EditSession {
    private final CaptureHost host;
    private final Object result;
    private final File capturedFile;
    private final CaptureReplacement initialReplacement;
    private boolean finished;

    CaptureSession(CaptureHost host, Object result, File capturedFile, CaptureReplacement initialReplacement) {
        this.host = host;
        this.result = result;
        this.capturedFile = capturedFile;
        this.initialReplacement = initialReplacement;
    }

    @Override
    public Uri source() {
        return Uri.fromFile(capturedFile);
    }

    @Override
    public boolean requiresNormalization() {
        return false;
    }

    @Override
    public File exportFile() {
        return new File(capturedFile.getParentFile(), capturedFile.getName() + ".cutlog.mp4");
    }

    /** 録画ファイルを書き出した動画で置き換える。失敗した場合、録画ファイルは元のまま残る（rename 1 回で行う）。 */
    @Override
    public CaptureReplacement install(File exported) throws IOException {
        CaptureReplacement replacement = VideoFiles.readMetadata(exported);
        VideoFiles.moveOver(exported, capturedFile);
        return replacement;
    }

    @Override
    public void deliver(CaptureReplacement replacement) {
        Log.i(CaptureInterceptor.TAG, "Delivering edited capture: " + replacement);
        finish(replacement);
    }

    /** 録画（または検証用の差し替え動画）をそのまま投稿フローへ渡す。 */
    @Override
    public void deliverOriginal() {
        finish(initialReplacement);
    }

    @Override
    public void cancel() {
        if (finished) {
            return;
        }
        finished = true;
        dev.utaa.cutlog.extension.record.RecordDuration.onRecordingFinished();
        try {
            host.cutlogCancel();
        } catch (RuntimeException e) {
            Log.w(CaptureInterceptor.TAG, "Cannot cancel the capture.", e);
        }
    }

    @Override
    public String cancelMessage() {
        return "撮影した動画を破棄して撮影画面を閉じますか？";
    }

    /** 録画は本体の撮影画面ごと破棄されるため、ユーザーは撮影からやり直す。 */
    @Override
    public void abandon() {
        if (finished) {
            return;
        }
        finished = true;
        Log.w(CaptureInterceptor.TAG, "Capture host was destroyed; abandoning the edit session.");
    }

    private void finish(CaptureReplacement replacement) {
        if (finished) {
            return;
        }
        finished = true;
        CaptureInterceptor.deliver(host, result, replacement);
    }
}
