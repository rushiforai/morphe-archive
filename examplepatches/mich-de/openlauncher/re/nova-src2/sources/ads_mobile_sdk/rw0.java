package ads_mobile_sdk;

import android.app.Activity;
import android.app.LocaleManager;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.LocaleList;
import io.h;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import kotlin.sequences.FilteringSequence;
import kotlin.sequences.SequencesKt;
import kotlin.text.Regex;
import t70.m0;

/* loaded from: classes.dex */
public final class rw0 {

    /* renamed from: f, reason: collision with root package name */
    public static final b.i8 f9327f = new b.i8(8);

    /* renamed from: g, reason: collision with root package name */
    public static final AtomicReference f9328g;

    /* renamed from: h, reason: collision with root package name */
    public static final Regex f9329h;

    /* renamed from: i, reason: collision with root package name */
    public static final Regex f9330i;

    /* renamed from: a, reason: collision with root package name */
    public final Context f9331a;

    /* renamed from: b, reason: collision with root package name */
    public final g0 f9332b;

    /* renamed from: c, reason: collision with root package name */
    public final jr0 f9333c;

    /* renamed from: d, reason: collision with root package name */
    public final l0 f9334d;

    /* renamed from: e, reason: collision with root package name */
    public final Class f9335e;

    static {
        ul.b.Q("/aclk", "/pcs/click", "/dbm/clk");
        f9328g = new AtomicReference(null);
        f9329h = new Regex("^(ca-app-pub-[0-9]{16})~([0-9]{10})$");
        f9330i = new Regex("^(ca-app-pub-[a-zA-Z0-9\\-]+)/([a-zA-Z0-9_\\-]+)(/.*)?$");
    }

    public rw0(Context applicationContext, g0 activityTracker, jr0 flags, l0 adActivityDelegateMap, Class adActivityClass) {
        Intrinsics.g(applicationContext, "applicationContext");
        Intrinsics.g(activityTracker, "activityTracker");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(adActivityDelegateMap, "adActivityDelegateMap");
        Intrinsics.g(adActivityClass, "adActivityClass");
        this.f9331a = applicationContext;
        this.f9332b = activityTracker;
        this.f9333c = flags;
        this.f9334d = adActivityDelegateMap;
        this.f9335e = adActivityClass;
    }

    public final Intent a(Context context, b.f4 adActivityDelegate) {
        Intrinsics.g(context, "context");
        Intrinsics.g(adActivityDelegate, "adActivityDelegate");
        Intent intent = new Intent(context, (Class<?>) this.f9335e);
        Bundle bundle = new Bundle();
        l0 l0Var = this.f9334d;
        l0Var.getClass();
        int andIncrement = l0Var.f6025c.getAndIncrement();
        t70.j0 j0Var = l0Var.f6023a;
        h hVar = new h(l0Var, andIncrement, null, 1);
        EmptyCoroutineContext context2 = EmptyCoroutineContext.f71803a;
        Intrinsics.g(j0Var, "<this>");
        Intrinsics.g(context2, "context");
        t70.g2 g2VarT = m0.t(j0Var, context2, null, new ar.a(hVar, null), 2);
        l0Var.f6026d.put(Integer.valueOf(andIncrement), new j0(adActivityDelegate, g2VarT));
        bundle.putInt("ad_activity_delegate", andIncrement);
        intent.putExtra("ad_activity_delegate_bundle", bundle);
        if (!(context instanceof Activity)) {
            intent.addFlags(268435456);
        }
        return intent;
    }

