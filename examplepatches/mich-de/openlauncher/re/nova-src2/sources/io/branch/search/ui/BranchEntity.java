package io.branch.search.ui;

import android.content.ComponentName;
import android.content.Context;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.UserHandle;
import android.view.View;
import io.branch.search.internal.C3346r5;
import io.branch.search.internal.C3347r6;
import io.branch.search.internal.InterfaceC3331q6;
import io.branch.search.internal.X1;
import io.branch.search.ui.Image;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b6\u0018\u0000 \u00022\u00020\u0001:\r\u0003\u0004\u0005\u0006\u0007\b\t\n\u000b\f\r\u000e\u000f\u0082\u0001\u000b\u0010\u0011\u0012\u0013\u0014\u0015\u0016\u0017\u0018\u0019\u001a¨\u0006\u001b"}, d2 = {"Lio/branch/search/ui/BranchEntity;", "Lio/branch/search/ui/Impressable;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "App", "AppStore", "AutoSuggestion", "b50/b", "Contact", "HeroAd", "HeroV2", "RelatedApp", "RichContent", "SearchMore", "Shortcut", "SourceData", "SuggestedInstalls", "Lio/branch/search/ui/BranchEntity$App;", "Lio/branch/search/ui/BranchEntity$AppStore;", "Lio/branch/search/ui/BranchEntity$AutoSuggestion;", "Lio/branch/search/ui/BranchEntity$Contact;", "Lio/branch/search/ui/BranchEntity$HeroAd;", "Lio/branch/search/ui/BranchEntity$HeroV2;", "Lio/branch/search/ui/BranchEntity$RelatedApp;", "Lio/branch/search/ui/BranchEntity$RichContent;", "Lio/branch/search/ui/BranchEntity$SearchMore;", "Lio/branch/search/ui/BranchEntity$Shortcut;", "Lio/branch/search/ui/BranchEntity$SuggestedInstalls;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public abstract class BranchEntity implements Impressable {

    @NotNull
    public static final b50.b Companion = new b50.b();

    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0007\u0018\u0000 \u00032\u00020\u00012\u00020\u0002:\u0001\u0004¨\u0006\u0005"}, d2 = {"Lio/branch/search/ui/BranchEntity$App;", "Lio/branch/search/ui/BranchEntity;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "io/branch/search/ui/a", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    public static final class App extends BranchEntity {

        /* renamed from: a, reason: collision with root package name */
        public final InterfaceC3331q6 f66389a;

        /* renamed from: b, reason: collision with root package name */
        public final String f66390b;

        /* renamed from: c, reason: collision with root package name */
        public final Image f66391c;

        /* renamed from: d, reason: collision with root package name */
        public final String f66392d;

        /* renamed from: e, reason: collision with root package name */
        public final ComponentName f66393e;

        /* renamed from: f, reason: collision with root package name */
        public final UserHandle f66394f;

        /* renamed from: g, reason: collision with root package name */
        public final int f66395g;

        /* renamed from: h, reason: collision with root package name */
        public final a70.d f66396h = LazyKt.a(new c(this));

        @NotNull
        public static final a Companion = new a();

        @NotNull
        public static final Parcelable.Creator<App> CREATOR = new b();

        public App(InterfaceC3331q6 interfaceC3331q6, String str, Image image, String str2, ComponentName componentName, UserHandle userHandle, int i5) {
            this.f66389a = interfaceC3331q6;
            this.f66390b = str;
            this.f66391c = image;
            this.f66392d = str2;
            this.f66393e = componentName;
            this.f66394f = userHandle;
            this.f66395g = i5;
        }

        @Override // io.branch.search.ui.BranchEntity
        /* renamed from: b, reason: from getter */
        public final int getF66466e() {
            return this.f66395g;
        }

        @Override // io.branch.search.ui.BranchEntity
        /* renamed from: d, reason: from getter */
        public final /* synthetic */ InterfaceC3331q6 getF66462a() {
            return this.f66389a;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        /* renamed from: i, reason: from getter */
        public final Image getF66391c() {
            return this.f66391c;
        }

        public final CharSequence l() {
            return (CharSequence) this.f66396h.getValue();
        }

        public final void m(Context context) {
            Intrinsics.g(context, "context");
            C3346r5.Companion.getClass();
            C3347r6.a(this.f66389a, context, C3346r5.f65614a, X1.a.f63610a);
        }

        @Override // io.branch.search.ui.BranchEntity
        /* renamed from: sourcePackageName, reason: from getter */
        public final String getF66406j() {
            return this.f66392d;
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("App(title='");
            sb2.append(this.f66390b);
            sb2.append("', packageName='");
            String str = this.f66392d;
            sb2.append(str);
            sb2.append("', componentName=");
            sb2.append(this.f66393e);
            sb2.append(", userHandle=");
            sb2.append(this.f66394f);
            sb2.append(", adState=");
            sb2.append(b50.e.b(this.f66395g));
            sb2.append(", entityActions=");
            sb2.append(this.f66389a);
            sb2.append(", icon=");
            sb2.append(this.f66391c);
            sb2.append(", sourcePackageName=");
            sb2.append(str);
            sb2.append(')');
            return sb2.toString();
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel out, int i5) {
            Intrinsics.g(out, "out");
            out.writeParcelable(this.f66389a, i5);
            out.writeString(this.f66390b);
            out.writeParcelable(this.f66391c, i5);
            out.writeString(this.f66392d);
            out.writeParcelable(this.f66393e, i5);
            out.writeParcelable(this.f66394f, i5);
            int i11 = this.f66395g;
            if (i11 == 0) {
                out.writeInt(0);
            } else {
                out.writeInt(1);
                out.writeString(b50.e.a(i11));
            }
        }
    }

    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0007\u0018\u0000 \u00032\u00020\u00012\u00020\u0002:\u0001\u0004¨\u0006\u0005"}, d2 = {"Lio/branch/search/ui/BranchEntity$AppStore;", "Lio/branch/search/ui/BranchEntity;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "io/branch/search/ui/d", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    public static final class AppStore extends BranchEntity {

        /* renamed from: a, reason: collision with root package name */
        public final InterfaceC3331q6 f66397a;

        /* renamed from: b, reason: collision with root package name */
        public final String f66398b;

        /* renamed from: c, reason: collision with root package name */
        public final String f66399c;

        /* renamed from: d, reason: collision with root package name */
        public final Image f66400d;

        /* renamed from: e, reason: collision with root package name */
        public final List f66401e;

        /* renamed from: f, reason: collision with root package name */
        public final float f66402f;

        /* renamed from: g, reason: collision with root package name */
        public final long f66403g;

        /* renamed from: h, reason: collision with root package name */
        public final String f66404h;

        /* renamed from: i, reason: collision with root package name */
        public final String f66405i;

        /* renamed from: j, reason: collision with root package name */
        public final String f66406j;

        /* renamed from: k, reason: collision with root package name */
        public final int f66407k;

        /* renamed from: l, reason: collision with root package name */
        public final String f66408l;

        /* renamed from: m, reason: collision with root package name */
        public final a70.d f66409m = LazyKt.a(new g(this));

        @NotNull
        public static final d Companion = new d();

        @NotNull
        public static final Parcelable.Creator<AppStore> CREATOR = new e();

        public AppStore(InterfaceC3331q6 interfaceC3331q6, String str, String str2, Image image, List list, float f11, long j11, String str3, String str4, String str5, int i5, String str6) {
            this.f66397a = interfaceC3331q6;
            this.f66398b = str;
            this.f66399c = str2;
            this.f66400d = image;
            this.f66401e = list;
            this.f66402f = f11;
            this.f66403g = j11;
            this.f66404h = str3;
            this.f66405i = str4;
            this.f66406j = str5;
            this.f66407k = i5;
            this.f66408l = str6;
            LazyKt.a(new f(this));
        }

        /* renamed from: C, reason: from getter */
        public final long getF66403g() {
            return this.f66403g;
        }

        public final CharSequence S() {
            return (CharSequence) this.f66409m.getValue();
        }

        public final void a0(Context context) {
            Intrinsics.g(context, "context");
            C3346r5.Companion.getClass();
            C3347r6.a(this.f66397a, context, C3346r5.f65614a, new X1.b(this.f66402f, this.f66403g, this.f66404h, this.f66405i));
        }

        @Override // io.branch.search.ui.BranchEntity
        /* renamed from: b, reason: from getter */
        public final int getF66466e() {
            return this.f66407k;
        }

        @Override // io.branch.search.ui.BranchEntity
        /* renamed from: d, reason: from getter */
        public final /* synthetic */ InterfaceC3331q6 getF66462a() {
            return this.f66397a;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        /* renamed from: i, reason: from getter */
        public final String getF66408l() {
            return this.f66408l;
        }

        /* renamed from: l, reason: from getter */
        public final String getF66405i() {
            return this.f66405i;
        }

        /* renamed from: m, reason: from getter */
        public final float getF66402f() {
            return this.f66402f;
        }

        /* renamed from: p, reason: from getter */
        public final String getF66404h() {
            return this.f66404h;
        }

        /* renamed from: s, reason: from getter */
        public final Image getF66400d() {
            return this.f66400d;
        }

        @Override // io.branch.search.ui.BranchEntity
        /* renamed from: sourcePackageName, reason: from getter */
        public final String getF66406j() {
            return this.f66406j;
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("AppStore(name='");
            sb2.append(this.f66398b);
            sb2.append("', description=");
            sb2.append(this.f66399c);
            sb2.append(", icon=");
            sb2.append(this.f66400d);
            sb2.append(", screenshots=[");
            sb2.append(b70.g.f1(this.f66401e, null, null, null, 0, h.f66503j, 31));
            sb2.append("], averageRating=");
            sb2.append(this.f66402f);
            sb2.append(", ratingsCount=");
            sb2.append(this.f66403g);
            sb2.append(", downloadsCount='");
            sb2.append(this.f66404h);
            sb2.append("', appSizeInMB='");
            sb2.append(this.f66405i);
            sb2.append("', packageName='");
            String str = this.f66406j;
            sb2.append(str);
            sb2.append("', entityActions=");
            sb2.append(this.f66397a);
            sb2.append(", adState=");
            sb2.append(b50.e.b(this.f66407k));
            sb2.append(", sourcePackageName=");
            sb2.append(str);
            sb2.append(')');
            return sb2.toString();
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel out, int i5) {
            Intrinsics.g(out, "out");
            out.writeParcelable(this.f66397a, i5);
            out.writeString(this.f66398b);
            out.writeString(this.f66399c);
            out.writeParcelable(this.f66400d, i5);
            Iterator itK = fq.c.k(this.f66401e, out);
            while (itK.hasNext()) {
                out.writeParcelable((Parcelable) itK.next(), i5);
            }
            out.writeFloat(this.f66402f);
            out.writeLong(this.f66403g);
            out.writeString(this.f66404h);
            out.writeString(this.f66405i);
            out.writeString(this.f66406j);
            int i11 = this.f66407k;
            if (i11 == 0) {
                out.writeInt(0);
            } else {
                out.writeInt(1);
                out.writeString(b50.e.a(i11));
            }
            out.writeString(this.f66408l);
        }
    }

    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0007\u0018\u0000 \u00032\u00020\u00012\u00020\u0002:\u0001\u0004¨\u0006\u0005"}, d2 = {"Lio/branch/search/ui/BranchEntity$AutoSuggestion;", "Lio/branch/search/ui/BranchEntity;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "io/branch/search/ui/i", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    public static final class AutoSuggestion extends BranchEntity {

        /* renamed from: a, reason: collision with root package name */
        public final InterfaceC3331q6.a f66410a;

        /* renamed from: b, reason: collision with root package name */
        public final String f66411b;

        /* renamed from: c, reason: collision with root package name */
        public final Image f66412c;

        /* renamed from: d, reason: collision with root package name */
        public final a70.d f66413d = LazyKt.a(new k(this));

        @NotNull
        public static final i Companion = new i();

        @NotNull
        public static final Parcelable.Creator<AutoSuggestion> CREATOR = new j();

        public AutoSuggestion(InterfaceC3331q6.a aVar, String str, Image image) {
            this.f66410a = aVar;
            this.f66411b = str;
            this.f66412c = image;
        }

        @Override // io.branch.search.ui.BranchEntity
        /* renamed from: d */
        public final /* synthetic */ InterfaceC3331q6 getF66462a() {
            return this.f66410a;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final CharSequence i() {
            return (CharSequence) this.f66413d.getValue();
        }

        public final String toString() {
            return "AutoSuggestion(suggestion='" + this.f66411b + "', image=" + this.f66412c + ", entityActions=" + this.f66410a + ')';
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel out, int i5) {
            Intrinsics.g(out, "out");
            this.f66410a.writeToParcel(out, i5);
            out.writeString(this.f66411b);
            out.writeParcelable(this.f66412c, i5);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u0000 \u00022\u00020\u0001:\u0001\u0003¨\u0006\u0004"}, d2 = {"Lio/branch/search/ui/BranchEntity$Contact;", "Lio/branch/search/ui/BranchEntity;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "io/branch/search/ui/l", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    public static final class Contact extends BranchEntity {

        /* renamed from: a, reason: collision with root package name */
        public final InterfaceC3331q6 f66414a;

        /* renamed from: b, reason: collision with root package name */
        public final String f66415b;

        /* renamed from: c, reason: collision with root package name */
        public final Image f66416c;

        /* renamed from: d, reason: collision with root package name */
        public final ArrayList f66417d;

        @NotNull
        public static final l Companion = new l();

        @NotNull
        public static final Parcelable.Creator<Contact> CREATOR = new m();

        public Contact(InterfaceC3331q6 interfaceC3331q6, String str, Image image, ArrayList arrayList) {
            this.f66414a = interfaceC3331q6;
            this.f66415b = str;
            this.f66416c = image;
            this.f66417d = arrayList;
            LazyKt.a(new n(this));
        }

        @Override // io.branch.search.ui.BranchEntity
        /* renamed from: d, reason: from getter */
        public final /* synthetic */ InterfaceC3331q6 getF66462a() {
            return this.f66414a;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel out, int i5) {
            Intrinsics.g(out, "out");
            out.writeParcelable(this.f66414a, i5);
            out.writeString(this.f66415b);
            out.writeParcelable(this.f66416c, i5);
            Iterator itJ = fq.c.j(this.f66417d, out);
            while (itJ.hasNext()) {
                ((ContactAction) itJ.next()).writeToParcel(out, i5);
            }
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u0000 \u00022\u00020\u0001:\u0001\u0003¨\u0006\u0004"}, d2 = {"Lio/branch/search/ui/BranchEntity$HeroAd;", "Lio/branch/search/ui/BranchEntity;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "io/branch/search/ui/o", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    public static final class HeroAd extends BranchEntity {

        /* renamed from: a, reason: collision with root package name */
        public final InterfaceC3331q6 f66418a;

        /* renamed from: b, reason: collision with root package name */
        public final String f66419b;

        /* renamed from: c, reason: collision with root package name */
        public final String f66420c;

        /* renamed from: d, reason: collision with root package name */
        public final Image f66421d;

        /* renamed from: e, reason: collision with root package name */
        public final Image f66422e;

        /* renamed from: f, reason: collision with root package name */
        public final String f66423f;

        /* renamed from: g, reason: collision with root package name */
        public final int f66424g;

        /* renamed from: h, reason: collision with root package name */
        public final a70.d f66425h = LazyKt.a(new q0(this));

        /* renamed from: i, reason: collision with root package name */
        public final a70.d f66426i = LazyKt.a(new p0(this));

        @NotNull
        public static final o Companion = new o();

        @NotNull
        public static final Parcelable.Creator<HeroAd> CREATOR = new p();

        public HeroAd(InterfaceC3331q6 interfaceC3331q6, String str, String str2, Image image, Image image2, String str3, int i5) {
            this.f66418a = interfaceC3331q6;
            this.f66419b = str;
            this.f66420c = str2;
            this.f66421d = image;
            this.f66422e = image2;
            this.f66423f = str3;
            this.f66424g = i5;
            LazyKt.a(new o0(this));
        }

        @Override // io.branch.search.ui.BranchEntity
        /* renamed from: b, reason: from getter */
        public final int getF66466e() {
            return this.f66424g;
        }

        @Override // io.branch.search.ui.BranchEntity
        /* renamed from: d, reason: from getter */
        public final /* synthetic */ InterfaceC3331q6 getF66462a() {
            return this.f66418a;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final CharSequence i() {
            return (CharSequence) this.f66426i.getValue();
        }

        /* renamed from: l, reason: from getter */
        public final Image getF66421d() {
            return this.f66421d;
        }

        public final CharSequence m() {
            return (CharSequence) this.f66425h.getValue();
        }

        public final void p(Context context) {
            Intrinsics.g(context, "context");
            C3346r5.Companion.getClass();
            C3347r6.a(this.f66418a, context, C3346r5.f65614a, X1.d.f63616a);
        }

        public final String toString() {
            return "HeroAd(title='" + this.f66419b + "', description=" + this.f66420c + ", icon=" + this.f66421d + ", secondaryImage=" + this.f66422e + ", _callToAction='" + this.f66423f + "', adState=" + b50.e.b(this.f66424g) + ", entityActions=" + this.f66418a + ", sourcePackageName=" + getF66406j() + ')';
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel out, int i5) {
            Intrinsics.g(out, "out");
            out.writeParcelable(this.f66418a, i5);
            out.writeString(this.f66419b);
            out.writeString(this.f66420c);
            out.writeParcelable(this.f66421d, i5);
            out.writeParcelable(this.f66422e, i5);
            out.writeString(this.f66423f);
            int i11 = this.f66424g;
            if (i11 == 0) {
                out.writeInt(0);
            } else {
                out.writeInt(1);
                out.writeString(b50.e.a(i11));
            }
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u0000 \u00022\u00020\u0001:\u0001\u0003¨\u0006\u0004"}, d2 = {"Lio/branch/search/ui/BranchEntity$HeroV2;", "Lio/branch/search/ui/BranchEntity;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "io/branch/search/ui/q", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    public static final class HeroV2 extends BranchEntity {

        /* renamed from: a, reason: collision with root package name */
        public final InterfaceC3331q6 f66427a;

        /* renamed from: b, reason: collision with root package name */
        public final String f66428b;

        /* renamed from: c, reason: collision with root package name */
        public final String f66429c;

        /* renamed from: d, reason: collision with root package name */
        public final Image f66430d;

        /* renamed from: e, reason: collision with root package name */
        public final int f66431e;

        /* renamed from: f, reason: collision with root package name */
        public final ArrayList f66432f;

        /* renamed from: g, reason: collision with root package name */
        public final a70.d f66433g = LazyKt.a(new s0(this));

        /* renamed from: h, reason: collision with root package name */
        public final a70.d f66434h = LazyKt.a(new r0(this));

        @NotNull
        public static final q Companion = new q();

        @NotNull
        public static final Parcelable.Creator<HeroV2> CREATOR = new r();

        public HeroV2(InterfaceC3331q6 interfaceC3331q6, String str, String str2, Image image, int i5, ArrayList arrayList) {
            this.f66427a = interfaceC3331q6;
            this.f66428b = str;
            this.f66429c = str2;
            this.f66430d = image;
            this.f66431e = i5;
            this.f66432f = arrayList;
        }

        @Override // io.branch.search.ui.BranchEntity
        /* renamed from: b, reason: from getter */
        public final int getF66466e() {
            return this.f66431e;
        }

        @Override // io.branch.search.ui.BranchEntity
        /* renamed from: d, reason: from getter */
        public final /* synthetic */ InterfaceC3331q6 getF66462a() {
            return this.f66427a;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final CharSequence i() {
            return (CharSequence) this.f66434h.getValue();
        }

        /* renamed from: l, reason: from getter */
        public final Image getF66430d() {
            return this.f66430d;
        }

        public final CharSequence m() {
            return (CharSequence) this.f66433g.getValue();
        }

        public final void p(Context context) {
            Intrinsics.g(context, "context");
            C3346r5.Companion.getClass();
            C3347r6.a(this.f66427a, context, C3346r5.f65614a, X1.d.f63616a);
        }

        public final String toString() {
            return "HeroV2(title='" + this.f66428b + "', description=" + this.f66429c + ", icon=" + this.f66430d + ", adState=" + b50.e.b(this.f66431e) + ", shortcuts=(" + b70.g.f1(this.f66432f, ",", null, null, 0, s.f66511j, 30) + ") entityActions=" + this.f66427a + ", sourcePackageName=" + getF66406j() + ')';
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel out, int i5) {
            Intrinsics.g(out, "out");
            out.writeParcelable(this.f66427a, i5);
            out.writeString(this.f66428b);
            out.writeString(this.f66429c);
            out.writeParcelable(this.f66430d, i5);
            int i11 = this.f66431e;
            if (i11 == 0) {
                out.writeInt(0);
            } else {
                out.writeInt(1);
                out.writeString(b50.e.a(i11));
            }
            Iterator itJ = fq.c.j(this.f66432f, out);
            while (itJ.hasNext()) {
                ((Shortcut) itJ.next()).writeToParcel(out, i5);
            }
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u0000 \u00022\u00020\u0001:\u0001\u0003¨\u0006\u0004"}, d2 = {"Lio/branch/search/ui/BranchEntity$RelatedApp;", "Lio/branch/search/ui/BranchEntity;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "io/branch/search/ui/t", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    public static final class RelatedApp extends BranchEntity {

        /* renamed from: a, reason: collision with root package name */
        public final InterfaceC3331q6 f66435a;

        /* renamed from: b, reason: collision with root package name */
        public final String f66436b;

        /* renamed from: c, reason: collision with root package name */
        public final String f66437c;

        /* renamed from: d, reason: collision with root package name */
        public final Image f66438d;

        /* renamed from: e, reason: collision with root package name */
        public final int f66439e;

        /* renamed from: f, reason: collision with root package name */
        public final a70.d f66440f = LazyKt.a(new u0(this));

        @NotNull
        public static final t Companion = new t();

        @NotNull
        public static final Parcelable.Creator<RelatedApp> CREATOR = new u();

        public RelatedApp(InterfaceC3331q6 interfaceC3331q6, String str, String str2, Image image, int i5) {
            this.f66435a = interfaceC3331q6;
            this.f66436b = str;
            this.f66437c = str2;
            this.f66438d = image;
            this.f66439e = i5;
            LazyKt.a(new t0(this));
        }

        @Override // io.branch.search.ui.BranchEntity
        /* renamed from: b, reason: from getter */
        public final int getF66466e() {
            return this.f66439e;
        }

        @Override // io.branch.search.ui.BranchEntity
        /* renamed from: d, reason: from getter */
        public final /* synthetic */ InterfaceC3331q6 getF66462a() {
            return this.f66435a;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        /* renamed from: i, reason: from getter */
        public final Image getF66438d() {
            return this.f66438d;
        }

        public final CharSequence l() {
            return (CharSequence) this.f66440f.getValue();
        }

        public final void m(Context context) {
            Intrinsics.g(context, "context");
            C3346r5.Companion.getClass();
            C3347r6.a(this.f66435a, context, C3346r5.f65614a, X1.e.f63617a);
        }

        public final String toString() {
            return "RelatedApp(title='" + this.f66436b + "', description=" + this.f66437c + ", icon=" + this.f66438d + ", adState=" + b50.e.b(this.f66439e) + ", entityActions=" + this.f66435a + ", sourcePackageName=" + getF66406j() + ')';
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel out, int i5) {
            Intrinsics.g(out, "out");
            out.writeParcelable(this.f66435a, i5);
            out.writeString(this.f66436b);
            out.writeString(this.f66437c);
            out.writeParcelable(this.f66438d, i5);
            int i11 = this.f66439e;
            if (i11 == 0) {
                out.writeInt(0);
            } else {
                out.writeInt(1);
                out.writeString(b50.e.a(i11));
            }
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u0000 \u00022\u00020\u0001:\u0001\u0003¨\u0006\u0004"}, d2 = {"Lio/branch/search/ui/BranchEntity$RichContent;", "Lio/branch/search/ui/BranchEntity;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "io/branch/search/ui/v", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    public static final class RichContent extends BranchEntity {

        /* renamed from: a, reason: collision with root package name */
        public final InterfaceC3331q6.b f66441a;

        /* renamed from: b, reason: collision with root package name */
        public final Image.LargeImage f66442b;

        /* renamed from: c, reason: collision with root package name */
        public final String f66443c;

        /* renamed from: d, reason: collision with root package name */
        public final SourceData f66444d;

        /* renamed from: e, reason: collision with root package name */
        public final int f66445e;

        @NotNull
        public static final v Companion = new v();

        @NotNull
        public static final Parcelable.Creator<RichContent> CREATOR = new w();

        public RichContent(InterfaceC3331q6.b bVar, Image.LargeImage largeImage, String str, SourceData sourceData, int i5) {
            this.f66441a = bVar;
            this.f66442b = largeImage;
            this.f66443c = str;
            this.f66444d = sourceData;
            this.f66445e = i5;
        }

        @Override // io.branch.search.ui.BranchEntity
        /* renamed from: b, reason: from getter */
        public final int getF66466e() {
            return this.f66445e;
        }

        @Override // io.branch.search.ui.BranchEntity
        /* renamed from: d */
        public final /* synthetic */ InterfaceC3331q6 getF66462a() {
            return this.f66441a;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final void f(Context context) {
            Intrinsics.g(context, "context");
            C3346r5.Companion.getClass();
            C3347r6.a(this.f66441a, context, C3346r5.f65614a, X1.f.f63618a);
        }

        public final String toString() {
            return "RichContent(contentTitle='" + this.f66443c + "', contentImage=" + this.f66442b + ", source=" + Reflection.f71864a.getOrCreateKotlinClass(this.f66444d.getClass()).getSimpleName() + ", entityActions=" + this.f66441a + ", adState=" + b50.e.b(this.f66445e) + ", sourcePackageName=" + getF66406j() + ')';
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel out, int i5) {
            Intrinsics.g(out, "out");
            this.f66441a.writeToParcel(out, i5);
            this.f66442b.writeToParcel(out, i5);
            out.writeString(this.f66443c);
            this.f66444d.writeToParcel(out, i5);
            int i11 = this.f66445e;
            if (i11 == 0) {
                out.writeInt(0);
            } else {
                out.writeInt(1);
                out.writeString(b50.e.a(i11));
            }
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u0000 \u00022\u00020\u0001:\u0001\u0003¨\u0006\u0004"}, d2 = {"Lio/branch/search/ui/BranchEntity$SearchMore;", "Lio/branch/search/ui/BranchEntity;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "io/branch/search/ui/x", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    public static final class SearchMore extends BranchEntity {

        /* renamed from: a, reason: collision with root package name */
        public final InterfaceC3331q6 f66446a;

        /* renamed from: b, reason: collision with root package name */
        public final String f66447b;

        /* renamed from: c, reason: collision with root package name */
        public final Image f66448c;

        /* renamed from: d, reason: collision with root package name */
        public final a70.d f66449d = LazyKt.a(new v0(this));

        @NotNull
        public static final x Companion = new x();

        @NotNull
        public static final Parcelable.Creator<SearchMore> CREATOR = new y();

        public SearchMore(InterfaceC3331q6 interfaceC3331q6, Image image, String str) {
            this.f66446a = interfaceC3331q6;
            this.f66447b = str;
            this.f66448c = image;
        }

        @Override // io.branch.search.ui.BranchEntity
        /* renamed from: d, reason: from getter */
        public final /* synthetic */ InterfaceC3331q6 getF66462a() {
            return this.f66446a;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        /* renamed from: i, reason: from getter */
        public final Image getF66448c() {
            return this.f66448c;
        }

        public final CharSequence l() {
            return (CharSequence) this.f66449d.getValue();
        }

        public final void m(Context context) {
            Intrinsics.g(context, "context");
            C3346r5.Companion.getClass();
            C3347r6.a(this.f66446a, context, C3346r5.f65614a, X1.g.f63619a);
        }

        public final String toString() {
            return "SearchMore(name='" + this.f66447b + "', appIcon=" + this.f66448c + ", entityActions=" + this.f66446a + ", sourcePackageName=" + getF66406j() + ')';
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel out, int i5) {
            Intrinsics.g(out, "out");
            out.writeParcelable(this.f66446a, i5);
            out.writeString(this.f66447b);
            out.writeParcelable(this.f66448c, i5);
        }
    }

    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0007\u0018\u0000 \u00032\u00020\u00012\u00020\u0002:\u0001\u0004¨\u0006\u0005"}, d2 = {"Lio/branch/search/ui/BranchEntity$Shortcut;", "Lio/branch/search/ui/BranchEntity;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "io/branch/search/ui/z", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    public static final class Shortcut extends BranchEntity {

        /* renamed from: a, reason: collision with root package name */
        public final InterfaceC3331q6 f66450a;

        /* renamed from: b, reason: collision with root package name */
        public final String f66451b;

        /* renamed from: c, reason: collision with root package name */
        public final String f66452c;

        /* renamed from: d, reason: collision with root package name */
        public final Image f66453d;

        /* renamed from: e, reason: collision with root package name */
        public final Image f66454e;

        /* renamed from: f, reason: collision with root package name */
        public final int f66455f;

        /* renamed from: g, reason: collision with root package name */
        public final a70.d f66456g = LazyKt.a(new c0(this));

        @NotNull
        public static final z Companion = new z();

        @NotNull
        public static final Parcelable.Creator<Shortcut> CREATOR = new a0();

        public Shortcut(InterfaceC3331q6 interfaceC3331q6, String str, String str2, Image image, Image image2, int i5) {
            this.f66450a = interfaceC3331q6;
            this.f66451b = str;
            this.f66452c = str2;
            this.f66453d = image;
            this.f66454e = image2;
            this.f66455f = i5;
            LazyKt.a(new b0(this));
        }

        @Override // io.branch.search.ui.BranchEntity
        /* renamed from: b, reason: from getter */
        public final int getF66466e() {
            return this.f66455f;
        }

        @Override // io.branch.search.ui.BranchEntity
        /* renamed from: d, reason: from getter */
        public final /* synthetic */ InterfaceC3331q6 getF66462a() {
            return this.f66450a;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        /* renamed from: i, reason: from getter */
        public final Image getF66453d() {
            return this.f66453d;
        }

        public final CharSequence l() {
            return (CharSequence) this.f66456g.getValue();
        }

        public final void m(Context context) {
            Intrinsics.g(context, "context");
            C3346r5.Companion.getClass();
            C3347r6.a(this.f66450a, context, C3346r5.f65614a, X1.h.f63620a);
        }

        public final String toString() {
            return "Shortcut(title='" + this.f66451b + "', description=" + this.f66452c + ", icon=" + this.f66453d + ", appIcon=" + this.f66454e + ", entityActions=" + this.f66450a + ", adState=" + b50.e.b(this.f66455f) + ", sourcePackageName=" + getF66406j() + ')';
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel out, int i5) {
            Intrinsics.g(out, "out");
            out.writeParcelable(this.f66450a, i5);
            out.writeString(this.f66451b);
            out.writeString(this.f66452c);
            out.writeParcelable(this.f66453d, i5);
            out.writeParcelable(this.f66454e, i5);
            int i11 = this.f66455f;
            if (i11 == 0) {
                out.writeInt(0);
            } else {
                out.writeInt(1);
                out.writeString(b50.e.a(i11));
            }
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u0000 \u00022\u00020\u0001:\u0001\u0003¨\u0006\u0004"}, d2 = {"Lio/branch/search/ui/BranchEntity$SourceData;", "Landroid/os/Parcelable;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "io/branch/search/ui/d0", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    public static final class SourceData implements Parcelable {

        /* renamed from: a, reason: collision with root package name */
        public final Float f66457a;

        /* renamed from: b, reason: collision with root package name */
        public final String f66458b;

        /* renamed from: c, reason: collision with root package name */
        public final String f66459c;

        /* renamed from: d, reason: collision with root package name */
        public final Image f66460d;

        /* renamed from: e, reason: collision with root package name */
        public final String f66461e;

        @NotNull
        public static final d0 Companion = new d0();

        @NotNull
        public static final Parcelable.Creator<SourceData> CREATOR = new e0();

        public SourceData(Float f11, String str, String str2, Image image, String str3) {
            this.f66457a = f11;
            this.f66458b = str;
            this.f66459c = str2;
            this.f66460d = image;
            this.f66461e = str3;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel out, int i5) {
            Intrinsics.g(out, "out");
            Float f11 = this.f66457a;
            if (f11 == null) {
                out.writeInt(0);
            } else {
                out.writeInt(1);
                out.writeFloat(f11.floatValue());
            }
            out.writeString(this.f66458b);
            out.writeString(this.f66459c);
            out.writeParcelable(this.f66460d, i5);
            out.writeString(this.f66461e);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u0000 \u00022\u00020\u0001:\u0001\u0003¨\u0006\u0004"}, d2 = {"Lio/branch/search/ui/BranchEntity$SuggestedInstalls;", "Lio/branch/search/ui/BranchEntity;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "io/branch/search/ui/f0", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
    public static final class SuggestedInstalls extends BranchEntity {

        /* renamed from: a, reason: collision with root package name */
        public final InterfaceC3331q6 f66462a;

        /* renamed from: b, reason: collision with root package name */
        public final String f66463b;

        /* renamed from: c, reason: collision with root package name */
        public final String f66464c;

        /* renamed from: d, reason: collision with root package name */
        public final Image f66465d;

        /* renamed from: e, reason: collision with root package name */
        public final int f66466e;

        /* renamed from: f, reason: collision with root package name */
        public final a70.d f66467f = LazyKt.a(new x0(this));

        @NotNull
        public static final f0 Companion = new f0();

        @NotNull
        public static final Parcelable.Creator<SuggestedInstalls> CREATOR = new g0();

        public SuggestedInstalls(InterfaceC3331q6 interfaceC3331q6, String str, String str2, Image image, int i5) {
            this.f66462a = interfaceC3331q6;
            this.f66463b = str;
            this.f66464c = str2;
            this.f66465d = image;
            this.f66466e = i5;
            LazyKt.a(new w0(this));
        }

        @Override // io.branch.search.ui.BranchEntity
        /* renamed from: b, reason: from getter */
        public final int getF66466e() {
            return this.f66466e;
        }

        @Override // io.branch.search.ui.BranchEntity
        /* renamed from: d, reason: from getter */
        public final /* synthetic */ InterfaceC3331q6 getF66462a() {
            return this.f66462a;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        /* renamed from: i, reason: from getter */
        public final Image getF66465d() {
            return this.f66465d;
        }

        public final CharSequence l() {
            return (CharSequence) this.f66467f.getValue();
        }

        public final void m(Context context) {
            Intrinsics.g(context, "context");
            C3346r5.Companion.getClass();
            C3347r6.a(this.f66462a, context, C3346r5.f65614a, X1.i.f63621a);
        }

        public final String toString() {
            return "SuggestedInstalls(title='" + this.f66463b + "', description=" + this.f66464c + ", icon=" + this.f66465d + ", adState=" + b50.e.b(this.f66466e) + ", entityActions=" + this.f66462a + ", sourcePackageName=" + getF66406j() + ')';
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel out, int i5) {
            Intrinsics.g(out, "out");
            out.writeParcelable(this.f66462a, i5);
            out.writeString(this.f66463b);
            out.writeString(this.f66464c);
            out.writeParcelable(this.f66465d, i5);
            int i11 = this.f66466e;
            if (i11 == 0) {
                out.writeInt(0);
            } else {
                out.writeInt(1);
                out.writeString(b50.e.a(i11));
            }
        }
    }

    /* renamed from: b */
    public int getF66466e() {
        return 0;
    }

    /* renamed from: d */
    public abstract /* synthetic */ InterfaceC3331q6 getF66462a();

    public final void e(View v11) {
        Intrinsics.g(v11, "v");
        getF66462a().a(v11);
    }

    public final int getId() {
        return getF66462a().getId();
    }

    /* renamed from: sourcePackageName */
    public String getF66406j() {
        return getF66462a().sourcePackageName();
    }
}
