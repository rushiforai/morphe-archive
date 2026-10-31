package com.teslacoilsw.launcher.analytics;

import com.google.firebase.messaging.FirebaseMessagingService;
import kotlin.Metadata;
import rp.a;
import yx.g;
import yx.h;
import zy.c;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/teslacoilsw/launcher/analytics/NovaFcmService;", "Lcom/google/firebase/messaging/FirebaseMessagingService;", "<init>", "()V", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class NovaFcmService extends FirebaseMessagingService {
    @Override // com.google.firebase.messaging.FirebaseMessagingService
    public final void c(String str) {
        h hVar = h.f97704a;
        h.f97707d = str;
        if (h.f97705b == g.f97702c) {
            h.f97707d = null;
            try {
                a.g(str);
            } catch (Throwable th2) {
                c cVar = c.f98823a;
                c.j(th2);
            }
        }
    }
}
