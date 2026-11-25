package dev.abotmaker.ramblerenhancements;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.graphics.Typeface;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Pattern;

/**
 * Dialog builders for v1.2.0 productivity features: Voice Snippets, Find &amp; Replace rules,
 * searchable Local Dictation History viewer, and Max Dictation Duration picker.
 */
final class RamblerProductivityDialogs {
    interface SnippetConsumer {
        void accept(RamblerTextPipeline.SnippetRule rule);
    }

    interface ReplaceRuleConsumer {
        void accept(RamblerTextPipeline.ReplaceRule rule);
    }

    interface IntConsumer {
        void accept(int value);
    }

    interface WordRemoveHandler {
        void remove(String word, Runnable onRemoved);
    }

    private static final int[] DURATION_PRESETS = {0, 120, 180, 300, 600, 900, 1800, -1};
    private static final String[] DURATION_LABELS = {
            "Gboard default",
            "2 minutes (120s)",
            "3 minutes (180s)",
            "5 minutes (300s)",
            "10 minutes (600s)",
            "15 minutes (900s)",
            "30 minutes (1800s)",
            "Custom duration…"
    };

    private RamblerProductivityDialogs() {
    }

    static void showSnippetEditorDialog(
            Activity activity,
            RamblerTextPipeline.SnippetRule existing,
            SnippetConsumer onSave,
            Runnable onDelete) {
        RamblerWaveformDialogs.Palette pal = RamblerWaveformDialogs.palette(activity);
        String id = existing != null ? existing.id : ("snip_" + System.currentTimeMillis());

        LinearLayout container = new LinearLayout(activity);
        container.setOrientation(LinearLayout.VERTICAL);
        container.setPadding(dp(activity, 20), dp(activity, 12), dp(activity, 20), dp(activity, 6));

        container.addView(makeFieldLabel(activity, "Spoken trigger phrase", pal));
        EditText triggerInput = new EditText(activity);
        triggerInput.setHint("e.g. my email");
        triggerInput.setSingleLine(true);
        triggerInput.setText(existing == null ? "" : existing.trigger);
        container.addView(triggerInput, matchWrap());

        TextView expLabel = makeFieldLabel(activity, "Exact expansion text", pal);
        LinearLayout.LayoutParams expLabelParams = matchWrap();
        expLabelParams.topMargin = dp(activity, 12);
        container.addView(expLabel, expLabelParams);

        EditText expansionInput = new EditText(activity);
        expansionInput.setHint("e.g. alex@example.com or https://...");
        expansionInput.setInputType(InputType.TYPE_CLASS_TEXT
                | InputType.TYPE_TEXT_FLAG_MULTI_LINE
                | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        expansionInput.setMinLines(2);
        expansionInput.setMaxLines(6);
        expansionInput.setText(existing == null ? "" : existing.expansion);
        container.addView(expansionInput, matchWrap());

        CheckBox enabledBox = new CheckBox(activity);
        enabledBox.setText("Enabled");
        enabledBox.setTextColor(pal.primary);
        enabledBox.setChecked(existing == null || existing.enabled);
        LinearLayout.LayoutParams enParams = matchWrap();
        enParams.topMargin = dp(activity, 8);
        container.addView(enabledBox, enParams);

        AlertDialog.Builder builder = new AlertDialog.Builder(activity)
                .setTitle(existing == null ? "Add voice snippet" : "Edit voice snippet")
                .setView(container)
                .setPositiveButton("Save", null)
                .setNegativeButton("Cancel", null);
        if (existing != null && onDelete != null) {
            builder.setNeutralButton("Delete", (ignored, which) -> onDelete.run());
        }
        AlertDialog dialog = builder.create();
        dialog.setOnShowListener(d -> {
            View saveBtn = dialog.getButton(AlertDialog.BUTTON_POSITIVE);
            if (saveBtn != null) {
                saveBtn.setOnClickListener(v -> {
                    String trigger = triggerInput.getText() == null
                            ? ""
                            : triggerInput.getText().toString().trim();
                    String expansion = expansionInput.getText() == null
                            ? ""
                            : expansionInput.getText().toString();
                    if (trigger.isEmpty()) {
                        Toast.makeText(activity, "Enter a spoken trigger phrase.", Toast.LENGTH_SHORT)
                                .show();
                        return;
                    }
                    if (expansion.isEmpty()) {
                        Toast.makeText(activity, "Enter replacement text.", Toast.LENGTH_SHORT)
                                .show();
                        return;
                    }
                    onSave.accept(new RamblerTextPipeline.SnippetRule(
                            id, trigger, expansion, enabledBox.isChecked()));
                    dialog.dismiss();
                });
            }
        });
        dialog.show();
    }

    static void showReplaceRuleEditorDialog(
            Activity activity,
            RamblerTextPipeline.ReplaceRule existing,
            List<RamblerCustomInstructionRules.AppEntry> installedApps,
            Map<String, String> labelMap,
            ReplaceRuleConsumer onSave,
            Runnable onDelete) {
        RamblerWaveformDialogs.Palette pal = RamblerWaveformDialogs.palette(activity);
        String id = existing != null ? existing.id : ("rep_" + System.currentTimeMillis());
        LinkedHashSet<String> scopedPackages = new LinkedHashSet<String>(
                existing != null ? existing.packages : Collections.<String>emptyList());

        ScrollView scroll = new ScrollView(activity);
        LinearLayout container = new LinearLayout(activity);
        container.setOrientation(LinearLayout.VERTICAL);
        container.setPadding(dp(activity, 20), dp(activity, 12), dp(activity, 20), dp(activity, 6));
        scroll.addView(container, matchWrap());

        container.addView(makeFieldLabel(activity, "Find text (or regex)", pal));
        EditText findInput = new EditText(activity);
        findInput.setHint("e.g. g board");
        findInput.setSingleLine(true);
        findInput.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        findInput.setText(existing == null ? "" : existing.find);
        container.addView(findInput, matchWrap());

        TextView repLabel = makeFieldLabel(activity, "Replace with", pal);
        LinearLayout.LayoutParams repLabelParams = matchWrap();
        repLabelParams.topMargin = dp(activity, 12);
        container.addView(repLabel, repLabelParams);

        EditText replaceInput = new EditText(activity);
        replaceInput.setHint("e.g. Gboard (leave empty to remove)");
        replaceInput.setSingleLine(true);
        replaceInput.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        replaceInput.setText(existing == null ? "" : existing.replace);
        container.addView(replaceInput, matchWrap());

        CheckBox regexBox = new CheckBox(activity);
        regexBox.setText("Use regular expression (regex)");
        regexBox.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        regexBox.setTextColor(pal.primary);
        regexBox.setChecked(existing != null && existing.regex);
        LinearLayout.LayoutParams rxParams = matchWrap();
        rxParams.topMargin = dp(activity, 8);
        container.addView(regexBox, rxParams);

        CheckBox caseBox = new CheckBox(activity);
        caseBox.setText("Case-sensitive");
        caseBox.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        caseBox.setTextColor(pal.primary);
        caseBox.setChecked(existing != null && existing.caseSensitive);
        container.addView(caseBox, matchWrap());

        CheckBox enabledBox = new CheckBox(activity);
        enabledBox.setText("Enabled");
        enabledBox.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        enabledBox.setTextColor(pal.primary);
        enabledBox.setChecked(existing == null || existing.enabled);
        container.addView(enabledBox, matchWrap());

        TextView scopeLabel = makeFieldLabel(activity, "App scope (optional)", pal);
        LinearLayout.LayoutParams scopeLabelParams = matchWrap();
        scopeLabelParams.topMargin = dp(activity, 10);
        container.addView(scopeLabel, scopeLabelParams);

        TextView scopeRow = new TextView(activity);
        scopeRow.setPadding(dp(activity, 12), dp(activity, 10), dp(activity, 12), dp(activity, 10));
        scopeRow.setBackground(RamblerWaveformDialogs.tileBackground(activity, false));
        scopeRow.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        scopeRow.setClickable(true);
        scopeRow.setFocusable(true);
        Runnable syncScope = () -> {
            if (scopedPackages.isEmpty()) {
                scopeRow.setText("All apps (tap to restrict to specific apps)");
                scopeRow.setTextColor(pal.secondary);
            } else {
                scopeRow.setText(scopedPackages.size() + " app(s): "
                        + RamblerCustomInstructionRules.formatPackageList(
                        scopedPackages, labelMap, 4));
                scopeRow.setTextColor(pal.primary);
            }
        };
        syncScope.run();
        scopeRow.setOnClickListener(v -> RamblerAppRuleDialogs.showAppPickerDialog(
                activity,
                "Scope rule to apps",
                "Leave unchecked for all apps, or choose specific apps for this find & replace rule.",
                scopedPackages,
                installedApps,
                picked -> {
                    scopedPackages.clear();
                    scopedPackages.addAll(picked);
                    syncScope.run();
                }));
        LinearLayout.LayoutParams scopeRowParams = matchWrap();
        scopeRowParams.topMargin = dp(activity, 4);
        container.addView(scopeRow, scopeRowParams);

        AlertDialog.Builder builder = new AlertDialog.Builder(activity)
                .setTitle(existing == null ? "Add find & replace rule" : "Edit find & replace rule")
                .setView(scroll)
                .setPositiveButton("Save", null)
                .setNegativeButton("Cancel", null);
        if (existing != null && onDelete != null) {
            builder.setNeutralButton("Delete", (ignored, which) -> onDelete.run());
        }
        AlertDialog dialog = builder.create();
        dialog.setOnShowListener(d -> {
            View saveBtn = dialog.getButton(AlertDialog.BUTTON_POSITIVE);
            if (saveBtn != null) {
                saveBtn.setOnClickListener(v -> {
                    String find = findInput.getText() == null ? "" : findInput.getText().toString();
                    String replace = replaceInput.getText() == null
                            ? ""
                            : replaceInput.getText().toString();
                    if (find.isEmpty()) {
                        Toast.makeText(activity, "Enter text or pattern to find.", Toast.LENGTH_SHORT)
                                .show();
                        return;
                    }
                    if (regexBox.isChecked()) {
                        try {
                            Pattern.compile(find);
                        } catch (Throwable err) {
                            Toast.makeText(
                                            activity,
                                            "Invalid regex: " + err.getMessage(),
                                            Toast.LENGTH_LONG)
                                    .show();
                            return;
                        }
                    }
                    onSave.accept(new RamblerTextPipeline.ReplaceRule(
                            id,
                            find,
                            replace,
                            regexBox.isChecked(),
                            caseBox.isChecked(),
                            scopedPackages,
                            enabledBox.isChecked()));
                    dialog.dismiss();
                });
            }
        });
        dialog.show();
    }

    static void showHistoryDialog(
            Activity activity,
            Map<String, String> labelMap,
            Runnable onChanged) {
        RamblerWaveformDialogs.Palette pal = RamblerWaveformDialogs.palette(activity);
        List<RamblerTextPipeline.HistoryEntry> entries =
                new ArrayList<RamblerTextPipeline.HistoryEntry>(
                        RamblerTextPipeline.readHistory(activity));

        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(activity, 16), dp(activity, 10), dp(activity, 16), dp(activity, 4));

        EditText searchInput = new EditText(activity);
        searchInput.setHint("Search dictations or apps…");
        searchInput.setSingleLine(true);
        searchInput.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        root.addView(searchInput, matchWrap());

        TextView hintView = new TextView(activity);
        hintView.setText("Tap an entry to copy. Stored locally on device (last "
                + RamblerTextPipeline.MAX_HISTORY_ENTRIES + ").");
        hintView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
        hintView.setTextColor(pal.secondary);
        LinearLayout.LayoutParams hintParams = matchWrap();
        hintParams.topMargin = dp(activity, 4);
        hintParams.bottomMargin = dp(activity, 8);
        root.addView(hintView, hintParams);

        ScrollView scroll = new ScrollView(activity);
        LinearLayout listBox = new LinearLayout(activity);
        listBox.setOrientation(LinearLayout.VERTICAL);
        scroll.addView(listBox, matchWrap());
        root.addView(scroll, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(activity, 340)));

