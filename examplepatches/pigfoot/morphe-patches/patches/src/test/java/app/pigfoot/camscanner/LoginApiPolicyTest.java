package app.pigfoot.camscanner;

import org.junit.Test;
import static org.junit.Assert.*;

public class LoginApiPolicyTest {
    @Test public void productionPolicyIsStatelessAndNotAnObservationHelper() {
        assertEquals(0, LoginApiPolicy.class.getDeclaredFields().length);
        assertEquals(1, LoginApiPolicy.class.getDeclaredMethods().length);
    }
    @Test public void knownErrorOnlyCenterResponsesCannotRemainAConfigurationCacheHit() {
        for (int code : new int[]{101, 515}) {
            assertNull(LoginApiPolicy.refreshLoginApis("{\"err\":\"PRIVATE_SERVER_MESSAGE\",\"ret\":" + code + "}"));
        }
    }

    @Test public void mixedUnknownOrAmbiguousEnvelopesAreNotCleared() {
        for (String cached : new String[]{"{\"err\":\"x\",\"ret\":201}",
                "{\"err\":\"x\",\"ret\":\"101\"}", "{\"err\":\"x\",\"ret\":101.0}",
                "{\"ret\":101}", "{\"err\":42,\"ret\":101}",
                "{\"err\":\"x\",\"ret\":101,\"UAPI\":\"https://api-cs-us.intsig.net/user/cs\"}",
                "{\"err\":\"x\",\"ret\":515,\"SAPI\":\"PRIVATE\"}"})
            assertSame(cached, LoginApiPolicy.refreshLoginApis(cached));
    }
    @Test public void onlyTheExactObsoleteUapiTriggersOriginalCacheMiss() {
        assertNull(LoginApiPolicy.refreshLoginApis("{\"UAPI\":\"https://api-cs-bak.intsig.net/user/cs\"}"));
        String escaped = "{\"UAPI\":\"https:\\/\\/api-cs-bak.intsig.net\\/user\\/cs\",\"SAPI\":\"PRIVATE_CONFIG\"}";
        assertNull(LoginApiPolicy.refreshLoginApis(escaped));
        for (String host : new String[]{"https://api-cs-us.intsig.net/user/cs", "https://api-cs.intsig.net/user/cs",
                "https://api-cs-bak-sandbox.intsig.net/user/cs", "https://regional.invalid/user/cs",
                "https://api-cs-bak.intsig.net/user/cs/", "https://api-cs-bak.intsig.net.evil.invalid/user/cs"}) {
            String cached = "{\"UAPI\":\"" + host + "\"}";
            assertSame(cached, LoginApiPolicy.refreshLoginApis(cached));
        }
    }

    @Test public void unrelatedMissingOrNonStringKeysArePreservedByIdentity() {
        for (String cached : new String[]{"{}", "{\"UAPI\":null}", "{\"UAPI\":42}",
                "{\"SAPI\":\"https://api-cs-bak.intsig.net/user/cs\"}",
                "{\"UAPI_CN\":\"https://api-cs-bak.intsig.net/user/cs\"}"})
            assertSame(cached, LoginApiPolicy.refreshLoginApis(cached));
    }

    @Test public void malformedOversizedAndAbsentInputsDoNotClearConfiguration() {
        assertNull(LoginApiPolicy.refreshLoginApis(null));
        for (String cached : new String[]{"", "PRIVATE_NOT_JSON", "[\"PRIVATE\"]", "{", "x".repeat(32769)})
            assertSame(cached, LoginApiPolicy.refreshLoginApis(cached));
    }
}
