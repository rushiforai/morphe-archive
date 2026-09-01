package com.drew.metadata.exif.makernotes;

import com.drew.metadata.Directory;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class DjiMakernoteDirectory extends Directory {
    public static final int TAG_AIRCRAFT_PITCH = 6;
    public static final int TAG_AIRCRAFT_ROLL = 8;
    public static final int TAG_AIRCRAFT_YAW = 7;
    public static final int TAG_CAMERA_PITCH = 9;
    public static final int TAG_CAMERA_ROLL = 11;
    public static final int TAG_CAMERA_YAW = 10;
    public static final int TAG_MAKE = 1;
    public static final int TAG_SPEED_X = 3;
    public static final int TAG_SPEED_Y = 4;
    public static final int TAG_SPEED_Z = 5;
    private static final HashMap<Integer, String> _tagNameMap;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(1, map, "Make", 3, "Aircraft X Speed");
        lv8.x(4, map, "Aircraft Y Speed", 5, "Aircraft Z Speed");
        lv8.x(6, map, "Aircraft Pitch", 7, "Aircraft Yaw");
        lv8.x(8, map, "Aircraft Roll", 9, "Camera Pitch");
        lv8.x(10, map, "Camera Yaw", 11, "Camera Roll");
    }

    public DjiMakernoteDirectory() {
        setDescriptor(new DjiMakernoteDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "DJI Makernote";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }
}
