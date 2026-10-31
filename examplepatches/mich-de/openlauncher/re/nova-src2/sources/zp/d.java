package zp;

import android.app.Activity;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import b.aa;
import com.google.android.gms.internal.measurement.le;
import com.spotify.sdk.android.auth.AuthorizationRequest;
import com.spotify.sdk.android.auth.AuthorizationResponse;
import java.util.ArrayList;
import java.util.List;
import m.w;
import w.f;
import w.l;

/* loaded from: classes4.dex */
public final class d extends Dialog {

    /* renamed from: i, reason: collision with root package name */
    public static final /* synthetic */ int f98587i = 0;

    /* renamed from: a, reason: collision with root package name */
    public final Uri f98588a;

    /* renamed from: b, reason: collision with root package name */
    public final String f98589b;

    /* renamed from: c, reason: collision with root package name */
    public w f98590c;

    /* renamed from: d, reason: collision with root package name */
    public ProgressDialog f98591d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f98592e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f98593f;

    /* renamed from: g, reason: collision with root package name */
    public l f98594g;

    /* renamed from: h, reason: collision with root package name */
    public b f98595h;

    public d(Activity activity, AuthorizationRequest authorizationRequest) {
        super(activity, 16973840);
        this.f98588a = authorizationRequest.b();
        this.f98589b = authorizationRequest.f42407c;
    }

    public final void a() {
        if (getContext().getPackageManager().checkPermission("android.permission.INTERNET", getContext().getPackageName()) != 0) {
            Log.e("zp.d", "Missing INTERNET permission");
        }
        getContext().startActivity(new Intent("android.intent.action.VIEW", this.f98588a));
    }

    @Override // android.app.Dialog, android.view.Window.Callback
    public final void onAttachedToWindow() {
        this.f98592e = true;
        super.onAttachedToWindow();
    }

    @Override // android.app.Dialog
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.f98593f = false;
        ProgressDialog progressDialog = new ProgressDialog(getContext());
        this.f98591d = progressDialog;
        progressDialog.setMessage(getContext().getString(2132017643));
        this.f98591d.requestWindowFeature(1);
        this.f98591d.setOnCancelListener(new aa(this, 1));
        setContentView(2131624070);
        PackageManager packageManager = getContext().getPackageManager();
        Intent intentAddCategory = new Intent("android.intent.action.VIEW", this.f98588a).addCategory("android.intent.category.BROWSABLE");
        ResolveInfo resolveInfoResolveActivity = packageManager.resolveActivity(intentAddCategory, 0);
        String str = null;
        String str2 = resolveInfoResolveActivity != null ? resolveInfoResolveActivity.activityInfo.packageName : null;
        List<ResolveInfo> listQueryIntentActivities = packageManager.queryIntentActivities(intentAddCategory, 0);
        ArrayList arrayList = new ArrayList();
        for (ResolveInfo resolveInfo : listQueryIntentActivities) {
            Intent intent = new Intent();
            intent.setAction("android.support.customtabs.action.CustomTabsService");
            intent.setPackage(resolveInfo.activityInfo.packageName);
            if (packageManager.resolveService(intent, 0) != null) {
                arrayList.add(resolveInfo.activityInfo.packageName);
            }
        }
        if (arrayList.size() == 1) {
            str = (String) arrayList.get(0);
        } else if (arrayList.size() > 1) {
            str = (TextUtils.isEmpty(str2) || !arrayList.contains(str2)) ? (String) arrayList.get(0) : str2;
        }
        if (!TextUtils.isEmpty(str)) {
            String str3 = this.f98589b;
            if (!str3.startsWith("http") && !str3.startsWith("https")) {
                if (getContext().getPackageManager().checkPermission("android.permission.INTERNET", getContext().getPackageName()) != 0) {
                    Log.e("zp.d", "Missing INTERNET permission");
                }
                this.f98595h = new b(this);
                f.a(getContext(), str, this.f98595h);
                return;
            }
        }
        a();
    }

    @Override // android.app.Dialog, android.view.Window.Callback
    public final void onDetachedFromWindow() {
        this.f98592e = false;
        super.onDetachedFromWindow();
    }

    @Override // android.app.Dialog
    public final void onStop() {
        w wVar;
        if (!this.f98593f && (wVar = this.f98590c) != null) {
            Log.i("Spotify Auth Client", "Spotify auth response: User cancelled");
            ((le) wVar.f75379c).e((xp.a) wVar.f75378b, new AuthorizationResponse(null, 4, null, null, 0, null));
        }
        this.f98593f = true;
        this.f98591d.dismiss();
        if (this.f98595h != null) {
            getContext().unbindService(this.f98595h);
            this.f98594g = null;
            this.f98595h = null;
        }
        super.onStop();
    }
}
