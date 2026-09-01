package com.drew.metadata.mov.atoms.canon;

import com.drew.imaging.jpeg.JpegProcessingException;
import com.drew.imaging.jpeg.JpegSegmentData;
import com.drew.imaging.jpeg.JpegSegmentReader;
import com.drew.imaging.jpeg.JpegSegmentType;
import com.drew.lang.SequentialReader;
import com.drew.lang.StreamReader;
import com.drew.metadata.Directory;
import com.drew.metadata.Metadata;
import com.drew.metadata.Tag;
import com.drew.metadata.exif.ExifIFD0Directory;
import com.drew.metadata.exif.ExifReader;
import com.drew.metadata.mov.QuickTimeDirectory;
import com.drew.metadata.mov.atoms.Atom;
import java.io.ByteArrayInputStream;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class CanonThumbnailAtom extends Atom {
    private String dateTime;

    public CanonThumbnailAtom(SequentialReader sequentialReader) {
        super(sequentialReader);
        readCNDA(sequentialReader);
    }

    private void readCNDA(SequentialReader sequentialReader) {
        if (this.type.equals("CNDA")) {
            long j = this.size;
            if (j > 2147483647L || j <= 0) {
                return;
            }
            ExifReader exifReader = new ExifReader();
            ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(sequentialReader.getBytes((int) this.size));
            HashSet hashSet = new HashSet();
            Iterator it2 = Collections.singletonList(JpegSegmentType.APP1).iterator();
            while (it2.hasNext()) {
                hashSet.add((JpegSegmentType) it2.next());
            }
            try {
                JpegSegmentData segments = JpegSegmentReader.readSegments(new StreamReader(byteArrayInputStream), hashSet);
                Metadata metadata = new Metadata();
                for (JpegSegmentType jpegSegmentType : Collections.singletonList(JpegSegmentType.APP1)) {
                    exifReader.readJpegSegments(segments.getSegments(jpegSegmentType.byteValue), metadata, jpegSegmentType);
                }
                Directory firstDirectoryOfType = metadata.getFirstDirectoryOfType(ExifIFD0Directory.class);
                if (firstDirectoryOfType != null) {
                    for (Tag tag : firstDirectoryOfType.getTags()) {
                        if (tag.getTagType() == 306) {
                            this.dateTime = tag.getDescription();
                        }
                    }
                }
            } catch (JpegProcessingException unused) {
            }
        }
    }

    public final void addMetadata(QuickTimeDirectory quickTimeDirectory) {
        String str = this.dateTime;
        if (str != null) {
            quickTimeDirectory.setString(8192, str);
        }
    }
}
