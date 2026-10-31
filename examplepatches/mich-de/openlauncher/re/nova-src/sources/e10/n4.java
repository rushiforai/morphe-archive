package e10;

import com.teslacoilsw.launcher.preferences.SettingsFolderIcon;
import com.teslacoilsw.launcher.widget.DumbRadioGrid;

/* loaded from: classes4.dex */
public final class n4 implements l30.c {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f51709a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ SettingsFolderIcon f51710b;

    public /* synthetic */ n4(SettingsFolderIcon settingsFolderIcon, int i5) {
        this.f51709a = i5;
        this.f51710b = settingsFolderIcon;
    }

    @Override // l30.c
    public final void a(DumbRadioGrid dumbRadioGrid, int i5) {
        switch (this.f51709a) {
            case 0:
                if (i5 != 2131428822) {
                    SettingsFolderIcon.D(this.f51710b);
                    break;
                }
                break;
            default:
                SettingsFolderIcon.D(this.f51710b);
                break;
        }
    }
}
