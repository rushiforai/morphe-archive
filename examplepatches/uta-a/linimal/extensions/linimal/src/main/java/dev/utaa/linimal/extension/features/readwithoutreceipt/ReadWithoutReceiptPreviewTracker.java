package dev.utaa.linimal.extension.features.readwithoutreceipt;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.Bundle;

import java.lang.ref.WeakReference;

/**
 * 表示中のスクロールプレビュー画面を覚えておき、「既読をつけずに読む」を押したときに閉じられるようにします。
 *
 * <p>プレビューのメニューへ注入した行には Activity が渡らないため、Application の lifecycle callback で
 * プレビュー画面だけを弱参照で覚えます。行を押せるのは前面のプレビューなので、作成時に加えて resume の
 * たびに対象を更新します。記録するだけで LINE の画面遷移には関与しません。
 * Activity のクラス名は AndroidManifest に載るため難読化されません。</p>
 */
final class ReadWithoutReceiptPreviewTracker {
    static final String PREVIEW_ACTIVITY_CLASS =
            "com.linecorp.line.chat.ui.impl.preview.ChatHistoryPreviewActivity";

    /** 閉じる処理の境界。local JVM test では Activity を作れないため差し替えます。 */
    interface Finisher {
        void finish(Object activity);
    }

    private static final Registry REGISTRY = new Registry();
    private static volatile boolean registered;

    private ReadWithoutReceiptPreviewTracker() {
    }

    /** bootstrap から呼ばれます。登録に失敗しても、プレビューが閉じないだけでトークは開きます。 */
    static synchronized void register(Context context) {
        if (registered || context == null) {
            return;
        }
        try {
            Context applicationContext = context.getApplicationContext();
            if (!(applicationContext instanceof Application)) {
                return;
            }
            ((Application) applicationContext).registerActivityLifecycleCallbacks(new Callbacks());
            registered = true;
        } catch (Throwable ignored) {
            // プレビューを閉じられないだけです。
        }
    }

    static void finishCurrent() {
        REGISTRY.finishCurrent(activity -> {
            Activity preview = (Activity) activity;
            if (!preview.isFinishing()) {
                preview.finish();
            }
        });
    }

    /** 前面のプレビューを 1 つだけ保持します。plain JVM で検証できるよう Android 型に依存しません。 */
    static final class Registry {
        private WeakReference<Object> current;

        synchronized void noteCreated(Object activity, String className) {
            if (activity != null && PREVIEW_ACTIVITY_CLASS.equals(className)) {
                current = new WeakReference<>(activity);
            }
        }

        /** 前面に戻ったプレビューを閉じる対象にします。作成順ではなく操作対象に合わせるためです。 */
        synchronized void noteResumed(Object activity, String className) {
            noteCreated(activity, className);
        }

        synchronized void noteDestroyed(Object activity) {
            if (activity != null && current != null && current.get() == activity) {
                current = null;
            }
        }

        synchronized Object current() {
            return current == null ? null : current.get();
        }

        /**
         * 例外は握りつぶします。閉じられなくても、呼び出し側はトークを開く処理を続けます。
         * 失敗したときは参照を残し、destroy か次のプレビューで更新されるまで閉じ直せるようにします。
         */
        void finishCurrent(Finisher finisher) {
            Object activity = current();
            if (activity == null || finisher == null) {
                return;
            }
            try {
                finisher.finish(activity);
            } catch (Throwable ignored) {
                return;
            }
            synchronized (this) {
                if (current != null && current.get() == activity) {
                    current = null;
                }
            }
        }
    }

    static Registry registryForTesting() {
        return REGISTRY;
    }

    private static final class Callbacks implements Application.ActivityLifecycleCallbacks {
        @Override
        public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
            REGISTRY.noteCreated(activity, activity.getClass().getName());
        }

        @Override
        public void onActivityStarted(Activity activity) {
        }

        @Override
        public void onActivityResumed(Activity activity) {
            REGISTRY.noteResumed(activity, activity.getClass().getName());
        }

        @Override
        public void onActivityPaused(Activity activity) {
        }

        @Override
        public void onActivityStopped(Activity activity) {
        }

        @Override
        public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
        }

        @Override
        public void onActivityDestroyed(Activity activity) {
            REGISTRY.noteDestroyed(activity);
        }
    }
}
