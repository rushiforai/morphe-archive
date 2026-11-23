package nl.johninnl.eclipse.auto.data;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

/** The sanitised compose captures under src/test/resources/compose. */
public final class Fixtures {
    public static String text(String name) {
        try (InputStream in = Fixtures.class.getClassLoader().getResourceAsStream(name)) {
            if (in == null) throw new IllegalStateException("Missing test resource " + name);
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            int read;
            while ((read = in.read(buffer)) >= 0) out.write(buffer, 0, read);
            return new String(out.toByteArray(), StandardCharsets.UTF_8);
        } catch (IOException failure) {
            throw new IllegalStateException(failure);
        }
    }

    public static String home() { return text("compose/home.json"); }

    public static String discover() { return text("compose/discover.json"); }

    private Fixtures() { }
}
