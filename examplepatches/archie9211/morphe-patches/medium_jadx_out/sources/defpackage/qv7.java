package defpackage;

import com.medium.android.donkey.main.MainActivity;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class qv7 extends x55 implements m45 {
    public final /* synthetic */ int a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ qv7(int i, Object obj, Class cls, String str, String str2, int i2, int i3) {
        super(i, i2, cls, obj, str, str2);
        this.a = i3;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        int i2 = 1;
        char c = 1;
        char c2 = 1;
        int i3 = 0;
        Object[] objArr = 0;
        Object[] objArr2 = 0;
        Object[] objArr3 = 0;
        int i4 = 3;
        n92 n92Var = null;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((rv7) this.receiver).b();
                break;
            case 1:
                MainActivity mainActivity = ((ye7) this.receiver).a;
                int i5 = MainActivity.H;
                xpc xpcVar = mainActivity.v().F;
                Boolean bool = Boolean.TRUE;
                xpcVar.getClass();
                xpcVar.m(null, bool);
                break;
            case 2:
                MainActivity mainActivity2 = ((ye7) this.receiver).a;
                int i6 = MainActivity.H;
                y23 y23Var = (y23) mainActivity2.v().c;
                vx0.c0(y23Var.e, null, null, new t23(y23Var, n92Var, objArr == true ? 1 : 0), 3);
                break;
            case 3:
                ((i88) this.receiver).a();
                break;
            case 4:
                ((i88) this.receiver).a();
                break;
            case 5:
                ((i88) this.receiver).a();
                break;
            case 6:
                ((i88) this.receiver).a();
                break;
            case 7:
                ((i98) ((b98) this.receiver)).a.j();
                break;
            case 8:
                m98 m98Var = ((i98) ((b98) this.receiver)).a;
                vx0.c0(f76.F(m98Var), null, null, new bde(m98Var, n92Var, c == true ? 1 : 0), 3);
                break;
            case 9:
                ((i98) ((b98) this.receiver)).a.j();
                break;
            case 10:
                m98 m98Var2 = ((i98) ((b98) this.receiver)).a;
                vx0.c0(f76.F(m98Var2), null, null, new wd0((Object) m98Var2, (boolean) (objArr2 == true ? 1 : 0), n92Var, i4), 3);
                break;
            case 11:
                m98 m98Var3 = ((i98) ((b98) this.receiver)).a;
                vx0.c0(f76.F(m98Var3), null, null, new wd0((Object) m98Var3, (boolean) (c2 == true ? 1 : 0), n92Var, i4), 3);
                break;
            case 12:
                ((i98) ((b98) this.receiver)).a.w.l(null);
                break;
            case 13:
                i98 i98Var = (i98) ((b98) this.receiver);
                i98Var.a.i();
                i98Var.b.n();
                break;
            case 14:
                ((i98) ((b98) this.receiver)).a.i();
                break;
            case 15:
                m98 m98Var4 = (m98) this.receiver;
                m98Var4.getClass();
                vx0.c0(f76.F(m98Var4), null, null, new bde(m98Var4, n92Var, objArr3 == true ? 1 : 0), 3);
                break;
            case 16:
                ((i98) ((b98) this.receiver)).a.w.l(null);
                break;
            case 17:
                tk8 tk8Var = ((ik8) this.receiver).b;
                if (!tk8Var.k) {
                    tk8Var.k = true;
                    tk8Var.f.j(tk8Var.c, gp7.u(tk8Var.i), tk8Var.h);
                }
                break;
            case 18:
                ((ik8) this.receiver).a.a();
                break;
            case 19:
                nl8 nl8Var = ((vk8) this.receiver).b;
                vx0.c0(f76.F(nl8Var), null, null, new hl8(nl8Var, n92Var, i2), 3);
                break;
            case 20:
                nl8 nl8Var2 = ((vk8) this.receiver).b;
                vx0.c0(f76.F(nl8Var2), null, null, new hl8(nl8Var2, n92Var, i3), 3);
                break;
            case 21:
                ((vk8) this.receiver).a.a();
                break;
            case 22:
                break;
            case 23:
                break;
            case 24:
                ((v69) this.receiver).a.Q().getOnBackPressedDispatcher().d();
                break;
            case 25:
                sw9 sw9Var = ((fj9) this.receiver).c;
                vx0.c0(f76.F(sw9Var), null, null, new nr9(i4, n92Var, sw9Var), 3);
                break;
            case 26:
                ((fj9) this.receiver).a();
                break;
            case 27:
                ((lo9) this.receiver).b();
                break;
            case 28:
                ((lo9) this.receiver).a();
                break;
            default:
                ((lo9) this.receiver).a();
                break;
        }
        return c1eVar;
    }
}
