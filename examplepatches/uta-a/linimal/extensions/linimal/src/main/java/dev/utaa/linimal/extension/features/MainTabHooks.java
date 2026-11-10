package dev.utaa.linimal.extension.features;

import java.util.List;

import dev.utaa.linimal.extension.config.LinimalConfig;

/**
 * 下部タブを、表示設定に応じて安全に隠します。
 *
 * <p>タブの一覧（ViewPager のページ、タブ位置の変換、バッジ、VOOM 判定など）は公式のまま使います。
 * ここが扱うのは、下部ボタンの表示と、隠したタブへ向かう遷移先だけです。一覧を絞ると、一覧を共有する
 * 他の処理に副作用が出るためです。</p>
 *
 * <p>VOOM（{@code TIMELINE}）はサービス終了に伴い、設定によらず常に隠します。</p>
 *
 * <p>LINE の enum 型を extension 側へリンクせず、定数名だけで判定します。どの hook も、設定を読めない・
 * 引数が想定外・例外が起きたときは元の値を返します。</p>
 */
public final class MainTabHooks {
    private MainTabHooks() {
    }

    /**
     * 下部ボタンが元の一覧で占める位置を返します。隠すボタンは null を返します。
     *
     * <p>LINE は位置が null のボタンを、一覧にないタブと同じく非表示にし、click listener も付けません。
     * 隠さないボタンの位置は変えないため、押したときの位置は ViewPager のページと一致します。</p>
     */
    public static Integer visibleButtonPosition(Enum<?> button, Integer position) {
        try {
            if (isHidden(button, readConfig())) {
                return null;
            }
        } catch (Throwable ignored) {
            // 元の位置のままボタンを表示します。
        }
        return position;
    }

    /**
     * ウォレットボタンに紐づく tooltip を作るかどうか。ウォレットを隠しているときは、見えないボタンへ
     * 表示しないよう、一覧にウォレットがないときと同じ経路にします。
     */
    public static boolean keepsWalletTooltip(boolean tabsContainWallet) {
        try {
            return tabsContainWallet && !readConfig().wallet;
        } catch (Throwable ignored) {
            return tabsContainWallet;
        }
    }

    /**
     * 起動時に復元する ViewPager の位置を返します。元の一覧でその位置にあるタブを隠すなら 0 です。
     */
    public static int visibleTabPosition(List<?> tabs, int position) {
        try {
            return visibleTabPositionForState(tabs, position, readConfig());
        } catch (Throwable ignored) {
            return position;
        }
    }

    /**
     * 他の画面から開こうとしたタブを返します。隠すタブなら、元の一覧の先頭（ホーム）を返します。
     *
     * @param requested 開こうとしたタブ
     * @param home 元の一覧の先頭のタブ
     */
    public static Enum<?> visibleTab(Enum<?> requested, Enum<?> home) {
        try {
            return visibleTabForState(requested, home, readConfig());
        } catch (Throwable ignored) {
            return requested;
        }
    }

    static Integer visibleButtonPositionForState(Enum<?> button, Integer position, HiddenTabs hidden) {
        return isHidden(button, hidden) ? null : position;
    }

    static int visibleTabPositionForState(List<?> tabs, int position, HiddenTabs hidden) {
        if (tabs == null || position < 0 || position >= tabs.size()) {
            return position;
        }
        Object tab = tabs.get(position);
        return tab instanceof Enum<?> && isHidden((Enum<?>) tab, hidden) ? 0 : position;
    }

    static Enum<?> visibleTabForState(Enum<?> requested, Enum<?> home, HiddenTabs hidden) {
        if (home == null || !isHidden(requested, hidden) || isHidden(home, hidden)) {
            return requested;
        }
        return home;
    }

    private static boolean isHidden(Enum<?> tab, HiddenTabs hidden) {
        return tab != null && hidden.contains(tab.name());
    }

