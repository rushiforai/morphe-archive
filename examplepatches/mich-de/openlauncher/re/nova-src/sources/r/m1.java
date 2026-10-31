package r;

import android.view.View;
import android.widget.AdapterView;
import androidx.preference.DropDownPreference;

/* loaded from: classes2.dex */
public final class m1 implements AdapterView.OnItemSelectedListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f84808a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f84809b;

    public /* synthetic */ m1(Object obj, int i5) {
        this.f84808a = i5;
        this.f84809b = obj;
    }

    private final void a(AdapterView adapterView) {
    }

    private final void b(AdapterView adapterView) {
    }

    @Override // android.widget.AdapterView.OnItemSelectedListener
    public final void onItemSelected(AdapterView adapterView, View view, int i5, long j11) {
        g1 g1Var;
        switch (this.f84808a) {
            case 0:
                if (i5 != -1 && (g1Var = ((t1) this.f84809b).f84862c) != null) {
                    g1Var.f84716h = false;
                    break;
                }
                break;
            default:
                DropDownPreference dropDownPreference = (DropDownPreference) this.f84809b;
                if (i5 >= 0) {
                    String string = dropDownPreference.n[i5].toString();
                    if (!string.equals(dropDownPreference.o)) {
                        dropDownPreference.getClass();
                        dropDownPreference.m(string);
                        break;
                    }
                }
                break;
        }
    }

    @Override // android.widget.AdapterView.OnItemSelectedListener
    public final void onNothingSelected(AdapterView adapterView) {
        int i5 = this.f84808a;
    }
}
