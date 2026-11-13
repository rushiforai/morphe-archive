package dev.utaa.cutlog.extension.hook;

import android.net.Uri;
import java.io.File;
import java.io.IOException;

/**
 * 編集画面が扱う 1 件分の入力と、その結果の返し先。
 *
 * <p>撮影した動画（{@link CaptureSession}）と、端末内から選んだ動画（{@link ImportSession}）の 2 種類がある。
 * 完了・キャンセル・打ち切りのいずれかを一度だけ行う。
 */
public interface EditSession {
    /** 編集画面とプレビューに使う入力。 */
    Uri source();

    /**
     * true なら、入力を公式撮影分の仕様（解像度・長さ・音声形式）へ揃えて必ず書き出す。
     * false なら入力が既に公式撮影分なので、編集しない場合はそのまま返せる。
     */
    boolean requiresNormalization();

    /** 書き出しの一時ファイル。{@link #install} で最終的な場所へ移す。 */
    File exportFile();

    /** 書き出した動画を最終的な場所へ置く。失敗した場合は何も変えない。 */
    CaptureReplacement install(File exported) throws IOException;

    /** {@link #install} 済みの動画を本体の投稿フローへ渡す。 */
    void deliver(CaptureReplacement replacement);

    /** 編集せずに入力のまま渡す。{@link #requiresNormalization} が true の場合は使えない。 */
    void deliverOriginal();

    /** ユーザーがやめた。 */
    void cancel();

    /** キャンセルの確認文。 */
    String cancelMessage();

    /** 本体の画面が破棄され、返す先が無くなった。 */
    void abandon();
}
