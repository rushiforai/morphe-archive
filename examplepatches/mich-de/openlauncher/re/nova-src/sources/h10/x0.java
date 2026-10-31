package h10;

import android.view.View;
import android.widget.CheckBox;

/* loaded from: classes4.dex */
public final /* synthetic */ class x0 implements View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f59002a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ CheckBox f59003b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ CheckBox f59004c;

    public /* synthetic */ x0(CheckBox checkBox, CheckBox checkBox2, int i5) {
        this.f59002a = i5;
        this.f59003b = checkBox;
        this.f59004c = checkBox2;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        switch (this.f59002a) {
            case 0:
                CheckBox checkBox = this.f59003b;
                CheckBox checkBox2 = this.f59004c;
                if ((checkBox != null && !checkBox.isChecked()) || (checkBox2 != null && !checkBox2.isChecked())) {
                    if (checkBox != null) {
                        checkBox.setChecked(true);
                    }
                    if (checkBox2 != null) {
                        checkBox2.setChecked(true);
                        break;
                    }
                } else {
                    if (checkBox != null) {
                        checkBox.setChecked(false);
                    }
                    if (checkBox2 != null) {
                        checkBox2.setChecked(false);
                        break;
                    }
                }
                break;
            default:
                CheckBox checkBox3 = this.f59003b;
                CheckBox checkBox4 = this.f59004c;
                if ((checkBox3 != null && !checkBox3.isChecked()) || (checkBox4 != null && !checkBox4.isChecked())) {
                    if (checkBox3 != null) {
                        checkBox3.setChecked(true);
                    }
                    if (checkBox4 != null) {
                        checkBox4.setChecked(true);
                        break;
                    }
                } else {
                    if (checkBox3 != null) {
                        checkBox3.setChecked(false);
                    }
                    if (checkBox4 != null) {
                        checkBox4.setChecked(false);
                        break;
                    }
                }
                break;
        }
    }
}
