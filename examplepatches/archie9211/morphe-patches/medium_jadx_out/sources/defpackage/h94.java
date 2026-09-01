package defpackage;

import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import com.drew.metadata.pcx.bLHD.HrUBqHumRuLe;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class h94 extends n1f {
    public static final /* synthetic */ int o = 0;
    public boolean n;

    public static final void g(h94 h94Var) {
        super.cancel();
    }

    @Override // defpackage.n1f, android.app.Dialog, android.content.DialogInterface
    public final void cancel() {
        m1f m1fVar = this.d;
        if (!this.k || this.i || m1fVar == null || !m1fVar.isShown()) {
            super.cancel();
        } else {
            if (this.n) {
                return;
            }
            this.n = true;
            m1fVar.loadUrl("javascript:(function() {  var event = document.createEvent('Event');  event.initEvent('fbPlatformDialogMustClose',true,true);  document.dispatchEvent(event);})();");
            new Handler(Looper.getMainLooper()).postDelayed(new v0(20, this), 1500L);
        }
    }

    @Override // defpackage.n1f
    public final Bundle c(String str) {
        Bundle bundleP = epe.P(Uri.parse(str).getQuery());
        String string = bundleP.getString("bridge_args");
        bundleP.remove("bridge_args");
        if (!epe.J(string)) {
            try {
                bundleP.putBundle("com.facebook.platform.protocol.BRIDGE_ARGS", d11.a(new JSONObject(string)));
            } catch (JSONException unused) {
                f94 f94Var = f94.a;
            }
        }
        String str2 = HrUBqHumRuLe.vQYNWaruBVh;
        String string2 = bundleP.getString(str2);
        bundleP.remove(str2);
        if (!epe.J(string2)) {
            try {
                bundleP.putBundle("com.facebook.platform.protocol.RESULT_ARGS", d11.a(new JSONObject(string2)));
            } catch (JSONException unused2) {
                f94 f94Var2 = f94.a;
            }
        }
        bundleP.remove("version");
        bundleP.putInt("com.facebook.platform.protocol.PROTOCOL_VERSION", x98.h());
        return bundleP;
    }
}
