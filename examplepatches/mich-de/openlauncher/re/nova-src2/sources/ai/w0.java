package ai;

import android.content.SharedPreferences;
import android.os.SystemClock;
import java.io.File;
import java.util.HashMap;
import java.util.Objects;

/* loaded from: classes3.dex */
public final class w0 implements wf.i {

    /* renamed from: a, reason: collision with root package name */
    public long f13386a;

    /* renamed from: b, reason: collision with root package name */
    public long f13387b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f13388c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f13389d;

    /* renamed from: e, reason: collision with root package name */
    public Object f13390e;

    public w0(z0 z0Var, String str, long j11) {
        Objects.requireNonNull(z0Var);
        this.f13390e = z0Var;
        sg.w.e(str);
        this.f13389d = str;
        this.f13386a = j11;
    }

    @Override // wf.i
    public void a(fe.g1 g1Var) {
        if (this.f13388c) {
            b(d());
        }
        this.f13390e = g1Var;
    }

    public void b(long j11) {
        this.f13386a = j11;
        if (this.f13388c) {
            ((wf.q) this.f13389d).getClass();
            this.f13387b = SystemClock.elapsedRealtime();
        }
    }

    @Override // wf.i
    public fe.g1 c() {
        return (fe.g1) this.f13390e;
    }

    @Override // wf.i
    public long d() {
        long j11 = this.f13386a;
        if (!this.f13388c) {
            return j11;
        }
        ((wf.q) this.f13389d).getClass();
        long jElapsedRealtime = SystemClock.elapsedRealtime() - this.f13387b;
        return (((fe.g1) this.f13390e).f54797a == 1.0f ? wf.v.y(jElapsedRealtime) : jElapsedRealtime * r4.f54799c) + j11;
    }

    public void e() {
        if (this.f13388c) {
            return;
        }
        ((wf.q) this.f13389d).getClass();
        this.f13387b = SystemClock.elapsedRealtime();
        this.f13388c = true;
    }

    public long f() {
        if (!this.f13388c) {
            this.f13388c = true;
            z0 z0Var = (z0) this.f13390e;
            this.f13387b = z0Var.H().getLong((String) this.f13389d, this.f13386a);
        }
        return this.f13387b;
    }

    public void g(long j11) {
        SharedPreferences.Editor editorEdit = ((z0) this.f13390e).H().edit();
        editorEdit.putLong((String) this.f13389d, j11);
        editorEdit.apply();
        this.f13387b = j11;
    }

    public w0(wf.q qVar) {
        this.f13389d = qVar;
        this.f13390e = fe.g1.f54796d;
    }

    public w0(long j11, long j12, boolean z11, File file, HashMap map) {
        this.f13386a = j11;
        this.f13389d = file;
        this.f13387b = j12;
        this.f13390e = map;
        this.f13388c = z11;
    }
}
