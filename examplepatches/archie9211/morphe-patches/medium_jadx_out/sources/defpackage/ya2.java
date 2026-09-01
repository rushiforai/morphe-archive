package defpackage;

import android.content.Context;
import android.graphics.Typeface;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ya2 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ya2(Object obj, Object obj2, Object obj3, Object obj4, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.c = obj;
        this.d = obj2;
        this.e = obj3;
        this.f = obj4;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.f;
        Object obj3 = this.e;
        Object obj4 = this.d;
        switch (i) {
            case 0:
                ya2 ya2Var = new ya2((vb9) obj4, (rhd) obj3, (lid) obj2, n92Var, 0);
                ya2Var.c = obj;
                return ya2Var;
            case 1:
                return new ya2((bc7) this.c, (Context) obj4, (String) obj3, (String) obj2, n92Var, 1);
            case 2:
                return new ya2((bib) this.c, (sr4) obj4, (akc) obj3, (lr4) obj2, n92Var, 2);
            default:
                ya2 ya2Var2 = new ya2((nig) obj4, (String) obj3, (String) obj2, n92Var, 3);
                ya2Var2.c = obj;
                return ya2Var2;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((ya2) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 1:
                ((ya2) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 2:
                ((ya2) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            default:
                ((ya2) create((fdg) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
        }
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        int i2 = 0;
        n92 n92Var = null;
        c1e c1eVar = c1e.a;
        Object obj2 = this.f;
        Object obj3 = this.e;
        Object obj4 = this.d;
        switch (i) {
            case 0:
                br7.v(obj);
                sb2 sb2Var = (sb2) this.c;
                wb2 wb2Var = wb2.UNDISPATCHED;
                vb9 vb9Var = (vb9) obj4;
                vx0.c0(sb2Var, null, wb2Var, new xa2(vb9Var, (rhd) obj3, n92Var, i2), 1);
                vx0.c0(sb2Var, null, wb2Var, new r91(vb9Var, (lid) obj2, n92Var, 14), 1);
                break;
            case 1:
                br7.v(obj);
                for (vy4 vy4Var : ((bc7) this.c).f.values()) {
                    Context context = (Context) obj4;
                    vy4Var.getClass();
                    String str = vy4Var.c;
                    try {
                        Typeface typefaceCreateFromAsset = Typeface.createFromAsset(context.getAssets(), b09.y((String) obj3, vy4Var.a, (String) obj2));
                        try {
                            typefaceCreateFromAsset.getClass();
                            str.getClass();
                            boolean zQ = muc.Q(str, "Italic", false);
                            boolean zQ2 = muc.Q(str, "Bold", false);
                            int i3 = (zQ && zQ2) ? 3 : zQ ? 2 : zQ2 ? 1 : 0;
                            if (typefaceCreateFromAsset.getStyle() != i3) {
                                typefaceCreateFromAsset = Typeface.create(typefaceCreateFromAsset, i3);
                            }
                            vy4Var.d = typefaceCreateFromAsset;
                        } catch (Exception unused) {
                            h87.a.getClass();
                            t90 t90Var = xn6.a;
                        }
                    } catch (Exception unused2) {
                        h87.a.getClass();
                        t90 t90Var2 = xn6.a;
                    }
                }
                break;
            case 2:
                akc akcVar = (akc) obj3;
                br7.v(obj);
                if (((bib) this.c).i) {
                    sr4.a((sr4) obj4);
                    if (akcVar != null) {
                        ((n43) akcVar).b();
                    }
                } else {
                    if (akcVar != null) {
                        ((n43) akcVar).a();
                    }
                    km4.m((lr4) obj2);
                }
                break;
            default:
                br7.v(obj);
                nig nigVar = (nig) obj4;
                String str2 = (String) obj3;
                vx0.c0((k92) ((uz5) nigVar.f).c, null, null, new yu(this.c, (Object) nigVar, str2, obj2, (Object) new ms(nigVar, str2, null, null), (n92) null, 27), 3);
                break;
        }
        return c1eVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ya2(Object obj, Object obj2, Object obj3, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = obj;
        this.e = obj2;
        this.f = obj3;
    }
}
