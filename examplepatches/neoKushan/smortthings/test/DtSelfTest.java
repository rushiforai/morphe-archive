package biz.kushan.ltkey;

import java.io.ByteArrayOutputStream;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Base64;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.crypto.Cipher;
import javax.crypto.Mac;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/**
 * Standalone JDK self-test for the Android-free extraction core (DtCbor / DtStoreCrypto /
 * DtCredParser). Builds a synthetic `.datenc` with the exact native recipe, then asserts the
 * round-trip recovers the OwnerPSK/identity, and exercises the guard paths. No device needed.
 *
 *   javac -d out <core>/*.java test/DtSelfTest.java && java -cp out biz.kushan.ltkey.DtSelfTest
 */
public class DtSelfTest {
    static int pass = 0, fail = 0;

    public static void main(String[] args) throws Exception {
        byte[] key = new byte[32];
        new SecureRandom().nextBytes(key);

        String di = "11112222-3333-4444-5555-666677778888";
        String identity = "aaaa1111-bbbb-2222-cccc-333344445555";
        byte[] psk = hex("00112233445566778899aabbccddeeff"); // 16 bytes

        // --- happy path: inline "cred" map, single credtype:1 ---
        byte[] store = buildStore(di, identity, psk, false, false);
        byte[] datenc = encryptStore(key, store);
        List<DtCred> creds = DtCredParser.parse(DtStoreCrypto.decrypt(key, datenc));
        check("inline: one cred recovered", creds.size() == 1);
        if (!creds.isEmpty()) {
            check("inline: di matches", di.equals(creds.get(0).di));
            check("inline: identity matches", identity.equals(creds.get(0).identity));
            check("inline: psk hex matches", "00112233445566778899aabbccddeeff".equals(creds.get(0).pskHex));
        }

        // --- nested-bytestring "cred" variant ---
        byte[] store2 = buildStore(di, identity, psk, true, false);
        List<DtCred> creds2 = DtCredParser.parse(DtStoreCrypto.decrypt(key, encryptStore(key, store2)));
        check("nested: one cred recovered", creds2.size() == 1 && di.equals(creds2.get(0).di));

        // --- 32-byte PSK ---
        byte[] psk32 = new byte[32]; new SecureRandom().nextBytes(psk32);
        byte[] store32 = buildStore(di, identity, psk32, false, false);
        List<DtCred> creds32 = DtCredParser.parse(DtStoreCrypto.decrypt(key, encryptStore(key, store32)));
        check("32-byte psk recovered", creds32.size() == 1 && creds32.get(0).pskHex.length() == 64);

        // --- multiple creds (two devices, mixed with a non-PSK credtype:8) ---
        byte[] storeMulti = buildMultiStore(identity);
        List<DtCred> credsMulti = DtCredParser.parse(DtStoreCrypto.decrypt(key, encryptStore(key, storeMulti)));
        check("multi: only credtype:1 kept (2 of 3)", credsMulti.size() == 2);

        // --- GUARD: wrong key → HMAC failure (must throw, not return garbage) ---
        byte[] wrongKey = key.clone(); wrongKey[0] ^= 0xff;
        boolean threw = false;
        try { DtStoreCrypto.decrypt(wrongKey, datenc); } catch (SecurityException e) { threw = true; }
        check("guard: wrong key throws HMAC failure", threw);

        // --- GUARD: truncated file → throws ---
        boolean threw2 = false;
        try { DtStoreCrypto.decrypt(key, new byte[]{1, 2, 3}); } catch (Exception e) { threw2 = true; }
        check("guard: tiny file throws", threw2);

        // --- GUARD: store with no credtype:1 → empty, no throw ---
        byte[] noPsk = buildStore(di, identity, psk, false, true); // credtype forced to 8
        List<DtCred> none = DtCredParser.parse(DtStoreCrypto.decrypt(key, encryptStore(key, noPsk)));
        check("guard: no OwnerPSK → empty list", none.isEmpty());

        // --- GUARD: all-zero identity rejected ---
        byte[] zeroId = buildStore(di, "00000000-0000-0000-0000-000000000000", psk, false, false);
        List<DtCred> zero = DtCredParser.parse(DtStoreCrypto.decrypt(key, encryptStore(key, zeroId)));
        check("guard: all-zero identity rejected", zero.isEmpty());

        // --- GUARD: garbage plaintext parses to empty, never throws ---
        List<DtCred> garbage = DtCredParser.parse(new byte[]{(byte) 0xff, 0x00, 0x11});
        check("guard: garbage → empty list, no throw", garbage.isEmpty());

        // --- indefinite-length CBOR (how IoTivity actually encodes the SVR DB) ---
        byte[] indef = buildStoreIndef(di, identity, psk);
        List<DtCred> credsIndef = DtCredParser.parse(indef);
        check("indefinite-length CBOR: one cred recovered", credsIndef.size() == 1);
        if (!credsIndef.isEmpty()) {
            check("indefinite: di matches", di.equals(credsIndef.get(0).di));
            check("indefinite: identity matches", identity.equals(credsIndef.get(0).identity));
            check("indefinite: psk hex matches", "00112233445566778899aabbccddeeff".equals(credsIndef.get(0).pskHex));
        }

        System.out.println("\n" + pass + " passed, " + fail + " failed");
        if (fail > 0) System.exit(1);
    }

