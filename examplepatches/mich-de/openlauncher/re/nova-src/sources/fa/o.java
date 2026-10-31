package fa;

import android.content.Context;
import android.content.pm.LauncherApps;
import android.os.Parcelable;
import android.os.UserHandle;
import android.util.Log;
import com.android.launcher3.model.WidgetItem;
import java.util.ArrayList;
import java.util.Collections;
import java.util.function.Consumer;

/* loaded from: classes.dex */
public final /* synthetic */ class o implements Consumer {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54449a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f54450b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Parcelable f54451c;

    public /* synthetic */ o(Object obj, Parcelable parcelable, int i5) {
        this.f54449a = i5;
        this.f54450b = obj;
        this.f54451c = parcelable;
    }

    @Override // java.util.function.Consumer
    public final void accept(Object obj) {
        switch (this.f54449a) {
            case 0:
                Context context = (Context) this.f54450b;
                try {
                    ((LauncherApps) context.getSystemService(LauncherApps.class)).pinShortcuts((String) obj, Collections.EMPTY_LIST, (UserHandle) this.f54451c);
                    break;
                } catch (IllegalStateException | SecurityException e3) {
                    Log.w("BgDataModel", "Failed to unpin shortcut", e3);
                    return;
                }
            default:
                ArrayList arrayList = (ArrayList) this.f54450b;
                WidgetItem widgetItem = (WidgetItem) this.f54451c;
                Integer num = (Integer) obj;
                if (num.intValue() != -1) {
                    arrayList.add(new ya.g0(num.intValue(), widgetItem.f21252b));
                    break;
                } else {
                    arrayList.add(new ya.g0(widgetItem.f21251a.getPackageName(), widgetItem.f21252b));
                    break;
                }
        }
    }
}
