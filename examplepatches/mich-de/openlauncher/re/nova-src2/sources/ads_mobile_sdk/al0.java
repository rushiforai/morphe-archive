package ads_mobile_sdk;

import ab.w;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes2.dex */
public final class al0 extends AbstractSafeParcelable {

    @JvmField
    @NotNull
    public static final Parcelable.Creator<al0> CREATOR = new w(21);

    /* renamed from: a, reason: collision with root package name */
    public final String f1036a;

    /* renamed from: b, reason: collision with root package name */
    public final int f1037b;

    public al0(String str, int i5) {
        this.f1036a = str;
        this.f1037b = i5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof al0)) {
            return false;
        }
        al0 al0Var = (al0) obj;
        return Intrinsics.b(this.f1036a, al0Var.f1036a) && this.f1037b == al0Var.f1037b;
    }

    public final int hashCode() {
        String str = this.f1036a;
        return Integer.hashCode(this.f1037b) + ((str == null ? 0 : str.hashCode()) * 31);
    }

    public final String toString() {
        return "ExceptionParcel(message=" + this.f1036a + ", errorCode=" + this.f1037b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        int iJ0 = fg.a.j0(dest, 20293);
        fg.a.c0(dest, 1, this.f1036a);
        fg.a.i0(dest, 2, 4);
        dest.writeInt(this.f1037b);
        fg.a.k0(dest, iJ0);
    }
}
