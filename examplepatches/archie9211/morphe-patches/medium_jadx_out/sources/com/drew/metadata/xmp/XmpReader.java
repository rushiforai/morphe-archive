package com.drew.metadata.xmp;

import com.adobe.internal.xmp.XMPException;
import com.drew.imaging.jpeg.JpegSegmentMetadataReader;
import com.drew.imaging.jpeg.JpegSegmentType;
import com.drew.lang.SequentialByteArrayReader;
import com.drew.metadata.Directory;
import com.drew.metadata.Metadata;
import com.drew.metadata.StringValue;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import defpackage.o2b;
import defpackage.p49;
import defpackage.q9f;
import defpackage.v9f;
import defpackage.w9f;
import defpackage.x9f;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class XmpReader implements JpegSegmentMetadataReader {
    private static final String ATTRIBUTE_EXTENDED_XMP = "xmpNote:HasExtendedXMP";
    private static final int EXTENDED_XMP_GUID_LENGTH = 32;
    private static final int EXTENDED_XMP_INT_LENGTH = 4;
    private static final p49 PARSE_OPTIONS;
    private static final String SCHEMA_XMP_NOTES = "http://ns.adobe.com/xmp/note/";
    private static final String XMP_EXTENSION_JPEG_PREAMBLE = "http://ns.adobe.com/xmp/extension/\u0000";
    private static final String XMP_JPEG_PREAMBLE = "http://ns.adobe.com/xap/1.0/\u0000";

    static {
        p49 p49Var = new p49();
        p49Var.b.putAll(Collections.singletonMap("photoshop:DocumentAncestors", Integer.valueOf(PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE)));
        PARSE_OPTIONS = p49Var;
    }

    private static String getExtendedXMPGUID(Metadata metadata) {
        Iterator it2;
        Iterator it3 = ((ArrayList) metadata.getDirectoriesOfType(XmpDirectory.class)).iterator();
        while (it3.hasNext()) {
            try {
                it2 = ((w9f) ((XmpDirectory) it3.next()).getXMPMeta()).a(SCHEMA_XMP_NOTES, null).c;
            } catch (XMPException unused) {
            }
            while (it2.hasNext()) {
                q9f q9fVar = (q9f) it2.next();
                if (ATTRIBUTE_EXTENDED_XMP.equals(q9fVar.c)) {
                    return q9fVar.d;
                }
            }
        }
        return null;
    }

    private static byte[] processExtendedXMPChunk(Metadata metadata, byte[] bArr, String str, byte[] bArr2) {
        int length = bArr.length;
        if (length >= 75) {
            try {
                SequentialByteArrayReader sequentialByteArrayReader = new SequentialByteArrayReader(bArr, 0);
                sequentialByteArrayReader.skip(35L);
                if (str.equals(sequentialByteArrayReader.getString(32))) {
                    int uInt32 = (int) sequentialByteArrayReader.getUInt32();
                    int uInt322 = (int) sequentialByteArrayReader.getUInt32();
                    if (bArr2 == null) {
                        bArr2 = new byte[uInt32];
                    }
                    if (bArr2.length != uInt32) {
                        XmpDirectory xmpDirectory = new XmpDirectory();
                        xmpDirectory.addError(String.format("Inconsistent length for the Extended XMP buffer: %d instead of %d", Integer.valueOf(uInt32), Integer.valueOf(bArr2.length)));
                        metadata.addDirectory(xmpDirectory);
                        return bArr2;
                    }
                    int i = length - 75;
                    if (uInt322 >= 0 && uInt322 <= bArr2.length - i) {
                        System.arraycopy(bArr, 75, bArr2, uInt322, i);
                        return bArr2;
                    }
                    XmpDirectory xmpDirectory2 = new XmpDirectory();
                    xmpDirectory2.addError(String.format("Extended XMP chunk would write beyond buffer bounds (offset=%d, length=%d, buffer size=%d)", Integer.valueOf(uInt322), Integer.valueOf(i), Integer.valueOf(bArr2.length)));
                    metadata.addDirectory(xmpDirectory2);
                    return bArr2;
                }
            } catch (IOException e) {
                XmpDirectory xmpDirectory3 = new XmpDirectory();
                xmpDirectory3.addError(e.getMessage());
                metadata.addDirectory(xmpDirectory3);
            }
        }
        return bArr2;
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x001a A[Catch: XMPException -> 0x0018, TryCatch #0 {XMPException -> 0x0018, blocks: (B:6:0x000c, B:8:0x000f, B:14:0x0031, B:11:0x001a, B:13:0x001e, B:15:0x0035, B:16:0x003c), top: B:22:0x000c }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void extract(byte[] r2, int r3, int r4, com.drew.metadata.Metadata r5, com.drew.metadata.Directory r6) {
        /*
            r1 = this;
            com.drew.metadata.xmp.XmpDirectory r1 = new com.drew.metadata.xmp.XmpDirectory
            r1.<init>()
            if (r6 == 0) goto La
            r1.setParent(r6)
        La:
            if (r3 != 0) goto L1a
            int r6 = r2.length     // Catch: com.adobe.internal.xmp.XMPException -> L18
            if (r4 != r6) goto L1a
            p49 r3 = com.drew.metadata.xmp.XmpReader.PARSE_OPTIONS     // Catch: com.adobe.internal.xmp.XMPException -> L18
            o2b r4 = defpackage.v9f.a     // Catch: com.adobe.internal.xmp.XMPException -> L18
            w9f r2 = defpackage.x9f.b(r2, r3)     // Catch: com.adobe.internal.xmp.XMPException -> L18
            goto L31
        L18:
            r2 = move-exception
            goto L3d
        L1a:
            int r6 = r2.length     // Catch: com.adobe.internal.xmp.XMPException -> L18
            int r6 = r6 - r3
            if (r4 > r6) goto L35
            byte[] r6 = new byte[r4]     // Catch: com.adobe.internal.xmp.XMPException -> L18
            r0 = 0
            java.lang.System.arraycopy(r2, r3, r6, r0, r4)     // Catch: com.adobe.internal.xmp.XMPException -> L18
            java.io.ByteArrayInputStream r2 = new java.io.ByteArrayInputStream     // Catch: com.adobe.internal.xmp.XMPException -> L18
            r2.<init>(r6, r0, r4)     // Catch: com.adobe.internal.xmp.XMPException -> L18
            p49 r3 = com.drew.metadata.xmp.XmpReader.PARSE_OPTIONS     // Catch: com.adobe.internal.xmp.XMPException -> L18
            o2b r4 = defpackage.v9f.a     // Catch: com.adobe.internal.xmp.XMPException -> L18
            w9f r2 = defpackage.x9f.b(r2, r3)     // Catch: com.adobe.internal.xmp.XMPException -> L18
        L31:
            r1.setXMPMeta(r2)     // Catch: com.adobe.internal.xmp.XMPException -> L18
            goto L52
        L35:
            java.lang.ArrayIndexOutOfBoundsException r2 = new java.lang.ArrayIndexOutOfBoundsException     // Catch: com.adobe.internal.xmp.XMPException -> L18
            java.lang.String r3 = "Valid length exceeds the buffer length."
            r2.<init>(r3)     // Catch: com.adobe.internal.xmp.XMPException -> L18
            throw r2     // Catch: com.adobe.internal.xmp.XMPException -> L18
        L3d:
            java.lang.StringBuilder r3 = new java.lang.StringBuilder
            java.lang.String r4 = "Error processing XMP data: "
            r3.<init>(r4)
            java.lang.String r2 = r2.getMessage()
            r3.append(r2)
            java.lang.String r2 = r3.toString()
            r1.addError(r2)
        L52:
            boolean r2 = r1.isEmpty()
            if (r2 != 0) goto L5b
            r5.addDirectory(r1)
        L5b:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.drew.metadata.xmp.XmpReader.extract(byte[], int, int, com.drew.metadata.Metadata, com.drew.metadata.Directory):void");
    }

    @Override // com.drew.imaging.jpeg.JpegSegmentMetadataReader
    public final Iterable<JpegSegmentType> getSegmentTypes() {
        return Collections.singletonList(JpegSegmentType.APP1);
    }

    @Override // com.drew.imaging.jpeg.JpegSegmentMetadataReader
    public final void readJpegSegments(Iterable<byte[]> iterable, Metadata metadata, JpegSegmentType jpegSegmentType) {
        byte[] bArrProcessExtendedXMPChunk = null;
        String extendedXMPGUID = null;
        for (byte[] bArr : iterable) {
            if (bArr.length >= 29 && (XMP_JPEG_PREAMBLE.equalsIgnoreCase(new String(bArr, 0, 29)) || "XMP".equalsIgnoreCase(new String(bArr, 0, 3)))) {
                int length = bArr.length - 29;
                byte[] bArr2 = new byte[length];
                System.arraycopy(bArr, 29, bArr2, 0, length);
                extract(bArr2, metadata, (Directory) null);
                extendedXMPGUID = getExtendedXMPGUID(metadata);
            } else if (extendedXMPGUID != null && bArr.length >= 35 && XMP_EXTENSION_JPEG_PREAMBLE.equalsIgnoreCase(new String(bArr, 0, 35))) {
                bArrProcessExtendedXMPChunk = processExtendedXMPChunk(metadata, bArr, extendedXMPGUID, bArrProcessExtendedXMPChunk);
            }
        }
        if (bArrProcessExtendedXMPChunk != null) {
            extract(bArrProcessExtendedXMPChunk, metadata, (Directory) null);
        }
    }

    public final void extract(byte[] bArr, Metadata metadata, Directory directory) {
        extract(bArr, 0, bArr.length, metadata, directory);
    }

    public final void extract(byte[] bArr, Metadata metadata) {
        extract(bArr, metadata, (Directory) null);
    }

    public final void extract(String str, Metadata metadata) {
        extract(str, metadata, (Directory) null);
    }

    public final void extract(StringValue stringValue, Metadata metadata) {
        extract(stringValue.getBytes(), metadata, (Directory) null);
    }

    public final void extract(String str, Metadata metadata, Directory directory) {
        XmpDirectory xmpDirectory = new XmpDirectory();
        if (directory != null) {
            xmpDirectory.setParent(directory);
        }
        try {
            p49 p49Var = PARSE_OPTIONS;
            o2b o2bVar = v9f.a;
            xmpDirectory.setXMPMeta(x9f.b(str, p49Var));
        } catch (XMPException e) {
            xmpDirectory.addError("Error processing XMP data: " + e.getMessage());
        }
        if (xmpDirectory.isEmpty()) {
            return;
        }
        metadata.addDirectory(xmpDirectory);
    }
}
