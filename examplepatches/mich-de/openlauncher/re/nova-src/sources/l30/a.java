package l30;

import android.view.View;
import android.widget.CompoundButton;
import android.widget.RadioButton;
import androidx.preference.CheckBoxPreference;
import androidx.preference.SwitchPreference;
import androidx.preference.SwitchPreferenceCompat;
import com.teslacoilsw.launcher.widget.DumbRadioGrid;
import com.teslacoilsw.launcher.widget.RadioGrid;

/* loaded from: classes4.dex */
public final class a implements CompoundButton.OnCheckedChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f74633a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f74634b;

    public /* synthetic */ a(Object obj, int i5) {
        this.f74633a = i5;
        this.f74634b = obj;
    }

    @Override // android.widget.CompoundButton.OnCheckedChangeListener
    public final void onCheckedChanged(CompoundButton compoundButton, boolean z11) {
        View viewFindViewById;
        switch (this.f74633a) {
            case 0:
                DumbRadioGrid dumbRadioGrid = (DumbRadioGrid) this.f74634b;
                if (!dumbRadioGrid.f46406h) {
                    dumbRadioGrid.f46406h = true;
                    int i5 = dumbRadioGrid.f46404f;
                    if (i5 != -1) {
                        dumbRadioGrid.l(i5, false);
                    }
                    dumbRadioGrid.f46406h = false;
                    int id2 = compoundButton.getId();
                    dumbRadioGrid.f46404f = id2;
                    c cVar = dumbRadioGrid.f46407i;
                    if (cVar != null) {
                        cVar.a(dumbRadioGrid, id2);
                        break;
                    }
                }
                break;
            case 1:
                RadioGrid radioGrid = (RadioGrid) this.f74634b;
                if (!radioGrid.f46459c) {
                    radioGrid.f46459c = true;
                    int i11 = radioGrid.f46457a;
                    if (i11 != -1 && (viewFindViewById = radioGrid.findViewById(i11)) != null && (viewFindViewById instanceof RadioButton)) {
                        ((RadioButton) viewFindViewById).setChecked(false);
                    }
                    radioGrid.f46459c = false;
                    radioGrid.a(compoundButton.getId());
                    break;
                }
                break;
            case 2:
                CheckBoxPreference checkBoxPreference = (CheckBoxPreference) this.f74634b;
                checkBoxPreference.getClass();
                checkBoxPreference.l(z11);
                break;
            case 3:
                SwitchPreference switchPreference = (SwitchPreference) this.f74634b;
                switchPreference.getClass();
                switchPreference.l(z11);
                break;
            default:
                SwitchPreferenceCompat switchPreferenceCompat = (SwitchPreferenceCompat) this.f74634b;
                switchPreferenceCompat.getClass();
                switchPreferenceCompat.l(z11);
                break;
        }
    }
}
