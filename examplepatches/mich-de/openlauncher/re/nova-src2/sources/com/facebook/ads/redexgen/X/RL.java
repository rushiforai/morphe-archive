package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.os.Bundle;
import android.util.SparseArray;
import android.util.SparseBooleanArray;
import com.facebook.ads.androidx.media3.exoplayer.trackselection.DefaultTrackSelector;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/* loaded from: assets/audience_network/classes.dex */
public final class RL extends LW {
    public boolean A00;
    public boolean A01;
    public boolean A02;
    public boolean A03;
    public boolean A04;
    public boolean A05;
    public boolean A06;
    public boolean A07;
    public boolean A08;
    public boolean A09;

    @MetaExoPlayerCustomization
    public boolean A0A;
    public boolean A0B;
    public boolean A0C;
    public boolean A0D;
    public final SparseArray<Map<RY, RJ>> A0E;
    public final SparseBooleanArray A0F;

    @Deprecated
    public RL() {
        this.A0E = new SparseArray<>();
        this.A0F = new SparseBooleanArray();
        A0W();
    }

    public RL(Context context) {
        super(context);
        this.A0E = new SparseArray<>();
        this.A0F = new SparseBooleanArray();
        A0W();
    }

    @MetaExoPlayerCustomization
    public RL(Bundle bundle) {
        super(bundle);
        A0W();
        C07408i c07408i = C07408i.A0J;
        A17(bundle.getBoolean(C07408i.A0W, c07408i.A0C));
        A11(bundle.getBoolean(C07408i.A0Q, c07408i.A06));
        A12(bundle.getBoolean(C07408i.A0G(), c07408i.A07));
        A10(bundle.getBoolean(C07408i.A0P, c07408i.A05));
        A14(bundle.getBoolean(C07408i.A0T, c07408i.A09));
        A0x(bundle.getBoolean(C07408i.A0M, c07408i.A02));
        A0y(bundle.getBoolean(C07408i.A0N, c07408i.A03));
        A0v(bundle.getBoolean(C07408i.A0K, c07408i.A00));
        A0w(bundle.getBoolean(C07408i.A0L, c07408i.A01));
        A13(bundle.getBoolean(C07408i.A05(), c07408i.A08));
        A16(bundle.getBoolean(C07408i.A0V, c07408i.A0B));
        A18(bundle.getBoolean(C07408i.A0b, c07408i.A0D));
        A0z(bundle.getBoolean(C07408i.A0O, c07408i.A04));
        A15(bundle.getBoolean(C07408i.A0U, c07408i.A0A));
        this.A0E = new SparseArray<>();
        A0X(bundle);
        this.A0F = A0R(bundle.getIntArray(C07408i.A0X));
    }

    @MetaExoPlayerCustomization
    public RL(C07408i c07408i) {
        super(c07408i);
        this.A0C = c07408i.A0C;
        this.A06 = c07408i.A06;
        this.A07 = c07408i.A07;
        this.A05 = c07408i.A05;
        this.A09 = c07408i.A09;
        this.A02 = c07408i.A02;
        this.A03 = c07408i.A03;
        this.A00 = c07408i.A00;
        this.A01 = c07408i.A01;
        this.A08 = c07408i.A08;
        this.A0B = c07408i.A0B;
        this.A0D = c07408i.A0D;
        this.A04 = c07408i.A04;
        this.A0A = c07408i.A0A;
        this.A0E = A0G((SparseArray<Map<RY, RJ>>) c07408i.A0E);
        this.A0F = c07408i.A0F.clone();
    }

    public static SparseArray<Map<RY, RJ>> A0G(SparseArray<Map<RY, RJ>> sparseArray) {
        SparseArray<Map<RY, RJ>> sparseArray2 = new SparseArray<>();
        for (int i5 = 0; i5 < sparseArray.size(); i5++) {
            sparseArray2.put(sparseArray.keyAt(i5), new HashMap(sparseArray.valueAt(i5)));
        }
        return sparseArray2;
    }

    private SparseBooleanArray A0R(int[] iArr) {
        if (iArr == null) {
            return new SparseBooleanArray();
        }
        SparseBooleanArray sparseBooleanArray = new SparseBooleanArray(iArr.length);
        for (int i5 : iArr) {
            sparseBooleanArray.append(i5, true);
        }
        return sparseBooleanArray;
    }

