package s10;

import android.content.ComponentName;
import android.net.Uri;
import io.branch.search.ui.Image;
import kotlin.NoWhenBranchMatchedException;

/* loaded from: classes4.dex */
public abstract class e0 {
    public static final Uri a(Image image, ja.h hVar) {
        if (image instanceof Image.AndroidResource) {
            return Uri.parse(((Image.AndroidResource) image).f66474a.f66485a);
        }
        if (image instanceof Image.AppIcon) {
            Image.AppIcon appIcon = (Image.AppIcon) image;
            return new Uri.Builder().scheme("appIcon").authority(appIcon.f66477a.flattenToShortString()).fragment(String.valueOf(hVar.d(appIcon.f66478b))).build();
        }
        if (image instanceof Image.LargeImage) {
            return Uri.parse(((Image.LargeImage) image).f66480b.f66485a);
        }
        if (image instanceof Image.Shortcut) {
            Image.Shortcut shortcut = (Image.Shortcut) image;
            return new Uri.Builder().scheme("deepShortcutIcon").encodedOpaquePart(new ComponentName(shortcut.f66481a, shortcut.f66483c).flattenToShortString()).encodedFragment(String.valueOf(hVar.d(shortcut.f66482b))).build();
        }
        if (image instanceof Image.Stub) {
            return Uri.EMPTY;
        }
        if (image instanceof Image.Url) {
            return Uri.parse(((Image.Url) image).f66485a);
        }
        throw new NoWhenBranchMatchedException();
    }
}
