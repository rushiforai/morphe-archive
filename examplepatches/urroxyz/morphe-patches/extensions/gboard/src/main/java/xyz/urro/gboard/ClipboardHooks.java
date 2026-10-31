package xyz.urro.gboard;

import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/** Adds virtual rows after the native list. Gboard's local database/list and Tips stay untouched. */
public final class ClipboardHooks {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Map<Object, List<ClipStore.Entry>> adapters = new WeakHashMap<>();
    private static final Map<Object, java.lang.ref.WeakReference<Object>> holderAdapters = new WeakHashMap<>();
    private static Context context;
    private static ClipStore store;
    private static ClipCascadeClient client;
    private static final int REMOTE_HEADER = 127;
    private static final java.util.concurrent.ExecutorService IMAGE_IO = java.util.concurrent.Executors.newSingleThreadExecutor();
    private static final int SEND_TAG = 0x7e750002;
    private static volatile long ttl = 3600000;
    private static volatile int maximum = 5;

    private ClipboardHooks() {}
    static SharedPreferences preferences(Context value) { return value.getSharedPreferences("urro_gboard", Context.MODE_PRIVATE); }
    static String label(boolean remote) { return preferences(context).getString(remote ? "remote_section_name" : "local_section_name", remote ? "Other devices" : "This device"); }

    private static void init(Context value) {
        if (context == null) {
            context = value.getApplicationContext(); store = new ClipStore(context); client = new ClipCascadeClient(context);
            MAIN.postDelayed(new Runnable() {
                @Override public void run() {
                    if (!adapters.isEmpty()) refresh();
                    MAIN.postDelayed(this, 60000);
                }
            }, 60000);
        }
        if (preferences(context).getBoolean("clipcascade_enabled", true)) client.start();
        // Honor the community clipboard patch's public settings API when it is installed.
        try {
            Class<?> settings = Class.forName("dev.jason.gboardpatches.extension.clipboard.GboardClipboardSettings", false, value.getClassLoader());
            ttl = ((Number) settings.getMethod("readClipboardTtlMs", Context.class).invoke(null, context)).longValue();
            maximum = ((Number) settings.getMethod("readClipboardMaxCount", Context.class).invoke(null, context)).intValue();
        } catch (ClassNotFoundException ignored) {
            ttl = 3600000; maximum = 5;
        } catch (ReflectiveOperationException exception) { log(exception); }
    }

    private static Object field(Object value, String name) throws ReflectiveOperationException { return TranslationHooks.field(value, name); }
    private static Object call(Object value, String name, Class<?>[] types, Object... args) throws ReflectiveOperationException { return TranslationHooks.call(value, name, types, args); }
    private static void log(Exception exception) { android.util.Log.e("UrroGboard", "Clipboard integration failed", exception); }
    private static int nativeSize(Object adapter) throws ReflectiveOperationException { return ((List<?>) field(adapter, "n")).size(); }
    private static List<ClipStore.Entry> snapshot(Object adapter) {
        List<ClipStore.Entry> value = adapters.get(adapter);
        if (value == null) { value = store.entries(ttl, maximum); adapters.put(adapter, value); }
        return value;
    }

    private static ClipboardRows rows(Object adapter) throws ReflectiveOperationException {
        List<?> items = (List<?>) field(adapter, "n");
        boolean visible = context != null && preferences(context).getBoolean("show_remote_clipboard", true);
        int[] types = new int[items.size()];
        if (visible) for (int i = 0; i < types.length; i++) types[i] = ((Number) call(items.get(i), "g", new Class<?>[0])).intValue();
        return new ClipboardRows(types, visible ? snapshot(adapter).size() : 0, visible);
    }

    public static int nativePosition(Object adapter, int display) {
        try { return rows(adapter).nativePosition(display); }
        catch (ReflectiveOperationException exception) { log(exception); return display; }
    }

    /** Native clipboard callbacks use list indices; RecyclerView still uses display indices. */
    public static int nativeHolderPosition(Object holder) {
        try {
            int display = ((Number) call(holder, NativeApi.holderPosition(), new Class<?>[0])).intValue();
            java.lang.ref.WeakReference<Object> reference = holderAdapters.get(holder);
            Object adapter = reference == null ? null : reference.get();
            return adapter == null ? display : nativePosition(adapter, display);
        } catch (ReflectiveOperationException exception) { log(exception); return -1; }
    }

