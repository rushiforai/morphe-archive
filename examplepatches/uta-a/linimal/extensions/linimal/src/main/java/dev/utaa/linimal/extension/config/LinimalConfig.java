package dev.utaa.linimal.extension.config;

import dev.utaa.linimal.extension.features.readwithoutreceipt.ReadWithoutReceiptHooks;
import dev.utaa.linimal.extension.status.PatchStatusReadResult;
import dev.utaa.linimal.extension.status.PatchStatusRepository;

/**
 * Linimal hook 用の型付き設定の入口。
 *
 * <p>各 boolean は、対応する Linimal の動作が有効かどうかを示します。このクラスが初期化されて
 * いない場合、storage を読み取れない場合、または保存済みデータが無効な場合、すべての hook は
 * LINE の元の動作にフォールバックします。</p>
 *
 * <p>読み取りは build-time の patch status でも裏取りします。必須 patch がすべて適用されて
 * いない機能は、保存値が有効であっても LINE の元の動作を返します。書き込みは patch status に
 * よらずそのまま保存するため、patch が揃ったビルドへ入れ替えると以前の設定が復活します。</p>
 */
public final class LinimalConfig {
    private static volatile LinimalConfig shared = unavailable();
    /** このプロセスで初期化を試みたかどうか。失敗して fail-open になった場合も true です。 */
    private static volatile boolean initializationAttempted;

    private final LinimalConfigStore store;
    /** patch status に基づく機能ごとの利用可否。読み取れない場合はすべて利用不可です。 */
    private final FeatureAvailability availability;
    /** 設定画面が patch status を読み直さずに済むよう、初期化時の読み取り結果を保持します。 */
    private final PatchStatusReadResult patchStatusResult;
    private volatile ConfigSnapshot snapshot;
    /**
     * 再起動が必要な機能について、このプロセスで hook が最初に返した値。設定画面が config を作り直しても、
     * 保存の失敗や patch status の読み直しが起きても、表示中の画面の構造を途中で変えないよう、次の起動まで使い続けます。
     */
    private static volatile java.util.Map<LinimalFeature, Boolean> processValues =
            new java.util.concurrent.ConcurrentHashMap<>();
    private volatile LinimalConfigHealth health;

    private LinimalConfig(
            LinimalConfigStore store,
            FeatureAvailability availability,
            PatchStatusReadResult patchStatusResult) {
        this.store = store;
        this.availability = availability;
        this.patchStatusResult = patchStatusResult;
        this.snapshot = ConfigSnapshot.originalBehavior();
        this.health = LinimalConfigHealth.ERROR;
    }

    /** internal bootstrap boundary からプロセスローカルな config instance を初期化します。 */
    static synchronized void initialize(android.content.Context context) {
        initializationAttempted = true;
        try {
            // patch status は起動時に一度だけ読み、以降は同じ結果を使い続けます。
            PatchStatusReadResult patchStatusResult = readPatchStatus(context);
            LinimalConfig config = new LinimalConfig(
                    LinimalConfigStore.open(context),
                    PatchStatusAvailability.of(patchStatusResult),
                    patchStatusResult);
            config.reload();
            shared = config;
        } catch (RuntimeException exception) {
            shared = unavailable();
            ReadWithoutReceiptHooks.clearSuppression();
        }
    }

    /** asset を読めない場合も LINE の起動を止めず、利用不可として扱うため null を返します。 */
    private static PatchStatusReadResult readPatchStatus(android.content.Context context) {
        try {
            return new PatchStatusRepository(context).read();
        } catch (RuntimeException exception) {
            return null;
        }
    }

    /**
     * まだ初期化を試みていない場合だけ初期化します。LINE の Application 初期化より前に動く hook
     * （ContentProvider から始まる Firebase など）が、設定を読む前に呼びます。
     */
    static synchronized void initializeIfNeeded(android.content.Context context) {
        if (!initializationAttempted) {
            initialize(context);
        }
    }

    /** このプロセスで初期化を試みたかどうかを返します。 */
    public static boolean isInitializationAttempted() {
        return initializationAttempted;
    }

    /** プロセスローカルな設定を返します。初期化前は fail-open です。 */
    public static LinimalConfig get() {
        return shared;
    }

    /** 保存済みの値を再読み込みします。読み込みに失敗すると元の動作を復元します。 */
    synchronized void reload() {
        if (store == null) {
            failOpen();
            return;
        }
        try {
            snapshot = store.readSnapshot();
            health = LinimalConfigHealth.OK;
            // OFF や適用不可になった入口のセッションは、再度 ON にしても復活させません。
            ReadWithoutReceiptHooks.clearDisabledSuppression(
                    isReadWithoutReceiptEnabled(), isNotificationReadWithoutReceiptEnabled());
        } catch (RuntimeException exception) {
            failOpen();
        }
    }

    /** 検証済みの保存設定が hook から利用可能かどうかを返します。 */
    public LinimalConfigHealth getRuntimeHealth() {
        return health;
    }

