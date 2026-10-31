package com.google.android.material.timepicker;

import android.view.View;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class h implements View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f34491a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ MaterialTimePicker f34492b;

    public /* synthetic */ h(MaterialTimePicker materialTimePicker, int i5) {
        this.f34491a = i5;
        this.f34492b = materialTimePicker;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        switch (this.f34491a) {
            case 0:
                MaterialTimePicker materialTimePicker = this.f34492b;
                Iterator it = materialTimePicker.f34448a.iterator();
                while (it.hasNext()) {
                    ((View.OnClickListener) it.next()).onClick(view);
                }
                materialTimePicker.n(false, false, false);
                break;
            case 1:
                MaterialTimePicker materialTimePicker2 = this.f34492b;
                Iterator it2 = materialTimePicker2.f34449b.iterator();
                while (it2.hasNext()) {
                    ((View.OnClickListener) it2.next()).onClick(view);
                }
                materialTimePicker2.n(false, false, false);
                break;
            default:
                MaterialTimePicker materialTimePicker3 = this.f34492b;
                materialTimePicker3.f34465t = materialTimePicker3.f34465t == 0 ? 1 : 0;
                materialTimePicker3.q(materialTimePicker3.f34463r);
                break;
        }
    }
}