    public final boolean b(Uri uri) {
        Intrinsics.g(uri, "uri");
        String host = uri.getHost();
        if (host != null) {
            jr0 jr0Var = this.f9333c;
            jr0Var.getClass();
            List defaultValue = ul.b.Q(".doubleclick.net", ".googleadservices.com", ".googlesyndication.com");
            Intrinsics.g(defaultValue, "defaultValue");
            List list = (List) jr0Var.a("gads:google_ad_domain_suffixes", defaultValue, jn.a$20);
            if (!(list instanceof Collection) || !list.isEmpty()) {
                Iterator it = list.iterator();
                while (it.hasNext()) {
                    if (r70.j.A0(host, (String) it.next(), false)) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    public final boolean c(Uri uri) {
        Intrinsics.g(uri, "uri");
        if (!b(uri)) {
            return false;
        }
        String string = uri.toString();
        jr0 jr0Var = this.f9333c;
        jr0Var.getClass();
        List list = (List) jr0Var.a("gads:impression_url_pattern_match", ul.b.P("^[^?]*(/adview|/pcs/view).*"), jn.a$20);
        if ((list instanceof Collection) && list.isEmpty()) {
            return false;
        }
        Iterator it = list.iterator();
        while (it.hasNext()) {
            Regex regex = new Regex((String) it.next());
            Intrinsics.d(string);
            if (regex.a(string)) {
                return true;
            }
        }
        return false;
    }

    public final Map d(Uri uri) {
        String encodedQuery;
        String strDecode;
        jr0 jr0Var = this.f9333c;
        jr0Var.getClass();
        if (!((Boolean) jr0Var.a("gads:uri_query_to_map:enabled", Boolean.TRUE, jn.a$10)).booleanValue()) {
            if (uri.isOpaque()) {
                return b70.h.f17594a;
            }
            Set<String> queryParameterNames = uri.getQueryParameterNames();
            Intrinsics.f(queryParameterNames, "getQueryParameterNames(...)");
            FilteringSequence filteringSequenceT0 = SequencesKt.t0(b70.g.M0(queryParameterNames), jn.a$9);
            LinkedHashMap linkedHashMap = new LinkedHashMap();
            FilteringSequence.AnonymousClass1 anonymousClass1 = new FilteringSequence.AnonymousClass1();
            while (anonymousClass1.hasNext()) {
                Object next = anonymousClass1.next();
                linkedHashMap.put(next, uri.getQueryParameter((String) next));
            }
            return linkedHashMap;
        }
        LinkedHashMap linkedHashMap2 = new LinkedHashMap();
        if (!uri.isOpaque() && (encodedQuery = uri.getEncodedQuery()) != null) {
            int length = encodedQuery.length();
            int i5 = 0;
            while (true) {
                int iR0 = r70.k.R0('&', i5, 4, encodedQuery);
                int i11 = iR0 != -1 ? iR0 : length;
                int iR02 = r70.k.R0('=', i5, 4, encodedQuery);
                if (iR02 > i11 || iR02 == -1) {
                    iR02 = i11;
                }
                String strSubstring = encodedQuery.substring(i5, iR02);
                Intrinsics.f(strSubstring, "substring(...)");
                String strDecode2 = Uri.decode(strSubstring);
                if (iR02 == i11) {
                    strDecode = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                } else {
                    String strSubstring2 = encodedQuery.substring(iR02 + 1, i11);
                    Intrinsics.f(strSubstring2, "substring(...)");
                    strDecode = Uri.decode(strSubstring2);
                }
                Intrinsics.d(strDecode2);
                Intrinsics.d(strDecode);
                linkedHashMap2.put(strDecode2, strDecode);
                if (iR0 == -1) {
                    break;
                }
                i5 = iR0 + 1;
            }
        }
        return linkedHashMap2;
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0044  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static qw0 a(Context context) {
        Configuration configuration;
        LocaleList locales;
        Intrinsics.g(context, "context");
        qw0 qw0Var = new qw0(Locale.getDefault().getLanguage(), Locale.getDefault().getCountry());
        if (Build.VERSION.SDK_INT >= 33) {
            LocaleManager localeManagerA = b.i1.a(context.getSystemService(b.i1.p()));
            locales = localeManagerA != null ? localeManagerA.getSystemLocales() : null;
        } else {
            Resources resources = context.getResources();
            if (resources != null && (configuration = resources.getConfiguration()) != null) {
                locales = configuration.getLocales();
            }
        }
        if (locales == null || locales.isEmpty()) {
            return qw0Var;
        }
        Locale locale = locales.get(0);
        return new qw0(locale.getLanguage(), locale.getCountry());
    }

    public final boolean a(Uri uri) {
        Intrinsics.g(uri, "uri");
        if (!b(uri)) {
            return false;
        }
        String string = uri.toString();
        jr0 jr0Var = this.f9333c;
        jr0Var.getClass();
        List list = (List) jr0Var.a("gads:click_url_pattern_match", ul.b.P("^[^?]*(/aclk|/pcs/click|/dbm/clk).*"), jn.a$20);
        if ((list instanceof Collection) && list.isEmpty()) {
            return false;
        }
        Iterator it = list.iterator();
        while (it.hasNext()) {
            Regex regex = new Regex((String) it.next());
            Intrinsics.d(string);
            if (regex.a(string)) {
                return true;
            }
        }
        return false;
    }

    public final boolean a(Intent intent) {
        if (intent == null) {
            return false;
        }
        Context contextB = this.f9332b.b();
        if (contextB == null) {
            contextB = this.f9331a;
        }
        if (!(contextB instanceof Activity)) {
            intent.addFlags(268435456);
        }
        try {
            contextB.startActivity(intent);
            return true;
        } catch (ActivityNotFoundException e3) {
            zi3.a(6, "Exception starting Activity: " + e3, null);
            return false;
        }
    }
}