        SimpleDateFormat fmt = new SimpleDateFormat("MMM d, HH:mm", Locale.getDefault());

        Runnable[] rebuildRef = new Runnable[1];
        rebuildRef[0] = () -> {
            String query = searchInput.getText() == null
                    ? ""
                    : searchInput.getText().toString().trim().toLowerCase(Locale.ROOT);
            listBox.removeAllViews();
            int shown = 0;
            for (RamblerTextPipeline.HistoryEntry entry : entries) {
                String appName = (labelMap != null && !entry.packageName.isEmpty()
                        && labelMap.containsKey(entry.packageName))
                        ? labelMap.get(entry.packageName)
                        : (entry.packageName.isEmpty() ? "Unknown app" : entry.packageName);
                if (!query.isEmpty()
                        && !entry.text.toLowerCase(Locale.ROOT).contains(query)
                        && !appName.toLowerCase(Locale.ROOT).contains(query)
                        && !entry.packageName.toLowerCase(Locale.ROOT).contains(query)) {
                    continue;
                }
                shown++;
                LinearLayout card = new LinearLayout(activity);
                card.setOrientation(LinearLayout.VERTICAL);
                card.setPadding(dp(activity, 12), dp(activity, 10), dp(activity, 12), dp(activity, 10));
                card.setBackground(RamblerWaveformDialogs.tileBackground(activity, false));
                card.setClickable(true);
                card.setFocusable(true);
                card.setOnClickListener(v -> {
                    copyToClipboard(activity, entry.text);
                    Toast.makeText(activity, "Copied to clipboard.", Toast.LENGTH_SHORT).show();
                });

                LinearLayout metaRow = new LinearLayout(activity);
                metaRow.setOrientation(LinearLayout.HORIZONTAL);
                metaRow.setGravity(Gravity.CENTER_VERTICAL);

                TextView meta = new TextView(activity);
                String ts = entry.timestampMs > 0 ? fmt.format(new Date(entry.timestampMs)) : "";
                meta.setText(ts.isEmpty() ? appName : (appName + " · " + ts));
                meta.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
                meta.setTypeface(Typeface.DEFAULT_BOLD);
                meta.setTextColor(pal.accent);
                metaRow.addView(meta, new LinearLayout.LayoutParams(
                        0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));

                TextView delBtn = new TextView(activity);
                delBtn.setText("Delete");
                delBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
                delBtn.setTypeface(Typeface.DEFAULT_BOLD);
                delBtn.setTextColor(pal.secondary);
                delBtn.setPadding(dp(activity, 8), dp(activity, 2), dp(activity, 2), dp(activity, 2));
                delBtn.setOnClickListener(v -> {
                    RamblerTextPipeline.deleteHistoryEntry(activity, entry.id);
                    entries.remove(entry);
                    if (onChanged != null) {
                        onChanged.run();
                    }
                    rebuildRef[0].run();
                });
                metaRow.addView(delBtn);
                card.addView(metaRow);

                TextView body = new TextView(activity);
                body.setText(entry.text);
                body.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
                body.setTextColor(pal.primary);
                LinearLayout.LayoutParams bodyParams = matchWrap();
                bodyParams.topMargin = dp(activity, 4);
                card.addView(body, bodyParams);

                LinearLayout.LayoutParams cardParams = matchWrap();
                cardParams.bottomMargin = dp(activity, 7);
                listBox.addView(card, cardParams);
            }
            if (shown == 0) {
                TextView empty = new TextView(activity);
                empty.setText(entries.isEmpty()
                        ? "No dictations recorded yet."
                        : "No matching dictations.");
                empty.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
                empty.setTextColor(pal.secondary);
                empty.setPadding(dp(activity, 4), dp(activity, 14), dp(activity, 4), dp(activity, 14));
                listBox.addView(empty);
            }
        };

