package app.template.extension.extension;

import android.util.Base64;
import java.nio.ByteBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;

/** Show text as text, known hardware addresses as MAC addresses, and other bytes as hex. */
public final class SnmpValueFormatter {
    private static final String HEX = "0123456789abcdef";

    public static String format(byte[] response, String oid) {
        if (response == null) return "Not recorded";
        OidDictionary.Entry entry = OidDictionary.lookup(oid);
        String encoded = new String(response, StandardCharsets.UTF_8);
        String raw = formatValue(encoded, entry);
        String meaning = entry == null ? null : entry.valueMeaning(encoded);
        return meaning == null ? raw : raw + " (" + meaning + ")";
    }

    public static String format(byte[] response) {
        return response == null ? "Not recorded" :
                formatValue(new String(response, StandardCharsets.UTF_8), null);
    }

    private static String formatValue(String encoded, OidDictionary.Entry entry) {
        if (encoded.startsWith("integer:")) return encoded.substring(8);
        if (encoded.startsWith("missing:")) return "No such object";
        if (!encoded.startsWith("octets:")) return encoded;

        byte[] data;
        try {
            data = Base64.decode(encoded.substring(7), Base64.DEFAULT);
        } catch (IllegalArgumentException e) {
            return "Invalid byte encoding";
        }
        if (data.length == 6 && entry != null && isHardwareAddress(entry.symbol)) {
            return hex(data, ':');
        }
        if (data.length == 0) return "Empty response";
        try {
            String value = StandardCharsets.UTF_8.newDecoder()
                    .onMalformedInput(CodingErrorAction.REPORT)
                    .onUnmappableCharacter(CodingErrorAction.REPORT)
                    .decode(ByteBuffer.wrap(data)).toString();
            if (value.codePoints().noneMatch(c -> Character.isISOControl(c)
                    && c != '\n' && c != '\r' && c != '\t')) return value;
        } catch (CharacterCodingException ignored) {
            // A byte string need not represent text.
        }
        return "Hex: " + hex(data, ' ');
    }

    private static boolean isHardwareAddress(String symbol) {
        switch (symbol) {
            case "ifPhysAddress":
            case "brotherLanMac":
            case "brotherWlanMac":
            case "brotherWidiMac":
                return true;
            default:
                return false;
        }
    }

    private static String hex(byte[] data, char separator) {
        StringBuilder value = new StringBuilder(data.length * 3);
        for (byte b : data) {
            if (value.length() != 0) value.append(separator);
            value.append(HEX.charAt((b & 0xff) >>> 4)).append(HEX.charAt(b & 0x0f));
        }
        return value.toString();
    }

    private SnmpValueFormatter() {}
}
