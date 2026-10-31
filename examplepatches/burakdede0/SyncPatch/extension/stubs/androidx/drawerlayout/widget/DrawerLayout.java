// COMPILE-TIME STUB ONLY. Not included in the extension dex.
// Lets the extension subclass the drawer adapter and add listeners against the
// real androidx.drawerlayout classes that are bundled with the target app.
package androidx.drawerlayout.widget;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;

public class DrawerLayout extends ViewGroup {

    public DrawerLayout() {
        super((Context) null);
    }

    @Override
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
    }

    public interface DrawerListener {
        void onDrawerSlide(View drawerView, float slideOffset);

        void onDrawerOpened(View drawerView);

        void onDrawerClosed(View drawerView);

        void onDrawerStateChanged(int newState);
    }

    public abstract static class SimpleDrawerListener implements DrawerListener {
        @Override
        public void onDrawerSlide(View drawerView, float slideOffset) {
        }

        @Override
        public void onDrawerOpened(View drawerView) {
        }

        @Override
        public void onDrawerClosed(View drawerView) {
        }

        @Override
        public void onDrawerStateChanged(int newState) {
        }
    }

    public void addDrawerListener(DrawerListener listener) {
        throw new RuntimeException("stub");
    }
}
