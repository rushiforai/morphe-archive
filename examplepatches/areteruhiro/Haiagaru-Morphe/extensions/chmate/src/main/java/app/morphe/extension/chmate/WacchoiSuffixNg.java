package app.morphe.extension.chmate;


import android.content.Context;
import android.widget.Toast;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.ArrayAdapter;
import android.widget.AdapterView;
import android.view.View;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Explicit suffix registration; long press retains the copy-and-edit workflow. */
public final class WacchoiSuffixNg {
    private WacchoiSuffixNg() {}

    // Native NGWord flags: regular expression, chain replies, transparent NG.
    private static final int REGEX = 0x20;
    private static final int CHAIN = 0x08;
    private static final int HIDDEN = 0x01;

    static short registrationFlags(short previous, boolean chain, boolean hidden) {
        return (short) ((previous & ~(0x70 | CHAIN | HIDDEN)) | REGEX
                | (chain ? CHAIN : 0) | (hidden ? HIDDEN : 0));
    }

    static short registrationFlags(short previous, boolean regex, boolean enabled, boolean chain, boolean hidden) {
        return (short) ((previous & ~(0x70 | 4 | CHAIN | HIDDEN)) | (regex ? REGEX : 0x10)
                | (enabled ? 0 : 4) | (chain ? CHAIN : 0) | (hidden ? HIDDEN : 0));
    }

    static String regexFragment(String value) {
        // Keep the familiar -aabb spelling, while escaping symbols such as + and |.
        StringBuilder result = new StringBuilder();
        for (char c : value.toCharArray()) {
            if ("\\.[]{}()*+?^$|".indexOf(c) >= 0) result.append('\\');
            result.append(c);
        }
        return result.toString();
    }

    static String stripTrailingSeparators(String base) {
        while (base.endsWith("|")) {
            int slashes = 0;
            for (int i = base.length() - 2; i >= 0 && base.charAt(i) == '\\'; i--) slashes++;
            if ((slashes & 1) != 0) break;
            base = base.substring(0, base.length() - 1);
        }
        return base;
    }

    static String appendRegex(String base, String fragment) {
        base = stripTrailingSeparators(base);
        if (base.isEmpty()) return fragment;
        return "(?:" + base + ")|(?:" + fragment + ")";
    }

    public static String suffix(String query) {
        if (query == null) return null;
        Matcher match = Pattern.compile("(?<![A-Za-z0-9])[A-Za-z0-9]{4}-([^\\s()（）<>]{4})(?=$|[\\s()（）<>])").matcher(query);
        return match.find() ? match.group(1) : null;
    }

    public static String expression(String suffix) {
        return "(?<![A-Za-z0-9])[A-Za-z0-9]{4}-(?-i:" + Pattern.quote(suffix)
                + ")(?=$|[\\s()（）<>])";
    }
    public static String prefix(String query) {
        if(query==null)return null;
        Matcher match=Pattern.compile("(?<![A-Za-z0-9])([A-Za-z0-9]{4})-[^\\s()（）<>]{4}(?=$|[\\s()（）<>])").matcher(query);
        return match.find()?match.group(1):null;
    }
    public static void confirmPrefix(Context context,String query,String board){confirmPart(context,query,board,true);}

    public static String clipboardValue(String query) {
        String value = suffix(query);
        return value == null ? null : "-" + value + "|";
    }

    public static void confirm(Context context, String query) {
        confirm(context, query, null);
    }

