package h10;

import ai.u1;
import android.content.res.Resources;
import android.graphics.Color;
import com.teslacoilsw.launcher.preferences.fragments.SettingsBadges;
import com.teslacoilsw.shared.colorpicker.ColorPickerTextView;
import e10.a3;

/* loaded from: classes4.dex */
public final class e0 extends u1 {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f58867b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ SettingsBadges f58868c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ e0(int i5, SettingsBadges settingsBadges, ColorPickerTextView colorPickerTextView) {
        super(colorPickerTextView);
        this.f58867b = i5;
        this.f58868c = settingsBadges;
    }

    @Override // ai.u1
    public final void C(int i5) throws Resources.NotFoundException {
        mz.o oVar;
        switch (this.f58867b) {
            case 0:
                mz.o oVar2 = a3.f51435a.n;
                this.f58868c.C(new mz.o(i5, oVar2.f77360b, oVar2.f77361c, oVar2.f77362d, oVar2.f77363e));
                break;
            case 1:
                mz.o oVar3 = a3.f51435a.n;
                int i11 = oVar3.f77359a;
                int i12 = oVar3.f77361c;
                int i13 = oVar3.f77362d;
                int i14 = oVar3.f77363e;
                mz.o oVar4 = new mz.o(i11, i5, i12, i13, i14);
                if (oVar3.f77360b == i11) {
                    oVar4 = new mz.o(i5, i5, i12, i13, i14);
                }
                float fBlue = 1 - (((Color.blue(i5) * 0.114f) + ((Color.green(i5) * 0.587f) + (Color.red(i5) * 0.299f))) / 255.0f);
                int i15 = oVar3.f77361c;
                if (i15 != -1 || fBlue >= 0.2f) {
                    if (i15 == -16777216 && fBlue > 0.8f) {
                        oVar = new mz.o(oVar4.f77359a, oVar4.f77360b, 262914, oVar4.f77362d, oVar4.f77363e);
                    }
                    this.f58868c.C(oVar4);
                    break;
                } else {
                    oVar = new mz.o(oVar4.f77359a, oVar4.f77360b, 262914, oVar4.f77362d, oVar4.f77363e);
                }
                oVar4 = oVar;
                this.f58868c.C(oVar4);
                break;
            default:
                mz.o oVar5 = a3.f51435a.n;
                this.f58868c.C(new mz.o(oVar5.f77359a, oVar5.f77360b, i5, oVar5.f77362d, oVar5.f77363e));
                break;
        }
    }

    @Override // ai.u1
    public boolean n() {
        switch (this.f58867b) {
            case 2:
                return true;
            default:
                return super.n();
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e0(SettingsBadges settingsBadges, ColorPickerTextView colorPickerTextView) {
        super(colorPickerTextView);
        this.f58867b = 0;
        this.f58868c = settingsBadges;
    }
}
