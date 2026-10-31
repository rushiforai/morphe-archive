package mk;

import ab.y;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.SystemClock;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ImageView;
import com.google.android.play.core.hsdp.service.HsdpLoadingPanelContainer;
import com.google.android.play.core.hsdp.service.HsdpShimActivity;
import cw.l2;
import e10.z2;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.List;
import java.util.Map;

/* loaded from: classes3.dex */
public final class k implements b {

    /* renamed from: a, reason: collision with root package name */
    public final Context f76447a;

    /* renamed from: b, reason: collision with root package name */
    public final qh.b f76448b;

    /* renamed from: c, reason: collision with root package name */
    public final qh.b f76449c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f76450d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f76451e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f76452f;

    /* renamed from: g, reason: collision with root package name */
    public final mh.c f76453g;

    /* renamed from: h, reason: collision with root package name */
    public g f76454h;

    public k(Context context, qh.b bVar, qh.b bVar2, boolean z11, boolean z12, boolean z13) {
        boolean z14 = false;
        if (z13 && (context instanceof Activity)) {
            z14 = true;
        }
        mh.c cVar = context instanceof Activity ? new mh.c((Activity) context) : null;
        this.f76454h = null;
        this.f76447a = context;
        this.f76448b = bVar;
        this.f76449c = bVar2;
        this.f76450d = z11;
        this.f76451e = z12;
        this.f76452f = z14;
        this.f76453g = cVar;
    }

    public static void f(String str, x7.c cVar, Map map, q qVar, Activity activity) {
        int iK = l2.K(activity, activity.getResources().getConfiguration().screenWidthDp);
        int iM = l2.M(activity);
        t tVar = (t) qVar;
        Activity activity2 = tVar.f76487b;
        String packageName = activity2.getPackageName();
        IBinder windowToken = activity2.getWindow().getDecorView().getWindowToken();
        if (windowToken == null) {
            throw new IllegalStateException("Window token is null, cannot open HPOA service.");
        }
        s sVar = new s(tVar, str, packageName, windowToken, iK, iM, cVar, map);
        o oVar = tVar.f76486a;
        if (oVar == null) {
            Log.e("HpoaClientImpl", "HPOA service is not available");
            return;
        }
        Bundle bundle = new Bundle();
        bundle.putString("appId", str);
        bundle.putString("callerId", packageName);
        bundle.putBinder("windowToken", windowToken);
        oVar.k(new y(17, tVar, bundle, sVar, false));
    }

    public final void a(String str) {
        f fVar = (f) ((u) this.f76449c.zza());
        if (((l) fVar.f76432c.get(str)) == null) {
            Log.w("HsdpClientImpl", "No active overlay for target package: " + str + ". Please call show() first.");
        } else {
            Bundle bundle = new Bundle();
            bundle.putString("callingPackage", fVar.f76430a.getPackageName());
            bundle.putString("targetPackage", str);
            bundle.putString("sdkVersion", "2.0.0");
            bundle.putLong("requestTimestampMs", SystemClock.elapsedRealtime());
            fVar.f76431b.k(new w(0, fVar, bundle));
        }
        d();
    }

    public final void b(String str, String str2, x7.c cVar, Map map, boolean z11) throws Resources.NotFoundException, PackageManager.NameNotFoundException {
        Context context = this.f76447a;
        Intent intentT = ex.i.T(str, str2, context.getPackageName(), map);
        if (!this.f76451e) {
            Activity activity = (Activity) context;
            if (this.f76453g == null) {
                throw new IllegalStateException("hsdpLoadingPanel cannot be null when using activity-based HSDP.");
            }
            intentT.addFlags(SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING);
            intentT.addFlags(SQLiteDatabase.OPEN_PRIVATECACHE);
            ResolveInfo resolveInfoResolveActivity = activity.getPackageManager().resolveActivity(intentT, SQLiteDatabase.OPEN_FULLMUTEX);
            qh.b bVar = this.f76448b;
            if (resolveInfoResolveActivity != null) {
                e();
                Log.i("HsdpDeepLinkServiceImpl", "HSDP Activity found.");
                activity.startActivityForResult(intentT, 0);
                f(str, cVar, map, (q) bVar.zza(), activity);
                return;
            }
            if (!this.f76450d) {
                activity.startActivityForResult(ex.i.R(str, str2, map), 0);
                return;
            } else {
                Log.i("HsdpDeepLinkServiceImpl", "HSDP Activity not found. Ignoring error and still showing HPOA affordance.");
                f(str, cVar, map, (q) bVar.zza(), activity);
                return;
            }
        }
        Uri data = intentT.getData();
        if (data == null) {
            Bundle bundle = new Bundle();
            bundle.putString("errorMessage", "Deeplink URL is null.");
            cVar.onError(bundle);
            return;
        }
        String string = data.toString();
        if (context instanceof Activity) {
            Activity activity2 = (Activity) context;
            qh.b bVar2 = this.f76449c;
            lk.f fVar = (lk.f) ((IInterface) ((f) ((u) bVar2.zza())).f76431b.f76470k);
            if (fVar == null || !fVar.asBinder().isBinderAlive()) {
                e();
            }
            ((f) ((u) bVar2.zza())).a(str, string, activity2.getWindow().getDecorView().getWindowToken(), l2.K(activity2, activity2.getResources().getConfiguration().screenWidthDp), l2.M(activity2), z11, !this.f76452f ? new h(this, cVar, activity2, str, str2, map) : new j(this, cVar, activity2, str, str2, map));
            return;
        }
        Intent intent = new Intent(context, (Class<?>) HsdpShimActivity.class);
        intent.putExtra("target_package_name", str);
        intent.putExtra("referrer", str2);
        intent.putExtra("auto_trigger", z11);
        intent.putExtra("deeplink_url", string);
        Bundle bundle2 = new Bundle();
        for (Map.Entry entry : map.entrySet()) {
            bundle2.putString((String) entry.getKey(), (String) entry.getValue());
        }
        intent.putExtra("extra_query_params_bundle", bundle2);
        intent.addFlags(SQLiteDatabase.OPEN_PRIVATECACHE);
        intent.addFlags(268435456);
        Log.i("HsdpDeepLinkServiceImpl", "Starting HSDP Shim Activity.");
        context.startActivity(intent);
    }

