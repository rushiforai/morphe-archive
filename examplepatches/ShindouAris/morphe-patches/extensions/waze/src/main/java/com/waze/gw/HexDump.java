package com.waze.gw;

/** Minimal hex formatter used only for optional CDC descriptor logging. */
final class HexDump {
    private static final char[] HEX = "0123456789ABCDEF".toCharArray();
    private HexDump() { }
    static String toHexString(byte[] data) {
        if (data == null) return "";
        char[] out = new char[data.length * 2];
        for (int i = 0; i < data.length; i++) {
            int v = data[i] & 0xFF;
            out[i * 2] = HEX[v >>> 4];
            out[i * 2 + 1] = HEX[v & 0x0F];
        }
        return new String(out);
    }
}
