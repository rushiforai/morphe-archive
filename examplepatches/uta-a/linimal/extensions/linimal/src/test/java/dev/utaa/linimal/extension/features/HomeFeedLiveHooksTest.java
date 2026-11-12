package dev.utaa.linimal.extension.features;

import static org.junit.Assert.assertFalse;

import org.junit.Test;

/** ホームのライブ配信カードの gate の fail-open 契約を検証します。 */
public final class HomeFeedLiveHooksTest {
    @Test
    public void unavailableConfigurationPreservesLineRendering() {
        // この単体テストでは LinimalConfig を初期化しないため、runtime の初期値は fail-open です。
        assertFalse(HomeFeedLiveHooks.shouldSuppress());
    }
}
