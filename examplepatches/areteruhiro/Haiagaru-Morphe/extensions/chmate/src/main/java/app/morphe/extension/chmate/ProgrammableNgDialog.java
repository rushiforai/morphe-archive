package app.morphe.extension.chmate;

import android.app.Activity;
import android.app.AlertDialog;
import android.text.InputType;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Spinner;
import android.widget.ArrayAdapter;
import android.widget.TextView;
import android.widget.Toast;
import java.util.ArrayList;
import java.util.List;

/** Settings UI kept independent of ChMate resources so it survives resource obfuscation. */
final class ProgrammableNgDialog {
    private ProgrammableNgDialog() {}

    static void show(Activity activity) {
        ArrayList<ProgrammableNgRuleSet.Rule> working =
                new ArrayList<>(ProgrammableNgController.currentRules().rules);
        showList(activity, ProgrammableNgController.isEnabled(), working);
    }

    private static void showList(
            Activity activity, boolean enabled, ArrayList<ProgrammableNgRuleSet.Rule> rules
    ) {
        LinearLayout content = column(activity);
        final AlertDialog[] host = new AlertDialog[1];
        CheckBox master = new CheckBox(activity);
        master.setText("高度なNGルールを有効にする");
        master.setChecked(enabled);
        content.addView(master);

        TextView description = new TextView(activity);
        description.setText("通常のNG機能では表せない条件を追加できます。\n"
                + "・スレタイまたはレス本文を判定\n"
                + "・全板または指定した板だけに適用\n"
                + "・設定と判定は端末内だけで処理");
        content.addView(description, matchWrap());

        for (int index = 0; index < rules.size(); index++) {
            final int position = index;
            ProgrammableNgRuleSet.Rule rule = rules.get(index);
            Button edit = new Button(activity);
            edit.setAllCaps(false);
            edit.setText((rule.enabled ? "● 有効  " : "○ 無効  ") + rule.name + "\n"
                    + ("body".equals(rule.target) ? "レス本文" : "スレタイ") + " / "
                    + (rule.allBoards ? "すべての板" : "指定した板"));
            edit.setOnClickListener(view -> {
                if (host[0] != null) host[0].dismiss();
                editRule(activity, master.isChecked(), rules, position);
            });
            content.addView(edit, matchWrap());
        }

        Button add = new Button(activity);
        add.setAllCaps(false);
        add.setText("NG条件を追加");
        add.setEnabled(rules.size() < ProgrammableNgRuleSet.MAX_RULES);
        add.setOnClickListener(view -> {
            if (host[0] != null) host[0].dismiss();
            chooseTemplate(activity, master.isChecked(), rules);
        });
        content.addView(add, matchWrap());

        if (rules.isEmpty()) {
            TextView empty = new TextView(activity);
            empty.setText("まだ条件はありません。「NG条件を追加」から、キーワードなどのひな形を選べます。");
            content.addView(empty, matchWrap());
        }

        TextView status = new TextView(activity);
        status.setText(ProgrammableNgController.status());
        content.addView(status, matchWrap());

        host[0] = new AlertDialog.Builder(activity)
                .setTitle("高度なNGルール")
                .setView(scroller(activity, content))
                .setPositiveButton("保存", (dialog, which) -> {
                    try {
                        ProgrammableNgController.save(master.isChecked(), rules);
                        Toast.makeText(activity, "保存しました", Toast.LENGTH_SHORT).show();
                    } catch (RuntimeException error) {
                        Toast.makeText(activity, error.getMessage(), Toast.LENGTH_LONG).show();
                    }
                })
                .setNegativeButton(android.R.string.cancel, null)
                .create();
        host[0].show();
    }

