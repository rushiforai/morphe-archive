package dev.utaa.linimal.extension.config;

import java.util.Collections;
import java.util.EnumMap;
import java.util.Map;

/**
 * schema v3 より前に使っていたデフォルト値を凍結したテーブルです。
 *
 * <p>{@link LinimalDefaults} は「新規インストールに与えたい値」であり、今後も変わります。
 * migration が {@link LinimalDefaults} を参照すると、既定値を変えるたびに「既存インストールの
 * 挙動を変えない」という migration の目的そのものが失われます。そのため、既存インストールへ
 * 書き戻す値はここに複製し、以後は変更しません。</p>
 *
 * <p>ここに載っていない機能は、この table を凍結した後に追加された新しい機能です。既存
 * インストールにとっても新機能であり保護すべき挙動が無いため、migration は書き込まず、その時点の
 * {@link LinimalDefaults} をフォールバックとして使わせます。</p>
 *
 * <p>機能そのものを削除した場合は、その行だけを取り除きます。下部タブの VOOM 設定はサービス終了に伴い
 * 削除し（VOOM は常に取り除きます）、保存済みの {@code linimal.feature.voom} は読まれないまま残ります。</p>
 */
final class LinimalLegacyDefaults {
    /** schema v3 より前の {@code LinimalDefaults.READ_RECEIPT_MODE} です。 */
    static final ReadReceiptMode READ_RECEIPT_MODE = ReadReceiptMode.NORMAL;

    private static final Map<LinimalFeature, Boolean> FEATURE_STATES = freeze();

    private LinimalLegacyDefaults() {
    }

    /** 凍結した既定値を持つ機能だけを、enum の宣言順で返します。 */
    static Map<LinimalFeature, Boolean> featureStates() {
        return FEATURE_STATES;
    }

    static boolean isEnabled(LinimalFeature feature) {
        Boolean enabled = FEATURE_STATES.get(feature);
        if (enabled == null) {
            throw new ConfigStoreException("Feature has no frozen default: " + feature);
        }
        return enabled;
    }

    private static Map<LinimalFeature, Boolean> freeze() {
        EnumMap<LinimalFeature, Boolean> states = new EnumMap<>(LinimalFeature.class);
        // 非推奨の alias は置き換え先と同じキーを共有するため、値も一致させます。
        states.put(LinimalFeature.ADS, true);
        states.put(LinimalFeature.LINE_AI, true);
        states.put(LinimalFeature.PREMIUM, true);
        states.put(LinimalFeature.NEWS, true);
        states.put(LinimalFeature.WALLET, false);
        states.put(LinimalFeature.HOME_RECOMMENDATIONS, true);
        states.put(LinimalFeature.HOME_TRENDING, true);
        states.put(LinimalFeature.CHAT_CALENDAR, true);
        states.put(LinimalFeature.CHAT_LINE_GIFT, true);
        states.put(LinimalFeature.CHAT_LINE_PAY, true);
        states.put(LinimalFeature.EXTERNAL_BROWSER, false);
        states.put(LinimalFeature.SMART_CHANNEL_ADS, true);
        states.put(LinimalFeature.HOME_TOP_AD, true);
        states.put(LinimalFeature.AGENT_I_HOME_HEADER, true);
        states.put(LinimalFeature.AGENT_I_CHAT_INFORMATION, true);
        states.put(LinimalFeature.AGENT_I_WALLET_HEADER, true);
        states.put(LinimalFeature.AGENT_I_SETTINGS, true);
        states.put(LinimalFeature.AGENT_I_CHAT_COMPOSER, true);
        states.put(LinimalFeature.AGENT_I_CHAT_LIST_SEARCH, true);
        states.put(LinimalFeature.LINE_AI_MESSAGE_CONTEXT_MENU, true);
        states.put(LinimalFeature.LINE_AI_GALLERY_VIEWER, true);
        states.put(LinimalFeature.SHOPPING, true);
        states.put(LinimalFeature.HOME_FEED_POST_CARDS, true);
        states.put(LinimalFeature.HOME_FEATURED_COLLECTIONS, true);
        states.put(LinimalFeature.PREMIUM_SETTINGS_ROW, true);
        states.put(LinimalFeature.READ_WITHOUT_RECEIPT, true);
        states.put(LinimalFeature.MINI, false);
        states.put(LinimalFeature.CHAT_LIST_HEADER_AI_FRIENDS, false);
        states.put(LinimalFeature.CHAT_LIST_HEADER_CALENDAR, false);
        states.put(LinimalFeature.CHAT_LIST_HEADER_OPEN_CHAT, false);
        return Collections.unmodifiableMap(states);
    }
}
