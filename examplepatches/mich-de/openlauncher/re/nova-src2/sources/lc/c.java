package lc;

import android.content.ComponentName;
import android.content.Context;
import android.os.IBinder;
import com.digitalturbine.ignite.cl.aidl.IIgniteServiceAPI;

/* loaded from: classes2.dex */
public abstract class c implements a {

    /* renamed from: a, reason: collision with root package name */
    public final a f74844a;

    /* renamed from: b, reason: collision with root package name */
    public pc.a f74845b;

    public c(a aVar, pc.a aVar2) {
        this.f74844a = aVar;
        this.f74845b = aVar2;
        aVar.b(this);
        aVar.a(this);
    }

    @Override // lc.a
    public boolean a() {
        return this.f74844a.a();
    }

    @Override // lc.a
    public void b() {
        this.f74844a.b();
    }

    @Override // lc.a
    public boolean c() {
        return this.f74844a.c();
    }

    @Override // lc.a
    public String d() {
        return null;
    }

    @Override // lc.a
    public void destroy() {
        this.f74845b = null;
        this.f74844a.destroy();
    }

    @Override // lc.a
    public final String e() {
        return this.f74844a.e();
    }

    @Override // lc.a
    public boolean f() {
        return this.f74844a.f();
    }

    @Override // lc.a
    public Context g() {
        return this.f74844a.g();
    }

    @Override // lc.a
    public boolean h() {
        return this.f74844a.h();
    }

    @Override // lc.a
    public String i() {
        return null;
    }

    @Override // lc.a
    public boolean j() {
        return false;
    }

    @Override // lc.a
    public IIgniteServiceAPI k() {
        return this.f74844a.k();
    }

    @Override // pc.b
    public void onCredentialsRequestFailed(String str) {
        this.f74844a.onCredentialsRequestFailed(str);
    }

    @Override // pc.b
    public void onCredentialsRequestSuccess(String str, String str2) {
        this.f74844a.onCredentialsRequestSuccess(str, str2);
    }

    @Override // android.content.ServiceConnection
    public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        this.f74844a.onServiceConnected(componentName, iBinder);
    }

    @Override // android.content.ServiceConnection
    public void onServiceDisconnected(ComponentName componentName) {
        this.f74844a.onServiceDisconnected(componentName);
    }

    @Override // lc.a
    public void a(String str) {
        pc.a aVar = this.f74845b;
        if (aVar != null) {
            aVar.onIgniteServiceAuthenticationFailed(str);
        }
    }

    @Override // lc.a
    public void b(String str) {
        pc.a aVar = this.f74845b;
        if (aVar != null) {
            aVar.onIgniteServiceConnectionFailed(str);
        }
    }

    @Override // lc.a
    public void c(String str) {
        pc.a aVar = this.f74845b;
        if (aVar != null) {
            aVar.onIgniteServiceAuthenticated(str);
        }
    }

    @Override // lc.a
    public final void a(c cVar) {
        this.f74844a.a(cVar);
    }

    @Override // lc.a
    public final void b(c cVar) {
        this.f74844a.b(cVar);
    }

    @Override // lc.a
    public void c(ComponentName componentName, IBinder iBinder) {
        pc.a aVar = this.f74845b;
        if (aVar != null) {
            aVar.onIgniteServiceConnected(componentName, iBinder);
        }
    }
}
