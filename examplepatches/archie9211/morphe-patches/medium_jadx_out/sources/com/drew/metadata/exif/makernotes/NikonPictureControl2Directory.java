package com.drew.metadata.exif.makernotes;

import com.drew.lang.Charsets;
import com.drew.lang.SequentialByteArrayReader;
import com.drew.metadata.Directory;
import defpackage.ay0;
import defpackage.lv8;
import java.nio.charset.Charset;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class NikonPictureControl2Directory extends Directory {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    public static final int TAG_BRIGHTNESS = 57;
    public static final int TAG_CLARITY = 53;
    public static final int TAG_CONTRAST = 55;
    public static final int TAG_FILTER_EFFECT = 63;
    public static final int TAG_HUE = 61;
    private static final HashMap<Integer, String> TAG_NAME_MAP;
    public static final int TAG_PICTURE_CONTROL_ADJUST = 48;
    public static final int TAG_PICTURE_CONTROL_BASE = 24;
    public static final int TAG_PICTURE_CONTROL_NAME = 4;
    public static final int TAG_PICTURE_CONTROL_QUICK_ADJUST = 49;
    public static final int TAG_PICTURE_CONTROL_VERSION = 0;
    public static final int TAG_SATURATION = 59;
    public static final int TAG_SHARPNESS = 51;
    public static final int TAG_TONING_EFFECT = 64;
    public static final int TAG_TONING_SATURATION = 65;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        TAG_NAME_MAP = map;
        lv8.x(0, map, "Picture Control Version", 4, "Picture Control Name");
        lv8.x(24, map, "Picture Control Base", 48, "Picture Control Adjust");
        lv8.x(49, map, "Picture Control Quick Adjust", 51, "Sharpness");
        lv8.x(53, map, "Clarity", 55, "Contrast");
        lv8.x(57, map, "Brightness", 59, "Saturation");
        lv8.x(61, map, "Hue", 63, "Filter Effect");
        lv8.x(64, map, "Toning Effect", 65, "Toning Saturation");
    }

    public NikonPictureControl2Directory() {
        setDescriptor(new NikonPictureControl2Descriptor(this));
    }

    public static NikonPictureControl2Directory read(byte[] bArr) {
        if (bArr.length != 68) {
            ay0.e("Must have 68 bytes.");
            return null;
        }
        SequentialByteArrayReader sequentialByteArrayReader = new SequentialByteArrayReader(bArr, 0);
        NikonPictureControl2Directory nikonPictureControl2Directory = new NikonPictureControl2Directory();
        Charset charset = Charsets.UTF_8;
        nikonPictureControl2Directory.setObject(0, sequentialByteArrayReader.getNullTerminatedStringValue(4, charset, true));
        nikonPictureControl2Directory.setObject(4, sequentialByteArrayReader.getNullTerminatedStringValue(20, charset, true));
        nikonPictureControl2Directory.setObject(24, sequentialByteArrayReader.getNullTerminatedStringValue(20, charset, true));
        sequentialByteArrayReader.skip(4L);
        nikonPictureControl2Directory.setObject(48, Byte.valueOf(sequentialByteArrayReader.getByte()));
        nikonPictureControl2Directory.setObject(49, Byte.valueOf(sequentialByteArrayReader.getByte()));
        sequentialByteArrayReader.skip(1L);
        nikonPictureControl2Directory.setObject(51, Byte.valueOf(sequentialByteArrayReader.getByte()));
        sequentialByteArrayReader.skip(1L);
        nikonPictureControl2Directory.setObject(53, Byte.valueOf(sequentialByteArrayReader.getByte()));
        sequentialByteArrayReader.skip(1L);
        nikonPictureControl2Directory.setObject(55, Byte.valueOf(sequentialByteArrayReader.getByte()));
        sequentialByteArrayReader.skip(1L);
        nikonPictureControl2Directory.setObject(57, Byte.valueOf(sequentialByteArrayReader.getByte()));
        sequentialByteArrayReader.skip(1L);
        nikonPictureControl2Directory.setObject(59, Byte.valueOf(sequentialByteArrayReader.getByte()));
        sequentialByteArrayReader.skip(1L);
        nikonPictureControl2Directory.setObject(61, Byte.valueOf(sequentialByteArrayReader.getByte()));
        sequentialByteArrayReader.skip(1L);
        nikonPictureControl2Directory.setObject(63, Byte.valueOf(sequentialByteArrayReader.getByte()));
        nikonPictureControl2Directory.setObject(64, Byte.valueOf(sequentialByteArrayReader.getByte()));
        nikonPictureControl2Directory.setObject(65, Byte.valueOf(sequentialByteArrayReader.getByte()));
        sequentialByteArrayReader.skip(2L);
        return nikonPictureControl2Directory;
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Nikon PictureControl 2";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return TAG_NAME_MAP;
    }
}
