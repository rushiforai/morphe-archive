package com.drew.metadata.exif.makernotes;

import com.drew.lang.ByteArrayReader;
import defpackage.lv8;
import java.io.IOException;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class SonyTag9050bDirectory extends SonyEncodedDataDirectoryBase {
    public static final int TAG_APS_C_SIZE_CAPTURE = 276;
    public static final int TAG_DISTORTION_CORR_PARAMS_PRESENT = 267;
    public static final int TAG_FLASH_STATUS = 57;
    public static final int TAG_INTERNAL_SERIAL_NUMBER = 136;
    public static final int TAG_LENS_FORMAT = 262;
    public static final int TAG_LENS_MOUNT = 261;
    public static final int TAG_LENS_SPEC_FEATURES = 278;
    public static final int TAG_LENS_TYPE_2 = 263;
    public static final int TAG_RELEASE_MODE_2 = 109;
    public static final int TAG_SHUTTER = 38;
    public static final int TAG_SHUTTER_COUNT = 58;
    public static final int TAG_SHUTTER_COUNT_3 = 415;
    public static final int TAG_SONY_EXPOSURE_TIME = 70;
    public static final int TAG_SONY_F_NUMBER = 72;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(38, map, "Shutter", 57, "Flash Status");
        lv8.x(58, map, "Shutter Count", 70, "Sony Exposure Time");
        lv8.x(72, map, "Sony F Number", 109, "Release Mode 2");
        lv8.x(136, map, "Internal Serial Number", 261, "Lens Mount");
        lv8.x(262, map, "Lens Format", 263, "Lens Type 2");
        lv8.x(267, map, "Distortion Corr Params Present", 276, "APS-C Size Capture");
        lv8.x(278, map, "Lens Spec Features", TAG_SHUTTER_COUNT_3, "Shutter Count 3");
    }

    public SonyTag9050bDirectory() {
        setDescriptor(new SonyTag9050bDescriptor(this));
    }

    public static SonyTag9050bDirectory read(byte[] bArr) {
        SonyTag9050bDirectory sonyTag9050bDirectory = new SonyTag9050bDirectory();
        try {
            SonyEncodedDataDirectoryBase.decipherInPlace(bArr);
            ByteArrayReader byteArrayReader = new ByteArrayReader(bArr, 0);
            byteArrayReader.setMotorolaByteOrder(false);
            sonyTag9050bDirectory.setObject(38, new int[]{byteArrayReader.getUInt16(38), byteArrayReader.getUInt16(40), byteArrayReader.getUInt16(42)});
            sonyTag9050bDirectory.setInt(57, byteArrayReader.getUInt8(57));
            sonyTag9050bDirectory.setLong(58, byteArrayReader.getUInt32(58));
            float fPow = (float) Math.pow(2.0d, 16 - (byteArrayReader.getUInt16(70) / 256));
            new DecimalFormat("0.#############").setRoundingMode(RoundingMode.HALF_UP);
            sonyTag9050bDirectory.setFloat(70, fPow);
            sonyTag9050bDirectory.setInt(72, byteArrayReader.getUInt16(72));
            sonyTag9050bDirectory.setObject(136, new int[]{byteArrayReader.getUInt8(136), byteArrayReader.getUInt8(137), byteArrayReader.getUInt8(138), byteArrayReader.getUInt8(NikonType2MakernoteDirectory.TAG_LENS_STOPS), byteArrayReader.getUInt8(140), byteArrayReader.getUInt8(141)});
            sonyTag9050bDirectory.setInt(261, byteArrayReader.getUInt8(261));
            sonyTag9050bDirectory.setInt(262, byteArrayReader.getUInt8(262));
            sonyTag9050bDirectory.setInt(263, byteArrayReader.getUInt16(263));
            sonyTag9050bDirectory.setInt(267, byteArrayReader.getUInt8(267));
            sonyTag9050bDirectory.setInt(276, byteArrayReader.getUInt8(276));
            sonyTag9050bDirectory.setObject(276, byteArrayReader.getBytes(278, 2));
            return sonyTag9050bDirectory;
        } catch (IOException e) {
            sonyTag9050bDirectory.addError(e.getMessage());
            return sonyTag9050bDirectory;
        }
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Sony 9050B";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
