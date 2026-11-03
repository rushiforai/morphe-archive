package app.hushmessenger.extension;

import java.lang.reflect.Modifier;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Stream;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 * The patches call into the extension from Messenger's own classes, which sit in another package, so every extension
 * class a patch names has to be public. A package-private one passes every test here and then fails Android's verifier
 * the first time Messenger reaches the call (ChatJump did that on every chat open, 2026-11-02).
 */
public class PatchedCallsTest {
    private static final Pattern NAMED = Pattern.compile("Lapp/hushmessenger/extension/([A-Za-z0-9_]+(?:\\\\?\\$[A-Za-z0-9_]+)*);");

    @Test public void everyExtensionClassThePatchesNameIsPublic() throws Exception {
        Path sources = Paths.get("..", "..", "patches", "src", "main", "kotlin");
        assertTrue(sources.toAbsolutePath().toString(), Files.isDirectory(sources));
        Set<String> named = new TreeSet<>();
        try (Stream<Path> files = Files.walk(sources)) {
            for (Path file : (Iterable<Path>) files.filter(path -> path.toString().endsWith(".kt"))::iterator) {
                Matcher match = NAMED.matcher(new String(Files.readAllBytes(file), StandardCharsets.UTF_8));
                while (match.find()) named.add(match.group(1).replace("\\", ""));
            }
        }
        assertTrue(named.toString(), named.contains("ChatJump") && named.contains("Settings") && named.size() > 20);
        ClassLoader loader = PatchedCallsTest.class.getClassLoader();
        List<String> closed = new ArrayList<>();
        for (String name : named) {
            for (Class<?> type = Class.forName("app.hushmessenger.extension." + name, false, loader); type != null;
                 type = type.getEnclosingClass()) {
                if (!Modifier.isPublic(type.getModifiers())) {
                    closed.add(name);
                    break;
                }
            }
        }
        assertEquals(List.of(), closed);
    }
}
