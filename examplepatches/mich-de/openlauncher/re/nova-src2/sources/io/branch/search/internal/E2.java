package io.branch.search.internal;

import android.os.Parcel;
import android.os.Parcelable;
import io.branch.search.internal.Pa;
import java.util.concurrent.CancellationException;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.TimeoutCancellationException;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public abstract class E2 implements Parcelable {

    @NotNull
    public static final b Companion = new b();

    public static final class a extends E2 {

        @NotNull
        public static final Parcelable.Creator<a> CREATOR = new C0321a();

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final R3 f62390a;

        /* renamed from: io.branch.search.internal.E2$a$a, reason: collision with other inner class name */
        public static final class C0321a implements Parcelable.Creator<a> {
            @Override // android.os.Parcelable.Creator
            public final a createFromParcel(Parcel parcel) {
                Intrinsics.g(parcel, "parcel");
                return new a(R3.valueOf(parcel.readString()));
            }

            @Override // android.os.Parcelable.Creator
            public final a[] newArray(int i5) {
                return new a[i5];
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(@NotNull R3 reason) {
            super(0);
            Intrinsics.g(reason, "reason");
            this.f62390a = reason;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(@NotNull Parcel out, int i5) {
            Intrinsics.g(out, "out");
            out.writeString(this.f62390a.name());
        }
    }

    public static final class b {
        @NotNull
        public static E2 a(@NotNull Throwable throwable) {
            Intrinsics.g(throwable, "throwable");
            if (throwable instanceof TimeoutCancellationException) {
                a aVar = new a(R3.Timeout);
                C3309p1.d(EnumC3131e9.ContentProviderRequests, "Operation encountered timeout: " + throwable.getMessage());
                return aVar;
            }
            if (throwable instanceof CancellationException) {
                a aVar2 = new a(R3.Requested);
                C3309p1.d(EnumC3131e9.ContentProviderRequests, "Operation was cancelled: " + throwable.getMessage());
                return aVar2;
            }
            if (!(throwable instanceof BranchErrorException)) {
                Pa.Companion.getClass();
                Pa paA = Pa.a.a(throwable);
                C3309p1.a(EnumC3131e9.ContentProviderRequests, throwable);
                return new d(paA);
            }
            Pa.a aVar3 = Pa.Companion;
            String name = throwable.getClass().getName();
            String message = throwable.getMessage();
            BranchErrorException branchErrorException = (BranchErrorException) throwable;
            Throwable orig = branchErrorException.getOrig();
            aVar3.getClass();
            Pa pa2 = new Pa(name, message, orig != null ? Pa.a.a(orig) : null);
            EnumC3131e9 enumC3131e9 = EnumC3131e9.ContentProviderRequests;
            Throwable orig2 = branchErrorException.getOrig();
            if (orig2 != null) {
                throwable = orig2;
            }
            C3309p1.a(enumC3131e9, throwable);
            return new d(pa2);
        }
    }

    public static final class c extends E2 {

        @NotNull
        public static final Parcelable.Creator<c> CREATOR = new a();

        public static final class a implements Parcelable.Creator<c> {
            @Override // android.os.Parcelable.Creator
            public final c createFromParcel(Parcel parcel) {
                Intrinsics.g(parcel, "parcel");
                parcel.readInt();
                return new c();
            }

            @Override // android.os.Parcelable.Creator
            public final c[] newArray(int i5) {
                return new c[i5];
            }
        }

        public c() {
            super(0);
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(@NotNull Parcel out, int i5) {
            Intrinsics.g(out, "out");
            out.writeInt(1);
        }
    }

    public static final class d extends E2 {

        @NotNull
        public static final Parcelable.Creator<d> CREATOR = new a();

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final Pa f62391a;

        public static final class a implements Parcelable.Creator<d> {
            @Override // android.os.Parcelable.Creator
            public final d createFromParcel(Parcel parcel) {
                Intrinsics.g(parcel, "parcel");
                return new d(Pa.CREATOR.createFromParcel(parcel));
            }

            @Override // android.os.Parcelable.Creator
            public final d[] newArray(int i5) {
                return new d[i5];
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public d(@NotNull Pa exception) {
            super(0);
            Intrinsics.g(exception, "exception");
            this.f62391a = exception;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof d) && Intrinsics.b(this.f62391a, ((d) obj).f62391a);
        }

        public final int hashCode() {
            return this.f62391a.hashCode();
        }

        @NotNull
        public final String toString() {
            return "Other(exception=" + this.f62391a + ')';
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(@NotNull Parcel out, int i5) {
            Intrinsics.g(out, "out");
            this.f62391a.writeToParcel(out, i5);
        }
    }

    public E2() {
    }

    public /* synthetic */ E2(int i5) {
        this();
    }
}
