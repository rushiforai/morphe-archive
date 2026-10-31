package com.facebook.ads.redexgen.X;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import com.facebook.ads.internal.context.Repairable;
import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicReference;

/* renamed from: com.facebook.ads.redexgen.X.Hi, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0958Hi extends C2095lA {
    public static String[] A06 = {"X2XwTp9cKPrsKt8nnsNrr4kzY8H6fo9U", "SYDx4pa2oLtOnCxt4l9slcAsJVX17", "Ktbncp6BUHUyG8VpVa87zDZ4pVgXb", "697llskWaiD0", "zjkPaZGeICZRQbBHOdPJm8zqRs5ofq42", "OjtN7hHvLZrci2lMJuqCcc7IsxYWRGMj", "Pfr7ktMWLkOUKtldLLax33ooDo", "AIe8uS1x9EYXvM4HhYe86uhhSayJeZWe"};
    public WeakReference<Activity> A00;
    public WeakHashMap<Repairable, Boolean> A01;
    public final C2093l8 A02;
    public final AtomicReference<InterfaceC2092l7> A03;
    public final AtomicReference<Object> A04;
    public final AtomicReference<InterfaceC1640df> A05;

    public C0958Hi(Activity activity, InterfaceC2097lC interfaceC2097lC, InterfaceC1640df interfaceC1640df) {
        super(activity.getApplicationContext(), interfaceC2097lC);
        this.A01 = new WeakHashMap<>();
        this.A05 = new AtomicReference<>();
        this.A03 = new AtomicReference<>();
        this.A02 = new C2093l8();
        this.A04 = new AtomicReference<>();
        this.A05.set(interfaceC1640df);
        this.A00 = new WeakReference<>(activity);
    }

    public C0958Hi(Context context, InterfaceC2097lC interfaceC2097lC, InterfaceC1640df interfaceC1640df) {
        super(context.getApplicationContext(), interfaceC2097lC);
        this.A01 = new WeakHashMap<>();
        this.A05 = new AtomicReference<>();
        this.A03 = new AtomicReference<>();
        this.A02 = new C2093l8();
        this.A04 = new AtomicReference<>();
        this.A05.set(interfaceC1640df);
        Activity activityA00 = A00(context);
        if (activityA00 != null) {
            this.A00 = new WeakReference<>(activityA00);
        } else {
            this.A00 = new WeakReference<>(null);
        }
    }

    public static Activity A00(Context context) {
        while (true) {
            boolean z11 = context instanceof ContextWrapper;
            if (A06[3].length() != 12) {
                throw new RuntimeException();
            }
            A06[6] = "yJQbBA22nGzLcakEAa6nG1va8g";
            if (z11) {
                if (context instanceof Activity) {
                    return (Activity) context;
                }
                if ((context instanceof C0958Hi) && ((C0958Hi) context).A0E() != null) {
                    return ((C0958Hi) context).A0E();
                }
                context = ((ContextWrapper) context).getBaseContext();
            } else {
                return null;
            }
        }
    }

    public final Activity A0E() {
        return this.A00.get();
    }

    public InterfaceC1640df A0F() {
        InterfaceC1640df funnel = this.A05.get();
        if (funnel == null) {
            return new C1097Mx();
        }
        return funnel;
    }

    public final InterfaceC2092l7 A0G() {
        return this.A03.get();
    }

    public final C2093l8 A0H() {
        return this.A02;
    }

    public final Object A0I() {
        return this.A04.get();
    }

    public final void A0J(Activity activity) {
        this.A00 = new WeakReference<>(activity);
    }

    public final void A0K(InterfaceC1640df interfaceC1640df) {
        this.A05.set(interfaceC1640df);
    }

    public final void A0L(C0958Hi c0958Hi) {
        c0958Hi.A01.putAll(this.A01);
        this.A01 = c0958Hi.A01;
    }

    public final void A0M(C0958Hi c0958Hi) {
        A0K(c0958Hi.A0F());
        A0D(c0958Hi.A0C());
        A0N(c0958Hi.A0G());
    }

    public final void A0N(InterfaceC2092l7 interfaceC2092l7) {
        this.A03.set(interfaceC2092l7);
    }

    public final void A0O(Repairable repairable) {
        this.A01.put(repairable, true);
    }

    public final void A0P(Object obj) {
        this.A04.set(obj);
    }

    public final void A0Q(Throwable th2) {
        for (Map.Entry<Repairable, Boolean> entry : this.A01.entrySet()) {
            if (A06[3].length() != 12) {
                throw new RuntimeException();
            }
            A06[7] = "uNK1zxgBt2FFcnYPdsvApaChXeSIkfOy";
            entry.getKey().repair(th2);
        }
    }
}
