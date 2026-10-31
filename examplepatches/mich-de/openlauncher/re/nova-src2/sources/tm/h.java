package tm;

import com.google.firebase.messaging.FirebaseMessaging;
import java.util.Random;
import t5.d0;

/* loaded from: classes3.dex */
public final /* synthetic */ class h implements nm.c {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f89477a;

    public /* synthetic */ h(int i5) {
        this.f89477a = i5;
    }

    @Override // nm.c
    public final Object get() {
        switch (this.f89477a) {
            case 0:
                d0 d0Var = FirebaseMessaging.f34752m;
                break;
            default:
                Random random = wm.g.f94612j;
                break;
        }
        return null;
    }
}
