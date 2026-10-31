package com.stripe.android.ui.core.elements;

import android.os.Parcel;
import android.os.Parcelable;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import cw.c;
import cw.g4;
import cw.h4;
import cw.r2;
import java.util.ArrayList;
import java.util.Iterator;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/ui/core/elements/SharedDataSpec;", "Landroid/os/Parcelable;", k.O, "cw/g4", "cw/h4", "payments-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class SharedDataSpec implements Parcelable {

    /* renamed from: a, reason: collision with root package name */
    public final String f45337a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f45338b;

    /* renamed from: c, reason: collision with root package name */
    public final SelectorIcon f45339c;

    @NotNull
    public static final h4 Companion = new h4();

    @NotNull
    public static final Parcelable.Creator<SharedDataSpec> CREATOR = new c(25);

    /* renamed from: d, reason: collision with root package name */
    public static final KSerializer[] f45336d = {null, new ArrayListSerializer(r2.f48288a), null};

    public /* synthetic */ SharedDataSpec(int i5, String str, ArrayList arrayList, SelectorIcon selectorIcon) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, g4.f48155a.getDescriptor());
        }
        this.f45337a = str;
        if ((i5 & 2) == 0) {
            this.f45338b = new ArrayList();
        } else {
            this.f45338b = arrayList;
        }
        if ((i5 & 4) == 0) {
            this.f45339c = null;
        } else {
            this.f45339c = selectorIcon;
        }
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof SharedDataSpec)) {
            return false;
        }
        SharedDataSpec sharedDataSpec = (SharedDataSpec) obj;
        return Intrinsics.b(this.f45337a, sharedDataSpec.f45337a) && Intrinsics.b(this.f45338b, sharedDataSpec.f45338b) && Intrinsics.b(this.f45339c, sharedDataSpec.f45339c);
    }

    public final int hashCode() {
        int iHashCode = (this.f45338b.hashCode() + (this.f45337a.hashCode() * 31)) * 31;
        SelectorIcon selectorIcon = this.f45339c;
        return iHashCode + (selectorIcon == null ? 0 : selectorIcon.hashCode());
    }

    public final String toString() {
        return "SharedDataSpec(type=" + this.f45337a + ", fields=" + this.f45338b + ", selectorIcon=" + this.f45339c + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f45337a);
        Iterator itJ = fq.c.j(this.f45338b, dest);
        while (itJ.hasNext()) {
            dest.writeParcelable((Parcelable) itJ.next(), i5);
        }
        SelectorIcon selectorIcon = this.f45339c;
        if (selectorIcon == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            selectorIcon.writeToParcel(dest, i5);
        }
    }

    public SharedDataSpec(String type, ArrayList arrayList, SelectorIcon selectorIcon) {
        Intrinsics.g(type, "type");
        this.f45337a = type;
        this.f45338b = arrayList;
        this.f45339c = selectorIcon;
    }
}
