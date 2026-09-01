package defpackage;

import android.os.Bundle;
import java.util.Arrays;
import java.util.LinkedHashSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g10 implements dpb {
    public final /* synthetic */ int a;
    public final Object b;

    public g10(epb epbVar) {
        this.a = 1;
        this.b = new LinkedHashSet();
        epbVar.c("androidx.savedstate.Restarter", this);
    }

    @Override // defpackage.dpb
    public final Bundle a() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                Bundle bundle = new Bundle();
                ((n1) obj).o();
                return bundle;
            default:
                Bundle bundleE = xz5.E((f09[]) Arrays.copyOf(new f09[0], 0));
                ep7.z(bundleE, "classes_to_restore", bu1.m1((LinkedHashSet) obj));
                return bundleE;
        }
    }

    public g10(n1 n1Var) {
        this.a = 0;
        this.b = n1Var;
    }
}
