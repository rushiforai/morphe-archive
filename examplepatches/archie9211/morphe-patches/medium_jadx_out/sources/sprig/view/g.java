package sprig.view;

import android.graphics.Rect;
import defpackage.ev6;
import defpackage.g76;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u0012\b\u0080\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\b\u001a\u00020\u0002\u0012\u0006\u0010\t\u001a\u00020\u0004\u0012\u0006\u0010\n\u001a\u00020\u0006¢\u0006\u0004\b\u001d\u0010\u001eJ\t\u0010\u0003\u001a\u00020\u0002HÆ\u0003J\t\u0010\u0005\u001a\u00020\u0004HÆ\u0003J\t\u0010\u0007\u001a\u00020\u0006HÆ\u0003J'\u0010\u000b\u001a\u00020\u00002\b\b\u0002\u0010\b\u001a\u00020\u00022\b\b\u0002\u0010\t\u001a\u00020\u00042\b\b\u0002\u0010\n\u001a\u00020\u0006HÆ\u0001J\t\u0010\f\u001a\u00020\u0002HÖ\u0001J\t\u0010\u000e\u001a\u00020\rHÖ\u0001J\u0013\u0010\u0010\u001a\u00020\u00042\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003R\u0017\u0010\b\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0011\u0010\u0012\u001a\u0004\b\u0013\u0010\u0014R\u0017\u0010\t\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0015\u0010\u0016\u001a\u0004\b\u0017\u0010\u0018R\u0017\u0010\n\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u0019\u0010\u001a\u001a\u0004\b\u001b\u0010\u001c¨\u0006\u001f"}, d2 = {"Lsprig/d/g;", "", "", "component1", "", "component2", "Landroid/graphics/Rect;", "component3", "className", "redacted", "frame", "copy", "toString", "", "hashCode", "other", "equals", "a", "Ljava/lang/String;", "getClassName", "()Ljava/lang/String;", "b", "Z", "getRedacted", "()Z", "c", "Landroid/graphics/Rect;", "getFrame", "()Landroid/graphics/Rect;", "<init>", "(Ljava/lang/String;ZLandroid/graphics/Rect;)V", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final /* data */ class g {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public final String className;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    public final boolean redacted;

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    public final Rect frame;

    public g(String str, boolean z, Rect rect) {
        str.getClass();
        rect.getClass();
        this.className = str;
        this.redacted = z;
        this.frame = rect;
    }

    public static /* synthetic */ g copy$default(g gVar, String str, boolean z, Rect rect, int i, Object obj) {
        if ((i & 1) != 0) {
            str = gVar.className;
        }
        if ((i & 2) != 0) {
            z = gVar.redacted;
        }
        if ((i & 4) != 0) {
            rect = gVar.frame;
        }
        return gVar.copy(str, z, rect);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getClassName() {
        return this.className;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final boolean getRedacted() {
        return this.redacted;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final Rect getFrame() {
        return this.frame;
    }

    public final g copy(String className, boolean redacted, Rect frame) {
        className.getClass();
        frame.getClass();
        return new g(className, redacted, frame);
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof g)) {
            return false;
        }
        g gVar = (g) other;
        return g76.L(this.className, gVar.className) && this.redacted == gVar.redacted && g76.L(this.frame, gVar.frame);
    }

    public final String getClassName() {
        return this.className;
    }

    public final Rect getFrame() {
        return this.frame;
    }

    public final boolean getRedacted() {
        return this.redacted;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v1, types: [int] */
    /* JADX WARN: Type inference failed for: r1v2 */
    /* JADX WARN: Type inference failed for: r1v3 */
    public int hashCode() {
        int iHashCode = this.className.hashCode() * 31;
        boolean z = this.redacted;
        ?? r1 = z;
        if (z) {
            r1 = 1;
        }
        return this.frame.hashCode() + ((iHashCode + r1) * 31);
    }

    public String toString() {
        String str = this.className;
        boolean z = this.redacted;
        Rect rect = this.frame;
        StringBuilder sbD = ev6.D("ViewRenderingDetails(className=", str, ", redacted=", ", frame=", z);
        sbD.append(rect);
        sbD.append(")");
        return sbD.toString();
    }
}
