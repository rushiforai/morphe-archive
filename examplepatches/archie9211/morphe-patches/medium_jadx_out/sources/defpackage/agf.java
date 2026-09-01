package defpackage;

import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class agf implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ yua b;
    public final /* synthetic */ rya c;
    public final /* synthetic */ rya d;
    public final /* synthetic */ rya e;

    public /* synthetic */ agf(yua yuaVar, rya ryaVar, rya ryaVar2, rya ryaVar3) {
        this.b = yuaVar;
        this.c = ryaVar;
        this.d = ryaVar2;
        this.e = ryaVar3;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) throws IOException {
        int i = this.a;
        c1e c1eVar = c1e.a;
        rya ryaVar = this.e;
        rya ryaVar2 = this.d;
        rya ryaVar3 = this.c;
        yua yuaVar = this.b;
        switch (i) {
            case 0:
                int iIntValue = ((Integer) obj).intValue();
                long jLongValue = ((Long) obj2).longValue();
                if (iIntValue == 1) {
                    if (ryaVar3.a != null) {
                        ik4.g("bad zip: NTFS extra attribute tag 0x0001 repeated");
                    } else if (jLongValue != 24) {
                        ik4.g("bad zip: NTFS extra attribute tag 0x0001 size != 24");
                    } else {
                        ryaVar3.a = Long.valueOf(yuaVar.r0());
                        ryaVar2.a = Long.valueOf(yuaVar.r0());
                        ryaVar.a = Long.valueOf(yuaVar.r0());
                    }
                }
                break;
            default:
                int iIntValue2 = ((Integer) obj).intValue();
                long jLongValue2 = ((Long) obj2).longValue();
                if (iIntValue2 == 21589) {
                    if (jLongValue2 < 1) {
                        ik4.g("bad zip: extended timestamp extra too short");
                    } else {
                        byte b = yuaVar.readByte();
                        boolean z = (b & 1) == 1;
                        boolean z2 = (b & 2) == 2;
                        boolean z3 = (b & 4) == 4;
                        long j = z ? 5L : 1L;
                        if (z2) {
                            j += 4;
                        }
                        if (z3) {
                            j += 4;
                        }
                        if (jLongValue2 < j) {
                            ik4.g("bad zip: extended timestamp extra too short");
                        } else {
                            if (z) {
                                ryaVar3.a = Integer.valueOf(yuaVar.i0());
                            }
                            if (z2) {
                                ryaVar2.a = Integer.valueOf(yuaVar.i0());
                            }
                            if (z3) {
                                ryaVar.a = Integer.valueOf(yuaVar.i0());
                            }
                        }
                    }
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ agf(rya ryaVar, yua yuaVar, rya ryaVar2, rya ryaVar3) {
        this.c = ryaVar;
        this.b = yuaVar;
        this.d = ryaVar2;
        this.e = ryaVar3;
    }
}
