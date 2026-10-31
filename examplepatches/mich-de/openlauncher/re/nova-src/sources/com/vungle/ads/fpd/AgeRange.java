package com.vungle.ads.fpd;

import androidx.compose.ui.node.LayoutNode;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.ranges.IntRange;
import org.jetbrains.annotations.NotNull;

@Metadata(bv = {}, d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u000f\b\u0086\u0001\u0018\u0000 \u000e2\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u000eR\u0017\u0010\u0007\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0004\u001a\u0004\b\u0005\u0010\u0006R\u0017\u0010\r\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\t\u0010\n\u001a\u0004\b\u000b\u0010\fj\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013j\u0002\b\u0014j\u0002\b\u0015j\u0002\b\u0016¨\u0006\u0017"}, d2 = {"Lcom/vungle/ads/fpd/AgeRange;", b.f42142b, b.f42142b, "a", "I", "getId", "()I", "id", "Lkotlin/ranges/IntRange;", "b", "Lkotlin/ranges/IntRange;", "getRange", "()Lkotlin/ranges/IntRange;", "range", k.O, "AGE_18_20", "AGE_21_30", "AGE_31_40", "AGE_41_50", "AGE_51_60", "AGE_61_70", "AGE_71_75", "OTHERS", "vungle-ads_release"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public enum AgeRange {
    AGE_18_20(1, new IntRange(18, 20, 1)),
    AGE_21_30(2, new IntRange(21, 30, 1)),
    AGE_31_40(3, new IntRange(31, 40, 1)),
    AGE_41_50(4, new IntRange(41, 50, 1)),
    AGE_51_60(5, new IntRange(51, 60, 1)),
    AGE_61_70(6, new IntRange(61, 70, 1)),
    AGE_71_75(7, new IntRange(71, 75, 1)),
    OTHERS(0, new IntRange(Integer.MIN_VALUE, LayoutNode.NotPlacedPlaceOrder, 1));


    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    public final int id;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    public final IntRange range;

    @Metadata(bv = {}, d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0086\u0003\u0018\u00002\u00020\u0001J\u0017\u0010\u0007\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0000¢\u0006\u0004\b\u0005\u0010\u0006¨\u0006\b"}, d2 = {"Lcom/vungle/ads/fpd/AgeRange$Companion;", b.f42142b, b.f42142b, InneractiveMediationDefs.KEY_AGE, "Lcom/vungle/ads/fpd/AgeRange;", "fromAge$vungle_ads_release", "(I)Lcom/vungle/ads/fpd/AgeRange;", "fromAge", "vungle-ads_release"}, k = 1, mv = {1, 7, 1})
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final AgeRange fromAge$vungle_ads_release(int age) {
            AgeRange ageRange;
            AgeRange[] ageRangeArrValues = AgeRange.values();
            int length = ageRangeArrValues.length;
            int i5 = 0;
            while (true) {
                if (i5 >= length) {
                    ageRange = null;
                    break;
                }
                ageRange = ageRangeArrValues[i5];
                IntRange range = ageRange.getRange();
                int i11 = range.f71906a;
                if (age <= range.f71907b && i11 <= age) {
                    break;
                }
                i5++;
            }
            return ageRange == null ? AgeRange.OTHERS : ageRange;
        }

        public Companion() {
        }
    }

    AgeRange(int i5, IntRange intRange) {
        this.id = i5;
        this.range = intRange;
    }

    public final int getId() {
        return this.id;
    }

    @NotNull
    public final IntRange getRange() {
        return this.range;
    }
}
