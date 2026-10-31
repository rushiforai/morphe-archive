package io.branch.search.internal;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public abstract class X1 implements Parcelable {

    public static final class a extends X1 {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public static final a f63610a = new a();

        @NotNull
        public static final Parcelable.Creator<a> CREATOR = new C0330a();

        /* renamed from: io.branch.search.internal.X1$a$a, reason: collision with other inner class name */
        public static final class C0330a implements Parcelable.Creator<a> {
            @Override // android.os.Parcelable.Creator
            public final a createFromParcel(Parcel parcel) {
                Intrinsics.g(parcel, "parcel");
                parcel.readInt();
                return a.f63610a;
            }

            @Override // android.os.Parcelable.Creator
            public final a[] newArray(int i5) {
                return new a[i5];
            }
        }

        public a() {
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

    public static final class b extends X1 {

        @NotNull
        public static final Parcelable.Creator<b> CREATOR = new a();

        /* renamed from: a, reason: collision with root package name */
        public final float f63611a;

        /* renamed from: b, reason: collision with root package name */
        public final long f63612b;

        /* renamed from: c, reason: collision with root package name */
        @NotNull
        public final String f63613c;

        /* renamed from: d, reason: collision with root package name */
        @NotNull
        public final String f63614d;

        public static final class a implements Parcelable.Creator<b> {
            @Override // android.os.Parcelable.Creator
            public final b createFromParcel(Parcel parcel) {
                Intrinsics.g(parcel, "parcel");
                return new b(parcel.readFloat(), parcel.readLong(), parcel.readString(), parcel.readString());
            }

            @Override // android.os.Parcelable.Creator
            public final b[] newArray(int i5) {
                return new b[i5];
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(float f11, long j11, @NotNull String downloadsCount, @NotNull String appSizeInMB) {
            super(0);
            Intrinsics.g(downloadsCount, "downloadsCount");
            Intrinsics.g(appSizeInMB, "appSizeInMB");
            this.f63611a = f11;
            this.f63612b = j11;
            this.f63613c = downloadsCount;
            this.f63614d = appSizeInMB;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof b)) {
                return false;
            }
            b bVar = (b) obj;
            return Float.valueOf(this.f63611a).equals(Float.valueOf(bVar.f63611a)) && this.f63612b == bVar.f63612b && Intrinsics.b(this.f63613c, bVar.f63613c) && Intrinsics.b(this.f63614d, bVar.f63614d);
        }

        public final int hashCode() {
            return this.f63614d.hashCode() + C3248l8.a(this.f63613c, C3231k8.a(this.f63612b, Float.hashCode(this.f63611a) * 31, 31), 31);
        }

        @NotNull
        public final String toString() {
            StringBuilder sb2 = new StringBuilder("AppStore(averageRating=");
            sb2.append(this.f63611a);
            sb2.append(", ratingsCount=");
            sb2.append(this.f63612b);
            sb2.append(", downloadsCount=");
            sb2.append(this.f63613c);
            sb2.append(", appSizeInMB=");
            return Z.a(sb2, this.f63614d, ')');
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(@NotNull Parcel out, int i5) {
            Intrinsics.g(out, "out");
            out.writeFloat(this.f63611a);
            out.writeLong(this.f63612b);
            out.writeString(this.f63613c);
            out.writeString(this.f63614d);
        }
    }

    public static final class c extends X1 {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public static final c f63615a = new c();

        @NotNull
        public static final Parcelable.Creator<c> CREATOR = new a();

        public static final class a implements Parcelable.Creator<c> {
            @Override // android.os.Parcelable.Creator
            public final c createFromParcel(Parcel parcel) {
                Intrinsics.g(parcel, "parcel");
                parcel.readInt();
                return c.f63615a;
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

    public static final class d extends X1 {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public static final d f63616a = new d();

        @NotNull
        public static final Parcelable.Creator<d> CREATOR = new a();

        public static final class a implements Parcelable.Creator<d> {
            @Override // android.os.Parcelable.Creator
            public final d createFromParcel(Parcel parcel) {
                Intrinsics.g(parcel, "parcel");
                parcel.readInt();
                return d.f63616a;
            }

            @Override // android.os.Parcelable.Creator
            public final d[] newArray(int i5) {
                return new d[i5];
            }
        }

        public d() {
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

    public static final class e extends X1 {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public static final e f63617a = new e();

        @NotNull
        public static final Parcelable.Creator<e> CREATOR = new a();

        public static final class a implements Parcelable.Creator<e> {
            @Override // android.os.Parcelable.Creator
            public final e createFromParcel(Parcel parcel) {
                Intrinsics.g(parcel, "parcel");
                parcel.readInt();
                return e.f63617a;
            }

            @Override // android.os.Parcelable.Creator
            public final e[] newArray(int i5) {
                return new e[i5];
            }
        }

        public e() {
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

    public static final class f extends X1 {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public static final f f63618a = new f();

        @NotNull
        public static final Parcelable.Creator<f> CREATOR = new a();

        public static final class a implements Parcelable.Creator<f> {
            @Override // android.os.Parcelable.Creator
            public final f createFromParcel(Parcel parcel) {
                Intrinsics.g(parcel, "parcel");
                parcel.readInt();
                return f.f63618a;
            }

            @Override // android.os.Parcelable.Creator
            public final f[] newArray(int i5) {
                return new f[i5];
            }
        }

        public f() {
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

    public static final class g extends X1 {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public static final g f63619a = new g();

        @NotNull
        public static final Parcelable.Creator<g> CREATOR = new a();

        public static final class a implements Parcelable.Creator<g> {
            @Override // android.os.Parcelable.Creator
            public final g createFromParcel(Parcel parcel) {
                Intrinsics.g(parcel, "parcel");
                parcel.readInt();
                return g.f63619a;
            }

            @Override // android.os.Parcelable.Creator
            public final g[] newArray(int i5) {
                return new g[i5];
            }
        }

        public g() {
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

    public static final class h extends X1 {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public static final h f63620a = new h();

        @NotNull
        public static final Parcelable.Creator<h> CREATOR = new a();

        public static final class a implements Parcelable.Creator<h> {
            @Override // android.os.Parcelable.Creator
            public final h createFromParcel(Parcel parcel) {
                Intrinsics.g(parcel, "parcel");
                parcel.readInt();
                return h.f63620a;
            }

            @Override // android.os.Parcelable.Creator
            public final h[] newArray(int i5) {
                return new h[i5];
            }
        }

        public h() {
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

    public static final class i extends X1 {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public static final i f63621a = new i();

        @NotNull
        public static final Parcelable.Creator<i> CREATOR = new a();

        public static final class a implements Parcelable.Creator<i> {
            @Override // android.os.Parcelable.Creator
            public final i createFromParcel(Parcel parcel) {
                Intrinsics.g(parcel, "parcel");
                parcel.readInt();
                return i.f63621a;
            }

            @Override // android.os.Parcelable.Creator
            public final i[] newArray(int i5) {
                return new i[i5];
            }
        }

        public i() {
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

    public X1() {
    }

    public /* synthetic */ X1(int i5) {
        this();
    }
}
