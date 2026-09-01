package defpackage;

import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t5g implements ThreadFactory {
    public final String a;
    public final Integer b;
    public final ThreadFactory c = Executors.defaultThreadFactory();

    public t5g(String str, Integer num) {
        this.a = str;
        this.b = num;
    }

    @Override // java.util.concurrent.ThreadFactory
    public final Thread newThread(Runnable runnable) {
        Thread threadNewThread = this.c.newThread(runnable);
        threadNewThread.getClass();
        Integer num = this.b;
        if (num != null) {
            threadNewThread.setPriority(num.intValue());
        }
        String name = threadNewThread.getName();
        String strValueOf = String.valueOf(name);
        String str = this.a;
        StringBuilder sb = new StringBuilder(str.length() + 1 + strValueOf.length());
        sb.append(str);
        sb.append("_");
        sb.append(name);
        threadNewThread.setName(sb.toString());
        return threadNewThread;
    }
}