    /** A full refresh keeps native notifications correct when our inserted section shifts. */
    public static boolean refreshNative(Object adapter) {
        if (context == null || !adapters.containsKey(adapter)
                || !preferences(context).getBoolean("show_remote_clipboard", true)) return false;
        try { call(adapter, NativeApi.refresh(), new Class<?>[0]); return true; }
        catch (ReflectiveOperationException exception) { log(exception); return false; }
    }

    /** Used by the patched getter, which keeps its stock registers. */
    public static int countOf(Object adapter) {
        try {
            int stock = ((java.util.List<?>) field(adapter, "n")).size();
            return count(adapter, stock);
        } catch (ReflectiveOperationException | RuntimeException exception) { log(exception); return 0; }
    }

    public static int count(Object adapter, int count) {
        try {
            long oldTtl = ttl;
            int oldMaximum = maximum;
            init((Context) field(adapter, "e"));
            if (oldTtl != ttl || oldMaximum != maximum) adapters.remove(adapter);
            if (!preferences(context).getBoolean("show_remote_clipboard", true)) return count;
            return rows(adapter).count();
        } catch (ReflectiveOperationException | RuntimeException exception) { log(exception); return count; }
    }

    public static int type(Object adapter, int position) {
        try {
            ClipboardRows rows = rows(adapter);
            return rows.remote(position) ? position == rows.insertion ? REMOTE_HEADER : 0 : -1;
        }
        catch (ReflectiveOperationException exception) { log(exception); return -1; }
    }

    public static Object header(Object adapter, ViewGroup parent, int type) {
        if (type != REMOTE_HEADER) return null;
        try { return call(adapter, NativeApi.header(), new Class<?>[]{ViewGroup.class}, parent); }
        catch (ReflectiveOperationException exception) { log(exception); return null; }
    }

    public static boolean bind(Object adapter, Object holder, int position) {
        try {
            holderAdapters.put(holder, new java.lang.ref.WeakReference<>(adapter));
            ClipboardRows rows = rows(adapter);
            if (!rows.remote(position)) return false;
            if (position == rows.insertion) {
                ((TextView) field(holder, "s")).setText(label(true));
                call(holder, "F", new Class<?>[]{int.class}, View.VISIBLE);
                ((View) field(holder, "t")).setVisibility(View.GONE);
                return true;
            }
            List<ClipStore.Entry> entries = snapshot(adapter);
            int index = position - rows.insertion - 1;
            if (index < 0 || index >= entries.size()) return true;
            ClipStore.Entry entry = entries.get(index);
            TextView text = (TextView) field(holder, "t");
            for (String name : new String[]{"E", "x", "D", "v", "w", "B"}) ((View) field(holder, name)).setVisibility(View.GONE);
            ((View) field(holder, "u")).setVisibility(View.VISIBLE);
            ((View) field(holder, "A")).setVisibility(View.VISIBLE);
            ((View) field(holder, "z")).setVisibility(View.GONE);
            if (entry.type.equals("image")) {
                android.graphics.Bitmap preview = ClipImages.thumbnail(context, Uri.parse(entry.text));
                ImageView image = (ImageView) field(holder, preview.getHeight() > preview.getWidth() ? "w" : "v");
                image.setImageBitmap(preview);
                image.setVisibility(View.VISIBLE);
                ((View) field(holder, "x")).setVisibility(View.VISIBLE);
                ((View) field(holder, "u")).setVisibility(View.INVISIBLE);
            } else text.setText(entry.text);
            View root = (View) field(holder, "a");
            root.setContentDescription(entry.type.equals("image") ? "Image from other devices" : entry.text);
            root.setOnClickListener(view -> {
                try {
                    Object item = nativeItem(adapter.getClass().getClassLoader(), entry);
                    Object keyboard = field(adapter, NativeApi.adapterKeyboard());
                    call(keyboard, NativeApi.paste(), new Class<?>[]{item.getClass(), boolean.class}, item, true);
                } catch (ReflectiveOperationException exception) { log(exception); }
            });
            root.setOnLongClickListener(view -> {
                remoteMenu(view, entry); return true;
            });
            return true;
        } catch (Exception exception) { log(exception); return true; }
    }

    /** Called after native binding; header 1 remains Gboard's own header with just a new label. */
    public static void localBound(Object adapter, Object holder, int position) {
        try {
            List<?> items = (List<?>) field(adapter, "n");
            if (position >= items.size()) return;
            Object item = items.get(position);
            if (((Number) call(item, "g", new Class<?>[0])).intValue() == 1) ((TextView) field(holder, "s")).setText(label(false));
        } catch (ReflectiveOperationException exception) { log(exception); }
    }

