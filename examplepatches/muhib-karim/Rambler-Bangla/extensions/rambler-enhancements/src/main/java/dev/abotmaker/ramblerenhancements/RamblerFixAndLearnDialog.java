package dev.abotmaker.ramblerenhancements;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Handler;
import android.os.Looper;
import android.text.InputType;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/**
 * 1-Tap "Fix &amp; Learn" dialog launched from any Dictation History card.
 *
 * <p>Breaks the dictation into tappable word chips (tap 1 word, or tap adjacent words to grab a
 * multi-word phrase) so users can add the corrected word to Gboard's MUSE_STATS Voice Dictionary
 * and/or save a deterministic Find &amp; Replace rule right on the spot.</p>
 */
final class RamblerFixAndLearnDialog {
    private static final String TRIM_PUNCT = ".,!?;:\"'`()[]{}<>«»“”‘’—–…•·";

    private RamblerFixAndLearnDialog() {
    }

    /**
     * Splits dictated text into clean word tokens for chip selection, trimming leading/trailing
     * punctuation while preserving internal contractions, hyphens, underscores, and handles.
     */
    static List<String> tokenizeForChips(String text) {
        List<String> tokens = new ArrayList<String>();
        if (text == null || text.trim().isEmpty()) {
            return tokens;
        }
        String[] parts = text.trim().split("\\s+");
        for (String raw : parts) {
            String cleaned = trimOuterPunctuation(raw);
            if (!cleaned.isEmpty()) {
                tokens.add(cleaned);
            }
        }
        return tokens;
    }

    static String trimOuterPunctuation(String token) {
        if (token == null || token.isEmpty()) {
            return "";
        }
        int start = 0;
        int end = token.length();
        while (start < end && isTrimPunctuation(token.charAt(start))) {
            start++;
        }
        while (end > start && isTrimPunctuation(token.charAt(end - 1))) {
            end--;
        }
        return token.substring(start, end);
    }

    private static boolean isTrimPunctuation(char c) {
        return TRIM_PUNCT.indexOf(c) >= 0;
    }

    /**
     * Creates or updates a plain-text case-insensitive Find &amp; Replace rule for the given
     * misheard phrase and optional app package scope without creating duplicates.
     */
    static RamblerTextPipeline.ReplaceRule upsertLearnedReplaceRule(
            Context context, String find, String replace, String scopePackage) {
        String cleanFind = find == null ? "" : find.trim();
        String cleanReplace = replace == null ? "" : replace.trim();
        List<String> packages = (scopePackage == null || scopePackage.trim().isEmpty())
                ? Collections.<String>emptyList()
                : Collections.singletonList(scopePackage.trim());

        String id = "rep_" + System.currentTimeMillis();
        for (RamblerTextPipeline.ReplaceRule existing : RamblerTextPipeline.readReplaceRules(context)) {
            if (!existing.regex
                    && !existing.caseSensitive
                    && existing.find.equalsIgnoreCase(cleanFind)
                    && sameScope(existing.packages, packages)) {
                id = existing.id;
                break;
            }
        }

        RamblerTextPipeline.ReplaceRule rule = new RamblerTextPipeline.ReplaceRule(
                id, cleanFind, cleanReplace, false, false, packages, true);
        RamblerTextPipeline.upsertReplaceRule(context, rule);
        return rule;
    }

    private static boolean sameScope(List<String> a, List<String> b) {
        if (a.size() != b.size()) {
            return false;
        }
        for (String item : a) {
            if (!b.contains(item)) {
                return false;
            }
        }
        return true;
    }

    static void show(
            Activity activity,
            RamblerTextPipeline.HistoryEntry entry,
            String appLabel,
            boolean dictionaryAvailable,
            Runnable onSaved) {
        if (activity == null || entry == null) {
            return;
        }
        RamblerWaveformDialogs.Palette pal = RamblerWaveformDialogs.palette(activity);
        List<String> tokens = tokenizeForChips(entry.text);
        boolean hasAppScope = entry.packageName != null && !entry.packageName.trim().isEmpty();
        String displayApp = (appLabel == null || appLabel.trim().isEmpty())
                ? entry.packageName
                : appLabel.trim();

        ScrollView scroll = new ScrollView(activity);
        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(activity, 20), dp(activity, 12), dp(activity, 20), dp(activity, 10));
        scroll.addView(root, matchWrap());

        TextView subtitle = new TextView(activity);
        subtitle.setText(tokens.isEmpty()
                ? "Enter the misheard text and its correction."
                : "Tap a misheard word (tap adjacent words to select a phrase):");
        subtitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        subtitle.setTextColor(pal.secondary);
        root.addView(subtitle, matchWrap());

        // Selection state: contiguous index range [selStart..selEnd]
        final int[] selRange = {-1, -1};
        final List<TextView> chipViews = new ArrayList<TextView>();

