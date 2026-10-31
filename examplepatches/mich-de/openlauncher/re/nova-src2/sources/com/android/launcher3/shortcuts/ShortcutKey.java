package com.android.launcher3.shortcuts;

import aa.d;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ShortcutInfo;
import android.os.Parcelable;
import android.os.Process;
import android.os.UserHandle;
import com.android.launcher3.util.ComponentKey;
import ja.h;
import java.util.Arrays;

/* loaded from: classes.dex */
public class ShortcutKey extends ComponentKey {
    public static final Parcelable.Creator<ShortcutKey> CREATOR = new d(14);

    public ShortcutKey(UserHandle userHandle, String str, String str2) {
        super(new ComponentName(str, str2), userHandle);
    }

    public static ShortcutKey b(ShortcutInfo shortcutInfo) {
        return new ShortcutKey(shortcutInfo.getUserHandle(), shortcutInfo.getPackage(), shortcutInfo.getId());
    }

    public static ShortcutKey d(Intent intent, UserHandle userHandle) {
        if (!intent.hasCategory("com.android.launcher3.DEEP_SHORTCUT")) {
            return null;
        }
        return new ShortcutKey(userHandle, intent.getPackage(), intent.getStringExtra("shortcut_id"));
    }

    public static Intent e(ShortcutInfo shortcutInfo) {
        Intent intentPutExtra = new Intent("android.intent.action.MAIN").addCategory("com.android.launcher3.DEEP_SHORTCUT").setComponent(shortcutInfo.getActivity()).setPackage(shortcutInfo.getPackage()).setFlags(270532608).putExtra("shortcut_id", shortcutInfo.getId());
        if (shortcutInfo.getUserHandle() != Process.myUserHandle()) {
            intentPutExtra.putExtra("userHandle", ((h) h.f69294h.f95127b).d(shortcutInfo.getUserHandle()));
        }
        return intentPutExtra;
    }

    public final androidx.room.h a(Context context) {
        androidx.room.h hVar = new androidx.room.h(context, this.f21252b);
        ComponentName componentName = this.f21251a;
        hVar.a(componentName.getPackageName(), Arrays.asList(componentName.getClassName()));
        return hVar;
    }
}
