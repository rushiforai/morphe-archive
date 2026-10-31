package x30;

import android.database.DataSetObserver;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.BaseAdapter;
import android.widget.ListAdapter;
import android.widget.ProgressBar;
import android.widget.TextView;
import java.util.ArrayList;

/* loaded from: classes4.dex */
public class g extends BaseAdapter {

    /* renamed from: a, reason: collision with root package name */
    public int f95056a;

    /* renamed from: b, reason: collision with root package name */
    public final ListAdapter f95057b;

    /* renamed from: c, reason: collision with root package name */
    public final a f95058c;

    /* renamed from: d, reason: collision with root package name */
    public int f95059d = 0;

    /* renamed from: e, reason: collision with root package name */
    public final ArrayList f95060e;

    /* renamed from: f, reason: collision with root package name */
    public final e f95061f;

    public g(e eVar, ListAdapter listAdapter, a aVar) {
        this.f95061f = eVar;
        this.f95057b = listAdapter;
        this.f95058c = aVar;
        ArrayList arrayList = ((u20.d) aVar).f90468e;
        this.f95060e = new ArrayList(arrayList != null ? arrayList.size() : 0);
        c(eVar.f95042a);
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0026 A[LOOP:0: B:3:0x000b->B:13:0x0026, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0024 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(int i5, c cVar) {
        int i11;
        int count;
        ArrayList arrayList = this.f95060e;
        int size = arrayList.size();
        int i12 = 0;
        int i13 = 0;
        f fVar = null;
        while (true) {
            if (i12 >= size) {
                break;
            }
            f fVar2 = (f) arrayList.get(i12);
            if (i12 != 0) {
                if (fVar2.f95052a + fVar2.f95055d < i5) {
                    fVar = fVar2;
                    break;
                } else {
                    i13 += fVar2.f95054c;
                    i12++;
                    fVar = fVar2;
                }
            } else {
                if (fVar2.f95052a >= i5) {
                    break;
                }
                i13 += this.f95059d;
                if (fVar2.f95052a + fVar2.f95055d < i5) {
                }
            }
        }
        ListAdapter listAdapter = this.f95057b;
        if (fVar != null) {
            count = fVar.f95053b + fVar.f95054c;
            i11 = (((i5 - fVar.f95052a) - 1) * this.f95056a) + i13;
        } else {
            i11 = (i5 * this.f95056a) + i13;
            count = this.f95059d;
            if (count == 0) {
                count = listAdapter.getCount();
            }
        }
        int childCount = cVar.getChildCount();
        int i14 = 0;
        while (i14 < this.f95056a) {
            View childAt = childCount > i14 ? cVar.getChildAt(i14) : null;
            if (i11 < count) {
                if (childAt != null && childAt.getVisibility() != 0) {
                    childAt.setVisibility(0);
                }
                int i15 = i11 + 1;
                View view = listAdapter.getView(i11, childAt, cVar);
                if (childAt != view) {
                    cVar.addView(view, i14);
                    if (childAt != null) {
                        cVar.removeView(childAt);
                    }
                }
                i11 = i15;
            } else if (childAt != null && childAt.getVisibility() != 4) {
                childAt.setVisibility(4);
            }
            i14++;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0025 A[LOOP:0: B:3:0x000a->B:13:0x0025, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0023 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int b(int i5, int i11) {
        int i12;
        ArrayList arrayList = this.f95060e;
        int size = arrayList.size();
        int i13 = 0;
        f fVar = null;
        int i14 = 0;
        while (true) {
            if (i13 >= size) {
                break;
            }
            f fVar2 = (f) arrayList.get(i13);
            if (i13 != 0) {
                if (fVar2.f95052a + fVar2.f95055d < i5) {
                    fVar = fVar2;
                    break;
                }
                i14 += fVar2.f95054c;
                i13++;
                fVar = fVar2;
            } else {
                if (fVar2.f95052a >= i5) {
                    break;
                }
                i14 += this.f95059d;
                if (fVar2.f95052a + fVar2.f95055d < i5) {
                }
            }
        }
        if (fVar != null) {
            i5 = (i5 - fVar.f95052a) - 1;
            i12 = this.f95056a;
        } else {
            i12 = this.f95056a;
        }
        return (i5 * i12) + i14 + i11;
    }

    public final void c(int i5) {
        if (this.f95056a != i5) {
            this.f95056a = i5;
            ArrayList arrayList = this.f95060e;
            arrayList.clear();
            u20.d dVar = (u20.d) this.f95058c;
            ArrayList arrayList2 = dVar.f90468e;
            int i11 = 0;
            int size = arrayList2 == null ? 0 : arrayList2.size();
            int i12 = 0;
            int i13 = -1;
            while (i11 <= size) {
                int count = i11 < size ? ((u20.c) dVar.f90468e.get(i11)).f90463c : this.f95057b.getCount();
                int i14 = count - i12;
                int i15 = ((i14 + r8) - 1) / this.f95056a;
                if (i13 != -1) {
                    if (arrayList.size() == 0) {
                        this.f95059d = i12;
                    }
                    arrayList.add(new f(i13, i12, i14, i15));
                }
                i13 += i15 + 1;
                i11++;
                i12 = count;
            }
            notifyDataSetChanged();
        }
    }

    @Override // android.widget.Adapter
    public final int getCount() {
        ArrayList arrayList = this.f95060e;
        int size = arrayList.size();
        if (size <= 0) {
            int count = this.f95057b.getCount();
            return ((count + r1) - 1) / this.f95056a;
        }
        int i5 = this.f95059d;
        int i11 = ((i5 + r3) - 1) / this.f95056a;
        for (int i12 = 0; i12 < size; i12++) {
            i11 += ((f) arrayList.get(i12)).f95055d + 1;
        }
        return i11;
    }

    @Override // android.widget.Adapter
    public final Object getItem(int i5) {
        return null;
    }

    @Override // android.widget.Adapter
    public final long getItemId(int i5) {
        return i5;
    }

    @Override // android.widget.BaseAdapter, android.widget.Adapter
    public final int getItemViewType(int i5) {
        ArrayList arrayList = this.f95060e;
        int size = arrayList.size();
        for (int i11 = 0; i11 < size; i11++) {
            if (i5 == ((f) arrayList.get(i11)).f95052a) {
                return 1;
            }
        }
        return 0;
    }

    @Override // android.widget.Adapter
    public View getView(int i5, View view, ViewGroup viewGroup) {
        TextView textView;
        int i11 = -1;
        if (getItemViewType(i5) == 0) {
            c cVar = (c) view;
            if (cVar == null) {
                e eVar = this.f95061f;
                cVar = new c(eVar, eVar.getContext());
                cVar.setLayoutParams(new AbsListView.LayoutParams(-1, -2));
            }
            a(i5, cVar);
            return cVar;
        }
        ArrayList arrayList = this.f95060e;
        int size = arrayList.size();
        int i12 = 0;
        while (true) {
            if (i12 >= size) {
                break;
            }
            if (((f) arrayList.get(i12)).f95052a >= i5) {
                i11 = i12;
                break;
            }
            i12++;
        }
        u20.d dVar = (u20.d) this.f95058c;
        ArrayList arrayList2 = dVar.f90468e;
        if (arrayList2 == null) {
            return null;
        }
        if (view == null) {
            view = dVar.f90465b.inflate(2131624442, viewGroup, false);
            textView = (TextView) view.findViewById(2131428412);
            view.setTag(textView);
        } else {
            textView = (TextView) view.getTag();
        }
        u20.c cVar2 = (u20.c) arrayList2.get(i11);
        String str = cVar2.f90461a;
        textView.setText(str);
        if (TextUtils.isEmpty(str)) {
            textView.setVisibility(8);
        } else {
            textView.setVisibility(0);
        }
        ((ProgressBar) view.findViewById(2131428653)).setVisibility(cVar2.f90462b ? 0 : 8);
        return view;
    }

    @Override // android.widget.BaseAdapter, android.widget.Adapter
    public final int getViewTypeCount() {
        return 2;
    }

    @Override // android.widget.BaseAdapter, android.widget.Adapter
    public final void registerDataSetObserver(DataSetObserver dataSetObserver) {
        super.registerDataSetObserver(dataSetObserver);
        this.f95057b.registerDataSetObserver(dataSetObserver);
    }

    @Override // android.widget.BaseAdapter, android.widget.Adapter
    public final void unregisterDataSetObserver(DataSetObserver dataSetObserver) {
        super.unregisterDataSetObserver(dataSetObserver);
        this.f95057b.unregisterDataSetObserver(dataSetObserver);
    }
}
