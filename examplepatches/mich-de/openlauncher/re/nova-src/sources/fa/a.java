package fa;

import fe.j1;

/* loaded from: classes2.dex */
public final /* synthetic */ class a implements n30.c, wf.e {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54358a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f54359b;

    public /* synthetic */ a(boolean z11, int i5) {
        this.f54358a = i5;
        this.f54359b = z11;
    }

    @Override // n30.c
    public boolean f() {
        return this.f54359b;
    }

    @Override // wf.e
    public void invoke(Object obj) {
        switch (this.f54358a) {
            case 1:
                ((j1) obj).onShuffleModeEnabledChanged(this.f54359b);
                break;
            default:
                ((j1) obj).onSkipSilenceEnabledChanged(this.f54359b);
                break;
        }
    }
}
