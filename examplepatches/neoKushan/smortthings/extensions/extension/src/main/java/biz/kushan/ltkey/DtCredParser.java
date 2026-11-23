package biz.kushan.ltkey;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Map;

/**
 * Parses a decrypted OCF SVR-DB (CBOR) and pulls every usable OwnerPSK (`credtype == 1`).
 *
 * Layout (OCF /oic/sec/cred): outer map → {@code "cred"} (which may itself be a CBOR byte string
 * that must be decoded again) → map with {@code "creds"} (array) and {@code "rowneruuid"} (the
 * cred-resource owner UUID = the PSK identity). Each cred map: {@code credtype} (1 = symmetric
 * PSK), {@code subjectuuid} (= device di), {@code privatedata} = {@code {encoding, data(base64)}}.
 *
 * Every record is validated independently; a malformed one is skipped, not fatal. Android-free.
 */
final class DtCredParser {

    /** @return all well-formed OwnerPSK creds found (possibly empty). Never throws on per-record issues. */
    static List<DtCred> parse(byte[] plaintextCbor) {
        List<DtCred> out = new ArrayList<>();
        try {
            Object root = DtCbor.decode(plaintextCbor);
            Object credVal = asMap(root).get("cred");

            // "cred" may be an inline map or a nested CBOR byte string.
            Map<Object, Object> credRes;
            if (credVal instanceof byte[]) credRes = asMap(DtCbor.decode((byte[]) credVal));
            else credRes = asMap(credVal);

            String identity = asString(credRes.get("rowneruuid"));
            Object credsObj = credRes.get("creds");
            if (!(credsObj instanceof List)) return out;

            for (Object entry : (List<?>) credsObj) {
                try {
                    DtCred c = parseOne(entry, identity);
                    if (c != null) out.add(c);
                } catch (Exception perRecord) {
                    // skip just this record
                }
            }
        } catch (Exception e) {
            // not a valid store shape → return whatever we have (likely empty)
        }
        return out;
    }

    private static DtCred parseOne(Object entry, String resourceIdentity) {
        Map<Object, Object> cred = asMap(entry);

        Long credtype = asLong(cred.get("credtype"));
        if (credtype == null || credtype != 1L) return null;                  // OwnerPSK only

        String di = asString(cred.get("subjectuuid"));
        if (di == null || di.isEmpty()) return null;

        Map<Object, Object> priv = asMap(cred.get("privatedata"));
        String encoding = asString(priv.get("encoding"));
        if (encoding == null || encoding.indexOf("base64") < 0) return null;  // only base64 encoding
        String dataB64 = asString(priv.get("data"));
        if (dataB64 == null || dataB64.isEmpty()) return null;

        byte[] psk = Base64.getDecoder().decode(dataB64.trim());
        if (psk.length != 16 && psk.length != 32) return null;               // 128- or 256-bit PSK

        // Identity = cred-resource rowneruuid. Reject absent / all-zero.
        if (resourceIdentity == null || resourceIdentity.isEmpty()) return null;
        if (isAllZeroUuid(resourceIdentity)) return null;

        return new DtCred(di, resourceIdentity, toHex(psk));
    }

    // ---- tolerant accessors (throw only on truly wrong shapes caught by callers) ----
    @SuppressWarnings("unchecked")
    private static Map<Object, Object> asMap(Object o) {
        if (o instanceof Map) return (Map<Object, Object>) o;
        throw new IllegalArgumentException("expected map");
    }
    private static String asString(Object o) { return (o instanceof String) ? (String) o : null; }
    private static Long asLong(Object o) { return (o instanceof Long) ? (Long) o : null; }

    private static boolean isAllZeroUuid(String s) {
        for (int i = 0; i < s.length(); i++) {
            char ch = s.charAt(i);
            if (ch != '0' && ch != '-') return false;
        }
        return true;
    }

    private static String toHex(byte[] a) {
        StringBuilder sb = new StringBuilder(a.length * 2);
        for (byte x : a) {
            sb.append(Character.forDigit((x >> 4) & 0xf, 16));
            sb.append(Character.forDigit(x & 0xf, 16));
        }
        return sb.toString();
    }
}