        searchInput.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override
            public void afterTextChanged(Editable s) {
                rebuildRef[0].run();
            }
        });
        rebuildRef[0].run();

        AlertDialog dialog = new AlertDialog.Builder(activity)
                .setTitle("Dictation history (" + entries.size() + ")")
                .setView(root)
                .setPositiveButton("Close", null)
                .setNeutralButton("Clear all", null)
                .create();
        dialog.setOnShowListener(d -> {
            View clearBtn = dialog.getButton(AlertDialog.BUTTON_NEUTRAL);
            if (clearBtn != null) {
                clearBtn.setOnClickListener(v -> {
                    if (entries.isEmpty()) {
                        return;
                    }
                    new AlertDialog.Builder(activity)
                            .setTitle("Clear dictation history?")
                            .setMessage("Delete all " + entries.size() + " saved local dictations?")
                            .setPositiveButton("Clear", (ignored, which) -> {
                                RamblerTextPipeline.clearHistory(activity);
                                entries.clear();
                                dialog.setTitle("Dictation history (0)");
                                if (onChanged != null) {
                                    onChanged.run();
                                }
                                rebuildRef[0].run();
                            })
                            .setNegativeButton("Cancel", null)
                            .show();
                });
            }
        });
        dialog.show();
    }

    static void showSessionDurationDialog(
            Activity activity, int currentSeconds, IntConsumer onSelect) {
        int checked = DURATION_PRESETS.length - 1;
        for (int i = 0; i < DURATION_PRESETS.length - 1; i++) {
            if (DURATION_PRESETS[i] == currentSeconds) {
                checked = i;
                break;
            }
        }
        new AlertDialog.Builder(activity)
                .setTitle("Max dictation session duration")
                .setSingleChoiceItems(DURATION_LABELS, checked, (dialog, which) -> {
                    dialog.dismiss();
                    int chosen = DURATION_PRESETS[which];
                    if (chosen == -1) {
                        showCustomDurationDialog(activity, currentSeconds, onSelect);
                    } else {
                        onSelect.accept(chosen);
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    private static void showCustomDurationDialog(
            Activity activity, int currentSeconds, IntConsumer onSelect) {
        LinearLayout box = new LinearLayout(activity);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(dp(activity, 20), dp(activity, 10), dp(activity, 20), dp(activity, 4));

        EditText input = new EditText(activity);
        input.setHint("Seconds (30–3600, e.g. 600 for 10 min)");
        input.setInputType(InputType.TYPE_CLASS_NUMBER);
        input.setSingleLine(true);
        if (currentSeconds > 0) {
            input.setText(Integer.toString(currentSeconds));
            input.setSelection(input.getText().length());
        }
        box.addView(input, matchWrap());

        new AlertDialog.Builder(activity)
                .setTitle("Custom session duration (seconds)")
                .setView(box)
                .setPositiveButton("Save", (ignored, which) -> {
                    String raw = input.getText() == null ? "" : input.getText().toString().trim();
                    try {
                        int val = Integer.parseInt(raw);
                        if (val < RamblerEnhancementsSettings.MIN_CUSTOM_SESSION_SECONDS
                                || val > RamblerEnhancementsSettings.MAX_CUSTOM_SESSION_SECONDS) {
                            Toast.makeText(
                                            activity,
                                            "Enter between 30 and 3600 seconds.",
                                            Toast.LENGTH_SHORT)
                                    .show();
                            return;
                        }
                        onSelect.accept(val);
                    } catch (NumberFormatException err) {
                        Toast.makeText(activity, "Enter a valid number of seconds.", Toast.LENGTH_SHORT)
                                .show();
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    static void showWordBrowserDialog(
            Activity activity,
            List<String> initialWords,
            WordRemoveHandler onRemove) {
        RamblerWaveformDialogs.Palette pal = RamblerWaveformDialogs.palette(activity);
        List<String> words = new ArrayList<String>(initialWords);
        Collections.sort(words, String.CASE_INSENSITIVE_ORDER);

        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(activity, 16), dp(activity, 10), dp(activity, 16), dp(activity, 4));

        EditText searchInput = new EditText(activity);
        searchInput.setHint("Search " + words.size() + " stored words…");
        searchInput.setSingleLine(true);
        searchInput.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        root.addView(searchInput, matchWrap());

        TextView hintView = new TextView(activity);
        hintView.setText("Tap Remove next to any word to delete it from MUSE_STATS.");
        hintView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
        hintView.setTextColor(pal.secondary);
        LinearLayout.LayoutParams hintParams = matchWrap();
        hintParams.topMargin = dp(activity, 4);
        hintParams.bottomMargin = dp(activity, 8);
        root.addView(hintView, hintParams);

        ScrollView scroll = new ScrollView(activity);
        LinearLayout listBox = new LinearLayout(activity);
        listBox.setOrientation(LinearLayout.VERTICAL);
        scroll.addView(listBox, matchWrap());
        root.addView(scroll, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(activity, 340)));

        final AlertDialog[] dialogRef = new AlertDialog[1];
        Runnable[] rebuildRef = new Runnable[1];
        rebuildRef[0] = () -> {
            String query = searchInput.getText() == null
                    ? ""
                    : searchInput.getText().toString().trim().toLowerCase(Locale.ROOT);
            listBox.removeAllViews();
            int shown = 0;
            for (String word : words) {
                if (!query.isEmpty() && !word.toLowerCase(Locale.ROOT).contains(query)) {
                    continue;
                }
                shown++;
                LinearLayout row = new LinearLayout(activity);
                row.setOrientation(LinearLayout.HORIZONTAL);
                row.setGravity(Gravity.CENTER_VERTICAL);
                row.setPadding(dp(activity, 12), dp(activity, 9), dp(activity, 12), dp(activity, 9));
                row.setBackground(RamblerWaveformDialogs.tileBackground(activity, false));

                TextView label = new TextView(activity);
                label.setText(word);
                label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
                label.setTextColor(pal.primary);
                row.addView(label, new LinearLayout.LayoutParams(
                        0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));

                TextView removeBtn = new TextView(activity);
                removeBtn.setText("Remove");
                removeBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
                removeBtn.setTypeface(Typeface.DEFAULT_BOLD);
                removeBtn.setTextColor(pal.accent);
                removeBtn.setPadding(dp(activity, 10), dp(activity, 4), dp(activity, 2), dp(activity, 4));
                removeBtn.setClickable(true);
                removeBtn.setFocusable(true);
                removeBtn.setOnClickListener(v -> onRemove.remove(word, () -> {
                    words.remove(word);
                    if (dialogRef[0] != null) {
                        dialogRef[0].setTitle("Stored words (" + words.size() + ")");
                    }
                    rebuildRef[0].run();
                }));
                row.addView(removeBtn);

                LinearLayout.LayoutParams rowParams = matchWrap();
                rowParams.bottomMargin = dp(activity, 6);
                listBox.addView(row, rowParams);
            }
            if (shown == 0) {
                TextView empty = new TextView(activity);
                empty.setText(words.isEmpty() ? "No words stored." : "No matching words.");
                empty.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
                empty.setTextColor(pal.secondary);
                empty.setPadding(dp(activity, 4), dp(activity, 14), dp(activity, 4), dp(activity, 14));
                listBox.addView(empty);
            }
        };

        searchInput.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override
            public void afterTextChanged(Editable s) {
                rebuildRef[0].run();
            }
        });
        rebuildRef[0].run();

        AlertDialog dialog = new AlertDialog.Builder(activity)
                .setTitle("Stored words (" + words.size() + ")")
                .setView(root)
                .setPositiveButton("Done", null)
                .create();
        dialogRef[0] = dialog;
        dialog.show();
    }

    static void copyToClipboard(Context context, String text) {
        try {
            ClipboardManager cm =
                    (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
            if (cm != null) {
                cm.setPrimaryClip(ClipData.newPlainText("Rambler dictation", text));
            }
        } catch (Throwable ignored) {
            // Safe no-op in headless tests.
        }
    }

    private static TextView makeFieldLabel(
            Context context, String text, RamblerWaveformDialogs.Palette pal) {
        TextView view = new TextView(context);
        view.setText(text);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        view.setTypeface(Typeface.DEFAULT_BOLD);
        view.setTextColor(pal.accent);
        return view;
    }

    private static LinearLayout.LayoutParams matchWrap() {
        return new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    private static int dp(Context context, int value) {
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value, context.getResources().getDisplayMetrics()));
    }
}
