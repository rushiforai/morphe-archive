package defpackage;

import java.util.Random;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class z1 extends msa {
    @Override // defpackage.msa
    public final int a(int i) {
        return (f().nextInt() >>> (32 - i)) & ((-i) >> 31);
    }

    @Override // defpackage.msa
    public final int b() {
        return f().nextInt();
    }

    @Override // defpackage.msa
    public final long d() {
        return f().nextLong();
    }

    public abstract Random f();
}
