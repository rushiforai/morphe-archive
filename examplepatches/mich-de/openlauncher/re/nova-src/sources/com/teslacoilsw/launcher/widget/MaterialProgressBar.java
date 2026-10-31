package com.teslacoilsw.launcher.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import g8.e;
import g8.f;

/* loaded from: classes4.dex */
public class MaterialProgressBar extends View {

    /* renamed from: a, reason: collision with root package name */
    public final f f46423a;

    public MaterialProgressBar(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        f fVar = new f(getContext(), this);
        this.f46423a = fVar;
        fVar.b(0);
        f fVar2 = this.f46423a;
        e eVar = fVar2.f57224b;
        eVar.f57213i = new int[]{-769226, -6543440, -12627531, -16537100, -16738680, -7617718, -26624};
        eVar.f57214j = 0;
        eVar.f57218p = 255;
        setBackground(fVar2);
        if (getVisibility() == 0) {
            this.f46423a.start();
        }
    }

    @Override // android.view.View
    public final void setVisibility(int i5) {
        super.setVisibility(i5);
        if (i5 == 0) {
            this.f46423a.start();
        } else {
            this.f46423a.stop();
        }
    }
}
