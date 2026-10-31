package ka;

import com.android.launcher3.model.WidgetItem;
import com.android.launcher3.util.ComponentKey;
import java.util.HashMap;
import java.util.function.Consumer;

/* loaded from: classes2.dex */
public final /* synthetic */ class h implements Consumer {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f71280a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ HashMap f71281b;

    public /* synthetic */ h(HashMap map, int i5) {
        this.f71280a = i5;
        this.f71281b = map;
    }

    @Override // java.util.function.Consumer
    public final void accept(Object obj) {
        switch (this.f71280a) {
            case 0:
                WidgetItem widgetItem = (WidgetItem) obj;
                this.f71281b.put(new ComponentKey(widgetItem.f21251a, widgetItem.f21252b), widgetItem);
                break;
            default:
                ((db.d) ((db.c) obj)).f49122c.forEach(new h(this.f71281b, 0));
                break;
        }
    }
}
