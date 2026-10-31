package io.branch.search.internal;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class Kb extends Exception implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<Kb> CREATOR = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f62796a;

    public static final class a implements Parcelable.Creator<Kb> {
        @Override // android.os.Parcelable.Creator
        public final Kb createFromParcel(Parcel parcel) {
            Intrinsics.g(parcel, "parcel");
            return new Kb(parcel.readString());
        }

        @Override // android.os.Parcelable.Creator
        public final Kb[] newArray(int i5) {
            return new Kb[i5];
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Kb(@NotNull String message) {
        super(message);
        Intrinsics.g(message, "message");
        this.f62796a = message;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // java.lang.Throwable
    @NotNull
    public final String getMessage() {
        return this.f62796a;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(@NotNull Parcel out, int i5) {
        Intrinsics.g(out, "out");
        out.writeString(this.f62796a);
    }
}
