package lj;

import android.content.Context;
import android.graphics.Rect;
import android.graphics.RectF;
import android.text.TextUtils;
import android.view.accessibility.AccessibilityNodeInfo;
import b5.g;
import com.google.android.material.chip.Chip;
import java.util.ArrayList;

/* loaded from: classes3.dex */
public final class b extends r5.b {
    public final /* synthetic */ Chip o;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(Chip chip, Chip chip2) {
        super(chip2);
        this.o = chip;
    }

    @Override // r5.b
    public final int k(float f11, float f12) {
        Rect rect = Chip.f34171t;
        Chip chip = this.o;
        if (!chip.b()) {
            return 0;
        }
        RectF rectF = chip.f34185r;
        rectF.setEmpty();
        chip.b();
        return rectF.contains(f11, f12) ? 1 : 0;
    }

    @Override // r5.b
    public final void l(ArrayList arrayList) {
        arrayList.add(0);
        Rect rect = Chip.f34171t;
        this.o.b();
    }

    @Override // r5.b
    public final boolean n(int i5, int i11) {
        if (i11 == 16) {
            Chip chip = this.o;
            if (i5 == 0) {
                return chip.performClick();
            }
            if (i5 == 1) {
                chip.playSoundEffect(0);
            }
        }
        return false;
    }

    @Override // r5.b
    public final void p(g gVar) {
        Chip chip = this.o;
        d dVar = chip.f34174e;
        gVar.w(dVar != null && dVar.Q);
        gVar.z(chip.isClickable());
        gVar.y(chip.getAccessibilityClassName());
        gVar.c0(chip.getText());
    }

    @Override // r5.b
    public final void q(int i5, g gVar) {
        AccessibilityNodeInfo accessibilityNodeInfo = gVar.f17551a;
        CharSequence charSequence = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (i5 != 1) {
            gVar.C(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            accessibilityNodeInfo.setBoundsInParent(Chip.f34171t);
            return;
        }
        Chip chip = this.o;
        CharSequence text = chip.getText();
        Context context = chip.getContext();
        if (!TextUtils.isEmpty(text)) {
            charSequence = text;
        }
        gVar.C(context.getString(2132018667, charSequence).trim());
        RectF rectF = chip.f34185r;
        rectF.setEmpty();
        chip.b();
        Rect rect = chip.f34184q;
        rect.set((int) rectF.left, (int) rectF.top, (int) rectF.right, (int) rectF.bottom);
        accessibilityNodeInfo.setBoundsInParent(rect);
        gVar.b(b5.d.f17535e);
        gVar.G(chip.isEnabled());
    }

    @Override // r5.b
    public final void r(int i5, boolean z11) {
        if (i5 == 1) {
            Chip chip = this.o;
            chip.f34181l = z11;
            chip.refreshDrawableState();
        }
    }
}
