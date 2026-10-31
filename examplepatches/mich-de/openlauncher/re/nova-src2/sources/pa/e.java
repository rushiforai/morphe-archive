package pa;

import aa.z;
import android.content.SharedPreferences;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import com.android.launcher3.BubbleTextView;
import com.android.launcher3.secondarydisplay.SecondaryDisplayLauncher;
import com.android.launcher3.util.ComponentKey;
import e10.k;
import fk.t;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Objects;
import java.util.function.Function;
import java.util.stream.Stream;
import o9.a1;
import q9.o;
import q9.p;
import ya.j;

/* loaded from: classes2.dex */
public final class e extends BaseAdapter implements SharedPreferences.OnSharedPreferenceChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final SecondaryDisplayLauncher f82482a;

    /* renamed from: b, reason: collision with root package name */
    public final t f82483b;

    /* renamed from: c, reason: collision with root package name */
    public final k f82484c;

    /* renamed from: d, reason: collision with root package name */
    public final SharedPreferences f82485d;

    /* renamed from: e, reason: collision with root package name */
    public final p f82486e;

    /* renamed from: f, reason: collision with root package name */
    public final q9.t f82487f;

    /* renamed from: g, reason: collision with root package name */
    public final HashSet f82488g = new HashSet();

    /* renamed from: h, reason: collision with root package name */
    public final ArrayList f82489h = new ArrayList();

    public e(SecondaryDisplayLauncher secondaryDisplayLauncher, p pVar, k kVar) {
        this.f82482a = secondaryDisplayLauncher;
        secondaryDisplayLauncher.getClass();
        this.f82483b = new t(secondaryDisplayLauncher, 23);
        this.f82484c = kVar;
        this.f82486e = pVar;
        this.f82485d = secondaryDisplayLauncher.getSharedPreferences("pinned_apps", 0);
        this.f82487f = new q9.t(secondaryDisplayLauncher);
        pVar.a(new o() { // from class: pa.a
            @Override // q9.o
            public final void a() {
                this.f82475a.b();
            }
        });
    }

    public static void a(e eVar, ga.e eVar2, Function function) {
        eVar.getClass();
        if (((Boolean) function.apply(new ComponentKey(eVar2.i(), eVar2.o))).booleanValue()) {
            eVar.b();
            j.f97149d.submit(new kz.c(22, eVar, new HashSet(eVar.f82488g)));
        }
    }

    public final void b() {
        ArrayList arrayList = this.f82489h;
        arrayList.clear();
        Stream stream = this.f82488g.stream();
        p pVar = this.f82486e;
        Objects.requireNonNull(pVar);
        stream.map(new com.google.firebase.crashlytics.internal.persistence.d(pVar, 6)).filter(new z(7)).forEach(new a1(arrayList, 3));
        arrayList.sort(this.f82487f);
        notifyDataSetChanged();
    }

    @Override // android.widget.Adapter
    public final int getCount() {
        return this.f82489h.size();
    }

    @Override // android.widget.Adapter
    public final Object getItem(int i5) {
        return (ga.a) this.f82489h.get(i5);
    }

    @Override // android.widget.Adapter
    public final long getItemId(int i5) {
        return i5;
    }

    @Override // android.widget.Adapter
    public final View getView(int i5, View view, ViewGroup viewGroup) {
        BubbleTextView bubbleTextView;
        if (view instanceof BubbleTextView) {
            bubbleTextView = (BubbleTextView) view;
        } else {
            bubbleTextView = (BubbleTextView) LayoutInflater.from(viewGroup.getContext()).inflate(2131624043, viewGroup, false);
            bubbleTextView.setOnClickListener(this.f82483b);
            bubbleTextView.setOnLongClickListener(this.f82484c);
            bubbleTextView.f20872i.f79746d = 1.0f;
            int i11 = this.f82482a.f79934x.f77173w;
            bubbleTextView.setPadding(i11, i11, i11, i11);
        }
        bubbleTextView.v((ga.a) this.f82489h.get(i5));
        return bubbleTextView;
    }

    @Override // android.content.SharedPreferences.OnSharedPreferenceChangeListener
    public final void onSharedPreferenceChanged(SharedPreferences sharedPreferences, String str) {
        if ("pinned_apps".equals(str)) {
            j.f97149d.submit(new androidx.fragment.app.d(26, this, sharedPreferences, str));
        }
    }
}
