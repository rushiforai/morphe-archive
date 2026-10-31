package aa;

import android.animation.Animator;
import android.graphics.Bitmap;
import android.location.Location;
import android.text.TextUtils;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;
import com.android.launcher3.BubbleTextView;
import com.android.launcher3.CellLayout;
import com.android.launcher3.folder.FolderNameProvider;
import com.android.launcher3.folder.FolderPagedView;
import com.android.launcher3.keyboard.KeyboardDragAndDropView;
import com.android.launcher3.widget.WidgetCell;
import e00.u3;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.function.BiConsumer;
import java.util.function.Consumer;
import java.util.function.Predicate;
import o9.g3;
import o9.n1;

/* loaded from: classes2.dex */
public final /* synthetic */ class w implements Consumer {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f659a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f660b;

    public /* synthetic */ w(FolderNameProvider folderNameProvider, c00.d dVar) {
        this.f659a = 13;
        this.f660b = dVar;
    }

    @Override // java.util.function.Consumer
    public final void accept(Object obj) {
        int i5 = this.f659a;
        Object obj2 = this.f660b;
        switch (i5) {
            case 0:
                ((c0) obj2).n((ga.f) obj);
                break;
            case 1:
                int i11 = WidgetCell.f21319w;
                ((WidgetCell) obj2).b((Bitmap) obj);
                break;
            case 2:
                KeyboardDragAndDropView keyboardDragAndDropView = (KeyboardDragAndDropView) obj2;
                p9.a aVar = (p9.a) obj;
                ArrayList arrayList = keyboardDragAndDropView.f21159c;
                arrayList.clear();
                aVar.l(arrayList);
                arrayList.forEach(new ab.f0(2, keyboardDragAndDropView, aVar));
                break;
            case 3:
                n1 n1Var = (n1) obj2;
                int iN0 = n1Var.O.N0(((Integer) obj).intValue());
                if (iN0 != -100) {
                    n1Var.O.h1(iN0);
                    break;
                }
                break;
            case 4:
                ((AccessibilityNodeInfo) obj2).addAction(((p9.d) obj).f82469b);
                break;
            case 5:
                q9.p pVar = (q9.p) obj2;
                pVar.getClass();
                pVar.e(new ab.f0(10, pVar, (Predicate) obj));
                break;
            case 6:
                ga.a aVar2 = (ga.a) obj2;
                BubbleTextView bubbleTextView = (BubbleTextView) obj;
                if (bubbleTextView.getTag() == aVar2) {
                    if ((aVar2.f57305s & 3072) == 0) {
                        bubbleTextView.v(aVar2);
                        break;
                    } else {
                        bubbleTextView.A();
                        break;
                    }
                }
                break;
            case 7:
                BiConsumer biConsumer = (BiConsumer) obj2;
                Animator animator = (Animator) obj;
                List listeners = animator.getListeners();
                if (listeners == null) {
                    listeners = Collections.EMPTY_LIST;
                }
                Iterator it = listeners.iterator();
                while (it.hasNext()) {
                    biConsumer.accept((Animator.AnimatorListener) it.next(), animator);
                }
                break;
            case 8:
                ((k30.z) obj2).accept((Location) obj);
                break;
            case 9:
                x7.u uVar = (x7.u) obj2;
                MotionEvent motionEvent = (MotionEvent) obj;
                if (((VelocityTracker) uVar.f95210c) == null) {
                    uVar.f95210c = VelocityTracker.obtain();
                }
                ((VelocityTracker) uVar.f95210c).addMovement(motionEvent);
                break;
            case 10:
                FolderPagedView folderPagedView = (FolderPagedView) obj2;
                View view = (View) obj;
                for (int childCount = folderPagedView.getChildCount() - 1; childCount >= 0; childCount--) {
                    ((CellLayout) folderPagedView.getChildAt(childCount)).removeView(view);
                }
                break;
            case 11:
                ((iz.a) obj2).f1((ga.j) obj);
                break;
            case 12:
                w9.b bVar = (w9.b) obj2;
                w9.a aVar3 = (w9.a) obj;
                if (aVar3 == null) {
                    bVar.getClass();
                    break;
                } else {
                    int size = bVar.f94118c - aVar3.f94116a.size();
                    bVar.f94118c = size;
                    bVar.f94118c = g3.c(size, 0, androidx.room.o.MAX_BIND_PARAMETER_CNT);
                    bVar.f94119d.remove(aVar3);
                    break;
                }
            default:
                c00.d dVar = (c00.d) obj2;
                String string = ((ga.a) obj).f57300l.toString();
                CharSequence[] charSequenceArr = (CharSequence[]) dVar.f19045c;
                if (!Arrays.stream(charSequenceArr).filter(new z(11)).anyMatch(new u3(string, 13))) {
                    dVar.f19044b |= 6;
                    Float[] fArr = (Float[]) dVar.f19046d;
                    for (int length = charSequenceArr.length - 1; length > 0; length--) {
                        int i12 = length - 1;
                        CharSequence charSequence = charSequenceArr[i12];
                        if (charSequence != null && !TextUtils.isEmpty(charSequence)) {
                            dVar.w(length, charSequenceArr[i12], fArr[i12]);
                        }
                    }
                    dVar.w(0, string, Float.valueOf(1.0f));
                    break;
                }
                break;
        }
    }

    public /* synthetic */ w(Object obj, int i5) {
        this.f659a = i5;
        this.f660b = obj;
    }
}
