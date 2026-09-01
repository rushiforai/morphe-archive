package com.drew.metadata.gif;

import com.drew.lang.ByteArrayReader;
import com.drew.lang.Charsets;
import com.drew.lang.SequentialReader;
import com.drew.metadata.Directory;
import com.drew.metadata.ErrorDirectory;
import com.drew.metadata.Metadata;
import com.drew.metadata.MetadataException;
import com.drew.metadata.StringValue;
import com.drew.metadata.gif.GifControlDirectory;
import com.drew.metadata.icc.IccReader;
import com.drew.metadata.xmp.XmpReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class GifReader {
    private static final String GIF_87A_VERSION_IDENTIFIER = "87a";
    private static final String GIF_89A_VERSION_IDENTIFIER = "89a";

    private static byte[] gatherBytes(SequentialReader sequentialReader) {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        byte[] bArr = new byte[257];
        while (true) {
            byte b = sequentialReader.getByte();
            if (b == 0) {
                return byteArrayOutputStream.toByteArray();
            }
            int i = b & 255;
            bArr[0] = b;
            sequentialReader.getBytes(bArr, 1, i);
            byteArrayOutputStream.write(bArr, 0, i + 1);
        }
    }

    private static void readApplicationExtensionBlock(SequentialReader sequentialReader, int i, Metadata metadata) {
        if (i != 11) {
            metadata.addDirectory(new ErrorDirectory(String.format("Invalid GIF application extension block size. Expected 11, got %d.", Integer.valueOf(i))));
            return;
        }
        String string = sequentialReader.getString(i, Charsets.UTF_8);
        if (string.equals("XMP DataXMP")) {
            byte[] bArrGatherBytes = gatherBytes(sequentialReader);
            if (bArrGatherBytes.length - 257 > 0) {
                new XmpReader().extract(bArrGatherBytes, 0, bArrGatherBytes.length - 257, metadata, null);
                return;
            }
            return;
        }
        if (string.equals("ICCRGBG1012")) {
            byte[] bArrGatherBytes2 = gatherBytes(sequentialReader, sequentialReader.getByte() & 255);
            if (bArrGatherBytes2.length != 0) {
                new IccReader().extract(new ByteArrayReader(bArrGatherBytes2, 0), metadata, null);
                return;
            }
            return;
        }
        if (!string.equals("NETSCAPE2.0")) {
            skipBlocks(sequentialReader);
            return;
        }
        sequentialReader.skip(2L);
        int uInt16 = sequentialReader.getUInt16();
        sequentialReader.skip(1L);
        GifAnimationDirectory gifAnimationDirectory = new GifAnimationDirectory();
        gifAnimationDirectory.setInt(1, uInt16);
        metadata.addDirectory(gifAnimationDirectory);
    }

    private static GifCommentDirectory readCommentBlock(SequentialReader sequentialReader, int i) {
        return new GifCommentDirectory(new StringValue(gatherBytes(sequentialReader, i), Charsets.ASCII));
    }

    private static GifControlDirectory readControlBlock(SequentialReader sequentialReader) {
        GifControlDirectory gifControlDirectory = new GifControlDirectory();
        short uInt8 = sequentialReader.getUInt8();
        gifControlDirectory.setObject(2, GifControlDirectory.DisposalMethod.typeOf((uInt8 >> 2) & 7));
        gifControlDirectory.setBoolean(3, ((uInt8 & 2) >> 1) == 1);
        gifControlDirectory.setBoolean(4, (uInt8 & 1) == 1);
        gifControlDirectory.setInt(1, sequentialReader.getUInt16());
        gifControlDirectory.setInt(5, sequentialReader.getUInt8());
        sequentialReader.skip(1L);
        return gifControlDirectory;
    }

    private static void readGifExtensionBlock(SequentialReader sequentialReader, Metadata metadata) {
        byte b = sequentialReader.getByte();
        short uInt8 = sequentialReader.getUInt8();
        long position = sequentialReader.getPosition();
        if (b == -7) {
            metadata.addDirectory(readControlBlock(sequentialReader));
        } else if (b == 1) {
            Directory plainTextBlock = readPlainTextBlock(sequentialReader, uInt8);
            if (plainTextBlock != null) {
                metadata.addDirectory(plainTextBlock);
            }
        } else if (b == -2) {
            metadata.addDirectory(readCommentBlock(sequentialReader, uInt8));
        } else if (b != -1) {
            metadata.addDirectory(new ErrorDirectory(String.format("Unsupported GIF extension block with type 0x%02X.", Byte.valueOf(b))));
        } else {
            readApplicationExtensionBlock(sequentialReader, uInt8, metadata);
        }
        long position2 = (position + ((long) uInt8)) - sequentialReader.getPosition();
        if (position2 > 0) {
            sequentialReader.skip(position2);
        }
    }

    private static GifHeaderDirectory readGifHeader(SequentialReader sequentialReader) {
        GifHeaderDirectory gifHeaderDirectory = new GifHeaderDirectory();
        if (!sequentialReader.getString(3).equals("GIF")) {
            gifHeaderDirectory.addError("Invalid GIF file signature");
            return gifHeaderDirectory;
        }
        String string = sequentialReader.getString(3);
        if (!string.equals(GIF_87A_VERSION_IDENTIFIER) && !string.equals(GIF_89A_VERSION_IDENTIFIER)) {
            gifHeaderDirectory.addError("Unexpected GIF version");
            return gifHeaderDirectory;
        }
        gifHeaderDirectory.setObject(1, string);
        gifHeaderDirectory.setInt(2, sequentialReader.getUInt16());
        gifHeaderDirectory.setInt(3, sequentialReader.getUInt16());
        short uInt8 = sequentialReader.getUInt8();
        int i = 1 << ((uInt8 & 7) + 1);
        int i2 = ((uInt8 & 112) >> 4) + 1;
        boolean z = (uInt8 >> 7) != 0;
        gifHeaderDirectory.setInt(4, i);
        if (string.equals(GIF_89A_VERSION_IDENTIFIER)) {
            gifHeaderDirectory.setBoolean(5, (uInt8 & 8) != 0);
        }
        gifHeaderDirectory.setInt(6, i2);
        gifHeaderDirectory.setBoolean(7, z);
        gifHeaderDirectory.setInt(8, sequentialReader.getUInt8());
        short uInt82 = sequentialReader.getUInt8();
        if (uInt82 != 0) {
            gifHeaderDirectory.setFloat(9, (float) ((((double) uInt82) + 15.0d) / 64.0d));
        }
        return gifHeaderDirectory;
    }

    private static GifImageDirectory readImageBlock(SequentialReader sequentialReader) {
        GifImageDirectory gifImageDirectory = new GifImageDirectory();
        gifImageDirectory.setInt(1, sequentialReader.getUInt16());
        gifImageDirectory.setInt(2, sequentialReader.getUInt16());
        gifImageDirectory.setInt(3, sequentialReader.getUInt16());
        gifImageDirectory.setInt(4, sequentialReader.getUInt16());
        byte b = sequentialReader.getByte();
        boolean z = (b >> 7) != 0;
        boolean z2 = (b & 64) != 0;
        gifImageDirectory.setBoolean(5, z);
        gifImageDirectory.setBoolean(6, z2);
        if (z) {
            gifImageDirectory.setBoolean(7, (b & 32) != 0);
            gifImageDirectory.setInt(8, (b & 7) + 1);
            sequentialReader.skip((2 << r1) * 3);
        }
        sequentialReader.getByte();
        return gifImageDirectory;
    }

    private static Directory readPlainTextBlock(SequentialReader sequentialReader, int i) {
        if (i != 12) {
            return new ErrorDirectory(String.format("Invalid GIF plain text block size. Expected 12, got %d.", Integer.valueOf(i)));
        }
        sequentialReader.skip(12L);
        skipBlocks(sequentialReader);
        return null;
    }

    private static void skipBlocks(SequentialReader sequentialReader) {
        while (true) {
            short uInt8 = sequentialReader.getUInt8();
            if (uInt8 == 0) {
                return;
            } else {
                sequentialReader.skip(uInt8);
            }
        }
    }

    public final void extract(SequentialReader sequentialReader, Metadata metadata) {
        byte b;
        sequentialReader.setMotorolaByteOrder(false);
        try {
            GifHeaderDirectory gifHeader = readGifHeader(sequentialReader);
            metadata.addDirectory(gifHeader);
            if (gifHeader.hasErrors()) {
                return;
            }
            Integer integer = null;
            try {
                try {
                    if (gifHeader.getBoolean(7)) {
                        integer = gifHeader.getInteger(4);
                    }
                } catch (IOException unused) {
                    metadata.addDirectory(new ErrorDirectory("IOException processing GIF data"));
                    return;
                }
            } catch (MetadataException unused2) {
                metadata.addDirectory(new ErrorDirectory("GIF did not had hasGlobalColorTable bit."));
            }
            if (integer != null) {
                sequentialReader.skip(integer.intValue() * 3);
            }
            while (true) {
                try {
                    b = sequentialReader.getByte();
                    if (b == 33) {
                        readGifExtensionBlock(sequentialReader, metadata);
                    } else {
                        if (b != 44) {
                            break;
                        }
                        metadata.addDirectory(readImageBlock(sequentialReader));
                        skipBlocks(sequentialReader);
                    }
                } catch (IOException unused3) {
                    return;
                }
            }
            if (b != 59) {
                metadata.addDirectory(new ErrorDirectory("Unknown gif block marker found."));
            }
        } catch (IOException unused4) {
            metadata.addDirectory(new ErrorDirectory("IOException processing GIF data"));
        }
    }

    private static byte[] gatherBytes(SequentialReader sequentialReader, int i) {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        while (i > 0) {
            byteArrayOutputStream.write(sequentialReader.getBytes(i), 0, i);
            i = sequentialReader.getByte() & 255;
        }
        return byteArrayOutputStream.toByteArray();
    }
}
