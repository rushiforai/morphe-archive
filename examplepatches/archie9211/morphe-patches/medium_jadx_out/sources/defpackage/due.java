package defpackage;

import android.content.Context;
import android.os.Parcelable;
import android.util.SparseArray;
import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class due extends zt {
    public final View A;
    public final cd8 B;
    public pob C;
    public x45 D;
    public x45 E;
    public x45 F;

    public due(Context context, x45 x45Var, n65 n65Var, qob qobVar, int i, mx8 mx8Var) {
        View view = (View) x45Var.invoke(context);
        cd8 cd8Var = new cd8();
        super(context, n65Var, i, cd8Var, view, mx8Var);
        this.A = view;
        this.B = cd8Var;
        setClipChildren(false);
        String strValueOf = String.valueOf(i);
        Object objD = qobVar != null ? qobVar.d(strValueOf) : null;
        SparseArray<Parcelable> sparseArray = objD instanceof SparseArray ? (SparseArray) objD : null;
        if (sparseArray != null) {
            view.restoreHierarchyState(sparseArray);
        }
        if (qobVar != null) {
            setSavableRegistryEntry(qobVar.b(strValueOf, new yt(this, 2)));
        }
        fn fnVar = fn.n;
        this.D = fnVar;
        this.E = fnVar;
        this.F = fnVar;
    }

    private final void setSavableRegistryEntry(pob pobVar) {
        pob pobVar2 = this.C;
        if (pobVar2 != null) {
            ((vwa) pobVar2).F();
        }
        this.C = pobVar;
    }

    public final void g() {
        setSavableRegistryEntry(null);
    }

    public final cd8 getDispatcher() {
        return this.B;
    }

    public final x45 getReleaseBlock() {
        return this.F;
    }

    public final x45 getResetBlock() {
        return this.E;
    }

    public x0 getSubCompositionView() {
        return null;
    }

    public final x45 getUpdateBlock() {
        return this.D;
    }

    public final void setReleaseBlock(x45 x45Var) {
        this.F = x45Var;
        setRelease(new yt(this, 3));
    }

    public final void setResetBlock(x45 x45Var) {
        this.E = x45Var;
        setReset(new yt(this, 4));
    }

    public final void setUpdateBlock(x45 x45Var) {
        this.D = x45Var;
        setUpdate(new yt(this, 5));
    }

    public View getViewRoot() {
        return this;
    }
}