    public final void c(List list, x7.e eVar) {
        f fVar = (f) ((u) this.f76449c.zza());
        fVar.getClass();
        fVar.f76431b.k(new y(18, fVar, list, eVar, false));
    }

    public final void d() {
        if (this.f76452f) {
            Activity activity = (Activity) this.f76447a;
            mh.c cVar = this.f76453g;
            if (cVar == null) {
                throw new IllegalStateException("hsdpLoadingPanel cannot be null when loading panel is enabled.");
            }
            cVar.N();
            if (this.f76454h != null) {
                activity.getApplication().unregisterActivityLifecycleCallbacks(this.f76454h);
                this.f76454h = null;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x00c6  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x013c  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x0146  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x02a9  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void e() throws Resources.NotFoundException, PackageManager.NameNotFoundException {
        Resources resourcesForApplication;
        int identifier;
        Drawable drawable;
        boolean z11;
        int i5;
        int identifier2;
        if (this.f76452f) {
            Activity activity = (Activity) this.f76447a;
            mh.c cVar = this.f76453g;
            if (cVar == null) {
                throw new IllegalStateException("hsdpLoadingPanel cannot be null when enabling loading panel.");
            }
            if (((View) cVar.f76325d) == null) {
                if (this.f76454h != null) {
                    activity.getApplication().unregisterActivityLifecycleCallbacks(this.f76454h);
                }
                this.f76454h = new g(this, activity);
                activity.getApplication().registerActivityLifecycleCallbacks(this.f76454h);
                Activity activity2 = (Activity) cVar.f76323b;
                Log.i("HsdpLoadingPanel", "try to showLoading");
                if (((View) cVar.f76325d) != null) {
                    return;
                }
                Log.i("HsdpLoadingPanel", "showLoading");
                View viewInflate = LayoutInflater.from(activity2).inflate(2131624342, (ViewGroup) null);
                if (viewInflate == null) {
                    Log.e("HsdpLoadingPanel", "Failed to inflate loading panel layout.");
                    return;
                }
                cVar.f76325d = viewInflate;
                ((HsdpLoadingPanelContainer) viewInflate).f34552a = new ai.h(cVar, 25);
                View viewFindViewById = viewInflate.findViewById(2131428159);
                if (viewFindViewById != null) {
                    viewFindViewById.setVisibility(0);
                }
                try {
                    resourcesForApplication = activity2.getPackageManager().getResourcesForApplication("com.android.vending");
                } catch (Exception e3) {
                    Log.e("HsdpLoadingPanel", "Error getting resources for com.android.vending", e3);
                    resourcesForApplication = null;
                }
                ImageView imageView = (ImageView) viewInflate.findViewById(2131428584);
                if (imageView != null) {
                    if (resourcesForApplication != null) {
                        try {
                            identifier2 = resourcesForApplication.getIdentifier("product_logo_play_prism_color_24", "drawable", "com.android.vending");
                        } catch (RuntimeException e11) {
                            Log.e("HsdpLoadingPanel", "Error loading Play Prism icon from com.android.vending.", e11);
                        }
                        if (identifier2 != 0) {
                            imageView.setImageDrawable(resourcesForApplication.getDrawable(identifier2, activity2.getTheme()));
                            Log.i("HsdpLoadingPanel", "Successfully loaded Play Prism icon as drawable from com.android.vending.");
                        } else {
                            try {
                                imageView.setImageResource(2131231892);
                                Log.i("HsdpLoadingPanel", "Successfully loaded Play Prism icon from local resources.");
                            } catch (RuntimeException e12) {
                                Log.e("HsdpLoadingPanel", "Error loading Play Prism icon from local resources.", e12);
                                Log.e("HsdpLoadingPanel", "Failed to load Play Prism icon.");
                                cVar.f76325d = null;
                                return;
                            }
                        }
                    }
                }
                ImageButton imageButton = (ImageButton) viewInflate.findViewById(2131428743);
                if (imageButton != null) {
                    int color = activity2.getColor(cVar.S() ? 2131099906 : 2131099907);
                    if (resourcesForApplication != null) {
                        try {
                            int identifier3 = resourcesForApplication.getIdentifier(cVar.S() ? "grey_500" : "grey_700", "color", "com.android.vending");
                            if (identifier3 != 0) {
                                color = resourcesForApplication.getColor(identifier3, activity2.getTheme());
                            } else {
                                Log.w("HsdpLoadingPanel", "Could not load grey_500/grey_700 color from com.android.vending, falling back to local resources.");
                            }
                            identifier = resourcesForApplication.getIdentifier("gs_close_rond100_vd_theme_24", "drawable", "com.android.vending");
                        } catch (RuntimeException e13) {
                            Log.e("HsdpLoadingPanel", "Error loading dismiss icon from com.android.vending.", e13);
                        }
                        if (identifier != 0) {
                            drawable = resourcesForApplication.getDrawable(identifier, activity2.getTheme());
                            z11 = true;
                            i5 = color;
                            if (drawable == null) {
                                drawable = z2.b0(activity2, 17301560);
                                z11 = false;
                            }
                            if (drawable == null) {
                                Log.e("HsdpLoadingPanel", "Failed to load dismiss button.");
                                cVar.f76325d = null;
                                return;
                            } else {
                                drawable.setTint(i5);
                                imageButton.setImageDrawable(drawable);
                                imageButton.setOnClickListener(new com.google.android.material.datepicker.n(cVar));
                                Log.i("HsdpLoadingPanel", "Successfully loaded and tinted dismiss icon from ".concat(true != z11 ? "local resources." : "com.android.vending."));
                            }
                        } else {
                            Log.w("HsdpLoadingPanel", "Drawable resource 'gs_close_rond100_vd_theme_24' not found in com.android.vending");
                            i5 = color;
                            drawable = null;
                            z11 = false;
                            if (drawable == null) {
                            }
                            if (drawable == null) {
                            }
                        }
                    } else {
                        i5 = color;
                        drawable = null;
                        z11 = false;
                        if (drawable == null) {
                        }
                        if (drawable == null) {
                        }
                    }
                }
                FrameLayout frameLayout = (FrameLayout) viewInflate.findViewById(2131427755);
                if (frameLayout == null) {
                    Log.e("HsdpLoadingPanel", "content_frame not found in the layout.");
                } else {
                    GradientDrawable gradientDrawable = new GradientDrawable();
                    gradientDrawable.setShape(0);
                    gradientDrawable.setCornerRadii(new float[]{l2.K(activity2, 28), l2.K(activity2, 28), l2.K(activity2, 28), l2.K(activity2, 28), 0.0f, 0.0f, 0.0f, 0.0f});
                    gradientDrawable.setColor(activity2.getColor(cVar.S() ? 2131099806 : 2131099809));
                    frameLayout.setBackground(gradientDrawable);
                    frameLayout.setClipToOutline(true);
                }
                View viewFindViewById2 = viewInflate.findViewById(2131428550);
                if (viewFindViewById2 != null) {
                    viewFindViewById2.setVisibility(0);
                }
                try {
                    int iM = l2.M(activity2);
                    int dimensionPixelSize = activity2.getResources().getDimensionPixelSize(2131166378);
                    WindowManager.LayoutParams layoutParams = new WindowManager.LayoutParams(-1, -2, 2, 40, -3);
                    layoutParams.height = Math.min(activity2.getResources().getDimensionPixelSize(2131166378), (int) (l2.M(activity2) * 0.6f));
                    if (activity2.getResources().getConfiguration().screenWidthDp > 640) {
                        layoutParams.width = l2.K(activity2, 640);
                    }
                    layoutParams.gravity = 81;
                    Log.i("HsdpLoadingPanel", "screenHeight: " + iM + ", loadingUiHeight: " + dimensionPixelSize + ", wmParams.y: " + layoutParams.y);
                    ((WindowManager) cVar.f76324c).addView(viewInflate, layoutParams);
                    Log.i("HsdpLoadingPanel", "Successfully added view to WindowManager. loadingView size: " + viewInflate.getWidth() + "x" + viewInflate.getHeight());
                    FrameLayout frameLayout2 = (FrameLayout) viewInflate.findViewById(2131427755);
                    if (frameLayout2 != null) {
                        Log.i("HsdpLoadingPanel", "contentFrame size: " + frameLayout2.getWidth() + "x" + frameLayout2.getHeight());
                    }
                } catch (RuntimeException e14) {
                    Log.e("HsdpLoadingPanel", "Error adding view to WindowManager", e14);
                    cVar.f76325d = null;
                }
            }
        }
    }
}
