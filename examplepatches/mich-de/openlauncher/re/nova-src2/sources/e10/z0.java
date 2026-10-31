package e10;

import android.view.View;
import android.widget.AdapterView;
import com.teslacoilsw.launcher.preferences.IconLayoutSettingsActivity;

/* loaded from: classes4.dex */
public final class z0 implements AdapterView.OnItemSelectedListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String[] f51979a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ IconLayoutSettingsActivity f51980b;

    public z0(String[] strArr, IconLayoutSettingsActivity iconLayoutSettingsActivity) {
        this.f51979a = strArr;
        this.f51980b = iconLayoutSettingsActivity;
    }

    @Override // android.widget.AdapterView.OnItemSelectedListener
    public final void onItemSelected(AdapterView adapterView, View view, int i5, long j11) throws Throwable {
        String str = this.f51979a[i5];
        IconLayoutSettingsActivity iconLayoutSettingsActivity = this.f51980b;
        iconLayoutSettingsActivity.f45960w = str;
        IconLayoutSettingsActivity.c0(iconLayoutSettingsActivity);
    }

    @Override // android.widget.AdapterView.OnItemSelectedListener
    public final void onNothingSelected(AdapterView adapterView) {
    }
}
