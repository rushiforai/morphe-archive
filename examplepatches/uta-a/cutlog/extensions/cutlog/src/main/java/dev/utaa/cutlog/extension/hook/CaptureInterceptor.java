package dev.utaa.cutlog.extension.hook;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.provider.MediaStore;
import android.util.Log;
import android.view.View;
import android.widget.Toast;
import dev.utaa.cutlog.extension.editor.EditorDialog;
import dev.utaa.cutlog.extension.editor.ImportButton;
import dev.utaa.cutlog.extension.editor.SettingsButton;
import dev.utaa.cutlog.extension.pref.Feature;
import dev.utaa.cutlog.extension.pref.Prefs;
import java.io.File;
import java.io.IOException;
import java.lang.ref.WeakReference;

/**
 * 録画完了時（本体の CollectionCamera が結果を返す直前）に呼ばれる入口。
 *
 * <p>編集画面を開けたときは結果を預かり、編集画面の操作が終わってから {@link CaptureHost} で本体へ返す。
 * 開けないときは何もせず、本体の処理をそのまま続けさせる。
 */
public final class CaptureInterceptor {
    public static final String TAG = "cutlog";

    /** Phase 1 の検証用。置いてある間は、すべての録画をこの動画に差し替えてから編集画面を開く。 */
    private static final String REPLACEMENT_PATH =
            "Android/data/com.newchat.setlog/files/cutlog/replacement.mp4";

    /** 動画選択の requestCode。本体の requestCode と重ならない値にする。 */
    private static final int PICK_VIDEO_REQUEST = 0x4354;
    /** 編集画面でスタンプにする画像を選ぶ requestCode。 */
    private static final int PICK_IMAGE_REQUEST = 0x4355;
    /** 画像を選んでいる間の編集画面の受け取り口。 */
    private static WeakReference<java.util.function.Consumer<Uri>> pickingImage = new WeakReference<>(null);

    private static WeakReference<Activity> currentActivity = new WeakReference<>(null);
    /** 動画を選んでいる間の撮影画面。選択画面から戻ったら、ここへ結果を返す。 */
    private static WeakReference<CaptureHost> pickingHost = new WeakReference<>(null);
    /** 動画を選び始めたときの Activity。戻ってきた Activity が違えば、撮影画面は作り直されている。 */
    private static WeakReference<Activity> pickingActivity = new WeakReference<>(null);
    private static boolean cleanedStaleFiles;
    private static Context appContext;
    private static boolean delivering;

    private CaptureInterceptor() {}

    /** MainActivity.onResume から呼ばれる。 */
    public static void onActivityResumed(Activity activity) {
        currentActivity = new WeakReference<>(activity);
        appContext = activity.getApplicationContext();
        if (!cleanedStaleFiles) {
            // 前回のプロセスが書き出し途中で終わった場合の一時ファイルを、最初の 1 回だけ消す。
            cleanedStaleFiles = true;
            VideoFiles.deleteStaleTemporaries(new File(activity.getCacheDir(), "camera"));
        }
    }

    public static Context appContextOrNull() {
        return appContext;
    }

    public static Context appContext() {
        if (appContext == null) {
            throw new IllegalStateException("cutlog has not seen an activity yet.");
        }
        return appContext;
    }

