package com.facebook.ads.redexgen.X;

import android.content.DialogInterface;
import android.widget.EditText;

/* renamed from: com.facebook.ads.redexgen.X.qs, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class DialogInterfaceOnClickListenerC2442qs implements DialogInterface.OnClickListener {
    public final /* synthetic */ EditText A00;
    public final /* synthetic */ C0923Fz A01;

    public DialogInterfaceOnClickListenerC2442qs(C0923Fz c0923Fz, EditText editText) {
        this.A01 = c0923Fz;
        this.A00 = editText;
    }

    @Override // android.content.DialogInterface.OnClickListener
    public final void onClick(DialogInterface dialogInterface, int i5) {
        this.A01.A03.execute(new G0(this, dialogInterface));
    }
}
