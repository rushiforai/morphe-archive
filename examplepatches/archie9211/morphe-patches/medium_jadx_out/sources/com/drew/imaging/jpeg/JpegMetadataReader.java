package com.drew.imaging.jpeg;

import com.drew.lang.StreamReader;
import com.drew.metadata.Metadata;
import com.drew.metadata.adobe.AdobeJpegReader;
import com.drew.metadata.exif.ExifReader;
import com.drew.metadata.file.FileSystemMetadataReader;
import com.drew.metadata.icc.IccReader;
import com.drew.metadata.iptc.IptcReader;
import com.drew.metadata.jfif.JfifReader;
import com.drew.metadata.jfxx.JfxxReader;
import com.drew.metadata.jpeg.JpegCommentReader;
import com.drew.metadata.jpeg.JpegDhtReader;
import com.drew.metadata.jpeg.JpegDnlReader;
import com.drew.metadata.jpeg.JpegReader;
import com.drew.metadata.photoshop.DuckyReader;
import com.drew.metadata.photoshop.PhotoshopReader;
import com.drew.metadata.xmp.XmpReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class JpegMetadataReader {
    public static final Iterable<JpegSegmentMetadataReader> ALL_READERS = Arrays.asList(new JpegReader(), new JpegCommentReader(), new JfifReader(), new JfxxReader(), new ExifReader(), new XmpReader(), new IccReader(), new PhotoshopReader(), new DuckyReader(), new IptcReader(), new AdobeJpegReader(), new JpegDhtReader(), new JpegDnlReader());

    private JpegMetadataReader() throws Exception {
        throw new Exception("Not intended for instantiation");
    }

    public static void process(Metadata metadata, InputStream inputStream, Iterable<JpegSegmentMetadataReader> iterable) {
        if (iterable == null) {
            iterable = ALL_READERS;
        }
        HashSet hashSet = new HashSet();
        Iterator<JpegSegmentMetadataReader> it2 = iterable.iterator();
        while (it2.hasNext()) {
            Iterator<JpegSegmentType> it3 = it2.next().getSegmentTypes().iterator();
            while (it3.hasNext()) {
                hashSet.add(it3.next());
            }
        }
        processJpegSegmentData(metadata, iterable, JpegSegmentReader.readSegments(new StreamReader(inputStream), hashSet));
    }

    public static void processJpegSegmentData(Metadata metadata, Iterable<JpegSegmentMetadataReader> iterable, JpegSegmentData jpegSegmentData) {
        for (JpegSegmentMetadataReader jpegSegmentMetadataReader : iterable) {
            for (JpegSegmentType jpegSegmentType : jpegSegmentMetadataReader.getSegmentTypes()) {
                jpegSegmentData.getClass();
                jpegSegmentMetadataReader.readJpegSegments(jpegSegmentData.getSegments(jpegSegmentType.byteValue), metadata, jpegSegmentType);
            }
        }
    }

    public static Metadata readMetadata(File file, Iterable<JpegSegmentMetadataReader> iterable) throws IOException {
        FileInputStream fileInputStream = new FileInputStream(file);
        try {
            Metadata metadata = readMetadata(fileInputStream, iterable);
            fileInputStream.close();
            new FileSystemMetadataReader().read(file, metadata);
            return metadata;
        } catch (Throwable th) {
            fileInputStream.close();
            throw th;
        }
    }

    public static Metadata readMetadata(InputStream inputStream) {
        return readMetadata(inputStream, (Iterable<JpegSegmentMetadataReader>) null);
    }

    public static Metadata readMetadata(InputStream inputStream, Iterable<JpegSegmentMetadataReader> iterable) {
        Metadata metadata = new Metadata();
        process(metadata, inputStream, iterable);
        return metadata;
    }

    public static Metadata readMetadata(File file) {
        return readMetadata(file, (Iterable<JpegSegmentMetadataReader>) null);
    }

    public static void process(Metadata metadata, InputStream inputStream) {
        process(metadata, inputStream, null);
    }
}
