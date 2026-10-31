package app.morphe.extension.chmate;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import java.io.File;
import java.lang.reflect.Field;

/** Haiagaru toolbar actions; stock icons and stored toolbar order stay untouched. */
public final class ToolbarIcons {
    static final String PREFS = "haiagaru_toolbar_icons";
    static final int AUTO_NG_EXCLUSIONS = 0x7e00000a;
    static final int FLOATING_FILTER = 0x7e000008;
    // Append only: existing files are addressed by their numeric index.
    static final String[] NAMES = {"エッヂ過去ログ", "フィルタ", "すべて既読", "長押しコピー", "ﾜｯﾁｮｲ下4桁で検索", "ﾜｯﾁｮｲ上4桁で検索", "★スレのみ巡回", "フローティングのフィルター", "必死チェッカーDroid＋で開く", "自動NG除外ID"};
    static final String[] RESOURCES = {"haiagaru_edge_archive", "haiagaru_quick_filter", "haiagaru_mark_all_read", "haiagaru_direct_copy", "haiagaru_wacchoi_lower", "haiagaru_wacchoi_upper", "haiagaru_favorite_threads", "haiagaru_quick_filter", "haiagaru_hissi_droid_plus", "haiagaru_auto_ng_exclusions"};
    private static final int[] ACTION_IDS = {0x7e000001, 0x7e000002, 0x7e000003, 0x7e000004, 0x7e000005, 0x7e000006, FavoriteThreads.TAB, FLOATING_FILTER, 0x7e000009, AUTO_NG_EXCLUSIONS};
    private static final Bitmap[] CACHE = new Bitmap[NAMES.length];
    private ToolbarIcons() {}
    static int index(int action) {
        for (int i = 0; i < ACTION_IDS.length; i++) if (ACTION_IDS[i] == action) return i;
        return -1;
    }
    public static boolean visible(Context context, int action) {
        // ChMate's per-toolbar selection is the only visibility control.
        // Keep search reachable when searching is disabled, so it can be enabled there.
        return true;
    }
    static File file(Context context, int i) { return new File(context.getFilesDir(), "haiagaru-toolbar-icons/" + i + ".png"); }
    static synchronized void invalidate(int i) {
        CACHE[i] = null;
        if (i == index(FLOATING_FILTER)) FloatingFilterButton.iconsChanged();
    }
    private static final class PreviewItem {
        final int action;
        PreviewItem(int i) { action = ACTION_IDS[i]; }
    }
    static Drawable preview(Context context, int i, int tint) {
        int id = context.getResources().getIdentifier(RESOURCES[i], "drawable", context.getPackageName());
        Drawable base = context.getResources().getDrawable(id, context.getTheme()).mutate();
        base.setTint(tint);
        return replace(context, new PreviewItem(i), tint, base);
    }
    /** Called only by the toolbar renderer, never by constructors, editors or serialization. */
    public static boolean visibleForToolbar(Object item, boolean selected) {
        return selected;
    }
    public static Drawable replaceNative(Object item, Drawable original) {
        // Native methods reuse Context's parameter register for the returned Drawable.
        // Never read their overwritten parameter registers at a return-site hook.
        Context context = Haiagaru.applicationContextForExtension();
        return context == null ? original : replace(context, item, 0, original);
    }
    public static Drawable replace(Context context, Object item, int color, Drawable original) {
        int i = -1;
        try {
            for (Field f : item.getClass().getDeclaredFields()) {
                if (f.getType() != int.class || java.lang.reflect.Modifier.isStatic(f.getModifiers())) continue;
                f.setAccessible(true); int candidate = index(f.getInt(item));
                if (candidate >= 0) { if (i >= 0) return original; i = candidate; }
            }
            if (i < 0) return original;
            Bitmap bitmap;
            synchronized (ToolbarIcons.class) {
                bitmap = CACHE[i];
                File image = file(context, i);
                if (bitmap == null && image.isFile()) {
                    // Files are normalized to <=256px on import. Do not decode arbitrary originals here.
                    BitmapFactory.Options bounds = new BitmapFactory.Options(); bounds.inJustDecodeBounds = true;
                    BitmapFactory.decodeFile(image.getPath(), bounds);
                    if (bounds.outWidth > 0 && bounds.outWidth <= 256 && bounds.outHeight > 0 && bounds.outHeight <= 256)
                        CACHE[i] = bitmap = BitmapFactory.decodeFile(image.getPath());
                }
            }
            if (bitmap != null) {
                final int size = Math.round(24 * context.getResources().getDisplayMetrics().density);
                BitmapDrawable custom = new BitmapDrawable(context.getResources(), bitmap) {
                    @Override public int getIntrinsicWidth() { return size; }
                    @Override public int getIntrinsicHeight() { return size; }
                };
                custom.setFilterBitmap(true); custom.setAntiAlias(true);
                return custom; // Preserve user image colors rather than applying the theme tint.
            }
            // Native color=0 means theme foreground, not transparent. Preserve the native
            // renderer's tint, user theme overrides and enabled/disabled state by default.
            return original;
        } catch (ReflectiveOperationException | RuntimeException error) { return original; }
    }
    static void addSettingsButton(android.widget.LinearLayout layout, android.app.Activity activity) {
        android.widget.Button button = new android.widget.Button(activity);
        button.setText("ツールバーのアイコン画像");
        button.setOnClickListener(v -> activity.startActivity(new android.content.Intent(activity, ToolbarIconsActivity.class)));
        layout.addView(button);
    }
}
