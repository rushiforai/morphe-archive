package com.bytedance.sdk.openadsdk.common;

import android.annotation.SuppressLint;
import android.content.Context;
import android.text.TextUtils;
import ar.g;
import b.c0;
import com.bytedance.sdk.openadsdk.AdSlot;
import com.bytedance.sdk.openadsdk.CacheDirFactory;
import com.bytedance.sdk.openadsdk.core.model.av;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.io.File;
import java.io.FileFilter;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;

/* loaded from: classes2.dex */
public class zb {
    private static final HashMap<String, zb> ycx = new HashMap<>();

    /* renamed from: zb, reason: collision with root package name */
    private static final HashMap<String, ycx> f24759zb = new HashMap<>();

    /* renamed from: dj, reason: collision with root package name */
    private final ycx f24760dj;
    private final String lud;

    @SuppressLint({"StaticFieldLeak"})
    private final Context sya;

    private zb(Context context, String str) {
        this.sya = context;
        ycx ycxVar = f24759zb.get(str);
        this.f24760dj = ycxVar == null ? new ycx(str) : ycxVar;
        this.lud = str;
    }

    public boolean dj(String str) {
        return this.f24760dj.ul(str);
    }

    public void sya(String str) {
        this.f24760dj.lt(str);
    }

    public String zb(String str) {
        try {
            String strZb = this.f24760dj.zb(str);
            if (TextUtils.isEmpty(strZb)) {
                return null;
            }
            return strZb;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erSVU4A==", "euoBmgC9ZeSBSd9Y", "XOs5sQKoaA==", 211);
            return null;
        }
    }

