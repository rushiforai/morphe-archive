package b;

import ads_mobile_sdk.jq;
import ads_mobile_sdk.sq;
import java.util.Iterator;

/* loaded from: classes.dex */
public abstract class t8 extends sq {
    @Override // ads_mobile_sdk.sq
    public final int a() {
        return 0;
    }

    public abstract boolean a(sq sqVar, int i5, int i11);

    @Override // ads_mobile_sdk.sq
    public final boolean b() {
        return true;
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        return new jq(this);
    }
}
