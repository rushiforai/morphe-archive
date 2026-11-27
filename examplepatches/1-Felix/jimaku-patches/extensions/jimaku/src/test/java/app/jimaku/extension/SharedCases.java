package app.jimaku.extension;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

/** Reads the test cases the extension shares with this port, and other test resources. */
public final class SharedCases {
    private SharedCases() {
    }

    public static JSONObject read(String name) throws Exception {
        return new JSONObject(resource("/shared/" + name));
    }

    public static String resource(String path) {
        try (InputStream in = SharedCases.class.getResourceAsStream(path)) {
            if (in == null) throw new IllegalStateException("Missing test resource " + path);
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            for (int read; (read = in.read(buffer)) >= 0; ) out.write(buffer, 0, read);
            return new String(out.toByteArray(), StandardCharsets.UTF_8);
        } catch (IOException e) {
            throw new IllegalStateException(e);
        }
    }
}
