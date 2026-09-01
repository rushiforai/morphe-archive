package defpackage;

import android.content.Context;
import android.content.Intent;
import android.graphics.Rect;
import android.os.Build;
import android.view.View;
import android.view.autofill.AutofillId;
import android.view.autofill.AutofillManager;
import android.view.autofill.AutofillValue;
import com.medium.android.donkey.audio.AudioService;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sk0 {
    public final Object a;

    public /* synthetic */ sk0(Object obj) {
        this.a = obj;
    }

    public void a() {
        ((AutofillManager) this.a).commit();
    }

    public void b(mn mnVar, int i, AutofillValue autofillValue) {
        ((AutofillManager) this.a).notifyValueChanged(mnVar, i, autofillValue);
    }

    public void c(mn mnVar, int i, Rect rect) {
        ((AutofillManager) this.a).notifyViewEntered(mnVar, i, rect);
    }

    public void d(mn mnVar, int i) {
        ((AutofillManager) this.a).notifyViewExited(mnVar, i);
    }

    public void e(View view, int i, boolean z) {
        if (Build.VERSION.SDK_INT >= 27) {
            nk0.a(view, (AutofillManager) this.a, i, z);
        }
    }

    public void f(mn mnVar, int i, Rect rect) {
        ((AutofillManager) this.a).requestAutofill(mnVar, i, rect);
    }

    public void g() {
        Context context = (Context) this.a;
        Intent intent = new Intent(context, (Class<?>) AudioService.class);
        if (Build.VERSION.SDK_INT >= 26) {
            context.startForegroundService(intent);
        } else {
            context.startService(intent);
        }
    }

    public AutofillId h() {
        return z10.e(this.a);
    }
}