        EditText findInput = new EditText(activity);
        EditText replaceInput = new EditText(activity);

        if (!tokens.isEmpty()) {
            ScrollView chipScroll = new ScrollView(activity);
            LinearLayout chipRows = new LinearLayout(activity);
            chipRows.setOrientation(LinearLayout.VERTICAL);
            chipScroll.addView(chipRows, matchWrap());

            int approxAvailPx = Math.max(
                    dp(activity, 240),
                    activity.getResources().getDisplayMetrics().widthPixels - dp(activity, 96));

            LinearLayout currentRow = newChipRow(activity);
            int currentRowWidth = 0;
            int chipGap = dp(activity, 6);

            Runnable syncChips = () -> {
                for (int i = 0; i < chipViews.size(); i++) {
                    boolean selected = selRange[0] >= 0 && i >= selRange[0] && i <= selRange[1];
                    styleChip(activity, chipViews.get(i), pal, selected);
                }
                if (selRange[0] >= 0 && selRange[1] >= selRange[0]) {
                    StringBuilder sb = new StringBuilder();
                    for (int i = selRange[0]; i <= selRange[1]; i++) {
                        if (i > selRange[0]) {
                            sb.append(' ');
                        }
                        sb.append(tokens.get(i));
                    }
                    String phrase = sb.toString();
                    findInput.setText(phrase);
                    findInput.setSelection(phrase.length());
                }
            };

            for (int i = 0; i < tokens.size(); i++) {
                final int idx = i;
                String word = tokens.get(i);
                TextView chip = new TextView(activity);
                chip.setText(word);
                chip.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
                chip.setPadding(dp(activity, 11), dp(activity, 6), dp(activity, 11), dp(activity, 6));
                chip.setClickable(true);
                chip.setFocusable(true);
                styleChip(activity, chip, pal, false);
                chip.setOnClickListener(v -> {
                    if (selRange[0] < 0) {
                        selRange[0] = idx;
                        selRange[1] = idx;
                    } else if (idx == selRange[1] + 1) {
                        selRange[1] = idx;
                    } else if (idx == selRange[0] - 1) {
                        selRange[0] = idx;
                    } else if (selRange[0] == idx && selRange[1] == idx) {
                        selRange[0] = -1;
                        selRange[1] = -1;
                        findInput.setText("");
                    } else {
                        selRange[0] = idx;
                        selRange[1] = idx;
                    }
                    syncChips.run();
                });
                chipViews.add(chip);

                int estWidth = Math.round(chip.getPaint().measureText(word)) + dp(activity, 24);
                if (currentRowWidth > 0 && currentRowWidth + estWidth > approxAvailPx) {
                    chipRows.addView(currentRow, matchWrap());
                    currentRow = newChipRow(activity);
                    currentRowWidth = 0;
                }
                LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                lp.rightMargin = chipGap;
                currentRow.addView(chip, lp);
                currentRowWidth += estWidth + chipGap;
            }
            if (currentRow.getChildCount() > 0) {
                chipRows.addView(currentRow, matchWrap());
            }

            LinearLayout.LayoutParams chipBoxParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            chipBoxParams.topMargin = dp(activity, 8);
            chipBoxParams.bottomMargin = dp(activity, 6);
            if (tokens.size() > 16) {
                chipBoxParams.height = dp(activity, 136);
            }
            root.addView(chipScroll, chipBoxParams);
        }

        TextView findLabel = makeLabel(activity, "Misheard / Find", pal);
        LinearLayout.LayoutParams findLblParams = matchWrap();
        findLblParams.topMargin = dp(activity, 6);
        root.addView(findLabel, findLblParams);

        findInput.setHint("Tap a word chip above or type here");
        findInput.setSingleLine(true);
        findInput.setTextColor(pal.primary);
        findInput.setHintTextColor(pal.secondary);
        findInput.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        root.addView(findInput, matchWrap());

        TextView repLabel = makeLabel(activity, "Correct word / Replace with", pal);
        LinearLayout.LayoutParams repLblParams = matchWrap();
        repLblParams.topMargin = dp(activity, 10);
        root.addView(repLabel, repLblParams);

        replaceInput.setHint("e.g. Morphe, std_allocations");
        replaceInput.setSingleLine(true);
        replaceInput.setTextColor(pal.primary);
        replaceInput.setHintTextColor(pal.secondary);
        replaceInput.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        root.addView(replaceInput, matchWrap());

