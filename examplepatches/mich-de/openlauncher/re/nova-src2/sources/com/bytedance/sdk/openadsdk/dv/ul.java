package com.bytedance.sdk.openadsdk.dv;

import android.app.Application;
import android.content.Context;
import android.os.Handler;
import android.os.HandlerThread;
import android.text.TextUtils;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ul implements lt {
    Handler ycx = null;

    /* renamed from: zb, reason: collision with root package name */
    private lt f26780zb;

    public ul(lt ltVar) {
        this.f26780zb = ltVar;
    }

    private Context jw() {
        try {
            Method method = Class.forName("android.app.ActivityThread").getMethod("currentActivityThread", null);
            method.setAccessible(true);
            Object objInvoke = method.invoke(null, null);
            return (Application) objInvoke.getClass().getMethod("getApplication", null).invoke(objInvoke, null);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE58FsilP6yqM", "aPo/lBe5bt6kT8dYghWXOlr+PZAR", "XOs5pwa6ZcKDXvRSggWlME8=", Sdk.SDKError.Reason.MRAID_JS_WRITE_FAILED_VALUE);
            return null;
        }
    }

    @Override // com.bytedance.sdk.openadsdk.dv.lt
    public Handler dj() {
        lt ltVar = this.f26780zb;
        if (ltVar != null && ltVar.ul() != null) {
            return this.f26780zb.dj();
        }
        Handler handler = new Handler(ycx("pag_strategy", -1).getLooper());
        this.ycx = handler;
        return handler;
    }

    @Override // com.bytedance.sdk.openadsdk.dv.lt
    public boolean fby() {
        lt ltVar = this.f26780zb;
        if (ltVar != null) {
            return ltVar.fby();
        }
        return true;
    }

    @Override // com.bytedance.sdk.openadsdk.dv.lt
    public JSONObject lt() {
        lt ltVar = this.f26780zb;
        if (ltVar != null) {
            return ltVar.lt();
        }
        return null;
    }

    @Override // com.bytedance.sdk.openadsdk.dv.lt
    public String lud() {
        lt ltVar = this.f26780zb;
        if (ltVar != null) {
            return ltVar.lud();
        }
        return null;
    }

    @Override // com.bytedance.sdk.openadsdk.dv.lt
    public String sya() {
        lt ltVar = this.f26780zb;
        return (ltVar == null || TextUtils.isEmpty(ltVar.sya())) ? AbstractJsonLexerKt.NULL : this.f26780zb.sya();
    }

    @Override // com.bytedance.sdk.openadsdk.dv.lt
    public Map<String, String> ul() {
        lt ltVar = this.f26780zb;
        return (ltVar == null || ltVar.ul() == null) ? new HashMap() : this.f26780zb.ul();
    }

    @Override // com.bytedance.sdk.openadsdk.dv.lt
    public ExecutorService ycx() {
        lt ltVar = this.f26780zb;
        return (ltVar == null || ltVar.ycx() == null) ? Executors.newCachedThreadPool() : this.f26780zb.ycx();
    }

    @Override // com.bytedance.sdk.openadsdk.dv.lt
    public Context zb() {
        lt ltVar = this.f26780zb;
        return (ltVar == null || ltVar.zb() == null) ? jw() : this.f26780zb.zb();
    }

    @Override // com.bytedance.sdk.openadsdk.dv.lt
    public JSONObject ycx(JSONObject jSONObject) {
        lt ltVar = this.f26780zb;
        return ltVar != null ? ltVar.ycx(jSONObject) : jSONObject;
    }

    @Override // com.bytedance.sdk.openadsdk.dv.lt
    public HandlerThread ycx(String str, int i5) {
        HandlerThread handlerThreadYcx;
        lt ltVar = this.f26780zb;
        if (ltVar != null && (handlerThreadYcx = ltVar.ycx(str, i5)) != null) {
            return handlerThreadYcx;
        }
        HandlerThread handlerThread = new HandlerThread("pag_strategy", -1);
        handlerThread.start();
        return handlerThread;
    }
}
