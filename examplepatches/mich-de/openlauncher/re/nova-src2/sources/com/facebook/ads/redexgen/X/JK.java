package com.facebook.ads.redexgen.X;

import android.content.res.Resources;
import android.os.Bundle;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: assets/audience_network/classes.dex */
public class JK extends AbstractC1858hF {
    public static String[] A01 = {"qdMAGnvFuVn0ea0M3RnyzUUMgxm0S2Dt", "2PeyHnmE0bX58Ffgk0gx7OXrgxltyZLW", "2int", "nVrienaBQfkWnV6qIsNJmuY2fGTgVaBy", "EIAfoPo9YRxYx4hqHxVbjlkHHJjThpFm", b.f42142b, "SPMlRY4DBSEQqdOiv1Q7wDslDeTbAa0F", "kfFOHzhabps7JVIWzUifit9US33gkwJk"};
    public final /* synthetic */ C1893hp A00;

    public JK(C1893hp c1893hp) {
        this.A00 = c1893hp;
    }

    private boolean A00() {
        return this.A00.A01 != null && this.A00.A01.A01() > 1;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1858hF
    public final void A07(View view, AccessibilityEvent accessibilityEvent) {
        super.A07(view, accessibilityEvent);
        accessibilityEvent.setClassName(C1893hp.class.getName());
        accessibilityEvent.setScrollable(A00());
        if (accessibilityEvent.getEventType() == 4096 && this.A00.A01 != null) {
            accessibilityEvent.setItemCount(this.A00.A01.A01());
            accessibilityEvent.setFromIndex(this.A00.A00);
            accessibilityEvent.setToIndex(this.A00.A00);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1858hF
    public final void A08(View view, C1904i0 c1904i0) {
        super.A08(view, c1904i0);
        c1904i0.A0O(C1893hp.class.getName());
        c1904i0.A0R(A00());
        if (this.A00.canScrollHorizontally(1)) {
            c1904i0.A0N(androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT);
        }
        if (this.A00.canScrollHorizontally(-1)) {
            c1904i0.A0N(UserMetadata.MAX_INTERNAL_KEY_SIZE);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1858hF
    public final boolean A09(View view, int i5, Bundle bundle) throws Resources.NotFoundException {
        if (super.A09(view, i5, bundle)) {
            return true;
        }
        switch (i5) {
            case androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT /* 4096 */:
                if (!this.A00.canScrollHorizontally(1)) {
                    return false;
                }
                C1893hp c1893hp = this.A00;
                C1893hp c1893hp2 = this.A00;
                String[] strArr = A01;
                if (strArr[3].charAt(13) != strArr[7].charAt(13)) {
                    throw new RuntimeException();
                }
                A01[4] = "Vr8sNFSEZwclN9wLDYuYxTMloU2ohTqa";
                c1893hp.setCurrentItem(c1893hp2.A00 + 1);
                return true;
            case UserMetadata.MAX_INTERNAL_KEY_SIZE /* 8192 */:
                if (!this.A00.canScrollHorizontally(-1)) {
                    return false;
                }
                this.A00.setCurrentItem(this.A00.A00 - 1);
                return true;
            default:
                return false;
        }
    }
}
