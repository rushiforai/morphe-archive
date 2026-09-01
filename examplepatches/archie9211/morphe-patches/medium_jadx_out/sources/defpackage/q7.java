package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q7 extends k7 {
    public final /* synthetic */ int a;
    public final /* synthetic */ r7 b;
    public final /* synthetic */ String c;
    public final /* synthetic */ f7 d;

    public /* synthetic */ q7(r7 r7Var, String str, f7 f7Var, int i) {
        this.a = i;
        this.b = r7Var;
        this.c = str;
        this.d = f7Var;
    }

    @Override // defpackage.k7
    public final void a(Object obj, z6 z6Var) {
        int i = this.a;
        f7 f7Var = this.d;
        String str = this.c;
        r7 r7Var = this.b;
        switch (i) {
            case 0:
                ArrayList arrayList = r7Var.d;
                Object obj2 = r7Var.b.get(str);
                if (obj2 == null) {
                    rd6.j("Attempting to launch an unregistered ActivityResultLauncher with contract ", f7Var, " and input ", obj, ". You must ensure the ActivityResultLauncher is registered before calling launch().");
                    return;
                }
                int iIntValue = ((Number) obj2).intValue();
                arrayList.add(str);
                try {
                    r7Var.b(iIntValue, f7Var, obj, z6Var);
                    return;
                } catch (Exception e) {
                    arrayList.remove(str);
                    throw e;
                }
            default:
                ArrayList arrayList2 = r7Var.d;
                Object obj3 = r7Var.b.get(str);
                if (obj3 == null) {
                    rd6.j("Attempting to launch an unregistered ActivityResultLauncher with contract ", f7Var, " and input ", obj, ". You must ensure the ActivityResultLauncher is registered before calling launch().");
                    return;
                }
                int iIntValue2 = ((Number) obj3).intValue();
                arrayList2.add(str);
                try {
                    r7Var.b(iIntValue2, f7Var, obj, z6Var);
                    return;
                } catch (Exception e2) {
                    arrayList2.remove(str);
                    throw e2;
                }
        }
    }

    public void b() {
        this.b.f(this.c);
    }
}
