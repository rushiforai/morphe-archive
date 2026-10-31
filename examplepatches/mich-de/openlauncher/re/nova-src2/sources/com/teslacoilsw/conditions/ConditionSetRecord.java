package com.teslacoilsw.conditions;

import aa.d;
import android.os.Parcel;
import android.os.Parcelable;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.teslacoilsw.conditions.rules.ConditionModel;
import fq.c;
import java.util.Iterator;
import java.util.List;
import jx.i;
import jx.j;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/teslacoilsw/conditions/ConditionSetRecord;", "Landroid/os/Parcelable;", k.O, "jx/j", "jx/i", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes.dex */
public final /* data */ class ConditionSetRecord implements Parcelable {

    /* renamed from: a, reason: collision with root package name */
    public final String f45532a;

    /* renamed from: b, reason: collision with root package name */
    public final List f45533b;

    @NotNull
    public static final j Companion = new j();

    @NotNull
    public static final Parcelable.Creator<ConditionSetRecord> CREATOR = new d(11);

    /* renamed from: c, reason: collision with root package name */
    public static final KSerializer[] f45530c = {null, new ArrayListSerializer(ConditionModel.Companion.serializer())};

    /* renamed from: d, reason: collision with root package name */
    public static final ConditionSetRecord f45531d = new ConditionSetRecord(b.f42142b, EmptyList.f71733a);

    public /* synthetic */ ConditionSetRecord(int i5, String str, List list) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, i.f70413a.getDescriptor());
        }
        this.f45532a = str;
        this.f45533b = list;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ConditionSetRecord)) {
            return false;
        }
        ConditionSetRecord conditionSetRecord = (ConditionSetRecord) obj;
        return Intrinsics.b(this.f45532a, conditionSetRecord.f45532a) && Intrinsics.b(this.f45533b, conditionSetRecord.f45533b);
    }

    public final int hashCode() {
        return this.f45533b.hashCode() + (this.f45532a.hashCode() * 31);
    }

    public final String toString() {
        return "ConditionSetRecord(id=" + this.f45532a + ", conditionModels=" + this.f45533b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f45532a);
        Iterator itK = c.k(this.f45533b, parcel);
        while (itK.hasNext()) {
            parcel.writeParcelable((Parcelable) itK.next(), i5);
        }
    }

    public ConditionSetRecord(String str, List list) {
        this.f45532a = str;
        this.f45533b = list;
    }
}
