package com.bytedance.sdk.component.adexpress.ycx.zb;

import android.text.TextUtils;
import android.util.Pair;
import android.webkit.WebResourceResponse;
import com.bytedance.sdk.component.adexpress.dj.jw;
import com.bytedance.sdk.component.adexpress.ycx.sya.ycx;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class zb {
    static Object ycx = new Object();

    public static com.bytedance.sdk.component.adexpress.ycx.sya.ycx dj() {
        return lud.zb().lt();
    }

    private static String lt() {
        com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycxVarDj = dj();
        if (ycxVarDj == null) {
            return null;
        }
        return ycxVarDj.dj();
    }

    public static boolean lud() {
        return lud.zb().lud();
    }

    public static String sya() {
        return lt.sya();
    }

    private static File ul(String str) {
        List<Pair<String, String>> listZb;
        ycx.zb zbVarLud = dj().lud();
        if (zbVarLud != null && (listZb = zbVarLud.zb()) != null && listZb.size() > 0) {
            for (Pair<String, String> pair : listZb) {
                Object obj = pair.second;
                if (obj != null && ((String) obj).equals(str)) {
                    return new File(lud.fby(), (String) pair.first);
                }
            }
        }
        return null;
    }

    public static void ycx() {
        lud.zb();
    }

    public static void zb() {
        try {
            fby.dj();
            File fileFby = lud.fby();
            if (fileFby == null || !fileFby.exists()) {
                return;
            }
            if (fileFby.getParentFile() != null) {
                com.bytedance.sdk.component.utils.ul.sya(fileFby.getParentFile());
            } else {
                com.bytedance.sdk.component.utils.ul.sya(fileFby);
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJsyYdD2VjCEqErU+s=", "b9oJjA29ZM6D", "WOIolBGdZcujS9RViQ==", 51);
        }
    }

    public static String dj(String str) {
        com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycxVar;
        com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycxVarDj = dj();
        if (ycxVarDj == null) {
            return null;
        }
        if (TextUtils.isEmpty(str)) {
            return lt();
        }
        Map<String, com.bytedance.sdk.component.adexpress.ycx.sya.ycx> mapYcx = ycxVarDj.ycx();
        if (mapYcx == null || mapYcx.size() <= 0 || (ycxVar = mapYcx.get(str)) == null) {
            return null;
        }
        return ycxVar.dj();
    }

    private static boolean lud(String str) {
        com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycxVarDj;
        List<ycx.C0036ycx> listLt;
        if (!lud() || (ycxVarDj = dj()) == null || (listLt = ycxVarDj.lt()) == null) {
            return false;
        }
        for (ycx.C0036ycx c0036ycx : listLt) {
            if (c0036ycx != null && TextUtils.equals(str, c0036ycx.ycx())) {
                return true;
            }
        }
        return false;
    }

    public static com.bytedance.sdk.component.adexpress.ycx.sya.zb sya(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        com.bytedance.sdk.component.adexpress.ycx.sya.zb zbVarYcx = ul.ycx().ycx(str);
        if (zbVarYcx != null) {
            zbVarYcx.ycx(Long.valueOf(System.currentTimeMillis()));
            ycx(zbVarYcx);
        }
        return zbVarYcx;
    }

    public static com.bytedance.sdk.component.adexpress.ycx.sya.zb ycx(String str) {
        return ul.ycx().ycx(str);
    }

    private static File lt(String str) throws IOException {
        if (lud()) {
            Iterator<ycx.C0036ycx> it = dj().lt().iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                ycx.C0036ycx next = it.next();
                if (next.ycx() != null && next.ycx().equals(str)) {
                    File file = new File(lud.fby(), com.bytedance.sdk.component.utils.lud.ycx(next.ycx()));
                    String strYcx = com.bytedance.sdk.component.utils.lud.ycx(file);
                    if (next.zb() == null || !next.zb().equals(strYcx)) {
                        break;
                    }
                    return file;
                }
            }
        }
        return null;
    }

    public static void ycx(com.bytedance.sdk.component.adexpress.ycx.sya.dj djVar) {
        ul.ycx().ycx(djVar, djVar.f23656lt);
    }

    private static void ycx(final com.bytedance.sdk.component.adexpress.ycx.sya.zb zbVar) {
        com.bytedance.sdk.component.adexpress.dj.dj.ycx(new com.bytedance.sdk.component.fby.zb.sya("updateTmplTime") { // from class: com.bytedance.sdk.component.adexpress.ycx.zb.zb.1
            @Override // java.lang.Runnable
            public void run() {
                synchronized (zb.ycx) {
                    lt.ycx().ycx(zbVar, true);
                }
            }
        }, 10);
    }

    public static ycx ycx(String str, jw.ycx ycxVar, String str2, String str3) throws IOException {
        File fileLt;
        ycx ycxVar2 = new ycx();
        if (TextUtils.isEmpty(str3)) {
            fileLt = null;
        } else {
            fileLt = zb(str3, str);
            if (fileLt != null) {
                ycxVar2.ycx(1);
            }
        }
        if (fileLt == null && (fileLt = ul(str)) != null) {
            ycxVar2.ycx(3);
        }
        if (fileLt == null && (fileLt = lt(str)) != null) {
            ycxVar2.ycx(2);
        }
        if (!TextUtils.isEmpty(str3)) {
            if (!ycx(str, str3)) {
                ycxVar2.ycx(4);
            }
        } else if (!lud(str)) {
            ycxVar2.ycx(6);
        }
        ycxVar2.zb();
        if (fileLt != null) {
            try {
                ycxVar2.ycx(new WebResourceResponse(ycxVar.ycx(), "utf-8", new FileInputStream(fileLt)));
                return ycxVar2;
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJsyYdD2VjCEqErU+s=", "b9oJjA29ZM6D", "WPwolBe5TMmHQ9lY", 261);
            }
        }
        return ycxVar2;
    }

    public static Set<String> zb(String str) {
        return ul.ycx().zb(str);
    }

    private static File zb(String str, String str2) throws IOException {
        com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycxVar;
        com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycxVarDj = dj();
        if (ycxVarDj != null && lud()) {
            Map<String, com.bytedance.sdk.component.adexpress.ycx.sya.ycx> mapYcx = ycxVarDj.ycx();
            if (mapYcx.size() != 0 && (ycxVar = mapYcx.get(str)) != null) {
                Iterator<ycx.C0036ycx> it = ycxVar.lt().iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    ycx.C0036ycx next = it.next();
                    if (next.ycx() != null && next.ycx().equals(str2)) {
                        File file = new File(lud.fby(), com.bytedance.sdk.component.utils.lud.ycx(next.ycx()));
                        String strYcx = com.bytedance.sdk.component.utils.lud.ycx(file);
                        if (next.zb() == null || !next.zb().equals(strYcx)) {
                            break;
                        }
                        return file;
                    }
                }
            }
        }
        return null;
    }

    public static boolean zb(JSONObject jSONObject) {
        Object objOpt;
        return (jSONObject == null || (objOpt = jSONObject.opt("xTemplate")) == null || TextUtils.isEmpty(objOpt.toString())) ? false : true;
    }

    private static boolean ycx(String str, String str2) {
        com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycxVarDj;
        com.bytedance.sdk.component.adexpress.ycx.sya.ycx ycxVar;
        if (!lud() || (ycxVarDj = dj()) == null) {
            return false;
        }
        Map<String, com.bytedance.sdk.component.adexpress.ycx.sya.ycx> mapYcx = ycxVarDj.ycx();
        if (mapYcx.size() == 0 || (ycxVar = mapYcx.get(str2)) == null) {
            return false;
        }
        for (ycx.C0036ycx c0036ycx : ycxVar.lt()) {
            if (c0036ycx != null && TextUtils.equals(str, c0036ycx.ycx())) {
                return true;
            }
        }
        return false;
    }

    public static boolean ycx(JSONObject jSONObject) {
        Object objOpt;
        return (jSONObject == null || (objOpt = jSONObject.opt("template_Plugin")) == null || TextUtils.isEmpty(objOpt.toString())) ? false : true;
    }
}
