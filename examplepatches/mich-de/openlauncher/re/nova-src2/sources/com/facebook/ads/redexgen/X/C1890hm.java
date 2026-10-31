package com.facebook.ads.redexgen.X;

import android.content.res.Resources;
import android.database.DataSetObserver;

/* renamed from: com.facebook.ads.redexgen.X.hm, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1890hm extends DataSetObserver {
    public final /* synthetic */ C1893hp A00;

    public C1890hm(C1893hp c1893hp) {
        this.A00 = c1893hp;
    }

    @Override // android.database.DataSetObserver
    public final void onChanged() throws Resources.NotFoundException {
        this.A00.A0g();
    }

    @Override // android.database.DataSetObserver
    public final void onInvalidated() throws Resources.NotFoundException {
        this.A00.A0g();
    }
}
