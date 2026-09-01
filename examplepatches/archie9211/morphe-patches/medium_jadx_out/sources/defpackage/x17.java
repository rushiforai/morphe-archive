package defpackage;

import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import com.medium.reader.R;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x17 extends BaseAdapter {
    public int a = -1;
    public final /* synthetic */ y17 b;

    public x17(y17 y17Var) {
        this.b = y17Var;
        a();
    }

    public final void a() {
        lx7 lx7Var = this.b.c;
        sx7 sx7Var = lx7Var.v;
        if (sx7Var != null) {
            lx7Var.i();
            ArrayList arrayList = lx7Var.j;
            int size = arrayList.size();
            for (int i = 0; i < size; i++) {
                if (((sx7) arrayList.get(i)) == sx7Var) {
                    this.a = i;
                    return;
                }
            }
        }
        this.a = -1;
    }

    @Override // android.widget.Adapter
    /* JADX INFO: renamed from: b, reason: merged with bridge method [inline-methods] */
    public final sx7 getItem(int i) {
        lx7 lx7Var = this.b.c;
        lx7Var.i();
        ArrayList arrayList = lx7Var.j;
        int i2 = this.a;
        if (i2 >= 0 && i >= i2) {
            i++;
        }
        return (sx7) arrayList.get(i);
    }

    @Override // android.widget.Adapter
    public final int getCount() {
        lx7 lx7Var = this.b.c;
        lx7Var.i();
        int size = lx7Var.j.size();
        return this.a < 0 ? size : size - 1;
    }

    @Override // android.widget.Adapter
    public final long getItemId(int i) {
        return i;
    }

    @Override // android.widget.Adapter
    public final View getView(int i, View view, ViewGroup viewGroup) {
        if (view == null) {
            view = this.b.b.inflate(R.layout.abc_list_menu_item_layout, viewGroup, false);
        }
        ((ny7) view).a(getItem(i));
        return view;
    }

    @Override // android.widget.BaseAdapter
    public final void notifyDataSetChanged() {
        a();
        super.notifyDataSetChanged();
    }
}
