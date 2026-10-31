package wm;

import android.content.Context;
import java.io.FileOutputStream;
import java.util.concurrent.Callable;
import xm.o;

/* loaded from: classes.dex */
public final /* synthetic */ class a implements Callable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f94593a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f94594b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f94595c;

    public /* synthetic */ a(int i5, Object obj, Object obj2) {
        this.f94593a = i5;
        this.f94594b = obj;
        this.f94595c = obj2;
    }

    @Override // java.util.concurrent.Callable
    public final Object call() {
        switch (this.f94593a) {
            case 0:
                c cVar = (c) this.f94594b;
                cVar.f94606i.k((d) this.f94595c);
                return null;
            case 1:
                xm.c cVar2 = (xm.c) this.f94594b;
                xm.e eVar = (xm.e) this.f94595c;
                o oVar = cVar2.f96100b;
                synchronized (oVar) {
                    FileOutputStream fileOutputStreamOpenFileOutput = oVar.f96171a.openFileOutput(oVar.f96172b, 0);
                    try {
                        fileOutputStreamOpenFileOutput.write(eVar.f96109a.toString().getBytes("UTF-8"));
                    } finally {
                        fileOutputStreamOpenFileOutput.close();
                    }
                }
                return null;
            default:
                return ((x7.c) this.f94594b).h((Context) this.f94595c);
        }
    }
}
