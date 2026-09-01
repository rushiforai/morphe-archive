package defpackage;

import com.drew.metadata.exif.makernotes.CanonMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r7g {
    public final byte a;
    public final byte b;

    public r7g(int i) {
        this.a = (byte) (i & CanonMakernoteDirectory.TAG_SENSOR_INFO_ARRAY);
        this.b = (byte) (i & 31);
    }
}
