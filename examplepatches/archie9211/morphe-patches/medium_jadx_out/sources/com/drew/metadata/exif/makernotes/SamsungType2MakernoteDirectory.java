package com.drew.metadata.exif.makernotes;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class SamsungType2MakernoteDirectory extends Directory {
    public static final int TagCameraTemperature = 67;
    public static final int TagColorSpace = 40977;
    public static final int TagDeviceType = 2;
    public static final int TagEncryptionKey = 40992;
    public static final int TagExposureCompensation = 40979;
    public static final int TagExposureTime = 40984;
    public static final int TagFNumber = 40985;
    public static final int TagFaceDetect = 256;
    public static final int TagFaceName = 291;
    public static final int TagFaceRecognition = 288;
    public static final int TagFirmwareName = 40961;
    public static final int TagFocalLengthIn35mmFormat = 40986;
    public static final int TagISO = 40980;
    public static final int TagInternalLensSerialNumber = 40965;
    public static final int TagLensFirmware = 40964;
    public static final int TagLensType = 40963;
    public static final int TagLocalLocationName = 48;
    public static final int TagMakerNoteVersion = 1;
    public static final int TagOrientationInfo = 17;
    public static final int TagPictureWizard = 33;
    public static final int TagPreviewIfd = 53;
    public static final int TagRawDataByteOrder = 64;
    public static final int TagRawDataCFAPattern = 80;
    public static final int TagSamsungModelId = 3;
    public static final int TagSensorAreas = 40976;
    public static final int TagSerialNumber = 40962;
    public static final int TagSmartAlbumColor = 32;
    public static final int TagSmartRange = 40978;
    public static final int TagWhiteBalanceSetup = 65;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(1, map, "Maker Note Version", 2, "Device Type");
        lv8.x(3, map, "Model Id", 17, "Orientation Info");
        lv8.x(32, map, "Smart Album Color", 33, "Picture Wizard");
        lv8.x(48, map, "Local Location Name", 53, "Preview IFD");
        lv8.x(64, map, "Raw Data Byte Order", 65, "White Balance Setup");
        lv8.x(67, map, "Camera Temperature", 80, "Raw Data CFA Pattern");
        lv8.x(256, map, "Face Detect", 288, "Face Recognition");
        lv8.x(291, map, "Face Name", 40961, "Firmware Name");
        lv8.x(40962, map, "Serial Number", 40963, "Lens Type");
        lv8.x(40964, map, "Lens Firmware", 40965, "Internal Lens Serial Number");
        lv8.x(TagSensorAreas, map, "Sensor Areas", TagColorSpace, "Color Space");
        lv8.x(TagSmartRange, map, "Smart Range", TagExposureCompensation, "Exposure Compensation");
        lv8.x(TagISO, map, "ISO", TagExposureTime, "Exposure Time");
        lv8.x(TagFNumber, map, "F-Number", TagFocalLengthIn35mmFormat, "Focal Length in 35mm Format");
        map.put(Integer.valueOf(TagEncryptionKey), "Encryption Key");
    }

    public SamsungType2MakernoteDirectory() {
        setDescriptor(new SamsungType2MakernoteDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Samsung Makernote";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
