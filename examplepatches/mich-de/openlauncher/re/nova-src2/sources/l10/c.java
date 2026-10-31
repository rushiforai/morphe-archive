package l10;

import android.content.Context;
import android.content.Intent;
import android.view.KeyEvent;
import com.teslacoilsw.launcher.ActivitiesShortcutActivity;

/* loaded from: classes4.dex */
public final class c extends w20.v {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f74404d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ KeyEvent.Callback f74405e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ c(KeyEvent.Callback callback, String[] strArr, int i5) {
        super(strArr);
        this.f74404d = i5;
        this.f74405e = callback;
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        switch (this.f74404d) {
            case 0:
                ((d) this.f74405e).c();
                break;
            default:
                ((ActivitiesShortcutActivity) this.f74405e).finish();
                break;
        }
    }
}
