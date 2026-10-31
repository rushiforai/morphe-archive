package com.facebook.ads.redexgen.X;

import android.database.DataSetObservable;
import android.database.DataSetObserver;
import android.os.Parcelable;
import android.view.View;
import android.view.ViewGroup;
import javax.annotation.Nullable;

/* renamed from: com.facebook.ads.redexgen.X.hM, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1865hM {

    @Nullable
    public DataSetObserver A00;
    public final DataSetObservable A01 = new DataSetObservable();

    public abstract int A01();

    public abstract int A02(Object obj);

    public abstract Object A04(ViewGroup viewGroup, int i5);

    public abstract void A07(ViewGroup viewGroup, int i5, Object obj);

    public abstract boolean A08(View view, Object obj);

    public final float A00(int i5) {
        return 1.0f;
    }

    @Nullable
    public final Parcelable A03() {
        return null;
    }

    public final void A05() {
        synchronized (this) {
            if (this.A00 != null) {
                this.A00.onChanged();
            }
        }
        this.A01.notifyChanged();
    }

    public final void A06(DataSetObserver dataSetObserver) {
        synchronized (this) {
            this.A00 = dataSetObserver;
        }
    }
}
