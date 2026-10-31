package ok;

import android.content.Context;
import android.os.Bundle;
import java.util.ArrayList;
import ps.o0;
import tk.s;

/* loaded from: classes3.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public final s f80474a;

    /* renamed from: b, reason: collision with root package name */
    public final String f80475b;

    /* renamed from: c, reason: collision with root package name */
    public final fi.j f80476c;

    /* renamed from: d, reason: collision with root package name */
    public final br.a f80477d;

    /* renamed from: e, reason: collision with root package name */
    public final tk.b f80478e;

    public h(Context context, s sVar, br.a aVar) {
        fi.j jVar = new fi.j();
        this.f80476c = jVar;
        this.f80475b = context.getPackageName();
        this.f80474a = sVar;
        this.f80477d = aVar;
        tk.b bVar = new tk.b(context, sVar, i.f80479a, new b6.e(19));
        this.f80478e = bVar;
        bVar.a().post(new c(this, jVar, context));
    }

    public static Bundle a(h hVar, o oVar, long j11, long j12) {
        Bundle bundle = new Bundle();
        bundle.putString("package.name", hVar.f80475b);
        bundle.putLong("cloud.prj", j11);
        bundle.putString("nonce", oVar.f80487a);
        bundle.putLong("warm.up.sid", j12);
        bundle.putInt("playcore.integrity.version.major", 1);
        bundle.putInt("playcore.integrity.version.minor", 4);
        bundle.putInt("playcore.integrity.version.patch", 0);
        bundle.putInt("webview.request.mode", 0);
        bundle.putIntegerArrayList("request.verdict.opt.out", new ArrayList<>(oVar.f80488b));
        ArrayList arrayList = new ArrayList();
        arrayList.add(new tk.n(5, System.currentTimeMillis()));
        bundle.putParcelableArrayList("event_timestamps", new ArrayList<>(o0.o(arrayList)));
        return bundle;
    }

    public static Bundle b(h hVar, long j11) {
        Bundle bundle = new Bundle();
        bundle.putString("package.name", hVar.f80475b);
        bundle.putLong("cloud.prj", j11);
        bundle.putInt("playcore.integrity.version.major", 1);
        bundle.putInt("playcore.integrity.version.minor", 4);
        bundle.putInt("playcore.integrity.version.patch", 0);
        bundle.putInt("webview.request.mode", 0);
        ArrayList arrayList = new ArrayList();
        arrayList.add(new tk.n(4, System.currentTimeMillis()));
        bundle.putParcelableArrayList("event_timestamps", new ArrayList<>(o0.o(arrayList)));
        return bundle;
    }

    public static boolean c(h hVar) {
        return hVar.f80476c.f55135a.q() && ((Integer) hVar.f80476c.f55135a.m()).intValue() < 83420000;
    }

    public static boolean d(h hVar) {
        return hVar.f80476c.f55135a.q() && ((Integer) hVar.f80476c.f55135a.m()).intValue() == 0;
    }
}
