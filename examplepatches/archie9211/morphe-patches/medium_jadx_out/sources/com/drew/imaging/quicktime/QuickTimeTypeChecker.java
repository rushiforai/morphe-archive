package com.drew.imaging.quicktime;

import com.drew.imaging.FileType;
import com.drew.imaging.TypeChecker;
import com.drew.imaging.riff.pvS.uuLAxLN;
import com.drew.metadata.heif.HeifContainerTypes;
import com.medium.android.profile.ui.premium.cfCC.mgKMENwrbHf;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class QuickTimeTypeChecker implements TypeChecker {
    private static final HashMap<String, FileType> _ftypMap;

    @Override // com.drew.imaging.TypeChecker
    public final FileType checkType(byte[] bArr) {
        if (bArr[4] != 102 || bArr[5] != 116 || bArr[6] != 121 || bArr[7] != 112) {
            return FileType.Unknown;
        }
        FileType fileType = _ftypMap.get(new String(bArr, 8, 4));
        return fileType != null ? fileType : FileType.QuickTime;
    }

    @Override // com.drew.imaging.TypeChecker
    public final int getByteCount() {
        return 12;
    }

    static {
        HashMap<String, FileType> map = new HashMap<>();
        _ftypMap = map;
        FileType fileType = FileType.QuickTime;
        map.put(uuLAxLN.aALb, fileType);
        map.put("wide", fileType);
        map.put(HeifContainerTypes.BOX_MEDIA_DATA, fileType);
        map.put("free", fileType);
        map.put("qt  ", fileType);
        map.put("3g2a", fileType);
        FileType fileType2 = FileType.Mp4;
        map.put("3gp5", fileType2);
        map.put("avc1", fileType2);
        map.put("iso2", fileType2);
        map.put(mgKMENwrbHf.UTjOyUWHhl, fileType2);
        map.put("M4A ", fileType2);
        map.put("M4B ", fileType2);
        map.put("M4P ", fileType2);
        map.put("M4V ", fileType2);
        map.put("M4VH", fileType2);
        map.put("M4VP", fileType2);
        map.put("mmp4", fileType2);
        map.put("mp41", fileType2);
        map.put("mp42", fileType2);
        map.put("mp71", fileType2);
        map.put("MSNV", fileType2);
        map.put("NDAS", fileType2);
        map.put("NDSC", fileType2);
        map.put("NDSH", fileType2);
        map.put("NDSM", fileType2);
        map.put("NDSP", fileType2);
        map.put("NDSS", fileType2);
        map.put("NDXC", fileType2);
        map.put("NDXH", fileType2);
        map.put("NDXM", fileType2);
        map.put("NDXP", fileType2);
        map.put("NDXS", fileType2);
        map.put("nvr1", fileType2);
        FileType fileType3 = FileType.Heif;
        map.put("mif1", fileType3);
        map.put("msf1", fileType3);
        map.put("heic", fileType3);
        map.put("heix", fileType3);
        map.put("hevc", fileType3);
        map.put("hevx", fileType3);
        map.put("avif", FileType.Avif);
        map.put("crx ", FileType.Crx);
    }
}
