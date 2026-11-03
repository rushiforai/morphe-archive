package dev.utaa.linimal.extension.features.readreceipts;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import dev.utaa.linimal.extension.config.LinimalConfig;
import dev.utaa.linimal.extension.config.ReadReceiptMode;

/** 通常チャットの自動既読と、非同期 supplier を通る手動送信を区別します。 */
public final class ReadReceiptHooks {
    private static final ThreadLocal<String> MANUAL_INVOCATION = new ThreadLocal<>();
    private static final ThreadLocal<String> PREPARED_SUPPLIER = new ThreadLocal<>();
    private static final List<ManualSupplier> MANUAL_SUPPLIERS = new ArrayList<>();

    private static final class ManualSupplier {
        private final WeakReference<Object> supplier;
        private final String chatId;

        ManualSupplier(Object supplier, String chatId) {
            this.supplier = new WeakReference<>(supplier);
            this.chatId = chatId;
        }
    }

    private ReadReceiptHooks() {
    }

    /** 手動操作の caller thread で、次に作られる supplier の出所を記録します。 */
    public static void beginManualInvocation(String chatId) {
        try {
            if (chatId == null) {
                MANUAL_INVOCATION.remove();
            } else {
                MANUAL_INVOCATION.set(chatId);
            }
        } catch (Throwable ignored) {
            // hook 自身の異常で元の手動操作を失敗させないよう、caller の印だけを破棄します。
            MANUAL_INVOCATION.remove();
        }
    }

    /**
     * supplier 構築直後に呼び、手動操作の出所を supplier identity へ移します。
     * caller thread の印はこの呼び出しで必ず消費します。
     */
    public static void registerSupplierFromCurrentInvocation(Object supplier, String chatId) {
        try {
            String manualChatId = MANUAL_INVOCATION.get();
            // registration の成否にかかわらず、caller thread の印は一度だけ消費します。
            MANUAL_INVOCATION.remove();
            if (supplier == null || chatId == null || !chatId.equals(manualChatId)) {
                return;
            }
            synchronized (MANUAL_SUPPLIERS) {
                removeClearedOrMatchingSuppliers(supplier);
                MANUAL_SUPPLIERS.add(new ManualSupplier(supplier, chatId));
            }
        } catch (Throwable ignored) {
            // supplier registry の異常を LINE の supplier 構築へ伝搬させません。
            MANUAL_INVOCATION.remove();
        }
    }

    /** supplier 構築が完了しなかった場合も、caller thread に印を残しません。 */
    public static void clearManualInvocation() {
        MANUAL_INVOCATION.remove();
    }

    /** worker thread 上で supplier identity を一回限りの許可へ変換します。 */
    public static void prepareSupplier(Object supplier, String chatId) {
        try {
            PREPARED_SUPPLIER.remove();
            if (supplier == null || chatId == null) {
                return;
            }

            String registeredChatId = null;
            synchronized (MANUAL_SUPPLIERS) {
                Iterator<ManualSupplier> iterator = MANUAL_SUPPLIERS.iterator();
                while (iterator.hasNext()) {
                    ManualSupplier registered = iterator.next();
                    Object candidate = registered.supplier.get();
                    if (candidate == null) {
                        iterator.remove();
                    } else if (candidate == supplier) {
                        registeredChatId = registered.chatId;
                        iterator.remove();
                        break;
                    }
                }
            }
            if (chatId.equals(registeredChatId)) {
                PREPARED_SUPPLIER.set(chatId);
            }
        } catch (Throwable ignored) {
            // worker hook の異常では one-shot を残さず、自動経路を誤って許可しません。
            PREPARED_SUPPLIER.remove();
        }
    }

    /** read point が無く sender を呼ばなかった場合も、worker thread に許可を残しません。 */
    public static void clearPreparedSupplier() {
        PREPARED_SUPPLIER.remove();
    }

    /** 既読なしセッションでの送信操作だけ、直後の既読反映を一回許可します。worker 終了時に必ず破棄します。 */
    public static void prepareSentMessageRead(String chatId) {
        if (chatId == null) {
            PREPARED_SUPPLIER.remove();
        } else {
            PREPARED_SUPPLIER.set(chatId);
        }
    }

    /**
     * 「すべて既読」が同じ thread で送信メソッドを呼ぶ直前に、対象トークだけを一回許可します。
     * 呼び出し直後に {@link #clearPreparedSupplier()} で必ず破棄します。
     */
    public static void prepareExplicitRead(String chatId) {
        try {
            if (chatId == null) {
                PREPARED_SUPPLIER.remove();
            } else {
                PREPARED_SUPPLIER.set(chatId);
            }
        } catch (Throwable ignored) {
            // hook の異常では許可を残さず、自動経路を誤って許可しません。
            PREPARED_SUPPLIER.remove();
        }
    }

    private static void removeClearedOrMatchingSuppliers(Object supplier) {
        Iterator<ManualSupplier> iterator = MANUAL_SUPPLIERS.iterator();
        while (iterator.hasNext()) {
            Object candidate = iterator.next().supplier.get();
            if (candidate == null || candidate == supplier) {
                iterator.remove();
            }
        }
    }

    /** queue 作成前の hook。true の場合だけ自動既読送信を終了します。 */
    public static boolean shouldSuppressAutomatic(String chatId) {
        try {
            return shouldSuppress(LinimalConfig.get().getReadReceiptMode(), chatId);
        } catch (Throwable ignored) {
            PREPARED_SUPPLIER.remove();
            return false;
        }
    }

    static boolean shouldSuppress(ReadReceiptMode mode, String chatId) {
        String allowedChatId = PREPARED_SUPPLIER.get();
        PREPARED_SUPPLIER.remove();
        if (mode != ReadReceiptMode.MANUAL) {
            return false;
        }
        return chatId == null || !chatId.equals(allowedChatId);
    }
}
