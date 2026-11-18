package app.afterglow.extension.destinations;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.Map;
import app.afterglow.extension.settings.ThemeJson;

/** A bounded, validated document with a previous valid generation. No Android dependencies. */
public final class AtomicDocument {
    public interface Validator { void validate(Map<String, Object> value); }
    private static final int LIMIT = 4 * 1024 * 1024;
    private final File current, previous, next;
    private final Validator validator;
    private String recoveryMessage;

    public AtomicDocument(File directory, String name, Validator validator) {
        this.current = new File(directory, name + ".json");
        this.previous = new File(directory, name + ".previous.json");
        this.next = new File(directory, name + ".next.json");
        this.validator = validator;
    }

    public String recoveryMessage() { return recoveryMessage; }

    public Map<String, Object> read(Map<String, Object> fallback) {
        Map<String, Object> value = valid(current);
        if (value != null) return value;
        value = valid(previous);
        if (value != null) {
            recoveryMessage = "Recovered the previous valid library. The damaged file has been retained.";
            return value;
        }
        if (current.exists() || previous.exists()) recoveryMessage =
                "The stored library could not be read. Its files have been retained for recovery.";
        validator.validate(fallback);
        return copy(fallback);
    }

    private Map<String, Object> valid(File file) {
        if (!file.isFile() || file.length() > LIMIT) return null;
        try (FileInputStream input = new FileInputStream(file)) {
            byte[] bytes = new byte[(int) file.length()];
            int offset = 0, count;
            while (offset < bytes.length && (count = input.read(bytes, offset, bytes.length - offset)) > 0) offset += count;
            if (offset != bytes.length || input.read() != -1) return null;
            Map<String, Object> value = map(ThemeJson.parse(new String(bytes, StandardCharsets.UTF_8)));
            validator.validate(value);
            return value;
        } catch (Exception invalid) { return null; }
    }

    /** Callers publish their in-memory state only after this returns successfully. */
    public void write(Map<String, Object> value) throws IOException {
        validator.validate(value);
        byte[] bytes = ThemeJson.write(value).getBytes(StandardCharsets.UTF_8);
        if (bytes.length > LIMIT) throw new IOException("This library exceeds the 4 MB storage limit.");
        File directory = current.getParentFile();
        if (!directory.isDirectory() && !directory.mkdirs()) throw new IOException("Couldn't create the library folder.");
        try (FileOutputStream output = new FileOutputStream(next)) {
            output.write(bytes);
            output.getFD().sync();
        }
        if (valid(current) != null) Files.copy(current.toPath(), previous.toPath(), StandardCopyOption.REPLACE_EXISTING);
        else if (current.exists()) {
            // Never silently discard the only corrupt generation while recovering.
            File damaged = new File(directory, current.getName() + ".damaged-" + System.currentTimeMillis());
            Files.copy(current.toPath(), damaged.toPath());
        }
        Files.move(next.toPath(), current.toPath(), StandardCopyOption.REPLACE_EXISTING, StandardCopyOption.ATOMIC_MOVE);
    }

    @SuppressWarnings("unchecked")
    public static Map<String, Object> map(Object value) {
        if (!(value instanceof Map)) throw new IllegalArgumentException("Expected a dictionary.");
        for (Object key : ((Map<?, ?>) value).keySet()) if (!(key instanceof String)) throw new IllegalArgumentException("Invalid dictionary key.");
        return (Map<String, Object>) value;
    }

    public static Map<String, Object> copy(Map<String, Object> value) { return map(ThemeJson.parse(ThemeJson.write(value))); }
}
