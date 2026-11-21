package app.template.extension.extension;

import org.junit.Before;
import org.junit.Test;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

public class SpotifyDiagHookTest {
    @Before
    public void resetOwnPackage() {
        // The package is static state; never touch the Android stubs from the JVM tests.
        SpotifyDiagHook.resetOwnPackage(() -> null);
    }

    public static class TokenResult {
        private final int resultCase_;
        private final Object result_;

        TokenResult(int resultCase, Object result) {
            resultCase_ = resultCase;
            result_ = result;
        }
    }

    public static class TokenFailure {
        private final int code_ = 12;
        private final String message_ = "secret-token-and-account-data";
    }

    public static class HttpFailure extends RuntimeException {
        private final int status;

        HttpFailure(int status) {
            super("secret-token-and-account-data");
            this.status = status;
        }

        public int code() {
            return status;
        }
    }

    @Test
    public void reportsHttpStatusWithoutExceptionMessage() {
        String result = SpotifyDiagHook.describeFailure(new HttpFailure(403));
        assertEquals("exception=" + HttpFailure.class.getName() + "; http=403", result);
        assertFalse(result.contains("secret"));
    }

    @Test
    public void ignoresNonHttpNumbersAndSensitiveMessages() {
        assertEquals("exception=" + HttpFailure.class.getName(),
                SpotifyDiagHook.describeFailure(new HttpFailure(9000)));
        assertEquals("exception=java.lang.RuntimeException",
                SpotifyDiagHook.describeFailure(new RuntimeException("secret-token")));
        assertEquals("exception=null", SpotifyDiagHook.describeFailure(null));
    }

    @Test
    public void neverReadsOrStringifiesTokenPayload() {
        Object token = new Object() {
            @Override
            public String toString() {
                throw new AssertionError("Token must not be stringified");
            }
        };
        assertEquals("client token acquired",
                SpotifyDiagHook.describeClientTokenResult(new TokenResult(1, token)));
    }

    @Test
    public void reportsOnlyNumericAcquisitionFailure() {
        assertEquals("client token acquisition failed; code=12",
                SpotifyDiagHook.describeClientTokenResult(new TokenResult(2, new TokenFailure())));
    }

    @Test
    public void toleratesUnknownOrMissingTokenResults() {
        assertEquals("client token result=null", SpotifyDiagHook.describeClientTokenResult(null));
        assertEquals("client token result case=0",
                SpotifyDiagHook.describeClientTokenResult(new TokenResult(0, null)));
        String result = SpotifyDiagHook.describeClientTokenResult(new Object());
        assertEquals("client token diagnostic unavailable; exception=java.lang.NoSuchFieldException", result);
    }

    @Test
    public void reportsHttpCategoriesWithoutUrlsOrCredentials() {
        assertEquals("http response=403; host=spclient; service=metadata",
                SpotifyDiagHook.describeHttpResponse(403,
                        "https://secret:password@gue1-spclient.spotify.com/metadata/4/track/private-id?token=secret"));
        assertEquals("http response=200; host=clienttoken; service=v1",
                SpotifyDiagHook.describeHttpResponse(200, "https://clienttoken.spotify.com/v1/clienttoken"));
        assertEquals("http response=401; host=other; service=other",
                SpotifyDiagHook.describeHttpResponse(401, "https://private-account.example/private-id?token=secret"));
    }

    @Test
    public void toleratesMissingOrMalformedUrlsWithoutLoggingThem() {
        assertEquals("http response=500; host=other; service=other",
                SpotifyDiagHook.describeHttpResponse(500, null));
        assertEquals("http response=500; host=other; service=other",
                SpotifyDiagHook.describeHttpResponse(500, "secret token not a URI"));
    }

    @Test
    public void reportsHomeCauseAndCodeWithoutMessagesOrSourceFiles() {
        Throwable failure = new HttpFailure(403) {
            @Override
            public String getMessage() {
                throw new AssertionError("Must not read messages");
            }

            @Override
            public String toString() {
                throw new AssertionError("Must not stringify failures");
            }
        };
        failure.setStackTrace(new StackTraceElement[]{
                new StackTraceElement("com.spotify.home.Repository", "load", "secret-token", 12),
                new StackTraceElement("https://private.example", "secret token", "secret", 1),
        });
        String result = SpotifyDiagHook.describeHomeFailure(new RuntimeException("secret", failure));
        assertTrue(result.contains("cause=1"));
        assertTrue(result.contains("http=403"));
        assertTrue(result.contains("at=com.spotify.home.Repository#load"));
        assertFalse(result.contains("secret"));
        assertFalse(result.contains("private.example"));
    }

