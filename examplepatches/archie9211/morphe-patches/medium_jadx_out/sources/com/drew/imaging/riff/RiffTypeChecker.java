package com.drew.imaging.riff;

import com.drew.imaging.FileType;
import com.drew.imaging.TypeChecker;
import com.drew.metadata.avi.AviDirectory;
import com.drew.metadata.wav.WavDirectory;
import com.drew.metadata.webp.WebpDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class RiffTypeChecker implements TypeChecker {
    @Override // com.drew.imaging.TypeChecker
    public final FileType checkType(byte[] bArr) {
        if (!new String(bArr, 0, 4).equals("RIFF")) {
            return FileType.Unknown;
        }
        String str = new String(bArr, 8, 4);
        return str.equals(WavDirectory.FORMAT) ? FileType.Wav : str.equals(AviDirectory.FORMAT) ? FileType.Avi : str.equals(WebpDirectory.FORMAT) ? FileType.WebP : FileType.Riff;
    }

    @Override // com.drew.imaging.TypeChecker
    public final int getByteCount() {
        return 12;
    }
}
