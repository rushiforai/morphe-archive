package com.google.android.gms.internal.measurement;

import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import java.util.UUID;

/* loaded from: classes3.dex */
public class z6 extends Handler {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f33290a;

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        switch (this.f33290a) {
            case 4:
                if (message.what == 0) {
                    e10.g2 g2Var = e10.a3.f51435a;
                    g2Var.f51552h = true;
                    SharedPreferences.Editor editorEdit = g2Var.f51545a.edit();
                    editorEdit.putInt("1", UUID.randomUUID().hashCode());
                    editorEdit.apply();
                    break;
                }
                break;
            default:
                super.handleMessage(message);
                break;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ z6(Looper looper, int i5, boolean z11) {
        super(looper);
        this.f33290a = i5;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ z6(Looper looper, Handler.Callback callback) {
        super(looper, callback);
        this.f33290a = 2;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z6(Looper looper, int i5) {
        super(looper);
        this.f33290a = i5;
        switch (i5) {
            case 1:
                super(looper);
                Looper.getMainLooper();
                break;
            default:
                Looper.getMainLooper();
                break;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z6(Looper looper, rg.e eVar) {
        super(looper, eVar);
        this.f33290a = 1;
        Looper.getMainLooper();
    }
}
