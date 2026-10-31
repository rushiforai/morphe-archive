package android.support.v4.os;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import di.b;
import e.c;

@SuppressLint({"BanParcelableUsage"})
/* loaded from: classes2.dex */
public class ResultReceiver implements Parcelable {
    public static final Parcelable.Creator<ResultReceiver> CREATOR = new b(16);

    /* renamed from: a, reason: collision with root package name */
    public e.b f13596a;

    public void a(int i5, Bundle bundle) {
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        synchronized (this) {
            try {
                if (this.f13596a == null) {
                    this.f13596a = new c(this);
                }
                parcel.writeStrongBinder(this.f13596a.asBinder());
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
