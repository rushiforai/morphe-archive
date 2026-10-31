package com.instabridge.ai.proactive;

import aq.o;
import b.c0;
import b.u4;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u001f\b\u0087\b\u0018\u00002\u00020\u0001Bk\u0012\b\b\u0001\u0010\u0002\u001a\u00020\u0003\u0012\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\b\b\u0002\u0010\b\u001a\u00020\u0003\u0012\b\b\u0002\u0010\t\u001a\u00020\u0003\u0012\b\b\u0003\u0010\n\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u000b\u001a\u00020\u0003\u0012\u000e\b\u0003\u0010\f\u001a\b\u0012\u0004\u0012\u00020\r0\u0005\u0012\b\b\u0002\u0010\u000e\u001a\u00020\u000f¢\u0006\u0004\b\u0010\u0010\u0011J\t\u0010 \u001a\u00020\u0003HÆ\u0003J\u000f\u0010!\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005HÆ\u0003J\t\u0010\"\u001a\u00020\u0006HÆ\u0003J\t\u0010#\u001a\u00020\u0003HÆ\u0003J\t\u0010$\u001a\u00020\u0003HÆ\u0003J\t\u0010%\u001a\u00020\u0003HÆ\u0003J\t\u0010&\u001a\u00020\u0003HÆ\u0003J\u000f\u0010'\u001a\b\u0012\u0004\u0012\u00020\r0\u0005HÆ\u0003J\t\u0010(\u001a\u00020\u000fHÆ\u0003Jo\u0010)\u001a\u00020\u00002\b\b\u0003\u0010\u0002\u001a\u00020\u00032\u000e\b\u0002\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\b\b\u0002\u0010\u0007\u001a\u00020\u00062\b\b\u0002\u0010\b\u001a\u00020\u00032\b\b\u0002\u0010\t\u001a\u00020\u00032\b\b\u0003\u0010\n\u001a\u00020\u00032\b\b\u0002\u0010\u000b\u001a\u00020\u00032\u000e\b\u0003\u0010\f\u001a\b\u0012\u0004\u0012\u00020\r0\u00052\b\b\u0002\u0010\u000e\u001a\u00020\u000fHÆ\u0001J\u0013\u0010*\u001a\u00020\u000f2\b\u0010+\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010,\u001a\u00020\u0003HÖ\u0001J\t\u0010-\u001a\u00020\u0006HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0011\u0010\u0007\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R\u0011\u0010\b\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0013R\u0011\u0010\t\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0019\u0010\u0013R\u0011\u0010\n\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u0013R\u0011\u0010\u000b\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001b\u0010\u0013R\u0017\u0010\f\u001a\b\u0012\u0004\u0012\u00020\r0\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\u0015R\u0011\u0010\u000e\u001a\u00020\u000f¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u001dR\u0011\u0010\u001e\u001a\u00020\u00038F¢\u0006\u0006\u001a\u0004\b\u001f\u0010\u0013¨\u0006."}, d2 = {"Lcom/instabridge/ai/proactive/AiMetaQueryLead;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, AiDatabase.COL_INSIGHT_CAT, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "signals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "query", "specificity", "timeliness", "crossSignal", "novelty", "optimisticTools", "Lcom/instabridge/ai/proactive/OptimisticToolSpec;", "isMetaSourced", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(ILjava/util/List;Ljava/lang/String;IIIILjava/util/List;Z)V", "getCat", "()I", "getSignals", "()Ljava/util/List;", "getQuery", "()Ljava/lang/String;", "getSpecificity", "getTimeliness", "getCrossSignal", "getNovelty", "getOptimisticTools", "()Z", "qualityScore", "getQualityScore", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class AiMetaQueryLead {
    public static final int $stable = 8;
    private final int cat;
    private final int crossSignal;
    private final transient boolean isMetaSourced;
    private final int novelty;

    @NotNull
    private final List<OptimisticToolSpec> optimisticTools;

    @NotNull
    private final String query;

    @NotNull
    private final List<String> signals;
    private final int specificity;
    private final int timeliness;

    public AiMetaQueryLead(@o(name = AiDatabase.COL_INSIGHT_CAT) int i5, @NotNull List<String> signals, @NotNull String query, int i11, int i12, @o(name = "cross_signal") int i13, int i14, @o(name = "optimistic_tools") @NotNull List<OptimisticToolSpec> optimisticTools, boolean z11) {
        Intrinsics.g(signals, "signals");
        Intrinsics.g(query, "query");
        Intrinsics.g(optimisticTools, "optimisticTools");
        this.cat = i5;
        this.signals = signals;
        this.query = query;
        this.specificity = i11;
        this.timeliness = i12;
        this.crossSignal = i13;
        this.novelty = i14;
        this.optimisticTools = optimisticTools;
        this.isMetaSourced = z11;
    }

    public static /* synthetic */ AiMetaQueryLead copy$default(AiMetaQueryLead aiMetaQueryLead, int i5, List list, String str, int i11, int i12, int i13, int i14, List list2, boolean z11, int i15, Object obj) {
        if ((i15 & 1) != 0) {
            i5 = aiMetaQueryLead.cat;
        }
        if ((i15 & 2) != 0) {
            list = aiMetaQueryLead.signals;
        }
        if ((i15 & 4) != 0) {
            str = aiMetaQueryLead.query;
        }
        if ((i15 & 8) != 0) {
            i11 = aiMetaQueryLead.specificity;
        }
        if ((i15 & 16) != 0) {
            i12 = aiMetaQueryLead.timeliness;
        }
        if ((i15 & 32) != 0) {
            i13 = aiMetaQueryLead.crossSignal;
        }
        if ((i15 & 64) != 0) {
            i14 = aiMetaQueryLead.novelty;
        }
        if ((i15 & 128) != 0) {
            list2 = aiMetaQueryLead.optimisticTools;
        }
        if ((i15 & 256) != 0) {
            z11 = aiMetaQueryLead.isMetaSourced;
        }
        List list3 = list2;
        boolean z12 = z11;
        int i16 = i13;
        int i17 = i14;
        int i18 = i12;
        String str2 = str;
        return aiMetaQueryLead.copy(i5, list, str2, i11, i18, i16, i17, list3, z12);
    }

    /* renamed from: component1, reason: from getter */
    public final int getCat() {
        return this.cat;
    }

    @NotNull
    public final List<String> component2() {
        return this.signals;
    }

    @NotNull
    /* renamed from: component3, reason: from getter */
    public final String getQuery() {
        return this.query;
    }

    /* renamed from: component4, reason: from getter */
    public final int getSpecificity() {
        return this.specificity;
    }

    /* renamed from: component5, reason: from getter */
    public final int getTimeliness() {
        return this.timeliness;
    }

    /* renamed from: component6, reason: from getter */
    public final int getCrossSignal() {
        return this.crossSignal;
    }

    /* renamed from: component7, reason: from getter */
    public final int getNovelty() {
        return this.novelty;
    }

    @NotNull
    public final List<OptimisticToolSpec> component8() {
        return this.optimisticTools;
    }

    /* renamed from: component9, reason: from getter */
    public final boolean getIsMetaSourced() {
        return this.isMetaSourced;
    }

    @NotNull
    public final AiMetaQueryLead copy(@o(name = AiDatabase.COL_INSIGHT_CAT) int cat, @NotNull List<String> signals, @NotNull String query, int specificity, int timeliness, @o(name = "cross_signal") int crossSignal, int novelty, @o(name = "optimistic_tools") @NotNull List<OptimisticToolSpec> optimisticTools, boolean isMetaSourced) {
        Intrinsics.g(signals, "signals");
        Intrinsics.g(query, "query");
        Intrinsics.g(optimisticTools, "optimisticTools");
        return new AiMetaQueryLead(cat, signals, query, specificity, timeliness, crossSignal, novelty, optimisticTools, isMetaSourced);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof AiMetaQueryLead)) {
            return false;
        }
        AiMetaQueryLead aiMetaQueryLead = (AiMetaQueryLead) other;
        return this.cat == aiMetaQueryLead.cat && Intrinsics.b(this.signals, aiMetaQueryLead.signals) && Intrinsics.b(this.query, aiMetaQueryLead.query) && this.specificity == aiMetaQueryLead.specificity && this.timeliness == aiMetaQueryLead.timeliness && this.crossSignal == aiMetaQueryLead.crossSignal && this.novelty == aiMetaQueryLead.novelty && Intrinsics.b(this.optimisticTools, aiMetaQueryLead.optimisticTools) && this.isMetaSourced == aiMetaQueryLead.isMetaSourced;
    }

    public final int getCat() {
        return this.cat;
    }

    public final int getCrossSignal() {
        return this.crossSignal;
    }

    public final int getNovelty() {
        return this.novelty;
    }

    @NotNull
    public final List<OptimisticToolSpec> getOptimisticTools() {
        return this.optimisticTools;
    }

    public final int getQualityScore() {
        int i5 = this.specificity;
        if (i5 == 0 && this.timeliness == 0 && this.crossSignal == 0 && this.novelty == 0) {
            return 50;
        }
        return kotlin.ranges.a.e0((int) ((this.novelty * 0.3f) + (this.crossSignal * 0.1f) + (this.timeliness * 0.3f) + (i5 * 0.3f)), 0, 100);
    }

    @NotNull
    public final String getQuery() {
        return this.query;
    }

    @NotNull
    public final List<String> getSignals() {
        return this.signals;
    }

    public final int getSpecificity() {
        return this.specificity;
    }

    public final int getTimeliness() {
        return this.timeliness;
    }

    public int hashCode() {
        return Boolean.hashCode(this.isMetaSourced) + u4.c(u4.a(this.novelty, u4.a(this.crossSignal, u4.a(this.timeliness, u4.a(this.specificity, c0.e(u4.c(Integer.hashCode(this.cat) * 31, 31, this.signals), 31, this.query), 31), 31), 31), 31), 31, this.optimisticTools);
    }

    public final boolean isMetaSourced() {
        return this.isMetaSourced;
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("AiMetaQueryLead(cat=");
        sb2.append(this.cat);
        sb2.append(", signals=");
        sb2.append(this.signals);
        sb2.append(", query=");
        sb2.append(this.query);
        sb2.append(", specificity=");
        sb2.append(this.specificity);
        sb2.append(", timeliness=");
        sb2.append(this.timeliness);
        sb2.append(", crossSignal=");
        sb2.append(this.crossSignal);
        sb2.append(", novelty=");
        sb2.append(this.novelty);
        sb2.append(", optimisticTools=");
        sb2.append(this.optimisticTools);
        sb2.append(", isMetaSourced=");
        return a2.c.p(sb2, this.isMetaSourced, ')');
    }

    /*  JADX ERROR: NullPointerException in pass: InitCodeVariables
        java.lang.NullPointerException: Cannot invoke "jadx.core.dex.instructions.args.SSAVar.getPhiList()" because "resultVar" is null
        	at jadx.core.dex.visitors.InitCodeVariables.collectConnectedVars(InitCodeVariables.java:119)
        	at jadx.core.dex.visitors.InitCodeVariables.setCodeVar(InitCodeVariables.java:82)
        	at jadx.core.dex.visitors.InitCodeVariables.initCodeVar(InitCodeVariables.java:74)
        	at jadx.core.dex.visitors.InitCodeVariables.initCodeVars(InitCodeVariables.java:48)
        	at jadx.core.dex.visitors.InitCodeVariables.visit(InitCodeVariables.java:29)
        */
    public AiMetaQueryLead(int r11, java.util.List r12, java.lang.String r13, int r14, int r15, int r16, int r17, java.util.List r18, boolean r19, int r20, kotlin.jvm.internal.DefaultConstructorMarker r21) {
        /*
            r10 = this;
            r0 = r20
            r1 = r0 & 2
            if (r1 == 0) goto L8
            kotlin.collections.EmptyList r12 = kotlin.collections.EmptyList.f71733a
        L8:
            r2 = r12
            r12 = r0 & 8
            r1 = 0
            if (r12 == 0) goto L10
            r4 = r1
            goto L11
        L10:
            r4 = r14
        L11:
            r12 = r0 & 16
            if (r12 == 0) goto L17
            r5 = r1
            goto L18
        L17:
            r5 = r15
        L18:
            r12 = r0 & 32
            if (r12 == 0) goto L1e
            r6 = r1
            goto L20
        L1e:
            r6 = r16
        L20:
            r12 = r0 & 64
            if (r12 == 0) goto L26
            r7 = r1
            goto L28
        L26:
            r7 = r17
        L28:
            r12 = r0 & 128(0x80, float:1.8E-43)
            if (r12 == 0) goto L30
            kotlin.collections.EmptyList r12 = kotlin.collections.EmptyList.f71733a
            r8 = r12
            goto L32
        L30:
            r8 = r18
        L32:
            r12 = r0 & 256(0x100, float:3.59E-43)
            if (r12 == 0) goto L3b
            r9 = r1
            r0 = r10
            r3 = r13
            r1 = r11
            goto L40
        L3b:
            r9 = r19
            r0 = r10
            r1 = r11
            r3 = r13
        L40:
            r0.<init>(r1, r2, r3, r4, r5, r6, r7, r8, r9)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.instabridge.ai.proactive.AiMetaQueryLead.<init>(int, java.util.List, java.lang.String, int, int, int, int, java.util.List, boolean, int, kotlin.jvm.internal.DefaultConstructorMarker):void");
    }
}
