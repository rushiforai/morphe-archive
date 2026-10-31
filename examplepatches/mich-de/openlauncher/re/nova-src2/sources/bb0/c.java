package bb0;

import b.i8;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f17800a;

    /* renamed from: b, reason: collision with root package name */
    public final za0.a f17801b;

    public c(int i5) {
        this.f17800a = i5;
        switch (i5) {
            case 1:
                this.f17801b = new e();
                new ConcurrentHashMap();
                new ThreadLocal();
                new a();
                break;
            default:
                this.f17801b = new i8(13);
                new ConcurrentHashMap();
                break;
        }
    }
}
