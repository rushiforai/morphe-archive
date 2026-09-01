package defpackage;

import java.util.Arrays;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class up0 extends co6 implements m45 {
    public final /* synthetic */ long a;
    public final /* synthetic */ long b;
    public final /* synthetic */ long c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public up0(long j, long j2, long j3) {
        super(0);
        this.a = j;
        this.b = j2;
        this.c = j3;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        return String.format(Locale.US, "Too much disk space used (%d/%d): cleaning up to free %d bytes…", Arrays.copyOf(new Object[]{Long.valueOf(this.a), Long.valueOf(this.b), Long.valueOf(this.c)}, 3));
    }
}
