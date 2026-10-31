package fa;

import android.net.Uri;
import java.util.function.Supplier;
import o9.g2;

/* loaded from: classes2.dex */
public final class n0 extends m0 {

    /* renamed from: d, reason: collision with root package name */
    public final ga.e f54445d;

    /* renamed from: e, reason: collision with root package name */
    public final Supplier f54446e;

    /* renamed from: f, reason: collision with root package name */
    public final int f54447f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ p0 f54448g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n0(p0 p0Var, ga.e eVar, Supplier supplier) {
        super(p0Var);
        this.f54448g = p0Var;
        this.f54445d = eVar;
        this.f54446e = supplier;
        this.f54447f = eVar.f57289a;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i5 = this.f54447f;
        Uri uriC = g2.c(i5);
        p0 p0Var = this.f54448g;
        p0Var.f54455a.getContentResolver().update(uriC, ((ya.b) this.f54446e.get()).b(p0Var.f54455a), null, null);
        a(this.f54445d, i5);
    }
}
