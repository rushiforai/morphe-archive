package defpackage;

import android.view.ActionMode;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dw3 implements ActionMode.Callback {
    public final x45 a;
    public final x45 b;
    public final x45 c;

    public dw3(x45 x45Var, x45 x45Var2, x45 x45Var3) {
        this.a = x45Var;
        this.b = x45Var2;
        this.c = x45Var3;
    }

    @Override // android.view.ActionMode.Callback
    public final boolean onActionItemClicked(ActionMode actionMode, MenuItem menuItem) {
        actionMode.getClass();
        menuItem.getClass();
        int itemId = menuItem.getItemId();
        x45 x45Var = this.a;
        if (itemId == R.id.common_menu_edit_post_bold) {
            x45Var.invoke(hw1.a);
            return true;
        }
        if (itemId != R.id.common_menu_edit_post_italic) {
            return ((Boolean) this.c.invoke(Integer.valueOf(itemId))).booleanValue();
        }
        x45Var.invoke(ow1.a);
        return true;
    }

    @Override // android.view.ActionMode.Callback
    public final boolean onCreateActionMode(ActionMode actionMode, Menu menu) {
        actionMode.getClass();
        menu.getClass();
        MenuInflater menuInflater = actionMode.getMenuInflater();
        menu.clear();
        menuInflater.inflate(R.menu.common_menu_edit_post_paragraph, menu);
        return true;
    }

    @Override // android.view.ActionMode.Callback
    public final void onDestroyActionMode(ActionMode actionMode) {
        actionMode.getClass();
        this.b.invoke(Boolean.FALSE);
    }

    @Override // android.view.ActionMode.Callback
    public final boolean onPrepareActionMode(ActionMode actionMode, Menu menu) {
        actionMode.getClass();
        menu.getClass();
        this.b.invoke(Boolean.TRUE);
        return false;
    }
}
