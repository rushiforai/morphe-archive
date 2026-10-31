package q;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.WindowManager;
import android.widget.AdapterView;
import androidx.appcompat.view.menu.ExpandedMenuView;
import com.bytedance.sdk.openadsdk.api.reward.BackupConstant;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;

/* loaded from: classes2.dex */
public final class g implements w, AdapterView.OnItemClickListener {

    /* renamed from: a, reason: collision with root package name */
    public Context f83219a;

    /* renamed from: b, reason: collision with root package name */
    public LayoutInflater f83220b;

    /* renamed from: c, reason: collision with root package name */
    public k f83221c;

    /* renamed from: d, reason: collision with root package name */
    public ExpandedMenuView f83222d;

    /* renamed from: e, reason: collision with root package name */
    public v f83223e;

    /* renamed from: f, reason: collision with root package name */
    public f f83224f;

    public g(Context context) {
        this.f83219a = context;
        this.f83220b = LayoutInflater.from(context);
    }

    @Override // q.w
    public final boolean a(c0 c0Var) {
        boolean zHasVisibleItems = c0Var.hasVisibleItems();
        Context context = c0Var.f83232a;
        if (!zHasVisibleItems) {
            return false;
        }
        l lVar = new l();
        lVar.f83254a = c0Var;
        m.j jVar = new m.j(context);
        g gVar = new g(jVar.getContext());
        lVar.f83256c = gVar;
        gVar.f83223e = lVar;
        c0Var.b(gVar, context);
        g gVar2 = lVar.f83256c;
        if (gVar2.f83224f == null) {
            gVar2.f83224f = new f(gVar2);
        }
        f fVar = gVar2.f83224f;
        m.g gVar3 = jVar.f75297a;
        gVar3.o = fVar;
        gVar3.f75257p = lVar;
        View view = c0Var.o;
        if (view != null) {
            gVar3.f75248e = view;
        } else {
            gVar3.f75246c = c0Var.n;
            jVar.setTitle(c0Var.f83244m);
        }
        gVar3.f75256m = lVar;
        m.k kVarCreate = jVar.create();
        lVar.f83255b = kVarCreate;
        kVarCreate.setOnDismissListener(lVar);
        WindowManager.LayoutParams attributes = lVar.f83255b.getWindow().getAttributes();
        attributes.type = BackupConstant.SCENE_CLOSED_WITHOUT_SHOW;
        attributes.flags |= SQLiteDatabase.OPEN_SHAREDCACHE;
        lVar.f83255b.show();
        v vVar = this.f83223e;
        if (vVar == null) {
            return true;
        }
        vVar.m(c0Var);
        return true;
    }

    @Override // q.w
    public final void b(k kVar, boolean z11) {
        v vVar = this.f83223e;
        if (vVar != null) {
            vVar.b(kVar, z11);
        }
    }

    @Override // q.w
    public final void c() {
        f fVar = this.f83224f;
        if (fVar != null) {
            fVar.notifyDataSetChanged();
        }
    }

    @Override // q.w
    public final boolean d(m mVar) {
        return false;
    }

    @Override // q.w
    public final void e(Context context, k kVar) {
        if (this.f83219a != null) {
            this.f83219a = context;
            if (this.f83220b == null) {
                this.f83220b = LayoutInflater.from(context);
            }
        }
        this.f83221c = kVar;
        f fVar = this.f83224f;
        if (fVar != null) {
            fVar.notifyDataSetChanged();
        }
    }

    @Override // q.w
    public final boolean f(m mVar) {
        return false;
    }

    @Override // q.w
    public final boolean g() {
        return false;
    }

    @Override // q.w
    public final void h(v vVar) {
        throw null;
    }

    @Override // android.widget.AdapterView.OnItemClickListener
    public final void onItemClick(AdapterView adapterView, View view, int i5, long j11) {
        this.f83221c.q(this.f83224f.getItem(i5), this, 0);
    }
}
