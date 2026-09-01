package defpackage;

import com.medium.android.onboarding.ui.topics.TopicsFragment;
import com.medium.android.susi.ui.unrecognizedEmail.UnrecognizedEmailFragment;
import com.medium.android.upvoters.ui.d;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class ibd extends x55 implements m45 {
    public final /* synthetic */ int a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ibd(int i, Object obj, Class cls, String str, String str2, int i2, int i3) {
        super(i, i2, cls, obj, str, str2);
        this.a = i3;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        int i2 = 2;
        int i3 = 1;
        int i4 = 0;
        n92 n92Var = null;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((lbd) this.receiver).b();
                return c1eVar;
            case 1:
                ((d9d) this.receiver).a();
                return c1eVar;
            case 2:
                odd oddVar = ((lbd) this.receiver).a;
                vx0.c0(f76.F(oddVar), null, null, new cdd(oddVar, n92Var, i2), 3);
                return c1eVar;
            case 3:
                qed qedVar = ((aed) this.receiver).a;
                vx0.c0(f76.F(qedVar), null, null, new xi7(qedVar, n92Var, 25), 3);
                return c1eVar;
            case 4:
                ((udd) ((wdd) this.receiver)).a.Q().getOnBackPressedDispatcher().d();
                return c1eVar;
            case 5:
                efd efdVar = ((ted) this.receiver).a;
                vx0.c0(f76.F(efdVar), null, null, new afd(efdVar, n92Var, i4), 3);
                return c1eVar;
            case 6:
                ((ted) this.receiver).a();
                return c1eVar;
            case 7:
                ((ted) this.receiver).a();
                return c1eVar;
            case 8:
                ((mpd) this.receiver).a();
                return c1eVar;
            case 9:
                ((mpd) this.receiver).a();
                return c1eVar;
            case 10:
                fqd fqdVar = ((mpd) this.receiver).b;
                vx0.c0(f76.F(fqdVar), null, null, new dqd(fqdVar, n92Var, i4), 3);
                return c1eVar;
            case 11:
                ks8 ks8Var = ((TopicsFragment) ((mpd) this.receiver).a.a).u0;
                if (ks8Var != null) {
                    k40.X(ks8Var.a).f();
                    return c1eVar;
                }
                g76.g0("onboardingRouter");
                throw null;
            case 12:
                ((x1e) this.receiver).a();
                return c1eVar;
            case 13:
                k40.X((UnrecognizedEmailFragment) ((x1e) this.receiver).a.b).f();
                return c1eVar;
            case 14:
                ((b3e) this.receiver).f();
                return c1eVar;
            case 15:
                k3e k3eVar = (k3e) this.receiver;
                k3eVar.getClass();
                vx0.c0(f76.F(k3eVar), null, null, new i3e(k3eVar, n92Var, i4), 3);
                return c1eVar;
            case 16:
                ((b3e) this.receiver).a();
                return c1eVar;
            case 17:
                k3e k3eVar2 = ((b3e) this.receiver).b;
                atb atbVarE = k3eVar2.e();
                atbVarE.getClass();
                atb atbVarA = atb.a(atbVarE, null, true, true, 1);
                k3eVar2.e.setValue(atbVarA);
                xpc xpcVar = k3eVar2.f;
                xpcVar.getClass();
                xpcVar.m(null, atbVarA);
                return c1eVar;
            case 18:
                ((b3e) this.receiver).f();
                return c1eVar;
            case 19:
                ((s3e) this.receiver).a();
                return c1eVar;
            case 20:
                ((s3e) this.receiver).a();
                return c1eVar;
            case 21:
                d dVar = ((s3e) this.receiver).b;
                wld.a.a("Load more", new Object[0]);
                vx0.c0(f76.F(dVar), null, null, new a4e(dVar, n92Var, i4), 3);
                return c1eVar;
            case 22:
                k40.X(((s3e) this.receiver).a.a).f();
                return c1eVar;
            case 23:
                h5e h5eVar = ((g4e) this.receiver).b;
                h5eVar.getClass();
                vx0.c0(f76.F(h5eVar), null, null, new e5e(h5eVar, n92Var, 4), 3);
                return c1eVar;
            case 24:
                h5e h5eVar2 = ((g4e) this.receiver).b;
                h5eVar2.getClass();
                vx0.c0(f76.F(h5eVar2), null, null, new e5e(h5eVar2, n92Var, 6), 3);
                return c1eVar;
            case 25:
                ((g4e) this.receiver).a();
                return c1eVar;
            case 26:
                h5e h5eVar3 = ((g4e) this.receiver).b;
                h5eVar3.getClass();
                vx0.c0(f76.F(h5eVar3), null, null, new e5e(h5eVar3, n92Var, i2), 3);
                return c1eVar;
            case 27:
                ((g4e) this.receiver).a();
                return c1eVar;
            case 28:
                k40.X(((g4e) this.receiver).a).f();
                return c1eVar;
            default:
                q9e q9eVar = ((l8e) this.receiver).a;
                vx0.c0(f76.F(q9eVar), null, null, new e9e(q9eVar, n92Var, i3), 3);
                return c1eVar;
        }
    }
}
