package cp;

import java.io.IOException;

/* loaded from: classes4.dex */
public final class j extends z {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f47750a;

    @Override // cp.z
    public final Object b(kp.a aVar) {
        switch (this.f47750a) {
            case 0:
                if (aVar.f0() != 9) {
                    return Double.valueOf(aVar.D());
                }
                aVar.V();
                return null;
            case 1:
                if (aVar.f0() != 9) {
                    return Float.valueOf((float) aVar.D());
                }
                aVar.V();
                return null;
            default:
                if (aVar.f0() != 9) {
                    return Long.valueOf(aVar.M());
                }
                aVar.V();
                return null;
        }
    }

    @Override // cp.z
    public final void c(kp.b bVar, Object obj) throws IOException {
        switch (this.f47750a) {
            case 0:
                Number number = (Number) obj;
                if (number != null) {
                    double dDoubleValue = number.doubleValue();
                    m.a(dDoubleValue);
                    bVar.K(dDoubleValue);
                    break;
                } else {
                    bVar.p();
                    break;
                }
            case 1:
                Number numberValueOf = (Number) obj;
                if (numberValueOf != null) {
                    float fFloatValue = numberValueOf.floatValue();
                    m.a(fFloatValue);
                    if (!(numberValueOf instanceof Float)) {
                        numberValueOf = Float.valueOf(fFloatValue);
                    }
                    bVar.P(numberValueOf);
                    break;
                } else {
                    bVar.p();
                    break;
                }
            default:
                Number number2 = (Number) obj;
                if (number2 != null) {
                    bVar.S(number2.toString());
                    break;
                } else {
                    bVar.p();
                    break;
                }
        }
    }
}