    @MetaExoPlayerCustomization
    private void A0W() {
        this.A0C = true;
        this.A06 = false;
        this.A07 = true;
        this.A05 = false;
        this.A09 = true;
        this.A02 = false;
        this.A03 = false;
        this.A00 = false;
        this.A01 = false;
        this.A08 = true;
        this.A0B = true;
        this.A0D = false;
        this.A04 = true;
        this.A0A = false;
    }

    /* JADX WARN: Multi-variable type inference failed */
    private void A0X(Bundle bundle) {
        AbstractC07549l abstractC07549lA01;
        SparseArray<DefaultTrackSelector.SelectionOverride> selectionOverrides;
        int[] intArray = bundle.getIntArray(C07408i.A0Z);
        ArrayList<Bundle> trackGroupArrayBundles = bundle.getParcelableArrayList(C07408i.A0a);
        if (trackGroupArrayBundles == null) {
            abstractC07549lA01 = AbstractC07549l.A03();
        } else {
            abstractC07549lA01 = C1068Lt.A01(RY.A05, trackGroupArrayBundles);
        }
        SparseArray sparseParcelableArray = bundle.getSparseParcelableArray(C07408i.A0E());
        if (sparseParcelableArray == null) {
            selectionOverrides = new SparseArray<>();
        } else {
            selectionOverrides = C1068Lt.A00(RJ.A05, sparseParcelableArray);
        }
        if (intArray == null || intArray.length != abstractC07549lA01.size()) {
            return;
        }
        for (int i5 = 0; i5 < intArray.length; i5++) {
            A0r(intArray[i5], (RY) abstractC07549lA01.get(i5), (RJ) selectionOverrides.get(i5));
        }
    }

    @Override // com.facebook.ads.redexgen.X.LW
    /* renamed from: A0q, reason: merged with bridge method [inline-methods] */
    public final RL A0m(int i5, int i11, boolean z11) {
        super.A0m(i5, i11, z11);
        return this;
    }

    @Deprecated
    public final RL A0r(int i5, RY ry2, RJ rj2) {
        Map<RY, RJ> map = this.A0E.get(i5);
        if (map == null) {
            map = new HashMap<>();
            this.A0E.put(i5, map);
        }
        if (map.containsKey(ry2) && N1.A1E(map.get(ry2), rj2)) {
            return this;
        }
        map.put(ry2, rj2);
        return this;
    }

    @Override // com.facebook.ads.redexgen.X.LW
    /* renamed from: A0s, reason: merged with bridge method [inline-methods] */
    public final RL A0n(Context context) {
        super.A0n(context);
        return this;
    }

    @Override // com.facebook.ads.redexgen.X.LW
    /* renamed from: A0t, reason: merged with bridge method [inline-methods] */
    public final RL A0o(Context context, boolean z11) {
        super.A0o(context, z11);
        return this;
    }

    public final RL A0u(U1 u12) {
        super.A0W(u12);
        return this;
    }

    public final RL A0v(boolean z11) {
        this.A00 = z11;
        return this;
    }

    public final RL A0w(boolean z11) {
        this.A01 = z11;
        return this;
    }

    public final RL A0x(boolean z11) {
        this.A02 = z11;
        return this;
    }

    public final RL A0y(boolean z11) {
        this.A03 = z11;
        return this;
    }

    public final RL A0z(boolean z11) {
        this.A04 = z11;
        return this;
    }

    public final RL A10(boolean z11) {
        this.A05 = z11;
        return this;
    }

    public final RL A11(boolean z11) {
        this.A06 = z11;
        return this;
    }

    public final RL A12(boolean z11) {
        this.A07 = z11;
        return this;
    }

    public final RL A13(boolean z11) {
        this.A08 = z11;
        return this;
    }

    public final RL A14(boolean z11) {
        this.A09 = z11;
        return this;
    }

    @MetaExoPlayerCustomization
    public final RL A15(boolean z11) {
        this.A0A = z11;
        return this;
    }

    public final RL A16(boolean z11) {
        this.A0B = z11;
        return this;
    }

    public final RL A17(boolean z11) {
        this.A0C = z11;
        return this;
    }

    public final RL A18(boolean z11) {
        this.A0D = z11;
        return this;
    }

    @Override // com.facebook.ads.redexgen.X.LW
    /* renamed from: A19, reason: merged with bridge method [inline-methods] */
    public final C07408i A0p() {
        return new C07408i(this);
    }
}
