package io.branch.search.internal;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public abstract class W implements Parcelable, X, Y {

    @NotNull
    public static final a Companion = new a();

    public static final class a {
    }

    public static final class b {

        @NotNull
        public static final a Companion = new a();

        /* renamed from: a, reason: collision with root package name */
        public float f63548a;

        /* renamed from: b, reason: collision with root package name */
        public final long f63549b;

        /* renamed from: c, reason: collision with root package name */
        @Nullable
        public Long f63550c;

        public static final class a {
        }

        public b(float f11, long j11) {
            this.f63548a = f11;
            this.f63549b = j11;
        }
    }

    @Override // io.branch.search.internal.Y
    @NotNull
    public final String b() {
        return "null.null.null";
    }

    @Override // io.branch.search.internal.X
    public final int c() {
        String string = d().toString();
        Intrinsics.f(string, "getImpressionJson().toString()");
        return string.hashCode();
    }

    @Override // io.branch.search.internal.X
    @NotNull
    public abstract JSONObject d();

    @Override // io.branch.search.internal.X
    @NotNull
    public final String e() {
        return null;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(@NotNull Parcel out, int i5) {
        Intrinsics.g(out, "out");
        out.writeString(null);
        out.writeString(null);
        out.writeInt(-1);
        out.writeString(null);
    }
}
