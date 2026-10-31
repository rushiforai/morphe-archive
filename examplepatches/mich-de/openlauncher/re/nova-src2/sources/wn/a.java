package wn;

import android.content.Context;
import android.database.ContentObserver;
import android.media.AudioManager;
import android.os.Handler;
import java.util.Iterator;
import o2.f;
import o9.n4;
import un.k;
import xn.c;

/* loaded from: classes.dex */
public final class a extends ContentObserver {

    /* renamed from: a, reason: collision with root package name */
    public final Context f94623a;

    /* renamed from: b, reason: collision with root package name */
    public final AudioManager f94624b;

    /* renamed from: c, reason: collision with root package name */
    public final f f94625c;

    /* renamed from: d, reason: collision with root package name */
    public final n4 f94626d;

    /* renamed from: e, reason: collision with root package name */
    public float f94627e;

    public a(Handler handler, Context context, f fVar, n4 n4Var) {
        super(handler);
        this.f94623a = context;
        this.f94624b = (AudioManager) context.getSystemService("audio");
        this.f94625c = fVar;
        this.f94626d = n4Var;
    }

    public final float a() {
        AudioManager audioManager = this.f94624b;
        int streamVolume = audioManager.getStreamVolume(3);
        int streamMaxVolume = audioManager.getStreamMaxVolume(3);
        this.f94625c.getClass();
        if (streamMaxVolume <= 0 || streamVolume <= 0) {
            return 0.0f;
        }
        float f11 = streamVolume / streamMaxVolume;
        if (f11 > 1.0f) {
            return 1.0f;
        }
        return f11;
    }

    public final void b() {
        float f11 = this.f94627e;
        n4 n4Var = this.f94626d;
        n4Var.f80035a = f11;
        if (((c) n4Var.f80038d) == null) {
            n4Var.f80038d = c.c();
        }
        Iterator it = ((c) n4Var.f80038d).a().iterator();
        while (it.hasNext()) {
            ((k) it.next()).f().a(f11);
        }
    }

    @Override // android.database.ContentObserver
    public final void onChange(boolean z11) {
        super.onChange(z11);
        float fA = a();
        if (fA != this.f94627e) {
            this.f94627e = fA;
            b();
        }
    }
}
