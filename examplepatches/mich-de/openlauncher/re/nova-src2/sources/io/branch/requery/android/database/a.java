package io.branch.requery.android.database;

import android.database.ContentObserver;
import java.lang.ref.WeakReference;

/* loaded from: classes4.dex */
public final class a extends ContentObserver {

    /* renamed from: a, reason: collision with root package name */
    public WeakReference f61784a;

    @Override // android.database.ContentObserver
    public final boolean deliverSelfNotifications() {
        return false;
    }

    @Override // android.database.ContentObserver
    public final void onChange(boolean z11) {
        b bVar = (b) this.f61784a.get();
        if (bVar != null) {
            bVar.onChange(false);
        }
    }
}
