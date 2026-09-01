package defpackage;

import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;
import java.security.GeneralSecurityException;
import java.security.spec.EllipticCurve;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jdg extends beg {
    public final scg h;
    public final qvg i;
    public final qvg j;
    public final Integer k;

    public jdg(scg scgVar, qvg qvgVar, qvg qvgVar2, Integer num) {
        this.h = scgVar;
        this.i = qvgVar;
        this.j = qvgVar2;
        this.k = num;
    }

    public static jdg L(scg scgVar, qvg qvgVar, Integer num) throws GeneralSecurityException {
        EllipticCurve curve;
        qvg qvgVarB;
        qcg qcgVar = scgVar.d;
        qcg qcgVar2 = qcg.d;
        if (!qcgVar.equals(qcgVar2) && num == null) {
            throw new GeneralSecurityException(ev6.x("'idRequirement' must be non-null for ", String.valueOf(qcgVar), " variant."));
        }
        if (qcgVar == qcgVar2 && num != null) {
            ygf.l("'idRequirement' must be null for NO_PREFIX variant.");
            return null;
        }
        rcg rcgVar = scgVar.a;
        int length = qvgVar.a.length;
        String str = "Encoded public key byte length for " + String.valueOf(rcgVar) + " must be %d, not " + length;
        rcg rcgVar2 = rcg.f;
        rcg rcgVar3 = rcg.e;
        rcg rcgVar4 = rcg.d;
        if (rcgVar == rcgVar4) {
            if (length != 65) {
                throw new GeneralSecurityException(String.format(str, 65));
            }
        } else if (rcgVar == rcgVar3) {
            if (length != 97) {
                throw new GeneralSecurityException(String.format(str, 97));
            }
        } else if (rcgVar == rcgVar2) {
            if (length != 133) {
                throw new GeneralSecurityException(String.format(str, Integer.valueOf(NikonType2MakernoteDirectory.TAG_MANUAL_FOCUS_DISTANCE)));
            }
        } else {
            if (rcgVar != rcg.g) {
                throw new GeneralSecurityException("Unable to validate public key length for ".concat(String.valueOf(rcgVar)));
            }
            if (length != 32) {
                throw new GeneralSecurityException(String.format(str, 32));
            }
        }
        if (rcgVar == rcgVar4 || rcgVar == rcgVar3 || rcgVar == rcgVar2) {
            if (rcgVar == rcgVar4) {
                curve = nfg.a.getCurve();
            } else if (rcgVar == rcgVar3) {
                curve = nfg.b.getCurve();
            } else {
                if (rcgVar != rcgVar2) {
                    ay0.e("Unable to determine NIST curve type for ".concat(String.valueOf(rcgVar)));
                    return null;
                }
                curve = nfg.c.getCurve();
            }
            nfg.g(en7.Y(curve, zug.zza, qvgVar.b()), curve);
        }
        if (qcgVar == qcgVar2) {
            qvgVarB = mhg.a;
        } else {
            if (num == null) {
                ygf.f("idRequirement must be non-null for HpkeParameters.Variant ".concat(String.valueOf(qcgVar)));
                return null;
            }
            if (qcgVar == qcg.c) {
                qvgVarB = mhg.a(num.intValue());
            } else {
                if (qcgVar != qcg.b) {
                    ygf.f("Unknown HpkeParameters.Variant: ".concat(String.valueOf(qcgVar)));
                    return null;
                }
                qvgVarB = mhg.b(num.intValue());
            }
        }
        return new jdg(scgVar, qvgVar, qvgVarB, num);
    }

    @Override // defpackage.gr7
    public final /* synthetic */ bzf H() {
        return this.h;
    }

    @Override // defpackage.gr7
    public final Integer J() {
        return this.k;
    }

    @Override // defpackage.beg
    public final qvg K() {
        return this.j;
    }
}
