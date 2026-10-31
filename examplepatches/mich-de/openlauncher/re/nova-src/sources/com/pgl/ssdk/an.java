package com.pgl.ssdk;

import android.content.Context;
import android.text.TextUtils;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/* loaded from: classes.dex */
public class an {

    /* renamed from: a, reason: collision with root package name */
    public static int f42301a = -1;

    /* renamed from: b, reason: collision with root package name */
    public static String f42302b = null;

    /* renamed from: c, reason: collision with root package name */
    public static List<String> f42303c = null;

    /* renamed from: d, reason: collision with root package name */
    private static String f42304d = "api16-access-ttp.tiktokpangle.us";

    /* renamed from: e, reason: collision with root package name */
    public static final String[] f42305e = {"api16-access-ttp.tiktokpangle.us", "api16-access-ttp-b.tiktokpangle.us", "api16-access-ttp.tiktokpangle-b.us", "api16-access-ttp-b.tiktokpangle-b.us"};

    /* renamed from: f, reason: collision with root package name */
    private static int f42306f = Integer.MIN_VALUE;

    /* renamed from: g, reason: collision with root package name */
    private static int f42307g = 0;

    /* renamed from: h, reason: collision with root package name */
    public static String f42308h = "";

    public static String a() {
        return f42301a == 1 ? "VA" : "SG";
    }

    public static String b() {
        return f42308h;
    }

    public static void c() {
        f42307g = 0;
    }

    public static String a(Context context) {
        List<String> list;
        if (TextUtils.isEmpty(f42302b)) {
            try {
                if (f42306f == Integer.MIN_VALUE) {
                    f42306f = aw.a(context, "domain_index", 0);
                }
                String[] strArr = f42305e;
                return strArr[f42306f % strArr.length];
            } catch (Throwable unused) {
                return f42304d;
            }
        }
        if (f42307g <= 0 || (list = f42303c) == null || list.isEmpty()) {
            return f42302b;
        }
        List<String> list2 = f42303c;
        return list2.get((f42307g - 1) % list2.size());
    }

    public static void b(Context context) {
        if (TextUtils.isEmpty(f42302b)) {
            int i5 = f42306f;
            if (i5 >= Integer.MAX_VALUE) {
                f42306f = 0;
                return;
            }
            int i11 = i5 + 1;
            f42306f = i11;
            aw.b(context, "domain_index", i11);
            return;
        }
        List<String> list = f42303c;
        if (list == null || list.isEmpty() || f42307g >= f42303c.size()) {
            f42307g = 0;
        } else {
            f42307g++;
        }
    }

    public static void a(int i5) {
        f42301a = i5;
    }

    public static void b(String str) {
        f42308h = str;
    }

    public static void a(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        f42302b = str;
    }

    public static void a(Set<String> set) {
        if (set != null) {
            f42303c = new ArrayList(set);
        }
    }
}
