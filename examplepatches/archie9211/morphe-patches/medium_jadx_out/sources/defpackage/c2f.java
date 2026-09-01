package defpackage;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import com.facebook.FacebookDialogException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c2f extends n1f {
    public static final /* synthetic */ int o = 0;
    public final String n;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c2f(String str, String str2, m15 m15Var) {
        super(m15Var, str);
        m15Var.getClass();
        str2.getClass();
        this.n = str2;
        this.b = str2;
    }

    @Override // defpackage.n1f
    public final Bundle c(String str) {
        String str2 = this.n;
        if (str2.length() <= 0 || !tuc.N(str, str2, false)) {
            return super.c(str);
        }
        try {
            Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(str));
            intent.addFlags(268435456);
            getContext().startActivity(intent);
            dismiss();
        } catch (Exception e) {
            e(new FacebookDialogException("Failed to launch custom redirect: " + e.getMessage(), -1, str));
        }
        return new Bundle();
    }
}
