package q;

import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import java.util.ArrayList;

/* loaded from: classes2.dex */
public final class f extends BaseAdapter {

    /* renamed from: a, reason: collision with root package name */
    public int f83217a = -1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ g f83218b;

    public f(g gVar) {
        this.f83218b = gVar;
        a();
    }

    public final void a() {
        k kVar = this.f83218b.f83221c;
        m mVar = kVar.f83251v;
        if (mVar != null) {
            kVar.i();
            ArrayList arrayList = kVar.f83241j;
            int size = arrayList.size();
            for (int i5 = 0; i5 < size; i5++) {
                if (((m) arrayList.get(i5)) == mVar) {
                    this.f83217a = i5;
                    return;
                }
            }
        }
        this.f83217a = -1;
    }

    @Override // android.widget.Adapter
    /* renamed from: b, reason: merged with bridge method [inline-methods] */
    public final m getItem(int i5) {
        g gVar = this.f83218b;
        k kVar = gVar.f83221c;
        kVar.i();
        ArrayList arrayList = kVar.f83241j;
        gVar.getClass();
        int i11 = this.f83217a;
        if (i11 >= 0 && i5 >= i11) {
            i5++;
        }
        return (m) arrayList.get(i5);
    }

    @Override // android.widget.Adapter
    public final int getCount() {
        g gVar = this.f83218b;
        k kVar = gVar.f83221c;
        kVar.i();
        int size = kVar.f83241j.size();
        gVar.getClass();
        return this.f83217a < 0 ? size : size - 1;
    }

    @Override // android.widget.Adapter
    public final long getItemId(int i5) {
        return i5;
    }

    @Override // android.widget.Adapter
    public final View getView(int i5, View view, ViewGroup viewGroup) {
        if (view == null) {
            view = this.f83218b.f83220b.inflate(2131623952, viewGroup, false);
        }
        ((x) view).d(getItem(i5));
        return view;
    }

    @Override // android.widget.BaseAdapter
    public final void notifyDataSetChanged() {
        a();
        super.notifyDataSetChanged();
    }
}
