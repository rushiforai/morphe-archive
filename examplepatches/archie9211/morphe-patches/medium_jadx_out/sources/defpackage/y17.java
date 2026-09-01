package defpackage;

import android.content.Context;
import android.content.ContextWrapper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.WindowManager;
import android.widget.AdapterView;
import androidx.appcompat.view.menu.ExpandedMenuView;
import com.drew.metadata.photoshop.PhotoshopDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y17 implements ky7, AdapterView.OnItemClickListener {
    public Context a;
    public LayoutInflater b;
    public lx7 c;
    public ExpandedMenuView d;
    public jy7 e;
    public x17 f;

    public y17(ContextWrapper contextWrapper) {
        this.a = contextWrapper;
        this.b = LayoutInflater.from(contextWrapper);
    }

    @Override // defpackage.ky7
    public final void b(lx7 lx7Var, boolean z) {
        jy7 jy7Var = this.e;
        if (jy7Var != null) {
            jy7Var.b(lx7Var, z);
        }
    }

    @Override // defpackage.ky7
    public final boolean c(dvc dvcVar) {
        boolean zHasVisibleItems = dvcVar.hasVisibleItems();
        Context context = dvcVar.a;
        if (!zHasVisibleItems) {
            return false;
        }
        nx7 nx7Var = new nx7();
        nx7Var.a = dvcVar;
        ad adVar = new ad(context);
        wc wcVar = (wc) adVar.c;
        y17 y17Var = new y17(wcVar.a);
        nx7Var.c = y17Var;
        y17Var.e = nx7Var;
        dvcVar.b(y17Var, context);
        y17 y17Var2 = nx7Var.c;
        x17 x17Var = y17Var2.f;
        if (x17Var == null) {
            x17Var = new x17(y17Var2);
            y17Var2.f = x17Var;
        }
        wcVar.m = x17Var;
        wcVar.n = nx7Var;
        View view = dvcVar.o;
        if (view != null) {
            wcVar.e = view;
        } else {
            wcVar.c = dvcVar.n;
            wcVar.d = dvcVar.m;
        }
        wcVar.l = nx7Var;
        bd bdVarH = adVar.h();
        nx7Var.b = bdVarH;
        bdVarH.setOnDismissListener(nx7Var);
        WindowManager.LayoutParams attributes = nx7Var.b.getWindow().getAttributes();
        attributes.type = PhotoshopDirectory.TAG_INDEXED_COLOR_TABLE;
        attributes.flags |= 131072;
        nx7Var.b.show();
        jy7 jy7Var = this.e;
        if (jy7Var == null) {
            return true;
        }
        jy7Var.q(dvcVar);
        return true;
    }

    @Override // defpackage.ky7
    public final boolean d() {
        return false;
    }

    @Override // defpackage.ky7
    public final boolean f(sx7 sx7Var) {
        return false;
    }

    @Override // defpackage.ky7
    public final void g(jy7 jy7Var) {
        throw null;
    }

    @Override // defpackage.ky7
    public final boolean h(sx7 sx7Var) {
        return false;
    }

    @Override // defpackage.ky7
    public final void i() {
        x17 x17Var = this.f;
        if (x17Var != null) {
            x17Var.notifyDataSetChanged();
        }
    }

    @Override // defpackage.ky7
    public final void k(Context context, lx7 lx7Var) {
        if (this.a != null) {
            this.a = context;
            if (this.b == null) {
                this.b = LayoutInflater.from(context);
            }
        }
        this.c = lx7Var;
        x17 x17Var = this.f;
        if (x17Var != null) {
            x17Var.notifyDataSetChanged();
        }
    }

    @Override // android.widget.AdapterView.OnItemClickListener
    public final void onItemClick(AdapterView adapterView, View view, int i, long j) {
        this.c.q(this.f.getItem(i), this, 0);
    }
}
