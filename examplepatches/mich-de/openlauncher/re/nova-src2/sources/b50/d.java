package b50;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Process;
import android.os.UserHandle;
import android.text.TextUtils;
import android.util.Log;
import c4.d0;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.google.android.gms.cloudmessaging.CloudMessage;
import com.google.android.gms.tasks.Task;
import com.stripe.android.challenge.confirmation.BridgeErrorParams;
import com.stripe.android.core.model.StripeModel;
import com.teslacoilsw.launcher.util.NamedIntent;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.tiktok.util.TTConst;
import dy.k;
import gz.o;
import h6.t;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import ja.h;
import java.io.File;
import java.util.UUID;
import java.util.zip.CRC32;
import ke.s;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;
import mk.m;
import ninja.sesame.lib.bridge.v1.SesameInitOnComplete;
import org.chromium.support_lib_boundary.SpeculativeLoadingConfigBoundaryInterface;
import org.json.JSONObject;
import p6.e0;
import p6.v;
import r80.n;
import sg.j;
import sp.m0;
import tk.l;

/* loaded from: classes4.dex */
public class d implements n, k6.b, io.branch.requery.android.database.d, dr.b, j, m, SpeculativeLoadingConfigBoundaryInterface, fi.c, l, SesameInitOnComplete, sp.a, te.g {

    /* renamed from: a, reason: collision with root package name */
    public static d f17558a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ d f17559b = new d();

    public /* synthetic */ d() {
    }

