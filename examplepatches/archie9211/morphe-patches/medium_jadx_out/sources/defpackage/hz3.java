package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hz3 implements zc8 {
    public final /* synthetic */ int a;
    public final /* synthetic */ uod b;

    public /* synthetic */ hz3(uod uodVar, int i) {
        this.a = i;
        this.b = uodVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x009e  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0024  */
    @Override // defpackage.zc8
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object A(long r10, long r12, defpackage.n92 r14) {
        /*
            Method dump skipped, instruction units count: 288
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hz3.A(long, long, n92):java.lang.Object");
    }

    @Override // defpackage.zc8
    public final long K(int i, long j) {
        int i2 = this.a;
        uod uodVar = this.b;
        switch (i2) {
            case 0:
                iz3 iz3Var = (iz3) uodVar;
                vod vodVar = iz3Var.a;
                if (((Boolean) iz3Var.d.invoke()).booleanValue()) {
                    float fG = vodVar.c.g();
                    vodVar.b(Float.intBitsToFloat((int) (4294967295L & j)) + vodVar.c.g());
                    if (fG != vodVar.c.g()) {
                        break;
                    }
                }
                break;
            default:
                m54 m54Var = (m54) uodVar;
                vod vodVar2 = m54Var.a;
                if (((Boolean) m54Var.d.invoke()).booleanValue()) {
                    int i3 = (int) (4294967295L & j);
                    if (Float.intBitsToFloat(i3) <= 0.0f) {
                        float fG2 = vodVar2.c.g();
                        vodVar2.b(Float.intBitsToFloat(i3) + vodVar2.c.g());
                        if (fG2 != vodVar2.c.g()) {
                            break;
                        }
                    }
                }
                break;
        }
        return ip8.a(0.0f, 2, j);
    }

    @Override // defpackage.zc8
    public final Object j0(long j, n92 n92Var) {
        switch (this.a) {
        }
        return ev6.I();
    }

    @Override // defpackage.zc8
    public final long n0(long j, long j2, int i) {
        int i2 = this.a;
        uod uodVar = this.b;
        switch (i2) {
            case 0:
                iz3 iz3Var = (iz3) uodVar;
                vod vodVar = iz3Var.a;
                if (((Boolean) iz3Var.d.invoke()).booleanValue()) {
                    int i3 = (int) (j & 4294967295L);
                    vodVar.b.h(Float.intBitsToFloat(i3) + vodVar.b.g());
                    vodVar.b(Float.intBitsToFloat(i3) + vodVar.c.g());
                }
                return 0L;
            default:
                m54 m54Var = (m54) uodVar;
                vod vodVar2 = m54Var.a;
                if (!((Boolean) m54Var.d.invoke()).booleanValue()) {
                    return 0L;
                }
                int i4 = (int) (j & 4294967295L);
                vodVar2.b.h(Float.intBitsToFloat(i4) + vodVar2.b.g());
                int i5 = (int) (j2 & 4294967295L);
                if (Float.intBitsToFloat(i5) < 0.0f || Float.intBitsToFloat(i4) < 0.0f) {
                    float fG = vodVar2.c.g();
                    vodVar2.b(Float.intBitsToFloat(i4) + vodVar2.c.g());
                    float fG2 = vodVar2.c.g() - fG;
                    return (((long) Float.floatToRawIntBits(0.0f)) << 32) | (((long) Float.floatToRawIntBits(fG2)) & 4294967295L);
                }
                if (Float.intBitsToFloat(i5) <= 0.0f) {
                    return 0L;
                }
                float fG3 = vodVar2.c.g();
                vodVar2.b(Float.intBitsToFloat(i5) + vodVar2.c.g());
                float fG4 = vodVar2.c.g() - fG3;
                return (((long) Float.floatToRawIntBits(0.0f)) << 32) | (((long) Float.floatToRawIntBits(fG4)) & 4294967295L);
        }
    }
}
