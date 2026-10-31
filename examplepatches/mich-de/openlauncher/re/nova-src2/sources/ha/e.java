package ha;

import android.os.Handler;
import android.os.Message;
import android.service.notification.NotificationListenerService;
import android.service.notification.StatusBarNotification;
import android.util.Log;
import android.util.Pair;
import com.teslacoilsw.launcher.notificationlistener.NotificationListener;
import e00.u3;
import e30.j;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;
import ya.g0;

/* loaded from: classes2.dex */
public final /* synthetic */ class e implements Handler.Callback {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f59578a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f59579b;

    public /* synthetic */ e(Object obj, int i5) {
        this.f59578a = i5;
        this.f59579b = obj;
    }

    @Override // android.os.Handler.Callback
    public final boolean handleMessage(Message message) {
        Object arrayList;
        switch (this.f59578a) {
            case 0:
                NotificationListener notificationListener = (NotificationListener) this.f59579b;
                HashMap map = notificationListener.f59586d;
                Handler handler = notificationListener.f59584b;
                int i5 = message.what;
                if (i5 != 1) {
                    if (i5 != 2) {
                        if (i5 != 3) {
                            if (i5 != 4) {
                                if (i5 != 5) {
                                    break;
                                } else if (g.f59582i) {
                                    for (StatusBarNotification statusBarNotification : notificationListener.getActiveNotifications(((NotificationListenerService.RankingMap) message.obj).getOrderedKeys())) {
                                        notificationListener.c(statusBarNotification);
                                    }
                                    break;
                                }
                            } else {
                                String str = (String) message.obj;
                                notificationListener.f59588f = str;
                                notificationListener.cancelNotification(str);
                                break;
                            }
                        } else {
                            if (g.f59582i) {
                                try {
                                    arrayList = (List) Arrays.stream(notificationListener.getActiveNotifications()).filter(new u3(notificationListener, 4)).collect(Collectors.toList());
                                } catch (SecurityException unused) {
                                    Log.e("NotificationListener", "SecurityException: failed to fetch notifications");
                                    arrayList = new ArrayList();
                                }
                            } else {
                                arrayList = new ArrayList();
                            }
                            handler.obtainMessage(message.what, arrayList).sendToTarget();
                            break;
                        }
                    } else {
                        StatusBarNotification statusBarNotification2 = (StatusBarNotification) message.obj;
                        handler.obtainMessage(2, Pair.create(new g0(statusBarNotification2.getPackageName(), statusBarNotification2.getUser()), mz.h.a(statusBarNotification2))).sendToTarget();
                        b bVar = (b) map.get(statusBarNotification2.getGroupKey());
                        String key = statusBarNotification2.getKey();
                        if (bVar != null) {
                            bVar.c(key);
                            if (bVar.f59565b.isEmpty()) {
                                if (key.equals(notificationListener.f59588f)) {
                                    notificationListener.cancelNotification(bVar.f59564a);
                                }
                                map.remove(statusBarNotification2.getGroupKey());
                            }
                        }
                        if (key.equals(notificationListener.f59588f)) {
                            notificationListener.f59588f = null;
                            break;
                        }
                    }
                } else {
                    StatusBarNotification statusBarNotification3 = (StatusBarNotification) message.obj;
                    handler.obtainMessage(notificationListener.b(statusBarNotification3) ? 1 : 2, Pair.create(new g0(statusBarNotification3.getPackageName(), statusBarNotification3.getUser()), mz.h.a(statusBarNotification3))).sendToTarget();
                    break;
                }
                break;
            default:
                wf.h hVar = (wf.h) this.f59579b;
                Iterator it = hVar.f94330d.iterator();
                while (it.hasNext()) {
                    wf.g gVar = (wf.g) it.next();
                    wf.f fVar = hVar.f94329c;
                    if (!gVar.f94326d && gVar.f94325c) {
                        wf.d dVarH = gVar.f94324b.h();
                        gVar.f94324b = new j(7);
                        gVar.f94325c = false;
                        fVar.f(gVar.f94323a, dVarH);
                    }
                    if (hVar.f94328b.f94370a.hasMessages(0)) {
                        break;
                    }
                }
                break;
        }
        return true;
    }
}
