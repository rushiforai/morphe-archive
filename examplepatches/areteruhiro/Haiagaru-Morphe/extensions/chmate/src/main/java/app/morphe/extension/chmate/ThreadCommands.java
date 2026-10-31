package app.morphe.extension.chmate;


import android.content.Context;
import android.content.SharedPreferences;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/** Version-pinned native binding adapters: never infer a posting target from draft text. */
public final class ThreadCommands {
    private static final String TAG = "haiagaru.thread.commands";
    private ThreadCommands() {}
    private static Object field(Object object, String name) throws Exception {
        for (Class<?> type = object.getClass(); type != null; type = type.getSuperclass()) {
            try { Field f = type.getDeclaredField(name); f.setAccessible(true); return f.get(object); }
            catch (NoSuchFieldException ignored) { }
        }
        throw new NoSuchFieldException(name);
    }
    private static Object unwrap(Object value) throws Exception {
        for (Class<?> iface : value.getClass().getInterfaces()) for (Method m : iface.getMethods()) {
            if (m.getParameterTypes().length == 0 && (m.getName().equals("getValue") || m.getName().equals("e"))) {
                m.setAccessible(true); return m.invoke(value);
            }
        }
        throw new IllegalStateException("Unknown posting model wrapper");
    }
    public static void attach(Object fragment, View root) {
        PostMailInput.apply(root);
        root.post(() -> attachReady(fragment, root));
    }
    private static String postingUrl(Object target, boolean thread, String threadMethod, String boardMethod) throws Exception {
        return (String) target.getClass().getMethod(thread ? boardMethod : threadMethod).invoke(target);
    }
    private static void attachReady(Object fragment, View root) {
        PostMailInput.apply(root);
        try {
            if (root.findViewWithTag(TAG) != null) return;
            Object binding, model;
            String bodyName, nameName, targetName, modeName, urlMethod, boardUrlMethod;
            if (fragment.getClass().getName().equals("o.p9ExternalSyntheticLambda6")) {
                binding = field(fragment, "d"); model = field(fragment, "y");
                bodyName = "f"; nameName = "p"; targetName = "w"; modeName = "o"; urlMethod = "i";
                boardUrlMethod = "i";
            } else {
                boolean modern242;
                try {
                    Class.forName("jp.syoboi.a2chMate.feature.resedit.ResEditFragmentViewModel", false, fragment.getClass().getClassLoader());
                    modern242 = true;
                } catch (ClassNotFoundException ignored) { modern242 = false; }
                if (modern242) {
                    binding = field(fragment, "i"); model = unwrap(field(fragment, "y"));
                    bodyName = "b"; nameName = "n"; targetName = "T"; modeName = "x"; urlMethod = "A";
                    boardUrlMethod = "y";
                } else {
                    binding = field(fragment, "h"); model = unwrap(field(fragment, "u"));
                    bodyName = "a"; nameName = "l"; targetName = "P"; modeName = "r"; urlMethod = "G";
                    boardUrlMethod = "v";
                }
            }
            Object target = field(model, targetName);
            Object mode = field(model, modeName);
            if (!(mode instanceof Enum)) return;
            boolean thread = ((Enum<?>) mode).name().equals("Thread");
            // A new thread has no thread ID: the native thread URL is null.
            // Use the board URL for commands, per-board settings and authentication.
            String url = postingUrl(target, thread, urlMethod, boardUrlMethod);
            EditText body = (EditText) field(binding, bodyName);
            ExternalBoardAuth.target(fragment, url, body);
            BeAutoLogout.editor(fragment, target, thread, url);
            // Commands belong only to thread creation, not ordinary replies.
            // Keep target registration above for external-board authentication.
            if (!thread||!FeatureSwitches.enabled("threadCommandsEnabled",true)) return;
            EditText name = (EditText) field(binding, nameName);
            String profile = ThreadCommandRules.profile(url);
            // Insert alongside the body container, preserving its native listeners and layout params.
            View anchor = body;
            while (anchor.getParent() instanceof ViewGroup) {
                ViewGroup parent = (ViewGroup) anchor.getParent();
                if (parent instanceof LinearLayout && ((LinearLayout) parent).getOrientation() == LinearLayout.VERTICAL) {
                    Button button = new Button(root.getContext());
                    button.setTag(TAG); button.setText("コマンド（" + serviceName(profile) + "）");
                    button.setOnClickListener(v -> choose(body, name, profile, url, thread));
                    parent.addView(button, parent.indexOfChild(anchor), new LinearLayout.LayoutParams(-1, -2));
                    return;
                }
                anchor = parent;
            }
        } catch (Exception e) {
            android.util.Log.w("Haiagaru", "Thread command UI unavailable", e);
        }
    }
    private static void choose(EditText body, String profile) {
        choose(body, null, profile, "", true);
    }
    private static String serviceName(String profile) {
        switch (profile) {
            case "5ch": return "5ch"; case "edge": return "エッヂ"; case "open2ch": return "おーぷん2ch";
            case "shitaraba": return "したらば"; case "afternoontea": return "AfternoonTea"; default: return "カスタム";
        }
    }
    private static void choose(EditText body, EditText name, String profile, String url, boolean thread) {
        java.util.ArrayList<String> labels = new java.util.ArrayList<>();
        java.util.ArrayList<Integer> indices = new java.util.ArrayList<>();
        String[] all = ThreadCommandRules.labels(profile);
        for (int i = 0; i < all.length; i++) if (ThreadCommandRules.available(profile, i, thread)) { labels.add(all[i]); indices.add(i); }
        HaiagaruDialog.Builder chooser = new HaiagaruDialog.Builder(body.getContext()).setTitle((thread ? "スレ立て" : "レス") + "コマンド・" + serviceName(profile))
                .setItems(labels.toArray(new String[0]), (d, index) -> edit(body, name, profile, url, indices.get(index)))
                .setNeutralButton("仕様・使い方", (d, w) -> help(body.getContext(), profile))
                .setNegativeButton("閉じる", null);
        if (!ThreadCommandRules.settingsUrl(url).isEmpty())
            chooser.setPositiveButton("板設定を取得", (d, w) -> ThreadCommandSettings.show(body.getContext(), url));
        chooser.show();
    }
    private static void help(Context c, String profile) {
        String message;
        switch (profile) {
            case "5ch": message = "!extendは板設定BBS_USE_VIPQ2が2以上の場合に使用します。どんぐりの0は必要レベルで、編集できます。1/2は大砲可、3/4は不可。名前欄用は本文に入りません。!donguriは大砲不可のスレでも攻撃対象になる場合があります。\nhttps://donguri.wikiru.jp/?command"; break;
            case "edge": message = "!metadent:v: はレベル、vv: は識別文字列、vvv: は両方を表示。スレ立て本文用です。\nhttps://github.com/edginer/eddiner/blob/main/src/routes/bbs_cgi.rs"; break;
            case "open2ch": message = "!jienはスレ立て本文用。!aku／!kaijoはスレ主・副主等のレス本文用で、対象レス番号を指定します。事前アク禁の引継ぎは本文コマンドではなくWebの次スレ作成フォームで行います。\nhttps://onj-shadowverse.game-info.wiki/d/%21aku\nhttps://w.atwiki.jp/openj3/pages/533.html"; break;
            case "shitaraba": message = "本文に入れる共通のスレ設定コマンドは確認できていません。管理画面の設定と本文コマンドは別です。自由入力はその板で公開された仕様を確認して使ってください。\nhttps://rentalbbs.shitaraba.com/rule/help/"; break;
            case "afternoontea": message = "共通の本文コマンド仕様は確認できていません。板のお知らせ・ローカルルールを確認してください。\nhttps://afternoontea.st/"; break;
            default: message = "自由入力は掲示板固有の仕様を確認して使ってください。";
        }
        android.widget.TextView view = new android.widget.TextView(c); view.setPadding(24, 16, 24, 16);
        view.setAutoLinkMask(android.text.util.Linkify.WEB_URLS); view.setText(message);
        view.setMovementMethod(android.text.method.LinkMovementMethod.getInstance());
        android.widget.ScrollView scroll = new android.widget.ScrollView(c); scroll.addView(view);
        new HaiagaruDialog.Builder(c).setTitle("コマンドの仕様・注意").setView(scroll).setPositiveButton("閉じる", null).show();
    }
    private static HaiagaruDialog edit(EditText body, String profile, int index) {
        return edit(body, null, profile, "", index);
    }
    private static HaiagaruDialog edit(EditText body, EditText name, String profile, String url, int index) {
        Context c = body.getContext();
        SharedPreferences prefs = c.getSharedPreferences("haiagaru_thread_commands", 0);
        String legacyKey = profile + "." + index;
        String board = ThreadCommandRules.boardKey(url);
        String key = board.isEmpty() ? legacyKey : "board." + board + "." + index;
        boolean toName = ThreadCommandRules.nameCommand(profile, index);
        String initial = ThreadCommandRules.values(profile)[index];
        EditText input = new EditText(c);
        input.setInputType(android.text.InputType.TYPE_CLASS_TEXT | android.text.InputType.TYPE_TEXT_FLAG_MULTI_LINE);
        input.setSingleLine(false); input.setMinLines(3); input.setMaxLines(8);
        input.setGravity(android.view.Gravity.TOP | android.view.Gravity.START);
        input.setImeOptions(android.view.inputmethod.EditorInfo.IME_FLAG_NO_ENTER_ACTION);
        input.setText(ThreadCommandRules.editValue(initial, prefs.getString(key, prefs.getString(legacyKey, null))));
        HaiagaruDialog dialog = new HaiagaruDialog.Builder(c).setTitle("コマンドを編集して追加")
                .setMessage((toName ? "名前欄へ追加します。!donguriは大砲不可のスレでも攻撃対象になる場合があります。" : "本文の先頭に追加します。ワッチョイ候補は3行です。改行・同じコマンドの再追加ができます。")
                        + "編集内容は板・候補ごとに保存します。IP表示はIPが公開されます。板設定によっては使えません。" + (profile.equals("5ch") ? "!extendにはBBS_USE_VIPQ2=2以上が必要です。" : ""))
                .setView(input).setNegativeButton("キャンセル", null)
                .setNeutralButton("初期値", null).setPositiveButton(toName ? "名前欄に追加" : "本文に追加", null).create();
        dialog.setOnShowListener(d -> {
            dialog.getButton(-3).setOnClickListener(v -> input.setText(initial));
            dialog.getButton(-1).setOnClickListener(v -> {
                String command = ThreadCommandRules.normalize(input.getText().toString());
                if (command.isEmpty() || command.length() > 4096) {
                    input.setError("コマンドを入力してください（改行可・4096文字まで）"); return;
                }
                if (command.contains("{レス番号}")) { input.setError("{レス番号}を対象の数字に置き換えてください（例：!aku31）"); return; }
                if (toName && (name == null || command.contains("\n"))) { input.setError("名前欄が取得できないか、改行が含まれています"); return; }
                String draft = body.getText().toString();
                if (!toName && ThreadCommandRules.conflicts(draft, command)) {
                    input.setError("同系統のコマンドが本文にあります。本文で編集・削除してください"); return;
                }
                prefs.edit().putString(key, command).apply();
                if (toName) { name.getText().append((name.length() == 0 ? "" : " ") + command); name.setSelection(name.length()); }
                else { body.getText().insert(0, command + "\n"); body.setSelection(command.length() + 1); }
                dialog.dismiss();
            });
        });
        dialog.show();
        return dialog;
    }
}
