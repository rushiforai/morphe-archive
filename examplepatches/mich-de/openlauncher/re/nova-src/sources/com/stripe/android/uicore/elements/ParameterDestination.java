package com.stripe.android.uicore.elements;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bw\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/uicore/elements/ParameterDestination;", "Landroid/os/Parcelable;", "Api", "Local", "Lcom/stripe/android/uicore/elements/ParameterDestination$Api;", "Lcom/stripe/android/uicore/elements/ParameterDestination$Local;", "stripe-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface ParameterDestination extends Parcelable {

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\b\u0087\u0081\u0002\u0018\u00002\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/uicore/elements/ParameterDestination$Api;", "Lcom/stripe/android/uicore/elements/ParameterDestination;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "stripe-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Api implements ParameterDestination {

        @NotNull
        public static final Parcelable.Creator<Api> CREATOR;

        /* renamed from: a, reason: collision with root package name */
        public static final Api f45387a;

        /* renamed from: b, reason: collision with root package name */
        public static final Api f45388b;

        /* renamed from: c, reason: collision with root package name */
        public static final /* synthetic */ Api[] f45389c;

        static {
            Api api = new Api("Params", 0);
            f45387a = api;
            Api api2 = new Api("Options", 1);
            f45388b = api2;
            Api[] apiArr = {api, api2};
            f45389c = apiArr;
            EnumEntriesKt.a(apiArr);
            CREATOR = new f();
        }

        public static Api valueOf(String str) {
            return (Api) Enum.valueOf(Api.class, str);
        }

        public static Api[] values() {
            return (Api[]) f45389c.clone();
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(name());
        }
    }

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\b\u0087\u0081\u0002\u0018\u00002\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/uicore/elements/ParameterDestination$Local;", "Lcom/stripe/android/uicore/elements/ParameterDestination;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "stripe-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Local implements ParameterDestination {

        @NotNull
        public static final Parcelable.Creator<Local> CREATOR;

        /* renamed from: a, reason: collision with root package name */
        public static final Local f45390a;

        /* renamed from: b, reason: collision with root package name */
        public static final /* synthetic */ Local[] f45391b;

        static {
            Local local = new Local("Extras", 0);
            f45390a = local;
            Local[] localArr = {local};
            f45391b = localArr;
            EnumEntriesKt.a(localArr);
            CREATOR = new g();
        }

        public static Local valueOf(String str) {
            return (Local) Enum.valueOf(Local.class, str);
        }

        public static Local[] values() {
            return (Local[]) f45391b.clone();
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(name());
        }
    }
}
