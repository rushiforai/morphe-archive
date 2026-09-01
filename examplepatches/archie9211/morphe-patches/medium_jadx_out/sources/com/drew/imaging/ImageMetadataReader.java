package com.drew.imaging;

import com.drew.imaging.avi.AviMetadataReader;
import com.drew.imaging.bmp.BmpMetadataReader;
import com.drew.imaging.eps.EpsMetadataReader;
import com.drew.imaging.gif.GifMetadataReader;
import com.drew.imaging.heif.HeifMetadataReader;
import com.drew.imaging.ico.IcoMetadataReader;
import com.drew.imaging.jpeg.JpegMetadataReader;
import com.drew.imaging.jpeg.JpegSegmentMetadataReader;
import com.drew.imaging.mp3.Mp3MetadataReader;
import com.drew.imaging.mp4.Mp4MetadataReader;
import com.drew.imaging.pcx.PcxMetadataReader;
import com.drew.imaging.png.PngMetadataReader;
import com.drew.imaging.psd.PsdMetadataReader;
import com.drew.imaging.quicktime.QuickTimeMetadataReader;
import com.drew.imaging.raf.RafMetadataReader;
import com.drew.imaging.tiff.TiffMetadataReader;
import com.drew.imaging.wav.WavMetadataReader;
import com.drew.imaging.webp.WebpMetadataReader;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.lang.StringUtil;
import com.drew.metadata.Directory;
import com.drew.metadata.Metadata;
import com.drew.metadata.Tag;
import com.drew.metadata.exif.ExifIFD0Directory;
import com.drew.metadata.file.FileSystemMetadataReader;
import com.drew.metadata.file.FileTypeDirectory;
import com.drew.metadata.xmp.XmpDirectory;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ImageMetadataReader {

    /* JADX INFO: renamed from: com.drew.imaging.ImageMetadataReader$1, reason: invalid class name */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$drew$imaging$FileType;

        static {
            int[] iArr = new int[FileType.values().length];
            $SwitchMap$com$drew$imaging$FileType = iArr;
            try {
                iArr[FileType.Jpeg.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$drew$imaging$FileType[FileType.Tiff.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$drew$imaging$FileType[FileType.Arw.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$com$drew$imaging$FileType[FileType.Cr2.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                $SwitchMap$com$drew$imaging$FileType[FileType.Nef.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                $SwitchMap$com$drew$imaging$FileType[FileType.Orf.ordinal()] = 6;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                $SwitchMap$com$drew$imaging$FileType[FileType.Rw2.ordinal()] = 7;
            } catch (NoSuchFieldError unused7) {
            }
            try {
                $SwitchMap$com$drew$imaging$FileType[FileType.Dng.ordinal()] = 8;
            } catch (NoSuchFieldError unused8) {
            }
            try {
                $SwitchMap$com$drew$imaging$FileType[FileType.GoPro.ordinal()] = 9;
            } catch (NoSuchFieldError unused9) {
            }
            try {
                $SwitchMap$com$drew$imaging$FileType[FileType.Kdc.ordinal()] = 10;
            } catch (NoSuchFieldError unused10) {
            }
            try {
                $SwitchMap$com$drew$imaging$FileType[FileType.ThreeFR.ordinal()] = 11;
            } catch (NoSuchFieldError unused11) {
            }
            try {
                $SwitchMap$com$drew$imaging$FileType[FileType.Pef.ordinal()] = 12;
            } catch (NoSuchFieldError unused12) {
            }
            try {
                $SwitchMap$com$drew$imaging$FileType[FileType.Srw.ordinal()] = 13;
            } catch (NoSuchFieldError unused13) {
            }
            try {
                $SwitchMap$com$drew$imaging$FileType[FileType.Psd.ordinal()] = 14;
            } catch (NoSuchFieldError unused14) {
            }
            try {
                $SwitchMap$com$drew$imaging$FileType[FileType.Png.ordinal()] = 15;
            } catch (NoSuchFieldError unused15) {
            }
            try {
                $SwitchMap$com$drew$imaging$FileType[FileType.Bmp.ordinal()] = 16;
            } catch (NoSuchFieldError unused16) {
            }
            try {
                $SwitchMap$com$drew$imaging$FileType[FileType.Gif.ordinal()] = 17;
            } catch (NoSuchFieldError unused17) {
            }
            try {
                $SwitchMap$com$drew$imaging$FileType[FileType.Ico.ordinal()] = 18;
            } catch (NoSuchFieldError unused18) {
            }
            try {
                $SwitchMap$com$drew$imaging$FileType[FileType.Pcx.ordinal()] = 19;
            } catch (NoSuchFieldError unused19) {
            }
            try {
                $SwitchMap$com$drew$imaging$FileType[FileType.WebP.ordinal()] = 20;
            } catch (NoSuchFieldError unused20) {
            }
            try {
                $SwitchMap$com$drew$imaging$FileType[FileType.Raf.ordinal()] = 21;
            } catch (NoSuchFieldError unused21) {
            }
            try {
                $SwitchMap$com$drew$imaging$FileType[FileType.Avi.ordinal()] = 22;
            } catch (NoSuchFieldError unused22) {
            }
            try {
                $SwitchMap$com$drew$imaging$FileType[FileType.Wav.ordinal()] = 23;
            } catch (NoSuchFieldError unused23) {
            }
            try {
                $SwitchMap$com$drew$imaging$FileType[FileType.QuickTime.ordinal()] = 24;
            } catch (NoSuchFieldError unused24) {
            }
            try {
                $SwitchMap$com$drew$imaging$FileType[FileType.Mp4.ordinal()] = 25;
            } catch (NoSuchFieldError unused25) {
            }
            try {
                $SwitchMap$com$drew$imaging$FileType[FileType.Mp3.ordinal()] = 26;
            } catch (NoSuchFieldError unused26) {
            }
            try {
                $SwitchMap$com$drew$imaging$FileType[FileType.Eps.ordinal()] = 27;
            } catch (NoSuchFieldError unused27) {
            }
            try {
                $SwitchMap$com$drew$imaging$FileType[FileType.Heif.ordinal()] = 28;
            } catch (NoSuchFieldError unused28) {
            }
            try {
                $SwitchMap$com$drew$imaging$FileType[FileType.Avif.ordinal()] = 29;
            } catch (NoSuchFieldError unused29) {
            }
            try {
                $SwitchMap$com$drew$imaging$FileType[FileType.Unknown.ordinal()] = 30;
            } catch (NoSuchFieldError unused30) {
            }
        }
    }

    private ImageMetadataReader() throws Exception {
        throw new Exception("Not intended for instantiation");
    }

    public static void main(String[] strArr) {
        Metadata metadata;
        int i;
        ArrayList<String> arrayList = new ArrayList(Arrays.asList(strArr));
        boolean zRemove = arrayList.remove("-markdown");
        boolean zRemove2 = arrayList.remove("-hex");
        int i2 = 1;
        if (arrayList.size() < 1) {
            String implementationVersion = ImageMetadataReader.class.getPackage().getImplementationVersion();
            System.out.println("metadata-extractor version " + implementationVersion);
            System.out.println();
            PrintStream printStream = System.out;
            if (implementationVersion == null) {
                implementationVersion = "a.b.c";
            }
            printStream.println("Usage: java -jar metadata-extractor-" + implementationVersion + ".jar <filename> [<filename>] [-thumb] [-markdown] [-hex]");
            System.exit(1);
        }
        for (String str : arrayList) {
            long jNanoTime = System.nanoTime();
            File file = new File(str);
            int i3 = 0;
            if (!zRemove && arrayList.size() > i2) {
                PrintStream printStream2 = System.out;
                Object[] objArr = new Object[i2];
                objArr[0] = str;
                printStream2.printf("%n***** PROCESSING: %s%n%n", objArr);
            }
            try {
                metadata = readMetadata(file);
            } catch (Exception e) {
                e.printStackTrace(System.err);
                System.exit(i2);
                metadata = null;
            }
            long jNanoTime2 = System.nanoTime() - jNanoTime;
            char c = 2;
            if (!zRemove) {
                PrintStream printStream3 = System.out;
                Double dValueOf = Double.valueOf(file.length() / 1048576.0d);
                Double dValueOf2 = Double.valueOf(jNanoTime2 / 1000000.0d);
                Object[] objArr2 = new Object[2];
                objArr2[0] = dValueOf;
                objArr2[i2] = dValueOf2;
                printStream3.printf("Processed %.3f MB file in %.2f ms%n%n", objArr2);
            }
            if (zRemove) {
                String name = file.getName();
                String strUrlEncode = StringUtil.urlEncode(str);
                ExifIFD0Directory exifIFD0Directory = (ExifIFD0Directory) metadata.getFirstDirectoryOfType(ExifIFD0Directory.class);
                String string = exifIFD0Directory == null ? "" : exifIFD0Directory.getString(271);
                String string2 = exifIFD0Directory != null ? exifIFD0Directory.getString(272) : "";
                System.out.println();
                System.out.println("---");
                System.out.println();
                PrintStream printStream4 = System.out;
                Object[] objArr3 = new Object[2];
                objArr3[0] = string;
                objArr3[i2] = string2;
                printStream4.printf("# %s - %s%n", objArr3);
                System.out.println();
                PrintStream printStream5 = System.out;
                Object[] objArr4 = new Object[i2];
                objArr4[0] = strUrlEncode;
                printStream5.printf("<a href=\"https://raw.githubusercontent.com/drewnoakes/metadata-extractor-images/master/%s\">%n", objArr4);
                PrintStream printStream6 = System.out;
                Object[] objArr5 = new Object[i2];
                objArr5[0] = strUrlEncode;
                printStream6.printf("<img src=\"https://raw.githubusercontent.com/drewnoakes/metadata-extractor-images/master/%s\" width=\"300\"/><br/>%n", objArr5);
                System.out.println(name);
                System.out.println("</a>");
                System.out.println();
                System.out.println("Directory | Tag Id | Tag Name | Extracted Value");
                System.out.println(":--------:|-------:|----------|----------------");
            }
            for (Directory directory : metadata.getDirectories()) {
                String name2 = directory.getName();
                for (Tag tag : directory.getTags()) {
                    String tagName = tag.getTagName();
                    int i4 = i2;
                    String description = tag.getDescription();
                    char c2 = c;
                    if (description != null && description.length() > 1024) {
                        description = description.substring(i3, 1024).concat("...");
                    }
                    if (zRemove) {
                        PrintStream printStream7 = System.out;
                        String hexString = Integer.toHexString(tag.getTagType());
                        Object[] objArr6 = new Object[4];
                        objArr6[i3] = name2;
                        objArr6[i4] = hexString;
                        objArr6[c2] = tagName;
                        objArr6[3] = description;
                        printStream7.printf("%s|0x%s|%s|%s%n", objArr6);
                    } else if (zRemove2) {
                        PrintStream printStream8 = System.out;
                        String tagTypeHex = tag.getTagTypeHex();
                        Object[] objArr7 = new Object[4];
                        objArr7[i3] = name2;
                        objArr7[i4] = tagTypeHex;
                        objArr7[c2] = tagName;
                        objArr7[3] = description;
                        printStream8.printf("[%s - %s] %s = %s%n", objArr7);
                    } else {
                        PrintStream printStream9 = System.out;
                        Object[] objArr8 = new Object[3];
                        objArr8[i3] = name2;
                        objArr8[i4] = tagName;
                        objArr8[c2] = description;
                        printStream9.printf("[%s] %s = %s%n", objArr8);
                    }
                    i2 = i4;
                    c = c2;
                }
                int i5 = i2;
                char c3 = c;
                if (directory instanceof XmpDirectory) {
                    for (Map.Entry<String, String> entry : ((XmpDirectory) directory).getXmpProperties().entrySet()) {
                        String key = entry.getKey();
                        String value = entry.getValue();
                        if (value != null && value.length() > 1024) {
                            value = value.substring(i3, 1024).concat("...");
                        }
                        if (zRemove) {
                            PrintStream printStream10 = System.out;
                            i = i3;
                            Object[] objArr9 = new Object[3];
                            objArr9[i] = name2;
                            objArr9[i5] = key;
                            objArr9[c3] = value;
                            printStream10.printf("%s||%s|%s%n", objArr9);
                        } else {
                            i = i3;
                            PrintStream printStream11 = System.out;
                            Object[] objArr10 = new Object[3];
                            objArr10[i] = name2;
                            objArr10[i5] = key;
                            objArr10[c3] = value;
                            printStream11.printf("[%s] %s = %s%n", objArr10);
                        }
                        i3 = i;
                    }
                }
                int i6 = i3;
                for (String str2 : directory.getErrors()) {
                    System.err.println("ERROR: " + str2);
                }
                i2 = i5;
                i3 = i6;
                c = c3;
            }
        }
    }

    public static Metadata readMetadata(InputStream inputStream, long j, FileType fileType) throws ImageProcessingException {
        switch (AnonymousClass1.$SwitchMap$com$drew$imaging$FileType[fileType.ordinal()]) {
            case 1:
                return JpegMetadataReader.readMetadata(inputStream, (Iterable<JpegSegmentMetadataReader>) null);
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
                return TiffMetadataReader.readMetadata(new RandomAccessStreamReader(inputStream, RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH, j));
            case 14:
                return PsdMetadataReader.readMetadata(inputStream);
            case 15:
                return PngMetadataReader.readMetadata(inputStream);
            case 16:
                return BmpMetadataReader.readMetadata(inputStream);
            case 17:
                return GifMetadataReader.readMetadata(inputStream);
            case 18:
                return IcoMetadataReader.readMetadata(inputStream);
            case 19:
                return PcxMetadataReader.readMetadata(inputStream);
            case 20:
                return WebpMetadataReader.readMetadata(inputStream);
            case 21:
                return RafMetadataReader.readMetadata(inputStream);
            case 22:
                return AviMetadataReader.readMetadata(inputStream);
            case 23:
                return WavMetadataReader.readMetadata(inputStream);
            case 24:
                return QuickTimeMetadataReader.readMetadata(inputStream);
            case 25:
                return Mp4MetadataReader.readMetadata(inputStream);
            case 26:
                return Mp3MetadataReader.readMetadata(inputStream);
            case 27:
                return EpsMetadataReader.readMetadata(inputStream);
            case 28:
            case 29:
                return HeifMetadataReader.readMetadata(inputStream);
            case 30:
                throw new ImageProcessingException("File format could not be determined", null);
            default:
                return new Metadata();
        }
    }

    public static Metadata readMetadata(InputStream inputStream, long j) {
        return readMetadata(inputStream, j, (String) null);
    }

    public static Metadata readMetadata(InputStream inputStream, long j, String str) throws ImageProcessingException, IOException {
        BufferedInputStream bufferedInputStream = inputStream instanceof BufferedInputStream ? (BufferedInputStream) inputStream : new BufferedInputStream(inputStream);
        FileType fileTypeDetectFileType = FileTypeDetector.detectFileType(bufferedInputStream, str);
        Metadata metadata = readMetadata(bufferedInputStream, j, fileTypeDetectFileType);
        metadata.addDirectory(new FileTypeDirectory(fileTypeDetectFileType));
        return metadata;
    }

    public static Metadata readMetadata(InputStream inputStream) {
        return readMetadata(inputStream, -1L, (String) null);
    }

    public static Metadata readMetadata(File file) throws IOException {
        FileInputStream fileInputStream = new FileInputStream(file);
        try {
            Metadata metadata = readMetadata(fileInputStream, file.length(), file.getName());
            fileInputStream.close();
            new FileSystemMetadataReader().read(file, metadata);
            return metadata;
        } catch (Throwable th) {
            fileInputStream.close();
            throw th;
        }
    }
}
