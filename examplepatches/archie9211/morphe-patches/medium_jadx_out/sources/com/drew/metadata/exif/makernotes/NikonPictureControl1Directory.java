package com.drew.metadata.exif.makernotes;

import com.drew.lang.Charsets;
import com.drew.lang.SequentialByteArrayReader;
import com.drew.metadata.Directory;
import defpackage.ay0;
import defpackage.lv8;
import java.io.EOFException;
import java.nio.charset.Charset;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class NikonPictureControl1Directory extends Directory {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    public static final int TAG_BRIGHTNESS = 52;
    public static final int TAG_CONTRAST = 51;
    public static final int TAG_FILTER_EFFECT = 55;
    public static final int TAG_HUE_ADJUSTMENT = 54;
    private static final HashMap<Integer, String> TAG_NAME_MAP;
    public static final int TAG_PICTURE_CONTROL_ADJUST = 48;
    public static final int TAG_PICTURE_CONTROL_BASE = 24;
    public static final int TAG_PICTURE_CONTROL_NAME = 4;
    public static final int TAG_PICTURE_CONTROL_QUICK_ADJUST = 49;
    public static final int TAG_PICTURE_CONTROL_VERSION = 0;
    public static final int TAG_SATURATION = 53;
    public static final int TAG_SHARPNESS = 50;
    public static final int TAG_TONING_EFFECT = 56;
    public static final int TAG_TONING_SATURATION = 57;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        TAG_NAME_MAP = map;
        lv8.x(0, map, "Picture Control Version", 4, "Picture Control Name");
        lv8.x(24, map, "Picture Control Base", 48, "Picture Control Adjust");
        lv8.x(49, map, "Picture Control Quick Adjust", 50, "Sharpness");
        lv8.x(51, map, "Contrast", 52, "Brightness");
        lv8.x(53, map, "Saturation", 54, "Hue Adjustment");
        lv8.x(55, map, "Filter Effect", 56, "Toning Effect");
        map.put(57, "Toning Saturation");
    }

    public NikonPictureControl1Directory() {
        setDescriptor(new NikonPictureControl1Descriptor(this));
    }

    public static NikonPictureControl1Directory read(byte[] bArr) throws EOFException {
        if (bArr.length != 58) {
            ay0.e("Must have 58 bytes.");
            return null;
        }
        SequentialByteArrayReader sequentialByteArrayReader = new SequentialByteArrayReader(bArr, 0);
        NikonPictureControl1Directory nikonPictureControl1Directory = new NikonPictureControl1Directory();
        Charset charset = Charsets.UTF_8;
        nikonPictureControl1Directory.setObject(0, sequentialByteArrayReader.getNullTerminatedStringValue(4, charset, true));
        nikonPictureControl1Directory.setObject(4, sequentialByteArrayReader.getNullTerminatedStringValue(20, charset, true));
        nikonPictureControl1Directory.setObject(24, sequentialByteArrayReader.getNullTerminatedStringValue(20, charset, true));
        sequentialByteArrayReader.skip(4L);
        nikonPictureControl1Directory.setObject(48, Short.valueOf(sequentialByteArrayReader.getUInt8()));
        nikonPictureControl1Directory.setObject(49, Short.valueOf(sequentialByteArrayReader.getUInt8()));
        nikonPictureControl1Directory.setObject(50, Short.valueOf(sequentialByteArrayReader.getUInt8()));
        nikonPictureControl1Directory.setObject(51, Short.valueOf(sequentialByteArrayReader.getUInt8()));
        nikonPictureControl1Directory.setObject(52, Short.valueOf(sequentialByteArrayReader.getUInt8()));
        nikonPictureControl1Directory.setObject(53, Short.valueOf(sequentialByteArrayReader.getUInt8()));
        nikonPictureControl1Directory.setObject(54, Short.valueOf(sequentialByteArrayReader.getUInt8()));
        nikonPictureControl1Directory.setObject(55, Short.valueOf(sequentialByteArrayReader.getUInt8()));
        nikonPictureControl1Directory.setObject(56, Short.valueOf(sequentialByteArrayReader.getUInt8()));
        nikonPictureControl1Directory.setObject(57, Short.valueOf(sequentialByteArrayReader.getUInt8()));
        return nikonPictureControl1Directory;
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Nikon PictureControl 1";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return TAG_NAME_MAP;
    }
}
