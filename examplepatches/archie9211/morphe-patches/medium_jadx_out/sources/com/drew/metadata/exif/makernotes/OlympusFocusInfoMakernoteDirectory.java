package com.drew.metadata.exif.makernotes;

import com.drew.metadata.Directory;
import com.medium.android.common.ui.Ezz.Plbho;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class OlympusFocusInfoMakernoteDirectory extends Directory {
    public static final int TagAfInfo = 808;
    public static final int TagAfPoint = 776;
    public static final int TagAutoFocus = 521;
    public static final int TagExternalFlash = 4609;
    public static final int TagExternalFlashBounce = 4612;
    public static final int TagExternalFlashGuideNumber = 4611;
    public static final int TagExternalFlashZoom = 4613;
    public static final int TagFocusDistance = 773;
    public static final int TagFocusInfoVersion = 0;
    public static final int TagFocusStepCount = 769;
    public static final int TagFocusStepInfinity = 771;
    public static final int TagFocusStepNear = 772;
    public static final int TagImageStabilization = 5632;
    public static final int TagInternalFlash = 4616;
    public static final int TagMacroLed = 4618;
    public static final int TagManualFlash = 4617;
    public static final int TagSceneArea = 529;
    public static final int TagSceneDetect = 528;
    public static final int TagSceneDetectData = 530;
    public static final int TagSensorTemperature = 5376;
    public static final int TagZoomStepCount = 768;
    private static final HashMap<Integer, String> _tagNameMap;

    public OlympusFocusInfoMakernoteDirectory() {
        setDescriptor(new OlympusFocusInfoMakernoteDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "Olympus Focus Info";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(0, map, "Focus Info Version", 521, "Auto Focus");
        lv8.x(528, map, "Scene Detect", 529, "Scene Area");
        lv8.x(530, map, "Scene Detect Data", 768, "Zoom Step Count");
        lv8.x(769, map, "Focus Step Count", 771, "Focus Step Infinity");
        lv8.x(772, map, "Focus Step Near", 773, "Focus Distance");
        lv8.x(TagAfPoint, map, Plbho.CfWHsohEyBkRR, TagAfInfo, "AF Info");
        lv8.x(4609, map, "External Flash", 4611, "External Flash Guide Number");
        lv8.x(TagExternalFlashBounce, map, "External Flash Bounce", TagExternalFlashZoom, "External Flash Zoom");
        lv8.x(TagInternalFlash, map, "Internal Flash", TagManualFlash, "Manual Flash");
        lv8.x(TagMacroLed, map, "Macro LED", TagSensorTemperature, "Sensor Temperature");
        map.put(Integer.valueOf(TagImageStabilization), "Image Stabilization");
    }
}
