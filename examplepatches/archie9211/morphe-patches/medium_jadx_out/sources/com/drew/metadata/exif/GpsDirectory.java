package com.drew.metadata.exif;

import com.drew.lang.GeoLocation;
import com.drew.lang.Rational;
import com.medium.android.core.fragments.KB.JWcjNoweKCnTr;
import com.medium.android.profile.ui.premium.cfCC.mgKMENwrbHf;
import defpackage.lv8;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import sprig.g.Hq.fiHTiFJ;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class GpsDirectory extends ExifDirectoryBase {
    public static final int TAG_ALTITUDE = 6;
    public static final int TAG_ALTITUDE_REF = 5;
    public static final int TAG_AREA_INFORMATION = 28;
    public static final int TAG_DATE_STAMP = 29;
    public static final int TAG_DEST_BEARING = 24;
    public static final int TAG_DEST_BEARING_REF = 23;
    public static final int TAG_DEST_DISTANCE = 26;
    public static final int TAG_DEST_DISTANCE_REF = 25;
    public static final int TAG_DEST_LATITUDE = 20;
    public static final int TAG_DEST_LATITUDE_REF = 19;
    public static final int TAG_DEST_LONGITUDE = 22;
    public static final int TAG_DEST_LONGITUDE_REF = 21;
    public static final int TAG_DIFFERENTIAL = 30;
    public static final int TAG_DOP = 11;
    public static final int TAG_H_POSITIONING_ERROR = 31;
    public static final int TAG_IMG_DIRECTION = 17;
    public static final int TAG_IMG_DIRECTION_REF = 16;
    public static final int TAG_LATITUDE = 2;
    public static final int TAG_LATITUDE_REF = 1;
    public static final int TAG_LONGITUDE = 4;
    public static final int TAG_LONGITUDE_REF = 3;
    public static final int TAG_MAP_DATUM = 18;
    public static final int TAG_MEASURE_MODE = 10;
    public static final int TAG_PROCESSING_METHOD = 27;
    public static final int TAG_SATELLITES = 8;
    public static final int TAG_SPEED = 13;
    public static final int TAG_SPEED_REF = 12;
    public static final int TAG_STATUS = 9;
    public static final int TAG_TIME_STAMP = 7;
    public static final int TAG_TRACK = 15;
    public static final int TAG_TRACK_REF = 14;
    public static final int TAG_VERSION_ID = 0;
    private static final HashMap<Integer, String> _tagNameMap;

    public GpsDirectory() {
        setDescriptor(new GpsDescriptor(this));
    }

    public final GeoLocation getGeoLocation() {
        Rational[] rationalArray = getRationalArray(2);
        Rational[] rationalArray2 = getRationalArray(4);
        String string = getString(1);
        String string2 = getString(3);
        if (rationalArray != null && rationalArray.length == 3 && rationalArray2 != null && rationalArray2.length == 3 && string != null && string2 != null) {
            Double dDegreesMinutesSecondsToDecimal = GeoLocation.degreesMinutesSecondsToDecimal(rationalArray[0], rationalArray[1], rationalArray[2], string.equalsIgnoreCase(JWcjNoweKCnTr.uxAhmRECqRhCinu));
            Double dDegreesMinutesSecondsToDecimal2 = GeoLocation.degreesMinutesSecondsToDecimal(rationalArray2[0], rationalArray2[1], rationalArray2[2], string2.equalsIgnoreCase("W"));
            if (dDegreesMinutesSecondsToDecimal != null && dDegreesMinutesSecondsToDecimal2 != null) {
                return new GeoLocation(dDegreesMinutesSecondsToDecimal.doubleValue(), dDegreesMinutesSecondsToDecimal2.doubleValue());
            }
        }
        return null;
    }

    public final Date getGpsDate() {
        String string = getString(29);
        Rational[] rationalArray = getRationalArray(7);
        if (string != null && rationalArray != null && rationalArray.length == 3) {
            try {
                return new SimpleDateFormat("yyyy:MM:dd HH:mm:ss.S z").parse(String.format(Locale.US, "%s %02d:%02d:%02.3f UTC", string, Integer.valueOf((int) rationalArray[0].doubleValue()), Integer.valueOf((int) rationalArray[1].doubleValue()), Double.valueOf(rationalArray[2].doubleValue())));
            } catch (ParseException unused) {
            }
        }
        return null;
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "GPS";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        ExifDirectoryBase.addExifTagNames(map);
        map.put(0, "GPS Version ID");
        map.put(1, fiHTiFJ.hxEG);
        lv8.x(2, map, "GPS Latitude", 3, "GPS Longitude Ref");
        lv8.x(4, map, "GPS Longitude", 5, "GPS Altitude Ref");
        lv8.x(6, map, "GPS Altitude", 7, "GPS Time-Stamp");
        lv8.x(8, map, "GPS Satellites", 9, "GPS Status");
        lv8.x(10, map, "GPS Measure Mode", 11, "GPS DOP");
        lv8.x(12, map, "GPS Speed Ref", 13, mgKMENwrbHf.VmffIddwAWB);
        lv8.x(14, map, "GPS Track Ref", 15, "GPS Track");
        lv8.x(16, map, "GPS Img Direction Ref", 17, "GPS Img Direction");
        lv8.x(18, map, "GPS Map Datum", 19, "GPS Dest Latitude Ref");
        lv8.x(20, map, "GPS Dest Latitude", 21, "GPS Dest Longitude Ref");
        lv8.x(22, map, "GPS Dest Longitude", 23, "GPS Dest Bearing Ref");
        lv8.x(24, map, "GPS Dest Bearing", 25, "GPS Dest Distance Ref");
        lv8.x(26, map, "GPS Dest Distance", 27, "GPS Processing Method");
        lv8.x(28, map, "GPS Area Information", 29, "GPS Date Stamp");
        lv8.x(30, map, "GPS Differential", 31, "GPS Horizontal Positioning Error");
    }
}
