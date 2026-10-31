package com.apm.insight.e;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import com.apm.insight.e;

/* loaded from: classes.dex */
public class a {

    /* renamed from: a, reason: collision with root package name */
    private static volatile a f21561a;

    /* renamed from: b, reason: collision with root package name */
    private com.apm.insight.e.a.b f21562b;

    /* renamed from: c, reason: collision with root package name */
    private SQLiteDatabase f21563c;

    private a() {
    }

    public static a a() {
        if (f21561a == null) {
            synchronized (a.class) {
                try {
                    if (f21561a == null) {
                        f21561a = new a();
                    }
                } finally {
                }
            }
        }
        return f21561a;
    }

    private void b() {
        if (this.f21562b == null) {
            a(e.g());
        }
    }

    public final synchronized void a(Context context) {
        try {
            this.f21563c = new b(context).getWritableDatabase();
        } finally {
            this.f21562b = new com.apm.insight.e.a.b();
        }
        this.f21562b = new com.apm.insight.e.a.b();
    }

    public final synchronized void a(com.apm.insight.d.a aVar) {
        b();
        com.apm.insight.e.a.b bVar = this.f21562b;
        if (bVar != null) {
            bVar.a(this.f21563c, aVar);
        }
    }

    public final synchronized boolean a(String str) {
        b();
        com.apm.insight.e.a.b bVar = this.f21562b;
        if (bVar == null) {
            return false;
        }
        return bVar.a(this.f21563c, str);
    }
}