    @Test
    public void boundsHomeFailureCyclesAndFrames() {
        Throwable first = new RuntimeException("secret");
        Throwable second = new RuntimeException("secret", first);
        first.initCause(second);
        StackTraceElement[] frames = new StackTraceElement[7];
        for (int i = 0; i < frames.length; i++) {
            frames[i] = new StackTraceElement("p.Test", "frame" + i, "secret", i);
        }
        first.setStackTrace(frames);
        String result = SpotifyDiagHook.describeHomeFailure(first);
        assertTrue(result.contains("cause=1"));
        assertFalse(result.contains("cause=2"));
        assertTrue(result.contains("#frame5"));
        assertFalse(result.contains("#frame6"));
        assertEquals("home failure", SpotifyDiagHook.describeHomeFailure(null));
    }

    @Test
    public void boundsDeepHomeFailuresAndToleratesBrokenStacks() {
        Throwable failure = new RuntimeException("secret");
        for (int i = 0; i < 10; i++) failure = new RuntimeException("secret", failure);
        String result = SpotifyDiagHook.describeHomeFailure(failure);
        assertTrue(result.contains("cause=3"));
        assertFalse(result.contains("cause=4"));

        Throwable broken = new RuntimeException("secret") {
            @Override
            public StackTraceElement[] getStackTrace() {
                throw new AssertionError("secret");
            }
        };
        assertTrue(SpotifyDiagHook.describeHomeFailure(broken).contains("cause=0"));
        assertFalse(SpotifyDiagHook.describeHomeFailure(broken).contains("secret"));
    }

    @Test
    public void derivesPackageFromProcessName() {
        assertEquals("com.spotify.music.morphe",
                SpotifyDiagHook.packageFromProcessName("com.spotify.music.morphe"));
        assertEquals("com.spotify.music.morphe",
                SpotifyDiagHook.packageFromProcessName("com.spotify.music.morphe:remote"));
        assertNull(SpotifyDiagHook.packageFromProcessName(":remote"));
        assertNull(SpotifyDiagHook.packageFromProcessName(""));
        assertNull(SpotifyDiagHook.packageFromProcessName(null));
    }

    @Test
    public void observesTheRunningPackageNotTheOriginalOne() {
        SpotifyDiagHook.rememberOwnPackage("com.spotify.music.morphe");
        assertTrue(SpotifyDiagHook.isOwnPackage("com.spotify.music.morphe"));
        assertFalse(SpotifyDiagHook.isOwnPackage("com.spotify.music"));
        assertFalse(SpotifyDiagHook.isOwnPackage(null));

        // An empty or missing name never replaces the resolved package.
        SpotifyDiagHook.rememberOwnPackage(null);
        SpotifyDiagHook.rememberOwnPackage("");
        assertTrue(SpotifyDiagHook.isOwnPackage("com.spotify.music.morphe"));
    }

    @Test
    public void resolvesRunningPackageFromProcessBeforeStartup() {
        SpotifyDiagHook.resetOwnPackage(() -> "com.spotify.music.morphe:remote");
        assertTrue(SpotifyDiagHook.isOwnPackage("com.spotify.music.morphe"));
        assertFalse(SpotifyDiagHook.isOwnPackage("com.spotify.music"));
    }

    @Test
    public void looksUpProcessNameOnlyOnceAndStartupStillResolves() {
        AtomicInteger lookups = new AtomicInteger();
        SpotifyDiagHook.resetOwnPackage(() -> {
            lookups.incrementAndGet();
            throw new IllegalStateException("no process name yet");
        });
        for (int i = 0; i < 3; i++) assertFalse(SpotifyDiagHook.isOwnPackage("com.spotify.music"));
        assertEquals(1, lookups.get());

        SpotifyDiagHook.rememberOwnPackage("com.spotify.music.morphe");
        assertTrue(SpotifyDiagHook.isOwnPackage("com.spotify.music.morphe"));
        assertEquals(1, lookups.get());
    }

    @Test
    public void concurrentCallersWaitForTheLookup() throws Exception {
        CountDownLatch lookupStarted = new CountDownLatch(1);
        AtomicInteger lookups = new AtomicInteger();
        SpotifyDiagHook.resetOwnPackage(() -> {
            lookups.incrementAndGet();
            lookupStarted.countDown();
            Thread.sleep(200);
            return "com.spotify.music.morphe";
        });
        ExecutorService executor = Executors.newFixedThreadPool(2);
        try {
            Future<Boolean> first = executor.submit(() -> SpotifyDiagHook.isOwnPackage("com.spotify.music.morphe"));
            assertTrue(lookupStarted.await(5, TimeUnit.SECONDS));
            Future<Boolean> second = executor.submit(() -> SpotifyDiagHook.isOwnPackage("com.spotify.music.morphe"));
            assertTrue(first.get(5, TimeUnit.SECONDS));
            assertTrue(second.get(5, TimeUnit.SECONDS));
            // Without the lock the second caller would start its own lookup.
            assertEquals(1, lookups.get());
        } finally {
            executor.shutdownNow();
        }
    }
}
