package q9;

import android.animation.ObjectAnimator;
import android.content.res.Resources;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.widget.TextView;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.h0;
import androidx.recyclerview.widget.h2;
import androidx.recyclerview.widget.o2;
import androidx.recyclerview.widget.s2;
import androidx.recyclerview.widget.z1;
import b.c0;
import b5.f;
import b5.g;
import b5.i;
import com.android.launcher3.BubbleTextView;
import com.android.launcher3.allapps.AllAppsGridAdapter$AppsGridLayoutManager;
import com.android.launcher3.folder.FolderIcon;
import e10.d0;
import e10.y2;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.function.Predicate;
import mx.j0;
import o9.n1;
import o9.z0;
import q9.j;
import q9.m;
import zg.a;

/* loaded from: classes.dex */
public final class m extends kz.b {

    /* renamed from: a, reason: collision with root package name */
    public final u[] f83848a;

    /* renamed from: b, reason: collision with root package name */
    public final o9.l f83849b;

    /* renamed from: c, reason: collision with root package name */
    public final LayoutInflater f83850c;

    /* renamed from: d, reason: collision with root package name */
    public final s f83851d;

    /* renamed from: e, reason: collision with root package name */
    public final AllAppsGridAdapter$AppsGridLayoutManager f83852e;

    /* renamed from: f, reason: collision with root package name */
    public final k f83853f;

    /* renamed from: g, reason: collision with root package name */
    public final View.OnClickListener f83854g;

    /* renamed from: h, reason: collision with root package name */
    public View.OnLongClickListener f83855h = ua.g.f90764d;

    /* renamed from: i, reason: collision with root package name */
    public int f83856i;

    /* renamed from: j, reason: collision with root package name */
    public ca.a f83857j;

    /* renamed from: k, reason: collision with root package name */
    public final String f83858k;

    /* renamed from: l, reason: collision with root package name */
    public int f83859l;

