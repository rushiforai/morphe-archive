package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Intent;
import android.widget.EditText;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.List;

public final class GigaFilePosting {
    static final String SERVICE = "GigaFile（ギガファイル）便";
    static final String BUTTON_SETTING = "書き込み画面に" + SERVICE + "のファイルボタンを表示";
    static final String SHOW_BUTTON = "showGigaFileUploadButton";
    static final String LINK_MODE = "gigaFileLinkMode";
    static final int IN_APP = 0, EXTERNAL = 1, DIRECT = 2;
    private static final String MODE_LABEL = SERVICE + "リンクの開き方";
    private static final String[] LINK_MODES = {"アプリ内ブラウザ（広告を非表示）", "外部ブラウザ", "直接ダウンロード"};
    static final String LABEL = SERVICE + "でファイルをアップロード";
    private static final int ACTION = 0x7e000049;
    private static final int IMAGE_ACTION = 18;
    private static final String RESOURCE = "haiagaru_gigafile_upload";
    private static final WeakHashMap<Object,WeakReference<EditText>> DRAFTS = new WeakHashMap<>();
    private static String pendingUpload;
    private static WeakReference<EditText> pendingDraft = new WeakReference<>(null);
    private static final String EDITOR = "jp.syoboi.a2chMate.activity.ResEditActivity";

    /** Called by the three native toolbar setters before they construct the visible buttons. */
    public static Object dialogToolbar(View toolbar, Object state) {
        if (state == null) return null;
        int id = toolbar.getId();
        if (id != 0x7f0a00c3 && id != 0x7f090087 && id != 0x7f0900a9) return state;
        Activity activity = NativeToolTabs.activity(toolbar.getContext());
        if (!isDialog(activity) || !buttonEnabled(activity)) return state;
        try {
            Class<?> type = state.getClass();
            boolean legacy = state instanceof List;
            boolean middle = id == 0x7f090087;
            List<?> original = legacy ? (List<?>) state : (List<?>) NativeFields.find(type, middle ? "b" : "a").get(state);
            var items = new ArrayList<Object>(original);
            Object image = null;
            int insertAt = 0;
            for (int i = 0; i < items.size(); i++) {
                Object item = items.get(i);
                int action = NativeFields.find(item.getClass(), middle ? "b" : "c").getInt(item);
                if (action == ACTION) return state;
                if (action == IMAGE_ACTION) {
                    if (!NativeFields.find(item.getClass(), legacy ? "g" : middle ? "c" : "b").getBoolean(item))
                        return state;
                    image = item;
                    insertAt = i + 1;
                }
            }
            if (image == null) return state;
            int drawable = toolbar.getResources().getIdentifier(RESOURCE, "drawable", activity.getPackageName());
            int title = toolbar.getResources().getIdentifier(RESOURCE, "string", activity.getPackageName());
            if (drawable == 0 || title == 0) return state;
            if (legacy) {
                items.add(insertAt, spec(image.getClass(), drawable, title));
                Class<?> defaults = Class.forName("o.qhcCC", false, type.getClassLoader());
                Object empty = Array.newInstance(defaults, 0);
                @SuppressWarnings("unchecked") List<Object> copy = (List<Object>) type
                        .getConstructor(int.class, int.class, empty.getClass()).newInstance(
                                type.getField("gravityPort").getInt(state), type.getField("gravityLand").getInt(state), empty);
                copy.addAll(items);
                return copy;
            }
            Class<?> specType = Class.forName("jp.syoboi.a2chMate.feature.toolbar.ToolbarButtonSpec", false, type.getClassLoader());
            items.add(insertAt, image.getClass().getConstructor(specType).newInstance(spec(specType, drawable, title)));
            if (middle) return type.getConstructor(int.class, int.class, List.class)
                    .newInstance(type.getField("c").getInt(state), type.getField("e").getInt(state), items);
            var portrait = type.getField("c");
            var landscape = type.getField("e");
            return type.getConstructor(portrait.getType(), landscape.getType(), List.class)
                    .newInstance(portrait.get(state), landscape.get(state), items);
        } catch (ReflectiveOperationException | RuntimeException unavailable) {
            android.util.Log.w("Haiagaru", "GigaFile toolbar binding unavailable", unavailable);
            return state;
        }
    }

    private static Object spec(Class<?> type, int icon, int title) throws ReflectiveOperationException {
        Constructor<?> constructor = type.getConstructor(int.class, int.class, int.class, int.class, boolean.class);
        return constructor.newInstance(ACTION, icon, title, title, true);
    }

    private static boolean isDialog(Activity activity) {
        return activity != null && (EDITOR + "$Dialog").equals(activity.getClass().getName());
    }

    public static boolean handleDialogAction(Object owner, int action) {
        if (action != ACTION) return false;
        Activity activity = Haiagaru.toolbarActivity(owner);
        if (!isDialog(activity) || !buttonEnabled(activity)) return false;
        return launch(owner,activity);
    }

    public static void addPostingMenu(Object owner, Menu menu) {
        Activity activity = Haiagaru.toolbarActivity(owner);
        if (!isFullEditor(owner, activity)) return;
        if (!buttonEnabled(activity)) {
            menu.removeItem(ACTION);
            return;
        }
        if (menu.findItem(ACTION) != null) return;
        MenuItem item = menu.add(Menu.NONE, ACTION, Menu.NONE, LABEL);
        item.setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
        item.setOnMenuItemClickListener(clicked -> handlePostingMenu(owner, clicked));
    }

