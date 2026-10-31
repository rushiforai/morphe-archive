package ai;

/* loaded from: classes3.dex */
public final class a implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f12824a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f12825b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f12826c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ u f12827d;

    public /* synthetic */ a(u uVar, String str, long j11, int i5) {
        this.f12824a = i5;
        this.f12825b = str;
        this.f12826c = j11;
        this.f12827d = uVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f12824a) {
            case 0:
                u uVar = this.f12827d;
                uVar.D();
                String str = this.f12825b;
                sg.w.e(str);
                z.e eVar = uVar.f13363c;
                boolean zIsEmpty = eVar.isEmpty();
                long j11 = this.f12826c;
                if (zIsEmpty) {
                    uVar.f13364d = j11;
                }
                Integer num = (Integer) eVar.get(str);
                if (num == null) {
                    if (eVar.f97753c < 100) {
                        eVar.put(str, 1);
                        uVar.f13362b.put(str, Long.valueOf(j11));
                        break;
                    } else {
                        o0 o0Var = ((m1) uVar.f13368a).f13138f;
                        m1.l(o0Var);
                        o0Var.f13193i.a("Too many ads visible");
                        break;
                    }
                } else {
                    eVar.put(str, Integer.valueOf(num.intValue() + 1));
                    break;
                }
            default:
                u uVar2 = this.f12827d;
                m1 m1Var = (m1) uVar2.f13368a;
                uVar2.D();
                String str2 = this.f12825b;
                sg.w.e(str2);
                z.e eVar2 = uVar2.f13363c;
                Integer num2 = (Integer) eVar2.get(str2);
                if (num2 == null) {
                    o0 o0Var2 = m1Var.f13138f;
                    m1.l(o0Var2);
                    o0Var2.f13190f.b(str2, "Call to endAdUnitExposure for unknown ad unit id");
                    break;
                } else {
                    f3 f3Var = m1Var.f13144l;
                    o0 o0Var3 = m1Var.f13138f;
                    m1.k(f3Var);
                    b3 b3VarH = f3Var.H(false);
                    int iIntValue = num2.intValue() - 1;
                    if (iIntValue != 0) {
                        eVar2.put(str2, Integer.valueOf(iIntValue));
                        break;
                    } else {
                        eVar2.remove(str2);
                        z.e eVar3 = uVar2.f13362b;
                        Long l9 = (Long) eVar3.get(str2);
                        long j12 = this.f12826c;
                        if (l9 == null) {
                            m1.l(o0Var3);
                            o0Var3.f13190f.a("First ad unit exposure time was never set");
                        } else {
                            long jLongValue = j12 - l9.longValue();
                            eVar3.remove(str2);
                            uVar2.I(str2, jLongValue, b3VarH);
                        }
                        if (eVar2.isEmpty()) {
                            long j13 = uVar2.f13364d;
                            if (j13 != 0) {
                                uVar2.H(j12 - j13, b3VarH);
                                uVar2.f13364d = 0L;
                                break;
                            } else {
                                m1.l(o0Var3);
                                o0Var3.f13190f.a("First ad exposure time was never set");
                                break;
                            }
                        }
                    }
                }
                break;
        }
    }
}
