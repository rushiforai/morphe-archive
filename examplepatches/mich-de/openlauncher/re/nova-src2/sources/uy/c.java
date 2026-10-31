package uy;

import android.content.res.Resources;
import android.text.TextUtils;
import android.view.View;
import android.widget.AdapterView;
import android.widget.CheckBox;
import android.widget.TextView;
import com.teslacoilsw.launcher.drawer.drawergroups.DialogAddDrawerGroupFragment;

/* loaded from: classes4.dex */
public final class c implements AdapterView.OnItemSelectedListener {

    /* renamed from: a, reason: collision with root package name */
    public String f91688a = null;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ g f91689b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ TextView f91690c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ CheckBox f91691d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ DialogAddDrawerGroupFragment f91692e;

    public c(DialogAddDrawerGroupFragment dialogAddDrawerGroupFragment, g gVar, TextView textView, CheckBox checkBox) {
        this.f91692e = dialogAddDrawerGroupFragment;
        this.f91689b = gVar;
        this.f91690c = textView;
        this.f91691d = checkBox;
    }

    @Override // android.widget.AdapterView.OnItemSelectedListener
    public final void onItemSelected(AdapterView adapterView, View view, int i5, long j11) throws Resources.NotFoundException {
        n0 n0Var = ((f) this.f91689b.f91712b.get(i5)).f91709c;
        TextView textView = this.f91690c;
        if (TextUtils.isEmpty(textView.getText()) || textView.getText().toString().equals(this.f91688a)) {
            int i11 = n0Var.ordinal() != 0 ? -1 : 2132017979;
            if (i11 == -1) {
                this.f91688a = null;
                textView.setText(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            } else {
                String string = this.f91692e.getResources().getString(i11);
                this.f91688a = string;
                textView.setText(string);
            }
        }
        this.f91691d.setVisibility((n0Var == n0.f91731c || n0Var == n0.f91732d) ? 0 : 4);
    }

    @Override // android.widget.AdapterView.OnItemSelectedListener
    public final void onNothingSelected(AdapterView adapterView) {
    }
}
