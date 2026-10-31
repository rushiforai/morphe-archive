package com.fyber.inneractive.sdk.gpp;

import android.content.SharedPreferences;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.v;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: b, reason: collision with root package name */
    public String f28465b;

    /* renamed from: d, reason: collision with root package name */
    public String f28467d;

    /* renamed from: e, reason: collision with root package name */
    public Boolean f28468e;

    /* renamed from: a, reason: collision with root package name */
    public final AtomicReference f28464a = new AtomicReference();

    /* renamed from: c, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.tcf.a f28466c = new com.fyber.inneractive.sdk.tcf.a();

    public final boolean a() {
        Boolean bool = this.f28468e;
        if (bool != null) {
            return bool.booleanValue();
        }
        String str = this.f28465b;
        if (str == null || str.isEmpty()) {
            this.f28468e = Boolean.FALSE;
            return false;
        }
        for (String str2 : this.f28465b.split("_")) {
            try {
            } catch (NumberFormatException e3) {
                IAlog.a("%s Error parsing section ID: %s", e3, "GppManager", str2);
            }
            if (Integer.parseInt(str2.trim()) == 2) {
                this.f28468e = Boolean.TRUE;
                return true;
            }
            continue;
        }
        this.f28468e = Boolean.FALSE;
        return false;
    }

    public final void b() {
        String string = null;
        this.f28468e = null;
        if (this.f28464a.get() != null) {
            try {
                this.f28467d = ((SharedPreferences) this.f28464a.get()).getString("IABGPP_HDR_GppString", null);
            } catch (Throwable th2) {
                IAlog.a("%s Error on getGppString", th2, "GppManager");
            }
        }
        if (this.f28464a.get() != null) {
            try {
                this.f28465b = ((SharedPreferences) this.f28464a.get()).getString("IABGPP_GppSID", null);
            } catch (Throwable th3) {
                IAlog.a("%s Error on computeAvailableSections", th3, "GppManager");
            }
        }
        com.fyber.inneractive.sdk.tcf.a aVar = this.f28466c;
        aVar.f31107b = null;
        aVar.f31108c = false;
        if (this.f28464a.get() != null) {
            try {
                string = ((SharedPreferences) this.f28464a.get()).getString("IABGPP_2_String", null);
            } catch (Throwable th4) {
                IAlog.a("%s Error on getSectionGppString", th4, "GppManager");
            }
        }
        if (string == null) {
            IAlog.a("%s decodeTcf - gppTcfString is null, not decoding TCF", "GppManager");
            return;
        }
        com.fyber.inneractive.sdk.tcf.a aVar2 = this.f28466c;
        aVar2.f31107b = string;
        String[] strArrSplit = string.split("\\.");
        if (strArrSplit.length == 0 || !v.a(strArrSplit[0])) {
            IAlog.a("%s empty string", "GppTcf");
            return;
        }
        try {
            aVar2.f31106a.a(strArrSplit[0]);
            aVar2.a();
            aVar2.f31108c = true;
            IAlog.a(" %s parsed object: %s", "GppTcf", aVar2.toString());
        } catch (Exception unused) {
            IAlog.b("%s invalid TC string: %s", "GppTcf", aVar2.f31107b);
        }
    }
}
