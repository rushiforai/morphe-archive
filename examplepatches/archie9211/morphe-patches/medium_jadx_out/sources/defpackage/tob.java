package defpackage;

import android.os.Bundle;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tob implements qob, hpb {
    public final /* synthetic */ rob a;
    public ky6 b;
    public fpb c;

    public tob(rob robVar) {
        this.a = robVar;
        Object objD = robVar.d("androidx.savedstate.SavedStateRegistry");
        Bundle bundle = objD instanceof Bundle ? (Bundle) objD : null;
        if (bundle != null && this.c == null) {
            fpb fpbVar = new fpb(new gpb(this, new i5b(14, this)));
            this.c = fpbVar;
            fpbVar.a(bundle);
        }
        robVar.b("androidx.savedstate.SavedStateRegistry", new i5b(12, this));
    }

    @Override // defpackage.qob
    public final boolean a(Object obj) {
        return this.a.a(obj);
    }

    @Override // defpackage.qob
    public final pob b(String str, m45 m45Var) {
        return this.a.b(str, m45Var);
    }

    @Override // defpackage.qob
    public final Map c() {
        return this.a.c();
    }

    @Override // defpackage.qob
    public final Object d(String str) {
        return this.a.d(str);
    }

    @Override // defpackage.iy6
    public final wx6 getLifecycle() {
        ky6 ky6Var = this.b;
        if (ky6Var != null) {
            return ky6Var;
        }
        ky6 ky6Var2 = new ky6(this, false);
        this.b = ky6Var2;
        return ky6Var2;
    }

    @Override // defpackage.hpb
    public final epb getSavedStateRegistry() {
        fpb fpbVar = this.c;
        if (fpbVar == null) {
            fpb fpbVar2 = new fpb(new gpb(this, new i5b(14, this)));
            this.c = fpbVar2;
            fpbVar2.a(null);
            fpbVar = fpbVar2;
        }
        return fpbVar.b;
    }
}
