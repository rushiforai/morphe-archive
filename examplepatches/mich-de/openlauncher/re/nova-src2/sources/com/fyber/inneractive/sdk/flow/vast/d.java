package com.fyber.inneractive.sdk.flow.vast;

import androidx.compose.ui.node.LayoutNode;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.v;
import java.util.Comparator;

/* loaded from: classes3.dex */
public final class d implements Comparator {

    /* renamed from: a, reason: collision with root package name */
    public final int f28412a;

    /* renamed from: b, reason: collision with root package name */
    public final float f28413b;

    public d(int i5, int i11) {
        int i12 = i5 * i11;
        this.f28412a = i12;
        float f11 = i5 / i11;
        this.f28413b = f11;
        IAlog.a("IACompanionAdsPriorityComparator: screenWidth = %s, screenHeight = %s, mMaxArea = %s, mAspectRatio = %s", Integer.valueOf(i5), Integer.valueOf(i11), Integer.valueOf(i12), Float.valueOf(f11));
        IAlog.d("IACompanionAdsPriorityComparator: screenWidth = %s, screenHeight = %s, mMaxArea = %s, mAspectRatio = %s", Integer.valueOf(i5), Integer.valueOf(i11), Integer.valueOf(i12), Float.valueOf(f11));
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        com.fyber.inneractive.sdk.model.vast.c cVar = (com.fyber.inneractive.sdk.model.vast.c) obj;
        com.fyber.inneractive.sdk.model.vast.c cVar2 = (com.fyber.inneractive.sdk.model.vast.c) obj2;
        int iA = v.a(cVar.f28589h, cVar2.f28589h);
        if (iA != 0) {
            return iA;
        }
        com.fyber.inneractive.sdk.model.vast.i iVar = cVar.f28582a;
        com.fyber.inneractive.sdk.model.vast.i iVar2 = com.fyber.inneractive.sdk.model.vast.i.Html;
        int i5 = LayoutNode.NotPlacedPlaceOrder;
        int i11 = iVar == iVar2 ? 1 : iVar == com.fyber.inneractive.sdk.model.vast.i.Iframe ? 2 : iVar == com.fyber.inneractive.sdk.model.vast.i.Static ? 3 : Integer.MAX_VALUE;
        com.fyber.inneractive.sdk.model.vast.i iVar3 = cVar2.f28582a;
        if (iVar3 == iVar2) {
            i5 = 1;
        } else if (iVar3 == com.fyber.inneractive.sdk.model.vast.i.Iframe) {
            i5 = 2;
        } else if (iVar3 == com.fyber.inneractive.sdk.model.vast.i.Static) {
            i5 = 3;
        }
        int iA2 = v.a(i11, i5);
        if (iA2 != 0) {
            return iA2;
        }
        int iCompare = Float.compare(Math.abs((cVar.f28584c / cVar.f28585d) - this.f28413b), Math.abs((cVar2.f28584c / cVar2.f28585d) - this.f28413b));
        if (iCompare != 0) {
            return iCompare;
        }
        return v.a(Math.abs((cVar.f28584c * cVar.f28585d) - this.f28412a), Math.abs((cVar2.f28584c * cVar2.f28585d) - this.f28412a));
    }
}
