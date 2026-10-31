package com.facebook.ads.redexgen.X;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.Messenger;

/* renamed from: com.facebook.ads.redexgen.X.gB, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ServiceConnectionC1794gB implements ServiceConnection {
    public static String[] A01 = {"ngGkpjAbiDqI5fNUZWfzpCs8", "ylP2urmrE90IxK0i7RWiCIXAIvzpBsdL", "aCR9COQiNO48m8MJLWSqKzp9WCyMnAsM", "D6rFEeRczM8yhG0IGlJtc", "Gyb732F4U9eQ07zP9Trhv", "a9bhlsDHuS7BulfVZwvbOQGE", "j3d2vbC0NzSo803R6jxXYJhh", "6nNXm2ki7xJE9GeftnLn59FQ"};
    public final /* synthetic */ HandlerC1795gC A00;

    public ServiceConnectionC1794gB(HandlerC1795gC handlerC1795gC) {
        this.A00 = handlerC1795gC;
    }

    @Override // android.content.ServiceConnection
    public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        this.A00.A07.A0F().AJL();
        this.A00.A04.removeCallbacks(this.A00.A09);
        if (iBinder != null) {
            this.A00.A00 = new Messenger(iBinder);
            if (this.A00.A02) {
                this.A00.A02 = false;
                String[] strArr = A01;
                if (strArr[2].charAt(5) == strArr[1].charAt(5)) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A01;
                strArr2[6] = "V9K6AFDlQ4uBqxixw85LWbfF";
                strArr2[0] = "hRlL1oGWdG4Ka1T6AUojuR5g";
                this.A00.A06.A06();
                return;
            }
            return;
        }
        this.A00.A07.A0F().AJN();
        this.A00.A06();
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
        this.A00.A07.A0F().AJM();
        if (!this.A00.A01) {
            return;
        }
        this.A00.A06();
    }
}