    public static jc.b f(String str) {
        if (TextUtils.isEmpty(str)) {
            rc.a.b("%s : empty one dt", "OneDTParser");
            return new jc.b(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, -1L);
        }
        try {
            JSONObject jSONObjectOptJSONObject = new JSONObject(str).optJSONObject("data");
            if (jSONObjectOptJSONObject != null && "onedtid".equalsIgnoreCase(jSONObjectOptJSONObject.optString("propertyName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b))) {
                return new jc.b(jSONObjectOptJSONObject.optString("propertyValue", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), jSONObjectOptJSONObject.optLong("refreshTime", -1L));
            }
        } catch (Exception e3) {
            nc.a.a(nc.c.ONE_DT_PARSE_ERROR, e3);
            rc.a.b("%s : failed parse one dt", "OneDTParser");
        }
        return new jc.b(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, -1L);
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x004c  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x004f  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0052  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0058  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x006d  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0070  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0073  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0086  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0089  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x008c  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x009d  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00a0  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00a3  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00b7  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00ba  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x00bd  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00c2  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00d7  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00dc  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00e2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final mx.j g(k10.b bVar, String str) {
        boolean z11;
        Boolean bool;
        String str2;
        z.e eVar = bVar.f70853a;
        boolean zBooleanValue = false;
        boolean zBooleanValue2 = "desktop".equals(str) || "dock".equals(str);
        Object obj = eVar.get(str.concat("_show_labels"));
        Boolean bool2 = obj instanceof Boolean ? (Boolean) obj : null;
        if (bool2 == null) {
            if (!str.equals("dock")) {
                z11 = true;
            }
            Object obj2 = eVar.get(str.concat("_label_color"));
            Integer num = !(obj2 instanceof Integer) ? (Integer) obj2 : null;
            int iIntValue = num == null ? num.intValue() : zBooleanValue2 ? -1 : -16777216;
            Object obj3 = eVar.get(str.concat("_label_shadow"));
            bool = !(obj3 instanceof Boolean) ? (Boolean) obj3 : null;
            if (bool != null) {
                zBooleanValue2 = bool.booleanValue();
            }
            boolean z12 = zBooleanValue2;
            Object obj4 = eVar.get(str.concat("_label_font_family"));
            str2 = !(obj4 instanceof String) ? (String) obj4 : null;
            if (str2 == null) {
                str2 = "sans-serif-condensed";
            }
            String str3 = str2;
            Object obj5 = eVar.get(str.concat("_label_single_line"));
            Boolean bool3 = !(obj5 instanceof Boolean) ? (Boolean) obj5 : null;
            boolean zBooleanValue3 = bool3 != null ? bool3.booleanValue() : true;
            Object obj6 = eVar.get(str.concat("_icon_size"));
            float fIntValue = ((!(obj6 instanceof Integer) ? (Integer) obj6 : null) == null ? r2.intValue() : 100) / 100.0f;
            Object obj7 = eVar.get(str.concat("_label_size_sp"));
            Float f11 = obj7 instanceof Float ? (Float) obj7 : null;
            return new mx.j(fIntValue, z11, f11 == null ? f11.floatValue() : 13.0f, iIntValue, z12, str3, zBooleanValue3, false);
        }
        zBooleanValue = bool2.booleanValue();
        z11 = zBooleanValue;
        Object obj22 = eVar.get(str.concat("_label_color"));
        if (!(obj22 instanceof Integer)) {
        }
        int iIntValue2 = num == null ? num.intValue() : zBooleanValue2 ? -1 : -16777216;
        Object obj32 = eVar.get(str.concat("_label_shadow"));
        if (!(obj32 instanceof Boolean)) {
        }
        if (bool != null) {
        }
        boolean z122 = zBooleanValue2;
        Object obj42 = eVar.get(str.concat("_label_font_family"));
        if (!(obj42 instanceof String)) {
        }
        if (str2 == null) {
        }
        String str32 = str2;
        Object obj52 = eVar.get(str.concat("_label_single_line"));
        if (!(obj52 instanceof Boolean)) {
        }
        boolean zBooleanValue32 = bool3 != null ? bool3.booleanValue() : true;
        Object obj62 = eVar.get(str.concat("_icon_size"));
        if (!(obj62 instanceof Integer)) {
        }
        float fIntValue2 = ((!(obj62 instanceof Integer) ? (Integer) obj62 : null) == null ? r2.intValue() : 100) / 100.0f;
        Object obj72 = eVar.get(str.concat("_label_size_sp"));
        if (obj72 instanceof Float) {
        }
        return new mx.j(fIntValue2, z11, f11 == null ? f11.floatValue() : 13.0f, iIntValue2, z122, str32, zBooleanValue32, false);
    }

    public static final long h(ComponentName componentName) {
        k kVar = o.f58669r;
        CRC32 crc32 = new CRC32();
        String packageName = componentName.getPackageName();
        String className = componentName.getClassName();
        if (packageName != null) {
            byte[] bytes = packageName.getBytes(Charsets.f72000b);
            Intrinsics.f(bytes, "getBytes(...)");
            crc32.update(bytes);
        }
        if (className != null) {
            byte[] bytes2 = className.getBytes(Charsets.f72000b);
            Intrinsics.f(bytes2, "getBytes(...)");
            crc32.update(bytes2);
        }
        return crc32.getValue();
    }

    public static final void i(Bitmap bitmap, Bitmap bitmap2, float f11) {
        k kVar = o.f58669r;
        if (bitmap2 != null) {
            Canvas canvasA = o.f58669r.a();
            canvasA.setBitmap(bitmap2);
            canvasA.save();
            canvasA.translate(bitmap2.getWidth() * 0.5f, bitmap2.getHeight() * 0.5f);
            canvasA.scale(f11, f11);
            canvasA.drawBitmap(bitmap, (-bitmap.getWidth()) / 2, (-bitmap.getHeight()) / 2, o.f58671t.c());
            canvasA.restore();
            canvasA.setBitmap(null);
        }
    }

    public static final void j(Bitmap bitmap, Drawable drawable) {
        k kVar = o.f58669r;
        if (bitmap != null) {
            Canvas canvasA = o.f58669r.a();
            canvasA.setBitmap(bitmap);
            canvasA.save();
            canvasA.translate(bitmap.getWidth() * 0.5f, bitmap.getHeight() * 0.5f);
            canvasA.scale(1.0f, 1.0f);
            int scaledWidth = bitmap.getScaledWidth(canvasA);
            int scaledHeight = bitmap.getScaledHeight(canvasA);
            int i5 = (-scaledWidth) / 2;
            int i11 = (-scaledHeight) / 2;
            drawable.setBounds(i5, i11, scaledWidth + i5, scaledHeight + i11);
            drawable.draw(canvasA);
            canvasA.restore();
            canvasA.setBitmap(null);
        }
    }

    public static final NamedIntent k(Context context, NamedIntent namedIntent) {
        Intent intent = namedIntent.f46369b;
        if (intent == null || !intent.hasExtra("profile")) {
            return namedIntent;
        }
        UserHandle userHandleE = ((h) h.f69294h.h(context)).e(intent.getLongExtra("profile", -1L));
        if (userHandleE == null) {
            userHandleE = Process.myUserHandle();
        }
        intent.removeExtra("profile");
        return new NamedIntent(namedIntent.a(context), intent, userHandleE);
    }

    public static p6.n l(Context context, e0 destination, Bundle bundle, t hostLifecycleState, v vVar) {
        String string = UUID.randomUUID().toString();
        Intrinsics.f(string, "randomUUID().toString()");
        Intrinsics.g(destination, "destination");
        Intrinsics.g(hostLifecycleState, "hostLifecycleState");
        return new p6.n(context, destination, bundle, hostLifecycleState, vVar, string, null);
    }

    public static void m(String str) {
        if (str.equalsIgnoreCase(":memory:") || str.trim().length() == 0) {
            return;
        }
        Log.e("DefaultDatabaseError", "deleting the database file: ".concat(str));
        try {
            SQLiteDatabase.deleteDatabase(new File(str));
        } catch (Exception e3) {
            Log.w("DefaultDatabaseError", "delete failed: " + e3.getMessage());
        }
    }

    public static d o(boolean z11) {
        if (f17558a == null && z11) {
            f17558a = new d();
        }
        return f17558a;
    }

    @Override // tk.m
    public Object a() {
        return new br.c();
    }

    @Override // sg.j
    public Object b(qg.k kVar) {
        return ((lg.c) kVar).f74933b;
    }

    @Override // te.g
    public long c(ke.k kVar) {
        return -1L;
    }

    @Override // te.g
    public s d() {
        return new ke.n(-9223372036854775807L);
    }

    @Override // r80.n
    public void debug(String str, String str2) {
        mc0.b bVar = mc0.d.f76206a;
        bVar.r(str);
        bVar.b(str2, new Object[0]);
    }

    @Override // te.g
    public void e(long j11) {
    }

    @Override // r80.n
    public void error(String str) {
        mc0.b bVar = mc0.d.f76206a;
        bVar.r("SesameLite");
        bVar.d(str, new Object[0]);
    }

    @Override // org.chromium.support_lib_boundary.SpeculativeLoadingConfigBoundaryInterface
    public int getMaxPrefetches() {
        throw null;
    }

    @Override // org.chromium.support_lib_boundary.SpeculativeLoadingConfigBoundaryInterface
    public int getMaxPrerenders() {
        throw null;
    }

    @Override // org.chromium.support_lib_boundary.SpeculativeLoadingConfigBoundaryInterface
    public int getPrefetchTTLSeconds() {
        throw null;
    }

    @Override // sp.a
    public boolean n(m0 m0Var, int i5, String str) {
        if (i5 == 200) {
            return true;
        }
        m0.a("e105");
        return false;
    }

    @Override // ninja.sesame.lib.bridge.v1.SesameInitOnComplete
    public void onConnect() {
        oy.c.f81123a = true;
    }

    @Override // ninja.sesame.lib.bridge.v1.SesameInitOnComplete
    public void onDisconnect() {
        oy.c.f81123a = false;
    }

    public void p(d0 d0Var, int i5, int i11) {
    }

    @Override // dr.b
    public StripeModel s(JSONObject jSONObject) {
        String strOptString = jSONObject.optString(PglCryptUtils.KEY_MESSAGE);
        Intrinsics.d(strOptString);
        if (r70.k.U0(strOptString)) {
            strOptString = null;
        }
        String strOptString2 = jSONObject.optString(TTConst.TRACK_TYPE);
        Intrinsics.d(strOptString2);
        if (r70.k.U0(strOptString2)) {
            strOptString2 = null;
        }
        String strOptString3 = jSONObject.optString(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE);
        Intrinsics.d(strOptString3);
        return new BridgeErrorParams(strOptString, strOptString2, r70.k.U0(strOptString3) ? null : strOptString3);
    }

    @Override // fi.c
    public /* synthetic */ Object then(Task task) {
        Intent intent = (Intent) ((Bundle) task.m()).getParcelable("notification_data");
        if (intent != null) {
            return new CloudMessage(intent);
        }
        return null;
    }

    @Override // r80.n
    public void warn(String str, String str2) {
        mc0.b bVar = mc0.d.f76206a;
        bVar.r(str);
        bVar.n(str2, new Object[0]);
    }

    public /* synthetic */ d(Object obj) {
    }

    @Override // r80.n
    public void error(String str, Throwable th2, String str2) {
        mc0.b bVar = mc0.d.f76206a;
        bVar.r(str);
        bVar.f(th2, str2, new Object[0]);
    }

    @Override // mk.m
    public Object a(IBinder iBinder) {
        int i5 = lk.b.f74983b;
        if (iBinder == null) {
            return null;
        }
        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.play.core.hsdp.protocol.IHpoaService");
        if (iInterfaceQueryLocalInterface instanceof lk.c) {
            return (lk.c) iInterfaceQueryLocalInterface;
        }
        return new lk.a(iBinder, "com.google.android.play.core.hsdp.protocol.IHpoaService", 6);
    }

    @Override // r80.n
    public void error(String str, Throwable th2) {
        mc0.b bVar = mc0.d.f76206a;
        bVar.r(str);
        bVar.e(th2);
    }
}
