package defpackage;

import android.view.autofill.AutofillValue;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jp implements th4 {
    public final AutofillValue a;

    public jp(AutofillValue autofillValue) {
        this.a = autofillValue;
    }

    public final Boolean a() {
        if (this.a.isToggle()) {
            return Boolean.valueOf(this.a.getToggleValue());
        }
        return null;
    }

    public final CharSequence b() {
        if (this.a.isText()) {
            return this.a.getTextValue();
        }
        return null;
    }
}