    // ---------- synthetic store builders (minimal CBOR encoder) ----------

    static byte[] buildStore(String di, String identity, byte[] psk, boolean nestCred, boolean forceCredtype8) {
        Map<Object, Object> priv = new LinkedHashMap<>();
        priv.put("encoding", "oic.sec.encoding.base64");
        priv.put("data", Base64.getEncoder().encodeToString(psk));

        Map<Object, Object> cred = new LinkedHashMap<>();
        cred.put("credtype", forceCredtype8 ? 8L : 1L);
        cred.put("subjectuuid", di);
        cred.put("privatedata", priv);

        List<Object> creds = new ArrayList<>();
        creds.add(cred);

        Map<Object, Object> credRes = new LinkedHashMap<>();
        credRes.put("creds", creds);
        credRes.put("rowneruuid", identity);

        Map<Object, Object> root = new LinkedHashMap<>();
        root.put("cred", nestCred ? encode(credRes) : credRes);  // nested → byte string of CBOR
        return encode(root);
    }

    static byte[] buildMultiStore(String identity) {
        List<Object> creds = new ArrayList<>();
        creds.add(credMap(1L, "dev-1-uuid", new byte[16]));
        creds.add(credMap(8L, "trust-ca-uuid", new byte[16])); // not a PSK
        creds.add(credMap(1L, "dev-2-uuid", new byte[16]));
        Map<Object, Object> credRes = new LinkedHashMap<>();
        credRes.put("creds", creds);
        credRes.put("rowneruuid", identity);
        Map<Object, Object> root = new LinkedHashMap<>();
        root.put("cred", credRes);
        return encode(root);
    }

    static Map<Object, Object> credMap(long type, String subject, byte[] psk) {
        Map<Object, Object> priv = new LinkedHashMap<>();
        priv.put("encoding", "oic.sec.encoding.base64");
        priv.put("data", Base64.getEncoder().encodeToString(psk));
        Map<Object, Object> cred = new LinkedHashMap<>();
        cred.put("credtype", type);
        cred.put("subjectuuid", subject);
        cred.put("privatedata", priv);
        return cred;
    }

    // ---------- encrypt with the exact psiDecrypt-compatible scheme ----------

    static byte[] encryptStore(byte[] key, byte[] plaintext) throws Exception {
        int L = plaintext.length;
        int nibble = L % 16;
        int ctLen = L + 16 - nibble;             // multiple of 16, >= 16
        byte[] padded = new byte[ctLen];
        System.arraycopy(plaintext, 0, padded, 0, L);

        byte[] iv = new byte[16];
        new SecureRandom().nextBytes(iv);
        iv[15] = (byte) ((iv[15] & 0xf0) | (nibble & 0x0f));

        Cipher c = Cipher.getInstance("AES/CBC/NoPadding");
        c.init(Cipher.ENCRYPT_MODE, new SecretKeySpec(key, "AES"), new IvParameterSpec(iv));
        byte[] ct = c.doFinal(padded);

        Mac hmac = Mac.getInstance("HmacSHA256");
        hmac.init(new SecretKeySpec(key, "HmacSHA256"));
        byte[] mac = hmac.doFinal(ct);

        ByteArrayOutputStream bo = new ByteArrayOutputStream();
        bo.write(iv); bo.write(ct); bo.write(mac);
        return bo.toByteArray();
    }

