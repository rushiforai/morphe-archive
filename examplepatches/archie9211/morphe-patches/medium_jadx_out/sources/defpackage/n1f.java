package defpackage;

import android.app.Activity;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.KeyEvent;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.webkit.WebSettings;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import com.drew.metadata.exif.makernotes.LeicaMakernoteDirectory;
import com.facebook.FacebookException;
import com.facebook.FacebookOperationCanceledException;
import com.medium.reader.R;
import j$.util.Objects;
import java.util.Arrays;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class n1f extends Dialog {
    public static volatile int m;
    public String a;
    public String b;
    public i1f c;
    public m1f d;
    public ProgressDialog e;
    public ImageView f;
    public FrameLayout g;
    public final k1f h;
    public boolean i;
    public boolean j;
    public boolean k;
    public WindowManager.LayoutParams l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n1f(m15 m15Var, String str, Bundle bundle, ea7 ea7Var, i1f i1fVar) {
        Uri uriA;
        super(m15Var, m);
        hk7.G();
        this.b = "fbconnect://success";
        bundle = bundle == null ? new Bundle() : bundle;
        String str2 = epe.G(m15Var) ? "fbconnect://chrome_os_success" : "fbconnect://success";
        this.b = str2;
        bundle.putString("redirect_uri", str2);
        bundle.putString("display", "touch");
        bundle.putString("client_id", f94.b());
        bundle.putString("sdk", String.format(Locale.ROOT, "android-%s", Arrays.copyOf(new Object[]{"18.2.3"}, 1)));
        this.c = i1fVar;
        if (str.equals("share") && bundle.containsKey("media")) {
            this.h = new k1f(this, str, bundle);
            return;
        }
        if (l1f.a[ea7Var.ordinal()] == 1) {
            uriA = epe.a(no7.v(), "oauth/authorize", bundle);
        } else {
            uriA = epe.a(no7.t(), f94.d() + "/dialog/" + str, bundle);
        }
        this.a = uriA.toString();
    }

    public static int a(float f, int i, int i2, int i3) {
        int i4 = (int) (i / f);
        return (int) (((double) i) * (i4 <= i2 ? 1.0d : i4 >= i3 ? 0.5d : ((((double) (i3 - i4)) / ((double) (i3 - i2))) * 0.5d) + 0.5d));
    }

    public static final void b(m15 m15Var) {
        if (m15Var == null) {
            return;
        }
        try {
            ApplicationInfo applicationInfo = m15Var.getPackageManager().getApplicationInfo(m15Var.getPackageName(), 128);
            if ((applicationInfo != null ? applicationInfo.metaData : null) != null && m == 0) {
                int i = applicationInfo.metaData.getInt("com.facebook.sdk.WebDialogTheme");
                if (i == 0) {
                    i = R.style.com_facebook_activity_theme;
                }
                m = i;
            }
        } catch (PackageManager.NameNotFoundException unused) {
        }
    }

    public Bundle c(String str) {
        Uri uri = Uri.parse(str);
        Bundle bundleP = epe.P(uri.getQuery());
        bundleP.putAll(epe.P(uri.getFragment()));
        return bundleP;
    }

    @Override // android.app.Dialog, android.content.DialogInterface
    public void cancel() {
        if (this.c == null || this.i) {
            return;
        }
        e(new FacebookOperationCanceledException());
    }

    public final void d() {
        Object systemService = getContext().getSystemService("window");
        systemService.getClass();
        Display defaultDisplay = ((WindowManager) systemService).getDefaultDisplay();
        DisplayMetrics displayMetrics = new DisplayMetrics();
        defaultDisplay.getMetrics(displayMetrics);
        int i = displayMetrics.widthPixels;
        int i2 = displayMetrics.heightPixels;
        int i3 = i < i2 ? i : i2;
        if (i < i2) {
            i = i2;
        }
        int iMin = Math.min(a(displayMetrics.density, i3, 480, LeicaMakernoteDirectory.TAG_CAMERA_TEMPERATURE), displayMetrics.widthPixels);
        int iMin2 = Math.min(a(displayMetrics.density, i, LeicaMakernoteDirectory.TAG_CAMERA_TEMPERATURE, 1280), displayMetrics.heightPixels);
        Window window = getWindow();
        if (window != null) {
            window.setLayout(iMin, iMin2);
        }
    }

    @Override // android.app.Dialog, android.content.DialogInterface
    public final void dismiss() {
        ProgressDialog progressDialog;
        m1f m1fVar = this.d;
        if (m1fVar != null) {
            m1fVar.stopLoading();
        }
        if (!this.j && (progressDialog = this.e) != null && progressDialog.isShowing()) {
            progressDialog.dismiss();
        }
        super.dismiss();
    }

    public final void e(Exception exc) {
        if (this.c == null || this.i) {
            return;
        }
        this.i = true;
        FacebookException facebookException = exc instanceof FacebookException ? (FacebookException) exc : new FacebookException(exc);
        i1f i1fVar = this.c;
        if (i1fVar != null) {
            i1fVar.P(null, facebookException);
        }
        dismiss();
    }

    public final void f(int i) {
        LinearLayout linearLayout = new LinearLayout(getContext());
        m1f m1fVar = new m1f(getContext());
        this.d = m1fVar;
        m1fVar.setVerticalScrollBarEnabled(false);
        m1f m1fVar2 = this.d;
        if (m1fVar2 != null) {
            m1fVar2.setHorizontalScrollBarEnabled(false);
        }
        m1f m1fVar3 = this.d;
        int i2 = 1;
        if (m1fVar3 != null) {
            m1fVar3.setWebViewClient(new tb(i2, this));
        }
        m1f m1fVar4 = this.d;
        WebSettings settings = m1fVar4 != null ? m1fVar4.getSettings() : null;
        if (settings != null) {
            settings.setJavaScriptEnabled(true);
        }
        m1f m1fVar5 = this.d;
        if (m1fVar5 != null) {
            String str = this.a;
            if (str == null) {
                ygf.f("Required value was null.");
                return;
            }
            m1fVar5.loadUrl(str);
        }
        m1f m1fVar6 = this.d;
        if (m1fVar6 != null) {
            m1fVar6.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
        }
        m1f m1fVar7 = this.d;
        if (m1fVar7 != null) {
            m1fVar7.setVisibility(4);
        }
        m1f m1fVar8 = this.d;
        WebSettings settings2 = m1fVar8 != null ? m1fVar8.getSettings() : null;
        if (settings2 != null) {
            settings2.setSavePassword(false);
        }
        m1f m1fVar9 = this.d;
        WebSettings settings3 = m1fVar9 != null ? m1fVar9.getSettings() : null;
        if (settings3 != null) {
            settings3.setSaveFormData(false);
        }
        m1f m1fVar10 = this.d;
        if (m1fVar10 != null) {
            m1fVar10.setFocusable(true);
        }
        m1f m1fVar11 = this.d;
        if (m1fVar11 != null) {
            m1fVar11.setFocusableInTouchMode(true);
        }
        m1f m1fVar12 = this.d;
        if (m1fVar12 != null) {
            m1fVar12.setOnTouchListener(new g1f());
        }
        linearLayout.setPadding(i, i, i, i);
        linearLayout.addView(this.d);
        linearLayout.setBackgroundColor(-872415232);
        FrameLayout frameLayout = this.g;
        if (frameLayout != null) {
            frameLayout.addView(linearLayout);
        }
    }

    @Override // android.app.Dialog, android.view.Window.Callback
    public final void onAttachedToWindow() {
        WindowManager.LayoutParams layoutParams;
        Window window;
        WindowManager.LayoutParams attributes;
        this.j = false;
        Context context = getContext();
        context.getClass();
        if (epe.O(context) && (layoutParams = this.l) != null && layoutParams.token == null) {
            Activity ownerActivity = getOwnerActivity();
            layoutParams.token = (ownerActivity == null || (window = ownerActivity.getWindow()) == null || (attributes = window.getAttributes()) == null) ? null : attributes.token;
            WindowManager.LayoutParams layoutParams2 = this.l;
            Objects.toString(layoutParams2 != null ? layoutParams2.token : null);
            f94 f94Var = f94.a;
        }
        super.onAttachedToWindow();
    }

    @Override // android.app.Dialog
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        ProgressDialog progressDialog = new ProgressDialog(getContext());
        this.e = progressDialog;
        progressDialog.requestWindowFeature(1);
        ProgressDialog progressDialog2 = this.e;
        if (progressDialog2 != null) {
            progressDialog2.setMessage(getContext().getString(R.string.com_facebook_loading));
        }
        ProgressDialog progressDialog3 = this.e;
        if (progressDialog3 != null) {
            progressDialog3.setCanceledOnTouchOutside(false);
        }
        ProgressDialog progressDialog4 = this.e;
        if (progressDialog4 != null) {
            progressDialog4.setOnCancelListener(new DialogInterface.OnCancelListener() { // from class: h1f
                @Override // android.content.DialogInterface.OnCancelListener
                public final void onCancel(DialogInterface dialogInterface) {
                    this.a.cancel();
                }
            });
        }
        requestWindowFeature(1);
        this.g = new FrameLayout(getContext());
        d();
        Window window = getWindow();
        if (window != null) {
            window.setGravity(17);
        }
        Window window2 = getWindow();
        if (window2 != null) {
            window2.setSoftInputMode(16);
        }
        ImageView imageView = new ImageView(getContext());
        this.f = imageView;
        imageView.setOnClickListener(new na3(this, 4));
        Drawable drawable = getContext().getResources().getDrawable(2131230866);
        ImageView imageView2 = this.f;
        if (imageView2 != null) {
            imageView2.setImageDrawable(drawable);
        }
        ImageView imageView3 = this.f;
        if (imageView3 != null) {
            imageView3.setVisibility(4);
        }
        if (this.a != null) {
            ImageView imageView4 = this.f;
            if (imageView4 == null) {
                ygf.f("Required value was null.");
                return;
            }
            f((imageView4.getDrawable().getIntrinsicWidth() / 2) + 1);
        }
        FrameLayout frameLayout = this.g;
        if (frameLayout != null) {
            frameLayout.addView(this.f, new ViewGroup.LayoutParams(-2, -2));
        }
        FrameLayout frameLayout2 = this.g;
        if (frameLayout2 != null) {
            setContentView(frameLayout2);
        } else {
            ygf.f("Required value was null.");
        }
    }

    @Override // android.app.Dialog, android.view.Window.Callback
    public final void onDetachedFromWindow() {
        this.j = true;
        super.onDetachedFromWindow();
    }

    @Override // android.app.Dialog, android.view.KeyEvent.Callback
    public final boolean onKeyDown(int i, KeyEvent keyEvent) {
        keyEvent.getClass();
        if (i == 4) {
            m1f m1fVar = this.d;
            if (m1fVar != null && m1fVar.canGoBack()) {
                m1f m1fVar2 = this.d;
                if (m1fVar2 != null) {
                    m1fVar2.goBack();
                }
                return true;
            }
            cancel();
        }
        return super.onKeyDown(i, keyEvent);
    }

    @Override // android.app.Dialog
    public final void onStart() {
        super.onStart();
        k1f k1fVar = this.h;
        if (k1fVar != null) {
            if ((k1fVar != null ? k1fVar.getStatus() : null) == AsyncTask.Status.PENDING) {
                if (k1fVar != null) {
                    k1fVar.execute(new Void[0]);
                }
                ProgressDialog progressDialog = this.e;
                if (progressDialog != null) {
                    progressDialog.show();
                    return;
                }
                return;
            }
        }
        d();
    }

    @Override // android.app.Dialog
    public final void onStop() {
        k1f k1fVar = this.h;
        if (k1fVar != null) {
            k1fVar.cancel(true);
            ProgressDialog progressDialog = this.e;
            if (progressDialog != null) {
                progressDialog.dismiss();
            }
        }
        super.onStop();
    }

    @Override // android.app.Dialog, android.view.Window.Callback
    public final void onWindowAttributesChanged(WindowManager.LayoutParams layoutParams) {
        layoutParams.getClass();
        if (layoutParams.token == null) {
            this.l = layoutParams;
        }
        super.onWindowAttributesChanged(layoutParams);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public n1f(Context context, String str) {
        hk7.G();
        int i = m;
        if (i == 0) {
            hk7.G();
            i = m;
        }
        super(context, i);
        this.b = "fbconnect://success";
        this.a = str;
    }
}
