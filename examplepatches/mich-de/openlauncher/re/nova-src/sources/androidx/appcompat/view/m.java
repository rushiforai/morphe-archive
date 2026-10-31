package androidx.appcompat.view;

import android.view.KeyboardShortcutGroup;
import android.view.Menu;
import android.view.Window;
import java.util.List;

/* loaded from: classes2.dex */
public abstract class m {
    public static void a(Window.Callback callback, List<KeyboardShortcutGroup> list, Menu menu, int i5) {
        callback.onProvideKeyboardShortcuts(list, menu, i5);
    }
}
