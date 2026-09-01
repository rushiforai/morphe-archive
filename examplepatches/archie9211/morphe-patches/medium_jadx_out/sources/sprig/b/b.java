package sprig.b;

import com.userleap.EventListener;
import com.userleap.EventName;
import com.userleap.SprigEvent;
import com.userleap.SprigLoggingLevel;
import defpackage.ei7;
import defpackage.f09;
import defpackage.km4;
import defpackage.lv8;
import defpackage.tuc;
import j$.util.concurrent.ConcurrentHashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;
import kotlin.Metadata;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000l\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010#\n\u0002\b\u0004\n\u0002\u0010\u0011\n\u0002\b\u0002\n\u0002\u0010%\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0006\bÀ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u001d\u0010\t\u001a\u00020\b2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\t\u0010\nJ\u001d\u0010\u000b\u001a\u00020\b2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\u000b\u0010\nJ)\u0010\u0012\u001a\u00020\u00112\u0006\u0010\r\u001a\u00020\f2\b\b\u0002\u0010\u000f\u001a\u00020\u000e2\b\b\u0002\u0010\u0010\u001a\u00020\b¢\u0006\u0004\b\u0012\u0010\u0013J)\u0010\u0014\u001a\u00020\u00112\u0006\u0010\r\u001a\u00020\f2\b\b\u0002\u0010\u000f\u001a\u00020\u000e2\b\b\u0002\u0010\u0010\u001a\u00020\b¢\u0006\u0004\b\u0014\u0010\u0013J)\u0010\u0015\u001a\u00020\u00112\u0006\u0010\r\u001a\u00020\f2\b\b\u0002\u0010\u000f\u001a\u00020\u000e2\b\b\u0002\u0010\u0010\u001a\u00020\b¢\u0006\u0004\b\u0015\u0010\u0013J9\u0010\u0019\u001a\u00020\u00112\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f2\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\f2\b\b\u0002\u0010\u000f\u001a\u00020\u000e2\b\b\u0002\u0010\u0018\u001a\u00020\u0017¢\u0006\u0004\b\u0019\u0010\u001aJ9\u0010\u001b\u001a\u00020\u00112\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f2\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\f2\b\b\u0002\u0010\u000f\u001a\u00020\u000e2\b\b\u0002\u0010\u0018\u001a\u00020\u0017¢\u0006\u0004\b\u001b\u0010\u001aJ\u001f\u0010\u001f\u001a\u00020\u00112\u0006\u0010\u001c\u001a\u00020\u00042\b\u0010\u001e\u001a\u0004\u0018\u00010\u001d¢\u0006\u0004\b\u001f\u0010 J\u0015\u0010\u001f\u001a\u00020\u00112\u0006\u0010\u0005\u001a\u00020!¢\u0006\u0004\b\u001f\u0010\"J\u001d\u0010$\u001a\b\u0012\u0004\u0012\u00020\u00060#2\u0006\u0010\u0005\u001a\u00020\u0004H\u0002¢\u0006\u0004\b$\u0010%J\u0017\u0010$\u001a\u00020\f2\u0006\u0010\u0010\u001a\u00020\bH\u0002¢\u0006\u0004\b$\u0010&JE\u0010$\u001a\u00020\u00112\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0010\u001a\u00020\b2\b\b\u0002\u0010'\u001a\u00020\b2\u0012\u0010)\u001a\n\u0012\u0006\b\u0001\u0012\u00020\u00040(\"\u00020\u0004H\u0002¢\u0006\u0004\b$\u0010*R2\u00100\u001a\u0014\u0012\u0004\u0012\u00020\u0004\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00060#0+8\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b$\u0010,\u0012\u0004\b/\u0010\u0003\u001a\u0004\b-\u0010.R\u001d\u00105\u001a\b\u0012\u0004\u0012\u00020\u00040#8\u0006¢\u0006\f\n\u0004\b1\u00102\u001a\u0004\b3\u00104R\u0016\u00109\u001a\u0002068\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b7\u00108R \u0010;\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00170+8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b:\u0010,¨\u0006<"}, d2 = {"Lsprig/b/b;", "", "<init>", "()V", "Lcom/userleap/EventName;", "event", "Lcom/userleap/EventListener;", "listener", "", "addListener", "(Lcom/userleap/EventName;Lcom/userleap/EventListener;)I", "removeListener", "", "message", "Lcom/userleap/SprigLoggingLevel;", "level", "indented", "Lc1e;", "sendLoggingEvent", "(Ljava/lang/String;Lcom/userleap/SprigLoggingLevel;I)V", "sendVerboseLoggingEvent", "sendEngineeringLoggingEvent", "functionName", "", "fromSdk", "sendWebSDKLoggingEvent", "(Ljava/lang/String;Ljava/lang/String;Lcom/userleap/SprigLoggingLevel;Z)V", "sendMobileSDKLoggingEvent", "eventName", "Lorg/json/JSONObject;", "data", "onEvent", "(Lcom/userleap/EventName;Lorg/json/JSONObject;)V", "Lcom/userleap/SprigEvent;", "(Lcom/userleap/SprigEvent;)V", "", "a", "(Lcom/userleap/EventName;)Ljava/util/Set;", "(I)Ljava/lang/String;", "granularity", "", "eventTypes", "(Ljava/lang/String;Lcom/userleap/SprigLoggingLevel;II[Lcom/userleap/EventName;)V", "", "Ljava/util/Map;", "getListeners", "()Ljava/util/Map;", "getListeners$annotations", "listeners", "b", "Ljava/util/Set;", "getRegisteredEvents", "()Ljava/util/Set;", "registeredEvents", "Lsprig/j/e;", "c", "Lsprig/j/e;", "logger", "d", "oneTimeEventsFired", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class b {
    public static final b INSTANCE = new b();

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public static final Map listeners;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    public static final Set registeredEvents;

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    public static sprig.j.e logger;

    /* JADX INFO: renamed from: d, reason: from kotlin metadata */
    public static final Map oneTimeEventsFired;

    static {
        ConcurrentHashMap concurrentHashMap = new ConcurrentHashMap();
        listeners = concurrentHashMap;
        registeredEvents = concurrentHashMap.keySet();
        logger = new sprig.j.e();
        ConcurrentHashMap concurrentHashMap2 = new ConcurrentHashMap();
        concurrentHashMap2.put(EventName.SDK_READY, Boolean.FALSE);
        oneTimeEventsFired = concurrentHashMap2;
    }

    private b() {
    }

    public static /* synthetic */ void sendEngineeringLoggingEvent$default(b bVar, String str, SprigLoggingLevel sprigLoggingLevel, int i, int i2, Object obj) {
        if ((i2 & 2) != 0) {
            sprigLoggingLevel = SprigLoggingLevel.INFO;
        }
        if ((i2 & 4) != 0) {
            i = 0;
        }
        bVar.sendEngineeringLoggingEvent(str, sprigLoggingLevel, i);
    }

    public static /* synthetic */ void sendLogEvents$default(b bVar, String str, SprigLoggingLevel sprigLoggingLevel, int i, int i2, EventName[] eventNameArr, int i3, Object obj) {
        if ((i3 & 8) != 0) {
            i2 = 1;
        }
        bVar.a(str, sprigLoggingLevel, i, i2, eventNameArr);
    }

    public static /* synthetic */ void sendLoggingEvent$default(b bVar, String str, SprigLoggingLevel sprigLoggingLevel, int i, int i2, Object obj) {
        if ((i2 & 2) != 0) {
            sprigLoggingLevel = SprigLoggingLevel.INFO;
        }
        if ((i2 & 4) != 0) {
            i = 0;
        }
        bVar.sendLoggingEvent(str, sprigLoggingLevel, i);
    }

    public static /* synthetic */ void sendMobileSDKLoggingEvent$default(b bVar, String str, String str2, SprigLoggingLevel sprigLoggingLevel, boolean z, int i, Object obj) {
        if ((i & 1) != 0) {
            str = null;
        }
        if ((i & 2) != 0) {
            str2 = null;
        }
        if ((i & 4) != 0) {
            sprigLoggingLevel = SprigLoggingLevel.INFO;
        }
        if ((i & 8) != 0) {
            z = false;
        }
        bVar.sendMobileSDKLoggingEvent(str, str2, sprigLoggingLevel, z);
    }

    public static /* synthetic */ void sendVerboseLoggingEvent$default(b bVar, String str, SprigLoggingLevel sprigLoggingLevel, int i, int i2, Object obj) {
        if ((i2 & 2) != 0) {
            sprigLoggingLevel = SprigLoggingLevel.INFO;
        }
        if ((i2 & 4) != 0) {
            i = 0;
        }
        bVar.sendVerboseLoggingEvent(str, sprigLoggingLevel, i);
    }

    public static /* synthetic */ void sendWebSDKLoggingEvent$default(b bVar, String str, String str2, SprigLoggingLevel sprigLoggingLevel, boolean z, int i, Object obj) {
        if ((i & 1) != 0) {
            str = null;
        }
        if ((i & 2) != 0) {
            str2 = null;
        }
        if ((i & 4) != 0) {
            sprigLoggingLevel = SprigLoggingLevel.INFO;
        }
        if ((i & 8) != 0) {
            z = true;
        }
        bVar.sendWebSDKLoggingEvent(str, str2, sprigLoggingLevel, z);
    }

    public final void a(String message, SprigLoggingLevel level, int indented, int granularity, EventName... eventTypes) {
        String str = granularity == 2 ? "+ Sprig:" : "  Sprig:";
        if (granularity == 3) {
            str = "* Sprig:";
        }
        JSONObject jSONObject = new JSONObject(ei7.Q(new f09("log.message", lv8.r(str, " ", a(indented), message)), new f09("log.level", level.getValue())));
        for (EventName eventName : eventTypes) {
            INSTANCE.onEvent(eventName, jSONObject);
        }
    }

    public final int addListener(EventName event, EventListener listener) {
        event.getClass();
        listener.getClass();
        Set setA = a(event);
        setA.add(listener);
        return setA.size();
    }

    public final Map<EventName, Set<EventListener>> getListeners() {
        return listeners;
    }

    public final Set<EventName> getRegisteredEvents() {
        return registeredEvents;
    }

    public final void onEvent(SprigEvent event) {
        event.getClass();
        Map map = oneTimeEventsFired;
        Boolean bool = (Boolean) map.get(event.getName());
        if (bool != null) {
            if (bool.booleanValue()) {
                return;
            } else {
                map.put(event.getName(), Boolean.TRUE);
            }
        }
        sprig.j.e.logBreadCrumb$default(logger, event.toString(), null, 2, null);
        Set set = (Set) listeners.get(event.getName());
        if (set == null) {
            return;
        }
        Iterator it2 = set.iterator();
        while (it2.hasNext()) {
            try {
                ((EventListener) it2.next()).onEvent(event);
            } catch (Throwable th) {
                sendLoggingEvent$default(this, "Event listener crashed. " + th, SprigLoggingLevel.ERROR, 0, 4, null);
            }
        }
        if (event.getName().isLoggingEventType()) {
            return;
        }
        sendMobileSDKLoggingEvent$default(this, String.valueOf(event), String.valueOf(event.getName()), null, true, 4, null);
    }

    public final int removeListener(EventName event, EventListener listener) {
        event.getClass();
        listener.getClass();
        Set set = (Set) listeners.get(event);
        if (set == null) {
            return 0;
        }
        set.remove(listener);
        return set.size();
    }

    public final void sendEngineeringLoggingEvent(String message, SprigLoggingLevel level, int indented) {
        message.getClass();
        level.getClass();
        a(message, level, indented, 3, EventName.LOGGING_EVENT);
    }

    public final void sendLoggingEvent(String message, SprigLoggingLevel level, int indented) {
        message.getClass();
        level.getClass();
        a(message, level, indented, 1, EventName.LOGGING_EVENT);
    }

    public final void sendMobileSDKLoggingEvent(String message, String functionName, SprigLoggingLevel level, boolean fromSdk) {
        level.getClass();
        if (message == null) {
            message = "";
        }
        String str = fromSdk ? "====>" : "<----";
        sendLoggingEvent$default(this, lv8.r("[SDK]", functionName != null ? lv8.r("[", functionName, "] ", str) : " ".concat(str), " ", message), level, 0, 4, null);
    }

    public final void sendVerboseLoggingEvent(String message, SprigLoggingLevel level, int indented) {
        message.getClass();
        level.getClass();
        a(message, level, indented, 2, EventName.LOGGING_EVENT);
    }

    public final void sendWebSDKLoggingEvent(String message, String functionName, SprigLoggingLevel level, boolean fromSdk) {
        level.getClass();
        if (message == null) {
            message = "";
        }
        String str = fromSdk ? "====>" : "<----";
        sendVerboseLoggingEvent$default(this, lv8.r("[WebSDK]", functionName != null ? lv8.r("[", functionName, "] ", str) : " ".concat(str), " ", message), level, 0, 4, null);
    }

    public static /* synthetic */ void getListeners$annotations() {
    }

    public final String a(int indented) {
        if (indented <= 0) {
            return "";
        }
        return indented == 1 ? "↪︎ " : km4.y(tuc.J((indented - 1) * 3, " "), "↪︎ ");
    }

    public final Set a(EventName event) {
        Map map = listeners;
        Object copyOnWriteArraySet = map.get(event);
        if (copyOnWriteArraySet == null) {
            copyOnWriteArraySet = new CopyOnWriteArraySet();
            map.put(event, copyOnWriteArraySet);
        }
        return (Set) copyOnWriteArraySet;
    }

    public final void onEvent(EventName eventName, JSONObject data) {
        eventName.getClass();
        onEvent(new SprigEvent(eventName, data));
    }
}