    private static void chooseTemplate(
            Activity activity, boolean masterEnabled, ArrayList<ProgrammableNgRuleSet.Rule> rules
    ) {
        String[] templates = {
                "スレタイにキーワードを含む",
                "レス本文にキーワードを含む",
                "正規表現で判定する",
                "エッヂの記者IDで判定する",
                "JavaScriptを最初から書く"
        };
        new AlertDialog.Builder(activity)
                .setTitle("どの条件を作りますか？")
                .setItems(templates, (dialog, which) -> {
                    rules.add(ProgrammableNgController.templateRule(which));
                    editRule(activity, masterEnabled, rules, rules.size() - 1);
                })
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    private static void editRule(
            Activity activity, boolean masterEnabled, ArrayList<ProgrammableNgRuleSet.Rule> rules,
            int position
    ) {
        ProgrammableNgRuleSet.Rule original = rules.get(position);
        LinearLayout content = column(activity);
        CheckBox enabled = check(activity, content, "この条件を有効にする", original.enabled);
        EditText name = labeledField(activity, content, "条件の名前", original.name, false);

        TextView targetLabel = new TextView(activity);
        targetLabel.setText("どこを判定しますか？");
        content.addView(targetLabel);
        Spinner target = new Spinner(activity);
        target.setAdapter(new ArrayAdapter<>(activity,
                android.R.layout.simple_spinner_dropdown_item, new String[]{"スレタイ", "レス本文"}));
        target.setSelection("body".equals(original.target) ? 1 : 0);
        content.addView(target, matchWrap());

        CheckBox allBoards = check(activity, content, "すべての板に適用する", original.allBoards);
        EditText boards = labeledField(activity, content,
                "適用する板のURL（1行に1つ）", original.boards, true);
        boards.setEnabled(!original.allBoards);
        allBoards.setOnCheckedChangeListener((button, checked) -> boards.setEnabled(!checked));
        TextView scriptHelp = new TextView(activity);
        scriptHelp.setText("判定式（該当するとき true）\n"
                + "text: スレタイまたは本文\n"
                + "options: boardUrl, threadId, resCount, speed, posterId, responseNumber, responseId");
        content.addView(scriptHelp, matchWrap());
        EditText script = field(activity, content,
                "function (text, options) { ... }", original.script, true);
        script.setMinLines(9);
        script.setInputType(InputType.TYPE_CLASS_TEXT
                | InputType.TYPE_TEXT_FLAG_MULTI_LINE | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);

        AlertDialog dialog = new AlertDialog.Builder(activity)
                .setTitle(original.name)
                .setView(scroller(activity, content))
                .setPositiveButton("一覧に反映", null)
                .setNeutralButton("直近のデータでテスト", null)
                .setNegativeButton("この条件を削除", (ignored, which) -> {
                    rules.remove(position);
                    showList(activity, masterEnabled, rules);
                })
                .create();
        dialog.setOnShowListener(ignored -> {
            dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(view -> {
                try {
                    rules.set(position, build(original.id, name, target, enabled, allBoards, boards, script));
                    dialog.dismiss();
                    showList(activity, masterEnabled, rules);
                } catch (RuntimeException error) {
                    Toast.makeText(activity, error.getMessage(), Toast.LENGTH_LONG).show();
                }
            });
            dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setOnClickListener(view -> {
                try {
                    Toast.makeText(activity, ProgrammableNgController.preview(
                            build(original.id, name, target, enabled, allBoards, boards, script)),
                            Toast.LENGTH_LONG).show();
                } catch (RuntimeException error) {
                    Toast.makeText(activity, error.getMessage(), Toast.LENGTH_LONG).show();
                }
            });
        });
        dialog.show();
    }

    private static ProgrammableNgRuleSet.Rule build(
            String id, EditText name, Spinner target, CheckBox enabled, CheckBox allBoards,
            EditText boards, EditText script
    ) {
        return new ProgrammableNgRuleSet.Rule(id, name.getText().toString(),
                target.getSelectedItemPosition() == 1 ? "body" : "title",
                enabled.isChecked(), allBoards.isChecked(), boards.getText().toString(),
                script.getText().toString());
    }

    private static LinearLayout column(Activity activity) {
        LinearLayout result = new LinearLayout(activity);
        result.setOrientation(LinearLayout.VERTICAL);
        int padding = (int) (16 * activity.getResources().getDisplayMetrics().density + 0.5f);
        result.setPadding(padding, padding, padding, padding);
        return result;
    }

    private static ScrollView scroller(Activity activity, LinearLayout content) {
        ScrollView result = new ScrollView(activity);
        result.addView(content);
        return result;
    }

    private static CheckBox check(
            Activity activity, LinearLayout parent, String label, boolean checked
    ) {
        CheckBox result = new CheckBox(activity);
        result.setText(label);
        result.setChecked(checked);
        parent.addView(result, matchWrap());
        return result;
    }

    private static EditText field(
            Activity activity, LinearLayout parent, String hint, String value, boolean multiline
    ) {
        EditText result = new EditText(activity);
        result.setHint(hint);
        result.setText(value == null ? "" : value);
        result.setSingleLine(!multiline);
        if (multiline) result.setMinLines(3);
        parent.addView(result, matchWrap());
        return result;
    }

    private static EditText labeledField(
            Activity activity, LinearLayout parent, String label, String value, boolean multiline
    ) {
        TextView title = new TextView(activity);
        title.setText(label);
        parent.addView(title, matchWrap());
        return field(activity, parent, label, value, multiline);
    }

    private static LinearLayout.LayoutParams matchWrap() {
        return new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
    }
}
