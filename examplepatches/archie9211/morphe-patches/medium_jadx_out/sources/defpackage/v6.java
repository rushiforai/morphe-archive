package defpackage;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.res.TypedArray;
import android.net.Uri;
import android.util.AttributeSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v6 extends va8 {
    public Intent g;
    public String h;

    public static String v(Context context, String str) {
        if (str == null) {
            return null;
        }
        String packageName = context.getPackageName();
        packageName.getClass();
        return tuc.L(str, "${applicationId}", packageName);
    }

    @Override // defpackage.va8
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && (obj instanceof v6) && super.equals(obj)) {
            Intent intent = this.g;
            if ((intent != null ? intent.filterEquals(((v6) obj).g) : ((v6) obj).g == null) && g76.L(this.h, ((v6) obj).h)) {
                return true;
            }
        }
        return false;
    }

    @Override // defpackage.va8
    public final int hashCode() {
        int iHashCode = super.hashCode() * 31;
        Intent intent = this.g;
        int iFilterHashCode = (iHashCode + (intent != null ? intent.filterHashCode() : 0)) * 31;
        String str = this.h;
        return iFilterHashCode + (str != null ? str.hashCode() : 0);
    }

    @Override // defpackage.va8
    public final void s(Context context, AttributeSet attributeSet) {
        context.getClass();
        super.s(context, attributeSet);
        TypedArray typedArrayObtainAttributes = context.getResources().obtainAttributes(attributeSet, bsa.a);
        typedArrayObtainAttributes.getClass();
        String strV = v(context, typedArrayObtainAttributes.getString(4));
        Intent intent = this.g;
        if (intent == null) {
            intent = new Intent();
            this.g = intent;
        }
        intent.setPackage(strV);
        String string = typedArrayObtainAttributes.getString(0);
        if (string != null) {
            if (string.charAt(0) == '.') {
                string = context.getPackageName() + string;
            }
            ComponentName componentName = new ComponentName(context, string);
            Intent intent2 = this.g;
            if (intent2 == null) {
                intent2 = new Intent();
                this.g = intent2;
            }
            intent2.setComponent(componentName);
        }
        String string2 = typedArrayObtainAttributes.getString(1);
        Intent intent3 = this.g;
        if (intent3 == null) {
            intent3 = new Intent();
            this.g = intent3;
        }
        intent3.setAction(string2);
        String strV2 = v(context, typedArrayObtainAttributes.getString(2));
        if (strV2 != null) {
            Uri uri = Uri.parse(strV2);
            Intent intent4 = this.g;
            if (intent4 == null) {
                intent4 = new Intent();
                this.g = intent4;
            }
            intent4.setData(uri);
        }
        this.h = v(context, typedArrayObtainAttributes.getString(3));
        typedArrayObtainAttributes.recycle();
    }

    @Override // defpackage.va8
    public final String toString() {
        Intent intent = this.g;
        ComponentName component = intent != null ? intent.getComponent() : null;
        StringBuilder sb = new StringBuilder(super.toString());
        if (component != null) {
            sb.append(" class=");
            sb.append(component.getClassName());
        } else {
            Intent intent2 = this.g;
            String action = intent2 != null ? intent2.getAction() : null;
            if (action != null) {
                sb.append(" action=");
                sb.append(action);
            }
        }
        return sb.toString();
    }
}
