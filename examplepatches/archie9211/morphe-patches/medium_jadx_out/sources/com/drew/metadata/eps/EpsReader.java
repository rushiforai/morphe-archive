package com.drew.metadata.eps;

import com.drew.imaging.tiff.TiffProcessingException;
import com.drew.imaging.tiff.TiffReader;
import com.drew.lang.ByteArrayReader;
import com.drew.lang.Charsets;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.lang.SequentialByteArrayReader;
import com.drew.lang.SequentialReader;
import com.drew.lang.StreamReader;
import com.drew.metadata.Directory;
import com.drew.metadata.Metadata;
import com.drew.metadata.icc.IccReader;
import com.drew.metadata.photoshop.PhotoshopReader;
import com.drew.metadata.photoshop.PhotoshopTiffHandler;
import com.drew.metadata.xmp.XmpReader;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class EpsReader {
    private int _previousTag;

    private void addToDirectory(EpsDirectory epsDirectory, String str, String str2) {
        Integer num = EpsDirectory._tagIntegerMap.get(str);
        if (num == null) {
            return;
        }
        int iIntValue = num.intValue();
        if (iIntValue == 8) {
            extractImageData(epsDirectory, str2);
        } else if (iIntValue == 36) {
            epsDirectory.setObject(this._previousTag, epsDirectory.getString(this._previousTag) + " " + str2);
        } else if (!EpsDirectory._tagNameMap.containsKey(num) || epsDirectory.containsTag(num.intValue())) {
            this._previousTag = 0;
        } else {
            epsDirectory.setString(num.intValue(), str2);
            this._previousTag = num.intValue();
        }
        this._previousTag = num.intValue();
    }

    private static byte[] decodeHexCommentBlock(SequentialReader sequentialReader) {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        boolean z = false;
        char c = 0;
        byte b = 0;
        int i = 0;
        while (!z) {
            b = sequentialReader.getByte();
            char c2 = 1;
            if (c != 0) {
                if (c != 1) {
                    c2 = 3;
                    if (c == 2) {
                        int iTryHexToInt = tryHexToInt(b);
                        if (iTryHexToInt != -1) {
                            i = iTryHexToInt * 16;
                            c = c2;
                        } else {
                            if (b != 13 && b != 10) {
                                return null;
                            }
                            c = 0;
                        }
                    } else if (c == 3) {
                        int iTryHexToInt2 = tryHexToInt(b);
                        if (iTryHexToInt2 == -1) {
                            return null;
                        }
                        byteArrayOutputStream.write(iTryHexToInt2 + i);
                        c = 2;
                    } else {
                        continue;
                    }
                } else if (b != 32) {
                    z = true;
                } else {
                    c = 2;
                }
            } else if (b != 10 && b != 13 && b != 32) {
                if (b != 37) {
                    return null;
                }
                c = c2;
            }
        }
        while (b != 10) {
            b = sequentialReader.getByte();
        }
        return byteArrayOutputStream.toByteArray();
    }

    private static void extractIccData(Metadata metadata, SequentialReader sequentialReader) {
        byte[] bArrDecodeHexCommentBlock = decodeHexCommentBlock(sequentialReader);
        if (bArrDecodeHexCommentBlock != null) {
            new IccReader().extract(new ByteArrayReader(bArrDecodeHexCommentBlock, 0), metadata, null);
        }
    }

    private static void extractImageData(EpsDirectory epsDirectory, String str) {
        epsDirectory.setString(8, str.trim());
        String[] strArrSplit = str.split(" ");
        int i = 0;
        int i2 = Integer.parseInt(strArrSplit[0]);
        int i3 = Integer.parseInt(strArrSplit[1]);
        int i4 = Integer.parseInt(strArrSplit[3]);
        if (!epsDirectory.containsTag(28)) {
            epsDirectory.setInt(28, i2);
        }
        if (!epsDirectory.containsTag(29)) {
            epsDirectory.setInt(29, i3);
        }
        if (!epsDirectory.containsTag(30)) {
            epsDirectory.setInt(30, i4);
        }
        if (epsDirectory.containsTag(31)) {
            return;
        }
        if (i4 == 1) {
            i = 1;
        } else if (i4 == 2 || i4 == 3 || i4 == 4) {
            i = 3;
        }
        if (i != 0) {
            epsDirectory.setInt(31, i * i2 * i3);
        }
    }

    private static void extractPhotoshopData(Metadata metadata, SequentialReader sequentialReader) {
        byte[] bArrDecodeHexCommentBlock = decodeHexCommentBlock(sequentialReader);
        if (bArrDecodeHexCommentBlock != null) {
            new PhotoshopReader().extract(new SequentialByteArrayReader(bArrDecodeHexCommentBlock, 0), bArrDecodeHexCommentBlock.length, metadata, null);
        }
    }

    private static void extractXmpData(Metadata metadata, SequentialReader sequentialReader) {
        new XmpReader().extract(new String(readUntil(sequentialReader, "<?xpacket end=\"w\"?>".getBytes()), Charsets.UTF_8), metadata, (Directory) null);
    }

    private static byte[] readUntil(SequentialReader sequentialReader, byte[] bArr) {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        int length = bArr.length;
        int i = 0;
        while (i != length) {
            byte b = sequentialReader.getByte();
            i = b == bArr[i] ? i + 1 : 0;
            byteArrayOutputStream.write(b);
        }
        return byteArrayOutputStream.toByteArray();
    }

    private static int tryHexToInt(byte b) {
        if (b >= 48 && b <= 57) {
            return b - 48;
        }
        if (b >= 65 && b <= 70) {
            return b - 55;
        }
        if (b < 97 || b > 102) {
            return -1;
        }
        return b - 87;
    }

    public final void extract(InputStream inputStream, Metadata metadata) throws Throwable {
        RandomAccessStreamReader randomAccessStreamReader = new RandomAccessStreamReader(inputStream);
        EpsDirectory epsDirectory = new EpsDirectory();
        metadata.addDirectory(epsDirectory);
        int int32 = randomAccessStreamReader.getInt32(0);
        if (int32 != -976170042) {
            if (int32 != 622940243) {
                epsDirectory.addError("File type not supported.");
                return;
            } else {
                inputStream.reset();
                extract(epsDirectory, metadata, new StreamReader(inputStream));
                return;
            }
        }
        randomAccessStreamReader.setMotorolaByteOrder(false);
        int int322 = randomAccessStreamReader.getInt32(4);
        int int323 = randomAccessStreamReader.getInt32(8);
        int int324 = randomAccessStreamReader.getInt32(12);
        int int325 = randomAccessStreamReader.getInt32(16);
        int int326 = randomAccessStreamReader.getInt32(20);
        int int327 = randomAccessStreamReader.getInt32(24);
        if (int327 != 0) {
            epsDirectory.setInt(32, int327);
            epsDirectory.setInt(33, int326);
            try {
                new TiffReader().processTiff(new ByteArrayReader(randomAccessStreamReader.getBytes(int326, int327), 0), new PhotoshopTiffHandler(metadata, null, 0), 0);
            } catch (TiffProcessingException e) {
                epsDirectory.addError("Unable to process TIFF data: " + e.getMessage());
            }
        } else if (int325 != 0) {
            epsDirectory.setInt(34, int325);
            epsDirectory.setInt(35, int324);
        }
        extract(epsDirectory, metadata, new SequentialByteArrayReader(randomAccessStreamReader.getBytes(int322, int323), 0));
    }

    private void extract(EpsDirectory epsDirectory, Metadata metadata, SequentialReader sequentialReader) {
        String strTrim;
        StringBuilder sb = new StringBuilder();
        while (true) {
            sb.setLength(0);
            while (true) {
                char c = (char) sequentialReader.getByte();
                if (c == '\r' || c == '\n') {
                    break;
                } else {
                    sb.append(c);
                }
            }
            if (sb.length() != 0 && sb.charAt(0) != '%') {
                return;
            }
            int iIndexOf = sb.indexOf(":");
            if (iIndexOf != -1) {
                strTrim = sb.substring(0, iIndexOf).trim();
                addToDirectory(epsDirectory, strTrim, sb.substring(iIndexOf + 1).trim());
            } else {
                strTrim = sb.toString().trim();
            }
            if (strTrim.equals("%BeginPhotoshop")) {
                extractPhotoshopData(metadata, sequentialReader);
            } else if (strTrim.equals("%%BeginICCProfile")) {
                extractIccData(metadata, sequentialReader);
            } else if (strTrim.equals("%begin_xml_packet")) {
                extractXmpData(metadata, sequentialReader);
            }
        }
    }
}
