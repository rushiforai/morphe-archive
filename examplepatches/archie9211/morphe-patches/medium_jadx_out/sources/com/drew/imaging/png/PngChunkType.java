package com.drew.imaging.png;

import com.drew.imaging.riff.pvS.uuLAxLN;
import defpackage.ay0;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class PngChunkType {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    public static final PngChunkType IDAT;
    public static final PngChunkType IEND;
    public static final PngChunkType IHDR;
    public static final PngChunkType PLTE;
    private static final Set<String> _identifiersAllowingMultiples = new HashSet(Arrays.asList("IDAT", "sPLT", "iTXt", "tEXt", "zTXt"));
    public static final PngChunkType bKGD;
    public static final PngChunkType cHRM;
    public static final PngChunkType eXIf;
    public static final PngChunkType gAMA;
    public static final PngChunkType hIST;
    public static final PngChunkType iCCP;
    public static final PngChunkType iTXt;
    public static final PngChunkType pHYs;
    public static final PngChunkType sBIT;
    public static final PngChunkType sPLT;
    public static final PngChunkType sRGB;
    public static final PngChunkType tEXt;
    public static final PngChunkType tIME;
    public static final PngChunkType tRNS;
    public static final PngChunkType zTXt;
    private final byte[] _bytes;
    private final boolean _multipleAllowed;

    public PngChunkType(String str, boolean z) throws PngProcessingException {
        this._multipleAllowed = z;
        try {
            byte[] bytes = str.getBytes("ASCII");
            validateBytes(bytes);
            this._bytes = bytes;
        } catch (UnsupportedEncodingException unused) {
            ay0.e("Unable to convert string code to bytes.");
            throw null;
        }
    }

    private static boolean isLowerCase(byte b) {
        return (b & 32) != 0;
    }

    private static boolean isUpperCase(byte b) {
        return (b & 32) == 0;
    }

    private static boolean isValidByte(byte b) {
        if (b < 65 || b > 90) {
            return b >= 97 && b <= 122;
        }
        return true;
    }

    private static void validateBytes(byte[] bArr) throws PngProcessingException {
        if (bArr.length != 4) {
            throw new PngProcessingException("PNG chunk type identifier must be four bytes in length", null);
        }
        for (byte b : bArr) {
            if (!isValidByte(b)) {
                throw new PngProcessingException("PNG chunk type identifier may only contain alphabet characters", null);
            }
        }
    }

    public final boolean areMultipleAllowed() {
        return this._multipleAllowed;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        return Arrays.equals(this._bytes, ((PngChunkType) obj)._bytes);
    }

    public final String getIdentifier() {
        try {
            return new String(this._bytes, "ASCII");
        } catch (UnsupportedEncodingException unused) {
            return "Invalid object instance";
        }
    }

    public final int hashCode() {
        return Arrays.hashCode(this._bytes);
    }

    public final boolean isAncillary() {
        return !isCritical();
    }

    public final boolean isCritical() {
        return isUpperCase(this._bytes[0]);
    }

    public final boolean isPrivate() {
        return isUpperCase(this._bytes[1]);
    }

    public final boolean isSafeToCopy() {
        return isLowerCase(this._bytes[3]);
    }

    public final String toString() {
        return getIdentifier();
    }

    static {
        try {
            IHDR = new PngChunkType("IHDR", false);
            PLTE = new PngChunkType("PLTE", false);
            IDAT = new PngChunkType("IDAT", true);
            IEND = new PngChunkType("IEND", false);
            cHRM = new PngChunkType("cHRM", false);
            gAMA = new PngChunkType("gAMA", false);
            iCCP = new PngChunkType("iCCP", false);
            sBIT = new PngChunkType("sBIT", false);
            sRGB = new PngChunkType(uuLAxLN.MqhMKYGjvSTp, false);
            bKGD = new PngChunkType("bKGD", false);
            hIST = new PngChunkType("hIST", false);
            tRNS = new PngChunkType("tRNS", false);
            pHYs = new PngChunkType("pHYs", false);
            sPLT = new PngChunkType("sPLT", true);
            tIME = new PngChunkType("tIME", false);
            iTXt = new PngChunkType("iTXt", true);
            tEXt = new PngChunkType("tEXt", true);
            zTXt = new PngChunkType("zTXt", true);
            eXIf = new PngChunkType("eXIf", false);
        } catch (PngProcessingException e) {
            throw new IllegalArgumentException(e);
        }
    }

    public PngChunkType(String str) {
        this(str, false);
    }

    public PngChunkType(byte[] bArr) throws PngProcessingException {
        validateBytes(bArr);
        this._bytes = bArr;
        this._multipleAllowed = _identifiersAllowingMultiples.contains(getIdentifier());
    }
}
