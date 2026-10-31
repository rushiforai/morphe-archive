package com.facebook.ads.redexgen.X;

import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;

/* renamed from: com.facebook.ads.redexgen.X.Nj, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1109Nj {
    public int A00;

    public final void A00(int i5) {
        this.A00 |= i5;
    }

    public final void A01(int i5) {
        this.A00 &= ~i5;
    }

    public final void A02(int i5) {
        this.A00 = i5;
    }

    public final boolean A03() {
        return A09(268435456);
    }

    public final boolean A04() {
        return A09(Integer.MIN_VALUE);
    }

    public final boolean A05() {
        return A09(4);
    }

    public final boolean A06() {
        return A09(134217728);
    }

    public final boolean A07() {
        return A09(1);
    }

    @MetaExoPlayerCustomization
    public final boolean A08() {
        return A09(SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING);
    }

    public final boolean A09(int i5) {
        return (this.A00 & i5) == i5;
    }

    public void A0A() {
        this.A00 = 0;
    }
}