    /**
     * 初期化時に読み取った patch status を返します。設定画面が asset を二重に読まないための共有です。
     * 初期化前や読み取りに失敗した場合は null を返します。
     */
    public PatchStatusReadResult getPatchStatusResult() {
        return patchStatusResult;
    }

    public boolean isSmartChannelAdsSuppressionEnabled() {
        return isEnabled(LinimalFeature.SMART_CHANNEL_ADS);
    }

    public boolean isHomeTopAdSuppressionEnabled() {
        return isEnabled(LinimalFeature.HOME_TOP_AD);
    }

    public boolean isAgentIHomeHeaderSuppressionEnabled() {
        return isEnabled(LinimalFeature.AGENT_I_HOME_HEADER);
    }

    public boolean isAgentIChatInformationSuppressionEnabled() {
        return isEnabled(LinimalFeature.AGENT_I_CHAT_INFORMATION);
    }

    public boolean isAgentIWalletHeaderSuppressionEnabled() {
        return isEnabled(LinimalFeature.AGENT_I_WALLET_HEADER);
    }

    public boolean isAgentISettingsSuppressionEnabled() {
        return isEnabled(LinimalFeature.AGENT_I_SETTINGS);
    }

    public boolean isAgentIChatComposerSuppressionEnabled() {
        return isEnabled(LinimalFeature.AGENT_I_CHAT_COMPOSER);
    }

    public boolean isAgentIChatListSearchSuppressionEnabled() {
        return isEnabled(LinimalFeature.AGENT_I_CHAT_LIST_SEARCH);
    }

    public boolean isLineAiMessageContextMenuSuppressionEnabled() {
        return isEnabled(LinimalFeature.LINE_AI_MESSAGE_CONTEXT_MENU);
    }

    public boolean isLineAiGalleryViewerSuppressionEnabled() {
        return isEnabled(LinimalFeature.LINE_AI_GALLERY_VIEWER);
    }

    public boolean isShoppingSuppressionEnabled() {
        return isEnabled(LinimalFeature.SHOPPING);
    }

    public boolean isPremiumSuppressionEnabled() {
        return isEnabled(LinimalFeature.PREMIUM);
    }

    public boolean isPremiumSettingsRowSuppressionEnabled() {
        return isEnabled(LinimalFeature.PREMIUM_SETTINGS_ROW);
    }

    public boolean isVoomSuppressionEnabled() {
        return isEnabled(LinimalFeature.VOOM);
    }

    public boolean isNewsSuppressionEnabled() {
        return isEnabled(LinimalFeature.NEWS);
    }

    public boolean isWalletSuppressionEnabled() {
        return isEnabled(LinimalFeature.WALLET);
    }

    public boolean isMiniSuppressionEnabled() {
        return isEnabled(LinimalFeature.MINI);
    }

    public boolean isHomeRecommendationsSuppressionEnabled() {
        return isEnabled(LinimalFeature.HOME_RECOMMENDATIONS);
    }

    public boolean isHomeTrendingSuppressionEnabled() {
        return isEnabled(LinimalFeature.HOME_TRENDING);
    }

    public boolean isHomeFeedPostCardsSuppressionEnabled() {
        return isEnabled(LinimalFeature.HOME_FEED_POST_CARDS);
    }

    public boolean isHomeFeaturedCollectionsSuppressionEnabled() {
        return isEnabled(LinimalFeature.HOME_FEATURED_COLLECTIONS);
    }

    public boolean isHomeRecentHistorySuppressionEnabled() {
        return isEnabled(LinimalFeature.HOME_RECENT_HISTORY);
    }

    public boolean isChatCalendarSuppressionEnabled() {
        return isEnabled(LinimalFeature.CHAT_CALENDAR);
    }

    public boolean isChatLineGiftSuppressionEnabled() {
        return isEnabled(LinimalFeature.CHAT_LINE_GIFT);
    }

    public boolean isChatLinePaySuppressionEnabled() {
        return isEnabled(LinimalFeature.CHAT_LINE_PAY);
    }

    public boolean isReadWithoutReceiptEnabled() {
        return isEnabled(LinimalFeature.READ_WITHOUT_RECEIPT);
    }

    public boolean isNotificationReadWithoutReceiptEnabled() {
        return isEnabled(LinimalFeature.NOTIFICATION_READ_WITHOUT_RECEIPT);
    }

    /** 既読なし閲覧中の送信操作で、抑制を解除しない設定です。通常入室の既読には作用しません。 */
    public boolean isKeepUnreadAfterSendEnabled() {
        return snapshot.keepUnreadAfterSend()
                && (availability.isAvailable(LinimalFeature.READ_WITHOUT_RECEIPT.getFeatureId())
                || availability.isAvailable(LinimalFeature.NOTIFICATION_READ_WITHOUT_RECEIPT.getFeatureId()));
    }

    public void setKeepUnreadAfterSendEnabled(boolean enabled) {
        if (store == null) {
            failOpen();
            return;
        }
        try {
            store.writeKeepUnreadAfterSend(enabled);
            reload();
        } catch (RuntimeException exception) {
            failOpen();
        }
    }

