package io;

import com.instabridge.ai.context.ContextType;
import java.util.List;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes3.dex */
public final class p {

    /* renamed from: f, reason: collision with root package name */
    public static final br.c f66705f;

    /* renamed from: g, reason: collision with root package name */
    public static final p f66706g;

    /* renamed from: h, reason: collision with root package name */
    public static final p f66707h;

    /* renamed from: i, reason: collision with root package name */
    public static final p f66708i;

    /* renamed from: j, reason: collision with root package name */
    public static final p f66709j;

    /* renamed from: k, reason: collision with root package name */
    public static final p f66710k;

    /* renamed from: l, reason: collision with root package name */
    public static final p f66711l;

    /* renamed from: m, reason: collision with root package name */
    public static final p f66712m;
    public static final p n;
    public static final p o;

    /* renamed from: p, reason: collision with root package name */
    public static final p f66713p;

    /* renamed from: q, reason: collision with root package name */
    public static final p f66714q;

    /* renamed from: r, reason: collision with root package name */
    public static final /* synthetic */ p[] f66715r;

    /* renamed from: s, reason: collision with root package name */
    public static final /* synthetic */ i70.a f66716s;

    /* renamed from: a, reason: collision with root package name */
    public final List f66717a;

    /* renamed from: b, reason: collision with root package name */
    public final String f66718b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f66719c;

    /* renamed from: d, reason: collision with root package name */
    public final String f66720d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f66721e;

    static {
        p pVar = new p("LOCATION", 0, ul.b.P(ContextType.LOCATION), "android.permission.ACCESS_FINE_LOCATION", "location", 80);
        f66706g = pVar;
        p pVar2 = new p("INSTALLED_APPS", 1, ul.b.P(ContextType.PHONE_APPS), null, "phone_apps", 80);
        f66707h = pVar2;
        ContextType contextType = ContextType.APP_USAGE;
        p pVar3 = new p("RECENT_APPS", 2, ul.b.P(contextType), "android.permission.PACKAGE_USAGE_STATS", null, 64);
        p pVar4 = new p("CALL_HISTORY", 3, ul.b.P(ContextType.CALL_HISTORY), "android.permission.READ_CALL_LOG", "call_history", 80);
        f66708i = pVar4;
        p pVar5 = new p("SMS_CONTACTS", 4, ul.b.P(ContextType.SMS_HISTORY), "android.permission.READ_SMS", "sms_history", 80);
        f66709j = pVar5;
        p pVar6 = new p("DEVICE_STATE", 5, ul.b.P(ContextType.DEVICE_STATE), null, "device_state", 16);
        f66710k = pVar6;
        p pVar7 = new p("SEARCH_HISTORY", 6, ul.b.P(ContextType.SEARCH_HISTORY), null, "search_history", 80);
        f66711l = pVar7;
        p pVar8 = new p("BROWSER_HISTORY", 7, ul.b.P(ContextType.BROWSER_HISTORY), null, "browser_history", 80);
        f66712m = pVar8;
        p pVar9 = new p("CALENDAR", 8, ul.b.P(ContextType.CALENDAR_EVENTS), "android.permission.READ_CALENDAR", "calendar_events", 80);
        n = pVar9;
        p pVar10 = new p("CONTACTS", 9, ul.b.P(ContextType.CONTACTS), "android.permission.READ_CONTACTS", "contacts", 80);
        o = pVar10;
        p pVar11 = new p("CONNECTIVITY", 10, ul.b.P(ContextType.CONNECTIVITY), "android.permission.READ_PHONE_STATE", "connectivity", 16);
        f66713p = pVar11;
        p pVar12 = new p("APP_USAGE", 11, ul.b.P(contextType), "android.permission.PACKAGE_USAGE_STATS", "app_usage", 64);
        f66714q = pVar12;
        p[] pVarArr = {pVar, pVar2, pVar3, pVar4, pVar5, pVar6, pVar7, pVar8, pVar9, pVar10, pVar11, pVar12};
        f66715r = pVarArr;
        f66716s = EnumEntriesKt.a(pVarArr);
        f66705f = new br.c();
    }

    public p(String str, int i5, List list, String str2, String str3, int i11) {
        boolean z11 = (i11 & 16) == 0;
        boolean z12 = (i11 & 64) != 0;
        this.f66717a = list;
        this.f66718b = str2;
        this.f66719c = z11;
        this.f66720d = str3;
        this.f66721e = z12;
    }

    public static p valueOf(String str) {
        return (p) Enum.valueOf(p.class, str);
    }

    public static p[] values() {
        return (p[]) f66715r.clone();
    }

    public final String a(String str) {
        if (o.f66704a[ordinal()] == 1 && str.equalsIgnoreCase("nova")) {
            return null;
        }
        return this.f66718b;
    }
}
