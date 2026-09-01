package com.drew.metadata.iptc;

import com.drew.imaging.jpeg.JpegSegmentMetadataReader;
import com.drew.imaging.jpeg.JpegSegmentType;
import com.drew.lang.SequentialByteArrayReader;
import com.drew.lang.SequentialReader;
import com.drew.metadata.Directory;
import com.drew.metadata.Metadata;
import defpackage.ev6;
import java.io.IOException;
import java.util.Collections;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class IptcReader implements JpegSegmentMetadataReader {
    private static final byte IptcMarkerByte = 28;

    /* JADX WARN: Removed duplicated region for block: B:27:0x0049  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void processTag(com.drew.lang.SequentialReader r3, com.drew.metadata.Directory r4, int r5, int r6, int r7) {
        /*
            r2 = this;
            int r2 = r5 << 8
            r2 = r2 | r6
            if (r7 != 0) goto Lb
            java.lang.String r3 = ""
            r4.setObject(r2, r3)
            return
        Lb:
            r5 = 256(0x100, float:3.59E-43)
            r6 = 346(0x15a, float:4.85E-43)
            r0 = 1
            if (r2 == r5) goto L49
            r5 = 278(0x116, float:3.9E-43)
            if (r2 == r5) goto L49
            if (r2 == r6) goto L36
            r5 = 378(0x17a, float:5.3E-43)
            if (r2 == r5) goto L49
            r5 = 512(0x200, float:7.17E-43)
            if (r2 == r5) goto L49
            r5 = 522(0x20a, float:7.31E-43)
            if (r2 == r5) goto L29
            r5 = 582(0x246, float:8.16E-43)
            if (r2 == r5) goto L49
            goto L59
        L29:
            short r5 = r3.getUInt8()
            r4.setInt(r2, r5)
            int r7 = r7 - r0
            long r4 = (long) r7
            r3.skip(r4)
            return
        L36:
            byte[] r3 = r3.getBytes(r7)
            java.lang.String r5 = com.drew.metadata.iptc.Iso2022Converter.convertISO2022CharsetToJavaCharset(r3)
            if (r5 != 0) goto L45
            java.lang.String r5 = new java.lang.String
            r5.<init>(r3)
        L45:
            r4.setObject(r2, r5)
            return
        L49:
            r5 = 2
            if (r7 < r5) goto L59
            int r6 = r3.getUInt16()
            int r7 = r7 - r5
            long r0 = (long) r7
            r3.skip(r0)
            r4.setInt(r2, r6)
            return
        L59:
            java.lang.String r5 = r4.getString(r6)
            r6 = 0
            if (r5 == 0) goto L65
            java.nio.charset.Charset r1 = java.nio.charset.Charset.forName(r5)     // Catch: java.lang.Throwable -> L65
            goto L66
        L65:
            r1 = r6
        L66:
            if (r5 == 0) goto L6d
            com.drew.metadata.StringValue r3 = r3.getStringValue(r7, r1)
            goto L84
        L6d:
            byte[] r3 = r3.getBytes(r7)
            java.nio.charset.Charset r5 = com.drew.metadata.iptc.Iso2022Converter.guessCharSet(r3)
            if (r5 == 0) goto L7e
            com.drew.metadata.StringValue r6 = new com.drew.metadata.StringValue
            r6.<init>(r3, r5)
            r3 = r6
            goto L84
        L7e:
            com.drew.metadata.StringValue r5 = new com.drew.metadata.StringValue
            r5.<init>(r3, r6)
            r3 = r5
        L84:
            boolean r5 = r4.containsTag(r2)
            if (r5 == 0) goto La5
            com.drew.metadata.StringValue[] r5 = r4.getStringValueArray(r2)
            if (r5 != 0) goto L93
            com.drew.metadata.StringValue[] r5 = new com.drew.metadata.StringValue[r0]
            goto L9d
        L93:
            int r6 = r5.length
            int r6 = r6 + r0
            com.drew.metadata.StringValue[] r6 = new com.drew.metadata.StringValue[r6]
            int r7 = r5.length
            r1 = 0
            java.lang.System.arraycopy(r5, r1, r6, r1, r7)
            r5 = r6
        L9d:
            int r6 = r5.length
            int r6 = r6 - r0
            r5[r6] = r3
            r4.setObjectArray(r2, r5)
            goto La8
        La5:
            r4.setObject(r2, r3)
        La8:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.drew.metadata.iptc.IptcReader.processTag(com.drew.lang.SequentialReader, com.drew.metadata.Directory, int, int, int):void");
    }

    public final void extract(SequentialReader sequentialReader, Metadata metadata, long j, Directory directory) {
        IptcDirectory iptcDirectory = new IptcDirectory();
        metadata.addDirectory(iptcDirectory);
        if (directory != null) {
            iptcDirectory.setParent(directory);
        }
        int i = 0;
        while (i < j) {
            try {
                short uInt8 = sequentialReader.getUInt8();
                int i2 = i + 1;
                if (uInt8 != 28) {
                    if (i2 != j) {
                        StringBuilder sbC = ev6.C("Invalid IPTC tag marker at offset ", i, ". Expected '0x");
                        sbC.append(Integer.toHexString(28));
                        sbC.append("' but got '0x");
                        sbC.append(Integer.toHexString(uInt8));
                        sbC.append("'.");
                        iptcDirectory.addError(sbC.toString());
                        return;
                    }
                    return;
                }
                if (i + 5 > j) {
                    iptcDirectory.addError("Too few bytes remain for a valid IPTC tag");
                    return;
                }
                try {
                    short uInt82 = sequentialReader.getUInt8();
                    short uInt83 = sequentialReader.getUInt8();
                    int uInt16 = sequentialReader.getUInt16();
                    if (uInt16 > 32767) {
                        uInt16 = ((uInt16 & 32767) << 16) | sequentialReader.getUInt16();
                        i2 = i + 3;
                    }
                    int i3 = uInt16;
                    i = i2 + 4 + i3;
                    if (i > j) {
                        iptcDirectory.addError("Data for tag extends beyond end of IPTC segment");
                        return;
                    }
                    IptcReader iptcReader = this;
                    SequentialReader sequentialReader2 = sequentialReader;
                    try {
                        iptcReader.processTag(sequentialReader2, iptcDirectory, uInt82, uInt83, i3);
                        this = iptcReader;
                        sequentialReader = sequentialReader2;
                    } catch (IOException unused) {
                        iptcDirectory.addError("Error processing IPTC tag");
                        return;
                    }
                } catch (IOException unused2) {
                    iptcDirectory.addError("IPTC data segment ended mid-way through tag descriptor");
                    return;
                }
            } catch (IOException unused3) {
                iptcDirectory.addError("Unable to read starting byte of IPTC tag");
                return;
            }
        }
    }

    @Override // com.drew.imaging.jpeg.JpegSegmentMetadataReader
    public final Iterable<JpegSegmentType> getSegmentTypes() {
        return Collections.singletonList(JpegSegmentType.APPD);
    }

    @Override // com.drew.imaging.jpeg.JpegSegmentMetadataReader
    public final void readJpegSegments(Iterable<byte[]> iterable, Metadata metadata, JpegSegmentType jpegSegmentType) {
        IptcReader iptcReader;
        Metadata metadata2;
        for (byte[] bArr : iterable) {
            if (bArr.length == 0 || bArr[0] != 28) {
                iptcReader = this;
                metadata2 = metadata;
            } else {
                iptcReader = this;
                metadata2 = metadata;
                iptcReader.extract(new SequentialByteArrayReader(bArr, 0), metadata2, bArr.length, null);
            }
            this = iptcReader;
            metadata = metadata2;
        }
    }

    public final void extract(SequentialReader sequentialReader, Metadata metadata, long j) {
        extract(sequentialReader, metadata, j, null);
    }
}
