package com.drew.lang;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ByteConvert {
    public static int toInt32BigEndian(byte[] bArr) {
        return (bArr[3] & 255) | ((bArr[0] << 24) & (-16777216)) | ((bArr[1] << 16) & 16711680) | ((bArr[2] << 8) & 65280);
    }

    public static int toInt32LittleEndian(byte[] bArr) {
        return ((bArr[3] << 24) & (-16777216)) | (bArr[0] & 255) | ((bArr[1] << 8) & 65280) | ((bArr[2] << 16) & 16711680);
    }
}
