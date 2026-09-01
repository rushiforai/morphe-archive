package defpackage;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class wy1 extends Activity implements iy6, ik6 {
    private final aec extraDataMap = new aec(0);
    private final ky6 lifecycleRegistry = new ky6(this, true);

    @Override // android.app.Activity, android.view.Window.Callback
    public boolean dispatchKeyEvent(KeyEvent keyEvent) {
        keyEvent.getClass();
        View decorView = getWindow().getDecorView();
        decorView.getClass();
        if (ute.d(decorView, keyEvent)) {
            return true;
        }
        return g76.U(this, decorView, this, keyEvent);
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public boolean dispatchKeyShortcutEvent(KeyEvent keyEvent) {
        keyEvent.getClass();
        View decorView = getWindow().getDecorView();
        decorView.getClass();
        if (ute.d(decorView, keyEvent)) {
            return true;
        }
        return super.dispatchKeyShortcutEvent(keyEvent);
    }

    @z73
    public <T extends qy1> T getExtraData(Class<T> cls) {
        cls.getClass();
        if (this.extraDataMap.get(cls) == null) {
            return null;
        }
        rd6.m();
        return null;
    }

    @Override // defpackage.iy6
    public wx6 getLifecycle() {
        return this.lifecycleRegistry;
    }

    @Override // android.app.Activity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        int i = f5b.b;
        d5b.b(this);
    }

    @Override // android.app.Activity
    public void onSaveInstanceState(Bundle bundle) {
        bundle.getClass();
        this.lifecycleRegistry.g(vx6.CREATED);
        super.onSaveInstanceState(bundle);
    }

    @z73
    public void putExtraData(qy1 qy1Var) {
        throw null;
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:15:0x0021  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0045  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean shouldDumpInternalState(java.lang.String[] r3) {
        /*
            r2 = this;
            r2 = 1
            r0 = 0
            if (r3 == 0) goto L5c
            int r1 = r3.length
            if (r1 != 0) goto L8
            goto L5c
        L8:
            r3 = r3[r0]
            int r1 = r3.hashCode()
            switch(r1) {
                case -645125871: goto L4c;
                case 100470631: goto L3c;
                case 472614934: goto L33;
                case 1159329357: goto L23;
                case 1455016274: goto L12;
                default: goto L11;
            }
        L11:
            goto L5c
        L12:
            java.lang.String r1 = "--autofill"
            boolean r3 = r3.equals(r1)
            if (r3 != 0) goto L1b
            goto L5c
        L1b:
            int r3 = android.os.Build.VERSION.SDK_INT
            r1 = 26
            if (r3 < r1) goto L5c
        L21:
            r0 = r2
            goto L5c
        L23:
            java.lang.String r1 = "--contentcapture"
            boolean r3 = r3.equals(r1)
            if (r3 != 0) goto L2c
            goto L5c
        L2c:
            int r3 = android.os.Build.VERSION.SDK_INT
            r1 = 29
            if (r3 < r1) goto L5c
            goto L21
        L33:
            java.lang.String r1 = "--list-dumpables"
            boolean r3 = r3.equals(r1)
            if (r3 != 0) goto L45
            goto L5c
        L3c:
            java.lang.String r1 = "--dump-dumpable"
            boolean r3 = r3.equals(r1)
            if (r3 != 0) goto L45
            goto L5c
        L45:
            int r3 = android.os.Build.VERSION.SDK_INT
            r1 = 33
            if (r3 < r1) goto L5c
            goto L21
        L4c:
            java.lang.String r1 = "--translation"
            boolean r3 = r3.equals(r1)
            if (r3 != 0) goto L55
            goto L5c
        L55:
            int r3 = android.os.Build.VERSION.SDK_INT
            r1 = 31
            if (r3 < r1) goto L5c
            goto L21
        L5c:
            r2 = r2 ^ r0
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wy1.shouldDumpInternalState(java.lang.String[]):boolean");
    }

    @Override // defpackage.ik6
    public boolean superDispatchKeyEvent(KeyEvent keyEvent) {
        keyEvent.getClass();
        return super.dispatchKeyEvent(keyEvent);
    }

    public Context zza() {
        return getApplicationContext();
    }
}