        final boolean[] scopeToThisApp = {false};
        if (hasAppScope) {
            TextView scopeLabel = makeLabel(activity, "Replace rule scope", pal);
            LinearLayout.LayoutParams scopeLblParams = matchWrap();
            scopeLblParams.topMargin = dp(activity, 10);
            root.addView(scopeLabel, scopeLblParams);

            LinearLayout scopeRow = new LinearLayout(activity);
            scopeRow.setOrientation(LinearLayout.HORIZONTAL);
            TextView allAppsChip = new TextView(activity);
            TextView thisAppChip = new TextView(activity);
            allAppsChip.setText("All apps");
            thisAppChip.setText("Only in " + displayApp);
            allAppsChip.setGravity(Gravity.CENTER);
            thisAppChip.setGravity(Gravity.CENTER);
            allAppsChip.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            thisAppChip.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            allAppsChip.setPadding(dp(activity, 10), dp(activity, 7), dp(activity, 10), dp(activity, 7));
            thisAppChip.setPadding(dp(activity, 10), dp(activity, 7), dp(activity, 10), dp(activity, 7));
            allAppsChip.setClickable(true);
            thisAppChip.setClickable(true);

            Runnable syncScope = () -> {
                styleChip(activity, allAppsChip, pal, !scopeToThisApp[0]);
                styleChip(activity, thisAppChip, pal, scopeToThisApp[0]);
            };
            allAppsChip.setOnClickListener(v -> {
                scopeToThisApp[0] = false;
                syncScope.run();
            });
            thisAppChip.setOnClickListener(v -> {
                scopeToThisApp[0] = true;
                syncScope.run();
            });
            syncScope.run();

            LinearLayout.LayoutParams leftP = new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
            leftP.rightMargin = dp(activity, 6);
            LinearLayout.LayoutParams rightP = new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
            rightP.leftMargin = dp(activity, 6);
            scopeRow.addView(allAppsChip, leftP);
            scopeRow.addView(thisAppChip, rightP);

            LinearLayout.LayoutParams scopeRowParams = matchWrap();
            scopeRowParams.topMargin = dp(activity, 6);
            root.addView(scopeRow, scopeRowParams);
        }

        final AlertDialog[] dialogRef = new AlertDialog[1];
        Handler mainHandler = new Handler(Looper.getMainLooper());

        Runnable runFixAndLearn = () -> {
            String find = textOf(findInput);
            String replace = textOf(replaceInput);
            if (replace.isEmpty()) {
                Toast.makeText(activity, "Enter the correct word first.", Toast.LENGTH_SHORT).show();
                return;
            }
            if (find.isEmpty()) {
                Toast.makeText(activity, "Tap or enter the misheard word to replace.", Toast.LENGTH_SHORT)
                        .show();
                return;
            }
            String scopePkg = scopeToThisApp[0] ? entry.packageName : "";
            upsertLearnedReplaceRule(activity, find, replace, scopePkg);
            addWordToDictionaryAsync(activity, mainHandler, replace, dictOk -> {
                String msg = dictOk
                        ? String.format(Locale.US,
                                "Added \"%s\" to dictionary & saved \"%s\" → \"%s\".",
                                replace, find, replace)
                        : String.format(Locale.US,
                                "Saved rule \"%s\" → \"%s\" (dictate once to initialize dictionary).",
                                find, replace);
                Toast.makeText(activity, msg, Toast.LENGTH_LONG).show();
                if (onSaved != null) {
                    onSaved.run();
                }
            });
            if (dialogRef[0] != null) {
                dialogRef[0].dismiss();
            }
        };

        Runnable runDictionaryOnly = () -> {
            String word = textOf(replaceInput);
            if (word.isEmpty()) {
                word = textOf(findInput);
            }
            if (word.isEmpty()) {
                Toast.makeText(activity, "Tap a word chip or type a word to add.", Toast.LENGTH_SHORT)
                        .show();
                return;
            }
            final String targetWord = word;
            addWordToDictionaryAsync(activity, mainHandler, targetWord, dictOk -> {
                Toast.makeText(
                        activity,
                        dictOk
                                ? "Added \"" + targetWord + "\" to Rambler voice dictionary."
                                : "Rambler dictionary isn't ready yet. Dictate once and try again.",
                        Toast.LENGTH_SHORT).show();
                if (onSaved != null) {
                    onSaved.run();
                }
            });
            if (dialogRef[0] != null) {
                dialogRef[0].dismiss();
            }
        };

        Runnable runReplaceOnly = () -> {
            String find = textOf(findInput);
            String replace = textOf(replaceInput);
            if (find.isEmpty()) {
                Toast.makeText(activity, "Tap or enter the misheard text to find.", Toast.LENGTH_SHORT)
                        .show();
                return;
            }
            String scopePkg = scopeToThisApp[0] ? entry.packageName : "";
            upsertLearnedReplaceRule(activity, find, replace, scopePkg);
            String label = replace.isEmpty() ? "(delete)" : ("\"" + replace + "\"");
            Toast.makeText(
                    activity,
                    "Saved Find & Replace: \"" + find + "\" → " + label,
                    Toast.LENGTH_SHORT).show();
            if (onSaved != null) {
                onSaved.run();
            }
            if (dialogRef[0] != null) {
                dialogRef[0].dismiss();
            }
        };

