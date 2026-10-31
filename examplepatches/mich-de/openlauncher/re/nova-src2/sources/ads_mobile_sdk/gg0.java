package ads_mobile_sdk;

import aa.d;
import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes2.dex */
public final class gg0 extends AbstractSafeParcelable {

    @JvmField
    @NotNull
    public static final Parcelable.Creator<gg0> CREATOR = new d(1);

    /* renamed from: a, reason: collision with root package name */
    public final String f3840a;

    public gg0(String packageName) {
        Intrinsics.g(packageName, "packageName");
        this.f3840a = packageName;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof gg0) && Intrinsics.b(this.f3840a, ((gg0) obj).f3840a);
    }

    public final int hashCode() {
        return this.f3840a.hashCode();
    }

    public final String toString() {
        return c0.l("DecagonRequestParcel(packageName=", this.f3840a, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        int iJ0 = fg.a.j0(dest, 20293);
        fg.a.c0(dest, 1, this.f3840a);
        fg.a.k0(dest, iJ0);
    }
}
