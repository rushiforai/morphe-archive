package io;

import android.widget.CompoundButton;
import androidx.appcompat.widget.SwitchCompat;
import com.instabridge.ai.consent.ConsentSettingsView;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final /* synthetic */ class i implements CompoundButton.OnCheckedChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f66531a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ConsentSettingsView f66532b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ p f66533c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ SwitchCompat f66534d;

    public /* synthetic */ i(ConsentSettingsView consentSettingsView, p pVar, SwitchCompat switchCompat, int i5) {
        this.f66531a = i5;
        this.f66532b = consentSettingsView;
        this.f66533c = pVar;
        this.f66534d = switchCompat;
    }

    @Override // android.widget.CompoundButton.OnCheckedChangeListener
    public final void onCheckedChanged(CompoundButton compoundButton, boolean z11) {
        int i5 = this.f66531a;
        SwitchCompat switchCompat = this.f66534d;
        p pVar = this.f66533c;
        ConsentSettingsView consentSettingsView = this.f66532b;
        switch (i5) {
            case 0:
                int i11 = ConsentSettingsView.o;
                consentSettingsView.c(pVar, z11, switchCompat);
                break;
            case 1:
                int i12 = ConsentSettingsView.o;
                Intrinsics.d(switchCompat);
                consentSettingsView.c(pVar, z11, switchCompat);
                break;
            default:
                int i13 = ConsentSettingsView.o;
                Intrinsics.d(switchCompat);
                consentSettingsView.c(pVar, z11, switchCompat);
                break;
        }
    }
}
