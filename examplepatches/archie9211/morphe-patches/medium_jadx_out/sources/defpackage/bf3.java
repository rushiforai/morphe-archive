package defpackage;

import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bf3 implements Executor {
    public static final bf3 b = new bf3(0);
    public static final /* synthetic */ bf3 c = new bf3(1);
    public static final bf3 d = new bf3(2);
    public static final /* synthetic */ bf3 e = new bf3(3);
    public final /* synthetic */ int a;

    public /* synthetic */ bf3(int i) {
        this.a = i;
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        switch (this.a) {
            case 0:
                runnable.run();
                break;
            case 1:
                runnable.run();
                break;
            case 2:
                runnable.run();
                break;
            case 3:
                runnable.run();
                break;
            case 4:
                new Thread(runnable).start();
                break;
            default:
                runnable.run();
                break;
        }
    }
}
