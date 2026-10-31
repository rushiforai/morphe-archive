package l30;

import android.widget.ListView;

/* loaded from: classes4.dex */
public final class h extends ListView {

    /* renamed from: a, reason: collision with root package name */
    public boolean f74640a;

    @Override // android.widget.ListView, android.widget.AbsListView, android.view.View
    public final void onMeasure(int i5, int i11) {
        this.f74640a = true;
        try {
            super.onMeasure(i5, i11);
        } finally {
            this.f74640a = false;
        }
    }
}
