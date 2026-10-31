package b2;

import kotlin.jvm.functions.Function0;

/* loaded from: classes.dex */
public final /* synthetic */ class b implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f16994a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function0 f16995b;

    public /* synthetic */ b(Function0 function0, int i5) {
        this.f16994a = i5;
        this.f16995b = function0;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f16994a) {
            case 0:
                this.f16995b.invoke();
                break;
            case 1:
                this.f16995b.invoke();
                break;
            case 2:
                this.f16995b.invoke();
                break;
            default:
                this.f16995b.invoke();
                break;
        }
    }
}
