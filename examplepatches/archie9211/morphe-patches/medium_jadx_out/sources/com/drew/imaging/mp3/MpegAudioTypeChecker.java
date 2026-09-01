package com.drew.imaging.mp3;

import com.drew.imaging.FileType;
import com.drew.imaging.TypeChecker;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class MpegAudioTypeChecker implements TypeChecker {
    @Override // com.drew.imaging.TypeChecker
    public final FileType checkType(byte[] bArr) {
        if (bArr[0] == -1) {
            byte b = bArr[1];
            if ((b & 224) == 224) {
                return ((b >> 3) & 3) == 1 ? FileType.Unknown : ((b >> 1) & 3) == 0 ? FileType.Unknown : (bArr[2] >> 4) == 15 ? FileType.Unknown : FileType.Mp3;
            }
        }
        return FileType.Unknown;
    }

    @Override // com.drew.imaging.TypeChecker
    public final int getByteCount() {
        return 3;
    }
}