    public boolean isChatListHeaderAiFriendsSuppressionEnabled() {
        return isEnabled(LinimalFeature.CHAT_LIST_HEADER_AI_FRIENDS);
    }

    public boolean isChatListHeaderCalendarSuppressionEnabled() {
        return isEnabled(LinimalFeature.CHAT_LIST_HEADER_CALENDAR);
    }

    public boolean isChatListHeaderOpenChatSuppressionEnabled() {
        return isEnabled(LinimalFeature.CHAT_LIST_HEADER_OPEN_CHAT);
    }

    public ReadReceiptMode getReadReceiptMode() {
        if (!availability.isAvailable(ReadReceiptMode.FEATURE_ID)) {
            // patch が揃っていない場合、既読は LINE の元どおり自動で送信させます。
            return ReadReceiptMode.NORMAL;
        }
        return snapshot.readReceiptMode();
    }

    public void setReadReceiptMode(ReadReceiptMode mode) {
        if (mode == null || store == null) {
            failOpen();
            return;
        }
        try {
            store.writeReadReceiptMode(mode);
            reload();
        } catch (RuntimeException exception) {
            failOpen();
        }
    }

    public boolean isExternalBrowserOverrideEnabled() {
        return isEnabled(LinimalFeature.EXTERNAL_BROWSER);
    }

    public boolean isPushNotificationRestoreEnabled() {
        return isEnabled(LinimalFeature.PUSH_NOTIFICATIONS);
    }

    public boolean isGoogleDriveBackupViaMicrogEnabled() {
        return isEnabled(LinimalFeature.GOOGLE_DRIVE_BACKUP);
    }

    /**
     * 設定画面のための一括アクセス。機能 hook からは意味論的なメソッドを使い、
     * 任意の feature を扱うのは設定画面だけに限ります。
     */
    public boolean isSuppressionEnabled(LinimalFeature feature) {
        // 設定画面は保存値を表示します。再起動が必要な機能では hook の値と異なることがあります。
        return feature != null && availability.isAvailable(feature.getFeatureId()) && snapshot.isEnabled(feature);
    }

    /** 保存値が、このプロセスの hook が使っている値と異なり、反映に再起動が必要かどうか。 */
    public boolean isRestartPending(LinimalFeature feature) {
        if (feature == null || !feature.requiresRestart()) {
            return false;
        }
        Boolean used = processValues.get(feature);
        return used != null && used != currentValue(feature);
    }

    public void setSuppressionEnabled(LinimalFeature feature, boolean enabled) {
        if (feature == null) {
            failOpen();
            return;
        }
        setEnabled(feature, enabled);
    }

    /** patch status を考慮せず、保存値の扱いだけを検証するための test 境界です。 */
    static LinimalConfig fromStoreForTesting(LinimalConfigStore store) {
        return fromStoreForTesting(store, FeatureAvailability.ALL);
    }

    /** patch status の裏取りを含めて検証するための test 境界です。 */
    static LinimalConfig fromStoreForTesting(
            LinimalConfigStore store, FeatureAvailability availability) {
        // test ごとに新しいプロセスとして扱い、前の test が固定した値を持ち込みません。
        processValues = new java.util.concurrent.ConcurrentHashMap<>();
        LinimalConfig config = new LinimalConfig(store, availability, null);
        config.reload();
        return config;
    }

    /** 同じ保存先で新しいプロセスを起動したときの config を作る test 境界です。起動時の値を読み直します。 */
    LinimalConfig restartForTesting() {
        processValues = new java.util.concurrent.ConcurrentHashMap<>();
        LinimalConfig config = new LinimalConfig(store, availability, patchStatusResult);
        config.reload();
        return config;
    }

    private static LinimalConfig unavailable() {
        return new LinimalConfig(null, FeatureAvailability.NONE, null);
    }

    /** patch が完全に適用されていない機能は、保存値によらず LINE の元の動作を返します。 */
    private boolean isEnabled(LinimalFeature feature) {
        if (!feature.requiresRestart()) {
            return currentValue(feature);
        }
        Boolean used = processValues.get(feature);
        if (used != null) {
            return used;
        }
        boolean value = currentValue(feature);
        // 初期化前（保存先がない config）の値は固定しません。初期化後は、読み込みに失敗した値も固定し、
        // 表示中の画面を途中で変えません。
        if (store == null) {
            return value;
        }
        Boolean previous = processValues.putIfAbsent(feature, value);
        return previous != null ? previous : value;
    }

    private boolean currentValue(LinimalFeature feature) {
        return availability.isAvailable(feature.getFeatureId()) && snapshot.isEnabled(feature);
    }

    private synchronized void setEnabled(LinimalFeature feature, boolean enabled) {
        if (store == null) {
            failOpen();
            return;
        }
        try {
            store.writeFeature(feature, enabled);
            reload();
        } catch (RuntimeException exception) {
            failOpen();
        }
    }

    private void failOpen() {
        snapshot = ConfigSnapshot.originalBehavior();
        health = LinimalConfigHealth.ERROR;
        ReadWithoutReceiptHooks.clearSuppression();
    }
}
