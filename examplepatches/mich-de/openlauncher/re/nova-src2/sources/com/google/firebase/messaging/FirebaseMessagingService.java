package com.google.firebase.messaging;

import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import com.google.android.gms.tasks.Tasks;
import java.io.IOException;
import java.util.ArrayDeque;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import mh.c;
import og.a;
import og.g;
import p3.i;
import t5.d0;
import tm.f;

/* loaded from: classes3.dex */
public class FirebaseMessagingService extends f {

    /* renamed from: g, reason: collision with root package name */
    public static final ArrayDeque f34764g = new ArrayDeque(10);

    /* renamed from: f, reason: collision with root package name */
    public a f34765f;

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:26:0x005a  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0073  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x007e  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0089  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0094  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x009f  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00ac  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00b8  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00bc  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00e0  */
    @Override // tm.f
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void b(Intent intent) throws NumberFormatException {
        String stringExtra;
        FirebaseMessagingService firebaseMessagingService;
        int i5;
        String action = intent.getAction();
        if (!"com.google.android.c2dm.intent.RECEIVE".equals(action) && !"com.google.firebase.messaging.RECEIVE_DIRECT_BOOT".equals(action)) {
            if ("com.google.firebase.messaging.NEW_TOKEN".equals(action)) {
                c(intent.getStringExtra("token"));
                return;
            }
            if ("com.google.firebase.messaging.FCM_REGISTERED".equals(action)) {
                intent.getStringExtra("token");
                return;
            } else if ("com.google.firebase.messaging.FCM_UNREGISTERED".equals(action)) {
                intent.getStringExtra("token");
                return;
            } else {
                intent.getAction();
                return;
            }
        }
        String stringExtra2 = intent.getStringExtra("google.message_id");
        if (TextUtils.isEmpty(stringExtra2)) {
            stringExtra = intent.getStringExtra("message_type");
            if (stringExtra == null) {
                stringExtra = "gcm";
            }
            switch (stringExtra) {
                case "deleted_messages":
                    firebaseMessagingService = this;
                    break;
                case "gcm":
                    i.z(intent);
                    Bundle extras = intent.getExtras();
                    if (extras == null) {
                        extras = new Bundle();
                    }
                    extras.remove("androidx.content.wakelockid");
                    if (d0.A(extras)) {
                        d0 d0Var = new d0(extras);
                        ExecutorService executorServiceNewSingleThreadExecutor = Executors.newSingleThreadExecutor(new yg.a("Firebase-Messaging-Network-Io"));
                        firebaseMessagingService = this;
                        try {
                            if (!new c(20, (Object) firebaseMessagingService, (Object) d0Var, (Object) executorServiceNewSingleThreadExecutor, false).G()) {
                                executorServiceNewSingleThreadExecutor.shutdown();
                                if (i.E(intent)) {
                                    i.A("_nf", intent.getExtras());
                                    break;
                                }
                            } else {
                                break;
                            }
                        } finally {
                            executorServiceNewSingleThreadExecutor.shutdown();
                        }
                    }
                    break;
                case "send_error":
                    if (intent.getStringExtra("google.message_id") == null) {
                        intent.getStringExtra("message_id");
                    }
                    String stringExtra3 = intent.getStringExtra("error");
                    new SendException(stringExtra3);
                    if (stringExtra3 != null) {
                        stringExtra3.toLowerCase(Locale.US).getClass();
                    }
                    firebaseMessagingService = this;
                    break;
                case "send_event":
                    intent.getStringExtra("google.message_id");
                    firebaseMessagingService = this;
                    break;
                default:
                    Log.w("FirebaseMessaging", "Received message with unknown type: ".concat(stringExtra));
                    firebaseMessagingService = this;
                    break;
            }
        } else {
            ArrayDeque arrayDeque = f34764g;
            if (!arrayDeque.contains(stringExtra2)) {
                if (arrayDeque.size() >= 10) {
                    arrayDeque.remove();
                }
                arrayDeque.add(stringExtra2);
                stringExtra = intent.getStringExtra("message_type");
                if (stringExtra == null) {
                }
                switch (stringExtra) {
                    case -2062414158:
                        break;
                    case 102161:
                        break;
                    case 814694033:
                        break;
                    case 814800675:
                        break;
                }
            }
            firebaseMessagingService = this;
        }
        if (firebaseMessagingService.f34765f == null) {
            firebaseMessagingService.f34765f = new a(getApplicationContext());
        }
        a aVar = firebaseMessagingService.f34765f;
        if (aVar.f80383c.b0() < 233700000) {
            Tasks.c(new IOException("SERVICE_NOT_AVAILABLE"));
            return;
        }
        Bundle bundle = new Bundle();
        String stringExtra4 = intent.getStringExtra("google.message_id");
        if (stringExtra4 == null) {
            stringExtra4 = intent.getStringExtra("message_id");
        }
        bundle.putString("google.message_id", stringExtra4);
        Integer numValueOf = intent.hasExtra("google.product_id") ? Integer.valueOf(intent.getIntExtra("google.product_id", 0)) : null;
        if (numValueOf != null) {
            bundle.putInt("google.product_id", numValueOf.intValue());
        }
        g gVarE = g.e(aVar.f80382b);
        synchronized (gVarE) {
            i5 = gVarE.f80406a;
            gVarE.f80406a = i5 + 1;
        }
        gVarE.f(new og.f(i5, 3, bundle, 0));
    }

    public void c(String str) {
    }
}
