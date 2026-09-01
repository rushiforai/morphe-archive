package defpackage;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import androidx.appcompat.view.menu.ListMenuItemView;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ix7 extends BaseAdapter {
    public final lx7 a;
    public int b = -1;
    public boolean c;
    public final boolean d;
    public final LayoutInflater e;
    public final int f;

    public ix7(lx7 lx7Var, LayoutInflater layoutInflater, boolean z, int i) {
        this.d = z;
        this.e = layoutInflater;
        this.a = lx7Var;
        this.f = i;
        a();
    }

    public final void a() {
        lx7 lx7Var = this.a;
        sx7 sx7Var = lx7Var.v;
        if (sx7Var != null) {
            lx7Var.i();
            ArrayList arrayList = lx7Var.j;
            int size = arrayList.size();
            for (int i = 0; i < size; i++) {
                if (((sx7) arrayList.get(i)) == sx7Var) {
                    this.b = i;
                    return;
                }
            }
        }
        this.b = -1;
    }

    @Override // android.widget.Adapter
    /* JADX INFO: renamed from: b, reason: merged with bridge method [inline-methods] */
    public final sx7 getItem(int i) {
        ArrayList arrayListL;
        boolean z = this.d;
        lx7 lx7Var = this.a;
        if (z) {
            lx7Var.i();
            arrayListL = lx7Var.j;
        } else {
            arrayListL = lx7Var.l();
        }
        int i2 = this.b;
        if (i2 >= 0 && i >= i2) {
            i++;
        }
        return (sx7) arrayListL.get(i);
    }

    @Override // android.widget.Adapter
    public final int getCount() {
        ArrayList arrayListL;
        boolean z = this.d;
        lx7 lx7Var = this.a;
        if (z) {
            lx7Var.i();
            arrayListL = lx7Var.j;
        } else {
            arrayListL = lx7Var.l();
        }
        return this.b < 0 ? arrayListL.size() : arrayListL.size() - 1;
    }

    @Override // android.widget.Adapter
    public final long getItemId(int i) {
        return i;
    }

    @Override // android.widget.Adapter
    public final View getView(int i, View view, ViewGroup viewGroup) {
        boolean z = false;
        if (view == null) {
            view = this.e.inflate(this.f, viewGroup, false);
        }
        int i2 = getItem(i).b;
        int i3 = i - 1;
        int i4 = i3 >= 0 ? getItem(i3).b : i2;
        ListMenuItemView listMenuItemView = (ListMenuItemView) view;
        if (this.a.m() && i2 != i4) {
            z = true;
        }
        listMenuItemView.setGroupDividerEnabled(z);
        ny7 ny7Var = (ny7) view;
        if (this.c) {
            listMenuItemView.setForceShowIcon(true);
        }
        ny7Var.a(getItem(i));
        return view;
    }

    @Override // android.widget.BaseAdapter
    public final void notifyDataSetChanged() {
        a();
        super.notifyDataSetChanged();
    }
}
