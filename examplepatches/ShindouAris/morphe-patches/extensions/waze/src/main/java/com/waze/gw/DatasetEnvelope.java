package com.waze.gw;

import android.content.Context;
import android.util.Base64;

import org.json.JSONObject;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.security.MessageDigest;
import java.util.Locale;
import java.util.zip.GZIPInputStream;

/** Strict parser and verifier for the shared encrypted server envelope. */
final class DatasetEnvelope {
    static final String ROAD = "road-notices";
    static final String POINT = "wme-point-notices";
    static final String CONTEXT = "wme-context-aware-alerts";

    final String dataset;
    final String version;
    final String artifactUrl;
    final long encryptedSize;
    final String encryptedSha256;
    final String keyId;
    final byte[] nonce;
    final byte[] authTag;
    final byte[] aad;
    final String payloadFormat;
    final long plaintextSize;
    final String plaintextSha256;
    final byte[] signature;
    final int payloadSchemaVersion;
    final int spatialZoom;
    final long targetMapBuildId;

    private DatasetEnvelope(String dataset, String version, String artifactUrl,
                            long encryptedSize, String encryptedSha256, String keyId,
                            byte[] nonce, byte[] authTag, byte[] aad, String payloadFormat,
                            long plaintextSize, String plaintextSha256, byte[] signature,
                            int payloadSchemaVersion, int spatialZoom, long targetMapBuildId) {
        this.dataset = dataset;
        this.version = version;
        this.artifactUrl = artifactUrl;
        this.encryptedSize = encryptedSize;
        this.encryptedSha256 = encryptedSha256;
        this.keyId = keyId;
        this.nonce = nonce;
        this.authTag = authTag;
        this.aad = aad;
        this.payloadFormat = payloadFormat;
        this.plaintextSize = plaintextSize;
        this.plaintextSha256 = plaintextSha256;
        this.signature = signature;
        this.payloadSchemaVersion = payloadSchemaVersion;
        this.spatialZoom = spatialZoom;
        this.targetMapBuildId = targetMapBuildId;
    }

    static DatasetEnvelope parse(byte[] bytes, String expectedDataset, int maxPlaintext)
            throws Exception {
        JSONObject root = new JSONObject(new String(bytes, "UTF-8"));
        String dataset = root.getString("dataset");
        if (!expectedDataset.equals(dataset)) throw new Exception("dataset mismatch");
        int envelopeSchema = root.getInt("schemaVersion");
        if ((ROAD.equals(dataset) && envelopeSchema != 3)
                || (POINT.equals(dataset) && envelopeSchema != 2)
                || (CONTEXT.equals(dataset) && envelopeSchema != 3)) {
            throw new Exception("unsupported envelope schema");
        }
        String version = root.getString("version");
        if (!version.matches("[0-9]{1,32}")) throw new Exception("invalid dataset version");

        long encryptedSize = root.getLong("size");
        if (encryptedSize <= 0 || encryptedSize > (long) maxPlaintext + 64L * 1024L) {
            throw new Exception("invalid encrypted size");
        }
        JSONObject rootChecksum = root.getJSONObject("checksum");
        requireAlgorithm(rootChecksum, "SHA-256");
        String encryptedHash = hash(rootChecksum.getString("value"));

        JSONObject artifact = root.getJSONObject("artifact");
        String artifactUrl = artifact.getString("url");
        if (artifactUrl.isEmpty() || !artifactUrl.startsWith("/")) {
            throw new Exception("invalid artifact URL");
        }

        JSONObject encryption = root.getJSONObject("encryption");
        if (!"ENCRYPTED".equals(encryption.getString("status"))
                || !"AES-256-GCM/v1".equals(encryption.getString("provider"))) {
            throw new Exception("unsupported encryption");
        }
        String keyId = encryption.getString("keyId").toLowerCase(Locale.ROOT);
        if (!keyId.matches("[0-9a-f]{16}")) throw new Exception("invalid key ID");
        byte[] nonce = Base64.decode(encryption.getString("nonce"), Base64.DEFAULT);
        byte[] tag = Base64.decode(encryption.getString("authTag"), Base64.DEFAULT);
        byte[] aad = encryption.getString("aad").getBytes("UTF-8");
        if (nonce.length != 12 || tag.length != 16 || aad.length == 0 || aad.length > 256) {
            throw new Exception("invalid AES-GCM metadata");
        }
        String expectedAad = "wazemodserver:" + dataset + ":"
                + (CONTEXT.equals(dataset) ? "v3" : "v2") + ":" + version + ":" + keyId;
        if (!expectedAad.equals(new String(aad, "UTF-8"))) {
            throw new Exception("dataset AAD mismatch");
        }

        JSONObject payload = root.getJSONObject("payload");
        if (!"protobuf".equals(payload.getString("encoding"))
                || !"gzip".equals(payload.getString("compression"))) {
            throw new Exception("unsupported payload encoding");
        }
        String format = payload.getString("format");
        String expectedFormat = ROAD.equals(dataset) ? "road-notices/v2"
                : (CONTEXT.equals(dataset) ? "wme-context-aware-alerts/v3" : "wme-point-notices/v2");
        if (!expectedFormat.equals(format)) throw new Exception("payload format mismatch");
        long plaintextSize = payload.getLong("size");
        if (plaintextSize <= 0 || plaintextSize > maxPlaintext) {
            throw new Exception("invalid plaintext size");
        }
        JSONObject payloadChecksum = payload.getJSONObject("checksum");
        requireAlgorithm(payloadChecksum, "SHA-256");
        String plaintextHash = hash(payloadChecksum.getString("value"));
        JSONObject payloadSignature = payload.getJSONObject("signature");
        requireAlgorithm(payloadSignature, "Ed25519");
        byte[] signature = Base64.decode(payloadSignature.getString("value"), Base64.DEFAULT);
        if (signature.length != 64) throw new Exception("invalid Ed25519 signature");
        int payloadSchema = payload.getInt("schemaVersion");
        int spatialZoom = payload.optInt("spatialZoom", -1);
        long targetMapBuild = ROAD.equals(dataset)
                ? positiveLong(root.getString("targetWazeMapBuildId"), "target map build") : 0L;
        return new DatasetEnvelope(dataset, version, artifactUrl, encryptedSize, encryptedHash,
                keyId, nonce, tag, aad, format, plaintextSize, plaintextHash, signature,
                payloadSchema, spatialZoom, targetMapBuild);
    }

