package com.medium.android.common.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import androidx.recyclerview.widget.RecyclerView;
import defpackage.eya;
import defpackage.hta;
import defpackage.sxa;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ReadPostLayoutManager extends PrefetchedLinearLayoutManager {
    public ReadPostLayoutManager(Context context, AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i, i2);
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager, defpackage.sxa
    public final void B0(RecyclerView recyclerView, int i) {
        hta htaVar = new hta(recyclerView.getContext());
        htaVar.a = i;
        C0(htaVar);
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager, defpackage.sxa
    public final int m(eya eyaVar) {
        int iC = C();
        if (iC > 0) {
            return iC <= 2 ? 100 : 300;
        }
        return 0;
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager, defpackage.sxa
    public final int n(eya eyaVar) {
        View viewQ;
        if (v() > 0) {
            View viewP0 = P0(0, v(), false, true);
            int iH = viewP0 == null ? -1 : sxa.H(viewP0);
            if (iH != -1 && (viewQ = q(iH)) != null) {
                int iB = sxa.B(viewQ);
                int iZ = sxa.z(viewQ);
                int iAbs = iZ > 0 ? Math.abs((iB * 100) / iZ) : 0;
                return (iAbs != 0 || iH <= 0) ? (iH * 100) + iAbs : iH * 100;
            }
        }
        return 0;
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager, defpackage.sxa
    public final int o(eya eyaVar) {
        if (C() < 1) {
            return 0;
        }
        return C() * 100;
    }
}
