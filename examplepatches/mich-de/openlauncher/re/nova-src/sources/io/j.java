package io;

import android.widget.CompoundButton;
import com.instabridge.ai.consent.ConsentSettingsView;

/* loaded from: classes3.dex */
public final /* synthetic */ class j implements CompoundButton.OnCheckedChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f66535a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ConsentSettingsView f66536b;

    public /* synthetic */ j(ConsentSettingsView consentSettingsView, int i5) {
        this.f66535a = i5;
        this.f66536b = consentSettingsView;
    }

    @Override // android.widget.CompoundButton.OnCheckedChangeListener
    public final void onCheckedChanged(CompoundButton compoundButton, boolean z11) {
        int i5 = this.f66535a;
        ConsentSettingsView consentSettingsView = this.f66536b;
        switch (i5) {
            case 0:
                int i11 = ConsentSettingsView.o;
                consentSettingsView.g(z11);
                break;
            case 1:
                int i12 = ConsentSettingsView.o;
                consentSettingsView.g(z11);
                break;
            default:
                int i13 = ConsentSettingsView.o;
                consentSettingsView.g(z11);
                break;
        }
    }
}
