package com.drew.metadata.bmp;

import com.drew.lang.ByteArrayReader;
import com.drew.lang.Charsets;
import com.drew.lang.SequentialReader;
import com.drew.metadata.ErrorDirectory;
import com.drew.metadata.Metadata;
import com.drew.metadata.MetadataException;
import com.drew.metadata.bmp.BmpHeaderDirectory;
import com.drew.metadata.icc.IccReader;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class BmpReader {
    public static final int BITMAP = 19778;
    public static final int OS2_BITMAP_ARRAY = 16706;
    public static final int OS2_COLOR_ICON = 18755;
    public static final int OS2_COLOR_POINTER = 20547;
    public static final int OS2_ICON = 17225;
    public static final int OS2_POINTER = 21584;

    public final void addError(String str, Metadata metadata) {
        ErrorDirectory errorDirectory = (ErrorDirectory) metadata.getFirstDirectoryOfType(ErrorDirectory.class);
        if (errorDirectory == null) {
            metadata.addDirectory(new ErrorDirectory(str));
        } else {
            errorDirectory.addError(str);
        }
    }

    public final void extract(SequentialReader sequentialReader, Metadata metadata) {
        sequentialReader.setMotorolaByteOrder(false);
        readFileHeader(sequentialReader, metadata, true);
    }

    public final void readBitmapHeader(SequentialReader sequentialReader, BmpHeaderDirectory bmpHeaderDirectory, Metadata metadata) {
        try {
            int i = bmpHeaderDirectory.getInt(-2);
            long position = sequentialReader.getPosition();
            int int32 = sequentialReader.getInt32();
            bmpHeaderDirectory.setInt(-1, int32);
            if (int32 == 12 && i == 19778) {
                bmpHeaderDirectory.setInt(2, sequentialReader.getInt16());
                bmpHeaderDirectory.setInt(1, sequentialReader.getInt16());
                bmpHeaderDirectory.setInt(3, sequentialReader.getUInt16());
                bmpHeaderDirectory.setInt(4, sequentialReader.getUInt16());
                return;
            }
            if (int32 == 12) {
                bmpHeaderDirectory.setInt(2, sequentialReader.getUInt16());
                bmpHeaderDirectory.setInt(1, sequentialReader.getUInt16());
                bmpHeaderDirectory.setInt(3, sequentialReader.getUInt16());
                bmpHeaderDirectory.setInt(4, sequentialReader.getUInt16());
                return;
            }
            if (int32 != 16 && int32 != 64) {
                if (int32 != 40 && int32 != 52 && int32 != 56 && int32 != 108 && int32 != 124) {
                    bmpHeaderDirectory.addError("Unexpected DIB header size: " + int32);
                    return;
                }
                bmpHeaderDirectory.setInt(2, sequentialReader.getInt32());
                bmpHeaderDirectory.setInt(1, sequentialReader.getInt32());
                bmpHeaderDirectory.setInt(3, sequentialReader.getUInt16());
                bmpHeaderDirectory.setInt(4, sequentialReader.getUInt16());
                bmpHeaderDirectory.setInt(5, sequentialReader.getInt32());
                sequentialReader.skip(4L);
                bmpHeaderDirectory.setInt(6, sequentialReader.getInt32());
                bmpHeaderDirectory.setInt(7, sequentialReader.getInt32());
                bmpHeaderDirectory.setInt(8, sequentialReader.getInt32());
                bmpHeaderDirectory.setInt(9, sequentialReader.getInt32());
                if (int32 == 40) {
                    return;
                }
                bmpHeaderDirectory.setLong(12, sequentialReader.getUInt32());
                bmpHeaderDirectory.setLong(13, sequentialReader.getUInt32());
                bmpHeaderDirectory.setLong(14, sequentialReader.getUInt32());
                if (int32 == 52) {
                    return;
                }
                bmpHeaderDirectory.setLong(15, sequentialReader.getUInt32());
                if (int32 == 56) {
                    return;
                }
                long uInt32 = sequentialReader.getUInt32();
                bmpHeaderDirectory.setLong(16, uInt32);
                sequentialReader.skip(36L);
                bmpHeaderDirectory.setLong(17, sequentialReader.getUInt32());
                bmpHeaderDirectory.setLong(18, sequentialReader.getUInt32());
                bmpHeaderDirectory.setLong(19, sequentialReader.getUInt32());
                if (int32 == 108) {
                    return;
                }
                bmpHeaderDirectory.setInt(20, sequentialReader.getInt32());
                if (uInt32 != BmpHeaderDirectory.ColorSpaceType.PROFILE_EMBEDDED.getValue() && uInt32 != BmpHeaderDirectory.ColorSpaceType.PROFILE_LINKED.getValue()) {
                    sequentialReader.skip(12L);
                    return;
                }
                long uInt322 = sequentialReader.getUInt32();
                int int322 = sequentialReader.getInt32();
                if (int322 < 0) {
                    bmpHeaderDirectory.addError("Invalid profile size " + int322);
                    return;
                }
                long j = position + uInt322;
                if (sequentialReader.getPosition() > j) {
                    bmpHeaderDirectory.addError("Invalid profile data offset 0x" + Long.toHexString(j));
                    return;
                } else {
                    sequentialReader.skip(j - sequentialReader.getPosition());
                    if (uInt32 == BmpHeaderDirectory.ColorSpaceType.PROFILE_LINKED.getValue()) {
                        bmpHeaderDirectory.setObject(21, sequentialReader.getNullTerminatedString(int322, Charsets.WINDOWS_1252, true));
                        return;
                    } else {
                        new IccReader().extract(new ByteArrayReader(sequentialReader.getBytes(int322), 0), metadata, bmpHeaderDirectory);
                        return;
                    }
                }
            }
            bmpHeaderDirectory.setInt(2, sequentialReader.getInt32());
            bmpHeaderDirectory.setInt(1, sequentialReader.getInt32());
            bmpHeaderDirectory.setInt(3, sequentialReader.getUInt16());
            bmpHeaderDirectory.setInt(4, sequentialReader.getUInt16());
            if (int32 > 16) {
                bmpHeaderDirectory.setInt(5, sequentialReader.getInt32());
                sequentialReader.skip(4L);
                bmpHeaderDirectory.setInt(6, sequentialReader.getInt32());
                bmpHeaderDirectory.setInt(7, sequentialReader.getInt32());
                bmpHeaderDirectory.setInt(8, sequentialReader.getInt32());
                bmpHeaderDirectory.setInt(9, sequentialReader.getInt32());
                sequentialReader.skip(6L);
                bmpHeaderDirectory.setInt(10, sequentialReader.getUInt16());
                sequentialReader.skip(8L);
                bmpHeaderDirectory.setInt(11, sequentialReader.getInt32());
                sequentialReader.skip(4L);
            }
        } catch (MetadataException unused) {
            bmpHeaderDirectory.addError("Internal error");
        } catch (IOException unused2) {
            bmpHeaderDirectory.addError("Unable to read BMP header");
        }
    }

    public final void readFileHeader(SequentialReader sequentialReader, Metadata metadata, boolean z) {
        try {
            int uInt16 = sequentialReader.getUInt16();
            BmpHeaderDirectory bmpHeaderDirectory = null;
            try {
                if (uInt16 == 16706) {
                    if (!z) {
                        addError("Invalid bitmap file - nested arrays not allowed", metadata);
                        return;
                    }
                    sequentialReader.skip(4L);
                    long uInt32 = sequentialReader.getUInt32();
                    sequentialReader.skip(4L);
                    readFileHeader(sequentialReader, metadata, false);
                    if (uInt32 == 0) {
                        return;
                    }
                    if (sequentialReader.getPosition() > uInt32) {
                        addError("Invalid next header offset", metadata);
                        return;
                    } else {
                        sequentialReader.skip(uInt32 - sequentialReader.getPosition());
                        readFileHeader(sequentialReader, metadata, true);
                        return;
                    }
                }
                if (uInt16 != 17225 && uInt16 != 18755 && uInt16 != 19778 && uInt16 != 20547 && uInt16 != 21584) {
                    metadata.addDirectory(new ErrorDirectory("Invalid BMP magic number 0x" + Integer.toHexString(uInt16)));
                    return;
                }
                BmpHeaderDirectory bmpHeaderDirectory2 = new BmpHeaderDirectory();
                try {
                    metadata.addDirectory(bmpHeaderDirectory2);
                    bmpHeaderDirectory2.setInt(-2, uInt16);
                    sequentialReader.skip(12L);
                    readBitmapHeader(sequentialReader, bmpHeaderDirectory2, metadata);
                } catch (IOException unused) {
                    bmpHeaderDirectory = bmpHeaderDirectory2;
                    if (bmpHeaderDirectory == null) {
                        addError("Unable to read BMP file header", metadata);
                    } else {
                        bmpHeaderDirectory.addError("Unable to read BMP file header");
                    }
                }
            } catch (IOException unused2) {
            }
        } catch (IOException e) {
            metadata.addDirectory(new ErrorDirectory("Couldn't determine bitmap type: " + e.getMessage()));
        }
    }
}
