package app.morphe.extension.reddit.profile;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

import org.junit.jupiter.api.Test;

public class ProfileShareActionsTest {
    @Test void extractsBareUser() { assertEquals("rere", ProfileShareActions.extractUsername("https://www.reddit.com/user/rere")); }
    @Test void extractsShortUPrefix() { assertEquals("rere", ProfileShareActions.extractUsername("https://www.reddit.com/u/rere")); }
    @Test void extractsTokenLink() { assertEquals("LowMarket6464", ProfileShareActions.extractUsername("https://www.reddit.com/u/LowMarket6464/s/5sPZgIEqx8")); }
    @Test void nonProfileReturnsNull() { assertNull(ProfileShareActions.extractUsername("https://www.reddit.com/r/funny/comments/1abc/")); }
    @Test void nullReturnsNull() { assertNull(ProfileShareActions.extractUsername(null)); }
    @Test void ghostdditTrailingSlash() { assertEquals("https://ghostddit.aeddit.com/user/rere/", ProfileShareActions.ghostdditUrl("rere")); }
    @Test void ghostdditEncodes() { assertEquals("https://ghostddit.aeddit.com/user/a%20b/", ProfileShareActions.ghostdditUrl("a b")); }

    @Test void extractsQuery() { assertEquals("rere", ProfileShareActions.extractUsername("https://www.reddit.com/user/rere/?utm_source=share")); }
    @Test void extractsOldReddit() { assertEquals("rere", ProfileShareActions.extractUsername("https://old.reddit.com/user/rere/")); }
    @Test void extractsUppercaseSchemeAndHost() { assertEquals("RERE", ProfileShareActions.extractUsername("HTTPS://WWW.REDDIT.COM/user/RERE")); }
    @Test void extractsDashUnderscoreQueryAndFragment() { assertEquals("a-b_c", ProfileShareActions.extractUsername("https://www.reddit.com/user/a-b_c?utm=x#frag")); }
    @Test void bareHandleReturnsNull() { assertNull(ProfileShareActions.extractUsername("u/rere")); }
    @Test void emptyUserSegmentReturnsNull() { assertNull(ProfileShareActions.extractUsername("https://www.reddit.com/user/")); }
    @Test void emptyStringReturnsNull() { assertNull(ProfileShareActions.extractUsername("")); }
    @Test void extractsHttpBareDomain() { assertEquals("rere", ProfileShareActions.extractUsername("http://reddit.com/user/rere")); }
    @Test void extractsShortUTrailingSlash() { assertEquals("rere", ProfileShareActions.extractUsername("https://old.reddit.com/u/rere/")); }
    @Test void emptyShortUserSegmentReturnsNull() { assertNull(ProfileShareActions.extractUsername("https://www.reddit.com/u/")); }
    @Test void ghostdditNullReturnsNull() { assertNull(ProfileShareActions.ghostdditUrl(null)); }
    @Test void ghostdditEmptyReturnsNull() { assertNull(ProfileShareActions.ghostdditUrl("")); }
}