    /**
     * @return true なら cutlog が結果を預かった。本体はここで処理を止める。
     */
    public static boolean onCaptured(CaptureHost host, Object result, Uri capturedUri) {
        dev.utaa.cutlog.extension.record.RecordDuration.onRecordingFinished();
        if (delivering) {
            return false;
        }
        try {
            Activity activity = currentActivity.get();
            if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
                Log.w(TAG, "No activity for the editor; keeping the official flow.");
                return false;
            }
            if (!Prefs.isEnabled(activity, Feature.EDITOR)) {
                Log.i(TAG, "Editor is turned off; keeping the official flow.");
                return false;
            }
            if (!"file".equals(capturedUri.getScheme()) || capturedUri.getPath() == null) {
                Log.w(TAG, "Unsupported capture uri: " + capturedUri);
                return false;
            }
            File capturedFile = new File(capturedUri.getPath());
            CaptureReplacement replacement = applyTestReplacement(capturedFile);
            CaptureSession session = new CaptureSession(host, result, capturedFile, replacement);
            CaptureReplacement captured = VideoFiles.readMetadata(capturedFile);
            Log.i(TAG, "Captured: " + captured);
            new EditorDialog(activity, session, captured).show();
            return true;
        } catch (IOException e) {
            Log.w(TAG, "Cannot read the capture; keeping the official flow.", e);
            return false;
        } catch (RuntimeException e) {
            Log.w(TAG, "Cannot open the editor; keeping the official flow.", e);
            return false;
        }
    }

    private static CaptureReplacement applyTestReplacement(File captured) {
        // アプリ自身が外部の files ディレクトリを作っておく。adb push で作られたディレクトリは shell の
        // 持ち物になり、アプリから読めない（Android 16 / XIG07 で確認）。
        if (appContext != null) {
            appContext.getExternalFilesDir(null);
        }
        File source = new File(Environment.getExternalStorageDirectory(), REPLACEMENT_PATH);
        if (!source.isFile()) {
            Log.i(TAG, "No test replacement at " + source);
            return null;
        }
        try {
            CaptureReplacement replacement = VideoFiles.readMetadata(source);
            VideoFiles.copyOver(source, captured);
            Log.i(TAG, "Replaced capture: " + replacement);
            return replacement;
        } catch (IOException e) {
            Log.w(TAG, "Keeping the original capture.", e);
            return null;
        }
    }

    /** 撮影画面の View ができたときに呼ばれる。cutlog の設定を開く歯車ボタンを足す。 */
    public static void onCameraSetup(View view) {
        Feature.EDITOR.markAvailable();
        try {
            SettingsButton.attach(view);
        } catch (RuntimeException e) {
            Log.w(TAG, "Cannot add the settings button.", e);
        }
    }

    /** 撮影画面の View ができたときに呼ばれる。「ファイルから」ボタンを足す。 */
    public static void onCameraViewCreated(CaptureHost host, View view) {
        Feature.IMPORT.markAvailable();
        try {
            ImportButton.attach(view, () -> startImport(host));
        } catch (RuntimeException e) {
            Log.w(TAG, "Cannot add the import button.", e);
        }
    }

    private static void startImport(CaptureHost host) {
        Activity activity = currentActivity.get();
        if (activity == null) {
            return;
        }
        if (!Prefs.isEnabled(activity, Feature.IMPORT)) {
            return;
        }
        if (dev.utaa.cutlog.extension.record.RecordDuration.isRecording()) {
            // 録画中に別の画面を開くと、本体が録画を中断して破棄する。
            Toast.makeText(activity, "撮影が終わってから選んでください", Toast.LENGTH_SHORT).show();
            return;
        }
        Intent intent;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            intent = new Intent(MediaStore.ACTION_PICK_IMAGES).setType("video/*");
        } else {
            intent = new Intent(Intent.ACTION_GET_CONTENT).setType("video/*").addCategory(Intent.CATEGORY_OPENABLE);
        }
        pickingHost = new WeakReference<>(host);
        pickingActivity = new WeakReference<>(activity);
        try {
            activity.startActivityForResult(intent, PICK_VIDEO_REQUEST);
        } catch (ActivityNotFoundException e) {
            pickingHost = new WeakReference<>(null);
            Toast.makeText(activity, "動画を選べるアプリがありません", Toast.LENGTH_SHORT).show();
        }
    }

    /**
     * 編集画面からスタンプにする画像を選ぶ。結果は main thread で callback に渡す（選ばなければ呼ばない）。
     * 編集画面は弱参照で持つので、選んでいる間に編集画面が閉じられても残らない。呼び出し側は callback を
     * 編集画面が閉じるまで強参照で持つこと。
     */
    public static void pickImage(Activity activity, java.util.function.Consumer<Uri> callback) {
        Intent intent;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            intent = new Intent(MediaStore.ACTION_PICK_IMAGES).setType("image/*");
        } else {
            intent = new Intent(Intent.ACTION_GET_CONTENT).setType("image/*").addCategory(Intent.CATEGORY_OPENABLE);
        }
        pickingImage = new WeakReference<>(callback);
        try {
            activity.startActivityForResult(intent, PICK_IMAGE_REQUEST);
        } catch (ActivityNotFoundException e) {
            pickingImage = new WeakReference<>(null);
            Toast.makeText(activity, "画像を選べるアプリがありません", Toast.LENGTH_SHORT).show();
        }
    }

    /**
     * MainActivity.onActivityResult から呼ばれる。
     *
     * @return true なら cutlog の動画選択の結果だった。本体には渡さない。
     */
    public static boolean onActivityResult(Activity activity, int requestCode, int resultCode, Intent data) {
        if (requestCode == PICK_IMAGE_REQUEST) {
            java.util.function.Consumer<Uri> callback = pickingImage.get();
            pickingImage = new WeakReference<>(null);
            Uri picked = data != null ? data.getData() : null;
            if (resultCode == Activity.RESULT_OK && picked != null && callback != null) {
                callback.accept(picked);
            }
            return true;
        }
        if (requestCode != PICK_VIDEO_REQUEST) {
            return false;
        }
        CaptureHost host = pickingHost.get();
        Activity startedFrom = pickingActivity.get();
        pickingHost = new WeakReference<>(null);
        pickingActivity = new WeakReference<>(null);
        Uri picked = data != null ? data.getData() : null;
        if (resultCode != Activity.RESULT_OK || picked == null) {
            return true;
        }
        if (host == null || startedFrom != activity) {
            // 選んでいる間に撮影画面が作り直された（またはプロセスが作り直された）。古い撮影画面には返せない。
            Toast.makeText(activity, "撮影画面を開き直してから選んでください", Toast.LENGTH_SHORT).show();
            return true;
        }
        try {
            CaptureReplacement source = VideoFiles.readMetadata(activity, picked);
            File cameraDir = new File(activity.getCacheDir(), "camera");
            cameraDir.mkdirs();
            new EditorDialog(activity, new ImportSession(host, picked, cameraDir), source).show();
        } catch (IOException | RuntimeException e) {
            Log.w(TAG, "Cannot open the picked video.", e);
            Toast.makeText(activity, "この動画は読み込めませんでした", Toast.LENGTH_SHORT).show();
        }
        return true;
    }

    /** 本体の G0 を呼び直す間だけ、自分自身のフックを素通りさせる。 */
    static void deliver(CaptureHost host, Object result, CaptureReplacement replacement) {
        delivering = true;
        try {
            host.cutlogDeliver(result, replacement);
        } catch (RuntimeException e) {
            // 録画画面が既に破棄されていると、本体の FragmentManager 取得で例外になる。
            Log.w(TAG, "Cannot deliver the capture result.", e);
        } finally {
            delivering = false;
        }
    }

    static void deliverImported(CaptureHost host, Uri video, CaptureReplacement replacement) {
        delivering = true;
        try {
            host.cutlogDeliverImported(video, replacement);
        } catch (RuntimeException e) {
            Log.w(TAG, "Cannot deliver the imported video.", e);
        } finally {
            delivering = false;
        }
    }
}
