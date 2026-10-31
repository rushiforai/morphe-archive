package g;

import android.window.BackEvent;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final float f56402a;

    /* renamed from: b, reason: collision with root package name */
    public final float f56403b;

    /* renamed from: c, reason: collision with root package name */
    public final float f56404c;

    /* renamed from: d, reason: collision with root package name */
    public final int f56405d;

    public b(BackEvent backEvent) {
        Intrinsics.g(backEvent, "backEvent");
        a aVar = a.f56394a;
        float fD = aVar.d(backEvent);
        float fE = aVar.e(backEvent);
        float fB = aVar.b(backEvent);
        int iC = aVar.c(backEvent);
        this.f56402a = fD;
        this.f56403b = fE;
        this.f56404c = fB;
        this.f56405d = iC;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("BackEventCompat{touchX=");
        sb2.append(this.f56402a);
        sb2.append(", touchY=");
        sb2.append(this.f56403b);
        sb2.append(", progress=");
        sb2.append(this.f56404c);
        sb2.append(", swipeEdge=");
        return a2.c.m(sb2, this.f56405d, AbstractJsonLexerKt.END_OBJ);
    }
}
