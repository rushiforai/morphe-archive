package com.stremio.morphe;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.widget.FrameLayout;

/** Returns an abandoned QR login to the account chooser instead of leaving an empty account. */
public final class MorpheRootLayout extends FrameLayout {
    private boolean returningToChooser;

    public MorpheRootLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    @Override
    public boolean dispatchKeyEvent(KeyEvent event) {
        if (event.getKeyCode() == KeyEvent.KEYCODE_BACK
                && MorpheIsolation.hasPendingAccount(getContext())
                && MorpheNavBridge.isLoginDestination(getContext())) {
            if (event.getAction() == KeyEvent.ACTION_UP && !returningToChooser) {
                returningToChooser = true;
                Intent chooser = new Intent(getContext(), ProfileChooserActivity.class);
                chooser.putExtra(ProfileChooserActivity.EXTRA_CANCEL_PENDING_ACCOUNT, true);
                chooser.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_SINGLE_TOP);
                getContext().startActivity(chooser);
                Context context = getContext();
                if (context instanceof Activity) ((Activity) context).finish();
            }
            return true;
        }
        return super.dispatchKeyEvent(event);
    }
}