        // Dedicated action buttons inside the dialog for crisp 1-tap UX
        LinearLayout actionsBox = new LinearLayout(activity);
        actionsBox.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams actionsParams = matchWrap();
        actionsParams.topMargin = dp(activity, 14);

        if (dictionaryAvailable) {
            TextView bothBtn = actionButton(
                    activity, pal, "Fix & Learn (Dictionary + Replace)", true, runFixAndLearn);
            actionsBox.addView(bothBtn, matchWrap());

            LinearLayout secRow = new LinearLayout(activity);
            secRow.setOrientation(LinearLayout.HORIZONTAL);
            LinearLayout.LayoutParams secRowParams = matchWrap();
            secRowParams.topMargin = dp(activity, 8);

            LinearLayout.LayoutParams leftBtnP = new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
            leftBtnP.rightMargin = dp(activity, 4);
            LinearLayout.LayoutParams rightBtnP = new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
            rightBtnP.leftMargin = dp(activity, 4);

            secRow.addView(
                    actionButton(activity, pal, "Dictionary only", false, runDictionaryOnly),
                    leftBtnP);
            secRow.addView(
                    actionButton(activity, pal, "Replace only", false, runReplaceOnly),
                    rightBtnP);
            actionsBox.addView(secRow, secRowParams);
        } else {
            actionsBox.addView(
                    actionButton(activity, pal, "Save Find & Replace rule", true, runReplaceOnly),
                    matchWrap());
        }
        root.addView(actionsBox, actionsParams);

        AlertDialog dialog = new AlertDialog.Builder(activity)
                .setTitle("Fix & learn")
                .setView(scroll)
                .setNegativeButton("Cancel", null)
                .create();
        dialogRef[0] = dialog;
        dialog.show();
    }

    private interface BoolCallback {
        void onDone(boolean ok);
    }

    private static void addWordToDictionaryAsync(
            Context context, Handler mainHandler, String word, BoolCallback cb) {
        Thread worker = new Thread(() -> {
            boolean ok = RamblerMuseStatsBridge.addWords(context, Collections.singletonList(word));
            mainHandler.post(() -> cb.onDone(ok));
        }, "rambler-fix-learn");
        worker.setDaemon(true);
        worker.start();
    }

    private static String textOf(EditText input) {
        return input.getText() == null ? "" : input.getText().toString().trim();
    }

    private static LinearLayout newChipRow(Context context) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(0, 0, 0, dp(context, 6));
        return row;
    }

    private static void styleChip(
            Context context,
            TextView chip,
            RamblerWaveformDialogs.Palette pal,
            boolean selected) {
        GradientDrawable bg = new GradientDrawable();
        bg.setCornerRadius(dp(context, 999));
        bg.setColor(selected ? pal.selected : pal.surfaceAlt);
        bg.setStroke(dp(context, 1), selected ? pal.accent : pal.stroke);
        GradientDrawable mask = new GradientDrawable();
        mask.setCornerRadius(dp(context, 999));
        mask.setColor(Color.WHITE);
        chip.setBackground(new RippleDrawable(ColorStateList.valueOf(pal.pressed), bg, mask));
        chip.setTextColor(selected ? pal.accent : pal.primary);
        chip.setTypeface(selected ? Typeface.DEFAULT_BOLD : Typeface.DEFAULT);
    }

    private static TextView actionButton(
            Context context,
            RamblerWaveformDialogs.Palette pal,
            String label,
            boolean primary,
            Runnable onClick) {
        TextView btn = new TextView(context);
        btn.setText(label);
        btn.setGravity(Gravity.CENTER);
        btn.setTextSize(TypedValue.COMPLEX_UNIT_SP, primary ? 13 : 12);
        btn.setTypeface(Typeface.DEFAULT_BOLD);
        btn.setTextColor(primary ? pal.accent : pal.primary);
        btn.setPadding(dp(context, 12), dp(context, 11), dp(context, 12), dp(context, 11));
        GradientDrawable bg = new GradientDrawable();
        bg.setCornerRadius(dp(context, 12));
        bg.setColor(primary ? pal.selected : pal.surfaceAlt);
        bg.setStroke(dp(context, 1), primary ? pal.accent : pal.stroke);
        GradientDrawable mask = new GradientDrawable();
        mask.setCornerRadius(dp(context, 12));
        mask.setColor(Color.WHITE);
        btn.setBackground(new RippleDrawable(ColorStateList.valueOf(pal.pressed), bg, mask));
        btn.setClickable(true);
        btn.setFocusable(true);
        btn.setOnClickListener(v -> onClick.run());
        return btn;
    }

    private static TextView makeLabel(
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
        return RamblerWaveformDialogs.dp(context, value);
    }
}
