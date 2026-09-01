package defpackage;

import android.view.ActionMode;
import android.webkit.JavascriptInterface;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a6d {
    public final /* synthetic */ l78 a;
    public final /* synthetic */ e6d b;
    public final /* synthetic */ b6d c;
    public final /* synthetic */ l78 d;
    public final /* synthetic */ g6d e;

    public a6d(l78 l78Var, e6d e6dVar, b6d b6dVar, l78 l78Var2, g6d g6dVar) {
        this.a = l78Var;
        this.b = e6dVar;
        this.c = b6dVar;
        this.d = l78Var2;
        this.e = g6dVar;
    }

    @JavascriptInterface
    public final void onHighlightClicked(int i) {
        ek7.L(new hz8(i, 2, this.c));
    }

    @JavascriptInterface
    public final void onLoaded() {
        ek7.L(new z7b(this.a, 16));
    }

    @JavascriptInterface
    public final void onTextChanged(final String str, final int i, final int i2, final String str2) {
        str.getClass();
        final e6d e6dVar = this.b;
        final b6d b6dVar = this.c;
        final l78 l78Var = this.d;
        final g6d g6dVar = this.e;
        ek7.L(new m45() { // from class: z5d
            @Override // defpackage.m45
            public final Object invoke() {
                Object next;
                Iterator<E> it2 = y5d.getEntries().iterator();
                while (true) {
                    if (!it2.hasNext()) {
                        next = null;
                        break;
                    }
                    next = it2.next();
                    if (g76.L(((y5d) next).getLanguageName(), str2)) {
                        break;
                    }
                }
                y5d y5dVar = (y5d) next;
                e6d e6dVar2 = e6dVar;
                if (y5dVar == null) {
                    y5dVar = e6dVar2.d;
                }
                int i3 = i;
                int i4 = i2;
                l78 l78Var2 = l78Var;
                if (i3 == i4) {
                    ActionMode actionMode = (ActionMode) l78Var2.getValue();
                    if (actionMode != null) {
                        actionMode.finish();
                    }
                    l78Var2.setValue(null);
                } else {
                    ActionMode.Callback callback = e6dVar2.f;
                    if (callback != null) {
                        l78Var2.setValue(g6dVar.startActionMode(callback, 1));
                    }
                }
                b6dVar.i(str, lk7.q(i3, i4), y5dVar);
                return c1e.a;
            }
        });
    }
}
