package defpackage;

import android.view.WindowInsets;
import android.view.WindowInsetsAnimation;
import android.view.WindowInsetsAnimation$Callback;
import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c4f extends WindowInsetsAnimation$Callback {
    public final up1 a;
    public List b;
    public ArrayList c;
    public final HashMap d;

    public c4f(up1 up1Var) {
        super(up1Var.b);
        this.d = new HashMap();
        this.a = up1Var;
    }

    public final f4f a(WindowInsetsAnimation windowInsetsAnimation) {
        HashMap map = this.d;
        f4f f4fVar = (f4f) map.get(windowInsetsAnimation);
        if (f4fVar != null) {
            return f4fVar;
        }
        f4f f4fVar2 = new f4f(0, null, 0L);
        f4fVar2.a = new d4f(windowInsetsAnimation);
        map.put(windowInsetsAnimation, f4fVar2);
        return f4fVar2;
    }

    public final void onEnd(WindowInsetsAnimation windowInsetsAnimation) {
        this.a.d(a(windowInsetsAnimation));
        this.d.remove(windowInsetsAnimation);
    }

    public final void onPrepare(WindowInsetsAnimation windowInsetsAnimation) {
        this.a.e(a(windowInsetsAnimation));
    }

    public final WindowInsets onProgress(WindowInsets windowInsets, List list) {
        ArrayList arrayList = this.c;
        if (arrayList == null) {
            ArrayList arrayList2 = new ArrayList(list.size());
            this.c = arrayList2;
            this.b = DesugarCollections.unmodifiableList(arrayList2);
        } else {
            arrayList.clear();
        }
        for (int size = list.size() - 1; size >= 0; size--) {
            WindowInsetsAnimation windowInsetsAnimation = (WindowInsetsAnimation) list.get(size);
            f4f f4fVarA = a(windowInsetsAnimation);
            f4fVarA.a.e(windowInsetsAnimation.getFraction());
            this.c.add(f4fVarA);
        }
        return this.a.f(z4f.h(windowInsets, null), this.b).g();
    }

    public final WindowInsetsAnimation.Bounds onStart(WindowInsetsAnimation windowInsetsAnimation, WindowInsetsAnimation.Bounds bounds) {
        mya myaVarG = this.a.g(a(windowInsetsAnimation), new mya(bounds));
        myaVarG.getClass();
        wl.c();
        return wl.a(((b36) myaVarG.b).e(), ((b36) myaVarG.c).e());
    }
}
