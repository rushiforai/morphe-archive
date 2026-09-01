package defpackage;

import android.content.Context;
import android.os.Bundle;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class phf {
    public final jif a;
    public final String b;
    public final wfd c;
    public final fa4 d;
    public final mgf e;

    public phf(Context context, jif jifVar, fa4 fa4Var) {
        wfd wfdVar = new wfd();
        this.c = wfdVar;
        this.b = context.getPackageName();
        this.a = jifVar;
        this.d = fa4Var;
        mgf mgfVar = new mgf(context, jifVar, qhf.a, new dq1(26));
        this.e = mgfVar;
        mgfVar.a().post(new jgf(this, wfdVar, context));
    }

    public static Bundle a(phf phfVar, gif gifVar, long j, long j2) {
        Bundle bundle = new Bundle();
        bundle.putString("package.name", phfVar.b);
        bundle.putLong("cloud.prj", j);
        bundle.putString("nonce", gifVar.a);
        bundle.putLong("warm.up.sid", j2);
        bundle.putInt("playcore.integrity.version.major", 1);
        bundle.putInt("playcore.integrity.version.minor", 4);
        bundle.putInt("playcore.integrity.version.patch", 0);
        bundle.putInt("webview.request.mode", 0);
        bundle.putIntegerArrayList("request.verdict.opt.out", new ArrayList<>(gifVar.b));
        ArrayList arrayList = new ArrayList();
        arrayList.add(new yhf(5, System.currentTimeMillis()));
        bundle.putParcelableArrayList("event_timestamps", new ArrayList<>(gr7.b(arrayList)));
        return bundle;
    }

    public static Bundle b(phf phfVar, long j) {
        Bundle bundle = new Bundle();
        bundle.putString("package.name", phfVar.b);
        bundle.putLong("cloud.prj", j);
        bundle.putInt("playcore.integrity.version.major", 1);
        bundle.putInt("playcore.integrity.version.minor", 4);
        bundle.putInt("playcore.integrity.version.patch", 0);
        bundle.putInt("webview.request.mode", 0);
        ArrayList arrayList = new ArrayList();
        arrayList.add(new yhf(4, System.currentTimeMillis()));
        bundle.putParcelableArrayList("event_timestamps", new ArrayList<>(gr7.b(arrayList)));
        return bundle;
    }

    public static boolean c(phf phfVar) {
        return phfVar.c.a.k() && ((Integer) phfVar.c.a.i()).intValue() < 83420000;
    }

    public static boolean d(phf phfVar) {
        return phfVar.c.a.k() && ((Integer) phfVar.c.a.i()).intValue() == 0;
    }
}
