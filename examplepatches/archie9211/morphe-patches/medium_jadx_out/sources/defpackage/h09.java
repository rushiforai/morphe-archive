package defpackage;

import android.view.ActionMode;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h09 implements ActionMode.Callback {
    public final boolean a;
    public final boolean b;
    public final n39 c;
    public m45 d;

    public h09(boolean z, boolean z2, n39 n39Var) {
        n39Var.getClass();
        this.a = z;
        this.b = z2;
        this.c = n39Var;
    }

    @Override // android.view.ActionMode.Callback
    public final boolean onActionItemClicked(ActionMode actionMode, MenuItem menuItem) {
        actionMode.getClass();
        menuItem.getClass();
        m45 m45Var = this.d;
        n92 n92Var = null;
        qxb qxbVar = m45Var != null ? (qxb) m45Var.invoke() : null;
        int i = 1;
        if (qxbVar == null || qxbVar.a == qxbVar.b) {
            actionMode.finish();
            return true;
        }
        int itemId = menuItem.getItemId();
        int i2 = 0;
        n39 n39Var = this.c;
        if (itemId == R.id.menu_read_post_highlight_action_highlight) {
            n39Var.getClass();
            vx0.c0(f76.F(n39Var), null, null, new m39(n39Var, qxbVar, n92Var, i2), 3);
            actionMode.finish();
            return true;
        }
        if (itemId == R.id.menu_read_post_highlight_action_respond) {
            n39Var.getClass();
            vx0.c0(f76.F(n39Var), null, null, new m39(n39Var, qxbVar, n92Var, i), 3);
            actionMode.finish();
            return true;
        }
        if (itemId != R.id.menu_read_post_highlight_action_share) {
            return false;
        }
        n39Var.getClass();
        vx0.c0(f76.F(n39Var), null, null, new m39(n39Var, qxbVar, n92Var, 2), 3);
        actionMode.finish();
        return true;
    }

    @Override // android.view.ActionMode.Callback
    public final boolean onCreateActionMode(ActionMode actionMode, Menu menu) {
        actionMode.getClass();
        menu.getClass();
        actionMode.setTitle("");
        MenuInflater menuInflater = actionMode.getMenuInflater();
        if (menuInflater == null) {
            return false;
        }
        menu.clear();
        menuInflater.inflate(R.menu.menu_read_post_highlight, menu);
        return true;
    }

    @Override // android.view.ActionMode.Callback
    public final void onDestroyActionMode(ActionMode actionMode) {
        actionMode.getClass();
    }

    @Override // android.view.ActionMode.Callback
    public final boolean onPrepareActionMode(ActionMode actionMode, Menu menu) {
        actionMode.getClass();
        menu.getClass();
        MenuItem menuItemFindItem = menu.findItem(R.id.menu_read_post_highlight_action_highlight);
        if (menuItemFindItem != null) {
            menuItemFindItem.setVisible(this.b);
        }
        MenuItem menuItemFindItem2 = menu.findItem(R.id.menu_read_post_highlight_action_respond);
        if (menuItemFindItem2 == null) {
            return true;
        }
        menuItemFindItem2.setVisible(this.a);
        return true;
    }
}
