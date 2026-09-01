package defpackage;

import android.os.Bundle;
import java.util.Arrays;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class apb implements dpb {
    public final epb a;
    public boolean b;
    public Bundle c;
    public final w5d d;

    public apb(epb epbVar, wue wueVar) {
        epbVar.getClass();
        this.a = epbVar;
        this.d = new w5d(new i5b(13, wueVar));
    }

    @Override // defpackage.dpb
    public final Bundle a() {
        Bundle bundleE = xz5.E((f09[]) Arrays.copyOf(new f09[0], 0));
        Bundle bundle = this.c;
        if (bundle != null) {
            bundleE.putAll(bundle);
        }
        for (Map.Entry entry : ((bpb) this.d.getValue()).b.entrySet()) {
            String str = (String) entry.getKey();
            Bundle bundleA = ((ny1) ((vob) entry.getValue()).b.f).a();
            if (!bundleA.isEmpty()) {
                str.getClass();
                bundleE.putBundle(str, bundleA);
            }
        }
        this.b = false;
        return bundleE;
    }

    public final void b() {
        if (this.b) {
            return;
        }
        Bundle bundleA = this.a.a("androidx.lifecycle.internal.SavedStateHandlesProvider");
        Bundle bundleE = xz5.E((f09[]) Arrays.copyOf(new f09[0], 0));
        Bundle bundle = this.c;
        if (bundle != null) {
            bundleE.putAll(bundle);
        }
        if (bundleA != null) {
            bundleE.putAll(bundleA);
        }
        this.c = bundleE;
        this.b = true;
    }
}
