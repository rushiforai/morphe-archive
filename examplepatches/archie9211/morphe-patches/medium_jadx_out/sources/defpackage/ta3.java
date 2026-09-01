package defpackage;

import android.app.Dialog;
import android.content.DialogInterface;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.text.Html;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import com.facebook.FacebookActivity;
import com.facebook.FacebookException;
import com.google.zxing.WriterException;
import com.medium.reader.R;
import com.squareup.wire.sjIw.ezwlgQm;
import java.util.ArrayList;
import java.util.Date;
import java.util.EnumMap;
import java.util.HashMap;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Metadata;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0016\u0018\u00002\u00020\u0001:\u0003\u0004\u0005\u0006B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0007"}, d2 = {"Lta3;", "Lfb3;", "<init>", "()V", "m40", "m50", "ra3", "facebook-common_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
public class ta3 extends fb3 {
    public View C0;
    public TextView D0;
    public TextView E0;
    public ua3 F0;
    public final AtomicBoolean G0 = new AtomicBoolean();
    public volatile gf5 H0;
    public volatile ScheduledFuture I0;
    public volatile ra3 J0;
    public boolean K0;
    public boolean L0;
    public m87 M0;

    @Override // defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        ra3 ra3Var;
        layoutInflater.getClass();
        v97 v97Var = (v97) ((FacebookActivity) Q()).f;
        this.F0 = (ua3) (v97Var != null ? v97Var.Y().f() : null);
        if (bundle != null && (ra3Var = (ra3) bundle.getParcelable("request_state")) != null) {
            k0(ra3Var);
        }
        return null;
    }

    @Override // defpackage.fb3, defpackage.j15
    public final void D() {
        this.K0 = true;
        this.G0.set(true);
        super.D();
        gf5 gf5Var = this.H0;
        if (gf5Var != null) {
            gf5Var.cancel(true);
        }
        ScheduledFuture scheduledFuture = this.I0;
        if (scheduledFuture != null) {
            scheduledFuture.cancel(true);
        }
    }

    @Override // defpackage.fb3, defpackage.j15
    public final void J(Bundle bundle) {
        super.J(bundle);
        if (this.J0 != null) {
            bundle.putParcelable("request_state", this.J0);
        }
    }

    @Override // defpackage.fb3
    public final Dialog a0(Bundle bundle) {
        sa3 sa3Var = new sa3(Q(), R.style.com_facebook_auth_dialog);
        sa3Var.setContentView(e0(xa3.b() && !this.L0));
        return sa3Var;
    }

    public final void d0(String str, m50 m50Var, String str2, Date date, Date date2) {
        ua3 ua3Var = this.F0;
        if (ua3Var != null) {
            ua3Var.d().d(new o87(ua3Var.d().g, n87.SUCCESS, new w3(str2, f94.b(), str, (ArrayList) m50Var.b, (ArrayList) m50Var.c, (ArrayList) m50Var.d, h4.DEVICE_AUTH, date, null, date2, "facebook"), null, null));
        }
        Dialog dialog = this.x0;
        if (dialog != null) {
            dialog.dismiss();
        }
    }

    public final View e0(boolean z) {
        LayoutInflater layoutInflater = Q().getLayoutInflater();
        layoutInflater.getClass();
        View viewInflate = layoutInflater.inflate(z ? R.layout.com_facebook_smart_device_dialog_fragment : R.layout.com_facebook_device_auth_dialog_fragment, (ViewGroup) null);
        viewInflate.getClass();
        View viewFindViewById = viewInflate.findViewById(R.id.progress_bar);
        viewFindViewById.getClass();
        this.C0 = viewFindViewById;
        View viewFindViewById2 = viewInflate.findViewById(R.id.confirmation_code);
        viewFindViewById2.getClass();
        this.D0 = (TextView) viewFindViewById2;
        View viewFindViewById3 = viewInflate.findViewById(R.id.cancel_button);
        viewFindViewById3.getClass();
        ((Button) viewFindViewById3).setOnClickListener(new na3(this, 0));
        View viewFindViewById4 = viewInflate.findViewById(R.id.com_facebook_device_auth_instructions);
        viewFindViewById4.getClass();
        TextView textView = (TextView) viewFindViewById4;
        this.E0 = textView;
        textView.setText(Html.fromHtml(o(R.string.com_facebook_device_auth_instructions)));
        return viewInflate;
    }

    public final void f0() {
        if (this.G0.compareAndSet(false, true)) {
            ra3 ra3Var = this.J0;
            if (ra3Var != null) {
                xa3.a(ra3Var.b);
            }
            ua3 ua3Var = this.F0;
            if (ua3Var != null) {
                ua3Var.d().d(new o87(ua3Var.d().g, n87.CANCEL, null, "User canceled log in.", null));
            }
            Dialog dialog = this.x0;
            if (dialog != null) {
                dialog.dismiss();
            }
        }
    }

    public final void g0(FacebookException facebookException) {
        if (this.G0.compareAndSet(false, true)) {
            ra3 ra3Var = this.J0;
            if (ra3Var != null) {
                xa3.a(ra3Var.b);
            }
            ua3 ua3Var = this.F0;
            if (ua3Var != null) {
                m87 m87Var = ua3Var.d().g;
                String message = facebookException.getMessage();
                ArrayList arrayList = new ArrayList();
                if (message != null) {
                    arrayList.add(message);
                }
                ua3Var.d().d(new o87(m87Var, n87.ERROR, null, TextUtils.join(": ", arrayList), null));
            }
            Dialog dialog = this.x0;
            if (dialog != null) {
                dialog.dismiss();
            }
        }
    }

    public final void h0(String str, long j, Long l) {
        Bundle bundle = new Bundle();
        bundle.putString("fields", "id,permissions,name");
        Date date = j != 0 ? new Date((j * 1000) + new Date().getTime()) : null;
        Date date2 = l.longValue() != 0 ? new Date(l.longValue() * 1000) : null;
        Date date3 = date;
        w3 w3Var = new w3(str, f94.b(), "0", null, null, null, null, date3, null, date2, "facebook");
        String str2 = ff5.j;
        ff5 ff5VarG0 = xz5.g0(w3Var, "me", new z3(this, str, date3, date2, 2));
        ff5VarG0.k(dt5.GET);
        ff5VarG0.d = bundle;
        ff5VarG0.d();
    }

    public final void j0() {
        ScheduledThreadPoolExecutor scheduledThreadPoolExecutor;
        ra3 ra3Var = this.J0;
        Long lValueOf = ra3Var != null ? Long.valueOf(ra3Var.d) : null;
        if (lValueOf != null) {
            synchronized (ua3.c) {
                scheduledThreadPoolExecutor = ua3.d;
                if (scheduledThreadPoolExecutor == null) {
                    scheduledThreadPoolExecutor = new ScheduledThreadPoolExecutor(1);
                    ua3.d = scheduledThreadPoolExecutor;
                }
            }
            this.I0 = scheduledThreadPoolExecutor.schedule(new v0(19, this), lValueOf.longValue(), TimeUnit.SECONDS);
        }
    }

    public final void k0(ra3 ra3Var) {
        Bitmap bitmapCreateBitmap;
        this.J0 = ra3Var;
        TextView textView = this.D0;
        if (textView == null) {
            g76.g0("confirmationCode");
            throw null;
        }
        textView.setText(ra3Var.b);
        String str = ra3Var.a;
        xa3 xa3Var = xa3.a;
        boolean zC = false;
        if (ec2.a.contains(xa3.class)) {
            bitmapCreateBitmap = null;
        } else {
            try {
                EnumMap enumMap = new EnumMap(py3.class);
                enumMap.put(py3.MARGIN, 2);
                try {
                    sr0 sr0VarL = new jzb().l(str, xm0.QR_CODE, enumMap);
                    int i = sr0VarL.b;
                    int i2 = sr0VarL.a;
                    int[] iArr = new int[i * i2];
                    for (int i3 = 0; i3 < i; i3++) {
                        int i4 = i3 * i2;
                        for (int i5 = 0; i5 < i2; i5++) {
                            iArr[i4 + i5] = sr0VarL.a(i5, i3) ? -16777216 : -1;
                        }
                    }
                    bitmapCreateBitmap = Bitmap.createBitmap(i2, i, Bitmap.Config.ARGB_8888);
                    try {
                        bitmapCreateBitmap.setPixels(iArr, 0, i2, 0, 0, i2, i);
                    } catch (WriterException unused) {
                    }
                } catch (WriterException unused2) {
                    bitmapCreateBitmap = null;
                }
            } catch (Throwable th) {
                ec2.a(xa3.class, th);
            }
        }
        BitmapDrawable bitmapDrawable = new BitmapDrawable(n(), bitmapCreateBitmap);
        TextView textView2 = this.E0;
        if (textView2 == null) {
            g76.g0("instructions");
            throw null;
        }
        textView2.setCompoundDrawablesWithIntrinsicBounds((Drawable) null, bitmapDrawable, (Drawable) null, (Drawable) null);
        TextView textView3 = this.D0;
        if (textView3 == null) {
            g76.g0("confirmationCode");
            throw null;
        }
        textView3.setVisibility(0);
        View view = this.C0;
        if (view == null) {
            g76.g0("progressBar");
            throw null;
        }
        view.setVisibility(8);
        if (!this.L0) {
            String str2 = ra3Var.b;
            if (!ec2.a.contains(xa3.class)) {
                try {
                    if (xa3.b()) {
                        zC = xa3.a.c(str2);
                    }
                } catch (Throwable th2) {
                    ec2.a(xa3.class, th2);
                }
            }
            if (zC) {
                g50 g50Var = new g50(i(), (String) null);
                f94 f94Var = f94.a;
                if (mme.c()) {
                    g50Var.g("fb_smart_login_service", null);
                }
            }
        }
        if (ra3Var.e != 0 && (new Date().getTime() - ra3Var.e) - (ra3Var.d * 1000) < 0) {
            j0();
        } else {
            i0();
        }
    }

    public final void l0(m87 m87Var) {
        m87Var.getClass();
        this.M0 = m87Var;
        Bundle bundle = new Bundle();
        bundle.putString("scope", TextUtils.join(",", m87Var.b));
        String str = m87Var.i;
        if (!epe.J(str)) {
            bundle.putString("redirect_uri", str);
        }
        String str2 = m87Var.k;
        if (!epe.J(str2)) {
            bundle.putString("target_user_id", str2);
        }
        StringBuilder sb = new StringBuilder(f94.b());
        sb.append('|');
        hk7.G();
        String str3 = f94.h;
        if (str3 == null) {
            throw new FacebookException("A valid Facebook client token must be set in the AndroidManifest.xml or set by calling FacebookSdk.setClientToken before initializing the sdk. Visit https://developers.facebook.com/docs/android/getting-started#add-app_id for more information.");
        }
        sb.append(str3);
        bundle.putString("access_token", sb.toString());
        xa3 xa3Var = xa3.a;
        String str4 = null;
        if (!ec2.a.contains(xa3.class)) {
            try {
                HashMap map = new HashMap();
                String str5 = Build.DEVICE;
                str5.getClass();
                map.put("device", str5);
                String str6 = Build.MODEL;
                str6.getClass();
                map.put("model", str6);
                String string = new JSONObject(map).toString();
                string.getClass();
                str4 = string;
            } catch (Throwable th) {
                ec2.a(xa3.class, th);
            }
        }
        bundle.putString("device_info", str4);
        new ff5(null, "device/login", bundle, dt5.POST, new oa3(this, 0)).d();
    }

    @Override // defpackage.fb3, android.content.DialogInterface.OnDismissListener
    public final void onDismiss(DialogInterface dialogInterface) {
        dialogInterface.getClass();
        super.onDismiss(dialogInterface);
        if (this.K0) {
            return;
        }
        f0();
    }

    public final void i0() {
        ra3 ra3Var = this.J0;
        if (ra3Var != null) {
            ra3Var.e = new Date().getTime();
        }
        Bundle bundle = new Bundle();
        ra3 ra3Var2 = this.J0;
        bundle.putString("code", ra3Var2 != null ? ra3Var2.c : null);
        StringBuilder sb = new StringBuilder(f94.b());
        sb.append('|');
        hk7.G();
        String str = f94.h;
        if (str == null) {
            throw new FacebookException("A valid Facebook client token must be set in the AndroidManifest.xml or set by calling FacebookSdk.setClientToken before initializing the sdk. Visit https://developers.facebook.com/docs/android/getting-started#add-app_id for more information.");
        }
        sb.append(str);
        bundle.putString(ezwlgQm.Cznwp, sb.toString());
        this.H0 = new ff5(null, "device/login_status", bundle, dt5.POST, new oa3(this, 1)).d();
    }
}
