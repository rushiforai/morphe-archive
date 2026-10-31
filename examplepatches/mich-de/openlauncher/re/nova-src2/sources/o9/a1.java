package o9;

import android.view.KeyboardShortcutInfo;
import android.view.View;
import com.android.launcher3.CellLayout;
import java.util.ArrayList;
import java.util.function.Consumer;

/* loaded from: classes2.dex */
public final /* synthetic */ class a1 implements Consumer {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f79755a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ArrayList f79756b;

    public /* synthetic */ a1(ArrayList arrayList, int i5) {
        this.f79755a = i5;
        this.f79756b = arrayList;
    }

    @Override // java.util.function.Consumer
    public final void accept(Object obj) {
        switch (this.f79755a) {
            case 0:
                p9.d dVar = (p9.d) obj;
                this.f79756b.add(new KeyboardShortcutInfo(dVar.f82469b.getLabel(), dVar.f82468a, androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT));
                break;
            case 1:
                this.f79756b.add(((CellLayout) ((View) obj)).P);
                break;
            case 2:
                this.f79756b.add(((CellLayout) ((View) obj)).P);
                break;
            default:
                this.f79756b.add((ga.a) obj);
                break;
        }
    }
}
