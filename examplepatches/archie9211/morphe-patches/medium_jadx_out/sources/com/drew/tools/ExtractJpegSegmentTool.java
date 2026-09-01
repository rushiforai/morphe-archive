package com.drew.tools;

import com.drew.imaging.jpeg.JpegSegmentData;
import com.drew.imaging.jpeg.JpegSegmentReader;
import com.drew.imaging.jpeg.JpegSegmentType;
import com.drew.lang.Iterables;
import com.medium.android.data.catalog.KnyB.uvlZTF;
import defpackage.b09;
import java.io.File;
import java.util.ArrayList;
import java.util.HashSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class ExtractJpegSegmentTool {
    public static void main(String[] strArr) throws Throwable {
        if (strArr.length < 1) {
            printUsage();
            System.exit(1);
        }
        String str = strArr[0];
        if (!new File(str).exists()) {
            System.err.println("File does not exist");
            printUsage();
            System.exit(1);
        }
        HashSet hashSet = new HashSet();
        for (int i = 1; i < strArr.length; i++) {
            JpegSegmentType jpegSegmentTypeValueOf = JpegSegmentType.valueOf(strArr[i].toUpperCase());
            if (!jpegSegmentTypeValueOf.canContainMetadata) {
                System.err.printf("WARNING: Segment type %s cannot contain metadata so it may not be necessary to extract it%n", jpegSegmentTypeValueOf);
            }
            hashSet.add(jpegSegmentTypeValueOf);
        }
        if (hashSet.size() == 0) {
            hashSet.addAll(JpegSegmentType.canContainMetadataTypes);
        }
        System.out.println("Reading: " + str);
        saveSegmentFiles(str, JpegSegmentReader.readSegments(new File(str), hashSet));
    }

    public static void saveSegmentFiles(String str, JpegSegmentData jpegSegmentData) throws Throwable {
        for (JpegSegmentType jpegSegmentType : (HashSet) jpegSegmentData.getSegmentTypes()) {
            ArrayList arrayList = (ArrayList) Iterables.toList(jpegSegmentData.getSegments(jpegSegmentType.byteValue));
            if (arrayList.size() != 0) {
                if (arrayList.size() > 1) {
                    for (int i = 0; i < arrayList.size(); i++) {
                        String str2 = String.format("%s.%s.%d", str, jpegSegmentType.toString().toLowerCase(), Integer.valueOf(i));
                        System.out.println("Writing: ".concat(str2));
                        FileUtil.saveBytes(new File(str2), (byte[]) arrayList.get(i));
                    }
                } else {
                    String strY = b09.y(str, ".", jpegSegmentType.toString().toLowerCase());
                    System.out.println("Writing: ".concat(strY));
                    FileUtil.saveBytes(new File(strY), (byte[]) arrayList.get(0));
                }
            }
        }
    }

    private static void printUsage() {
        System.out.println("USAGE:\n");
        System.out.println("\tjava com.drew.tools.ExtractJpegSegmentTool <filename> [<segment> ...]\n");
        System.out.print(uvlZTF.yhhNcxoJlokeJtB);
        for (JpegSegmentType jpegSegmentType : (JpegSegmentType[]) JpegSegmentType.class.getEnumConstants()) {
            if (jpegSegmentType.canContainMetadata) {
                System.out.print(" " + jpegSegmentType.toString());
            }
        }
        System.out.println();
    }
}
