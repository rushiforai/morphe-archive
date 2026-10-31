package com.facebook.ads.redexgen.X;

import androidx.compose.ui.node.LayoutNode;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.0q, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC05650q extends C1r {
    public static final int A05(int i5) {
        if (i5 < 0) {
            return i5;
        }
        return i5 < 3 ? i5 + 1 : i5 < 1073741824 ? (int) ((i5 / 0.75f) + 1.0f) : LayoutNode.NotPlacedPlaceOrder;
    }
}
