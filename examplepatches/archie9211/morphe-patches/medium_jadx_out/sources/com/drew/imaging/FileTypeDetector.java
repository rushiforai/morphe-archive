package com.drew.imaging;

import com.drew.imaging.mp3.MpegAudioTypeChecker;
import com.drew.imaging.quicktime.QuickTimeTypeChecker;
import com.drew.imaging.riff.RiffTypeChecker;
import com.drew.lang.ByteTrie;
import defpackage.ik4;
import java.io.IOException;
import java.io.InputStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class FileTypeDetector {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private static final int _bytesNeeded;
    private static final TypeChecker[] _fixedCheckers;
    private static final ByteTrie<FileType> _root;

    static {
        TypeChecker[] typeCheckerArr = {new QuickTimeTypeChecker(), new RiffTypeChecker(), new MpegAudioTypeChecker()};
        _fixedCheckers = typeCheckerArr;
        ByteTrie<FileType> byteTrie = new ByteTrie<>();
        _root = byteTrie;
        byteTrie.setDefaultValue(FileType.Unknown);
        byteTrie.addPath(FileType.Jpeg, new byte[]{-1, -40});
        FileType fileType = FileType.Tiff;
        byteTrie.addPath(fileType, "II".getBytes(), new byte[]{42, 0});
        byteTrie.addPath(fileType, "MM".getBytes(), new byte[]{0, 42});
        byteTrie.addPath(FileType.Psd, "8BPS".getBytes());
        byteTrie.addPath(FileType.Png, new byte[]{-119, 80, 78, 71, 13, 10, 26, 10, 0, 0, 0, 13, 73, 72, 68, 82});
        FileType fileType2 = FileType.Bmp;
        byteTrie.addPath(fileType2, "BM".getBytes());
        byteTrie.addPath(fileType2, "BA".getBytes());
        byteTrie.addPath(fileType2, "CI".getBytes());
        byteTrie.addPath(fileType2, "CP".getBytes());
        byteTrie.addPath(fileType2, "IC".getBytes());
        byteTrie.addPath(fileType2, "PT".getBytes());
        FileType fileType3 = FileType.Gif;
        byteTrie.addPath(fileType3, "GIF87a".getBytes());
        byteTrie.addPath(fileType3, "GIF89a".getBytes());
        byteTrie.addPath(FileType.Ico, new byte[]{0, 0, 1, 0});
        FileType fileType4 = FileType.Pcx;
        byteTrie.addPath(fileType4, new byte[]{10, 0, 1});
        byteTrie.addPath(fileType4, new byte[]{10, 2, 1});
        byteTrie.addPath(fileType4, new byte[]{10, 3, 1});
        byteTrie.addPath(fileType4, new byte[]{10, 5, 1});
        byteTrie.addPath(FileType.Crw, "II".getBytes(), new byte[]{26, 0, 0, 0}, "HEAPCCDR".getBytes());
        byteTrie.addPath(FileType.Cr2, "II".getBytes(), new byte[]{42, 0, 16, 0, 0, 0, 67, 82});
        FileType fileType5 = FileType.Orf;
        byteTrie.addPath(fileType5, "IIRO".getBytes(), new byte[]{8, 0});
        byteTrie.addPath(fileType5, "MMOR".getBytes(), new byte[]{0, 0});
        byteTrie.addPath(fileType5, "IIRS".getBytes(), new byte[]{8, 0});
        byteTrie.addPath(FileType.Raf, "FUJIFILMCCD-RAW".getBytes());
        byteTrie.addPath(FileType.Rw2, "II".getBytes(), new byte[]{85, 0});
        FileType fileType6 = FileType.Eps;
        byteTrie.addPath(fileType6, "%!PS".getBytes());
        byteTrie.addPath(fileType6, new byte[]{-59, -48, -45, -58});
        FileType fileType7 = FileType.Aac;
        byteTrie.addPath(fileType7, new byte[]{-1, -15});
        byteTrie.addPath(fileType7, new byte[]{-1, -7});
        byteTrie.addPath(FileType.Asf, new byte[]{48, 38, -78, 117, -114, 102, -49, 17, -90, -39, 0, -86, 0, 98, -50, 108});
        byteTrie.addPath(FileType.Cfbf, new byte[]{-48, -49, 17, -32, -95, -79, 26, -31, 0});
        byteTrie.addPath(FileType.Flv, new byte[]{70, 76, 86});
        byteTrie.addPath(FileType.Indd, new byte[]{6, 6, -19, -11, -40, 29, 70, -27, -67, 49, -17, -25, -2, 116, -73, 29});
        byteTrie.addPath(FileType.Mxf, new byte[]{6, 14, 43, 52, 2, 5, 1, 1, 13, 1, 2, 1, 1, 2});
        byteTrie.addPath(FileType.Pdf, new byte[]{37, 80, 68, 70});
        FileType fileType8 = FileType.Qxp;
        byteTrie.addPath(fileType8, new byte[]{0, 0, 73, 73, 88, 80, 82, 51});
        byteTrie.addPath(fileType8, new byte[]{0, 0, 77, 77, 88, 80, 82, 51});
        byteTrie.addPath(FileType.Ram, new byte[]{114, 116, 115, 112, 58, 47, 47});
        byteTrie.addPath(FileType.Rtf, new byte[]{123, 92, 114, 116, 102, 49});
        FileType fileType9 = FileType.Sit;
        byteTrie.addPath(fileType9, new byte[]{83, 73, 84, 33, 0});
        byteTrie.addPath(fileType9, new byte[]{83, 116, 117, 102, 102, 73, 116, 32, 40, 99, 41, 49, 57, 57, 55, 45});
        byteTrie.addPath(FileType.Sitx, new byte[]{83, 116, 117, 102, 102, 73, 116, 33});
        FileType fileType10 = FileType.Swf;
        byteTrie.addPath(fileType10, "CWS".getBytes());
        byteTrie.addPath(fileType10, "FWS".getBytes());
        byteTrie.addPath(fileType10, "ZWS".getBytes());
        byteTrie.addPath(FileType.Vob, new byte[]{0, 0, 1, -70});
        byteTrie.addPath(FileType.Zip, "PK".getBytes());
        int maxDepth = byteTrie.getMaxDepth();
        for (int i = 0; i < 3; i++) {
            TypeChecker typeChecker = typeCheckerArr[i];
            if (typeChecker.getByteCount() > maxDepth) {
                maxDepth = typeChecker.getByteCount();
            }
        }
        _bytesNeeded = maxDepth;
    }

    private FileTypeDetector() throws Exception {
        throw new Exception("Not intended for instantiation");
    }

    public static FileType detectFileType(InputStream inputStream, String str) throws IOException {
        if (!inputStream.markSupported()) {
            ik4.g("Stream must support mark/reset");
            return null;
        }
        int i = _bytesNeeded;
        inputStream.mark(i);
        byte[] bArr = new byte[i];
        int i2 = 0;
        while (i != 0) {
            int i3 = inputStream.read(bArr, i2, i);
            if (i3 == -1) {
                break;
            }
            i -= i3;
            i2 += i3;
        }
        inputStream.reset();
        FileType fileTypeFind = _root.find(bArr, 0, i2);
        if (fileTypeFind != FileType.Unknown) {
            return str == null ? fileTypeFind : tryDisambiguate(fileTypeFind, str);
        }
        for (TypeChecker typeChecker : _fixedCheckers) {
            fileTypeFind = typeChecker.checkType(bArr);
            if (fileTypeFind != FileType.Unknown) {
                return fileTypeFind;
            }
        }
        return fileTypeFind;
    }

    private static String getExtension(String str) {
        int iLastIndexOf = str.lastIndexOf(46);
        return iLastIndexOf == -1 ? "" : str.substring(iLastIndexOf);
    }

    private static FileType tryDisambiguate(FileType fileType, String str) {
        if (fileType != FileType.Tiff) {
            return fileType;
        }
        String extension = getExtension(str);
        return extension.equalsIgnoreCase(".arw") ? FileType.Arw : extension.equalsIgnoreCase(".dng") ? FileType.Dng : extension.equalsIgnoreCase(".gpr") ? FileType.GoPro : extension.equalsIgnoreCase(".kdc") ? FileType.Kdc : extension.equalsIgnoreCase(".nef") ? FileType.Nef : extension.equalsIgnoreCase(".3fr") ? FileType.ThreeFR : extension.equalsIgnoreCase(".pef") ? FileType.Pef : extension.equalsIgnoreCase(".srw") ? FileType.Srw : fileType;
    }

    public static FileType detectFileType(InputStream inputStream) {
        return detectFileType(inputStream, null);
    }
}