    public static void confirm(Context context, String query, String currentBoard) {
        confirmPart(context,query,currentBoard,false);
    }
    private static void confirmPart(Context context,String query,String currentBoard,boolean upper) {
        String suffix = upper?prefix(query):suffix(query);
        String token=upper?suffix+"-":"-"+suffix;
        android.app.Activity activity = Haiagaru.toolbarActivity(context);
        if (suffix == null || activity == null || activity.isFinishing() || activity.isDestroyed()) return;
        try {
            NativeNgStore store = new NativeNgStore(activity, "NAME");
            LinearLayout content = new LinearLayout(activity);
            content.setOrientation(LinearLayout.VERTICAL);
            int pad = Math.round(16 * activity.getResources().getDisplayMetrics().density);
            content.setPadding(pad, 0, pad, 0);
            CheckBox enabled = new CheckBox(activity);
            enabled.setText("有効"); enabled.setChecked(true); content.addView(enabled);
            RadioGroup mode = new RadioGroup(activity); mode.setOrientation(LinearLayout.HORIZONTAL);
            RadioButton literal = new RadioButton(activity); literal.setId(View.generateViewId()); literal.setText("文字列");
            RadioButton regex = new RadioButton(activity); regex.setId(View.generateViewId()); regex.setText("正規表現");
            mode.addView(literal); mode.addView(regex); mode.check(literal.getId()); content.addView(mode);
            EditText text = new EditText(activity); text.setSingleLine(true); text.setText(token); content.addView(text);
            CheckBox chain = new CheckBox(activity); chain.setText("連鎖"); content.addView(chain);
            CheckBox hidden = new CheckBox(activity); hidden.setText("非表示（あぼーん扱いにしない）"); content.addView(hidden);
            NgBoardScopePicker scope = new NgBoardScopePicker(activity, currentBoard, currentBoard);
            content.addView(scope);
            // Board scope is essential to registration, not optional help below the fold.
            content.removeView(scope);
            content.addView(scope, 0);
            TextView baseLabel = new TextView(activity); baseLabel.setText("追加先（同じ板・有効／連鎖／非表示設定の正規表現NG）"); content.addView(baseLabel);
            Spinner base = new Spinner(activity); content.addView(base);
            List<NativeNgStore.Entry> choices = new ArrayList<>();
            Runnable refresh = () -> {
                choices.clear();
                List<String> labels = new ArrayList<>(); labels.add("新規登録");
                try {
                    short flags = registrationFlags((short) 0, true, enabled.isChecked(), chain.isChecked(), hidden.isChecked());
                    for (NativeNgStore.Entry entry : store.entries()) {
                        if (entry.flags == flags && Objects.equals(entry.board, scope.value())) {
                            choices.add(entry); labels.add(entry.pattern);
                        }
                    }
                } catch (IllegalArgumentException invalidScope) {
                    // A selection is required before offering existing append targets.
                } catch (ReflectiveOperationException error) { android.util.Log.w("Haiagaru", "NG choices", error); }
                ArrayAdapter<String> adapter = new ArrayAdapter<>(activity, android.R.layout.simple_spinner_item, labels);
                adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item); base.setAdapter(adapter);
                base.setVisibility(regex.isChecked() ? View.VISIBLE : View.GONE);
                baseLabel.setVisibility(regex.isChecked() ? View.VISIBLE : View.GONE);
            };
            mode.setOnCheckedChangeListener((group, id) -> {
                String value = text.getText().toString();
                if (regex.isChecked() && value.equals(token)) text.setText(regexFragment(value));
                if (literal.isChecked() && value.equals(regexFragment(token))) text.setText(token);
                refresh.run();
            });
            enabled.setOnCheckedChangeListener((button, checked) -> refresh.run());
            chain.setOnCheckedChangeListener((button, checked) -> refresh.run());
            hidden.setOnCheckedChangeListener((button, checked) -> refresh.run());
            scope.onChanged(refresh);
            TextView help = new TextView(activity);
            help.setText("NGNameを文字列で登録する人は\n-aabb\nNGのたびに新規登録\n―――――――――――――――――――\nNGNameを正規表現で登録する人は\n-aabb|\nベースとなるNGのところに追加登録\n\n正規表現では追加先を選択できます。末尾の | は追記用の区切りです。空の条件は保存しません。\nこのNG項目を長押しすると、下4桁をコピーして従来のNG編集画面を開きます。");
            if(upper)help.setText("上4桁は「aabb-」の形で登録します。\n文字列はNGごとに新規登録、正規表現は既存NGへの追加も選べます。対象板・有効／連鎖／非表示も指定できます。\n上4桁は複数の投稿者で共通することがあります。対象板と登録内容を確認してください。");
            content.addView(help);
            ScrollView scroll = new ScrollView(activity); scroll.addView(content);
            HaiagaruDialog dialog = new HaiagaruDialog.Builder(activity).setTitle("NGName追加")
                    .setView(scroll).setNegativeButton("キャンセル", null).setPositiveButton("OK", null).create();
            dialog.setOnShowListener(d -> dialog.getButton(HaiagaruDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
                try {
                    String value = text.getText().toString();
                    if (value.trim().isEmpty()) { text.setError("登録文字列を入力してください"); return; }
                    NativeNgStore.Entry target = regex.isChecked() && base.getSelectedItemPosition() > 0
                            ? choices.get(base.getSelectedItemPosition() - 1) : null;
                    List<NativeNgStore.Entry> current = store.entries();
                    if (target != null && current.stream().noneMatch(target::same))
                        throw new IllegalStateException("追加先が変更されました。画面を開き直してください");
                    String pattern = regex.isChecked() ? stripTrailingSeparators(value) : value;
                    if (pattern.isEmpty()) { text.setError("空の正規表現は登録できません"); return; }
                    if (target != null) pattern = appendRegex(target.pattern, pattern);
                    if (regex.isChecked()) Pattern.compile(pattern);
                    short flags = registrationFlags((short) 0, regex.isChecked(), enabled.isChecked(), chain.isChecked(), hidden.isChecked());
                    String board = scope.value();
                    for (NativeNgStore.Entry entry : current) {
                        if (entry.pattern.equals(pattern) && entry.flags == flags && Objects.equals(entry.board, board)) {
                            Toast.makeText(activity, "同じNGNameが登録済みです", Toast.LENGTH_SHORT).show(); return;
                        }
                    }
                    if (target == null && current.size() >= Haiagaru.getNgRegistrationLimit())
                        throw new IllegalStateException("NGNameの登録上限に達しています");
                    store.update(target == null ? null : target.nativeItem, store.item(pattern, flags,
                            target == null ? System.currentTimeMillis() : target.timestamp, board));
                    dialog.dismiss(); Toast.makeText(activity, "NGNameに登録しました", Toast.LENGTH_SHORT).show();
                } catch (ReflectiveOperationException | RuntimeException error) {
                    android.util.Log.w("Haiagaru", "NG suffix registration", error);
                    Toast.makeText(activity, "登録できませんでした: " + error.getMessage(), Toast.LENGTH_LONG).show();
                }
            }));
            refresh.run(); dialog.show();
        } catch (ReflectiveOperationException | RuntimeException error) {
            android.util.Log.w("Haiagaru", "NG suffix dialog", error);
            Toast.makeText(activity, "NG追加画面を開けませんでした", Toast.LENGTH_LONG).show();
        }
    }

    public static void copyAndEdit(Context context, String query) {
        String copied = clipboardValue(query);
        if (copied == null) return;
        android.app.Activity activity = Haiagaru.toolbarActivity(context);
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
            Toast.makeText(context, "表示中の画面からもう一度お試しください", Toast.LENGTH_SHORT).show();
            return;
        }
        try {
            android.content.ClipboardManager clipboard = (android.content.ClipboardManager)
                    activity.getSystemService(Context.CLIPBOARD_SERVICE);
            if (clipboard == null) throw new IllegalStateException("Clipboard unavailable");
            clipboard.setPrimaryClip(android.content.ClipData.newPlainText("ﾜｯﾁｮｲ下4桁", copied));
            try {
                NativeNgEditor.openName(activity);
                Toast.makeText(activity, copied + " をコピーしました。既存のNGへ追記できます。"
                        + "正規表現で保存する場合、末尾の | は次の条件を続けるか削除してください。",
                        Toast.LENGTH_LONG).show();
            } catch (ReflectiveOperationException | RuntimeException error) {
                android.util.Log.w("Haiagaru", "Cannot open native NGName editor", error);
                Toast.makeText(activity, copied + " をコピーしました。NGネーム設定を手動で開いてください。",
                        Toast.LENGTH_LONG).show();
            }
        } catch (RuntimeException error) {
            android.util.Log.w("Haiagaru", "Cannot copy Wacchoi suffix", error);
            Toast.makeText(activity, "下4桁をコピーできませんでした", Toast.LENGTH_LONG).show();
        }
    }


    /** 191 persists the item but does not notify the displayed response list itself. */
    static void notifyLegacyNameChange(ClassLoader loader, Object nameType,
            Class<?> itemType, Object previous, Object item) throws ReflectiveOperationException {
        if (!"o.mgExternalSyntheticLambda3".equals(nameType.getClass().getName())) return;
        Class<?> changeType = Class.forName("o.MaxNativeAdLoaderImplcExternalSyntheticLambda0", false, loader);
        Object change = changeType.getConstructor(nameType.getClass(), itemType, itemType)
                .newInstance(nameType, previous, item);
        Object event = Class.forName("o.setRequestListener", false, loader).getField("f").get(null);
        event.getClass().getMethod("b", Object.class).invoke(event, change);
    }
}