    byte[] decryptAndVerify(Context context, byte[] ciphertext, int maxPlaintext)
            throws Exception {
        if (ciphertext.length != encryptedSize
                || !sha256(ciphertext).equalsIgnoreCase(encryptedSha256)) {
            throw new SecurityException("ciphertext integrity mismatch");
        }
        byte[] compressed = DatasetCrypto.decrypt(context, ciphertext, nonce, authTag, aad, keyId);
        byte[] plaintext;
        try {
            plaintext = gunzip(compressed, maxPlaintext, plaintextSize);
        } finally {
            java.util.Arrays.fill(compressed, (byte) 0);
        }
        if (!sha256(plaintext).equalsIgnoreCase(plaintextSha256)
                || !RoadNoticeCrypto.verify(plaintext, signature)) {
            java.util.Arrays.fill(plaintext, (byte) 0);
            throw new SecurityException("plaintext authentication rejected");
        }
        return plaintext;
    }

    void verifyStoredPlaintext(byte[] plaintext) throws Exception {
        if (plaintext.length != plaintextSize
                || !sha256(plaintext).equalsIgnoreCase(plaintextSha256)
                || !RoadNoticeCrypto.verify(plaintext, signature)) {
            throw new SecurityException("stored plaintext authentication rejected");
        }
    }

    private static byte[] gunzip(byte[] compressed, int limit, long expected) throws Exception {
        GZIPInputStream input = new GZIPInputStream(new ByteArrayInputStream(compressed));
        ByteArrayOutputStream output = new ByteArrayOutputStream(
                expected > 0 && expected <= limit ? (int) expected : 4096);
        try {
            byte[] buffer = new byte[16 * 1024];
            int total = 0;
            int count;
            while ((count = input.read(buffer)) != -1) {
                if (count > limit - total) throw new Exception("decompressed payload too large");
                output.write(buffer, 0, count);
                total += count;
            }
        } finally {
            input.close();
        }
        byte[] result = output.toByteArray();
        if (result.length != expected) throw new Exception("decompressed size mismatch");
        return result;
    }

    static String sha256(byte[] bytes) throws Exception {
        byte[] digest = MessageDigest.getInstance("SHA-256").digest(bytes);
        StringBuilder text = new StringBuilder(64);
        for (byte value : digest) {
            text.append(String.format(Locale.US, "%02x", value & 0xff));
        }
        return text.toString();
    }

    private static void requireAlgorithm(JSONObject object, String expected) throws Exception {
        if (!expected.equalsIgnoreCase(object.getString("algorithm"))) {
            throw new Exception("algorithm mismatch");
        }
    }

    private static String hash(String value) throws Exception {
        if (!value.matches("(?i)[0-9a-f]{64}")) throw new Exception("invalid SHA-256");
        return value.toLowerCase(Locale.ROOT);
    }

    private static long positiveLong(String value, String name) throws Exception {
        try {
            long parsed = Long.parseLong(value);
            if (parsed <= 0) throw new NumberFormatException();
            return parsed;
        } catch (NumberFormatException error) {
            throw new Exception("invalid " + name);
        }
    }
}
