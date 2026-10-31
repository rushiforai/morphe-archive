package io.branch.search.ui;

import android.content.ComponentName;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.UserHandle;
import io.branch.search.internal.H2;
import io.branch.search.internal.Z;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b6\u0018\u0000 \u00022\u00020\u0001:\u0007\u0003\u0004\u0005\u0006\u0007\b\t\u0082\u0001\u0006\n\u000b\f\r\u000e\u000f¨\u0006\u0010"}, d2 = {"Lio/branch/search/ui/Image;", "Landroid/os/Parcelable;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "AndroidResource", "AppIcon", "b50/g", "LargeImage", "Shortcut", "Stub", "Url", "Lio/branch/search/ui/Image$AndroidResource;", "Lio/branch/search/ui/Image$AppIcon;", "Lio/branch/search/ui/Image$LargeImage;", "Lio/branch/search/ui/Image$Shortcut;", "Lio/branch/search/ui/Image$Stub;", "Lio/branch/search/ui/Image$Url;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public abstract class Image implements Parcelable {

    @NotNull
    public static final b50.g Companion = new b50.g();

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lio/branch/search/ui/Image$AndroidResource;", "Lio/branch/search/ui/Image;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    public static final class AndroidResource extends Image {

        @NotNull
        public static final Parcelable.Creator<AndroidResource> CREATOR = new h0();

        /* renamed from: a, reason: collision with root package name */
        public final Url f66474a;

        /* renamed from: b, reason: collision with root package name */
        public final String f66475b;

        /* renamed from: c, reason: collision with root package name */
        public final int f66476c;

        public AndroidResource(Url url, String str, int i5) {
            this.f66474a = url;
            this.f66475b = str;
            this.f66476c = i5;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("AndroidResource(url:");
            sb2.append(this.f66474a);
            sb2.append(", packageId:");
            sb2.append(this.f66475b);
            sb2.append(", resourceId:");
            return a2.c.m(sb2, this.f66476c, ')');
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel out, int i5) {
            Intrinsics.g(out, "out");
            out.writeParcelable(this.f66474a, i5);
            out.writeString(this.f66475b);
            out.writeInt(this.f66476c);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lio/branch/search/ui/Image$AppIcon;", "Lio/branch/search/ui/Image;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    public static final class AppIcon extends Image {

        @NotNull
        public static final Parcelable.Creator<AppIcon> CREATOR = new i0();

        /* renamed from: a, reason: collision with root package name */
        public final ComponentName f66477a;

        /* renamed from: b, reason: collision with root package name */
        public final UserHandle f66478b;

        public AppIcon(ComponentName componentName, UserHandle userHandle) {
            this.f66477a = componentName;
            this.f66478b = userHandle;
            LazyKt.a(new j0(this));
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final String toString() {
            return "AppIcon(componentName='" + this.f66477a + "', user='" + this.f66478b + ')';
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel out, int i5) {
            Intrinsics.g(out, "out");
            out.writeParcelable(this.f66477a, i5);
            out.writeParcelable(this.f66478b, i5);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lio/branch/search/ui/Image$LargeImage;", "Lio/branch/search/ui/Image;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    public static final class LargeImage extends Image {

        @NotNull
        public static final Parcelable.Creator<LargeImage> CREATOR = new k0();

        /* renamed from: a, reason: collision with root package name */
        public final float f66479a;

        /* renamed from: b, reason: collision with root package name */
        public final Url f66480b;

        public LargeImage(float f11, Url url) {
            this.f66479a = f11;
            this.f66480b = url;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel out, int i5) {
            Intrinsics.g(out, "out");
            out.writeFloat(this.f66479a);
            out.writeParcelable(this.f66480b, i5);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lio/branch/search/ui/Image$Shortcut;", "Lio/branch/search/ui/Image;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    public static final class Shortcut extends Image {

        @NotNull
        public static final Parcelable.Creator<Shortcut> CREATOR = new l0();

        /* renamed from: a, reason: collision with root package name */
        public final String f66481a;

        /* renamed from: b, reason: collision with root package name */
        public final UserHandle f66482b;

        /* renamed from: c, reason: collision with root package name */
        public final String f66483c;

        public Shortcut(UserHandle userHandle, String str, String str2) {
            this.f66481a = str;
            this.f66482b = userHandle;
            this.f66483c = str2;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("Shortcut(packageId:");
            sb2.append(this.f66481a);
            sb2.append(", user:");
            sb2.append(this.f66482b);
            sb2.append(", shortcutId:");
            return Z.a(sb2, this.f66483c, ')');
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel out, int i5) {
            Intrinsics.g(out, "out");
            out.writeString(this.f66481a);
            out.writeParcelable(this.f66482b, i5);
            out.writeString(this.f66483c);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lio/branch/search/ui/Image$Stub;", "Lio/branch/search/ui/Image;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    public static final class Stub extends Image {

        @NotNull
        public static final Parcelable.Creator<Stub> CREATOR = new m0();

        /* renamed from: a, reason: collision with root package name */
        public final String f66484a;

        public Stub(String str) {
            this.f66484a = str;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel out, int i5) {
            Intrinsics.g(out, "out");
            out.writeString(this.f66484a);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lio/branch/search/ui/Image$Url;", "Lio/branch/search/ui/Image;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    public static final class Url extends Image {

        @NotNull
        public static final Parcelable.Creator<Url> CREATOR = new n0();

        /* renamed from: a, reason: collision with root package name */
        public final String f66485a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ H2 f66486b;

        /* renamed from: c, reason: collision with root package name */
        public final Image f66487c;

        public Url(String str, H2 h22, Image image) {
            this.f66485a = str;
            this.f66486b = h22;
            this.f66487c = image;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final String toString() {
            return "Url(url:" + this.f66485a + ", resultType:" + this.f66486b + ')';
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel out, int i5) {
            Intrinsics.g(out, "out");
            out.writeString(this.f66485a);
            out.writeString(this.f66486b.name());
            out.writeParcelable(this.f66487c, 0);
        }
    }
}
