package defpackage;

import java.util.concurrent.Executor;
import org.chromium.net.InlineExecutionProhibitedException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qa6 implements Executor {
    public final /* synthetic */ int a;
    public final Executor b;

    public /* synthetic */ qa6(Executor executor, int i) {
        this.a = i;
        this.b = executor;
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        int i = this.a;
        Executor executor = this.b;
        switch (i) {
            case 0:
                pa6 pa6Var = new pa6(runnable, Thread.currentThread());
                executor.execute(pa6Var);
                InlineExecutionProhibitedException inlineExecutionProhibitedException = (InlineExecutionProhibitedException) pa6Var.d;
                if (inlineExecutionProhibitedException != null) {
                    throw inlineExecutionProhibitedException;
                }
                pa6Var.c = null;
                return;
            default:
                executor.execute(new t86(1, runnable));
                return;
        }
    }
}
