package tz;

import androidx.recyclerview.widget.u1;
import b.c0;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class g {

    @NotNull
    public static final f Companion = new f();

    /* renamed from: a, reason: collision with root package name */
    public final u f90112a;

    /* renamed from: b, reason: collision with root package name */
    public final u f90113b;

    /* renamed from: c, reason: collision with root package name */
    public final u f90114c;

    /* renamed from: d, reason: collision with root package name */
    public final u f90115d;

    /* renamed from: e, reason: collision with root package name */
    public final u f90116e;

    /* renamed from: f, reason: collision with root package name */
    public final u f90117f;

    /* renamed from: g, reason: collision with root package name */
    public final u f90118g;

    /* renamed from: h, reason: collision with root package name */
    public final u f90119h;

    /* renamed from: i, reason: collision with root package name */
    public final u f90120i;

    /* renamed from: j, reason: collision with root package name */
    public final String f90121j;

    /* renamed from: k, reason: collision with root package name */
    public final String f90122k;

    /* renamed from: l, reason: collision with root package name */
    public final u f90123l;

    /* renamed from: m, reason: collision with root package name */
    public final u f90124m;
    public final u n;
    public final u o;

    /* renamed from: p, reason: collision with root package name */
    public final u f90125p;

    /* renamed from: q, reason: collision with root package name */
    public final u f90126q;

    /* renamed from: r, reason: collision with root package name */
    public final u f90127r;

    public g(int i5, u uVar, u uVar2, u uVar3, u uVar4, u uVar5, u uVar6, u uVar7, u uVar8, u uVar9, String str, String str2, u uVar10, u uVar11, u uVar12, u uVar13) {
        u uVarA;
        if (511 != (i5 & 511)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 511, e.f90111a.getDescriptor());
        }
        this.f90112a = uVar;
        this.f90113b = uVar2;
        this.f90114c = uVar3;
        this.f90115d = uVar4;
        this.f90116e = uVar5;
        this.f90117f = uVar6;
        this.f90118g = uVar7;
        this.f90119h = uVar8;
        this.f90120i = uVar9;
        if ((i5 & EventBridgeChannel.QUEUE_CAPACITY) == 0) {
            this.f90121j = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        } else {
            this.f90121j = str;
        }
        if ((i5 & 1024) == 0) {
            this.f90122k = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        } else {
            this.f90122k = str2;
        }
        if ((i5 & 2048) == 0) {
            r.Companion.getClass();
            n.Companion.getClass();
            this.f90123l = new u(0, n.i(160, n.f90153q), n.f90140b, n.f90150l, 112);
        } else {
            this.f90123l = uVar10;
        }
        if ((i5 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) == 0) {
            r.Companion.getClass();
            n.Companion.getClass();
            this.f90124m = new u(0, n.n, n.f90140b, n.f90150l, 112);
        } else {
            this.f90124m = uVar11;
        }
        if ((i5 & UserMetadata.MAX_INTERNAL_KEY_SIZE) == 0) {
            r.Companion.getClass();
            n.Companion.getClass();
            this.n = new u(0, n.i(Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, n.A), n.f90143e, n.f90147i, 112);
        } else {
            this.n = uVar12;
        }
        if ((i5 & ReaderJsonLexerKt.BATCH_SIZE) == 0) {
            u uVar14 = this.n;
            n.Companion.getClass();
            uVarA = u.a(uVar14, 0, n.f90162z, 0L, 0L, 0, 0, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE);
        } else {
            uVarA = uVar13;
        }
        this.o = uVarA;
        u uVarA2 = u.a(uVar6, 0, 0L, 0L, 0L, 0, 0, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
        this.f90125p = uVarA2;
        u uVarA3 = u.a(uVar5, 0, 0L, 0L, 0L, 0, 0, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
        this.f90126q = uVarA3;
        this.f90127r = this.f90123l;
        uVar7.f90177h = uVar3;
        uVarA3.f90177h = uVar3;
        uVarA2.f90177h = uVar4;
        this.o.f90177h = this.n;
    }

    public static g b(g gVar, u uVar, u uVar2, u uVar3, u uVar4, u uVar5, u uVar6, u uVar7, u uVar8, u uVar9, u uVar10, u uVar11, u uVar12, u uVar13, int i5) {
        u uVar14 = (i5 & 1) != 0 ? gVar.f90112a : uVar;
        u uVar15 = (i5 & 2) != 0 ? gVar.f90113b : uVar2;
        u uVar16 = (i5 & 4) != 0 ? gVar.f90114c : uVar3;
        u uVar17 = (i5 & 8) != 0 ? gVar.f90115d : uVar4;
        u uVar18 = (i5 & 16) != 0 ? gVar.f90116e : uVar5;
        u uVar19 = (i5 & 32) != 0 ? gVar.f90117f : uVar6;
        u uVar20 = (i5 & 64) != 0 ? gVar.f90118g : uVar7;
        u uVar21 = (i5 & 128) != 0 ? gVar.f90119h : uVar8;
        u uVar22 = (i5 & 256) != 0 ? gVar.f90120i : uVar9;
        String str = gVar.f90121j;
        String str2 = gVar.f90122k;
        u uVar23 = (i5 & 2048) != 0 ? gVar.f90123l : uVar10;
        u uVar24 = (i5 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? gVar.f90124m : uVar11;
        u uVar25 = (i5 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? gVar.n : uVar12;
        u uVar26 = (i5 & ReaderJsonLexerKt.BATCH_SIZE) != 0 ? gVar.o : uVar13;
        gVar.getClass();
        return new g(uVar14, uVar15, uVar16, uVar17, uVar18, uVar19, uVar20, uVar21, uVar22, str, str2, uVar23, uVar24, uVar25, uVar26);
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue
    java.lang.NullPointerException: Cannot invoke "java.util.List.iterator()" because the return value of "jadx.core.dex.visitors.regions.SwitchOverStringVisitor$SwitchData.getNewCases()" is null
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.restoreSwitchOverString(SwitchOverStringVisitor.java:109)
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.visitRegion(SwitchOverStringVisitor.java:66)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:77)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:82)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterative(DepthRegionTraversal.java:31)
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.visit(SwitchOverStringVisitor.java:60)
     */
    public final g a(String str, u uVar) {
        switch (str.hashCode()) {
            case -2060858225:
                if (str.equals("desktopSearchBar")) {
                    return b(this, null, null, null, null, null, uVar, null, null, null, null, null, null, null, 32735);
                }
                break;
            case -1323763471:
                if (str.equals("drawer")) {
                    return b(this, null, null, uVar, null, null, null, null, null, null, null, null, null, null, 32763);
                }
                break;
            case -616381397:
                if (str.equals("popupMenu")) {
                    return b(this, null, null, null, null, null, null, null, null, uVar, null, null, null, null, 32511);
                }
                break;
            case -192037555:
                if (str.equals("feedPage")) {
                    return b(this, null, null, null, null, null, null, null, null, null, null, null, uVar, null, 24575);
                }
                break;
            case -22813585:
                if (str.equals("novaSettings")) {
                    return b(this, uVar, null, null, null, null, null, null, null, null, null, null, null, null, 32766);
                }
                break;
            case 3088947:
                if (str.equals("dock")) {
                    return b(this, null, null, null, uVar, null, null, null, null, null, null, null, null, null, 32759);
                }
                break;
            case 168854362:
                if (str.equals("drawerSearchBar")) {
                    return b(this, null, null, null, null, null, null, uVar, null, null, null, null, null, null, 32703);
                }
                break;
            case 224546744:
                if (str.equals("searchWindow")) {
                    return b(this, null, null, null, null, null, null, null, uVar, null, null, null, null, null, 32639);
                }
                break;
            case 232002474:
                if (str.equals("desktopFolder")) {
                    return b(this, null, null, null, null, uVar, null, null, null, null, null, null, null, null, 32751);
                }
                break;
            case 1557106716:
                if (str.equals("desktop")) {
                    return b(this, null, uVar, null, null, null, null, null, null, null, null, null, null, null, 32765);
                }
                break;
            case 1847387774:
                if (str.equals("feedPageSearchBar")) {
                    return b(this, null, null, null, null, null, null, null, null, null, null, null, null, uVar, 16383);
                }
                break;
        }
        throw new IllegalStateException();
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue
    java.lang.NullPointerException: Cannot invoke "java.util.List.iterator()" because the return value of "jadx.core.dex.visitors.regions.SwitchOverStringVisitor$SwitchData.getNewCases()" is null
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.restoreSwitchOverString(SwitchOverStringVisitor.java:109)
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.visitRegion(SwitchOverStringVisitor.java:66)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:77)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:82)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterative(DepthRegionTraversal.java:31)
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.visit(SwitchOverStringVisitor.java:60)
     */
    public final u c(String str) {
        switch (str.hashCode()) {
            case -2060858225:
                if (str.equals("desktopSearchBar")) {
                    return this.f90117f;
                }
                break;
            case -1323763471:
                if (str.equals("drawer")) {
                    return this.f90114c;
                }
                break;
            case -755054401:
                if (str.equals("drawerFolder")) {
                    return this.f90126q;
                }
                break;
            case -616381397:
                if (str.equals("popupMenu")) {
                    return this.f90120i;
                }
                break;
            case -192037555:
                if (str.equals("feedPage")) {
                    return this.n;
                }
                break;
            case -22813585:
                if (str.equals("novaSettings")) {
                    return this.f90112a;
                }
                break;
            case 3088947:
                if (str.equals("dock")) {
                    return this.f90115d;
                }
                break;
            case 168854362:
                if (str.equals("drawerSearchBar")) {
                    return this.f90118g;
                }
                break;
            case 224546744:
                if (str.equals("searchWindow")) {
                    return this.f90119h;
                }
                break;
            case 232002474:
                if (str.equals("desktopFolder")) {
                    return this.f90116e;
                }
                break;
            case 1557106716:
                if (str.equals("desktop")) {
                    return this.f90113b;
                }
                break;
            case 1847387774:
                if (str.equals("feedPageSearchBar")) {
                    return this.o;
                }
                break;
        }
        throw new IllegalStateException();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        return Intrinsics.b(this.f90112a, gVar.f90112a) && Intrinsics.b(this.f90113b, gVar.f90113b) && Intrinsics.b(this.f90114c, gVar.f90114c) && Intrinsics.b(this.f90115d, gVar.f90115d) && Intrinsics.b(this.f90116e, gVar.f90116e) && Intrinsics.b(this.f90117f, gVar.f90117f) && Intrinsics.b(this.f90118g, gVar.f90118g) && Intrinsics.b(this.f90119h, gVar.f90119h) && Intrinsics.b(this.f90120i, gVar.f90120i) && Intrinsics.b(this.f90121j, gVar.f90121j) && Intrinsics.b(this.f90122k, gVar.f90122k) && Intrinsics.b(this.f90123l, gVar.f90123l) && Intrinsics.b(this.f90124m, gVar.f90124m) && Intrinsics.b(this.n, gVar.n) && Intrinsics.b(this.o, gVar.o);
    }

    public final int hashCode() {
        return this.o.hashCode() + ((this.n.hashCode() + ((this.f90124m.hashCode() + ((this.f90123l.hashCode() + c0.e(c0.e((this.f90120i.hashCode() + ((this.f90119h.hashCode() + ((this.f90118g.hashCode() + ((this.f90117f.hashCode() + ((this.f90116e.hashCode() + ((this.f90115d.hashCode() + ((this.f90114c.hashCode() + ((this.f90113b.hashCode() + (this.f90112a.hashCode() * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31)) * 31, 31, this.f90121j), 31, this.f90122k)) * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "NovaColorSchemeConfig(novaSettings=" + this.f90112a + ", desktop=" + this.f90113b + ", drawer=" + this.f90114c + ", dock=" + this.f90115d + ", desktopFolder=" + this.f90116e + ", desktopSearchBar=" + this.f90117f + ", drawerSearchBar=" + this.f90118g + ", searchWindow=" + this.f90119h + ", popupMenu=" + this.f90120i + ", _unused=" + this.f90121j + ", _unused2=" + this.f90122k + ", desktopFolderIcon=" + this.f90123l + ", numericBadge=" + this.f90124m + ", feedPage=" + this.n + ", feedPageSearchBar=" + this.o + ")";
    }

    public g(u uVar, u uVar2, u uVar3, u uVar4, u uVar5, u uVar6, u uVar7, u uVar8, u uVar9, String str, String str2, u uVar10, u uVar11, u uVar12, u uVar13) {
        this.f90112a = uVar;
        this.f90113b = uVar2;
        this.f90114c = uVar3;
        this.f90115d = uVar4;
        this.f90116e = uVar5;
        this.f90117f = uVar6;
        this.f90118g = uVar7;
        this.f90119h = uVar8;
        this.f90120i = uVar9;
        this.f90121j = str;
        this.f90122k = str2;
        this.f90123l = uVar10;
        this.f90124m = uVar11;
        this.n = uVar12;
        this.o = uVar13;
        u uVarA = u.a(uVar6, 0, 0L, 0L, 0L, 0, 0, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
        this.f90125p = uVarA;
        u uVarA2 = u.a(uVar5, 0, 0L, 0L, 0L, 0, 0, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
        this.f90126q = uVarA2;
        this.f90127r = uVar10;
        uVar7.f90177h = uVar3;
        uVarA2.f90177h = uVar3;
        uVarA.f90177h = uVar4;
        uVar13.f90177h = uVar12;
    }

    public g(u uVar, u uVar2, u uVar3, u uVar4, u uVar5, u uVar6, u uVar7, u uVar8, u uVar9, u uVar10, u uVar11, int i5) {
        u uVar12;
        u uVar13;
        if ((i5 & 2048) != 0) {
            r.Companion.getClass();
            n.Companion.getClass();
            uVar12 = new u(0, n.i(160, n.f90153q), n.f90140b, n.f90150l, 112);
        } else {
            uVar12 = uVar10;
        }
        if ((i5 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0) {
            r.Companion.getClass();
            n.Companion.getClass();
            uVar13 = new u(0, n.n, n.f90140b, n.f90150l, 112);
        } else {
            uVar13 = uVar11;
        }
        r.Companion.getClass();
        m mVar = n.Companion;
        mVar.getClass();
        u uVar14 = new u(0, n.i(Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, n.A), n.f90143e, n.f90147i, 112);
        mVar.getClass();
        this(uVar, uVar2, uVar3, uVar4, uVar5, uVar6, uVar7, uVar8, uVar9, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, uVar12, uVar13, uVar14, u.a(uVar14, 0, n.f90162z, 0L, 0L, 0, 0, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE));
    }
}