    private static HiddenTabs readConfig() {
        try {
            LinimalConfig config = LinimalConfig.get();
            return new HiddenTabs(
                    config.isNewsSuppressionEnabled(),
                    config.isWalletSuppressionEnabled(),
                    config.isShoppingSuppressionEnabled(),
                    config.isMiniSuppressionEnabled());
        } catch (Throwable ignored) {
            // 設定を読めないときは各設定を OFF とみなします。VOOM は設定によらず隠します。
            return new HiddenTabs(false, false, false, false);
        }
    }

    /** どの設定のタブを隠すか。{@code TIMELINE}（VOOM）は設定によらず常に隠します。 */
    static final class HiddenTabs {
        final boolean news;
        final boolean wallet;
        final boolean shopping;
        final boolean mini;

        HiddenTabs(boolean news, boolean wallet, boolean shopping, boolean mini) {
            this.news = news;
            this.wallet = wallet;
            this.shopping = shopping;
            this.mini = mini;
        }

        boolean contains(String name) {
            return "TIMELINE".equals(name)
                    || (news && ("NEWS".equals(name) || "NEWS_ROW".equals(name)))
                    || (wallet && "WALLET".equals(name))
                    || (shopping && ("COMMERCE".equals(name) || "COMMERCE_TW".equals(name)))
                    || (mini && "MINI".equals(name));
        }
    }

    /** 隠すタブの page の id に足す値。公式の id（ordinal）と重ならないよう、十分大きくします。 */
    static final int HIDDEN_PAGE_ID_OFFSET = 0x10000;

    /**
     * ViewPager が位置 {@code position} の page を作るとき、隠すタブなら中身のない Fragment で置き換えるか。
     *
     * <p>隠したタブが現在のページの隣にあると、ViewPager は画面外でその Fragment を作り、通信が走りえます。
     * 置き換えた page は view を持たず、何も表示も通信もしません。</p>
     */
    public static boolean hidesPage(List<?> tabs, int position) {
        try {
            return hidesPageForState(tabs, position, readConfig());
        } catch (Throwable ignored) {
            return false;
        }
    }

    /**
     * page の id に使う enum の ordinal を返します。隠すタブでは公式の値と衝突しない別の値にします。
     *
     * <p>FragmentPagerAdapter は id から作る tag で既存の Fragment を再利用します。プロセス再生成の後に
     * 設定が変わっても、中身のない page と本物の page が取り違えられないようにするためです。</p>
     */
    public static int pageItemOrdinal(Enum<?> tab) {
        int ordinal = tab.ordinal();
        try {
            return pageItemOrdinalForState(tab, readConfig());
        } catch (Throwable ignored) {
            return ordinal;
        }
    }

    static boolean hidesPageForState(List<?> tabs, int position, HiddenTabs hidden) {
        if (tabs == null || position < 0 || position >= tabs.size()) {
            return false;
        }
        Object tab = tabs.get(position);
        return tab instanceof Enum<?> && isHidden((Enum<?>) tab, hidden);
    }

    static int pageItemOrdinalForState(Enum<?> tab, HiddenTabs hidden) {
        return isHidden(tab, hidden) ? tab.ordinal() + HIDDEN_PAGE_ID_OFFSET : tab.ordinal();
    }

    /**
     * ViewPager が復元した位置など、隠すタブのページが選ばれたときに、ページ 0 へ戻すかどうか。
     *
     * <p>ページ 0 は戻り先なので対象にしません（戻した通知が再び戻そうとして終わらなくなるのを防ぎます）。</p>
     */
    public static boolean resetsHiddenPage(Enum<?> tab, int position) {
        try {
            return resetsHiddenPageForState(tab, position, readConfig());
        } catch (Throwable ignored) {
            return false;
        }
    }

    static boolean resetsHiddenPageForState(Enum<?> tab, int position, HiddenTabs hidden) {
        return position > 0 && isHidden(tab, hidden);
    }
}