    public static void sticky(Object adapter) {
        try {
            if (context == null) return;
            Object recycler = field(adapter, "j");
            if (recycler == null) return;
            Object layout = field(recycler, "l");
            String positionsMethod = NativeApi.visiblePositions();
            int[] positions = (int[]) (positionsMethod.endsWith("[]")
                    ? call(layout, positionsMethod.substring(0, positionsMethod.length() - 2), new Class<?>[]{int[].class}, (Object) null)
                    : call(layout, positionsMethod, new Class<?>[0]));
            if (positions.length == 0 || positions[0] < 0) return;
            ClipboardRows rows = rows(adapter);
            boolean remote = rows.remote(positions[0]);
            int section = 0;
            if (!remote) {
                List<?> items = (List<?>) field(adapter, "n");
                for (int i = Math.min(rows.nativePosition(positions[0]), items.size() - 1); i >= 0; i--) {
                    section = ((Number) call(items.get(i), "g", new Class<?>[0])).intValue();
                    if (section != 0) break;
                }
            }
            Object selected = section >= 1 && section <= 3 ? field(adapter, section == 1 ? "B" : section == 2 ? "C" : "D") : null;
            Object keyboard = field(adapter, NativeApi.adapterKeyboard());
            TextView sticky = (TextView) field(keyboard, "f");
            if (sticky != null) {
                if (remote) sticky.setText(label(true));
                else if (section == 1) sticky.setText(label(false));
                else if (selected != null) sticky.setText(((TextView) field(selected, "s")).getText());
            }
            boolean editing = false;
            for (String name : new String[]{"B", "C", "D"}) {
                Object header = field(adapter, name);
                if (header != null) {
                    View edit = (View) field(header, "t");
                    if (edit != null) { editing |= edit.getVisibility() == View.VISIBLE; edit.setVisibility(View.GONE); }
                }
            }
            if (!remote && editing && selected != null) ((View) field(selected, "t")).setVisibility(View.VISIBLE);
            Object recent = field(adapter, "B");
            if (recent != null) ((TextView) field(recent, "s")).setText(label(false));
        } catch (ReflectiveOperationException | RuntimeException exception) { log(exception); }
    }

    private static Object nativeItem(ClassLoader loader, ClipStore.Entry entry) throws ReflectiveOperationException {
        Class<?> builderClass = Class.forName(NativeApi.builderClass(), true, loader);
        Object builder = builderClass.getConstructor().newInstance();
        builderClass.getField("a").setLong(builder, entry.id);
        Class<?> instant = Class.forName("j$.time.Instant", true, loader);
        builderClass.getField("b").set(builder, instant.getMethod("ofEpochMilli", long.class).invoke(null, entry.time));
        if (entry.type.equals("image")) call(builder, "g", new Class<?>[]{Uri.class}, Uri.parse(entry.text));
        else call(builder, "f", new Class<?>[]{String.class}, entry.text);
        Object item = Class.forName(NativeApi.itemClass(), true, loader).getConstructor(builderClass).newInstance(builder);
        call(item, "k", new Class<?>[]{boolean.class}, entry.pinned);
        return item;
    }

