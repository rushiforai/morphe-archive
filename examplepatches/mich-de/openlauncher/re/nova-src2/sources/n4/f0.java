package n4;

import android.app.Notification;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcelable;
import java.util.ArrayList;
import java.util.Iterator;
import l1.a2;

/* loaded from: classes2.dex */
public final class f0 extends g0 {

    /* renamed from: e, reason: collision with root package name */
    public final ArrayList f77802e = new ArrayList();

    /* renamed from: f, reason: collision with root package name */
    public final ArrayList f77803f = new ArrayList();

    /* renamed from: g, reason: collision with root package name */
    public q0 f77804g;

    /* renamed from: h, reason: collision with root package name */
    public CharSequence f77805h;

    /* renamed from: i, reason: collision with root package name */
    public Boolean f77806i;

    /* JADX WARN: Removed duplicated region for block: B:42:0x0084  */
    /* JADX WARN: Removed duplicated region for block: B:4:0x0005  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x013d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static f0 e(Notification notification) {
        g0 f0Var;
        Bundle bundle = notification.extras;
        if (bundle == null) {
            f0Var = null;
        } else {
            String string = bundle.getString("androidx.core.app.extra.COMPAT_TEMPLATE");
            boolean z11 = false;
            if (string != null) {
                switch (string) {
                    case "androidx.core.app.NotificationCompat$DecoratedCustomViewStyle":
                        f0Var = new y();
                        break;
                    case "androidx.core.app.NotificationCompat$BigPictureStyle":
                        f0Var = new o();
                        break;
                    case "androidx.core.app.NotificationCompat$CallStyle":
                        f0Var = new w();
                        break;
                    case "androidx.core.app.NotificationCompat$InboxStyle":
                        f0Var = new p(1);
                        break;
                    case "androidx.core.app.NotificationCompat$BigTextStyle":
                        f0Var = new p(z11);
                        break;
                    case "androidx.core.app.NotificationCompat$MessagingStyle":
                        f0Var = new f0();
                        break;
                    default:
                        f0Var = null;
                        break;
                }
                if (f0Var == null) {
                    if (bundle.containsKey("android.selfDisplayName") || bundle.containsKey("android.messagingStyleUser")) {
                        f0Var = new f0();
                    } else if (bundle.containsKey("android.picture") || bundle.containsKey("android.pictureIcon")) {
                        f0Var = new o();
                    } else if (bundle.containsKey("android.bigText")) {
                        f0Var = new p(z11);
                    } else if (bundle.containsKey("android.textLines")) {
                        f0Var = new p(1);
                    } else if (bundle.containsKey("android.callType")) {
                        f0Var = new w();
                    } else {
                        String string2 = bundle.getString("android.template");
                        if (string2 != null) {
                            f0Var = string2.equals(Notification.BigPictureStyle.class.getName()) ? new o() : string2.equals(Notification.BigTextStyle.class.getName()) ? new p(z11) : string2.equals(Notification.InboxStyle.class.getName()) ? new p(1) : string2.equals(Notification.MessagingStyle.class.getName()) ? new f0() : string2.equals(Notification.DecoratedCustomViewStyle.class.getName()) ? new y() : null;
                        }
                    }
                }
                if (f0Var != null) {
                    try {
                        f0Var.d(bundle);
                    } catch (ClassCastException unused) {
                    }
                }
            }
        }
        if (f0Var instanceof f0) {
            return (f0) f0Var;
        }
        return null;
    }

    @Override // n4.g0
    public final void a(Bundle bundle) {
        super.a(bundle);
        bundle.putCharSequence("android.selfDisplayName", this.f77804g.f77848a);
        bundle.putBundle("android.messagingStyleUser", this.f77804g.b());
        bundle.putCharSequence("android.hiddenConversationTitle", this.f77805h);
        if (this.f77805h != null && this.f77806i.booleanValue()) {
            bundle.putCharSequence("android.conversationTitle", this.f77805h);
        }
        ArrayList arrayList = this.f77802e;
        if (!arrayList.isEmpty()) {
            bundle.putParcelableArray("android.messages", e0.a(arrayList));
        }
        ArrayList arrayList2 = this.f77803f;
        if (!arrayList2.isEmpty()) {
            bundle.putParcelableArray("android.messages.historic", e0.a(arrayList2));
        }
        Boolean bool = this.f77806i;
        if (bool != null) {
            bundle.putBoolean("android.isGroupConversation", bool.booleanValue());
        }
    }

    @Override // n4.g0
    public final void b(a2 a2Var) {
        Notification.MessagingStyle messagingStyleB;
        r rVar = this.f77807a;
        boolean zBooleanValue = false;
        if (rVar == null || rVar.f77854a.getApplicationInfo().targetSdkVersion >= 28 || this.f77806i != null) {
            Boolean bool = this.f77806i;
            if (bool != null) {
                zBooleanValue = bool.booleanValue();
            }
        } else if (this.f77805h != null) {
            zBooleanValue = true;
        }
        this.f77806i = Boolean.valueOf(zBooleanValue);
        if (Build.VERSION.SDK_INT >= 28) {
            q0 q0Var = this.f77804g;
            q0Var.getClass();
            messagingStyleB = b0.a(h0.d(q0Var));
        } else {
            messagingStyleB = z.b(this.f77804g.f77848a);
        }
        Iterator it = this.f77802e.iterator();
        while (it.hasNext()) {
            z.a(messagingStyleB, ((e0) it.next()).c());
        }
        Iterator it2 = this.f77803f.iterator();
        while (it2.hasNext()) {
            a0.a(messagingStyleB, ((e0) it2.next()).c());
        }
        if (this.f77806i.booleanValue() || Build.VERSION.SDK_INT >= 28) {
            z.c(messagingStyleB, this.f77805h);
        }
        if (Build.VERSION.SDK_INT >= 28) {
            b0.b(messagingStyleB, this.f77806i.booleanValue());
        }
        messagingStyleB.setBuilder((Notification.Builder) a2Var.f73008b);
    }

    @Override // n4.g0
    public final String c() {
        return "androidx.core.app.NotificationCompat$MessagingStyle";
    }

    @Override // n4.g0
    public final void d(Bundle bundle) {
        super.d(bundle);
        ArrayList arrayList = this.f77802e;
        arrayList.clear();
        if (bundle.containsKey("android.messagingStyleUser")) {
            this.f77804g = q0.a(bundle.getBundle("android.messagingStyleUser"));
        } else {
            String string = bundle.getString("android.selfDisplayName");
            q0 q0Var = new q0();
            q0Var.f77848a = string;
            q0Var.f77849b = null;
            q0Var.f77850c = null;
            q0Var.f77851d = null;
            q0Var.f77852e = false;
            q0Var.f77853f = false;
            this.f77804g = q0Var;
        }
        CharSequence charSequence = bundle.getCharSequence("android.conversationTitle");
        this.f77805h = charSequence;
        if (charSequence == null) {
            this.f77805h = bundle.getCharSequence("android.hiddenConversationTitle");
        }
        Parcelable[] parcelableArray = bundle.getParcelableArray("android.messages");
        if (parcelableArray != null) {
            arrayList.addAll(e0.b(parcelableArray));
        }
        Parcelable[] parcelableArray2 = bundle.getParcelableArray("android.messages.historic");
        if (parcelableArray2 != null) {
            this.f77803f.addAll(e0.b(parcelableArray2));
        }
        if (bundle.containsKey("android.isGroupConversation")) {
            this.f77806i = Boolean.valueOf(bundle.getBoolean("android.isGroupConversation"));
        }
    }
}
