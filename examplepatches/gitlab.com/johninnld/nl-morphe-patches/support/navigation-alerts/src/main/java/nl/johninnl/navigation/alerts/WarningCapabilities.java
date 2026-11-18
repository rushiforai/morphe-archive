package nl.johninnl.navigation.alerts;

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Collections;
import java.util.Set;
import java.util.TreeSet;

/** Source coverage proof and enabled semantic capabilities are independent of engine readiness. */
public final class WarningCapabilities {
    public static final int MAX_CAPABILITIES = 512;
    public final String manifestDigest, digest;
    public final Set<String> required;
    public final boolean complete;

    public WarningCapabilities(String manifestDigest, Set<String> required, boolean complete) {
        if (manifestDigest == null || !manifestDigest.matches("[0-9a-f]{64}")) throw new IllegalArgumentException("MANIFEST_DIGEST");
        this.manifestDigest = manifestDigest; this.required = copy(required); this.complete = complete;
        try {
            ByteArrayOutputStream bytes = new ByteArrayOutputStream(); DataOutputStream out = new DataOutputStream(bytes);
            out.writeUTF(manifestDigest); out.writeBoolean(complete);
            for (String capability : this.required) out.writeUTF(capability);
            digest = sha256(bytes.toByteArray());
        } catch (IOException impossible) { throw new IllegalStateException(impossible); }
    }
    static Set<String> copy(Set<String> values) {
        if (values == null || values.size() > MAX_CAPABILITIES) throw new IllegalArgumentException("CAPABILITY_COUNT");
        TreeSet<String> result = new TreeSet<>();
        for (String value : values) {
            if (value == null || !value.matches("[A-Za-z0-9._:+/\\-]{1,256}")) throw new IllegalArgumentException("CAPABILITY_NAME");
            result.add(value);
        }
        return Collections.unmodifiableSet(result);
    }
    static String sha256(byte[] bytes) {
        try {
            StringBuilder value = new StringBuilder();
            for (byte b : MessageDigest.getInstance("SHA-256").digest(bytes)) value.append(String.format(java.util.Locale.ROOT,"%02x",b & 255));
            return value.toString();
        } catch (NoSuchAlgorithmException impossible) { throw new IllegalStateException(impossible); }
    }
}
