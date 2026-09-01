package defpackage;

import android.text.Editable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qq8 extends wq8 {
    @Override // defpackage.wq8
    public final void onCharacterAdded(Editable editable, int i) {
        editable.getClass();
        int i2 = i - 1;
        if (mk7.A(editable, i2, '-')) {
            int i3 = i - 2;
            if (mk7.A(editable, i3, '<')) {
                editable.replace(i3, i + 1, "←");
            } else if (mk7.A(editable, i3, ' ')) {
                editable.replace(i2, i + 1, "— ");
            } else {
                editable.replace(i2, i + 1, " — ");
            }
        }
    }
}
