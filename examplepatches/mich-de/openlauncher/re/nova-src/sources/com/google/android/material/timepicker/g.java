package com.google.android.material.timepicker;

/* loaded from: classes3.dex */
public final /* synthetic */ class g implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f34489a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f34490b;

    public /* synthetic */ g(Object obj, int i5) {
        this.f34489a = i5;
        this.f34490b = obj;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f34489a) {
            case 0:
                Object obj = ((MaterialTimePicker) this.f34490b).f34456i;
                if (obj instanceof t) {
                    ((t) obj).c();
                    break;
                }
                break;
            default:
                ((k) this.f34490b).n();
                break;
        }
    }
}
