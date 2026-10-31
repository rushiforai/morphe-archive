package androidx.room;

import cl.u0;
import java.util.ArrayDeque;
import java.util.concurrent.Executor;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class x implements Executor {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15278a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayDeque f15279b;

    /* renamed from: c, reason: collision with root package name */
    public final Executor f15280c;

    /* renamed from: d, reason: collision with root package name */
    public Runnable f15281d;

    /* renamed from: e, reason: collision with root package name */
    public final Object f15282e;

    public x(Executor executor, int i5) {
        this.f15278a = i5;
        switch (i5) {
            case 1:
                this.f15280c = executor;
                this.f15279b = new ArrayDeque();
                this.f15282e = new Object();
                break;
            default:
                Intrinsics.g(executor, "executor");
                this.f15280c = executor;
                this.f15279b = new ArrayDeque();
                this.f15282e = new Object();
                break;
        }
    }

    public final void a() {
        switch (this.f15278a) {
            case 0:
                synchronized (this.f15282e) {
                    try {
                        Object objPoll = this.f15279b.poll();
                        Runnable runnable = (Runnable) objPoll;
                        this.f15281d = runnable;
                        if (objPoll != null) {
                            this.f15280c.execute(runnable);
                        }
                        Unit unit = Unit.f71706a;
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                return;
            default:
                Runnable runnable2 = (Runnable) this.f15279b.poll();
                this.f15281d = runnable2;
                if (runnable2 != null) {
                    this.f15280c.execute(runnable2);
                    return;
                }
                return;
        }
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable command) {
        switch (this.f15278a) {
            case 0:
                Intrinsics.g(command, "command");
                synchronized (this.f15282e) {
                    try {
                        this.f15279b.offer(new ae.c(1, command, this));
                        if (this.f15281d == null) {
                            a();
                        }
                        Unit unit = Unit.f71706a;
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                return;
            default:
                synchronized (this.f15282e) {
                    try {
                        this.f15279b.add(new u0(10, this, command));
                        if (this.f15281d == null) {
                            a();
                        }
                    } finally {
                    }
                }
                return;
        }
    }
}