    public static zb ycx(String str) {
        zb zbVar;
        HashMap<String, zb> map = ycx;
        zb zbVar2 = map.get(str);
        if (zbVar2 != null) {
            return zbVar2;
        }
        synchronized (zb.class) {
            try {
                zbVar = map.get(str);
                if (zbVar == null) {
                    zbVar = new zb(com.bytedance.sdk.openadsdk.core.pmi.ycx(), str);
                    map.put(str, zbVar);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return zbVar;
    }

    private String zb() {
        return ((g) CacheDirFactory.getICacheDir()).e();
    }

    public static class ycx {
        protected final String ycx;

        /* renamed from: ul, reason: collision with root package name */
        private final HashSet<String> f24763ul = new HashSet<>();

        /* renamed from: zb, reason: collision with root package name */
        String f24764zb = "material_data";
        String sya = "has_played";

        /* renamed from: dj, reason: collision with root package name */
        String f24761dj = "create_time";
        String lud = "in_use_process";

        /* renamed from: lt, reason: collision with root package name */
        String f24762lt = "req_id";

        public ycx(String str) {
            this.ycx = TextUtils.isEmpty(str) ? b.f42142b : str;
        }

        public long dj(String str) {
            try {
                return com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx(ycx(str), this.f24761dj, 0L);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erSVU4A==", "euoBmgC9ZeSBSd9YyCKwC1rtJZA=", "XOs5oQqxbA==", 303);
                return 0L;
            }
        }

        public void fby(String str) {
            try {
                com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx(ycx(str));
                this.f24763ul.remove(str);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erSVU4A==", "euoBmgC9ZeSBSd9YyCKwC1rtJZA=", "WOIolBE=", 362);
            }
        }

        public void lt(String str) {
            try {
                com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx(ycx(str), this.lud, com.bytedance.sdk.component.utils.thx.zb(com.bytedance.sdk.openadsdk.core.pmi.ycx()));
                this.f24763ul.add(str);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erSVU4A==", "euoBmgC9ZeSBSd9YyCKwC1rtJZA=", "SOs5vA2JesI=", Sdk.SDKError.Reason.BLACK_SCREEN_DETECTION_ERROR_VALUE);
            }
        }

        public boolean lud(String str) {
            try {
                return com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx(ycx(str), this.sya, true);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erSVU4A==", "euoBmgC9ZeSBSd9YyCKwC1rtJZA=", "U+8+pQ+9cMKE", Sdk.SDKError.Reason.MRAID_JS_CALL_EMPTY_VALUE);
                return true;
            }
        }

        public String sya(String str) {
            try {
                return com.bytedance.sdk.openadsdk.uh.dj.ycx.zb(ycx(str), this.f24762lt, (String) null);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erSVU4A==", "euoBmgC9ZeSBSd9YyCKwC1rtJZA=", "XOs5pwatQOM=", 294);
                return null;
            }
        }

        public boolean ul(String str) {
            try {
                String strYcx = ycx(str);
                String strZb = com.bytedance.sdk.openadsdk.uh.dj.ycx.zb(strYcx, this.lud, b.f42142b);
                if (TextUtils.isEmpty(strZb)) {
                    return false;
                }
                if (!strZb.equals(com.bytedance.sdk.component.utils.thx.zb(com.bytedance.sdk.openadsdk.core.pmi.ycx())) || this.f24763ul.contains(str)) {
                    return true;
                }
                com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx(strYcx, this.lud, b.f42142b);
                return false;
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erSVU4A==", "euoBmgC9ZeSBSd9YyCKwC1rtJZA=", "Uv0EmzavbA==", 339);
                return true;
            }
        }

        public String ycx(String str) {
            if (TextUtils.isEmpty(str)) {
                str = "0";
            }
            return c0.r(new StringBuilder(), this.ycx, "_cache_", str);
        }

        public String zb(String str) {
            try {
                return com.bytedance.sdk.openadsdk.uh.dj.ycx.zb(ycx(str), this.f24764zb, (String) null);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erSVU4A==", "euoBmgC9ZeSBSd9YyCKwC1rtJZA=", "XOs5sQKoaA==", 286);
                return null;
            }
        }

        public void ycx(AdSlot adSlot, String str, String str2) {
            try {
                String codeId = adSlot.getCodeId();
                String strYcx = ycx(codeId);
                com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx(strYcx, this.sya, Boolean.FALSE);
                com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx(strYcx, this.f24761dj, Long.valueOf(System.currentTimeMillis()));
                com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx(strYcx, this.f24764zb, str);
                com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx(strYcx, this.lud, b.f42142b);
                com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx(strYcx, this.f24762lt, str2);
                this.f24763ul.remove(codeId);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erSVU4A==", "euoBmgC9ZeSBSd9YyCKwC1rtJZA=", "SO87kA==", 354);
            }
        }
    }

    public static void ycx(String str, ycx ycxVar) {
        f24759zb.put(str, ycxVar);
    }

    public void ycx(String str, tn tnVar) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        String strSya = this.f24760dj.sya(str);
        String strAc = tnVar != null ? tnVar.ac() : b.f42142b;
        if (TextUtils.isEmpty(strSya) || TextUtils.isEmpty(strAc) || strSya.equals(strAc)) {
            this.f24760dj.fby(str);
        }
    }

    public void ycx() {
        String str;
        File[] fileArrListFiles;
        try {
            boolean zUl = com.bytedance.sdk.openadsdk.core.jc.ul(this.lud);
            if (zUl) {
                str = "files";
            } else {
                str = "shared_prefs";
            }
            File file = new File(this.sya.getDataDir(), str);
            if (file.exists() && file.isDirectory() && (fileArrListFiles = file.listFiles(new FileFilter() { // from class: com.bytedance.sdk.openadsdk.common.zb.1
                @Override // java.io.FileFilter
                public boolean accept(File file2) {
                    if (file2 != null) {
                        return file2.getName().contains(zb.this.lud);
                    }
                    return false;
                }
            })) != null) {
                for (File file2 : fileArrListFiles) {
                    if (zUl) {
                        try {
                            com.bytedance.sdk.component.utils.ul.sya(file2);
                        } catch (Throwable th2) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erSVU4A==", "euoBmgC9ZeSBSd9Y", "WOIolBGdZcujS9RViQ==", Sdk.SDKError.Reason.STORE_REGION_CODE_ERROR_VALUE);
                        }
                    } else {
                        this.sya.deleteSharedPreferences(file2.getName().replace(".xml", b.f42142b));
                    }
                }
            }
        } catch (Throwable th3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erSVU4A==", "euoBmgC9ZeSBSd9Y", "WOIolBGdZcujS9RViQ==", 139);
        }
        try {
            File file3 = new File(zb());
            if (file3.exists() && file3.isDirectory()) {
                com.bytedance.sdk.component.utils.ul.sya(file3);
            }
        } catch (Throwable th4) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th4, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erSVU4A==", "euoBmgC9ZeSBSd9Y", "WOIolBGdZcujS9RViQ==", 151);
        }
    }

    public void ycx(AdSlot adSlot, com.bytedance.sdk.openadsdk.core.model.ycx ycxVar) {
        tn tnVarUl;
        if ((ycxVar != null && ycxVar.ul() != null && ycxVar.ul().oiz()) || ycxVar == null || adSlot == null || !TextUtils.isEmpty(adSlot.getBidAdm()) || (tnVarUl = ycxVar.ul()) == null || tnVarUl.zs() == 2) {
            return;
        }
        try {
            this.f24760dj.ycx(adSlot, ycxVar.ok(), ycxVar.sya());
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erSVU4A==", "euoBmgC9ZeSBSd9Y", "SO87kA==", 180);
        }
    }

    public boolean ycx(com.bytedance.sdk.openadsdk.core.model.ycx ycxVar, boolean z11) {
        if (ycxVar == null || !ycxVar.lt()) {
            return false;
        }
        if (z11) {
            Iterator<tn> it = ycxVar.lud().iterator();
            while (it.hasNext()) {
                if (!ycx(it.next())) {
                    it.remove();
                }
            }
        }
        return ycxVar.lt();
    }

    public String ycx(String str, long j11) {
        long jDj = this.f24760dj.dj(str);
        boolean zLud = this.f24760dj.lud(str);
        if (System.currentTimeMillis() - jDj >= j11 || zLud) {
            return null;
        }
        return zb(str);
    }

    private boolean ycx(tn tnVar) {
        if (tnVar != null) {
            return av.sya(tnVar) || tnVar.ci() != null;
        }
        return false;
    }
}
