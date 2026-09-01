package defpackage;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.res.Resources;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class k84 implements m45 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;

    public /* synthetic */ k84(sb2 sb2Var, l78 l78Var, Resources resources, mx mxVar, ap1 ap1Var, dk5 dk5Var) {
        this.b = sb2Var;
        this.c = l78Var;
        this.d = resources;
        this.e = mxVar;
        this.f = ap1Var;
        this.g = dk5Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        boolean z;
        int i = this.a;
        c1e c1eVar = c1e.a;
        n92 n92Var = null;
        Object obj = this.g;
        Object obj2 = this.b;
        Object obj3 = this.f;
        Object obj4 = this.c;
        Object obj5 = this.d;
        Object obj6 = this.e;
        switch (i) {
            case 0:
                Resources resources = (Resources) obj5;
                String str = (String) obj3;
                sb2 sb2Var = (sb2) obj2;
                nhc nhcVar = (nhc) obj;
                ((l78) obj4).setValue(Boolean.FALSE);
                ClipboardManager clipboardManager = (ClipboardManager) ((Context) obj6).getSystemService(ClipboardManager.class);
                if (clipboardManager == null) {
                    vx0.c0(sb2Var, null, null, new q91(nhcVar, resources, n92Var, 6), 3);
                } else {
                    clipboardManager.setPrimaryClip(ClipData.newPlainText(resources.getString(R.string.common_post_content), str));
                }
                break;
            case 1:
                ((l78) obj4).setValue(Boolean.FALSE);
                vx0.c0((sb2) obj2, null, null, new fl2((Resources) obj5, (mx) obj6, (ap1) obj3, (dk5) obj, null, 28), 3);
                break;
            default:
                mob mobVar = (mob) obj6;
                kpb kpbVar = (kpb) obj5;
                qob qobVar = (qob) obj4;
                String str2 = (String) obj3;
                Object[] objArr = (Object[]) obj;
                boolean z2 = true;
                if (mobVar.b != qobVar) {
                    mobVar.b = qobVar;
                    z = true;
                } else {
                    z = false;
                }
                if (g76.L(mobVar.c, str2)) {
                    z2 = z;
                } else {
                    mobVar.c = str2;
                }
                mobVar.a = kpbVar;
                mobVar.d = obj2;
                mobVar.e = objArr;
                pob pobVar = mobVar.f;
                if (pobVar != null && z2) {
                    ((vwa) pobVar).F();
                    mobVar.f = null;
                    mobVar.e();
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ k84(mob mobVar, kpb kpbVar, qob qobVar, String str, Object obj, Object[] objArr) {
        this.e = mobVar;
        this.d = kpbVar;
        this.c = qobVar;
        this.f = str;
        this.b = obj;
        this.g = objArr;
    }

    public /* synthetic */ k84(Context context, Resources resources, String str, xv1 xv1Var, l78 l78Var, sb2 sb2Var, nhc nhcVar) {
        this.e = context;
        this.d = resources;
        this.f = str;
        this.c = l78Var;
        this.b = sb2Var;
        this.g = nhcVar;
    }
}
