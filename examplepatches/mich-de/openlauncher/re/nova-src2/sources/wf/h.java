package wf;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.instabridge.ai.chat.ui.c0;
import java.util.ArrayDeque;
import java.util.concurrent.CopyOnWriteArraySet;

/* loaded from: classes3.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public final q f94327a;

    /* renamed from: b, reason: collision with root package name */
    public final s f94328b;

    /* renamed from: c, reason: collision with root package name */
    public final f f94329c;

    /* renamed from: d, reason: collision with root package name */
    public final CopyOnWriteArraySet f94330d;

    /* renamed from: e, reason: collision with root package name */
    public final ArrayDeque f94331e;

    /* renamed from: f, reason: collision with root package name */
    public final ArrayDeque f94332f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f94333g;

    public h(Looper looper, q qVar, f fVar) {
        this(new CopyOnWriteArraySet(), looper, qVar, fVar);
    }

    public final void a(Object obj) {
        if (this.f94333g) {
            return;
        }
        obj.getClass();
        this.f94330d.add(new g(obj));
    }

    public final void b() {
        ArrayDeque arrayDeque = this.f94332f;
        if (arrayDeque.isEmpty()) {
            return;
        }
        s sVar = this.f94328b;
        if (!sVar.f94370a.hasMessages(0)) {
            sVar.getClass();
            r rVarB = s.b();
            Message messageObtainMessage = sVar.f94370a.obtainMessage(0);
            rVarB.f94368a = messageObtainMessage;
            Handler handler = sVar.f94370a;
            messageObtainMessage.getClass();
            handler.sendMessageAtFrontOfQueue(messageObtainMessage);
            rVarB.a();
        }
        ArrayDeque arrayDeque2 = this.f94331e;
        boolean zIsEmpty = arrayDeque2.isEmpty();
        arrayDeque2.addAll(arrayDeque);
        arrayDeque.clear();
        if (zIsEmpty) {
            while (!arrayDeque2.isEmpty()) {
                ((Runnable) arrayDeque2.peekFirst()).run();
                arrayDeque2.removeFirst();
            }
        }
    }

    public final void c(int i5, e eVar) {
        this.f94332f.add(new c0(new CopyOnWriteArraySet(this.f94330d), i5, eVar, 9));
    }

    public final void d(int i5, e eVar) {
        c(i5, eVar);
        b();
    }

    public h(CopyOnWriteArraySet copyOnWriteArraySet, Looper looper, q qVar, f fVar) {
        this.f94327a = qVar;
        this.f94330d = copyOnWriteArraySet;
        this.f94329c = fVar;
        this.f94331e = new ArrayDeque();
        this.f94332f = new ArrayDeque();
        this.f94328b = qVar.a(looper, new ha.e(this, 1));
    }
}
