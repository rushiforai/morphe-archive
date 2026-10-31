package com.google.android.gms.internal.measurement;

import android.net.Uri;
import com.google.common.util.concurrent.ListenableFuture;
import java.io.IOException;
import java.util.concurrent.Callable;
import java.util.logging.Level;

/* loaded from: classes3.dex */
public final /* synthetic */ class nd implements cl.d0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f32855a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f32856b;

    public /* synthetic */ nd(Object obj, int i5) {
        this.f32855a = i5;
        this.f32856b = obj;
    }

    @Override // cl.d0
    public final ListenableFuture apply(Object obj) throws IOException {
        switch (this.f32855a) {
            case 0:
                sd sdVar = (sd) this.f32856b;
                int i5 = ((zzmk) obj).f33346a;
                if ((i5 == 29501 || i5 == 29537 || i5 == 29538 || i5 == 29539 || i5 == 29540 || i5 == 29541 || i5 == 29542 || i5 == 29543 || i5 == 29544) && !sdVar.f33067h.E()) {
                    sdVar.b();
                }
                return cl.z0.f20092b;
            case 1:
                final mg.l lVar = (mg.l) this.f32856b;
                final ne neVar = (ne) obj;
                lVar.getClass();
                return cl.w0.d(new Callable() { // from class: com.google.android.gms.internal.measurement.je
                    @Override // java.util.concurrent.Callable
                    public final Object call() {
                        ne neVar2 = neVar;
                        mg.l lVar2 = lVar;
                        ob obVar = (ob) lVar2.f76309b;
                        l6 l6Var = new l6(4);
                        try {
                            ye yeVar = (ye) obVar.f32926f.get();
                            Uri uri = (Uri) lVar2.f76310c;
                            l6 l6Var2 = new l6(neVar2);
                            l6Var2.f32780c = new l6[]{l6Var};
                            return null;
                        } catch (IOException | RuntimeException e3) {
                            fb.g(Level.WARNING, obVar.a(), e3, "Failed to update snapshot for %s flags may be stale.", (String) lVar2.f76311d);
                            return null;
                        }
                    }
                }, ((ob) lVar.f76309b).a());
            case 2:
                return cl.w0.c((ListenableFuture) ((qe) this.f32856b).f33002e.get());
            case 3:
                return cl.w0.b(((qd) this.f32856b).apply(obj));
            case 4:
                return ((qf) this.f32856b).f33011e.F();
            default:
                IOException iOException = (IOException) this.f32856b;
                iOException.addSuppressed((IOException) obj);
                throw iOException;
        }
    }
}
