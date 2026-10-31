package ay;

import android.content.Context;
import android.view.View;
import android.widget.PopupMenu;

/* loaded from: classes4.dex */
public final class n implements View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Context f15761a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ r f15762b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ s f15763c;

    public n(s sVar, Context context, r rVar) {
        this.f15763c = sVar;
        this.f15761a = context;
        this.f15762b = rVar;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        PopupMenu popupMenu = new PopupMenu(this.f15761a, view);
        popupMenu.inflate(2131755009);
        popupMenu.setOnMenuItemClickListener(new m(this));
        popupMenu.show();
    }
}