    // ---------- tiny CBOR encoder (test only) ----------

    @SuppressWarnings("unchecked")
    static byte[] encode(Object o) {
        ByteArrayOutputStream bo = new ByteArrayOutputStream();
        enc(bo, o);
        return bo.toByteArray();
    }

    @SuppressWarnings("unchecked")
    static void enc(ByteArrayOutputStream bo, Object o) {
        try {
            if (o instanceof Long) { head(bo, 0, (Long) o); }
            else if (o instanceof Integer) { head(bo, 0, ((Integer) o).longValue()); }
            else if (o instanceof String) {
                byte[] s = ((String) o).getBytes(java.nio.charset.StandardCharsets.UTF_8);
                head(bo, 3, s.length); bo.write(s);
            } else if (o instanceof byte[]) {
                byte[] s = (byte[]) o; head(bo, 2, s.length); bo.write(s);
            } else if (o instanceof List) {
                List<Object> l = (List<Object>) o; head(bo, 4, l.size());
                for (Object e : l) enc(bo, e);
            } else if (o instanceof Map) {
                Map<Object, Object> m = (Map<Object, Object>) o; head(bo, 5, m.size());
                for (Map.Entry<Object, Object> e : m.entrySet()) { enc(bo, e.getKey()); enc(bo, e.getValue()); }
            } else throw new IllegalArgumentException("unencodable: " + o);
        } catch (Exception e) { throw new RuntimeException(e); }
    }

    static void head(ByteArrayOutputStream bo, int major, long n) {
        int m = major << 5;
        if (n < 24) bo.write(m | (int) n);
        else if (n < 256) { bo.write(m | 24); bo.write((int) n); }
        else if (n < 65536) { bo.write(m | 25); bo.write((int) (n >> 8)); bo.write((int) (n & 0xff)); }
        else { bo.write(m | 26); bo.write((int) (n >> 24)); bo.write((int) (n >> 16)); bo.write((int) (n >> 8)); bo.write((int) n); }
    }

    // Build the store with INDEFINITE-length maps/arrays (0xBF map, 0x9F array, 0xFF break),
    // the way IoTivity encodes the SVR DB.
    static byte[] buildStoreIndef(String di, String identity, byte[] psk) {
        ByteArrayOutputStream bo = new ByteArrayOutputStream();
        bo.write(0xBF);                                  // root map (indefinite)
          es(bo, "cred");
          bo.write(0xBF);                                // cred resource map
            es(bo, "creds");
            bo.write(0x9F);                              // creds array (indefinite)
              bo.write(0xBF);                            // one cred entry
                es(bo, "credtype"); head(bo, 0, 1);
                es(bo, "subjectuuid"); es(bo, di);
                es(bo, "privatedata");
                bo.write(0xBF);
                  es(bo, "encoding"); es(bo, "oic.sec.encoding.base64");
                  es(bo, "data"); es(bo, Base64.getEncoder().encodeToString(psk));
                bo.write(0xFF);                          // break privatedata
              bo.write(0xFF);                            // break cred entry
            bo.write(0xFF);                              // break creds array
            es(bo, "rowneruuid"); es(bo, identity);
          bo.write(0xFF);                                // break cred resource
        bo.write(0xFF);                                  // break root
        return bo.toByteArray();
    }

    static void es(ByteArrayOutputStream bo, String s) {
        byte[] b = s.getBytes(java.nio.charset.StandardCharsets.UTF_8);
        head(bo, 3, b.length); bo.write(b, 0, b.length);
    }

    // ---------- helpers ----------
    static void check(String name, boolean ok) {
        System.out.println((ok ? "  PASS  " : "  FAIL  ") + name);
        if (ok) pass++; else fail++;
    }
    static byte[] hex(String s) {
        byte[] b = new byte[s.length() / 2];
        for (int i = 0; i < b.length; i++) b[i] = (byte) Integer.parseInt(s.substring(2 * i, 2 * i + 2), 16);
        return b;
    }
}