    public static boolean handlePostingMenu(Object owner, MenuItem item) {
        if (item == null || item.getItemId() != ACTION) return false;
        Activity activity = Haiagaru.toolbarActivity(owner);
        return isFullEditor(owner, activity) && buttonEnabled(activity) && launch(owner,activity);
    }

    public static boolean handlePostingActivityMenu(MenuItem item) {
        return handlePostingMenu(null, item);
    }

    private static boolean isFullEditor(Object owner, Activity activity) {
        if (activity == null || isDialog(activity)) return false;
        if (activity.getClass().getName().startsWith(EDITOR)) return true;
        if (owner == null) return false;
        String name = owner.getClass().getName();
        return name.equals("o.p9ExternalSyntheticLambda6")
                || name.equals("jp.syoboi.a2chMate.feature.resedit.ResEditFragment");
    }

    static void bindDraft(Object fragment, EditText body) {
        DRAFTS.put(fragment,new WeakReference<>(body));
        Activity activity = NativeToolTabs.activity(body.getContext());
        if (activity != null) DRAFTS.put(activity,new WeakReference<>(body));
    }

    private static boolean launch(Object owner, Activity activity) {
        if (activity.isFinishing() || activity.isDestroyed()) return false;
        WeakReference<EditText> ref = DRAFTS.get(owner);
        if (ref == null || ref.get() == null) ref = DRAFTS.get(activity);
        pendingDraft = ref == null ? new WeakReference<>(null) : ref;
        pendingUpload = java.util.UUID.randomUUID().toString();
        activity.startActivity(new Intent(activity,MediaUploadWebActivity.class)
                .putExtra("provider","gigafile").putExtra("postingUpload",pendingUpload));
        return true;
    }

    static boolean pasteUpload(String request, String url, String password) {
        if (request == null || !request.equals(pendingUpload)) return false;
        EditText body = pendingDraft.get();
        clearUpload(request);
        Activity activity = body == null ? null : NativeToolTabs.activity(body.getContext());
        if (activity == null || activity.isDestroyed() || activity.isFinishing()
                || !body.isAttachedToWindow() || !MediaUploadWebPolicy.gigaShare(url)) return false;
        insertShare(body,url,password);
        return true;
    }

    static void insertShare(EditText body, String url, String password) {
        android.text.Editable text = body.getText();
        int position = body.getSelectionEnd();
        if (position < 0 || position > text.length()) position = text.length();
        String share = url;
        if (password != null && password.matches("[A-Za-z0-9]{1,4}"))
            share += "\nダウンロードパスワード：" + password;
        if (position > 0 && text.charAt(position-1) != '\n') share = "\n" + share;
        if (position < text.length() && text.charAt(position) != '\n') share += "\n";
        text.insert(position,share);
    }

    static void clearUpload(String request) {
        if (request == null || !request.equals(pendingUpload)) return;
        pendingUpload = null;
        pendingDraft.clear();
    }

    private static boolean buttonEnabled(Activity activity) {
        return SettingsProfiles.prefs(activity).getBoolean(SHOW_BUTTON,false);
    }

    static boolean openLink(android.content.Context context, String url) {
        if (!MediaUploadWebPolicy.gigaShare(url)) return false;
        Intent intent = new Intent(Intent.ACTION_VIEW,android.net.Uri.parse(url))
                .addCategory(Intent.CATEGORY_BROWSABLE);
        prepareLink(context,intent);
        if (NativeToolTabs.activity(context) == null) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        try { context.startActivity(intent); }
        catch (android.content.ActivityNotFoundException unavailable) {
            android.widget.Toast.makeText(context,"リンクを開けるアプリがありません",android.widget.Toast.LENGTH_SHORT).show();
        }
        return true;
    }

    static void prepareLink(android.content.Context context, Intent intent) {
        int display = mode(context);
        intent.setComponent(null);
        intent.setPackage(null);
        intent.removeExtra("android.support.customtabs.extra.SESSION");
        intent.removeExtra("android.support.customtabs.extra.SESSION_ID");
        if (display != EXTERNAL) intent.setClass(context,MediaUploadWebActivity.class)
                .putExtra("provider","gigafile").putExtra("sharePage",intent.getDataString())
                .putExtra("directGiga",display == DIRECT);
    }

    static int mode(android.content.Context context) {
        int mode = SettingsProfiles.prefs(context).getInt(LINK_MODE, IN_APP);
        return mode >= IN_APP && mode <= DIRECT ? mode : IN_APP;
    }

    static void bindLinkMode(Activity activity, android.widget.Button button) {
        Runnable label = () -> button.setText(MODE_LABEL + "  " + LINK_MODES[mode(activity)]);
        label.run();
        button.setOnClickListener(view -> new HaiagaruDialog.Builder(activity)
                .setTitle(MODE_LABEL)
                .setSingleChoiceItems(LINK_MODES,mode(activity),(dialog,which) -> {
                    SettingsProfiles.prefs(activity).edit().putInt(LINK_MODE,which).apply();
                    label.run();
                    dialog.dismiss();
                }).setNegativeButton("閉じる",null).show());
    }

    private GigaFilePosting() {}
}
