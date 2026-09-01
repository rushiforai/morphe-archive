package defpackage;

import java.math.BigInteger;
import java.nio.charset.Charset;
import java.security.GeneralSecurityException;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qeg implements xwf {
    public static final byte[] g = new byte[0];
    public final zjf a;
    public final reg b;
    public final d1g c;
    public final keg d;
    public final int e;
    public final byte[] f;

    public qeg(zjf zjfVar, reg regVar, d1g d1gVar, keg kegVar, int i, qvg qvgVar) {
        this.a = zjfVar;
        this.b = regVar;
        this.c = d1gVar;
        this.d = kegVar;
        this.e = i;
        this.f = qvgVar.b();
    }

    @Override // defpackage.xwf
    public final byte[] a(byte[] bArr) throws GeneralSecurityException {
        byte[] bArr2;
        byte[] bArrG;
        byte[] bArr3 = this.f;
        int length = this.e + bArr3.length;
        if (bArr.length < length) {
            ygf.l("Ciphertext is too short.");
            return null;
        }
        if (!ejg.b(bArr3, bArr)) {
            ygf.l("Invalid ciphertext (output prefix mismatch)");
            return null;
        }
        byte[] bArr4 = new byte[0];
        byte[] bArrCopyOfRange = Arrays.copyOfRange(bArr, this.f.length, length);
        zjf zjfVar = this.a;
        reg regVar = this.b;
        d1g d1gVar = this.c;
        keg kegVar = this.d;
        byte[] bArrA0 = regVar.a0(bArrCopyOfRange, zjfVar);
        byte[] bArrMo102zza = regVar.mo102zza();
        switch (d1gVar.b) {
            case "HmacSha256":
                bArr2 = weg.f;
                break;
            case "HmacSha384":
                bArr2 = weg.g;
                break;
            case "HmacSha512":
                bArr2 = weg.h;
                break;
            default:
                ygf.l("Could not determine HPKE KDF ID");
                return null;
        }
        byte[] bArrH = il7.H(weg.n, bArrMo102zza, bArr2, kegVar.a());
        byte[] bArr5 = weg.l;
        byte[] bArr6 = m50.q;
        byte[] bArr7 = weg.o;
        Charset charset = ejg.a;
        byte[] bArrH2 = il7.H(weg.a, d1gVar.f(il7.H(bArr7, bArrH, "psk_id_hash".getBytes(charset), bArr6), bArr5), d1gVar.f(il7.H(bArr7, bArrH, "info_hash".getBytes(charset), bArr4), bArr5));
        byte[] bArrF = d1gVar.f(il7.H(bArr7, bArrH, "secret".getBytes(charset), bArr6), bArrA0);
        int iZza = kegVar.zza();
        byte[] bArrE = d1gVar.e(iZza, bArrF, il7.H(weg.b(2, iZza), bArr7, bArrH, "key".getBytes(charset), bArrH2));
        byte[] bArrE2 = d1gVar.e(12, bArrF, il7.H(weg.b(2, 12), bArr7, bArrH, "base_nonce".getBytes(charset), bArrH2));
        BigInteger bigInteger = BigInteger.ONE;
        m50 m50Var = new m50(bArrE, bArrE2, bigInteger.shiftLeft(96).subtract(bigInteger), kegVar);
        byte[] bArr8 = g;
        synchronized (m50Var) {
            bArrG = il7.G(bArrE2, qq7.K((BigInteger) m50Var.d, 12));
            if (((BigInteger) m50Var.d).compareTo((BigInteger) m50Var.c) >= 0) {
                throw new GeneralSecurityException("message limit reached");
            }
            m50Var.d = ((BigInteger) m50Var.d).add(bigInteger);
        }
        return ((keg) m50Var.b).c(bArrE, bArrG, bArr, length, bArr8);
    }
}
