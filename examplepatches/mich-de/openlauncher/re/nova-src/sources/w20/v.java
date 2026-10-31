package w20;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.IntentFilter;

/* loaded from: classes.dex */
public abstract class v extends BroadcastReceiver {

    /* renamed from: a, reason: collision with root package name */
    public final IntentFilter f93724a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f93725b = false;

    /* renamed from: c, reason: collision with root package name */
    public final int f93726c;

    public v(String... strArr) {
        IntentFilter intentFilter = new IntentFilter();
        for (String str : strArr) {
            intentFilter.addAction(str);
        }
        this.f93724a = intentFilter;
        this.f93726c = 2;
    }

    public final void a(Context context) {
        context.registerReceiver(this, this.f93724a, null, null, this.f93726c);
        this.f93725b = true;
    }
}
