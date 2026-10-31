package com.pgl.ssdk;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.json.JSONArray;

/* loaded from: classes.dex */
public class al {

    /* renamed from: a, reason: collision with root package name */
    private static volatile al f42284a;

    /* renamed from: b, reason: collision with root package name */
    private Context f42285b;

    /* renamed from: c, reason: collision with root package name */
    private List<Integer> f42286c = new ArrayList();

    private al(Context context) {
        this.f42285b = null;
        this.f42285b = context;
    }

    public static al a(Context context) {
        if (f42284a == null) {
            synchronized (al.class) {
                try {
                    if (f42284a == null) {
                        f42284a = new al(context);
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return f42284a;
    }

    public int b() {
        Intent intentRegisterReceiver = this.f42285b.registerReceiver(null, new IntentFilter("android.intent.action.BATTERY_CHANGED"));
        if (intentRegisterReceiver == null) {
            return 0;
        }
        return intentRegisterReceiver.getIntExtra("plugged", 0);
    }

    public int c() {
        if (this.f42285b.registerReceiver(null, new IntentFilter("android.intent.action.BATTERY_CHANGED")) == null) {
            return 0;
        }
        return Math.round(((r0.getIntExtra("level", 0) / r0.getIntExtra("scale", 0)) * 100.0f) * 10.0f) / 10;
    }

    public synchronized String d() {
        if (this.f42286c.size() <= 0) {
            return "-1";
        }
        return String.valueOf(this.f42286c.get(r0.size() - 1).intValue() % 10000);
    }

    public synchronized String e() {
        return new JSONArray((Collection) this.f42286c).toString();
    }

    @SuppressLint({"DefaultLocale"})
    public int f() {
        int iC;
        int iB = 0;
        try {
            synchronized (this) {
                iB = b();
                iC = c();
            }
            return (iB * 10000) + iC;
        } catch (Exception unused) {
            return iB * 10000;
        }
    }

    public void a() {
        int iF = f();
        if (iF == -1) {
            return;
        }
        this.f42286c.add(Integer.valueOf(iF));
        try {
            int size = this.f42286c.size();
            if (size > 20) {
                ArrayList arrayList = new ArrayList(this.f42286c.subList(size - 10, size));
                this.f42286c.clear();
                this.f42286c = arrayList;
            }
        } catch (Throwable unused) {
        }
    }
}
