package androidx.customview.view;

import android.annotation.SuppressLint;
import android.os.Parcel;
import android.os.Parcelable;
import z1.p;

@SuppressLint({"BanParcelableUsage"})
/* loaded from: classes2.dex */
public abstract class AbsSavedState implements Parcelable {

    /* renamed from: a, reason: collision with root package name */
    public final Parcelable f14272a;

    /* renamed from: b, reason: collision with root package name */
    public static final AbsSavedState f14271b = new AnonymousClass1();
    public static final Parcelable.Creator<AbsSavedState> CREATOR = new p(4);

    /* renamed from: androidx.customview.view.AbsSavedState$1, reason: invalid class name */
    public class AnonymousClass1 extends AbsSavedState {
    }

    public AbsSavedState() {
        this.f14272a = null;
    }

    public final Parcelable b() {
        return this.f14272a;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i5) {
        parcel.writeParcelable(this.f14272a, i5);
    }

    public AbsSavedState(Parcelable parcelable) {
        if (parcelable != null) {
            this.f14272a = parcelable == f14271b ? null : parcelable;
            return;
        }
        throw new IllegalArgumentException("superState must not be null");
    }

    public AbsSavedState(Parcel parcel, ClassLoader classLoader) {
        Parcelable parcelable = parcel.readParcelable(classLoader);
        this.f14272a = parcelable == null ? f14271b : parcelable;
    }
}
