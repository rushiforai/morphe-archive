package ba;

import aa.d0;
import android.view.View;
import com.android.launcher3.Workspace;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;

/* loaded from: classes2.dex */
public final /* synthetic */ class a implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f17730a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f17731b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f17732c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f17733d;

    public /* synthetic */ a(Object obj, int i5, int i11, int i12) {
        this.f17730a = i12;
        this.f17733d = obj;
        this.f17731b = i5;
        this.f17732c = i11;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i5 = this.f17730a;
        int i11 = this.f17732c;
        int i12 = this.f17731b;
        Object obj = this.f17733d;
        switch (i5) {
            case 0:
                ((d0) obj).E(i12, i11);
                break;
            default:
                Workspace workspace = (Workspace) obj;
                int i13 = Workspace.f20990m1;
                workspace.getClass();
                ArrayList arrayList = new ArrayList();
                for (int i14 = 0; i14 < workspace.getChildCount(); i14++) {
                    arrayList.add(workspace.getChildAt(i14));
                }
                Collections.swap(arrayList, i12, i11);
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    View view = (View) it.next();
                    view.bringToFront();
                    view.setTranslationX(0.0f);
                }
                workspace.f20992b1 = workspace.f20993c1;
                workspace.f20993c1 = -1;
                workspace.g0(i12);
                Arrays.fill(workspace.f80119u, 0);
                workspace.onLayout(true, workspace.getLeft(), workspace.getTop(), workspace.getRight(), workspace.getBottom());
                workspace.f20994d1 = true;
                break;
        }
    }
}
