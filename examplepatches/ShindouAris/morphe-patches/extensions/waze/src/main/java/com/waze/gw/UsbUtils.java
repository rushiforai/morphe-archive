package com.waze.gw;

import android.hardware.usb.UsbDeviceConnection;
import android.hardware.usb.UsbRequest;
import java.util.ArrayList;

/** Small subset of usb-serial-for-android utility helpers needed by CDC-ACM. */
final class UsbUtils {
    interface Supplier<T> { T get(); }
    private UsbUtils() { }

    static ArrayList<byte[]> getDescriptors(UsbDeviceConnection connection) {
        ArrayList<byte[]> result = new ArrayList<byte[]>();
        if (connection == null) return result;
        byte[] raw;
        try { raw = connection.getRawDescriptors(); }
        catch (Throwable ignored) { raw = null; }
        if (raw == null) return result;
        int offset = 0;
        while (offset + 2 <= raw.length) {
            int length = raw[offset] & 0xFF;
            if (length < 2 || offset + length > raw.length) break;
            result.add(copyAt(raw, offset, length));
            offset += length;
        }
        return result;
    }

    private static byte[] copyAt(byte[] source, int offset, int length) {
        byte[] result = new byte[length];
        System.arraycopy(source, offset, result, 0, length);
        return result;
    }
}
