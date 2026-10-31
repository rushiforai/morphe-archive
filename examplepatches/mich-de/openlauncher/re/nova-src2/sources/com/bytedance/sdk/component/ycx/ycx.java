package com.bytedance.sdk.component.ycx;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import b.c0;
import com.bytedance.sdk.component.ycx.lt;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Objects;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public abstract class ycx {
    protected String lud;
    protected ul sya;

    /* renamed from: ul, reason: collision with root package name */
    lt f24152ul;
    protected Context ycx;

    /* renamed from: zb, reason: collision with root package name */
    protected ea f24153zb;

    /* renamed from: dj, reason: collision with root package name */
    protected Handler f24150dj = new Handler(Looper.getMainLooper());

    /* renamed from: lt, reason: collision with root package name */
    protected volatile boolean f24151lt = false;
    private final Map<String, lt> fby = new HashMap();

    public void invokeMethod(final String str) {
        if (this.f24151lt) {
            return;
        }
        this.f24150dj.post(new Runnable() { // from class: com.bytedance.sdk.component.ycx.ycx.1
            @Override // java.lang.Runnable
            public void run() {
                xkz xkzVarYcx;
                if (ycx.this.f24151lt) {
                    return;
                }
                try {
                    xkzVarYcx = ycx.this.ycx(new JSONObject(str));
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VqjtZ", "euw+gRG9atOiWN5ZixTkeQ==", "Sfsj", 52);
                    xkzVarYcx = null;
                }
                if (!xkz.ycx(xkzVarYcx)) {
                    ycx.this.ycx(xkzVarYcx);
                    return;
                }
                Objects.toString(xkzVarYcx);
                if (xkzVarYcx != null) {
                    ycx.this.zb(uh.ycx(new dy(xkzVarYcx.ycx, "Failed to parse invocation.")), xkzVarYcx);
                }
            }
        });
    }

    public final void sya(jw jwVar) {
        this.ycx = ycx(jwVar);
        this.sya = jwVar.f24122dj;
        this.f24153zb = jwVar.fby;
        this.f24152ul = new lt(jwVar, this);
        this.lud = jwVar.f24124jc;
        zb(jwVar);
    }

    public abstract Context ycx(jw jwVar);

    public abstract String ycx();

    public abstract void ycx(String str);

    public void zb() {
        this.f24152ul.ycx();
        Iterator<lt> it = this.fby.values().iterator();
        while (it.hasNext()) {
            it.next().ycx();
        }
        this.f24150dj.removeCallbacksAndMessages(null);
        this.f24151lt = true;
    }

    public abstract void zb(jw jwVar);

    public void ycx(String str, xkz xkzVar) {
        ycx(str);
    }

    public final void ycx(xkz xkzVar) {
        String strYcx;
        if (this.f24151lt || (strYcx = ycx()) == null) {
            return;
        }
        lt ltVarZb = zb(xkzVar.f24144ul);
        if (ltVarZb == null) {
            xkzVar.toString();
            if (this.f24153zb != null) {
                ycx();
            }
            zb(uh.ycx(new dy(-4, c0.q(new StringBuilder("Namespace "), xkzVar.f24144ul, " unknown."))), xkzVar);
            return;
        }
        lud ludVar = new lud();
        ludVar.f24137zb = strYcx;
        ludVar.ycx = this.ycx;
        ludVar.sya = ltVarZb;
        try {
            lt.ycx ycxVarYcx = ltVarZb.ycx(xkzVar, ludVar);
            if (ycxVarYcx == null) {
                xkzVar.toString();
                if (this.f24153zb != null) {
                    ycx();
                }
                zb(uh.ycx(new dy(-2, "Function " + xkzVar.f24142dj + " is not registered.")), xkzVar);
                return;
            }
            if (ycxVarYcx.ycx) {
                zb(ycxVarYcx.f24136zb, xkzVar);
            }
            if (this.f24153zb != null) {
                ycx();
            }
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VqjtZ", "euw+gRG9atOiWN5ZixQ=", "U+8jkQ+5SsaMRg==", 145);
            xkzVar.toString();
            zb(uh.ycx(e3), xkzVar);
        }
    }

    public final void zb(String str, xkz xkzVar) {
        JSONObject jSONObject;
        if (this.f24151lt || TextUtils.isEmpty(xkzVar.f24143lt)) {
            return;
        }
        if (!str.startsWith("{") || !str.endsWith("}")) {
            fby.ycx(new IllegalArgumentException("Illegal callback data: ".concat(str)));
        }
        try {
            jSONObject = new JSONObject(str);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VqjtZ", "euw+gRG9atOiWN5ZixQ=", "XecjnBC0SsaMRg==", 193);
            jSONObject = new JSONObject();
        }
        ycx(ry.ycx().ycx("__msg_type", "callback").ycx("__callback_id", xkzVar.f24143lt).ycx("__params", jSONObject).zb(), xkzVar);
    }

    private lt zb(String str) {
        if (!TextUtils.equals(str, this.lud) && !TextUtils.isEmpty(str)) {
            return this.fby.get(str);
        }
        return this.f24152ul;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public xkz ycx(JSONObject jSONObject) throws JSONException {
        String strOptString;
        if (this.f24151lt) {
            return null;
        }
        String strOptString2 = jSONObject.optString("__callback_id");
        String strOptString3 = jSONObject.optString("func");
        if (ycx() == null) {
            return null;
        }
        try {
            String string = jSONObject.getString("__msg_type");
            String strValueOf = b.f42142b;
            try {
                Object objOpt = jSONObject.opt("params");
                if (objOpt == null) {
                    strOptString = strValueOf;
                } else if (objOpt instanceof JSONObject) {
                    strOptString = String.valueOf((JSONObject) objOpt);
                } else {
                    if (objOpt instanceof String) {
                        strValueOf = (String) objOpt;
                    } else {
                        strValueOf = String.valueOf(objOpt);
                    }
                    strOptString = strValueOf;
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VqjtZ", "euw+gRG9atOiWN5ZixQ=", "WPwolBe5SsaMRg==", 265);
                strOptString = jSONObject.optString("params");
            }
            String string2 = jSONObject.getString("JSSDK");
            String strOptString4 = jSONObject.optString("namespace");
            return xkz.ycx().ycx(string2).zb(string).sya(strOptString3).dj(strOptString).lud(strOptString2).lt(strOptString4).ul(jSONObject.optString("__iframe_url")).ycx();
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VqjtZ", "euw+gRG9atOiWN5ZixQ=", "WPwolBe5SsaMRg==", 280);
            return xkz.ycx(strOptString2, -1);
        }
    }
}
