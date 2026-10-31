package io.branch.search.ui;

import android.os.Parcel;
import android.os.Parcelable;
import io.branch.search.internal.InterfaceC3331q6;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u0000 \u00022\u00020\u0001:\u0001\u0003¨\u0006\u0004"}, d2 = {"Lio/branch/search/ui/ContactAction;", "Landroid/os/Parcelable;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "b50/c", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public final class ContactAction implements Parcelable {

    /* renamed from: a, reason: collision with root package name */
    public final InterfaceC3331q6 f66471a;

    /* renamed from: b, reason: collision with root package name */
    public final Image f66472b;

    /* renamed from: c, reason: collision with root package name */
    public final String f66473c;

    @NotNull
    public static final b50.c Companion = new b50.c();

    @NotNull
    public static final Parcelable.Creator<ContactAction> CREATOR = new ab.w(23);

    public ContactAction(InterfaceC3331q6 interfaceC3331q6, Image image, String str) {
        this.f66471a = interfaceC3331q6;
        this.f66472b = image;
        this.f66473c = str;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel out, int i5) {
        Intrinsics.g(out, "out");
        out.writeParcelable(this.f66471a, i5);
        out.writeParcelable(this.f66472b, i5);
        out.writeString(this.f66473c);
    }
}
