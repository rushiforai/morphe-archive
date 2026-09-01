package com.drew.metadata.photoshop;

import com.drew.lang.ByteArrayReader;
import com.drew.lang.RandomAccessReader;
import com.drew.lang.SequentialByteArrayReader;
import com.drew.metadata.Directory;
import com.drew.metadata.Metadata;
import com.drew.metadata.exif.ExifTiffHandler;
import com.drew.metadata.icc.IccReader;
import com.drew.metadata.xmp.XmpReader;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class PhotoshopTiffHandler extends ExifTiffHandler {
    private static final int TAG_EXIF_GPS = 34853;
    private static final int TAG_EXIF_IFD_POINTER = 34665;
    private static final int TAG_FILE_INFORMATION = 33723;
    private static final int TAG_ICC_PROFILES = 34675;
    private static final int TAG_JPEG_TABLES = 437;
    private static final int TAG_PAGE_MAKER_EXTENSION = 330;
    private static final int TAG_PHOTOSHOP_IMAGE_RESOURCES = 34377;
    private static final int TAG_T_ANNOTATIONS = 50255;
    private static final int TAG_T_IMAGE_SOURCE_DATA = 37724;
    private static final int TAG_XMP = 700;

    public PhotoshopTiffHandler(Metadata metadata, Directory directory) {
        super(metadata, directory, 0);
    }

    @Override // com.drew.metadata.exif.ExifTiffHandler, com.drew.imaging.tiff.TiffHandler
    public final boolean customProcessTag(int i, Set<Integer> set, int i2, RandomAccessReader randomAccessReader, int i3, int i4) {
        if (i3 == 700) {
            XmpReader xmpReader = new XmpReader();
            byte[] bytes = randomAccessReader.getBytes(i, i4);
            xmpReader.extract(bytes, 0, bytes.length, this._metadata, null);
            return true;
        }
        if (i3 == 34377) {
            new PhotoshopReader().extract(new SequentialByteArrayReader(randomAccessReader.getBytes(i, i4), 0), i4, this._metadata, null);
            return true;
        }
        if (i3 != 34675) {
            return super.customProcessTag(i, set, i2, randomAccessReader, i3, i4);
        }
        new IccReader().extract(new ByteArrayReader(randomAccessReader.getBytes(i, i4), 0), this._metadata, null);
        return true;
    }
}
