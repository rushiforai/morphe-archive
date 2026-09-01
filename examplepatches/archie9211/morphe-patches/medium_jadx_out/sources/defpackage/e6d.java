package defpackage;

import android.view.ActionMode;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e6d {
    public final String a;
    public final az5 b;
    public final boolean c;
    public final y5d d;
    public final boolean e;
    public final ActionMode.Callback f;
    public final boolean g;

    public e6d(String str, az5 az5Var, boolean z, y5d y5dVar, boolean z2, ActionMode.Callback callback, boolean z3) {
        az5Var.getClass();
        y5dVar.getClass();
        this.a = str;
        this.b = az5Var;
        this.c = z;
        this.d = y5dVar;
        this.e = z2;
        this.f = callback;
        this.g = z3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e6d)) {
            return false;
        }
        e6d e6dVar = (e6d) obj;
        return g76.L(this.a, e6dVar.a) && g76.L(this.b, e6dVar.b) && this.c == e6dVar.c && this.d == e6dVar.d && this.e == e6dVar.e && g76.L(this.f, e6dVar.f) && this.g == e6dVar.g;
    }

    public final int hashCode() {
        int iHashCode = (((this.d.hashCode() + ((ka1.b(this.b, this.a.hashCode() * 31, 31) + (this.c ? 1231 : 1237)) * 31)) * 31) + (this.e ? 1231 : 1237)) * 31;
        ActionMode.Callback callback = this.f;
        return ((iHashCode + (callback == null ? 0 : callback.hashCode())) * 31) + (this.g ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("SyntaxHighlightUiModel(text=");
        sb.append(this.a);
        sb.append(", highlights=");
        sb.append(this.b);
        sb.append(", isInEditMode=");
        sb.append(this.c);
        sb.append(", language=");
        sb.append(this.d);
        sb.append(", isFocused=");
        sb.append(this.e);
        sb.append(", actionModeCallback=");
        sb.append(this.f);
        sb.append(", shouldInterceptTouchEvents=");
        return lv8.t(sb, this.g, ")");
    }

    public /* synthetic */ e6d(String str, az5 az5Var, boolean z, y5d y5dVar, boolean z2, ActionMode.Callback callback, boolean z3, int i) {
        this(str, az5Var, z, y5dVar, (i & 16) != 0 ? false : z2, (i & 32) != 0 ? null : callback, z3);
    }
}
