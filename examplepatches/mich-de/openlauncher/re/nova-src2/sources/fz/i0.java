package fz;

import android.content.Context;
import android.content.Intent;
import android.os.SystemClock;
import com.teslacoilsw.launcher.NovaLauncher;
import o9.d4;

/* loaded from: classes.dex */
public final class i0 extends w20.v {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f56261d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f56262e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ i0(Object obj, String[] strArr, int i5) {
        super(strArr);
        this.f56261d = i5;
        this.f56262e = obj;
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        switch (this.f56261d) {
            case 0:
                ((j0) this.f56262e).a();
                break;
            case 1:
                String stringExtra = intent.getStringExtra("reason");
                if (stringExtra == null) {
                    stringExtra = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                if ("homekey".equals(stringExtra) || "recentapps".equals(stringExtra)) {
                    ((NovaLauncher) this.f56262e).f45665p1 = SystemClock.uptimeMillis();
                    break;
                }
                break;
            default:
                ya.j.f97146a.execute(new d4(this, 0));
                break;
        }
    }
}