    /* JADX WARN: Type inference failed for: r0v2, types: [androidx.recyclerview.widget.GridLayoutManager, com.android.launcher3.allapps.AllAppsGridAdapter$AppsGridLayoutManager] */
    public m(o9.l lVar, LayoutInflater layoutInflater, s sVar, u[] uVarArr) throws Resources.NotFoundException {
        Resources resources = lVar.getResources();
        this.f83849b = lVar;
        this.f83851d = sVar;
        this.f83858k = resources.getString(2132017446);
        k kVar = new k(this);
        this.f83853f = kVar;
        ?? r02 = new GridLayoutManager() { // from class: com.android.launcher3.allapps.AllAppsGridAdapter$AppsGridLayoutManager
            {
                super(1);
            }

            public final int L(int i5) {
                ArrayList arrayList = this.f21043i.f83851d.f83886f;
                int iMax = Math.max(i5, arrayList.size() - 1);
                int i11 = 0;
                for (int i12 = 0; i12 <= iMax; i12++) {
                    if (!m.g(((j) arrayList.get(i12)).f83842b, 65538)) {
                        i11++;
                    }
                }
                return i11;
            }

            @Override // androidx.recyclerview.widget.GridLayoutManager, androidx.recyclerview.widget.z1
            public final int getRowCountForAccessibility(h2 h2Var, o2 o2Var) {
                return super.getRowCountForAccessibility(h2Var, o2Var) - L(this.f21043i.f83851d.f83886f.size() - 1);
            }

            @Override // androidx.recyclerview.widget.LinearLayoutManager, androidx.recyclerview.widget.z1
            public final void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
                super.onInitializeAccessibilityEvent(accessibilityEvent);
                i iVarQ = a.q(accessibilityEvent);
                iVarQ.d(this.f21043i.f83851d.f83885e);
                iVarQ.c(Math.max(0, iVarQ.a() - L(iVarQ.a())));
                iVarQ.e(Math.max(0, iVarQ.b() - L(iVarQ.b())));
            }

            @Override // androidx.recyclerview.widget.GridLayoutManager, androidx.recyclerview.widget.z1
            public final void onInitializeAccessibilityNodeInfoForItem(h2 h2Var, o2 o2Var, View view, g gVar) {
                super.onInitializeAccessibilityNodeInfoForItem(h2Var, o2Var, view, gVar);
                ViewGroup.LayoutParams layoutParams = view.getLayoutParams();
                f fVarJ = gVar.j();
                if (!(layoutParams instanceof h0) || fVarJ == null) {
                    return;
                }
                gVar.B(f.k(fVarJ.g(), fVarJ.h(), fVarJ.e() - L(((h0) layoutParams).f14880a.getBindingAdapterPosition()), fVarJ.f(), fVarJ.c(), fVarJ.d()));
            }
        };
        this.f83852e = r02;
        r02.f14833g = kVar;
        this.f83850c = layoutInflater;
        this.f83854g = lVar.Q();
        this.f83848a = uVarArr;
        h(y2.f51877a.W().l() == d0.f51460c ? 1 : ((z0) z0.f80267w.h(lVar)).a(lVar).d());
        lVar.getResources().getDimensionPixelSize(2131165283);
    }

    public static boolean g(int i5, int i11) {
        return (i5 & i11) != 0;
    }

    @Override // kz.b
    public final z1 b() {
        return this.f83852e;
    }

    @Override // kz.b
    public final void c(j0 j0Var) {
        h(y2.f51877a.W().l() == d0.f51460c ? 1 : j0Var.d());
    }

    @Override // kz.b
    public final void d(ca.a aVar) {
        this.f83857j = aVar;
    }

    @Override // kz.b
    public final void e(e10.k kVar) {
        this.f83855h = kVar;
    }

    public final u f(final int i5) {
        return (u) Arrays.stream(this.f83848a).filter(new Predicate() { // from class: q9.i
            @Override // java.util.function.Predicate
            public final boolean test(Object obj) {
                return ((u) obj).b(i5);
            }
        }).findFirst().orElse(null);
    }

    @Override // androidx.recyclerview.widget.m1
    public final int getItemCount() {
        return this.f83851d.f83886f.size();
    }

    @Override // androidx.recyclerview.widget.m1
    public final int getItemViewType(int i5) {
        return ((j) this.f83851d.f83886f.get(i5)).f83842b;
    }

    public final void h(int i5) {
        o9.l lVar = this.f83849b;
        if (i5 == 1) {
            this.f83859l = w20.e.k(16) + lVar.f79934x.E0.f77071d;
        } else {
            this.f83859l = lVar.f79934x.f77138d0;
        }
        this.f83856i = i5;
        for (u uVar : this.f83848a) {
            uVar.getClass();
        }
        J(i5);
        this.f83853f.d();
    }

    @Override // androidx.recyclerview.widget.m1
    public final void onBindViewHolder(s2 s2Var, int i5) {
        l lVar = (l) s2Var;
        int itemViewType = lVar.getItemViewType();
        o9.l lVar2 = this.f83849b;
        s sVar = this.f83851d;
        if (itemViewType == 2) {
            j jVar = (j) sVar.f83886f.get(i5);
            BubbleTextView bubbleTextView = (BubbleTextView) lVar.itemView;
            bubbleTextView.f20877p = null;
            mz.e eVar = bubbleTextView.f20879r;
            eVar.f77307a = 0;
            ObjectAnimator objectAnimator = bubbleTextView.f20880s;
            if (objectAnimator != null) {
                objectAnimator.cancel();
            }
            eVar.f77309c = 0.0f;
            bubbleTextView.f20881t = false;
            bubbleTextView.setBackground(null);
            bubbleTextView.getLayoutParams().height = this.f83859l;
            bubbleTextView.r(lVar2.f79934x.E0);
            ga.a aVar = jVar.f83845e;
            if (aVar != null) {
                bubbleTextView.v(aVar);
                return;
            }
            bubbleTextView.y(aVar);
            bubbleTextView.setTag(aVar);
            bubbleTextView.U();
            bubbleTextView.M(aVar, aVar.f0());
            return;
        }
        if (itemViewType == 4) {
            TextView textView = (TextView) lVar.itemView;
            textView.setText(this.f83858k);
            sVar.getClass();
            textView.setGravity(8388627);
            return;
        }
        if (itemViewType == 8) {
            ((TextView) lVar.itemView).setVisibility(8);
            return;
        }
        if (itemViewType != 16) {
            if (itemViewType != 65536) {
                u uVarF = f(lVar.getItemViewType());
                if (uVarF != null) {
                    uVarF.c(lVar, i5);
                    return;
                }
                return;
            }
            iz.a aVar2 = (iz.a) ((j) sVar.f83886f.get(i5)).f83845e;
            FolderIcon folderIcon = (FolderIcon) lVar.itemView;
            folderIcon.getLayoutParams().height = this.f83859l;
            folderIcon.r(lVar2.f79934x.E0);
            folderIcon.X(aVar2);
        }
    }

    @Override // androidx.recyclerview.widget.m1
    public final s2 onCreateViewHolder(ViewGroup viewGroup, int i5) {
        o9.l lVar = this.f83849b;
        LayoutInflater layoutInflater = this.f83850c;
        if (i5 == 2) {
            BubbleTextView bubbleTextView = (BubbleTextView) layoutInflater.inflate(this.f83856i == 1 ? 2131624036 : 2131624035, viewGroup, false);
            bubbleTextView.f20872i.f79746d = 1.0f;
            bubbleTextView.setOnFocusChangeListener(this.f83857j);
            bubbleTextView.setOnClickListener(this.f83854g);
            bubbleTextView.setOnLongClickListener(this.f83855h);
            bubbleTextView.getLayoutParams().height = this.f83859l;
            bubbleTextView.r(lVar.f79934x.E0);
            int iF = v4.a.f(((int) bubbleTextView.getPaint().measureText(" ")) / 2, w20.e.k(1), w20.e.k(8));
            bubbleTextView.setPadding(iF, 0, iF, 0);
            return new l(bubbleTextView);
        }
        if (i5 == 4) {
            return new l(layoutInflater.inflate(2131624031, viewGroup, false));
        }
        if (i5 == 8) {
            View viewInflate = layoutInflater.inflate(2131624041, viewGroup, false);
            viewInflate.setOnClickListener(new l10.f(this, 2));
            return new l(viewInflate);
        }
        if (i5 == 16) {
            return new l(layoutInflater.inflate(2131624030, viewGroup, false));
        }
        if (i5 != 65536) {
            u uVarF = f(i5);
            if (uVarF != null) {
                return uVarF.d(i5, layoutInflater, viewGroup);
            }
            throw new RuntimeException(c0.h(i5, "Unexpected view type"));
        }
        FolderIcon folderIconC0 = FolderIcon.c0(this.f83856i == 1 ? 2131624034 : 2131624033, (n1) lVar, viewGroup, null);
        folderIconC0.getLayoutParams().height = this.f83859l;
        folderIconC0.setOnLongClickListener(this.f83855h);
        folderIconC0.setOnFocusChangeListener(this.f83857j);
        folderIconC0.r(lVar.f79934x.E0);
        int iF2 = v4.a.f(((int) folderIconC0.getPaint().measureText(" ")) / 2, w20.e.k(1), w20.e.k(8));
        folderIconC0.setPadding(iF2, 0, iF2, 0);
        return new l(folderIconC0);
    }

    @Override // androidx.recyclerview.widget.m1
    public final /* bridge */ /* synthetic */ boolean onFailedToRecycleView(s2 s2Var) {
        return true;
    }

    @Override // androidx.recyclerview.widget.m1
    public final void onViewRecycled(s2 s2Var) {
        l lVar = (l) s2Var;
        super.onViewRecycled(lVar);
        View view = lVar.itemView;
        if (view instanceof BubbleTextView) {
            BubbleTextView bubbleTextView = (BubbleTextView) view;
            bubbleTextView.setOnClickListener(this.f83854g);
            bubbleTextView.setOnLongClickListener(this.f83855h);
            ((BubbleTextView) lVar.itemView).P(1.0f);
            ((BubbleTextView) lVar.itemView).setTranslationX(0.0f);
            lVar.itemView.setActivated(false);
            lVar.itemView.setScaleX(1.0f);
            lVar.itemView.setScaleY(1.0f);
            lVar.itemView.setStateListAnimator(null);
            View view2 = lVar.itemView;
            if (view2 instanceof FolderIcon) {
                FolderIcon folderIcon = (FolderIcon) view2;
                ga.c cVar = folderIcon.I;
                if (cVar != null) {
                    if (!(cVar instanceof iz.a)) {
                        throw new IllegalStateException();
                    }
                    cVar.a1(folderIcon);
                    folderIcon.I = null;
                }
                nz.d dVar = ((FolderIcon) lVar.itemView).O;
                ObjectAnimator objectAnimator = dVar.n;
                if (objectAnimator != null) {
                    objectAnimator.cancel();
                    dVar.f96878k = 0.0f;
                    dVar.f96876i.clear();
                    dVar.f96879l = false;
                }
                dVar.n = null;
            }
        }
    }
}
