package defpackage;

import android.app.Activity;
import android.graphics.Rect;
import android.view.KeyEvent;
import android.view.View;
import java.util.concurrent.atomic.AtomicBoolean;
import sprig.b.g;
import sprig.i.b;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class fhf implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ fhf(KeyEvent.Callback callback, b bVar, int i) {
        this.a = i;
        this.c = callback;
        this.b = bVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        Object obj = this.c;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                b.a((b) obj2, (Rect) obj);
                break;
            case 1:
                b.a((Activity) obj, (b) obj2);
                break;
            case 2:
                b.a((View) obj, (b) obj2);
                break;
            default:
                g.a((AtomicBoolean) obj2, (x45) obj);
                break;
        }
    }

    public /* synthetic */ fhf(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }
}
