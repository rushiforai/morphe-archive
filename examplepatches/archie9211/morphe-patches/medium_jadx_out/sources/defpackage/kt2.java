package defpackage;

import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kt2 extends r5d {
    @Override // defpackage.r5d
    public final int a(int i) {
        return i <= 8 ? NikonType2MakernoteDirectory.TAG_SCENE_ASSIST : NikonType2MakernoteDirectory.TAG_UNKNOWN_10;
    }

    @Override // defpackage.r5d
    public final int c() {
        return 10;
    }
}
