package app.xposed.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.json.JSONObject;
import org.junit.Test;

public class AccountInfoTest {
    private static final long NOW = 1_780_000_000_000L;

    @Test
    public void detailsSurviveTheDiskCache() {
        AccountInfo.Details details = new AccountInfo.Details(1_300_000_000_000L, 3, 1_700_000_000_000L, 0, false);
        AccountInfo info = new AccountInfo("Japan", "Japan App Store", false, "nasa", NOW, AccountInfo.ORIGIN_X, 42, details);
        AccountInfo read = AccountInfo.fromJson(info.toJson());
        assertEquals("Japan", read.location);
        assertEquals(42, read.userId);
        assertEquals(1_300_000_000_000L, read.details.createdAt);
        assertEquals(3, read.details.handleChanges);
        assertEquals(1_700_000_000_000L, read.details.verifiedSince);
        assertEquals(0, read.details.verifiedYear);
        assertEquals(Boolean.FALSE, read.details.identityVerified);
        assertTrue(read.details.fromAbout());
    }

    @Test
    public void entriesCachedBeforeDetailsReadAsUnknown() throws Exception {
        String old = new JSONObject().put("l", "Japan").put("t", NOW).put("o", "x").put("id", 42).toString();
        AccountInfo read = AccountInfo.fromJson(old);
        assertTrue(read.details.isUnknown());
        assertFalse(read.details.fromAbout());
        assertEquals(-1, read.details.handleChanges);
        assertNull(read.details.identityVerified);
    }

    @Test
    public void aRefreshWithoutLocationAddsItsDetails() {
        AccountInfo cached = new AccountInfo("Japan", null, true, null, NOW - 1000, AccountInfo.ORIGIN_CLOUD, 0,
                new AccountInfo.Details(1_300_000_000_000L, 1, 0, 0, null));
        AccountInfo about = new AccountInfo(null, null, null, null, NOW, AccountInfo.ORIGIN_X, 42,
                new AccountInfo.Details(0, -1, 1_700_000_000_000L, 0, true));
        AccountInfo merged = cached.withDetailsOf(about);
        assertEquals("Japan", merged.location);
        assertEquals(AccountInfo.ORIGIN_CLOUD, merged.origin);
        assertEquals(NOW - 1000, merged.observedAt);
        assertEquals(42, merged.userId);
        // What About didn't know is kept; its verification answers replace ours.
        assertEquals(1_300_000_000_000L, merged.details.createdAt);
        assertEquals(1, merged.details.handleChanges);
        assertEquals(1_700_000_000_000L, merged.details.verifiedSince);
        assertEquals(Boolean.TRUE, merged.details.identityVerified);
    }

    @Test
    public void aRefreshWithoutAboutKeepsTheVerification() {
        AccountInfo cached = new AccountInfo("Japan", null, true, null, NOW, AccountInfo.ORIGIN_X, 42,
                new AccountInfo.Details(0, -1, 1_700_000_000_000L, 2023, true));
        AccountInfo later = new AccountInfo(null, null, null, null, NOW, AccountInfo.ORIGIN_X, 0,
                new AccountInfo.Details(1_300_000_000_000L, 4, 0, 0, null));
        AccountInfo merged = cached.withDetailsOf(later);
        assertEquals(42, merged.userId);
        assertEquals(1_300_000_000_000L, merged.details.createdAt);
        assertEquals(4, merged.details.handleChanges);
        assertEquals(1_700_000_000_000L, merged.details.verifiedSince);
        assertEquals(2023, merged.details.verifiedYear);
        assertEquals(Boolean.TRUE, merged.details.identityVerified);
    }
}
