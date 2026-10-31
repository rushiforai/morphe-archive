package q;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import androidx.appcompat.view.menu.ListMenuItemView;
import java.util.ArrayList;

/* loaded from: classes2.dex */
public final class h extends BaseAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final k f83225a;

    /* renamed from: b, reason: collision with root package name */
    public int f83226b = -1;

    /* renamed from: c, reason: collision with root package name */
    public boolean f83227c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f83228d;

    /* renamed from: e, reason: collision with root package name */
    public final LayoutInflater f83229e;

    /* renamed from: f, reason: collision with root package name */
    public final int f83230f;

    public h(k kVar, LayoutInflater layoutInflater, boolean z11, int i5) {
        this.f83228d = z11;
        this.f83229e = layoutInflater;
        this.f83225a = kVar;
        this.f83230f = i5;
        a();
    }

    public final void a() {
        k kVar = this.f83225a;
        m mVar = kVar.f83251v;
        if (mVar != null) {
            kVar.i();
            ArrayList arrayList = kVar.f83241j;
            int size = arrayList.size();
            for (int i5 = 0; i5 < size; i5++) {
                if (((m) arrayList.get(i5)) == mVar) {
                    this.f83226b = i5;
                    return;
                }
            }
        }
        this.f83226b = -1;
    }

    @Override // android.widget.Adapter
    /* renamed from: b, reason: merged with bridge method [inline-methods] */
    public final m getItem(int i5) {
        ArrayList arrayListL;
        boolean z11 = this.f83228d;
        k kVar = this.f83225a;
        if (z11) {
            kVar.i();
            arrayListL = kVar.f83241j;
        } else {
            arrayListL = kVar.l();
        }
        int i11 = this.f83226b;
        if (i11 >= 0 && i5 >= i11) {
            i5++;
        }
        return (m) arrayListL.get(i5);
    }

    @Override // android.widget.Adapter
    public final int getCount() {
        ArrayList arrayListL;
        boolean z11 = this.f83228d;
        k kVar = this.f83225a;
        if (z11) {
            kVar.i();
            arrayListL = kVar.f83241j;
        } else {
            arrayListL = kVar.l();
        }
        return this.f83226b < 0 ? arrayListL.size() : arrayListL.size() - 1;
    }

    @Override // android.widget.Adapter
    public final long getItemId(int i5) {
        return i5;
    }

    @Override // android.widget.Adapter
    public final View getView(int i5, View view, ViewGroup viewGroup) {
        if (view == null) {
            view = this.f83229e.inflate(this.f83230f, viewGroup, false);
        }
        int i11 = getItem(i5).f83258b;
        int i12 = i5 - 1;
        ListMenuItemView listMenuItemView = (ListMenuItemView) view;
        boolean z11 = this.f83225a.m() && i11 != (i12 >= 0 ? getItem(i12).f83258b : i11);
        ImageView imageView = listMenuItemView.f13683h;
        if (imageView != null) {
            imageView.setVisibility((listMenuItemView.o || !z11) ? 8 : 0);
        }
        x xVar = (x) view;
        if (this.f83227c) {
            listMenuItemView.f13690q = true;
            listMenuItemView.f13688m = true;
        }
        xVar.d(getItem(i5));
        return view;
    }

    @Override // android.widget.BaseAdapter
    public final void notifyDataSetChanged() {
        a();
        super.notifyDataSetChanged();
    }
}
