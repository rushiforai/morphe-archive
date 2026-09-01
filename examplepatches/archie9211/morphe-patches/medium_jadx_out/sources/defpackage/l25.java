package defpackage;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l25 extends va8 {
    public String g;

    @Override // defpackage.va8
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return obj != null && (obj instanceof l25) && super.equals(obj) && g76.L(this.g, ((l25) obj).g);
    }

    @Override // defpackage.va8
    public final int hashCode() {
        int iHashCode = super.hashCode() * 31;
        String str = this.g;
        return iHashCode + (str != null ? str.hashCode() : 0);
    }

    @Override // defpackage.va8
    public final void s(Context context, AttributeSet attributeSet) {
        context.getClass();
        super.s(context, attributeSet);
        TypedArray typedArrayObtainAttributes = context.getResources().obtainAttributes(attributeSet, dsa.b);
        typedArrayObtainAttributes.getClass();
        String string = typedArrayObtainAttributes.getString(0);
        if (string != null) {
            this.g = string;
        }
        typedArrayObtainAttributes.recycle();
    }

    @Override // defpackage.va8
    public final String toString() {
        StringBuilder sb = new StringBuilder(super.toString());
        sb.append(" class=");
        String str = this.g;
        if (str == null) {
            sb.append("null");
        } else {
            sb.append(str);
        }
        return sb.toString();
    }
}
