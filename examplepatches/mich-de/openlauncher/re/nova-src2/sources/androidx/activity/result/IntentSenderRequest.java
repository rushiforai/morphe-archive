package androidx.activity.result;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.content.IntentSender;
import android.os.Parcel;
import android.os.Parcelable;
import gi.g;
import kotlin.Metadata;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Landroidx/activity/result/IntentSenderRequest;", "Landroid/os/Parcelable;", "fk/l", "activity_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
@SuppressLint({"BanParcelableUsage"})
/* loaded from: classes2.dex */
public final class IntentSenderRequest implements Parcelable {

    @JvmField
    @NotNull
    public static final Parcelable.Creator<IntentSenderRequest> CREATOR = new g(28);

    /* renamed from: a, reason: collision with root package name */
    public final IntentSender f13599a;

    /* renamed from: b, reason: collision with root package name */
    public final Intent f13600b;

    /* renamed from: c, reason: collision with root package name */
    public final int f13601c;

    /* renamed from: d, reason: collision with root package name */
    public final int f13602d;

    public IntentSenderRequest(IntentSender intentSender, Intent intent, int i5, int i11) {
        Intrinsics.g(intentSender, "intentSender");
        this.f13599a = intentSender;
        this.f13600b = intent;
        this.f13601c = i5;
        this.f13602d = i11;
    }

    /* renamed from: b, reason: from getter */
    public final Intent getF13600b() {
        return this.f13600b;
    }

    /* renamed from: d, reason: from getter */
    public final int getF13601c() {
        return this.f13601c;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    /* renamed from: e, reason: from getter */
    public final int getF13602d() {
        return this.f13602d;
    }

    /* renamed from: i, reason: from getter */
    public final IntentSender getF13599a() {
        return this.f13599a;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f13599a, i5);
        dest.writeParcelable(this.f13600b, i5);
        dest.writeInt(this.f13601c);
        dest.writeInt(this.f13602d);
    }
}
