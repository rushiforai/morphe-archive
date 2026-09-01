package defpackage;

import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fsg extends dvg {
    public final nsg i;
    public final wjc j;

    public fsg(nsg nsgVar, wjc wjcVar) {
        this.i = nsgVar;
        this.j = wjcVar;
    }

    public static fsg R(nsg nsgVar, wjc wjcVar) throws GeneralSecurityException {
        int i;
        byte[] bArrI;
        cmf cmfVar = (cmf) wjcVar.b;
        if (cmfVar.a.length != 32) {
            int length = cmfVar.a.length;
            throw new GeneralSecurityException(b09.A(new StringBuilder(String.valueOf(length).length() + 65), length, "Ed25519 key must be constructed with key of length 32 bytes, not "));
        }
        byte[] bArrB = nsgVar.j.b();
        byte[] bArrI0 = ht2.I0(cmfVar.b());
        byte[] bArr = new byte[64];
        int i2 = 0;
        while (true) {
            if (i2 >= 32) {
                break;
            }
            int i3 = i2 + i2;
            bArr[i3] = (byte) (bArrI0[i2] & 15);
            bArr[i3 + 1] = (byte) ((bArrI0[i2] & 255) >> 4);
            i2++;
        }
        int i4 = 0;
        int i5 = 0;
        while (i4 < 63) {
            byte b = (byte) (bArr[i4] + i5);
            bArr[i4] = b;
            int i6 = (b + 8) >> 4;
            bArr[i4] = (byte) (b - (i6 << 4));
            i4++;
            i5 = i6;
        }
        bArr[63] = (byte) (bArr[63] + i5);
        d2f d2fVar = new d2f();
        zjf zjfVar = new zjf(14);
        for (i = 1; i < 64; i += 2) {
            akg akgVar = new akg();
            ht2.O0(akgVar, i / 2, bArr[i]);
            zjf.m(zjfVar, d2fVar);
            ht2.K0(d2fVar, zjfVar, akgVar);
        }
        tag tagVar = new tag();
        tag.g(d2fVar, tagVar);
        ht2.M0(d2fVar, tagVar);
        tag.g(d2fVar, tagVar);
        ht2.M0(d2fVar, tagVar);
        tag.g(d2fVar, tagVar);
        ht2.M0(d2fVar, tagVar);
        tag.g(d2fVar, tagVar);
        ht2.M0(d2fVar, tagVar);
        for (int i7 = 0; i7 < 64; i7 += 2) {
            akg akgVar2 = new akg();
            ht2.O0(akgVar2, i7 / 2, bArr[i7]);
            zjf.m(zjfVar, d2fVar);
            ht2.K0(d2fVar, zjfVar, akgVar2);
        }
        tag tagVar2 = new tag(d2fVar);
        long[] jArr = new long[10];
        vv2.k0(jArr, (long[]) tagVar2.a);
        long[] jArr2 = new long[10];
        vv2.k0(jArr2, (long[]) tagVar2.b);
        long[] jArr3 = new long[10];
        vv2.k0(jArr3, (long[]) tagVar2.c);
        long[] jArr4 = new long[10];
        vv2.k0(jArr4, jArr3);
        long[] jArr5 = new long[10];
        vv2.g0(jArr5, jArr2, jArr);
        vv2.j0(jArr5, jArr5, jArr3);
        long[] jArr6 = new long[10];
        vv2.j0(jArr6, jArr, jArr2);
        vv2.j0(jArr6, jArr6, ekg.a);
        vv2.f0(jArr6, jArr6, jArr4);
        vv2.h0(jArr6, jArr6);
        if (MessageDigest.isEqual(vv2.m0(jArr5), vv2.m0(jArr6))) {
            bArrI = tagVar2.i();
        } else {
            ygf.f("arithmetic error in scalar multiplication");
            bArrI = null;
        }
        if (Arrays.equals(bArrB, bArrI)) {
            return new fsg(nsgVar, wjcVar);
        }
        ygf.l("Ed25519 keys mismatch");
        return null;
    }

    @Override // defpackage.ur7
    public final jjg H() {
        return this.i.i;
    }

    @Override // defpackage.dvg
    public final /* synthetic */ evg Q() {
        return this.i;
    }
}
