package com.drew.metadata.pcx;

import com.drew.imaging.ImageProcessingException;
import com.drew.lang.SequentialReader;
import com.drew.metadata.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class PcxReader {
    public final void extract(SequentialReader sequentialReader, Metadata metadata) {
        sequentialReader.setMotorolaByteOrder(false);
        PcxDirectory pcxDirectory = new PcxDirectory();
        metadata.addDirectory(pcxDirectory);
        try {
            if (sequentialReader.getByte() != 10) {
                throw new ImageProcessingException("Invalid PCX identifier byte", null);
            }
            pcxDirectory.setInt(1, sequentialReader.getByte());
            if (sequentialReader.getByte() != 1) {
                throw new ImageProcessingException("Invalid PCX encoding byte", null);
            }
            pcxDirectory.setInt(2, sequentialReader.getUInt8());
            pcxDirectory.setInt(3, sequentialReader.getUInt16());
            pcxDirectory.setInt(4, sequentialReader.getUInt16());
            pcxDirectory.setInt(5, sequentialReader.getUInt16());
            pcxDirectory.setInt(6, sequentialReader.getUInt16());
            pcxDirectory.setInt(7, sequentialReader.getUInt16());
            pcxDirectory.setInt(8, sequentialReader.getUInt16());
            pcxDirectory.setObject(9, sequentialReader.getBytes(48));
            sequentialReader.skip(1L);
            pcxDirectory.setInt(10, sequentialReader.getUInt8());
            pcxDirectory.setInt(11, sequentialReader.getUInt16());
            int uInt16 = sequentialReader.getUInt16();
            if (uInt16 != 0) {
                pcxDirectory.setInt(12, uInt16);
            }
            int uInt162 = sequentialReader.getUInt16();
            if (uInt162 != 0) {
                pcxDirectory.setInt(13, uInt162);
            }
            int uInt163 = sequentialReader.getUInt16();
            if (uInt163 != 0) {
                pcxDirectory.setInt(14, uInt163);
            }
        } catch (Exception e) {
            pcxDirectory.addError("Exception reading PCX file metadata: " + e.getMessage());
        }
    }
}
