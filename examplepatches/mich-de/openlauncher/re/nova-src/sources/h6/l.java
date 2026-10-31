package h6;

import android.graphics.drawable.Drawable;
import java.util.ArrayDeque;

/* loaded from: classes2.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public boolean f59403a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f59404b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f59405c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f59406d;

    public l() {
        this.f59403a = true;
        this.f59406d = new ArrayDeque();
    }

    public void a() {
        r.o oVar = (r.o) this.f59406d;
        Drawable checkMarkDrawable = oVar.getCheckMarkDrawable();
        if (checkMarkDrawable != null) {
            if (this.f59403a || this.f59404b) {
                Drawable drawableMutate = checkMarkDrawable.mutate();
                if (this.f59403a) {
                    drawableMutate.setTintList(null);
                }
                if (this.f59404b) {
                    drawableMutate.setTintMode(null);
                }
                if (drawableMutate.isStateful()) {
                    drawableMutate.setState(oVar.getDrawableState());
                }
                oVar.setCheckMarkDrawable(drawableMutate);
            }
        }
    }

    public void b() {
        ArrayDeque arrayDeque = (ArrayDeque) this.f59406d;
        if (this.f59405c) {
            return;
        }
        try {
            this.f59405c = true;
            while (!arrayDeque.isEmpty()) {
                if (!(this.f59404b || !this.f59403a)) {
                    break;
                }
                Runnable runnable = (Runnable) arrayDeque.poll();
                if (runnable != null) {
                    runnable.run();
                }
            }
        } finally {
            this.f59405c = false;
        }
    }

    public l(r.o oVar) {
        this.f59403a = false;
        this.f59404b = false;
        this.f59406d = oVar;
    }
}