    public static void popup(Object popup, View root) {
        try {
            Object item = field(popup, "a");
            if (item == null) return;
            View delete = deleteRow(root);
            if (delete == null || !(delete.getParent() instanceof LinearLayout)) return;
            LinearLayout menu = (LinearLayout) delete.getParent();
            if (menu.getTag(SEND_TAG) != null) return;
            int deleteIndex = menu.indexOfChild(delete);
            if (deleteIndex < 1 || !(menu.getChildAt(deleteIndex - 1) instanceof LinearLayout)) return;
            LinearLayout middle = (LinearLayout) menu.getChildAt(deleteIndex - 1);
            TextView nativeText = findText(middle);
            ImageView nativeIcon = findImage(middle);
            if (nativeText == null || nativeIcon == null) return;
            LinearLayout row = new LinearLayout(menu.getContext());
            row.setGravity(middle.getGravity());
            row.setOrientation(middle.getOrientation());
            row.setLayoutDirection(middle.getLayoutDirection());
            row.setLayoutParams(new LinearLayout.LayoutParams((LinearLayout.LayoutParams) middle.getLayoutParams()));
            row.setPaddingRelative(middle.getPaddingStart(), middle.getPaddingTop(), middle.getPaddingEnd(), middle.getPaddingBottom());
            if (middle.getBackground() != null && middle.getBackground().getConstantState() != null)
                row.setBackground(middle.getBackground().getConstantState().newDrawable(root.getResources()).mutate());
            if (middle.getForeground() != null && middle.getForeground().getConstantState() != null)
                row.setForeground(middle.getForeground().getConstantState().newDrawable(root.getResources()).mutate());
            ImageView icon = new ImageView(menu.getContext());
            icon.setImageResource(android.R.drawable.ic_menu_send);
            icon.setImageTintList(nativeIcon.getImageTintList() != null ? nativeIcon.getImageTintList() : nativeText.getTextColors());
            icon.setScaleType(nativeIcon.getScaleType());
            icon.setPaddingRelative(nativeIcon.getPaddingStart(), nativeIcon.getPaddingTop(), nativeIcon.getPaddingEnd(), nativeIcon.getPaddingBottom());
            icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            row.addView(icon, new LinearLayout.LayoutParams((LinearLayout.LayoutParams) nativeIcon.getLayoutParams()));
            TextView label = new TextView(menu.getContext()); label.setText("Send");
            label.setTextColor(nativeText.getTextColors());
            label.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX, nativeText.getTextSize());
            label.setTypeface(nativeText.getTypeface());
            label.setGravity(nativeText.getGravity());
            label.setLetterSpacing(nativeText.getLetterSpacing());
            label.setIncludeFontPadding(nativeText.getIncludeFontPadding());
            label.setPaddingRelative(nativeText.getPaddingStart(), nativeText.getPaddingTop(), nativeText.getPaddingEnd(), nativeText.getPaddingBottom());
            row.addView(label, new LinearLayout.LayoutParams((LinearLayout.LayoutParams) nativeText.getLayoutParams()));
            row.setOnClickListener(view -> {
                try {
                    String text = (String) call(item, "i", new Class<?>[0]);
                    String uri = (String) call(item, "j", new Class<?>[0]);
                    if (text.isEmpty() && !uri.isEmpty()) sendImage(view, Uri.parse(uri));
                    else send(view, text, "text");
                } catch (ReflectiveOperationException exception) { log(exception); }
            });
            menu.addView(row, deleteIndex);
            menu.setTag(SEND_TAG, true);
        } catch (ReflectiveOperationException | RuntimeException | java.io.IOException exception) { log(exception); }
    }

    private static View deleteRow(View root) throws java.io.IOException {
        java.util.Set<String> labels = new java.util.HashSet<>();
        TextView nativeLabel = root instanceof ViewGroup ? findText((ViewGroup) root) : null;
        String resourcePackage = nativeLabel != null && nativeLabel.getId() > 0
                ? root.getResources().getResourcePackageName(nativeLabel.getId()) : root.getContext().getPackageName();
        try (java.io.BufferedReader input = new java.io.BufferedReader(new java.io.InputStreamReader(
                root.getContext().getAssets().open("urro_gboard_delete_labels.txt"), java.nio.charset.StandardCharsets.UTF_8))) {
            String name;
            while ((name = input.readLine()) != null) {
                int id = root.getResources().getIdentifier(name, "string", resourcePackage);
                if (id != 0) labels.add(root.getResources().getString(id));
            }
        }
        View text = findLabel(root, labels);
        while (text != null && text != root && text.getParent() instanceof View) {
            View parent = (View) text.getParent();
            if (parent instanceof LinearLayout && ((LinearLayout) parent).getOrientation() == LinearLayout.VERTICAL) return text;
            text = parent;
        }
        return null;
    }

    private static View findLabel(View view, java.util.Set<String> labels) {
        if (view instanceof TextView && labels.contains(((TextView) view).getText().toString())) return view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = findLabel(group.getChildAt(i), labels);
                if (found != null) return found;
            }
        }
        return null;
    }

    private static TextView findText(ViewGroup parent) {
        for (int i = 0; i < parent.getChildCount(); i++) {
            View child = parent.getChildAt(i);
            if (child instanceof TextView) return (TextView) child;
            if (child instanceof ViewGroup) { TextView found = findText((ViewGroup) child); if (found != null) return found; }
        }
        return null;
    }

    private static ImageView findImage(ViewGroup parent) {
        for (int i = 0; i < parent.getChildCount(); i++) {
            View child = parent.getChildAt(i);
            if (child instanceof ImageView) return (ImageView) child;
            if (child instanceof ViewGroup) { ImageView found = findImage((ViewGroup) child); if (found != null) return found; }
        }
        return null;
    }

    private static void remoteMenu(View anchor, ClipStore.Entry entry) {
        String[] choices = {entry.pinned ? "Unpin" : "Pin", "Edit", "Send", "Delete"};
        AlertDialog dialog = new AlertDialog.Builder(anchor.getContext()).setTitle(entry.type.equals("image") ? "Clipboard image" : "Clipboard text")
                .setItems(choices, (value, selected) -> {
                    if (selected == 0) { store.update(entry.id, entry.text, !entry.pinned, false); refresh(); }
                    else if (selected == 1) {
                        if (entry.type.equals("image")) { Toast.makeText(context, "Image editing isn't supported by Gboard", Toast.LENGTH_SHORT).show(); return; }
                        EditText editor = new EditText(anchor.getContext()); editor.setText(entry.text);
                        show(anchor, new AlertDialog.Builder(anchor.getContext()).setTitle("Edit").setView(editor).setNegativeButton("Cancel", null)
                                .setPositiveButton("Save", (d, w) -> { store.update(entry.id, editor.getText().toString(), entry.pinned, false); refresh(); }).create());
                    } else if (selected == 2) {
                        if (entry.type.equals("image")) sendImage(anchor, Uri.parse(entry.text)); else send(anchor, entry.text, "text");
                    } else { store.update(entry.id, entry.text, false, true); refresh(); }
                }).create();
        show(anchor, dialog);
    }

    private static void sendImage(View anchor, Uri uri) {
        confirm(anchor, () -> IMAGE_IO.execute(() -> {
            try (java.io.InputStream input = context.getContentResolver().openInputStream(uri)) {
                java.io.ByteArrayOutputStream output = new java.io.ByteArrayOutputStream();
                byte[] buffer = new byte[8192]; int count;
                while ((count = input.read(buffer)) != -1) {
                    if (output.size() + count > ClipCascadeClient.MAX_BYTES) throw new java.io.IOException("Image too large");
                    output.write(buffer, 0, count);
                }
                client.send(android.util.Base64.encodeToString(output.toByteArray(), android.util.Base64.NO_WRAP), "image");
            } catch (Exception exception) { MAIN.post(() -> Toast.makeText(context, "Couldn't read or send this image", Toast.LENGTH_LONG).show()); }
        }));
    }
    private static void send(View anchor, String value, String type) { confirm(anchor, () -> client.send(value, type)); }
    private static void confirm(View anchor, Runnable action) {
        if (!preferences(context).getBoolean("confirm_clipboard_send", true)) { action.run(); return; }
        show(anchor, new AlertDialog.Builder(anchor.getContext()).setTitle("Send clipboard?")
                .setMessage("Send to all connected ClipCascade devices?")
                .setNegativeButton("Cancel", null).setPositiveButton("Confirm", (dialog, which) -> action.run()).create());
    }
    static void show(View anchor, AlertDialog dialog) {
        WindowManager.LayoutParams attributes = dialog.getWindow().getAttributes();
        attributes.token = anchor.getWindowToken(); attributes.type = WindowManager.LayoutParams.TYPE_APPLICATION_ATTACHED_DIALOG;
        dialog.getWindow().setAttributes(attributes); dialog.show();
    }

    static void received(String text, String type) {
        try {
            store.add(text, type, ttl, maximum);
            MAIN.post(ClipboardHooks::refresh);
        } catch (Exception exception) {
            log(exception);
            MAIN.post(() -> Toast.makeText(context, "Couldn't add the received clipboard", Toast.LENGTH_LONG).show());
        }
    }
    static void clear(Context value) {
        new ClipStore(value).clear();
        if (store != null) refresh();
    }
    static String status() { return client == null ? "Open the clipboard to connect" : client.status; }
    static void settingsChanged() {
        if (client != null) { if (preferences(context).getBoolean("clipcascade_enabled", true)) client.start(); else client.stop(); }
        refresh();
    }
    private static void refresh() {
        for (Object adapter : new ArrayList<>(adapters.keySet())) {
            adapters.put(adapter, store.entries(ttl, maximum));
            try { call(adapter, NativeApi.refresh(), new Class<?>[0]); }
            catch (ReflectiveOperationException exception) { log(exception); }
        }
    }
}
