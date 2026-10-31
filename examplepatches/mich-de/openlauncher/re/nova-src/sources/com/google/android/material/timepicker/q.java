package com.google.android.material.timepicker;

/* loaded from: classes3.dex */
public final /* synthetic */ class q {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f34513a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f34514b;

    public /* synthetic */ q(Object obj, int i5) {
        this.f34513a = i5;
        this.f34514b = obj;
    }

    public final void a(int i5, boolean z11) {
        int i11 = this.f34513a;
        Object obj = this.f34514b;
        switch (i11) {
            case 0:
                t tVar = (t) obj;
                if (z11) {
                    tVar.f34520b.f(i5 == 2131428326 ? 1 : 0);
                    break;
                }
                break;
            default:
                TimePickerView timePickerView = (TimePickerView) obj;
                if (!z11) {
                    int i12 = TimePickerView.f34475x;
                    break;
                } else {
                    n nVar = timePickerView.f34481u;
                    if (nVar != null) {
                        nVar.f34505b.f(i5 == 2131428326 ? 1 : 0);
                        break;
                    }
                }
                break;
        }
    }
}
