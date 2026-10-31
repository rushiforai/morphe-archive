package g30;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import java.util.Iterator;
import o9.g3;

/* loaded from: classes4.dex */
public final class g extends BroadcastReceiver {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f57035a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ h f57036b;

    public /* synthetic */ g(h hVar, int i5) {
        this.f57035a = i5;
        this.f57036b = hVar;
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        switch (this.f57035a) {
            case 0:
                this.f57036b.h();
                break;
            default:
                String stringExtra = intent.getStringExtra("wallpaper_parsed_colors");
                h hVar = this.f57036b;
                g3.j(hVar.f57038d).edit().putString("wallpaper_parsed_colors", stringExtra).apply();
                hVar.f57039e = (c) h.g(stringExtra).second;
                Iterator it = hVar.f57037c.iterator();
                while (it.hasNext()) {
                    ((d) it.next()).a(hVar.f57039e, 1);
                }
                break;
        }
    }
}
