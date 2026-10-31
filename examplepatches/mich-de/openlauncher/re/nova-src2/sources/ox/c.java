package ox;

import android.widget.FrameLayout;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import qx.s0;
import qx.w0;

/* loaded from: classes4.dex */
public final /* synthetic */ class c implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ w0 f81054a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ FrameLayout f81055b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f81056c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ String f81057d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ s0 f81058e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ long f81059f;

    public /* synthetic */ c(w0 w0Var, FrameLayout frameLayout, String str, String str2, s0 s0Var, long j11) {
        this.f81054a = w0Var;
        this.f81055b = frameLayout;
        this.f81056c = str;
        this.f81057d = str2;
        this.f81058e = s0Var;
        this.f81059f = j11;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        this.f81054a.n(this.f81055b, this.f81056c, this.f81057d, this.f81058e, this.f81059f);
        return Unit.f71706a;
    }
}
