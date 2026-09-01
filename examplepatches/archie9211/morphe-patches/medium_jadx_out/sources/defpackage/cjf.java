package defpackage;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Looper;
import android.os.Message;
import android.util.Log;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cjf extends tjf {
    public final Context a;
    public final /* synthetic */ ae5 b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public cjf(ae5 ae5Var, Context context) {
        super(Looper.myLooper() == null ? Looper.getMainLooper() : Looper.myLooper(), 0);
        this.b = ae5Var;
        this.a = context.getApplicationContext();
    }

    @Override // android.os.Handler
    public final void handleMessage(Message message) {
        int i = message.what;
        if (i != 1) {
            StringBuilder sb = new StringBuilder(String.valueOf(i).length() + 39);
            sb.append("Don't know how to handle this message: ");
            sb.append(i);
            Log.w("GoogleApiAvailability", sb.toString());
            return;
        }
        int i2 = be5.a;
        ae5 ae5Var = this.b;
        Context context = this.a;
        int iC = ae5Var.c(context, i2);
        int i3 = he5.e;
        if (iC == 1 || iC == 2 || iC == 3 || iC == 9) {
            Intent intentA = ae5Var.a(iC, context, "n");
            ae5Var.g(context, iC, intentA == null ? null : PendingIntent.getActivity(context, 0, intentA, 201326592));
        }
    }
}
