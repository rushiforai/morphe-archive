package defpackage;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.widget.HeaderViewListAdapter;
import android.widget.ListAdapter;
import androidx.appcompat.view.menu.ListMenuItemView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fy7 extends ym3 {
    public final int m;
    public final int n;
    public rx7 o;
    public sx7 p;

    public fy7(Context context, boolean z) {
        super(context, z);
        if (1 == context.getResources().getConfiguration().getLayoutDirection()) {
            this.m = 21;
            this.n = 22;
        } else {
            this.m = 22;
            this.n = 21;
        }
    }

    @Override // defpackage.ym3, android.view.View
    public final boolean onHoverEvent(MotionEvent motionEvent) {
        ix7 ix7Var;
        int headersCount;
        int iPointToPosition;
        int i;
        if (this.o != null) {
            ListAdapter adapter = getAdapter();
            if (adapter instanceof HeaderViewListAdapter) {
                HeaderViewListAdapter headerViewListAdapter = (HeaderViewListAdapter) adapter;
                headersCount = headerViewListAdapter.getHeadersCount();
                ix7Var = (ix7) headerViewListAdapter.getWrappedAdapter();
            } else {
                ix7Var = (ix7) adapter;
                headersCount = 0;
            }
            sx7 sx7VarB = (motionEvent.getAction() == 10 || (iPointToPosition = pointToPosition((int) motionEvent.getX(), (int) motionEvent.getY())) == -1 || (i = iPointToPosition - headersCount) < 0 || i >= ix7Var.getCount()) ? null : ix7Var.getItem(i);
            sx7 sx7Var = this.p;
            if (sx7Var != sx7VarB) {
                lx7 lx7Var = ix7Var.a;
                if (sx7Var != null) {
                    this.o.f(lx7Var, sx7Var);
                }
                this.p = sx7VarB;
                if (sx7VarB != null) {
                    this.o.I(lx7Var, sx7VarB);
                }
            }
        }
        return super.onHoverEvent(motionEvent);
    }

    @Override // android.widget.ListView, android.widget.AbsListView, android.view.View, android.view.KeyEvent.Callback
    public final boolean onKeyDown(int i, KeyEvent keyEvent) {
        ListMenuItemView listMenuItemView = (ListMenuItemView) getSelectedView();
        if (listMenuItemView != null && i == this.m) {
            if (listMenuItemView.isEnabled() && listMenuItemView.getItemData().hasSubMenu()) {
                performItemClick(listMenuItemView, getSelectedItemPosition(), getSelectedItemId());
            }
            return true;
        }
        if (listMenuItemView == null || i != this.n) {
            return super.onKeyDown(i, keyEvent);
        }
        setSelection(-1);
        ListAdapter adapter = getAdapter();
        (adapter instanceof HeaderViewListAdapter ? (ix7) ((HeaderViewListAdapter) adapter).getWrappedAdapter() : (ix7) adapter).a.c(false);
        return true;
    }

    public void setHoverListener(rx7 rx7Var) {
        this.o = rx7Var;
    }

    @Override // defpackage.ym3, android.widget.AbsListView
    public /* bridge */ /* synthetic */ void setSelector(Drawable drawable) {
        super.setSelector(drawable);
    }
}
