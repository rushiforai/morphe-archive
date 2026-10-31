package ads_mobile_sdk;

import aq.e0;
import java.util.ArrayDeque;
import java.util.Optional;

/* loaded from: classes2.dex */
public final class qu3 {

    /* renamed from: a, reason: collision with root package name */
    public final e0 f8820a;

    /* renamed from: b, reason: collision with root package name */
    public final au f8821b;

    /* renamed from: c, reason: collision with root package name */
    public final og.g f8822c;

    public qu3(e0 e0Var, og.g gVar) {
        int[] iArr = {343945053, 300943123, 276960570, 1098387973, 1376531620, 1545514151, 271059426, 857490000, 454333378};
        int i5 = iArr[7] % iArr[8];
        this.f8820a = e0Var;
        this.f8822c = gVar;
        this.f8821b = new au(10);
    }

    public final Optional a() {
        hm2 hm2Var;
        try {
            ArrayDeque arrayDeque = (ArrayDeque) this.f8821b.f1092a;
            if (arrayDeque.isEmpty()) {
                throw new iu3();
            }
            gu3 gu3Var = (gu3) arrayDeque.pop();
            long j11 = gu3Var.f4086a;
            long j12 = gu3Var.f4087b;
            long j13 = gu3Var.f4088c;
            e0 e0Var = this.f8820a;
            if (e0Var.f15451b < j12) {
                return Optional.of(hm2.H);
            }
            this.f8822c.a(j11);
            if (j13 == 0) {
                while (e0Var.f15451b > j12) {
                    e0Var.a();
                }
            }
            return Optional.empty();
        } catch (cu3 e3) {
            e = e3;
            throw new AssertionError(xt3.a("CEiv6BFfPnitUE+D"), e);
        } catch (du3 e11) {
            e = e11;
            throw new AssertionError(xt3.a("CEiv6BFfPnitUE+D"), e);
        } catch (iu3 unused) {
            hm2Var = hm2.f4459x;
            return Optional.of(hm2Var);
        } catch (ku3 unused2) {
            hm2Var = hm2.H;
            return Optional.of(hm2Var);
        }
    }
}
