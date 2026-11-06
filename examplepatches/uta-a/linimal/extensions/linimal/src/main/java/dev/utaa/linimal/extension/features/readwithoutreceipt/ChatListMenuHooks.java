package dev.utaa.linimal.extension.features.readwithoutreceipt;

import android.content.Context;

import dev.utaa.linimal.extension.config.LinimalConfig;

/**
 * トーク一覧の長押しメニューへ追加する「既読をつけずに読む」行の判定とラベルを提供します。
 *
 * <p>LINE 26.11.0 のトーク一覧の長押しメニューは Jetpack Compose 製のダイアログです。行そのものは
 * bytecode patch が {@link ReadWithoutReceiptMenuRow} へ注入した Compose の描画コードが 1 つ描き、
 * このクラスはそこから呼ばれる 2 つの判断だけを担います。</p>
 *
 * <ol>
 *   <li>{@link #shouldShowRow(String)}：その行を描画するかどうか。</li>
 *   <li>{@link #menuLabel()}：行に表示するラベル文字列。</li>
 * </ol>
 *
 * <p>設定 OFF・対象トーク不明・初期化前・例外時はすべて fail-open です。行は描画されず、
 * LINE 本来のメニューだけが表示されます。</p>
 */
public final class ChatListMenuHooks {
    static final String LABEL_RESOURCE_NAME = "linimal_read_without_receipt_menu_label";

    /**
     * ラベル resource を解決できないときに使う既定値です。
     * {@code ReadWithoutReceiptMenuLabelResource.VALUE} と同じ文字列を保ちます。
     */
    static final String DEFAULT_MENU_LABEL = "既読をつけずに読む";

    /** Resources.getIdentifier など、テストでは実行できない解決処理を差し替えるための境界。 */
    interface LabelResolver {
        String resolve() throws Throwable;
    }

    private static volatile Context applicationContext;

    private ChatListMenuHooks() {
    }

    /** internal core の bootstrap から呼ばれます。ラベル resource の解決に使う Context を覚えます。 */
    public static void initialize(Context context) {
        if (context != null) {
            applicationContext = context.getApplicationContext();
            // スクロールプレビューの行から、トークを開く前にプレビュー画面を閉じるために使います。
            ReadWithoutReceiptPreviewTracker.register(context);
        }
    }

    /**
     * 注入点。patch が注入した Compose の行から呼ばれ、その行を描画するかどうかを返します。
     * 設定 OFF・{@code chatId} が null または空・初期化前・例外時はいずれも false です。
     */
    public static boolean shouldShowRow(String chatId) {
        try {
            return shouldShowRowGivenEnabled(chatId, LinimalConfig.get().isReadWithoutReceiptEnabled());
        } catch (Throwable ignored) {
            return false;
        }
    }

    /**
     * 判定の核心部分。{@code enabled} は呼び出し側（実体では config の値）が渡し、ここでは
     * LinimalConfig を読みません。local JVM test から設定値を直接制御できるようにする境界です。
     */
    static boolean shouldShowRowGivenEnabled(String chatId, boolean enabled) {
        if (!enabled) {
            return false;
        }
        return chatId != null && chatId.length() != 0;
    }

    /**
     * 注入点。行に表示するラベル文字列を返します。
     *
     * <p>patch が {@link ReadWithoutReceiptMenuLabel} へ注入する Compose のラムダから呼ばれ、
     * 戻り値はそのまま LINE の Text 描画へ渡ります。null を返すと描画側が落ちるため、
     * このメソッドは <strong>決して null を返しません</strong>。resource を解決できない場合は
     * {@link #DEFAULT_MENU_LABEL} を返します。</p>
     */
    public static String menuLabel() {
        final Context context = applicationContext;
        return menuLabelWith(new LabelResolver() {
            @Override
            public String resolve() {
                if (context == null) {
                    return null;
                }
                int resourceId = context.getResources().getIdentifier(
                        LABEL_RESOURCE_NAME, "string", context.getPackageName());
                if (resourceId == 0) {
                    return null;
                }
                return context.getString(resourceId);
            }
        });
    }

    /** {@code resolver} が null・例外・空文字を返した場合はすべて {@link #DEFAULT_MENU_LABEL} へ倒します。 */
    static String menuLabelWith(LabelResolver resolver) {
        if (resolver == null) {
            return DEFAULT_MENU_LABEL;
        }
        try {
            String label = resolver.resolve();
            if (label == null || label.length() == 0) {
                return DEFAULT_MENU_LABEL;
            }
            return label;
        } catch (Throwable ignored) {
            return DEFAULT_MENU_LABEL;
        }
    }

    /** {@link ReadWithoutReceiptAction} だけが読む、トークを開くための application context。 */
    static Context applicationContext() {
        return applicationContext;
    }

    /** テストでだけ状態を初期化直後へ戻します。 */
    static void resetForTesting() {
        applicationContext = null;
    }
}
