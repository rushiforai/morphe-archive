package defpackage;

import android.content.Context;
import android.content.Intent;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e99 extends f7 {
    public final Context a;
    public final g7 b;

    public e99(Context context) {
        context.getClass();
        this.a = context;
        this.b = new g7(1);
    }

    @Override // defpackage.f7
    public final Intent a(Context context, Object obj) {
        String str;
        f99 f99Var = (f99) obj;
        f99Var.getClass();
        if (u4.h() || context.getPackageManager().resolveActivity(new Intent("androidx.activity.result.contract.action.PICK_IMAGES"), 1114112) != null) {
            return this.b.d(context, f99Var);
        }
        j7 j7Var = f99Var.a;
        if (j7Var instanceof i7) {
            str = "image/*";
        } else {
            if (!(j7Var instanceof h7)) {
                ygf.a();
                return null;
            }
            str = "*/*";
        }
        Intent type = new Intent("android.intent.action.GET_CONTENT").addCategory("android.intent.category.OPENABLE").setType(str);
        type.getClass();
        return type;
    }

    @Override // defpackage.f7
    public final Object c(int i, Intent intent) {
        Context context = this.a;
        context.getClass();
        if (u4.h() || context.getPackageManager().resolveActivity(new Intent("androidx.activity.result.contract.action.PICK_IMAGES"), 1114112) != null) {
            return this.b.e(i, intent);
        }
        if (i != -1) {
            intent = null;
        }
        if (intent != null) {
            return intent.getData();
        }
        return null;
    }
}
