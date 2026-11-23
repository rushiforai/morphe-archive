package nl.johninnl.eclipse.auto.data;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.junit.Test;

/**
 * The compose token is read from the app's encrypted store for one request and then forgotten. These
 * checks read the extension's own sources (inside this module) so a later change cannot start
 * logging, printing or persisting it without a test failing.
 */
public class TokenHandlingTest {
    private static List<File> sources() {
        List<File> files = new ArrayList<>();
        collect(new File("src/main/java"), files);
        return files;
    }

    private static void collect(File directory, List<File> files) {
        File[] children = directory.listFiles();
        if (children == null) return;
        for (File child : children) {
            if (child.isDirectory()) collect(child, files);
            else if (child.getName().endsWith(".java")) files.add(child);
        }
    }

    private static String text(File file) {
        try {
            return new String(Files.readAllBytes(file.toPath()), StandardCharsets.UTF_8);
        } catch (IOException unreadable) {
            throw new IllegalStateException(unreadable);
        }
    }

    @Test public void theSourcesAreFoundFromTheModuleDirectory() {
        assertTrue("run from the module directory", sources().size() >= 35);
    }

    @Test public void nothingInTheExtensionLogsOrPrintsAnything() {
        for (File file : sources()) {
            String source = text(file);
            for (String forbidden : new String[] {"android.util.Log", "System.out", "System.err", "printStackTrace"}) {
                assertFalse(file.getName() + " uses " + forbidden, source.contains(forbidden));
            }
        }
    }

    @Test public void theBearerTokenIsReadInExactlyOnePlaceAndTheStoredKeyInExactlyOneMore() {
        List<String> readers = new ArrayList<>();
        List<String> storeReaders = new ArrayList<>();
        for (File file : sources()) {
            String source = text(file);
            if (source.contains(".bearer()")) readers.add(file.getName());
            if (source.contains("\"auth_token\"")) storeReaders.add(file.getName());
        }
        assertEquals(Arrays.asList("ComposeClient.java"), readers);
        assertEquals(Arrays.asList("AppBridge.java"), storeReaders);
    }

    @Test public void theCacheAndTheLayoutNeverTouchTheTokenOrTheAuthType() {
        for (String name : new String[] {"ComposeCache.java", "HomeLayout.java", "Catalog.java"}) {
            String source = text(new File("src/main/java/nl/johninnl/eclipse/auto/data/" + name));
            assertFalse(name + " must not see the token", source.contains("bearer()"));
        }
        String cache = text(new File("src/main/java/nl/johninnl/eclipse/auto/data/ComposeCache.java"));
        assertFalse("the cache is given an account key, never the credentials", cache.contains("ComposeAuth"));
    }

    @Test public void certificateVerificationIsLeftToThePlatform() {
        for (File file : sources()) {
            String source = text(file);
            for (String forbidden : new String[] {"TrustManager", "HostnameVerifier", "setSSLSocketFactory", "setHostnameVerifier",
                "SSLContext", "X509"}) {
                assertFalse(file.getName() + " touches " + forbidden, source.contains(forbidden));
            }
        }
    }
}
