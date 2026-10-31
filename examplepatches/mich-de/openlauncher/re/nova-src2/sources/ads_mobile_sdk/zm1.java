package ads_mobile_sdk;

import android.content.Context;
import android.net.Uri;
import b.k9;
import com.amplitude.eventbridge.EventBridgeChannel;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;

/* loaded from: classes.dex */
public final class zm1 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f12586a;

    /* renamed from: b, reason: collision with root package name */
    public final String f12587b;

    /* renamed from: c, reason: collision with root package name */
    public final fz f12588c;

    /* renamed from: d, reason: collision with root package name */
    public final rw0 f12589d;

    /* renamed from: e, reason: collision with root package name */
    public final jr0 f12590e;

    public zm1(Context applicationContext, String afmaVersion, fz consentManager, rw0 gmaUtil, jr0 flags) {
        Intrinsics.g(applicationContext, "applicationContext");
        Intrinsics.g(afmaVersion, "afmaVersion");
        Intrinsics.g(consentManager, "consentManager");
        Intrinsics.g(gmaUtil, "gmaUtil");
        Intrinsics.g(flags, "flags");
        this.f12586a = applicationContext;
        this.f12587b = afmaVersion;
        this.f12588c = consentManager;
        this.f12589d = gmaUtil;
        this.f12590e = flags;
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x00b3  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Comparable a(Uri uri, d33 d33Var, z1 z1Var, Integer num, String str, Duration duration, String str2, eg2 eg2Var, p31 p31Var, m31 m31Var, ContinuationImpl continuationImpl) {
        ym1 ym1Var;
        String string;
        String strF0;
        Duration duration2;
        Object objG;
        zm1 zm1Var;
        Uri uri2;
        String str3;
        z1 z1Var2;
        String str4;
        String string2;
        String string3;
        String string4;
        if (continuationImpl instanceof ym1) {
            ym1Var = (ym1) continuationImpl;
            int i5 = ym1Var.f12207j;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ym1Var.f12207j = i5 - Integer.MIN_VALUE;
            } else {
                ym1Var = new ym1(this, continuationImpl);
            }
        }
        Object obj = ym1Var.f12205h;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ym1Var.f12207j;
        String str5 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (i11 == 0) {
            ResultKt.b(obj);
            String string5 = uri.toString();
            Intrinsics.f(string5, "toString(...)");
            jr0 jr0Var = this.f12590e;
            jr0Var.getClass();
            Boolean bool = Boolean.TRUE;
            jn jnVar = jn.a$10;
            if (((Boolean) jr0Var.a("gads:app_status_logging_for_presentation:enabled", bool, jnVar)).booleanValue()) {
                string5 = r70.j.F0(string5, "@gw_aps@", k9.D(this.f12586a) ? "1" : "0", false);
            }
            if (((Boolean) jr0Var.a("gads:enable_placement_id:enabled", bool, jnVar)).booleanValue()) {
                if (eg2Var != null) {
                    AtomicLong atomicLong = eg2Var.f2863a;
                    string5 = atomicLong.get() > 0 ? r70.j.F0(string5, "@gw_placement_id@", String.valueOf(atomicLong.get()), false) : r70.j.F0(string5, "@gw_placement_id@", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, false);
                }
            }
            if (((Boolean) jr0Var.a("gads:enable_impression_sequence:enabled", Boolean.FALSE, jnVar)).booleanValue() && p31Var != null) {
                String string6 = p31Var.f8065a.toString();
                if (string6 == null) {
                    string6 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                String strF02 = r70.j.F0(string5, "@gw_is@", string6, false);
                Integer num2 = p31Var.f8066b;
                if (num2 == null || (string2 = num2.toString()) == null) {
                    string2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                String strF03 = r70.j.F0(strF02, "@gw_fis@", string2, false);
                Integer num3 = p31Var.f8067c;
                if (num3 == null || (string3 = num3.toString()) == null) {
                    string3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                string5 = r70.j.F0(strF03, "@gw_sfis@", string3, false);
            }
            if (((Boolean) jr0Var.a("gads:enable_impression_data:enabled", bool, jnVar)).booleanValue()) {
                String strA = m31Var != null ? m31Var.a() : null;
                if (strA == null) {
                    strA = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                string5 = r70.j.F0(string5, "@gw_subpn@", strA, false);
            }
            String strL = d33Var.f2165a.f10559a.l();
            if (strL == null) {
                strL = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            String strF04 = r70.j.F0(r70.j.F0(r70.j.F0(r70.j.F0(r70.j.F0(r70.j.F0(string5, "@gw_adlocid@", strL, false), "@gw_adnetid@", z1Var != null ? z1Var.F : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, false), "@gw_adnetrefresh@", "0", false), "@gw_adnetstatus@", String.valueOf(str), false), "@gw_allocid@", z1Var != null ? z1Var.n : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, false), "@gw_sdkver@", this.f12587b, false);
            if (num == null || (string = num.toString()) == null) {
                string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            strF0 = r70.j.F0(strF04, "@gw_seqnum@", string, false);
            ym1Var.f12198a = this;
            ym1Var.f12199b = uri;
            ym1Var.f12200c = z1Var;
            duration2 = duration;
            ym1Var.f12201d = duration2;
            ym1Var.f12202e = str2;
            ym1Var.f12203f = strF0;
            ym1Var.f12204g = "@gw_sessid@";
            ym1Var.f12207j = 1;
            fz fzVar = this.f12588c;
            fzVar.getClass();
            objG = fz.g(fzVar, ym1Var);
            if (objG == coroutineSingletons) {
                return coroutineSingletons;
            }
            zm1Var = this;
            uri2 = uri;
            str3 = str2;
            z1Var2 = z1Var;
            str4 = "@gw_sessid@";
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str4 = ym1Var.f12204g;
            strF0 = ym1Var.f12203f;
            str3 = ym1Var.f12202e;
            Duration duration3 = ym1Var.f12201d;
            z1Var2 = ym1Var.f12200c;
            uri2 = ym1Var.f12199b;
            zm1 zm1Var2 = ym1Var.f12198a;
            ResultKt.b(obj);
            objG = obj;
            duration2 = duration3;
            zm1Var = zm1Var2;
        }
        String str6 = (String) objG;
        if (str6 == null) {
            str6 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        String strEncode = Uri.encode(str6);
        Intrinsics.f(strEncode, "encode(...)");
        String strF05 = r70.j.F0(strF0, str4, strEncode, false);
        String strEncode2 = Uri.encode(z1Var2 != null ? z1Var2.X : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        Intrinsics.f(strEncode2, "encode(...)");
        String strF06 = r70.j.F0(strF05, "@gw_qdata@", strEncode2, false);
        if (duration2 != null && (string4 = new Long(Duration.h(duration2.f72041a)).toString()) != null) {
            str5 = string4;
        }
        Uri uri3 = Uri.parse(r70.j.F0(strF06, "@gw_ttr@", str5, false));
        if (r70.k.U0(str3) || !zm1Var.f12589d.b(uri2)) {
            return uri3;
        }
        b.i8 i8Var = rw0.f9327f;
        return b.i8.j(uri3, str3);
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0097  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x00df  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:20:0x00c5 -> B:21:0x00d1). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(List list, d33 d33Var, z1 z1Var, Integer num, String str, Duration duration, String str2, eg2 eg2Var, p31 p31Var, m31 m31Var, ContinuationImpl continuationImpl) {
        xm1 xm1Var;
        zm1 zm1Var;
        Collection arrayList;
        Iterator it;
        d33 d33Var2;
        z1 z1Var2;
        Integer num2;
        String str3;
        Duration duration2;
        String str4;
        eg2 eg2Var2;
        p31 p31Var2;
        m31 m31Var2;
        zm1 zm1Var2;
        if (continuationImpl instanceof xm1) {
            xm1Var = (xm1) continuationImpl;
            int i5 = xm1Var.f11781p;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                xm1Var.f11781p = i5 - Integer.MIN_VALUE;
                zm1Var = this;
            } else {
                zm1Var = this;
                xm1Var = new xm1(zm1Var, continuationImpl);
            }
        }
        Object obj = xm1Var.n;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = xm1Var.f11781p;
        if (i11 == 0) {
            ResultKt.b(obj);
            arrayList = new ArrayList(b70.c.u0(list, 10));
            it = list.iterator();
            d33Var2 = d33Var;
            z1Var2 = z1Var;
            num2 = num;
            str3 = str;
            duration2 = duration;
            str4 = str2;
            eg2Var2 = eg2Var;
            p31Var2 = p31Var;
            m31Var2 = m31Var;
            zm1Var2 = zm1Var;
            if (it.hasNext()) {
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            arrayList = xm1Var.f11780m;
            Iterator it2 = xm1Var.f11779l;
            Collection collection = xm1Var.f11778k;
            m31 m31Var3 = xm1Var.f11777j;
            p31 p31Var3 = xm1Var.f11776i;
            eg2 eg2Var3 = xm1Var.f11775h;
            String str5 = xm1Var.f11774g;
            Duration duration3 = xm1Var.f11773f;
            String str6 = xm1Var.f11772e;
            Integer num3 = xm1Var.f11771d;
            z1 z1Var3 = xm1Var.f11770c;
            d33 d33Var3 = xm1Var.f11769b;
            Object obj3 = obj;
            zm1 zm1Var3 = xm1Var.f11768a;
            ResultKt.b(obj3);
            p31Var2 = p31Var3;
            num2 = num3;
            eg2Var2 = eg2Var3;
            str3 = str6;
            str4 = str5;
            duration2 = duration3;
            m31 m31Var4 = m31Var3;
            d33 d33Var4 = d33Var3;
            zm1Var2 = zm1Var3;
            arrayList.add((Uri) obj3);
            it = it2;
            arrayList = collection;
            d33Var2 = d33Var4;
            z1Var2 = z1Var3;
            m31Var2 = m31Var4;
            if (it.hasNext()) {
                Uri uri = (Uri) it.next();
                xm1Var.f11768a = zm1Var2;
                xm1Var.f11769b = d33Var2;
                xm1Var.f11770c = z1Var2;
                xm1Var.f11771d = num2;
                xm1Var.f11772e = str3;
                xm1Var.f11773f = duration2;
                xm1Var.f11774g = str4;
                xm1Var.f11775h = eg2Var2;
                xm1Var.f11776i = p31Var2;
                xm1Var.f11777j = m31Var2;
                xm1Var.f11778k = arrayList;
                xm1Var.f11779l = it;
                xm1Var.f11780m = arrayList;
                Iterator it3 = it;
                xm1Var.f11781p = 1;
                xm1 xm1Var2 = xm1Var;
                Object objA = zm1Var2.a(uri, d33Var2, z1Var2, num2, str3, duration2, str4, eg2Var2, p31Var2, m31Var2, xm1Var2);
                if (objA == obj2) {
                    return obj2;
                }
                obj3 = objA;
                xm1Var = xm1Var2;
                it2 = it3;
                m31Var4 = m31Var2;
                z1Var3 = z1Var2;
                d33Var4 = d33Var2;
                collection = arrayList;
                arrayList.add((Uri) obj3);
                it = it2;
                arrayList = collection;
                d33Var2 = d33Var4;
                z1Var2 = z1Var3;
                m31Var2 = m31Var4;
                if (it.hasNext()) {
                    return (List) arrayList;
                }
            }
        }
    }

    public static /* synthetic */ Object a(zm1 zm1Var, List list, d33 d33Var, z1 z1Var, Integer num, String str, Duration duration, String str2, eg2 eg2Var, p31 p31Var, m31 m31Var, ContinuationImpl continuationImpl, int i5) {
        if ((i5 & 16) != 0) {
            str = null;
        }
        if ((i5 & 32) != 0) {
            duration = null;
        }
        if ((i5 & 64) != 0) {
            str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if ((i5 & 128) != 0) {
            eg2Var = null;
        }
        if ((i5 & 256) != 0) {
            p31Var = null;
        }
        if ((i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0) {
            m31Var = null;
        }
        return zm1Var.a(list, d33Var, z1Var, num, str, duration, str2, eg2Var, p31Var, m31Var, continuationImpl);
    }
}
