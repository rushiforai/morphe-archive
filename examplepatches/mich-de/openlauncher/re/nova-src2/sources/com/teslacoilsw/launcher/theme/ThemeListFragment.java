package com.teslacoilsw.launcher.theme;

import android.app.Fragment;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewStub;
import androidx.appcompat.widget.Toolbar;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.y;
import com.amplitude.core.events.Plan;
import com.teslacoilsw.launcher.widget.NoAutoLinearLayoutManager;
import e10.z2;
import fk.t;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import mx.p1;
import org.jetbrains.annotations.NotNull;
import t70.j0;
import t70.k0;
import t70.m0;
import t70.y0;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\b\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002:\u0005\u0005\u0006\u0007\b\tB\u0007¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\n"}, d2 = {"Lcom/teslacoilsw/launcher/theme/ThemeListFragment;", "Landroid/app/Fragment;", "Lt70/j0;", "<init>", "()V", "com/teslacoilsw/launcher/theme/d", "u20/w", "u20/t", "ThemePackageInfo", "BuiltInThemeInfo", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class ThemeListFragment extends Fragment implements j0 {

    /* renamed from: m, reason: collision with root package name */
    public static final /* synthetic */ int f46327m = 0;

    /* renamed from: b, reason: collision with root package name */
    public d f46329b;

    /* renamed from: c, reason: collision with root package name */
    public RecyclerView f46330c;

    /* renamed from: d, reason: collision with root package name */
    public v20.e f46331d;

    /* renamed from: f, reason: collision with root package name */
    public int f46333f;

    /* renamed from: g, reason: collision with root package name */
    public Intent f46334g;

    /* renamed from: h, reason: collision with root package name */
    public IconLoadReference f46335h;

    /* renamed from: k, reason: collision with root package name */
    public List f46338k;

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ y70.d f46328a = k0.b();

    /* renamed from: e, reason: collision with root package name */
    public boolean f46332e = true;

    /* renamed from: i, reason: collision with root package name */
    public boolean f46336i = true;

    /* renamed from: j, reason: collision with root package name */
    public List f46337j = EmptyList.f71733a;

    /* renamed from: l, reason: collision with root package name */
    public final y f46339l = new y(this, 1);

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/teslacoilsw/launcher/theme/ThemeListFragment$BuiltInThemeInfo;", "Lcom/teslacoilsw/launcher/theme/ThemeListFragment$ThemePackageInfo;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class BuiltInThemeInfo extends ThemePackageInfo {

        @JvmField
        @NotNull
        public static final Parcelable.Creator<?> CREATOR = new a();

        public BuiltInThemeInfo(Resources resources, String str, String str2, int i5, int i11, boolean z11) {
            super(str, str2, i5, resources.getDrawable(i5), null, z11);
            this.f46344e = i11;
        }
    }

    @Override // t70.j0
    public final CoroutineContext getCoroutineContext() {
        return this.f46328a.f96790a;
    }

    @Override // android.app.Fragment
    public final void onActivityResult(int i5, int i11, Intent intent) {
        if (i5 != 123) {
            super.onActivityResult(i5, i11, intent);
            return;
        }
        if (i11 == -1) {
            if (intent == null) {
                intent = new Intent();
            }
            intent.putExtra(Plan.AMP_PLAN_SOURCE, "internalpicker");
            getActivity().setResult(-1, intent);
            getActivity().finish();
        }
    }

    @Override // android.app.Fragment
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.f46334g = getActivity().getIntent();
    }

    @Override // android.app.Fragment
    public final View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View viewInflate = layoutInflater.inflate(2131623976, viewGroup, false);
        View viewFindViewById = viewInflate.findViewById(2131429059);
        Intrinsics.e(viewFindViewById, "null cannot be cast to non-null type androidx.appcompat.widget.Toolbar");
        Toolbar toolbar = (Toolbar) viewFindViewById;
        toolbar.setBackgroundColor(1711276032);
        toolbar.A(getString(2132019489));
        toolbar.x(z2.b0(toolbar.getContext(), 2131230928));
        toolbar.setOnClickListener(new t(this, 25));
        View viewFindViewById2 = viewInflate.findViewById(2131428930);
        Intrinsics.e(viewFindViewById2, "null cannot be cast to non-null type android.view.ViewStub");
        ViewStub viewStub = (ViewStub) viewFindViewById2;
        viewStub.setLayoutResource(2131624156);
        View viewInflate2 = viewStub.inflate();
        Intrinsics.e(viewInflate2, "null cannot be cast to non-null type androidx.recyclerview.widget.RecyclerView");
        RecyclerView recyclerView = (RecyclerView) viewInflate2;
        this.f46330c = recyclerView;
        recyclerView.setOnScrollListener(this.f46339l);
        RecyclerView recyclerView2 = this.f46330c;
        Intrinsics.d(recyclerView2);
        recyclerView2.setHasFixedSize(true);
        RecyclerView recyclerView3 = this.f46330c;
        Intrinsics.d(recyclerView3);
        recyclerView3.setMotionEventSplittingEnabled(false);
        getActivity();
        NoAutoLinearLayoutManager noAutoLinearLayoutManager = new NoAutoLinearLayoutManager();
        RecyclerView recyclerView4 = this.f46330c;
        Intrinsics.d(recyclerView4);
        recyclerView4.setLayoutManager(noAutoLinearLayoutManager);
        Bundle arguments = getArguments();
        if (arguments != null) {
            this.f46331d = v20.e.values()[arguments.getInt("themeType", 0)];
            this.f46332e = arguments.getBoolean("return-data", true);
            arguments.getInt("desiredWidth", -1);
            arguments.getInt("desiredHeight", -1);
            this.f46333f = arguments.getInt("iconSize", 0);
            arguments.getInt("color", -1);
        } else {
            this.f46331d = v20.e.f92028d;
            this.f46333f = 0;
        }
        PackageManager packageManager = getActivity().getApplicationContext().getPackageManager();
        a80.e eVar = y0.f88884a;
        m0.t(this, a80.d.f488c, null, new f(this, packageManager, null), 2);
        return viewInflate;
    }

    @Override // android.app.Fragment
    public final void onDestroy() {
        super.onDestroy();
        k0.c(this, null);
    }

    @Override // android.app.Fragment
    public final void onPause() {
        super.onPause();
        p1.b(this);
    }

    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0010\u000f\n\u0002\u0018\u0002\n\u0000\b\u0017\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/teslacoilsw/launcher/theme/ThemeListFragment$ThemePackageInfo;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Landroid/os/Parcelable;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static class ThemePackageInfo implements Comparable<ThemePackageInfo>, Parcelable {

        @JvmField
        @NotNull
        public static final Parcelable.Creator<?> CREATOR = new b();

        /* renamed from: a, reason: collision with root package name */
        public final String f46340a;

        /* renamed from: b, reason: collision with root package name */
        public final CharSequence f46341b;

        /* renamed from: c, reason: collision with root package name */
        public final Drawable f46342c;

        /* renamed from: d, reason: collision with root package name */
        public final int f46343d;

        /* renamed from: e, reason: collision with root package name */
        public int f46344e;

        /* renamed from: f, reason: collision with root package name */
        public final Intent f46345f;

        /* renamed from: g, reason: collision with root package name */
        public int f46346g;

        public ThemePackageInfo(String str, CharSequence charSequence, int i5, Drawable drawable, Intent intent, boolean z11) {
            this.f46340a = str;
            this.f46341b = charSequence;
            this.f46343d = i5;
            this.f46342c = drawable;
            this.f46345f = intent;
            Bitmap bitmapA = z2.A(drawable, w20.e.k(72), w20.e.k(72));
            s90.k0 k0Var = new s90.k0(z11, this);
            if (bitmapA == null) {
                throw new IllegalArgumentException("bitmap can not be null");
            }
            if (bitmapA.isRecycled()) {
                throw new IllegalArgumentException("bitmap can not be recycled");
            }
            new c30.d(k0Var).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, bitmapA);
        }

        @Override // java.lang.Comparable
        public final int compareTo(ThemePackageInfo themePackageInfo) {
            int i5 = this.f46344e;
            int i11 = themePackageInfo.f46344e;
            if (i5 != i11) {
                return i5 < i11 ? -1 : 1;
            }
            CharSequence charSequence = this.f46341b;
            return charSequence.toString().compareTo(charSequence.toString());
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            parcel.writeString(this.f46340a);
            parcel.writeString(this.f46341b.toString());
            parcel.writeInt(this.f46343d);
            parcel.writeInt(this.f46344e);
            parcel.writeParcelable(this.f46345f, i5);
            parcel.writeInt(this.f46346g);
        }

        public ThemePackageInfo(Parcel parcel) {
            this.f46340a = parcel.readString();
            String string = parcel.readString();
            Intrinsics.d(string);
            this.f46341b = string;
            this.f46343d = parcel.readInt();
            this.f46344e = parcel.readInt();
            this.f46345f = (Intent) parcel.readParcelable(ClassLoader.getSystemClassLoader());
            this.f46346g = parcel.readInt();
            this.f46342c = null;
        }
    }
}
