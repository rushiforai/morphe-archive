package defpackage;

import android.content.SharedPreferences;
import android.os.Bundle;
import com.google.firebase.messaging.FirebaseMessaging;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class mk4 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ FirebaseMessaging b;
    public final /* synthetic */ wfd c;

    public /* synthetic */ mk4(FirebaseMessaging firebaseMessaging, wfd wfdVar, int i) {
        this.a = i;
        this.b = firebaseMessaging;
        this.c = wfdVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.a) {
            case 0:
                FirebaseMessaging firebaseMessaging = this.b;
                wfd wfdVar = this.c;
                try {
                    wfdVar.b(firebaseMessaging.a());
                    return;
                } catch (Exception e) {
                    wfdVar.a(e);
                    return;
                }
            default:
                FirebaseMessaging firebaseMessaging2 = this.b;
                wfd wfdVar2 = this.c;
                try {
                    nig nigVar = firebaseMessaging2.c;
                    nigVar.getClass();
                    Bundle bundle = new Bundle();
                    bundle.putString("delete", "1");
                    vp7.h(nigVar.h(nigVar.G(e4.d((xj4) nigVar.a), "*", bundle)));
                    dsc dscVarC = FirebaseMessaging.c(firebaseMessaging2.b);
                    String strD = firebaseMessaging2.d();
                    String strD2 = e4.d(firebaseMessaging2.a);
                    synchronized (dscVarC) {
                        String strA = dsc.a(strD, strD2);
                        SharedPreferences.Editor editorEdit = dscVarC.a.edit();
                        editorEdit.remove(strA);
                        editorEdit.commit();
                    }
                    wfdVar2.b(null);
                    return;
                } catch (Exception e2) {
                    wfdVar2.a(e2);
                    return;
                }
        }
    }
}
