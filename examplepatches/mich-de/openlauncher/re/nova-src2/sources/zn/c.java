package zn;

import android.webkit.WebView;
import java.util.Random;
import o30.e;
import o30.i;

/* loaded from: classes3.dex */
public final class c implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f98577a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final Object f98578b;

    public c(d dVar) {
        this.f98578b = dVar.f98579g;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f98577a) {
            case 0:
                ((WebView) this.f98578b).destroy();
                return;
            default:
                e eVar = (e) this.f98578b;
                i iVar = (i) eVar.f79481d;
                o30.c cVar = eVar.f79479b;
                Random random = i.f79505i;
                iVar.c(cVar);
                i iVar2 = (i) eVar.f79481d;
                o30.c cVar2 = eVar.f79479b;
                synchronized (iVar2) {
                    iVar2.f79512g.remove(cVar2);
                }
                return;
        }
    }

    public c(e eVar) {
        this.f98578b = eVar;
    }
}
