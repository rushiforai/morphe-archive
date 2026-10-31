package com.bytedance.adsdk.ugeno.jw;

import android.database.DataSetObservable;
import android.database.DataSetObserver;
import android.os.Parcelable;
import android.view.View;
import android.view.ViewGroup;

/* loaded from: classes2.dex */
public abstract class zb {
    private final DataSetObservable ycx = new DataSetObservable();

    /* renamed from: zb, reason: collision with root package name */
    private DataSetObserver f22391zb;

    public void sya() {
        synchronized (this) {
            try {
                DataSetObserver dataSetObserver = this.f22391zb;
                if (dataSetObserver != null) {
                    dataSetObserver.onChanged();
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        this.ycx.notifyChanged();
    }

    public float ycx(int i5) {
        return 1.0f;
    }

    public abstract int ycx();

    public abstract boolean ycx(View view, Object obj);

    public Parcelable zb() {
        return null;
    }

    public int ycx(Object obj) {
        return -1;
    }

    public Object ycx(ViewGroup viewGroup, int i5) {
        return ycx((View) viewGroup, i5);
    }

    public void ycx(ViewGroup viewGroup, int i5, Object obj) {
        ycx((View) viewGroup, i5, obj);
    }

    @Deprecated
    public Object ycx(View view, int i5) {
        throw new UnsupportedOperationException("Required method instantiateItem was not overridden");
    }

    @Deprecated
    public void ycx(View view, int i5, Object obj) {
        throw new UnsupportedOperationException("Required method destroyItem was not overridden");
    }

    public void ycx(DataSetObserver dataSetObserver) {
        synchronized (this) {
            this.f22391zb = dataSetObserver;
        }
    }
}
