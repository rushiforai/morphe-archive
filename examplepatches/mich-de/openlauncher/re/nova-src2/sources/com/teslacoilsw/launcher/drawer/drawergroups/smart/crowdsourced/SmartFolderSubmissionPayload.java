package com.teslacoilsw.launcher.drawer.drawergroups.smart.crowdsourced;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.ReflectionFactory;
import kotlin.reflect.KClass;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.ReferenceArraySerializer;
import org.jetbrains.annotations.NotNull;
import wy.a;
import wy.f;
import wy.g;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/teslacoilsw/launcher/drawer/drawergroups/smart/crowdsourced/SmartFolderSubmissionPayload;", "Landroid/os/Parcelable;", "CREATOR", "wy/g", "wy/f", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final class SmartFolderSubmissionPayload implements Parcelable {

    @NotNull
    public static final g CREATOR = new g();

    /* renamed from: c, reason: collision with root package name */
    public static final KSerializer[] f45756c;

    /* renamed from: a, reason: collision with root package name */
    public final SmartFolderSubmission[] f45757a;

    /* renamed from: b, reason: collision with root package name */
    public final SmartFolderSubmission[] f45758b;

    static {
        ReflectionFactory reflectionFactory = Reflection.f71864a;
        KClass orCreateKotlinClass = reflectionFactory.getOrCreateKotlinClass(SmartFolderSubmission.class);
        a aVar = a.f94888a;
        f45756c = new KSerializer[]{new ReferenceArraySerializer(orCreateKotlinClass, aVar), new ReferenceArraySerializer(reflectionFactory.getOrCreateKotlinClass(SmartFolderSubmission.class), aVar)};
    }

    public /* synthetic */ SmartFolderSubmissionPayload(int i5, SmartFolderSubmission[] smartFolderSubmissionArr, SmartFolderSubmission[] smartFolderSubmissionArr2) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, f.f94896a.getDescriptor());
        }
        this.f45757a = smartFolderSubmissionArr;
        this.f45758b = smartFolderSubmissionArr2;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeTypedArray(this.f45757a, i5);
        parcel.writeTypedArray(this.f45758b, i5);
    }

    public SmartFolderSubmissionPayload(SmartFolderSubmission[] smartFolderSubmissionArr, SmartFolderSubmission[] smartFolderSubmissionArr2) {
        this.f45757a = smartFolderSubmissionArr;
        this.f45758b = smartFolderSubmissionArr2;
    }
}
