package defpackage;

import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import com.google.android.recaptcha.internal.zzah;
import j$.util.Optional;
import j$.util.function.Function$CC;
import java.io.ByteArrayOutputStream;
import java.security.GeneralSecurityException;
import java.security.Provider;
import java.security.Signature;
import java.util.function.Function;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class b9g implements vfg, rhg, jvg {
    public static gvf a(final long j) {
        return gvf.f(new csf() { // from class: uig
            public /* synthetic */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final /* synthetic */ Object apply(Object obj) {
                try {
                    ((iuf) obj).a.e(gvf.b(j));
                    return Optional.empty();
                } catch (zzah unused) {
                    return Optional.of(kxf.zza);
                }
            }

            public /* synthetic */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        });
    }

    public static void b(long j, eoc eocVar, boolean z) {
        long[] jArr = {1527337001, 959997459, 671305984, 289023511, 8866124, 1524543404, 741858923, 1040759385, 213594814};
        long j2 = jArr[0];
        long j3 = jArr[1];
        long j4 = jArr[2];
        long j5 = jArr[3];
        long j6 = jArr[4];
        long j7 = jArr[5];
        long j8 = jArr[6];
        long j9 = jArr[7];
        long j10 = (((((~j2) & j3) | j4) + ((j2 & j5) | j6)) - j7) + j8;
        long j11 = j9 % 213594814;
        long j12 = z ? (j + j) ^ (j >> 63) : j;
        int i = 1;
        while (true) {
            long j13 = j10 ^ j11;
            long j14 = j12 >>> 7;
            boolean z2 = j14 != 0 || i < 0;
            int i2 = (int) (j12 & j13);
            if (z2) {
                i2 = ((i2 | 128) << 24) >> 24;
            }
            ((ByteArrayOutputStream) eocVar.a).write((byte) i2);
            if (!z2) {
                return;
            }
            i++;
            j12 = j14;
        }
    }

    @Override // defpackage.vfg
    public gr7 T(nig nigVar) throws GeneralSecurityException {
        if (!((String) nigVar.a).equals("type.googleapis.com/google.crypto.tink.XAesGcmKey")) {
            ay0.e("Wrong type URL in call to XAesGcmProtoSerialization.parseKey");
            return null;
        }
        try {
            qtg qtgVarU = qtg.u((hsf) nigVar.c, ptf.a);
            if (qtgVarU.t() != 0) {
                throw new GeneralSecurityException("Only version 0 keys are accepted");
            }
            if (qtgVarU.z().e() != 32) {
                throw new GeneralSecurityException("Only 32 byte key size is accepted");
            }
            return u4g.L(a5g.b(w8g.a((ntg) nigVar.e), qtgVarU.y().t()), new ujf(28, qvg.a(qtgVarU.z().x())), (Integer) nigVar.f);
        } catch (zzale unused) {
            ygf.l("Parsing XAesGcmKey failed");
            return null;
        }
    }

    @Override // defpackage.jvg
    public /* synthetic */ Object d(String str, Provider provider) {
        return provider == null ? Signature.getInstance(str) : Signature.getInstance(str, provider);
    }

    @Override // defpackage.rhg
    public bzf r(lig ligVar) throws GeneralSecurityException {
        isg isgVar = (isg) ligVar.c;
        if (!isgVar.B().equals("type.googleapis.com/google.crypto.tink.HpkePrivateKey")) {
            ay0.e(ka1.r("Wrong type URL in call to HpkeProtoSerialization.parseParameters: ", isgVar.B()));
            return null;
        }
        try {
            return cdg.a(isgVar.z(), hrg.t(isgVar.A(), ptf.a).w());
        } catch (zzale e) {
            throw new GeneralSecurityException("Parsing HpkeParameters failed: ", e);
        }
    }
}
