package j$.util.stream;

import j$.util.Spliterator;
import java.util.Deque;
import java.util.function.Consumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class i3 extends j3 {
    @Override // j$.util.Spliterator
    public final void forEachRemaining(Consumer consumer) {
        if (this.a == null) {
            return;
        }
        if (this.d != null) {
            while (tryAdvance(consumer)) {
            }
            return;
        }
        Spliterator spliterator = this.c;
        if (spliterator != null) {
            spliterator.forEachRemaining(consumer);
            return;
        }
        Deque dequeB = b();
        while (true) {
            g2 g2VarA = j3.a(dequeB);
            if (g2VarA == null) {
                this.a = null;
                return;
            }
            g2VarA.forEach(consumer);
        }
    }

    @Override // j$.util.Spliterator
    public final boolean tryAdvance(Consumer consumer) {
        g2 g2VarA;
        if (!c()) {
            return false;
        }
        boolean zTryAdvance = this.d.tryAdvance(consumer);
        if (!zTryAdvance) {
            if (this.c == null && (g2VarA = j3.a(this.e)) != null) {
                Spliterator spliterator = g2VarA.spliterator();
                this.d = spliterator;
                return spliterator.tryAdvance(consumer);
            }
            this.a = null;
        }
        return zTryAdvance;
    }
}
