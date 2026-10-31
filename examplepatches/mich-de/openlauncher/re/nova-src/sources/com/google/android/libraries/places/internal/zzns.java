package com.google.android.libraries.places.internal;

import androidx.compose.ui.node.LayoutNode;

/* loaded from: classes3.dex */
public abstract class zzns {
    public static int zzd(int i5, int i11) {
        int i12 = i5 + (i5 >> 1) + 1;
        if (i12 < i11) {
            int iHighestOneBit = Integer.highestOneBit(i11 - 1);
            i12 = iHighestOneBit + iHighestOneBit;
        }
        return i12 < 0 ? LayoutNode.NotPlacedPlaceOrder : i12;
    }

    public abstract zzns zzb(Object obj);
}
