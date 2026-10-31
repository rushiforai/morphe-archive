package io.branch.requery.android.database.sqlite;

import android.util.Log;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: b, reason: collision with root package name */
    public static final a f61801b = new a();

    /* renamed from: a, reason: collision with root package name */
    public Throwable f61802a;

    public final void a() {
        if (this != f61801b) {
            this.f61802a = new Throwable("Explicit termination method 'close' not called");
        }
    }

    public final void b() {
        if (this.f61802a != null) {
            Log.w("SQLite", "A resource was acquired at attached stack trace but never released. See java.io.Closeable for information on avoiding resource leaks.", this.f61802a);
        }
    }
}
