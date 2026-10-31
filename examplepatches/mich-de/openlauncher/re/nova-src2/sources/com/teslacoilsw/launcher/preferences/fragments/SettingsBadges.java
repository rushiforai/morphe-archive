package com.teslacoilsw.launcher.preferences.fragments;

import aa.i0;
import aa.p;
import ab.e0;
import ai.u1;
import android.animation.ObjectAnimator;
import android.annotation.TargetApi;
import android.app.Notification;
import android.app.NotificationChannel;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.media.AudioAttributes;
import android.net.Uri;
import android.os.Bundle;
import android.os.SystemClock;
import android.provider.Settings;
import android.service.notification.NotificationListenerService;
import android.service.notification.StatusBarNotification;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckedTextView;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.ScrollView;
import android.widget.TextView;
import androidx.fragment.app.m0;
import com.google.android.gms.internal.consent_sdk.k0;
import com.instabridge.ai.chat.ui.v2.e;
import com.teslacoilsw.launcher.notificationlistener.NotificationListener;
import com.teslacoilsw.launcher.preferences.SettingsActivityLegacy;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefCardBorderView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefCheckableView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefCornerRadiusSeekBarView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView;
import com.teslacoilsw.launcher.preferences.fancyprefs.color.ColorPickerBottomSheet;
import com.teslacoilsw.launcher.preferences.fragments.SettingsBadges;
import com.teslacoilsw.launcher.widget.RadioGrid;
import com.teslacoilsw.notifier.widget.BadgeArtIconPreview;
import com.teslacoilsw.shared.colorpicker.ColorPickerTextView;
import cw.c0;
import e10.a3;
import e10.g2;
import e10.p4;
import e10.y0;
import e10.y2;
import fk.t;
import g10.f;
import h10.d0;
import ha.g;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import m.m;
import mx.g0;
import mz.a;
import mz.l;
import mz.n;
import mz.o;
import o4.d;
import r70.k;
import v9.s;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0007\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0005\u0006B\u0007¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0007"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/fragments/SettingsBadges;", "Lcom/teslacoilsw/launcher/preferences/fragments/NovaSettingsFragment;", "Lv9/s;", "<init>", "()V", "h10/d0", "ai/u1", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@TargetApi(18)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class SettingsBadges extends NovaSettingsFragment<s> {

    /* renamed from: i, reason: collision with root package name */
    public CheckedTextView f46069i;

    /* renamed from: j, reason: collision with root package name */
    public CheckedTextView f46070j;

    /* renamed from: k, reason: collision with root package name */
    public CheckedTextView f46071k;

    /* renamed from: l, reason: collision with root package name */
    public CheckedTextView f46072l;
    public boolean n;
    public boolean o;

    /* renamed from: p, reason: collision with root package name */
    public ObjectAnimator f46074p;

    /* renamed from: q, reason: collision with root package name */
    public boolean f46075q;

    /* renamed from: h, reason: collision with root package name */
    public final int f46068h = 2132019236;

    /* renamed from: m, reason: collision with root package name */
    public int f46073m = -1;

    public final boolean A() {
        String string = Settings.Secure.getString(requireContext().getContentResolver(), "enabled_notification_listeners");
        ComponentName componentName = new ComponentName(requireContext(), (Class<?>) NotificationListener.class);
        return string != null && (k.K0(string, componentName.flattenToString(), false) || k.K0(string, componentName.flattenToShortString(), false));
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x0093  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x009e  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00a0  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00ac  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00b4  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00b6  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00e2  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x0108  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x010a  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x011c  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x0122  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x01b2  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x0222  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x0235  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x00ee A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void B() throws Resources.NotFoundException {
        int length;
        int i5;
        int i11;
        boolean z11;
        int childCount;
        boolean z12;
        o oVarA;
        s sVar = (s) this.f46052e;
        if (sVar == null) {
            return;
        }
        ColorPickerTextView colorPickerTextView = sVar.f92527f;
        this.f46075q = true;
        ScrollView scrollView = sVar.f92522a;
        g2 g2Var = a3.f51435a;
        boolean z13 = g2Var.f51556l;
        g2Var.f51557m.getClass();
        p4 p4Var = g2Var.f51557m;
        p4Var.getClass();
        boolean z14 = p4Var == p4.f51745e;
        sVar.f92523b.setText(z13 ? g2Var.f51557m.f51747a : 2132018734);
        if (z13 && !A()) {
            final int i12 = 0;
            H(2132017796, new Function1(this) { // from class: h10.a0

                /* renamed from: b, reason: collision with root package name */
                public final /* synthetic */ SettingsBadges f58834b;

                {
                    this.f58834b = this;
                }

                @Override // kotlin.jvm.functions.Function1
                public final Object invoke(Object obj) {
                    switch (i12) {
                        case 0:
                            this.f58834b.E();
                            break;
                        case 1:
                            p4 p4Var2 = a3.f51435a.f51557m;
                            SettingsBadges settingsBadges = this.f58834b;
                            settingsBadges.getClass();
                            Intent component = new Intent().setComponent(SettingsActivityLegacy.A);
                            component.putExtra("target", "unread_counts");
                            component.putExtra("unread_provider", p4Var2.name());
                            component.addFlags(268484608);
                            settingsBadges.startActivity(new Intent("android.settings.NOTIFICATION_SETTINGS").addFlags(268468224).putExtra(":settings:fragment_args_key", "notification_badging"));
                            com.google.android.gms.internal.consent_sdk.k0.w(settingsBadges.requireContext(), 2132017799, 1).show();
                            break;
                        default:
                            this.f58834b.E();
                            break;
                    }
                    return Unit.f71706a;
                }
            });
        } else if (z13 && Settings.Secure.getInt(requireContext().getContentResolver(), "notification_badging", 1) == 0) {
            final int i13 = 1;
            H(2132017798, new Function1(this) { // from class: h10.a0

                /* renamed from: b, reason: collision with root package name */
                public final /* synthetic */ SettingsBadges f58834b;

                {
                    this.f58834b = this;
                }

                @Override // kotlin.jvm.functions.Function1
                public final Object invoke(Object obj) {
                    switch (i13) {
                        case 0:
                            this.f58834b.E();
                            break;
                        case 1:
                            p4 p4Var2 = a3.f51435a.f51557m;
                            SettingsBadges settingsBadges = this.f58834b;
                            settingsBadges.getClass();
                            Intent component = new Intent().setComponent(SettingsActivityLegacy.A);
                            component.putExtra("target", "unread_counts");
                            component.putExtra("unread_provider", p4Var2.name());
                            component.addFlags(268484608);
                            settingsBadges.startActivity(new Intent("android.settings.NOTIFICATION_SETTINGS").addFlags(268468224).putExtra(":settings:fragment_args_key", "notification_badging"));
                            com.google.android.gms.internal.consent_sdk.k0.w(settingsBadges.requireContext(), 2132017799, 1).show();
                            break;
                        default:
                            this.f58834b.E();
                            break;
                    }
                    return Unit.f71706a;
                }
            });
        } else {
            if (!z13 || !A() || g.a() != null) {
                sVar.f92535p.setVisibility(8);
                G();
                if (!z13) {
                    this.n = true;
                    sVar.f92533l.setVisibility(0);
                }
                sVar.o.setVisibility(!z13 ? 0 : 8);
                sVar.f92529h.setVisibility((z13 || !z14) ? 8 : 0);
                sVar.f92530i.setVisibility(!z13 ? 0 : 8);
                View viewFindViewById = scrollView.findViewById(((l) y2.f51877a.z1().l()).f77356a);
                Intrinsics.e(viewFindViewById, "null cannot be cast to non-null type android.widget.RadioButton");
                ((RadioButton) viewFindViewById).setChecked(true);
                int i14 = g2Var.n.f77362d;
                d0[] d0VarArrValues = d0.values();
                length = d0VarArrValues.length;
                i5 = 0;
                while (true) {
                    if (i5 < length) {
                        i11 = 2131428870;
                        break;
                    }
                    d0 d0Var = d0VarArrValues[i5];
                    if (d0Var.f58862a == i14) {
                        i11 = d0Var.f58863b;
                        break;
                    }
                    i5++;
                }
                View viewFindViewById2 = scrollView.findViewById(i11);
                Intrinsics.e(viewFindViewById2, "null cannot be cast to non-null type android.widget.RadioButton");
                ((RadioButton) viewFindViewById2).setChecked(true);
                g2 g2Var2 = a3.f51435a;
                z11 = g2Var2.n.f77360b != 262914;
                FancyPrefCheckableView fancyPrefCheckableView = sVar.f92531j;
                final int i15 = 1;
                fancyPrefCheckableView.C = new Function2(this) { // from class: h10.b0

                    /* renamed from: b, reason: collision with root package name */
                    public final /* synthetic */ SettingsBadges f58842b;

                    {
                        this.f58842b = this;
                    }

                    @Override // kotlin.jvm.functions.Function2
                    public final Object invoke(Object obj, Object obj2) throws Resources.NotFoundException {
                        switch (i15) {
                            case 0:
                                ((Integer) obj).intValue();
                                int iIntValue = ((Integer) obj2).intValue();
                                mz.o oVar = a3.f51435a.n;
                                this.f58842b.C(new mz.o(oVar.f77359a, oVar.f77360b, oVar.f77361c, oVar.f77362d, iIntValue));
                                break;
                            default:
                                ((Boolean) obj).getClass();
                                boolean zBooleanValue = ((Boolean) obj2).booleanValue();
                                mz.o oVar2 = a3.f51435a.n;
                                SettingsBadges settingsBadges = this.f58842b;
                                settingsBadges.C(new mz.o(oVar2.f77359a, zBooleanValue ? 262914 : settingsBadges.f46073m, oVar2.f77361c, oVar2.f77362d, oVar2.f77363e));
                                break;
                        }
                        return Unit.f71706a;
                    }
                };
                fancyPrefCheckableView.setChecked(z11);
                sVar.f92526e.setVisibility(z11 ? 8 : 0);
                if (!z11) {
                    colorPickerTextView.f46511a.b(g2Var2.n.f77359a);
                    colorPickerTextView.invalidate();
                    colorPickerTextView.setOnClickListener(new e(13, this, sVar));
                    final ColorPickerTextView colorPickerTextView2 = sVar.f92525d;
                    f fVar = colorPickerTextView2.f46511a;
                    fVar.b(g2Var2.n.f77360b);
                    colorPickerTextView2.invalidate();
                    this.f46073m = fVar.f56840c;
                    final int i16 = 0;
                    colorPickerTextView2.setOnClickListener(new View.OnClickListener() { // from class: h10.c0
                        @Override // android.view.View.OnClickListener
                        public final void onClick(View view) {
                            switch (i16) {
                                case 0:
                                    SettingsBadges settingsBadges = this;
                                    settingsBadges.D(new e0(1, settingsBadges, colorPickerTextView2));
                                    break;
                                default:
                                    SettingsBadges settingsBadges2 = this;
                                    settingsBadges2.D(new e0(2, settingsBadges2, colorPickerTextView2));
                                    break;
                            }
                        }
                    });
                    final ColorPickerTextView colorPickerTextView3 = sVar.f92528g;
                    colorPickerTextView3.f46511a.b(g2Var2.n.f77361c);
                    colorPickerTextView3.invalidate();
                    final int i17 = 1;
                    colorPickerTextView3.setOnClickListener(new View.OnClickListener() { // from class: h10.c0
                        @Override // android.view.View.OnClickListener
                        public final void onClick(View view) {
                            switch (i17) {
                                case 0:
                                    SettingsBadges settingsBadges = this;
                                    settingsBadges.D(new e0(1, settingsBadges, colorPickerTextView3));
                                    break;
                                default:
                                    SettingsBadges settingsBadges2 = this;
                                    settingsBadges2.D(new e0(2, settingsBadges2, colorPickerTextView3));
                                    break;
                            }
                        }
                    });
                }
                View viewFindViewById3 = scrollView.findViewById(2131428620);
                Intrinsics.e(viewFindViewById3, "null cannot be cast to non-null type com.teslacoilsw.notifier.widget.BadgeArtIconPreview");
                View viewFindViewById4 = scrollView.findViewById(2131428675);
                Intrinsics.e(viewFindViewById4, "null cannot be cast to non-null type android.widget.RadioGroup");
                RadioGroup radioGroup = (RadioGroup) viewFindViewById4;
                radioGroup.setOnCheckedChangeListener(null);
                View viewFindViewById5 = scrollView.findViewById(2131428615);
                Intrinsics.e(viewFindViewById5, "null cannot be cast to non-null type android.widget.RadioButton");
                RadioButton radioButton = (RadioButton) viewFindViewById5;
                int dimensionPixelSize = requireContext().getResources().getDimensionPixelSize(2131166535);
                z12 = false;
                for (childCount = radioGroup.getChildCount() - 1; -1 < childCount; childCount--) {
                    if (radioGroup.getChildAt(childCount) instanceof RadioButton) {
                        View childAt = radioGroup.getChildAt(childCount);
                        Intrinsics.e(childAt, "null cannot be cast to non-null type android.widget.RadioButton");
                        RadioButton radioButton2 = (RadioButton) childAt;
                        Object tag = radioButton2.getTag();
                        Intrinsics.e(tag, "null cannot be cast to non-null type kotlin.String");
                        String str = (String) tag;
                        if (radioButton2 != radioButton) {
                            o.Companion.getClass();
                            o oVarA2 = n.a(str);
                            a aVar = new a(bh.g.M(requireContext(), 24), oVarA2);
                            aVar.setBounds(0, 0, dimensionPixelSize, dimensionPixelSize);
                            radioButton2.setCompoundDrawables(null, aVar, null, null);
                            o oVar = a3.f51435a.n;
                            oVar.getClass();
                            if (oVar == oVarA2 || (oVarA2 != null && oVar.f77360b == oVarA2.f77360b && oVar.f77363e == oVarA2.f77363e && oVar.f77359a == oVarA2.f77359a && oVar.f77361c == oVarA2.f77361c)) {
                                radioButton2.setChecked(true);
                                z12 = true;
                            }
                        }
                    }
                }
                if (z12) {
                    oVarA = a3.f51435a.n;
                    radioButton.setChecked(true);
                } else {
                    n nVar = o.Companion;
                    Object tag2 = radioButton.getTag();
                    Intrinsics.e(tag2, "null cannot be cast to non-null type kotlin.String");
                    nVar.getClass();
                    oVarA = n.a((String) tag2);
                }
                a aVar2 = new a(bh.g.M(requireContext(), 24), oVarA);
                aVar2.setBounds(0, 0, dimensionPixelSize, dimensionPixelSize);
                radioButton.setCompoundDrawables(null, aVar2, null, null);
                final int i18 = 1;
                radioGroup.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener(this) { // from class: h10.x

                    /* renamed from: b, reason: collision with root package name */
                    public final /* synthetic */ SettingsBadges f59001b;

                    {
                        this.f59001b = this;
                    }

                    @Override // android.widget.RadioGroup.OnCheckedChangeListener
                    public final void onCheckedChanged(RadioGroup radioGroup2, int i19) throws Resources.NotFoundException {
                        switch (i18) {
                            case 0:
                                d0 d0Var2 = d0.f58860c;
                                d0[] d0VarArrValues2 = d0.values();
                                int length2 = d0VarArrValues2.length;
                                int i21 = 0;
                                while (true) {
                                    if (i21 < length2) {
                                        d0 d0Var3 = d0VarArrValues2[i21];
                                        if (d0Var3.f58863b == i19) {
                                            d0Var2 = d0Var3;
                                        } else {
                                            i21++;
                                        }
                                    }
                                }
                                mz.o oVar2 = a3.f51435a.n;
                                this.f59001b.C(new mz.o(oVar2.f77359a, oVar2.f77360b, oVar2.f77361c, d0Var2.f58862a, oVar2.f77363e));
                                break;
                            default:
                                View viewFindViewById6 = radioGroup2.findViewById(i19);
                                Intrinsics.e(viewFindViewById6, "null cannot be cast to non-null type android.widget.RadioButton");
                                Object tag3 = ((RadioButton) viewFindViewById6).getTag();
                                Intrinsics.e(tag3, "null cannot be cast to non-null type kotlin.String");
                                mz.n nVar2 = mz.o.Companion;
                                int i22 = a3.f51435a.n.f77362d;
                                nVar2.getClass();
                                this.f59001b.C(mz.o.a(mz.n.a((String) tag3), 0, i22, 0, 23));
                                break;
                        }
                    }
                });
                View viewFindViewById6 = scrollView.findViewById(2131428674);
                Intrinsics.e(viewFindViewById6, "null cannot be cast to non-null type com.teslacoilsw.launcher.widget.RadioGrid");
                ((RadioGrid) viewFindViewById6).f46460d = new f10.o(this, 18);
                View viewFindViewById7 = scrollView.findViewById(2131428676);
                Intrinsics.e(viewFindViewById7, "null cannot be cast to non-null type android.widget.RadioGroup");
                final int i19 = 0;
                ((RadioGroup) viewFindViewById7).setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener(this) { // from class: h10.x

                    /* renamed from: b, reason: collision with root package name */
                    public final /* synthetic */ SettingsBadges f59001b;

                    {
                        this.f59001b = this;
                    }

                    @Override // android.widget.RadioGroup.OnCheckedChangeListener
                    public final void onCheckedChanged(RadioGroup radioGroup2, int i192) throws Resources.NotFoundException {
                        switch (i19) {
                            case 0:
                                d0 d0Var2 = d0.f58860c;
                                d0[] d0VarArrValues2 = d0.values();
                                int length2 = d0VarArrValues2.length;
                                int i21 = 0;
                                while (true) {
                                    if (i21 < length2) {
                                        d0 d0Var3 = d0VarArrValues2[i21];
                                        if (d0Var3.f58863b == i192) {
                                            d0Var2 = d0Var3;
                                        } else {
                                            i21++;
                                        }
                                    }
                                }
                                mz.o oVar2 = a3.f51435a.n;
                                this.f59001b.C(new mz.o(oVar2.f77359a, oVar2.f77360b, oVar2.f77361c, d0Var2.f58862a, oVar2.f77363e));
                                break;
                            default:
                                View viewFindViewById62 = radioGroup2.findViewById(i192);
                                Intrinsics.e(viewFindViewById62, "null cannot be cast to non-null type android.widget.RadioButton");
                                Object tag3 = ((RadioButton) viewFindViewById62).getTag();
                                Intrinsics.e(tag3, "null cannot be cast to non-null type kotlin.String");
                                mz.n nVar2 = mz.o.Companion;
                                int i22 = a3.f51435a.n.f77362d;
                                nVar2.getClass();
                                this.f59001b.C(mz.o.a(mz.n.a((String) tag3), 0, i22, 0, 23));
                                break;
                        }
                    }
                });
                FancyPrefCornerRadiusSeekBarView fancyPrefCornerRadiusSeekBarView = sVar.f92532k;
                final int i21 = 0;
                fancyPrefCornerRadiusSeekBarView.C = new Function2(this) { // from class: h10.b0

                    /* renamed from: b, reason: collision with root package name */
                    public final /* synthetic */ SettingsBadges f58842b;

                    {
                        this.f58842b = this;
                    }

                    @Override // kotlin.jvm.functions.Function2
                    public final Object invoke(Object obj, Object obj2) throws Resources.NotFoundException {
                        switch (i21) {
                            case 0:
                                ((Integer) obj).intValue();
                                int iIntValue = ((Integer) obj2).intValue();
                                mz.o oVar2 = a3.f51435a.n;
                                this.f58842b.C(new mz.o(oVar2.f77359a, oVar2.f77360b, oVar2.f77361c, oVar2.f77362d, iIntValue));
                                break;
                            default:
                                ((Boolean) obj).getClass();
                                boolean zBooleanValue = ((Boolean) obj2).booleanValue();
                                mz.o oVar22 = a3.f51435a.n;
                                SettingsBadges settingsBadges = this.f58842b;
                                settingsBadges.C(new mz.o(oVar22.f77359a, zBooleanValue ? 262914 : settingsBadges.f46073m, oVar22.f77361c, oVar22.f77362d, oVar22.f77363e));
                                break;
                        }
                        return Unit.f71706a;
                    }
                };
                fancyPrefCornerRadiusSeekBarView.E(Integer.valueOf(a3.f51435a.n.f77363e));
                this.f46075q = false;
            }
            final int i22 = 2;
            H(2132017797, new Function1(this) { // from class: h10.a0

                /* renamed from: b, reason: collision with root package name */
                public final /* synthetic */ SettingsBadges f58834b;

                {
                    this.f58834b = this;
                }

                @Override // kotlin.jvm.functions.Function1
                public final Object invoke(Object obj) {
                    switch (i22) {
                        case 0:
                            this.f58834b.E();
                            break;
                        case 1:
                            p4 p4Var2 = a3.f51435a.f51557m;
                            SettingsBadges settingsBadges = this.f58834b;
                            settingsBadges.getClass();
                            Intent component = new Intent().setComponent(SettingsActivityLegacy.A);
                            component.putExtra("target", "unread_counts");
                            component.putExtra("unread_provider", p4Var2.name());
                            component.addFlags(268484608);
                            settingsBadges.startActivity(new Intent("android.settings.NOTIFICATION_SETTINGS").addFlags(268468224).putExtra(":settings:fragment_args_key", "notification_badging"));
                            com.google.android.gms.internal.consent_sdk.k0.w(settingsBadges.requireContext(), 2132017799, 1).show();
                            break;
                        default:
                            this.f58834b.E();
                            break;
                    }
                    return Unit.f71706a;
                }
            });
        }
        z13 = false;
        G();
        if (!z13) {
        }
        sVar.o.setVisibility(!z13 ? 0 : 8);
        sVar.f92529h.setVisibility((z13 || !z14) ? 8 : 0);
        sVar.f92530i.setVisibility(!z13 ? 0 : 8);
        View viewFindViewById8 = scrollView.findViewById(((l) y2.f51877a.z1().l()).f77356a);
        Intrinsics.e(viewFindViewById8, "null cannot be cast to non-null type android.widget.RadioButton");
        ((RadioButton) viewFindViewById8).setChecked(true);
        int i142 = g2Var.n.f77362d;
        d0[] d0VarArrValues2 = d0.values();
        length = d0VarArrValues2.length;
        i5 = 0;
        while (true) {
            if (i5 < length) {
            }
            i5++;
        }
        View viewFindViewById22 = scrollView.findViewById(i11);
        Intrinsics.e(viewFindViewById22, "null cannot be cast to non-null type android.widget.RadioButton");
        ((RadioButton) viewFindViewById22).setChecked(true);
        g2 g2Var22 = a3.f51435a;
        if (g2Var22.n.f77360b != 262914) {
        }
        FancyPrefCheckableView fancyPrefCheckableView2 = sVar.f92531j;
        final int i152 = 1;
        fancyPrefCheckableView2.C = new Function2(this) { // from class: h10.b0

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ SettingsBadges f58842b;

            {
                this.f58842b = this;
            }

            @Override // kotlin.jvm.functions.Function2
            public final Object invoke(Object obj, Object obj2) throws Resources.NotFoundException {
                switch (i152) {
                    case 0:
                        ((Integer) obj).intValue();
                        int iIntValue = ((Integer) obj2).intValue();
                        mz.o oVar2 = a3.f51435a.n;
                        this.f58842b.C(new mz.o(oVar2.f77359a, oVar2.f77360b, oVar2.f77361c, oVar2.f77362d, iIntValue));
                        break;
                    default:
                        ((Boolean) obj).getClass();
                        boolean zBooleanValue = ((Boolean) obj2).booleanValue();
                        mz.o oVar22 = a3.f51435a.n;
                        SettingsBadges settingsBadges = this.f58842b;
                        settingsBadges.C(new mz.o(oVar22.f77359a, zBooleanValue ? 262914 : settingsBadges.f46073m, oVar22.f77361c, oVar22.f77362d, oVar22.f77363e));
                        break;
                }
                return Unit.f71706a;
            }
        };
        fancyPrefCheckableView2.setChecked(z11);
        sVar.f92526e.setVisibility(z11 ? 8 : 0);
        if (!z11) {
        }
        View viewFindViewById32 = scrollView.findViewById(2131428620);
        Intrinsics.e(viewFindViewById32, "null cannot be cast to non-null type com.teslacoilsw.notifier.widget.BadgeArtIconPreview");
        View viewFindViewById42 = scrollView.findViewById(2131428675);
        Intrinsics.e(viewFindViewById42, "null cannot be cast to non-null type android.widget.RadioGroup");
        RadioGroup radioGroup2 = (RadioGroup) viewFindViewById42;
        radioGroup2.setOnCheckedChangeListener(null);
        View viewFindViewById52 = scrollView.findViewById(2131428615);
        Intrinsics.e(viewFindViewById52, "null cannot be cast to non-null type android.widget.RadioButton");
        RadioButton radioButton3 = (RadioButton) viewFindViewById52;
        int dimensionPixelSize2 = requireContext().getResources().getDimensionPixelSize(2131166535);
        z12 = false;
        while (-1 < childCount) {
        }
        if (z12) {
        }
        a aVar22 = new a(bh.g.M(requireContext(), 24), oVarA);
        aVar22.setBounds(0, 0, dimensionPixelSize2, dimensionPixelSize2);
        radioButton3.setCompoundDrawables(null, aVar22, null, null);
        final int i182 = 1;
        radioGroup2.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener(this) { // from class: h10.x

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ SettingsBadges f59001b;

            {
                this.f59001b = this;
            }

            @Override // android.widget.RadioGroup.OnCheckedChangeListener
            public final void onCheckedChanged(RadioGroup radioGroup22, int i192) throws Resources.NotFoundException {
                switch (i182) {
                    case 0:
                        d0 d0Var2 = d0.f58860c;
                        d0[] d0VarArrValues22 = d0.values();
                        int length2 = d0VarArrValues22.length;
                        int i212 = 0;
                        while (true) {
                            if (i212 < length2) {
                                d0 d0Var3 = d0VarArrValues22[i212];
                                if (d0Var3.f58863b == i192) {
                                    d0Var2 = d0Var3;
                                } else {
                                    i212++;
                                }
                            }
                        }
                        mz.o oVar2 = a3.f51435a.n;
                        this.f59001b.C(new mz.o(oVar2.f77359a, oVar2.f77360b, oVar2.f77361c, d0Var2.f58862a, oVar2.f77363e));
                        break;
                    default:
                        View viewFindViewById62 = radioGroup22.findViewById(i192);
                        Intrinsics.e(viewFindViewById62, "null cannot be cast to non-null type android.widget.RadioButton");
                        Object tag3 = ((RadioButton) viewFindViewById62).getTag();
                        Intrinsics.e(tag3, "null cannot be cast to non-null type kotlin.String");
                        mz.n nVar2 = mz.o.Companion;
                        int i222 = a3.f51435a.n.f77362d;
                        nVar2.getClass();
                        this.f59001b.C(mz.o.a(mz.n.a((String) tag3), 0, i222, 0, 23));
                        break;
                }
            }
        });
        View viewFindViewById62 = scrollView.findViewById(2131428674);
        Intrinsics.e(viewFindViewById62, "null cannot be cast to non-null type com.teslacoilsw.launcher.widget.RadioGrid");
        ((RadioGrid) viewFindViewById62).f46460d = new f10.o(this, 18);
        View viewFindViewById72 = scrollView.findViewById(2131428676);
        Intrinsics.e(viewFindViewById72, "null cannot be cast to non-null type android.widget.RadioGroup");
        final int i192 = 0;
        ((RadioGroup) viewFindViewById72).setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener(this) { // from class: h10.x

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ SettingsBadges f59001b;

            {
                this.f59001b = this;
            }

            @Override // android.widget.RadioGroup.OnCheckedChangeListener
            public final void onCheckedChanged(RadioGroup radioGroup22, int i1922) throws Resources.NotFoundException {
                switch (i192) {
                    case 0:
                        d0 d0Var2 = d0.f58860c;
                        d0[] d0VarArrValues22 = d0.values();
                        int length2 = d0VarArrValues22.length;
                        int i212 = 0;
                        while (true) {
                            if (i212 < length2) {
                                d0 d0Var3 = d0VarArrValues22[i212];
                                if (d0Var3.f58863b == i1922) {
                                    d0Var2 = d0Var3;
                                } else {
                                    i212++;
                                }
                            }
                        }
                        mz.o oVar2 = a3.f51435a.n;
                        this.f59001b.C(new mz.o(oVar2.f77359a, oVar2.f77360b, oVar2.f77361c, d0Var2.f58862a, oVar2.f77363e));
                        break;
                    default:
                        View viewFindViewById622 = radioGroup22.findViewById(i1922);
                        Intrinsics.e(viewFindViewById622, "null cannot be cast to non-null type android.widget.RadioButton");
                        Object tag3 = ((RadioButton) viewFindViewById622).getTag();
                        Intrinsics.e(tag3, "null cannot be cast to non-null type kotlin.String");
                        mz.n nVar2 = mz.o.Companion;
                        int i222 = a3.f51435a.n.f77362d;
                        nVar2.getClass();
                        this.f59001b.C(mz.o.a(mz.n.a((String) tag3), 0, i222, 0, 23));
                        break;
                }
            }
        });
        FancyPrefCornerRadiusSeekBarView fancyPrefCornerRadiusSeekBarView2 = sVar.f92532k;
        final int i212 = 0;
        fancyPrefCornerRadiusSeekBarView2.C = new Function2(this) { // from class: h10.b0

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ SettingsBadges f58842b;

            {
                this.f58842b = this;
            }

            @Override // kotlin.jvm.functions.Function2
            public final Object invoke(Object obj, Object obj2) throws Resources.NotFoundException {
                switch (i212) {
                    case 0:
                        ((Integer) obj).intValue();
                        int iIntValue = ((Integer) obj2).intValue();
                        mz.o oVar2 = a3.f51435a.n;
                        this.f58842b.C(new mz.o(oVar2.f77359a, oVar2.f77360b, oVar2.f77361c, oVar2.f77362d, iIntValue));
                        break;
                    default:
                        ((Boolean) obj).getClass();
                        boolean zBooleanValue = ((Boolean) obj2).booleanValue();
                        mz.o oVar22 = a3.f51435a.n;
                        SettingsBadges settingsBadges = this.f58842b;
                        settingsBadges.C(new mz.o(oVar22.f77359a, zBooleanValue ? 262914 : settingsBadges.f46073m, oVar22.f77361c, oVar22.f77362d, oVar22.f77363e));
                        break;
                }
                return Unit.f71706a;
            }
        };
        fancyPrefCornerRadiusSeekBarView2.E(Integer.valueOf(a3.f51435a.n.f77363e));
        this.f46075q = false;
    }

    public final void C(o oVar) throws Resources.NotFoundException {
        a3.f51435a.f51545a.edit().putString("unread_count_badge_style", oVar.toString()).apply();
        Context context = g0.f77088a;
        g0.k(requireContext());
        g0.p();
        if (this.f46075q) {
            return;
        }
        B();
    }

    public final void D(u1 u1Var) {
        ColorPickerBottomSheet colorPickerBottomSheetZ = g90.k.Z(getString(2132017728), ((ColorPickerTextView) u1Var.f13368a).f46511a.f56840c, 0, true, u1Var.n());
        colorPickerBottomSheetZ.f46044m = new c0(u1Var, 26);
        m0 m0VarRequireActivity = requireActivity();
        Intrinsics.e(m0VarRequireActivity, "null cannot be cast to non-null type androidx.appcompat.app.AppCompatActivity");
        colorPickerBottomSheetZ.show(((m) m0VarRequireActivity).getSupportFragmentManager(), "colorPickerDialog");
    }

    public final void E() {
        NotificationListener.d(requireContext());
        k0.w(requireContext(), 2132017795, 1).show();
    }

    public final void F(boolean z11, p4 p4Var) {
        a3.f51435a.f51545a.edit().putBoolean("unread_count", z11).putString("unread_count_provider", p4Var.name()).apply();
        G();
        NovaSettingsFragmentBase.w(this);
    }

    public final void G() {
        CheckedTextView checkedTextView;
        g2 g2Var = a3.f51435a;
        boolean z11 = g2Var.f51555k;
        p4 p4Var = g2Var.f51557m;
        if (!z11) {
            checkedTextView = this.f46069i;
            if (checkedTextView == null) {
                Intrinsics.m("noneTitle");
                throw null;
            }
        } else if (p4Var == p4.f51743c) {
            checkedTextView = this.f46070j;
            if (checkedTextView == null) {
                Intrinsics.m("dynamicTitle");
                throw null;
            }
        } else if (p4Var == p4.f51744d) {
            checkedTextView = this.f46071k;
            if (checkedTextView == null) {
                Intrinsics.m("dotsTitle");
                throw null;
            }
        } else if (p4Var == p4.f51745e) {
            checkedTextView = this.f46072l;
            if (checkedTextView == null) {
                Intrinsics.m("numericTitle");
                throw null;
            }
        } else {
            checkedTextView = this.f46069i;
            if (checkedTextView == null) {
                Intrinsics.m("noneTitle");
                throw null;
            }
        }
        CheckedTextView checkedTextView2 = this.f46069i;
        if (checkedTextView2 == null) {
            Intrinsics.m("noneTitle");
            throw null;
        }
        if (checkedTextView2 == null) {
            Intrinsics.m("noneTitle");
            throw null;
        }
        checkedTextView2.setChecked(checkedTextView == checkedTextView2);
        CheckedTextView checkedTextView3 = this.f46070j;
        if (checkedTextView3 == null) {
            Intrinsics.m("dynamicTitle");
            throw null;
        }
        if (checkedTextView3 == null) {
            Intrinsics.m("dynamicTitle");
            throw null;
        }
        checkedTextView3.setChecked(checkedTextView == checkedTextView3);
        CheckedTextView checkedTextView4 = this.f46071k;
        if (checkedTextView4 == null) {
            Intrinsics.m("dotsTitle");
            throw null;
        }
        if (checkedTextView4 == null) {
            Intrinsics.m("dotsTitle");
            throw null;
        }
        checkedTextView4.setChecked(checkedTextView == checkedTextView4);
        CheckedTextView checkedTextView5 = this.f46072l;
        if (checkedTextView5 == null) {
            Intrinsics.m("numericTitle");
            throw null;
        }
        if (checkedTextView5 != null) {
            checkedTextView5.setChecked(checkedTextView == checkedTextView5);
        } else {
            Intrinsics.m("numericTitle");
            throw null;
        }
    }

    public final void H(int i5, Function1 function1) {
        s sVar = (s) this.f46052e;
        if (sVar == null) {
            return;
        }
        FrameLayout frameLayout = sVar.f92535p;
        TextView textView = sVar.f92536q;
        Drawable drawable = requireContext().getDrawable(2131231730);
        Intrinsics.d(drawable);
        drawable.setColorFilter(p.b(requireContext(), 16842806), PorterDuff.Mode.SRC_ATOP);
        int iK = w20.e.k(24);
        drawable.setBounds(0, 0, iK, iK);
        textView.setCompoundDrawables(null, drawable, null, null);
        textView.setText(i5);
        frameLayout.setVisibility(0);
        frameLayout.setOnClickListener(new t(function1, 2));
    }

    @Override // androidx.fragment.app.h0
    public final void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        menuInflater.inflate(2131755012, menu);
    }

    @Override // androidx.fragment.app.h0
    public final boolean onOptionsItemSelected(MenuItem menuItem) throws IOException {
        if (menuItem.getItemId() != 2131427835) {
            return super.onOptionsItemSelected(menuItem);
        }
        Bundle bundle = new Bundle();
        Context contextRequireContext = requireContext();
        File file = new File(contextRequireContext.getCacheDir(), "fileprovider_temp/notificationDetails.txt");
        File parentFile = file.getParentFile();
        Intrinsics.d(parentFile);
        parentFile.mkdirs();
        try {
            BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(file));
            g gVarA = g.a();
            bufferedWriter.write("System badges: " + (Settings.Secure.getInt(requireContext().getContentResolver(), "notification_badging", 1) != 0) + "\n");
            bufferedWriter.write("Nova: enabled=" + A() + " running=" + (gVarA != null) + "\n");
            bufferedWriter.write("\n\nNotifications:\n");
            if (gVarA != null) {
                NotificationListenerService.RankingMap currentRanking = gVarA.getCurrentRanking();
                NotificationListenerService.Ranking ranking = new NotificationListenerService.Ranking();
                for (StatusBarNotification statusBarNotification : gVarA.getActiveNotifications()) {
                    currentRanking.getRanking(statusBarNotification.getKey(), ranking);
                    String packageName = statusBarNotification.getPackageName();
                    CharSequence charSequence = statusBarNotification.getNotification().extras.getCharSequence("android.title");
                    bufferedWriter.write(packageName + " title='" + (charSequence != null ? w20.o.a(charSequence) : null) + "' channel='" + statusBarNotification.getNotification().getChannelId() + "' canShowBadge=" + ranking.canShowBadge() + " onGoing=" + statusBarNotification.isOngoing() + "\n\n");
                }
            }
            bufferedWriter.close();
        } catch (IOException e3) {
            e3.printStackTrace();
        }
        file.deleteOnExit();
        bundle.putParcelable("supportDetailsUri", d.getUriForFile(contextRequireContext, "com.teslacoilsw.launcher.fileprovider", file));
        bundle.putString("title", "notificationDetails.txt");
        m0 activity = getActivity();
        Intrinsics.e(activity, "null cannot be cast to non-null type com.teslacoilsw.launcher.preferences.BaseSettingsActivity");
        ((e10.s) activity).Z(new SupportDetailsFragment(), bundle, true);
        return true;
    }

    @Override // com.teslacoilsw.launcher.preferences.fragments.NovaSettingsFragment, androidx.fragment.app.h0
    public final void onResume() throws Resources.NotFoundException {
        super.onResume();
        B();
    }

    @Override // androidx.fragment.app.h0
    public final void onViewCreated(View view, Bundle bundle) throws Resources.NotFoundException {
        B();
    }

    @Override // com.teslacoilsw.launcher.preferences.fragments.NovaSettingsFragmentBase
    /* renamed from: t, reason: from getter */
    public final int getF46068h() {
        return this.f46068h;
    }

    @Override // com.teslacoilsw.launcher.preferences.fragments.NovaSettingsFragmentBase
    public final boolean v() {
        if (!this.o) {
            return false;
        }
        z(false);
        return true;
    }

    @Override // com.teslacoilsw.launcher.preferences.fragments.NovaSettingsFragment
    public final l7.a x(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View viewInflate = layoutInflater.inflate(2131624325, viewGroup, false);
        int i5 = 2131427536;
        LinearLayout linearLayout = (LinearLayout) e0.x(2131427536, viewInflate);
        if (linearLayout != null) {
            i5 = 2131427537;
            if (((FancyPrefCardBorderView) e0.x(2131427537, viewInflate)) != null) {
                i5 = 2131427538;
                TextView textView = (TextView) e0.x(2131427538, viewInflate);
                if (textView != null) {
                    i5 = 2131427568;
                    View viewX = e0.x(2131427568, viewInflate);
                    if (viewX != null) {
                        i5 = 2131427702;
                        ColorPickerTextView colorPickerTextView = (ColorPickerTextView) e0.x(2131427702, viewInflate);
                        if (colorPickerTextView != null) {
                            i5 = 2131427703;
                            LinearLayout linearLayout2 = (LinearLayout) e0.x(2131427703, viewInflate);
                            if (linearLayout2 != null) {
                                i5 = 2131427705;
                                ColorPickerTextView colorPickerTextView2 = (ColorPickerTextView) e0.x(2131427705, viewInflate);
                                if (colorPickerTextView2 != null) {
                                    i5 = 2131427706;
                                    ColorPickerTextView colorPickerTextView3 = (ColorPickerTextView) e0.x(2131427706, viewInflate);
                                    if (colorPickerTextView3 != null) {
                                        i5 = 2131427777;
                                        LinearLayout linearLayout3 = (LinearLayout) e0.x(2131427777, viewInflate);
                                        if (linearLayout3 != null) {
                                            i5 = 2131427929;
                                            LinearLayout linearLayout4 = (LinearLayout) e0.x(2131427929, viewInflate);
                                            if (linearLayout4 != null) {
                                                i5 = 2131428260;
                                                if (((RadioButton) e0.x(2131428260, viewInflate)) != null) {
                                                    i5 = 2131428317;
                                                    FancyPrefCheckableView fancyPrefCheckableView = (FancyPrefCheckableView) e0.x(2131428317, viewInflate);
                                                    if (fancyPrefCheckableView != null) {
                                                        i5 = 2131428346;
                                                        if (((RadioButton) e0.x(2131428346, viewInflate)) != null) {
                                                            i5 = 2131428467;
                                                            if (((FancyPrefCheckableView) e0.x(2131428467, viewInflate)) != null) {
                                                                i5 = 2131428593;
                                                                if (((RadioButton) e0.x(2131428593, viewInflate)) != null) {
                                                                    i5 = 2131428594;
                                                                    if (((RadioButton) e0.x(2131428594, viewInflate)) != null) {
                                                                        i5 = 2131428595;
                                                                        if (((RadioButton) e0.x(2131428595, viewInflate)) != null) {
                                                                            i5 = 2131428596;
                                                                            if (((RadioButton) e0.x(2131428596, viewInflate)) != null) {
                                                                                i5 = 2131428614;
                                                                                if (((RadioButton) e0.x(2131428614, viewInflate)) != null) {
                                                                                    i5 = 2131428615;
                                                                                    if (((RadioButton) e0.x(2131428615, viewInflate)) != null) {
                                                                                        i5 = 2131428616;
                                                                                        if (((RadioButton) e0.x(2131428616, viewInflate)) != null) {
                                                                                            i5 = 2131428617;
                                                                                            if (((RadioButton) e0.x(2131428617, viewInflate)) != null) {
                                                                                                i5 = 2131428620;
                                                                                                if (((BadgeArtIconPreview) e0.x(2131428620, viewInflate)) != null) {
                                                                                                    i5 = 2131428674;
                                                                                                    if (((RadioGrid) e0.x(2131428674, viewInflate)) != null) {
                                                                                                        i5 = 2131428675;
                                                                                                        if (((RadioGroup) e0.x(2131428675, viewInflate)) != null) {
                                                                                                            i5 = 2131428676;
                                                                                                            if (((RadioGroup) e0.x(2131428676, viewInflate)) != null) {
                                                                                                                i5 = 2131428790;
                                                                                                                FancyPrefCornerRadiusSeekBarView fancyPrefCornerRadiusSeekBarView = (FancyPrefCornerRadiusSeekBarView) e0.x(2131428790, viewInflate);
                                                                                                                if (fancyPrefCornerRadiusSeekBarView != null) {
                                                                                                                    i5 = 2131428793;
                                                                                                                    LinearLayout linearLayout5 = (LinearLayout) e0.x(2131428793, viewInflate);
                                                                                                                    if (linearLayout5 != null) {
                                                                                                                        i5 = 2131428794;
                                                                                                                        FrameLayout frameLayout = (FrameLayout) e0.x(2131428794, viewInflate);
                                                                                                                        if (frameLayout != null) {
                                                                                                                            i5 = 2131428795;
                                                                                                                            LinearLayout linearLayout6 = (LinearLayout) e0.x(2131428795, viewInflate);
                                                                                                                            if (linearLayout6 != null) {
                                                                                                                                i5 = 2131428846;
                                                                                                                                LinearLayout linearLayout7 = (LinearLayout) e0.x(2131428846, viewInflate);
                                                                                                                                if (linearLayout7 != null) {
                                                                                                                                    i5 = 2131428870;
                                                                                                                                    if (((RadioButton) e0.x(2131428870, viewInflate)) != null) {
                                                                                                                                        i5 = 2131428998;
                                                                                                                                        FancyPrefView fancyPrefView = (FancyPrefView) e0.x(2131428998, viewInflate);
                                                                                                                                        if (fancyPrefView != null) {
                                                                                                                                            i5 = 2131429031;
                                                                                                                                            if (((TextView) e0.x(2131429031, viewInflate)) != null) {
                                                                                                                                                i5 = 2131429185;
                                                                                                                                                FrameLayout frameLayout2 = (FrameLayout) e0.x(2131429185, viewInflate);
                                                                                                                                                if (frameLayout2 != null) {
                                                                                                                                                    i5 = 2131429186;
                                                                                                                                                    TextView textView2 = (TextView) e0.x(2131429186, viewInflate);
                                                                                                                                                    if (textView2 != null) {
                                                                                                                                                        s sVar = new s((ScrollView) viewInflate, linearLayout, textView, viewX, colorPickerTextView, linearLayout2, colorPickerTextView2, colorPickerTextView3, linearLayout3, linearLayout4, fancyPrefCheckableView, fancyPrefCornerRadiusSeekBarView, linearLayout5, frameLayout, linearLayout6, linearLayout7, fancyPrefView, frameLayout2, textView2);
                                                                                                                                                        if ((requireActivity().getResources().getConfiguration().uiMode & 48) == 32) {
                                                                                                                                                            linearLayout6.setBackgroundColor(((Number) y2.f51877a.P0().l()).intValue());
                                                                                                                                                        }
                                                                                                                                                        View viewInflate2 = layoutInflater.inflate(2131624326, (ViewGroup) linearLayout6, false);
                                                                                                                                                        CheckedTextView checkedTextView = (CheckedTextView) viewInflate2.findViewById(16908310);
                                                                                                                                                        this.f46069i = checkedTextView;
                                                                                                                                                        if (checkedTextView == null) {
                                                                                                                                                            Intrinsics.m("noneTitle");
                                                                                                                                                            throw null;
                                                                                                                                                        }
                                                                                                                                                        checkedTextView.setText(2132018734);
                                                                                                                                                        viewInflate2.findViewById(16908304).setVisibility(8);
                                                                                                                                                        final int i11 = 0;
                                                                                                                                                        viewInflate2.setOnClickListener(new View.OnClickListener(this) { // from class: h10.y

                                                                                                                                                            /* renamed from: b, reason: collision with root package name */
                                                                                                                                                            public final /* synthetic */ SettingsBadges f59006b;

                                                                                                                                                            {
                                                                                                                                                                this.f59006b = this;
                                                                                                                                                            }

                                                                                                                                                            @Override // android.view.View.OnClickListener
                                                                                                                                                            public final void onClick(View view) throws Resources.NotFoundException {
                                                                                                                                                                switch (i11) {
                                                                                                                                                                    case 0:
                                                                                                                                                                        p4 p4Var = p4.f51743c;
                                                                                                                                                                        SettingsBadges settingsBadges = this.f59006b;
                                                                                                                                                                        settingsBadges.F(false, p4Var);
                                                                                                                                                                        settingsBadges.B();
                                                                                                                                                                        settingsBadges.z(false);
                                                                                                                                                                        break;
                                                                                                                                                                    case 1:
                                                                                                                                                                        p4 p4Var2 = p4.f51743c;
                                                                                                                                                                        SettingsBadges settingsBadges2 = this.f59006b;
                                                                                                                                                                        settingsBadges2.F(true, p4Var2);
                                                                                                                                                                        settingsBadges2.B();
                                                                                                                                                                        if (ha.g.a() == null) {
                                                                                                                                                                            settingsBadges2.o = false;
                                                                                                                                                                            break;
                                                                                                                                                                        } else {
                                                                                                                                                                            settingsBadges2.z(false);
                                                                                                                                                                            break;
                                                                                                                                                                        }
                                                                                                                                                                    case 2:
                                                                                                                                                                        p4 p4Var3 = p4.f51744d;
                                                                                                                                                                        SettingsBadges settingsBadges3 = this.f59006b;
                                                                                                                                                                        settingsBadges3.F(true, p4Var3);
                                                                                                                                                                        settingsBadges3.B();
                                                                                                                                                                        if (ha.g.a() == null) {
                                                                                                                                                                            settingsBadges3.o = false;
                                                                                                                                                                            break;
                                                                                                                                                                        } else {
                                                                                                                                                                            settingsBadges3.z(false);
                                                                                                                                                                            break;
                                                                                                                                                                        }
                                                                                                                                                                    case 3:
                                                                                                                                                                        p4 p4Var4 = p4.f51745e;
                                                                                                                                                                        SettingsBadges settingsBadges4 = this.f59006b;
                                                                                                                                                                        settingsBadges4.F(true, p4Var4);
                                                                                                                                                                        settingsBadges4.B();
                                                                                                                                                                        if (ha.g.a() == null) {
                                                                                                                                                                            settingsBadges4.o = false;
                                                                                                                                                                            break;
                                                                                                                                                                        } else {
                                                                                                                                                                            settingsBadges4.z(false);
                                                                                                                                                                            break;
                                                                                                                                                                        }
                                                                                                                                                                    case 4:
                                                                                                                                                                        this.f59006b.z(!r6.n);
                                                                                                                                                                        break;
                                                                                                                                                                    default:
                                                                                                                                                                        Context contextRequireContext = this.f59006b.requireContext();
                                                                                                                                                                        Uri uri = Settings.System.DEFAULT_NOTIFICATION_URI;
                                                                                                                                                                        AudioAttributes audioAttributes = Notification.AUDIO_ATTRIBUTES_DEFAULT;
                                                                                                                                                                        n4.n0 n0Var = new n4.n0(contextRequireContext);
                                                                                                                                                                        NotificationChannel notificationChannel = new NotificationChannel("test", "debug", 3);
                                                                                                                                                                        notificationChannel.setDescription("Test notification badges");
                                                                                                                                                                        notificationChannel.setGroup(null);
                                                                                                                                                                        notificationChannel.setShowBadge(true);
                                                                                                                                                                        notificationChannel.setSound(null, null);
                                                                                                                                                                        notificationChannel.enableLights(false);
                                                                                                                                                                        notificationChannel.setLightColor(0);
                                                                                                                                                                        notificationChannel.setVibrationPattern(null);
                                                                                                                                                                        notificationChannel.enableVibration(false);
                                                                                                                                                                        n0Var.f77841b.createNotificationChannel(notificationChannel);
                                                                                                                                                                        Drawable drawable = contextRequireContext.getDrawable(2131231529);
                                                                                                                                                                        Intrinsics.d(drawable);
                                                                                                                                                                        Bitmap bitmapY = ab.e0.Y(drawable, h6.c1.h(contextRequireContext, 48), bh.g.N(contextRequireContext.getResources().getDisplayMetrics(), 48), 4);
                                                                                                                                                                        n4.r rVar = new n4.r(contextRequireContext, "test");
                                                                                                                                                                        rVar.f77870s.icon = 2131231724;
                                                                                                                                                                        rVar.i(bitmapY);
                                                                                                                                                                        rVar.f77858e = n4.r.c("Nova");
                                                                                                                                                                        rVar.f77859f = n4.r.c("This is a test notification, check the Nova Settings icon for it's badge");
                                                                                                                                                                        n4.p pVar = new n4.p(false);
                                                                                                                                                                        pVar.f77847f = n4.r.c("This is a test notification, check the Nova Settings icon for it's badge");
                                                                                                                                                                        rVar.m(pVar);
                                                                                                                                                                        new n4.n0(contextRequireContext).e((int) SystemClock.uptimeMillis(), rVar.b());
                                                                                                                                                                        break;
                                                                                                                                                                }
                                                                                                                                                            }
                                                                                                                                                        });
                                                                                                                                                        linearLayout6.addView(viewInflate2);
                                                                                                                                                        View viewInflate3 = layoutInflater.inflate(2131624326, (ViewGroup) linearLayout6, false);
                                                                                                                                                        CheckedTextView checkedTextView2 = (CheckedTextView) viewInflate3.findViewById(16908310);
                                                                                                                                                        this.f46070j = checkedTextView2;
                                                                                                                                                        if (checkedTextView2 == null) {
                                                                                                                                                            Intrinsics.m("dynamicTitle");
                                                                                                                                                            throw null;
                                                                                                                                                        }
                                                                                                                                                        checkedTextView2.setText(2132017551);
                                                                                                                                                        View viewFindViewById = viewInflate3.findViewById(16908304);
                                                                                                                                                        Intrinsics.e(viewFindViewById, "null cannot be cast to non-null type android.widget.TextView");
                                                                                                                                                        ((TextView) viewFindViewById).setText(2132017552);
                                                                                                                                                        final int i12 = 1;
                                                                                                                                                        viewInflate3.setOnClickListener(new View.OnClickListener(this) { // from class: h10.y

                                                                                                                                                            /* renamed from: b, reason: collision with root package name */
                                                                                                                                                            public final /* synthetic */ SettingsBadges f59006b;

                                                                                                                                                            {
                                                                                                                                                                this.f59006b = this;
                                                                                                                                                            }

                                                                                                                                                            @Override // android.view.View.OnClickListener
                                                                                                                                                            public final void onClick(View view) throws Resources.NotFoundException {
                                                                                                                                                                switch (i12) {
                                                                                                                                                                    case 0:
                                                                                                                                                                        p4 p4Var = p4.f51743c;
                                                                                                                                                                        SettingsBadges settingsBadges = this.f59006b;
                                                                                                                                                                        settingsBadges.F(false, p4Var);
                                                                                                                                                                        settingsBadges.B();
                                                                                                                                                                        settingsBadges.z(false);
                                                                                                                                                                        break;
                                                                                                                                                                    case 1:
                                                                                                                                                                        p4 p4Var2 = p4.f51743c;
                                                                                                                                                                        SettingsBadges settingsBadges2 = this.f59006b;
                                                                                                                                                                        settingsBadges2.F(true, p4Var2);
                                                                                                                                                                        settingsBadges2.B();
                                                                                                                                                                        if (ha.g.a() == null) {
                                                                                                                                                                            settingsBadges2.o = false;
                                                                                                                                                                            break;
                                                                                                                                                                        } else {
                                                                                                                                                                            settingsBadges2.z(false);
                                                                                                                                                                            break;
                                                                                                                                                                        }
                                                                                                                                                                    case 2:
                                                                                                                                                                        p4 p4Var3 = p4.f51744d;
                                                                                                                                                                        SettingsBadges settingsBadges3 = this.f59006b;
                                                                                                                                                                        settingsBadges3.F(true, p4Var3);
                                                                                                                                                                        settingsBadges3.B();
                                                                                                                                                                        if (ha.g.a() == null) {
                                                                                                                                                                            settingsBadges3.o = false;
                                                                                                                                                                            break;
                                                                                                                                                                        } else {
                                                                                                                                                                            settingsBadges3.z(false);
                                                                                                                                                                            break;
                                                                                                                                                                        }
                                                                                                                                                                    case 3:
                                                                                                                                                                        p4 p4Var4 = p4.f51745e;
                                                                                                                                                                        SettingsBadges settingsBadges4 = this.f59006b;
                                                                                                                                                                        settingsBadges4.F(true, p4Var4);
                                                                                                                                                                        settingsBadges4.B();
                                                                                                                                                                        if (ha.g.a() == null) {
                                                                                                                                                                            settingsBadges4.o = false;
                                                                                                                                                                            break;
                                                                                                                                                                        } else {
                                                                                                                                                                            settingsBadges4.z(false);
                                                                                                                                                                            break;
                                                                                                                                                                        }
                                                                                                                                                                    case 4:
                                                                                                                                                                        this.f59006b.z(!r6.n);
                                                                                                                                                                        break;
                                                                                                                                                                    default:
                                                                                                                                                                        Context contextRequireContext = this.f59006b.requireContext();
                                                                                                                                                                        Uri uri = Settings.System.DEFAULT_NOTIFICATION_URI;
                                                                                                                                                                        AudioAttributes audioAttributes = Notification.AUDIO_ATTRIBUTES_DEFAULT;
                                                                                                                                                                        n4.n0 n0Var = new n4.n0(contextRequireContext);
                                                                                                                                                                        NotificationChannel notificationChannel = new NotificationChannel("test", "debug", 3);
                                                                                                                                                                        notificationChannel.setDescription("Test notification badges");
                                                                                                                                                                        notificationChannel.setGroup(null);
                                                                                                                                                                        notificationChannel.setShowBadge(true);
                                                                                                                                                                        notificationChannel.setSound(null, null);
                                                                                                                                                                        notificationChannel.enableLights(false);
                                                                                                                                                                        notificationChannel.setLightColor(0);
                                                                                                                                                                        notificationChannel.setVibrationPattern(null);
                                                                                                                                                                        notificationChannel.enableVibration(false);
                                                                                                                                                                        n0Var.f77841b.createNotificationChannel(notificationChannel);
                                                                                                                                                                        Drawable drawable = contextRequireContext.getDrawable(2131231529);
                                                                                                                                                                        Intrinsics.d(drawable);
                                                                                                                                                                        Bitmap bitmapY = ab.e0.Y(drawable, h6.c1.h(contextRequireContext, 48), bh.g.N(contextRequireContext.getResources().getDisplayMetrics(), 48), 4);
                                                                                                                                                                        n4.r rVar = new n4.r(contextRequireContext, "test");
                                                                                                                                                                        rVar.f77870s.icon = 2131231724;
                                                                                                                                                                        rVar.i(bitmapY);
                                                                                                                                                                        rVar.f77858e = n4.r.c("Nova");
                                                                                                                                                                        rVar.f77859f = n4.r.c("This is a test notification, check the Nova Settings icon for it's badge");
                                                                                                                                                                        n4.p pVar = new n4.p(false);
                                                                                                                                                                        pVar.f77847f = n4.r.c("This is a test notification, check the Nova Settings icon for it's badge");
                                                                                                                                                                        rVar.m(pVar);
                                                                                                                                                                        new n4.n0(contextRequireContext).e((int) SystemClock.uptimeMillis(), rVar.b());
                                                                                                                                                                        break;
                                                                                                                                                                }
                                                                                                                                                            }
                                                                                                                                                        });
                                                                                                                                                        final int i13 = 0;
                                                                                                                                                        viewInflate3.setOnLongClickListener(new View.OnLongClickListener(this) { // from class: h10.z

                                                                                                                                                            /* renamed from: b, reason: collision with root package name */
                                                                                                                                                            public final /* synthetic */ SettingsBadges f59010b;

                                                                                                                                                            {
                                                                                                                                                                this.f59010b = this;
                                                                                                                                                            }

                                                                                                                                                            @Override // android.view.View.OnLongClickListener
                                                                                                                                                            public final boolean onLongClick(View view) {
                                                                                                                                                                switch (i13) {
                                                                                                                                                                    case 0:
                                                                                                                                                                        this.f59010b.E();
                                                                                                                                                                        break;
                                                                                                                                                                    case 1:
                                                                                                                                                                        this.f59010b.E();
                                                                                                                                                                        break;
                                                                                                                                                                    default:
                                                                                                                                                                        this.f59010b.E();
                                                                                                                                                                        break;
                                                                                                                                                                }
                                                                                                                                                                return true;
                                                                                                                                                            }
                                                                                                                                                        });
                                                                                                                                                        linearLayout6.addView(viewInflate3);
                                                                                                                                                        View viewInflate4 = layoutInflater.inflate(2131624326, (ViewGroup) linearLayout6, false);
                                                                                                                                                        CheckedTextView checkedTextView3 = (CheckedTextView) viewInflate4.findViewById(16908310);
                                                                                                                                                        this.f46071k = checkedTextView3;
                                                                                                                                                        if (checkedTextView3 == null) {
                                                                                                                                                            Intrinsics.m("dotsTitle");
                                                                                                                                                            throw null;
                                                                                                                                                        }
                                                                                                                                                        checkedTextView3.setText(2132017549);
                                                                                                                                                        View viewFindViewById2 = viewInflate4.findViewById(16908304);
                                                                                                                                                        Intrinsics.e(viewFindViewById2, "null cannot be cast to non-null type android.widget.TextView");
                                                                                                                                                        ((TextView) viewFindViewById2).setText(2132017550);
                                                                                                                                                        final int i14 = 2;
                                                                                                                                                        viewInflate4.setOnClickListener(new View.OnClickListener(this) { // from class: h10.y

                                                                                                                                                            /* renamed from: b, reason: collision with root package name */
                                                                                                                                                            public final /* synthetic */ SettingsBadges f59006b;

                                                                                                                                                            {
                                                                                                                                                                this.f59006b = this;
                                                                                                                                                            }

                                                                                                                                                            @Override // android.view.View.OnClickListener
                                                                                                                                                            public final void onClick(View view) throws Resources.NotFoundException {
                                                                                                                                                                switch (i14) {
                                                                                                                                                                    case 0:
                                                                                                                                                                        p4 p4Var = p4.f51743c;
                                                                                                                                                                        SettingsBadges settingsBadges = this.f59006b;
                                                                                                                                                                        settingsBadges.F(false, p4Var);
                                                                                                                                                                        settingsBadges.B();
                                                                                                                                                                        settingsBadges.z(false);
                                                                                                                                                                        break;
                                                                                                                                                                    case 1:
                                                                                                                                                                        p4 p4Var2 = p4.f51743c;
                                                                                                                                                                        SettingsBadges settingsBadges2 = this.f59006b;
                                                                                                                                                                        settingsBadges2.F(true, p4Var2);
                                                                                                                                                                        settingsBadges2.B();
                                                                                                                                                                        if (ha.g.a() == null) {
                                                                                                                                                                            settingsBadges2.o = false;
                                                                                                                                                                            break;
                                                                                                                                                                        } else {
                                                                                                                                                                            settingsBadges2.z(false);
                                                                                                                                                                            break;
                                                                                                                                                                        }
                                                                                                                                                                    case 2:
                                                                                                                                                                        p4 p4Var3 = p4.f51744d;
                                                                                                                                                                        SettingsBadges settingsBadges3 = this.f59006b;
                                                                                                                                                                        settingsBadges3.F(true, p4Var3);
                                                                                                                                                                        settingsBadges3.B();
                                                                                                                                                                        if (ha.g.a() == null) {
                                                                                                                                                                            settingsBadges3.o = false;
                                                                                                                                                                            break;
                                                                                                                                                                        } else {
                                                                                                                                                                            settingsBadges3.z(false);
                                                                                                                                                                            break;
                                                                                                                                                                        }
                                                                                                                                                                    case 3:
                                                                                                                                                                        p4 p4Var4 = p4.f51745e;
                                                                                                                                                                        SettingsBadges settingsBadges4 = this.f59006b;
                                                                                                                                                                        settingsBadges4.F(true, p4Var4);
                                                                                                                                                                        settingsBadges4.B();
                                                                                                                                                                        if (ha.g.a() == null) {
                                                                                                                                                                            settingsBadges4.o = false;
                                                                                                                                                                            break;
                                                                                                                                                                        } else {
                                                                                                                                                                            settingsBadges4.z(false);
                                                                                                                                                                            break;
                                                                                                                                                                        }
                                                                                                                                                                    case 4:
                                                                                                                                                                        this.f59006b.z(!r6.n);
                                                                                                                                                                        break;
                                                                                                                                                                    default:
                                                                                                                                                                        Context contextRequireContext = this.f59006b.requireContext();
                                                                                                                                                                        Uri uri = Settings.System.DEFAULT_NOTIFICATION_URI;
                                                                                                                                                                        AudioAttributes audioAttributes = Notification.AUDIO_ATTRIBUTES_DEFAULT;
                                                                                                                                                                        n4.n0 n0Var = new n4.n0(contextRequireContext);
                                                                                                                                                                        NotificationChannel notificationChannel = new NotificationChannel("test", "debug", 3);
                                                                                                                                                                        notificationChannel.setDescription("Test notification badges");
                                                                                                                                                                        notificationChannel.setGroup(null);
                                                                                                                                                                        notificationChannel.setShowBadge(true);
                                                                                                                                                                        notificationChannel.setSound(null, null);
                                                                                                                                                                        notificationChannel.enableLights(false);
                                                                                                                                                                        notificationChannel.setLightColor(0);
                                                                                                                                                                        notificationChannel.setVibrationPattern(null);
                                                                                                                                                                        notificationChannel.enableVibration(false);
                                                                                                                                                                        n0Var.f77841b.createNotificationChannel(notificationChannel);
                                                                                                                                                                        Drawable drawable = contextRequireContext.getDrawable(2131231529);
                                                                                                                                                                        Intrinsics.d(drawable);
                                                                                                                                                                        Bitmap bitmapY = ab.e0.Y(drawable, h6.c1.h(contextRequireContext, 48), bh.g.N(contextRequireContext.getResources().getDisplayMetrics(), 48), 4);
                                                                                                                                                                        n4.r rVar = new n4.r(contextRequireContext, "test");
                                                                                                                                                                        rVar.f77870s.icon = 2131231724;
                                                                                                                                                                        rVar.i(bitmapY);
                                                                                                                                                                        rVar.f77858e = n4.r.c("Nova");
                                                                                                                                                                        rVar.f77859f = n4.r.c("This is a test notification, check the Nova Settings icon for it's badge");
                                                                                                                                                                        n4.p pVar = new n4.p(false);
                                                                                                                                                                        pVar.f77847f = n4.r.c("This is a test notification, check the Nova Settings icon for it's badge");
                                                                                                                                                                        rVar.m(pVar);
                                                                                                                                                                        new n4.n0(contextRequireContext).e((int) SystemClock.uptimeMillis(), rVar.b());
                                                                                                                                                                        break;
                                                                                                                                                                }
                                                                                                                                                            }
                                                                                                                                                        });
                                                                                                                                                        final int i15 = 1;
                                                                                                                                                        viewInflate4.setOnLongClickListener(new View.OnLongClickListener(this) { // from class: h10.z

                                                                                                                                                            /* renamed from: b, reason: collision with root package name */
                                                                                                                                                            public final /* synthetic */ SettingsBadges f59010b;

                                                                                                                                                            {
                                                                                                                                                                this.f59010b = this;
                                                                                                                                                            }

                                                                                                                                                            @Override // android.view.View.OnLongClickListener
                                                                                                                                                            public final boolean onLongClick(View view) {
                                                                                                                                                                switch (i15) {
                                                                                                                                                                    case 0:
                                                                                                                                                                        this.f59010b.E();
                                                                                                                                                                        break;
                                                                                                                                                                    case 1:
                                                                                                                                                                        this.f59010b.E();
                                                                                                                                                                        break;
                                                                                                                                                                    default:
                                                                                                                                                                        this.f59010b.E();
                                                                                                                                                                        break;
                                                                                                                                                                }
                                                                                                                                                                return true;
                                                                                                                                                            }
                                                                                                                                                        });
                                                                                                                                                        linearLayout6.addView(viewInflate4);
                                                                                                                                                        View viewInflate5 = layoutInflater.inflate(2131624326, (ViewGroup) linearLayout6, false);
                                                                                                                                                        CheckedTextView checkedTextView4 = (CheckedTextView) viewInflate5.findViewById(16908310);
                                                                                                                                                        this.f46072l = checkedTextView4;
                                                                                                                                                        if (checkedTextView4 == null) {
                                                                                                                                                            Intrinsics.m("numericTitle");
                                                                                                                                                            throw null;
                                                                                                                                                        }
                                                                                                                                                        checkedTextView4.setText(2132017553);
                                                                                                                                                        View viewFindViewById3 = viewInflate5.findViewById(16908304);
                                                                                                                                                        Intrinsics.e(viewFindViewById3, "null cannot be cast to non-null type android.widget.TextView");
                                                                                                                                                        ((TextView) viewFindViewById3).setText(2132017554);
                                                                                                                                                        final int i16 = 3;
                                                                                                                                                        viewInflate5.setOnClickListener(new View.OnClickListener(this) { // from class: h10.y

                                                                                                                                                            /* renamed from: b, reason: collision with root package name */
                                                                                                                                                            public final /* synthetic */ SettingsBadges f59006b;

                                                                                                                                                            {
                                                                                                                                                                this.f59006b = this;
                                                                                                                                                            }

                                                                                                                                                            @Override // android.view.View.OnClickListener
                                                                                                                                                            public final void onClick(View view) throws Resources.NotFoundException {
                                                                                                                                                                switch (i16) {
                                                                                                                                                                    case 0:
                                                                                                                                                                        p4 p4Var = p4.f51743c;
                                                                                                                                                                        SettingsBadges settingsBadges = this.f59006b;
                                                                                                                                                                        settingsBadges.F(false, p4Var);
                                                                                                                                                                        settingsBadges.B();
                                                                                                                                                                        settingsBadges.z(false);
                                                                                                                                                                        break;
                                                                                                                                                                    case 1:
                                                                                                                                                                        p4 p4Var2 = p4.f51743c;
                                                                                                                                                                        SettingsBadges settingsBadges2 = this.f59006b;
                                                                                                                                                                        settingsBadges2.F(true, p4Var2);
                                                                                                                                                                        settingsBadges2.B();
                                                                                                                                                                        if (ha.g.a() == null) {
                                                                                                                                                                            settingsBadges2.o = false;
                                                                                                                                                                            break;
                                                                                                                                                                        } else {
                                                                                                                                                                            settingsBadges2.z(false);
                                                                                                                                                                            break;
                                                                                                                                                                        }
                                                                                                                                                                    case 2:
                                                                                                                                                                        p4 p4Var3 = p4.f51744d;
                                                                                                                                                                        SettingsBadges settingsBadges3 = this.f59006b;
                                                                                                                                                                        settingsBadges3.F(true, p4Var3);
                                                                                                                                                                        settingsBadges3.B();
                                                                                                                                                                        if (ha.g.a() == null) {
                                                                                                                                                                            settingsBadges3.o = false;
                                                                                                                                                                            break;
                                                                                                                                                                        } else {
                                                                                                                                                                            settingsBadges3.z(false);
                                                                                                                                                                            break;
                                                                                                                                                                        }
                                                                                                                                                                    case 3:
                                                                                                                                                                        p4 p4Var4 = p4.f51745e;
                                                                                                                                                                        SettingsBadges settingsBadges4 = this.f59006b;
                                                                                                                                                                        settingsBadges4.F(true, p4Var4);
                                                                                                                                                                        settingsBadges4.B();
                                                                                                                                                                        if (ha.g.a() == null) {
                                                                                                                                                                            settingsBadges4.o = false;
                                                                                                                                                                            break;
                                                                                                                                                                        } else {
                                                                                                                                                                            settingsBadges4.z(false);
                                                                                                                                                                            break;
                                                                                                                                                                        }
                                                                                                                                                                    case 4:
                                                                                                                                                                        this.f59006b.z(!r6.n);
                                                                                                                                                                        break;
                                                                                                                                                                    default:
                                                                                                                                                                        Context contextRequireContext = this.f59006b.requireContext();
                                                                                                                                                                        Uri uri = Settings.System.DEFAULT_NOTIFICATION_URI;
                                                                                                                                                                        AudioAttributes audioAttributes = Notification.AUDIO_ATTRIBUTES_DEFAULT;
                                                                                                                                                                        n4.n0 n0Var = new n4.n0(contextRequireContext);
                                                                                                                                                                        NotificationChannel notificationChannel = new NotificationChannel("test", "debug", 3);
                                                                                                                                                                        notificationChannel.setDescription("Test notification badges");
                                                                                                                                                                        notificationChannel.setGroup(null);
                                                                                                                                                                        notificationChannel.setShowBadge(true);
                                                                                                                                                                        notificationChannel.setSound(null, null);
                                                                                                                                                                        notificationChannel.enableLights(false);
                                                                                                                                                                        notificationChannel.setLightColor(0);
                                                                                                                                                                        notificationChannel.setVibrationPattern(null);
                                                                                                                                                                        notificationChannel.enableVibration(false);
                                                                                                                                                                        n0Var.f77841b.createNotificationChannel(notificationChannel);
                                                                                                                                                                        Drawable drawable = contextRequireContext.getDrawable(2131231529);
                                                                                                                                                                        Intrinsics.d(drawable);
                                                                                                                                                                        Bitmap bitmapY = ab.e0.Y(drawable, h6.c1.h(contextRequireContext, 48), bh.g.N(contextRequireContext.getResources().getDisplayMetrics(), 48), 4);
                                                                                                                                                                        n4.r rVar = new n4.r(contextRequireContext, "test");
                                                                                                                                                                        rVar.f77870s.icon = 2131231724;
                                                                                                                                                                        rVar.i(bitmapY);
                                                                                                                                                                        rVar.f77858e = n4.r.c("Nova");
                                                                                                                                                                        rVar.f77859f = n4.r.c("This is a test notification, check the Nova Settings icon for it's badge");
                                                                                                                                                                        n4.p pVar = new n4.p(false);
                                                                                                                                                                        pVar.f77847f = n4.r.c("This is a test notification, check the Nova Settings icon for it's badge");
                                                                                                                                                                        rVar.m(pVar);
                                                                                                                                                                        new n4.n0(contextRequireContext).e((int) SystemClock.uptimeMillis(), rVar.b());
                                                                                                                                                                        break;
                                                                                                                                                                }
                                                                                                                                                            }
                                                                                                                                                        });
                                                                                                                                                        final int i17 = 2;
                                                                                                                                                        viewInflate5.setOnLongClickListener(new View.OnLongClickListener(this) { // from class: h10.z

                                                                                                                                                            /* renamed from: b, reason: collision with root package name */
                                                                                                                                                            public final /* synthetic */ SettingsBadges f59010b;

                                                                                                                                                            {
                                                                                                                                                                this.f59010b = this;
                                                                                                                                                            }

                                                                                                                                                            @Override // android.view.View.OnLongClickListener
                                                                                                                                                            public final boolean onLongClick(View view) {
                                                                                                                                                                switch (i17) {
                                                                                                                                                                    case 0:
                                                                                                                                                                        this.f59010b.E();
                                                                                                                                                                        break;
                                                                                                                                                                    case 1:
                                                                                                                                                                        this.f59010b.E();
                                                                                                                                                                        break;
                                                                                                                                                                    default:
                                                                                                                                                                        this.f59010b.E();
                                                                                                                                                                        break;
                                                                                                                                                                }
                                                                                                                                                                return true;
                                                                                                                                                            }
                                                                                                                                                        });
                                                                                                                                                        linearLayout6.addView(viewInflate5);
                                                                                                                                                        final int i18 = 4;
                                                                                                                                                        linearLayout.setOnClickListener(new View.OnClickListener(this) { // from class: h10.y

                                                                                                                                                            /* renamed from: b, reason: collision with root package name */
                                                                                                                                                            public final /* synthetic */ SettingsBadges f59006b;

                                                                                                                                                            {
                                                                                                                                                                this.f59006b = this;
                                                                                                                                                            }

                                                                                                                                                            @Override // android.view.View.OnClickListener
                                                                                                                                                            public final void onClick(View view) throws Resources.NotFoundException {
                                                                                                                                                                switch (i18) {
                                                                                                                                                                    case 0:
                                                                                                                                                                        p4 p4Var = p4.f51743c;
                                                                                                                                                                        SettingsBadges settingsBadges = this.f59006b;
                                                                                                                                                                        settingsBadges.F(false, p4Var);
                                                                                                                                                                        settingsBadges.B();
                                                                                                                                                                        settingsBadges.z(false);
                                                                                                                                                                        break;
                                                                                                                                                                    case 1:
                                                                                                                                                                        p4 p4Var2 = p4.f51743c;
                                                                                                                                                                        SettingsBadges settingsBadges2 = this.f59006b;
                                                                                                                                                                        settingsBadges2.F(true, p4Var2);
                                                                                                                                                                        settingsBadges2.B();
                                                                                                                                                                        if (ha.g.a() == null) {
                                                                                                                                                                            settingsBadges2.o = false;
                                                                                                                                                                            break;
                                                                                                                                                                        } else {
                                                                                                                                                                            settingsBadges2.z(false);
                                                                                                                                                                            break;
                                                                                                                                                                        }
                                                                                                                                                                    case 2:
                                                                                                                                                                        p4 p4Var3 = p4.f51744d;
                                                                                                                                                                        SettingsBadges settingsBadges3 = this.f59006b;
                                                                                                                                                                        settingsBadges3.F(true, p4Var3);
                                                                                                                                                                        settingsBadges3.B();
                                                                                                                                                                        if (ha.g.a() == null) {
                                                                                                                                                                            settingsBadges3.o = false;
                                                                                                                                                                            break;
                                                                                                                                                                        } else {
                                                                                                                                                                            settingsBadges3.z(false);
                                                                                                                                                                            break;
                                                                                                                                                                        }
                                                                                                                                                                    case 3:
                                                                                                                                                                        p4 p4Var4 = p4.f51745e;
                                                                                                                                                                        SettingsBadges settingsBadges4 = this.f59006b;
                                                                                                                                                                        settingsBadges4.F(true, p4Var4);
                                                                                                                                                                        settingsBadges4.B();
                                                                                                                                                                        if (ha.g.a() == null) {
                                                                                                                                                                            settingsBadges4.o = false;
                                                                                                                                                                            break;
                                                                                                                                                                        } else {
                                                                                                                                                                            settingsBadges4.z(false);
                                                                                                                                                                            break;
                                                                                                                                                                        }
                                                                                                                                                                    case 4:
                                                                                                                                                                        this.f59006b.z(!r6.n);
                                                                                                                                                                        break;
                                                                                                                                                                    default:
                                                                                                                                                                        Context contextRequireContext = this.f59006b.requireContext();
                                                                                                                                                                        Uri uri = Settings.System.DEFAULT_NOTIFICATION_URI;
                                                                                                                                                                        AudioAttributes audioAttributes = Notification.AUDIO_ATTRIBUTES_DEFAULT;
                                                                                                                                                                        n4.n0 n0Var = new n4.n0(contextRequireContext);
                                                                                                                                                                        NotificationChannel notificationChannel = new NotificationChannel("test", "debug", 3);
                                                                                                                                                                        notificationChannel.setDescription("Test notification badges");
                                                                                                                                                                        notificationChannel.setGroup(null);
                                                                                                                                                                        notificationChannel.setShowBadge(true);
                                                                                                                                                                        notificationChannel.setSound(null, null);
                                                                                                                                                                        notificationChannel.enableLights(false);
                                                                                                                                                                        notificationChannel.setLightColor(0);
                                                                                                                                                                        notificationChannel.setVibrationPattern(null);
                                                                                                                                                                        notificationChannel.enableVibration(false);
                                                                                                                                                                        n0Var.f77841b.createNotificationChannel(notificationChannel);
                                                                                                                                                                        Drawable drawable = contextRequireContext.getDrawable(2131231529);
                                                                                                                                                                        Intrinsics.d(drawable);
                                                                                                                                                                        Bitmap bitmapY = ab.e0.Y(drawable, h6.c1.h(contextRequireContext, 48), bh.g.N(contextRequireContext.getResources().getDisplayMetrics(), 48), 4);
                                                                                                                                                                        n4.r rVar = new n4.r(contextRequireContext, "test");
                                                                                                                                                                        rVar.f77870s.icon = 2131231724;
                                                                                                                                                                        rVar.i(bitmapY);
                                                                                                                                                                        rVar.f77858e = n4.r.c("Nova");
                                                                                                                                                                        rVar.f77859f = n4.r.c("This is a test notification, check the Nova Settings icon for it's badge");
                                                                                                                                                                        n4.p pVar = new n4.p(false);
                                                                                                                                                                        pVar.f77847f = n4.r.c("This is a test notification, check the Nova Settings icon for it's badge");
                                                                                                                                                                        rVar.m(pVar);
                                                                                                                                                                        new n4.n0(contextRequireContext).e((int) SystemClock.uptimeMillis(), rVar.b());
                                                                                                                                                                        break;
                                                                                                                                                                }
                                                                                                                                                            }
                                                                                                                                                        });
                                                                                                                                                        linearLayout5.setOnTouchListener(new y0(1));
                                                                                                                                                        final int i19 = 5;
                                                                                                                                                        fancyPrefView.setOnClickListener(new View.OnClickListener(this) { // from class: h10.y

                                                                                                                                                            /* renamed from: b, reason: collision with root package name */
                                                                                                                                                            public final /* synthetic */ SettingsBadges f59006b;

                                                                                                                                                            {
                                                                                                                                                                this.f59006b = this;
                                                                                                                                                            }

                                                                                                                                                            @Override // android.view.View.OnClickListener
                                                                                                                                                            public final void onClick(View view) throws Resources.NotFoundException {
                                                                                                                                                                switch (i19) {
                                                                                                                                                                    case 0:
                                                                                                                                                                        p4 p4Var = p4.f51743c;
                                                                                                                                                                        SettingsBadges settingsBadges = this.f59006b;
                                                                                                                                                                        settingsBadges.F(false, p4Var);
                                                                                                                                                                        settingsBadges.B();
                                                                                                                                                                        settingsBadges.z(false);
                                                                                                                                                                        break;
                                                                                                                                                                    case 1:
                                                                                                                                                                        p4 p4Var2 = p4.f51743c;
                                                                                                                                                                        SettingsBadges settingsBadges2 = this.f59006b;
                                                                                                                                                                        settingsBadges2.F(true, p4Var2);
                                                                                                                                                                        settingsBadges2.B();
                                                                                                                                                                        if (ha.g.a() == null) {
                                                                                                                                                                            settingsBadges2.o = false;
                                                                                                                                                                            break;
                                                                                                                                                                        } else {
                                                                                                                                                                            settingsBadges2.z(false);
                                                                                                                                                                            break;
                                                                                                                                                                        }
                                                                                                                                                                    case 2:
                                                                                                                                                                        p4 p4Var3 = p4.f51744d;
                                                                                                                                                                        SettingsBadges settingsBadges3 = this.f59006b;
                                                                                                                                                                        settingsBadges3.F(true, p4Var3);
                                                                                                                                                                        settingsBadges3.B();
                                                                                                                                                                        if (ha.g.a() == null) {
                                                                                                                                                                            settingsBadges3.o = false;
                                                                                                                                                                            break;
                                                                                                                                                                        } else {
                                                                                                                                                                            settingsBadges3.z(false);
                                                                                                                                                                            break;
                                                                                                                                                                        }
                                                                                                                                                                    case 3:
                                                                                                                                                                        p4 p4Var4 = p4.f51745e;
                                                                                                                                                                        SettingsBadges settingsBadges4 = this.f59006b;
                                                                                                                                                                        settingsBadges4.F(true, p4Var4);
                                                                                                                                                                        settingsBadges4.B();
                                                                                                                                                                        if (ha.g.a() == null) {
                                                                                                                                                                            settingsBadges4.o = false;
                                                                                                                                                                            break;
                                                                                                                                                                        } else {
                                                                                                                                                                            settingsBadges4.z(false);
                                                                                                                                                                            break;
                                                                                                                                                                        }
                                                                                                                                                                    case 4:
                                                                                                                                                                        this.f59006b.z(!r6.n);
                                                                                                                                                                        break;
                                                                                                                                                                    default:
                                                                                                                                                                        Context contextRequireContext = this.f59006b.requireContext();
                                                                                                                                                                        Uri uri = Settings.System.DEFAULT_NOTIFICATION_URI;
                                                                                                                                                                        AudioAttributes audioAttributes = Notification.AUDIO_ATTRIBUTES_DEFAULT;
                                                                                                                                                                        n4.n0 n0Var = new n4.n0(contextRequireContext);
                                                                                                                                                                        NotificationChannel notificationChannel = new NotificationChannel("test", "debug", 3);
                                                                                                                                                                        notificationChannel.setDescription("Test notification badges");
                                                                                                                                                                        notificationChannel.setGroup(null);
                                                                                                                                                                        notificationChannel.setShowBadge(true);
                                                                                                                                                                        notificationChannel.setSound(null, null);
                                                                                                                                                                        notificationChannel.enableLights(false);
                                                                                                                                                                        notificationChannel.setLightColor(0);
                                                                                                                                                                        notificationChannel.setVibrationPattern(null);
                                                                                                                                                                        notificationChannel.enableVibration(false);
                                                                                                                                                                        n0Var.f77841b.createNotificationChannel(notificationChannel);
                                                                                                                                                                        Drawable drawable = contextRequireContext.getDrawable(2131231529);
                                                                                                                                                                        Intrinsics.d(drawable);
                                                                                                                                                                        Bitmap bitmapY = ab.e0.Y(drawable, h6.c1.h(contextRequireContext, 48), bh.g.N(contextRequireContext.getResources().getDisplayMetrics(), 48), 4);
                                                                                                                                                                        n4.r rVar = new n4.r(contextRequireContext, "test");
                                                                                                                                                                        rVar.f77870s.icon = 2131231724;
                                                                                                                                                                        rVar.i(bitmapY);
                                                                                                                                                                        rVar.f77858e = n4.r.c("Nova");
                                                                                                                                                                        rVar.f77859f = n4.r.c("This is a test notification, check the Nova Settings icon for it's badge");
                                                                                                                                                                        n4.p pVar = new n4.p(false);
                                                                                                                                                                        pVar.f77847f = n4.r.c("This is a test notification, check the Nova Settings icon for it's badge");
                                                                                                                                                                        rVar.m(pVar);
                                                                                                                                                                        new n4.n0(contextRequireContext).e((int) SystemClock.uptimeMillis(), rVar.b());
                                                                                                                                                                        break;
                                                                                                                                                                }
                                                                                                                                                            }
                                                                                                                                                        });
                                                                                                                                                        return sVar;
                                                                                                                                                    }
                                                                                                                                                }
                                                                                                                                            }
                                                                                                                                        }
                                                                                                                                    }
                                                                                                                                }
                                                                                                                            }
                                                                                                                        }
                                                                                                                    }
                                                                                                                }
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        throw new NullPointerException("Missing required view with ID: ".concat(viewInflate.getResources().getResourceName(i5)));
    }

    public final void z(boolean z11) {
        s sVar = (s) this.f46052e;
        if (sVar == null) {
            return;
        }
        TextView textView = sVar.f92523b;
        FrameLayout frameLayout = sVar.f92534m;
        LinearLayout linearLayout = sVar.f92533l;
        LinearLayout linearLayout2 = sVar.n;
        if (z11 == this.n) {
            return;
        }
        ObjectAnimator objectAnimator = this.f46074p;
        if (objectAnimator != null) {
            objectAnimator.cancel();
        }
        this.n = z11;
        this.o = z11;
        int iP = y2.f51877a.p(requireContext());
        f6.a aVar = zx.d.f98814j;
        int i5 = 0;
        if (!z11) {
            textView.setTextColor(p.b(requireContext(), 16842808));
            int i11 = -linearLayout2.getHeight();
            linearLayout2.setPivotY(0.0f);
            float f11 = i11;
            linearLayout2.animate().translationY(f11).setInterpolator(aVar).setDuration(300L);
            frameLayout.animate().translationY(f11).setInterpolator(aVar).setDuration(300L).withEndAction(new ab.k(sVar, iP, 7));
            ObjectAnimator objectAnimatorOfInt = ObjectAnimator.ofInt(linearLayout, "backgroundColor", iP, r4.a.n(iP, 0));
            objectAnimatorOfInt.setEvaluator(c8.a.f19830a);
            objectAnimatorOfInt.setInterpolator(aVar);
            long j11 = 2;
            objectAnimatorOfInt.setDuration(j11 * 300);
            objectAnimatorOfInt.addListener(new i0(sVar, 7));
            objectAnimatorOfInt.start();
            this.f46074p = objectAnimatorOfInt;
            int childCount = linearLayout2.getChildCount();
            while (i5 < childCount) {
                linearLayout2.getChildAt(i5).setAlpha(1.0f);
                linearLayout2.getChildAt(i5).animate().alpha(0.0f).withLayer().setDuration(300 / j11);
                i5++;
            }
            return;
        }
        textView.setTextColor(0);
        int childCount2 = linearLayout2.getChildCount();
        for (int i12 = 0; i12 < childCount2; i12++) {
            linearLayout2.getChildAt(i12).setAlpha(1.0f);
        }
        linearLayout.setVisibility(0);
        float f12 = -linearLayout2.getHeight();
        linearLayout2.setTranslationY(f12);
        linearLayout2.animate().translationY(0.0f).setInterpolator(aVar).setDuration(300L);
        frameLayout.setTranslationY(f12);
        frameLayout.animate().translationY(0.0f).setInterpolator(aVar).setDuration(300L);
        ObjectAnimator objectAnimatorOfArgb = ObjectAnimator.ofArgb(linearLayout, "backgroundColor", r4.a.n(iP, 0), iP);
        objectAnimatorOfArgb.setInterpolator(aVar);
        objectAnimatorOfArgb.setDuration(300L);
        objectAnimatorOfArgb.start();
        this.f46074p = objectAnimatorOfArgb;
        int childCount3 = linearLayout2.getChildCount();
        while (i5 < childCount3) {
            linearLayout2.getChildAt(i5).setAlpha(0.0f);
            linearLayout2.getChildAt(i5).animate().alpha(1.0f).withLayer().setDuration(300 / 2);
            i5++;
        }
    }
}
