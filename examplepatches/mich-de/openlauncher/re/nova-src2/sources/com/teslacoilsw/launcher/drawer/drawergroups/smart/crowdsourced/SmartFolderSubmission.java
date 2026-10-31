package com.teslacoilsw.launcher.drawer.drawergroups.smart.crowdsourced;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Reflection;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.ReferenceArraySerializer;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;
import wy.a;
import wy.b;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/teslacoilsw/launcher/drawer/drawergroups/smart/crowdsourced/SmartFolderSubmission;", "Landroid/os/Parcelable;", "CREATOR", "wy/b", "wy/a", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final class SmartFolderSubmission implements Parcelable {

    @NotNull
    public static final b CREATOR = new b();

    /* renamed from: c, reason: collision with root package name */
    public static final KSerializer[] f45753c = {null, new ReferenceArraySerializer(Reflection.f71864a.getOrCreateKotlinClass(String.class), StringSerializer.INSTANCE)};

    /* renamed from: a, reason: collision with root package name */
    public final String f45754a;

    /* renamed from: b, reason: collision with root package name */
    public final String[] f45755b;

    public /* synthetic */ SmartFolderSubmission(int i5, String str, String[] strArr) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, a.f94888a.getDescriptor());
        }
        this.f45754a = str;
        this.f45755b = strArr;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f45754a);
        parcel.writeStringArray(this.f45755b);
    }

    public SmartFolderSubmission(String str, String[] strArr) {
        this.f45754a = str;
        this.f45755b = strArr;
    }
}
