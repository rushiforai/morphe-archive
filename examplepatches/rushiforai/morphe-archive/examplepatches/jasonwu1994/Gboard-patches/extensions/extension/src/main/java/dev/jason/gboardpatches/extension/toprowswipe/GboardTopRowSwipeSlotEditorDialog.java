package dev.jason.gboardpatches.extension.toprowswipe;

import android.app.Activity;
import android.app.AlertDialog;
import android.graphics.Typeface;
import android.text.Editable;
import android.text.InputType;
import android.text.method.KeyListener;
import android.util.Log;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import dev.jason.gboardpatches.extension.toprowswipe.QuickJsScriptEvaluator;

final class GboardTopRowSwipeSlotEditorDialog {
    private static final String TAG = "GboardTopRowSwipe";

    interface SaveCallback {
        void onSave(GboardTopRowSwipeSettings.SlotText slot);
    }

    private GboardTopRowSwipeSlotEditorDialog() {
    }

    static void show(Activity activity, int slotIndex,
            GboardTopRowSwipeSettings.SlotText currentSlot,
            SaveCallback saveCallback) {
        if (activity == null || activity.isFinishing() || currentSlot == null) {
            return;
        }

        GboardTopRowSwipeStrings strings = GboardTopRowSwipeStrings.from(activity);
        runUiActionSafely(activity, "show slot editor dialog", () -> {
            Controller controller = new Controller(activity, currentSlot, strings);
            ScrollView scrollView = new ScrollView(activity);
            controller.attachScrollView(scrollView);
            scrollView.addView(controller.buildContentView(), new ScrollView.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            AlertDialog dialog = new AlertDialog.Builder(activity)
                    .setTitle(strings.slotTitle(slotIndex))
                    .setView(scrollView)
                    .setPositiveButton(strings.saveButton, null)
                    .setNegativeButton(strings.cancelButton, null)
                    .setNeutralButton(strings.resetButton, null)
                    .create();
            dialog.setOnShowListener(ignored -> runUiActionSafely(
                    activity,
                    "configure slot editor dialog",
                    () -> {
                        if (dialog.getWindow() != null) {
                            dialog.getWindow().clearFlags(
                                    WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
                            dialog.getWindow().setSoftInputMode(
                                    WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
                        }
                        dialog.getButton(AlertDialog.BUTTON_POSITIVE)
                                .setOnClickListener(view -> runUiActionSafely(
                                        activity,
                                        "save slot editor dialog",
                                        () -> {
                                            GboardTopRowSwipeSettings.SlotText edited =
                                                    controller.editedSlot();
                                            if (edited == null) {
                                                return;
                                            }
                                            if (saveCallback != null) {
                                                saveCallback.onSave(edited);
                                            }
                                            dialog.dismiss();
                                        }));
                        dialog.getButton(AlertDialog.BUTTON_NEUTRAL)
                                .setOnClickListener(view -> runUiActionSafely(
                                        activity,
                                        "reset slot editor dialog",
                                        () -> controller.resetToDefaultSlot(slotIndex)));
                    }));
            dialog.show();
        });
    }

    private static final class Controller {
        private final Activity activity;
        private final GboardTopRowSwipeSettings.SlotText currentSlot;
        private final GboardTopRowSwipeStrings strings;
        private boolean commitManuallyEdited;
        private boolean updatingCommitFromDisplay;

        private EditText displayInput;
        private EditText commitInput;
        private CheckBox useJavaScriptInput;
        private TextView commitLabel;
        private LinearLayout scriptHeaderRow;
        private TextView scriptLabel;
        private TextView scriptLockButton;
        private EditText scriptInput;
        private TextView timeoutLabel;
        private EditText timeoutInput;
        private EditText testInput;
        private Button testButton;
        private TextView testResult;
        private ScrollView scrollView;
        private boolean scriptLocked = true;
        private KeyListener scriptEditableKeyListener;
        private int scriptEditableInputType;

        Controller(Activity activity, GboardTopRowSwipeSettings.SlotText currentSlot,
                GboardTopRowSwipeStrings strings) {
            this.activity = activity;
            this.currentSlot = currentSlot;
            this.strings = strings;
            this.commitManuallyEdited =
                    !safeTrim(currentSlot.displayText).equals(safeTrim(currentSlot.commitText));
        }

        void attachScrollView(ScrollView scrollView) {
            this.scrollView = scrollView;
        }

        LinearLayout buildContentView() {
            LinearLayout container = new LinearLayout(activity);
            container.setOrientation(LinearLayout.VERTICAL);
            container.setPadding(dp(24), dp(8), dp(24), dp(24));

            displayInput = buildInput(strings.editorDisplayHint, currentSlot.displayText);
            commitInput = buildInput(strings.editorCommitHint, currentSlot.commitText);
            useJavaScriptInput = new CheckBox(activity);
            useJavaScriptInput.setText(strings.editorUseJavaScriptLabel);
            useJavaScriptInput.setChecked(currentSlot.isJavaScript);
            scriptInput = buildScriptInput(currentSlot.scriptText);
            timeoutInput = buildTimeoutInput(Integer.toString(currentSlot.timeoutMs));
            testInput = buildInput(strings.editorTestInputHint, "");
            testButton = new Button(activity);
            testButton.setText(strings.editorTestButton);
            testButton.setFocusable(false);
            testButton.setFocusableInTouchMode(false);
            testResult = new TextView(activity);
            testResult.setTextIsSelectable(true);
            testResult.setLongClickable(true);
            configureTestInput();

            container.addView(buildLabel(strings.editorDisplayLabel));
            container.addView(displayInput, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            container.addView(useJavaScriptInput, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            commitLabel = buildLabel(strings.editorCommitLabel);
            container.addView(commitLabel);
            container.addView(commitInput, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            scriptLabel = buildSectionHeaderLabel(strings.editorScriptLabel);
            scriptLockButton = buildEditorLockButton();
            scriptHeaderRow = buildScriptHeaderRow();
            container.addView(scriptHeaderRow, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            container.addView(scriptInput, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            timeoutLabel = buildLabel(strings.editorTimeoutLabel);
            container.addView(timeoutLabel);
            container.addView(timeoutInput, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            container.addView(testInput, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            container.addView(testButton, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            container.addView(testResult, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));

            displayInput.addTextChangedListener(new TextWatcher() {
                @Override
                public void beforeTextChanged(CharSequence value, int start, int count, int after) {
                }

                @Override
                public void onTextChanged(CharSequence value, int start, int before, int count) {
                }

                @Override
                public void afterTextChanged(Editable value) {
                    if (commitManuallyEdited || commitInput == null) {
                        return;
                    }
                    updatingCommitFromDisplay = true;
                    commitInput.setText(value != null ? value.toString() : "");
                    commitInput.setSelection(commitInput.getText().length());
                    updatingCommitFromDisplay = false;
                }
            });
            commitInput.addTextChangedListener(new TextWatcher() {
                @Override
                public void beforeTextChanged(CharSequence value, int start, int count, int after) {
                }

                @Override
                public void onTextChanged(CharSequence value, int start, int before, int count) {
                }

                @Override
                public void afterTextChanged(Editable value) {
                    if (!updatingCommitFromDisplay) {
                        commitManuallyEdited = commitManuallyEditedAfterUserEdit(value);
                    }
                }
            });
            useJavaScriptInput.setOnCheckedChangeListener(
                    (button, checked) -> runUiActionSafely(
                            activity,
                            "toggle slot JavaScript mode",
                            this::updateModeVisibility));
            scriptLockButton.setOnClickListener(view -> runUiActionSafely(
                    activity,
                    "toggle slot script lock",
                    () -> {
                        scriptLocked = !scriptLocked;
                        applyScriptLockState();
                    }));
            testButton.setOnClickListener(view -> runUiActionSafely(
                    activity,
                    "run slot JavaScript test",
                    () -> {
                        revealViewNearKeyboard(testResult);
                        runJavaScriptTest();
                    }));
            applyScriptLockState();
            updateModeVisibility();
            displayInput.requestFocus();
            displayInput.setSelection(displayInput.getText().length());
            return container;
        }

        GboardTopRowSwipeSettings.SlotText editedSlot() {
            String display = displayInput != null ? displayInput.getText().toString() : "";
            if (display.trim().isEmpty()) {
                if (displayInput != null) {
                    displayInput.setError(strings.editorDisplayBlankError);
                }
                return null;
            }
            String commit = commitInput != null ? commitInput.getText().toString() : "";
            String script = scriptInput != null ? scriptInput.getText().toString() : "";
            String timeout = timeoutInput != null ? timeoutInput.getText().toString() : "";
            boolean useJavaScript = useJavaScriptInput != null
                    && useJavaScriptInput.isChecked();
            return slotFromEditorFields(
                    currentSlot,
                    useJavaScript,
                    display,
                    commit,
                    script,
                    timeout,
                    commitManuallyEdited,
                    currentTimeoutMaxMs());
        }

        void resetToDefaultSlot(int slotIndex) {
            applySlotDraft(GboardTopRowSwipeSettings.defaultSlot(slotIndex));
        }

        private void applySlotDraft(GboardTopRowSwipeSettings.SlotText slot) {
            GboardTopRowSwipeSettings.SlotText safeSlot = slot != null
                    ? slot
                    : new GboardTopRowSwipeSettings.SlotText("", "");
            String display = safeSlot.displayText != null ? safeSlot.displayText : "";
            String commit = safeSlot.commitText != null ? safeSlot.commitText : "";
            String script = safeSlot.scriptText != null ? safeSlot.scriptText : "";
            String timeout = Integer.toString(safeSlot.timeoutMs);

            updatingCommitFromDisplay = true;
            if (displayInput != null) {
                displayInput.setText(display);
                displayInput.setError(null);
                displayInput.setSelection(displayInput.getText().length());
            }
            if (commitInput != null) {
                commitInput.setText(commit);
                commitInput.setSelection(commitInput.getText().length());
            }
            updatingCommitFromDisplay = false;
            commitManuallyEdited = !safeTrim(display).equals(safeTrim(commit));

            if (useJavaScriptInput != null) {
                useJavaScriptInput.setChecked(safeSlot.isJavaScript);
            }
            if (scriptInput != null) {
                scriptInput.setText(script);
                scriptInput.setSelection(scriptInput.getText().length());
            }
            if (timeoutInput != null) {
                timeoutInput.setText(timeout);
                timeoutInput.setSelection(timeoutInput.getText().length());
            }
            if (testInput != null) {
                testInput.setText("");
            }
            if (testResult != null) {
                testResult.setText("");
            }

            scriptLocked = true;
            applyScriptLockState();
            updateModeVisibility();
        }

        private EditText buildInput(String hint, String value) {
            EditText input = new EditText(activity);
            input.setSingleLine(false);
            input.setMinLines(1);
            input.setMaxLines(3);
            input.setHint(hint);
            input.setInputType(InputType.TYPE_CLASS_TEXT
                    | InputType.TYPE_TEXT_FLAG_MULTI_LINE
                    | InputType.TYPE_TEXT_FLAG_CAP_SENTENCES);
            input.setText(value != null ? value : "");
            input.setSelectAllOnFocus(false);
            return input;
        }

        private EditText buildScriptInput(String value) {
            EditText input = buildInput(strings.editorScriptHint, value);
            input.setMinLines(4);
            input.setMaxLines(8);
            input.setInputType(InputType.TYPE_CLASS_TEXT
                    | InputType.TYPE_TEXT_FLAG_MULTI_LINE
                    | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
            input.setTypeface(Typeface.SANS_SERIF);
            input.setHorizontallyScrolling(true);
            input.setHorizontalScrollBarEnabled(true);
            input.setVerticalScrollBarEnabled(true);
            input.setTextIsSelectable(true);
            scriptEditableKeyListener = input.getKeyListener();
            scriptEditableInputType = input.getInputType();
            input.setOnFocusChangeListener((view, hasFocus) -> {
                if (hasFocus && !scriptLocked) {
                    showSoftInputForEditor(input, false);
                }
            });
            input.setOnClickListener(view -> {
                if (!scriptLocked) {
                    showSoftInputForEditor(input, false);
                }
            });
            return input;
        }

        private EditText buildTimeoutInput(String value) {
            EditText input = new EditText(activity);
            input.setSingleLine(true);
            input.setHint(strings.editorTimeoutHint);
            input.setInputType(InputType.TYPE_CLASS_NUMBER);
            input.setText(value != null ? value : "");
            input.setSelectAllOnFocus(false);
            return input;
        }

        private void configureTestInput() {
            if (testInput == null) {
                return;
            }
            testInput.setOnFocusChangeListener((view, hasFocus) -> {
                if (!hasFocus) {
                    return;
                }
                showSoftInputForEditor(testInput, false);
                revealViewNearKeyboard(testButton);
                revealViewNearKeyboard(testResult);
            });
            testInput.setOnClickListener(view -> {
                showSoftInputForEditor(testInput, false);
                revealViewNearKeyboard(testButton);
                revealViewNearKeyboard(testResult);
            });
        }

        private TextView buildLabel(String text) {
            TextView label = new TextView(activity);
            label.setText(text);
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT);
            params.topMargin = dp(12);
            label.setLayoutParams(params);
            return label;
        }

        private TextView buildSectionHeaderLabel(String text) {
            TextView label = new TextView(activity);
            label.setText(text);
            label.setTypeface(Typeface.SANS_SERIF, Typeface.BOLD);
            return label;
        }

        private TextView buildEditorLockButton() {
            TextView button = new TextView(activity);
            button.setTextSize(13f);
            button.setTypeface(Typeface.SANS_SERIF, Typeface.BOLD);
            button.setPadding(dp(12), dp(8), dp(12), dp(8));
            button.setClickable(true);
            button.setFocusable(false);
            button.setFocusableInTouchMode(false);
            return button;
        }

        private LinearLayout buildScriptHeaderRow() {
            LinearLayout row = new LinearLayout(activity);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT);
            params.topMargin = dp(12);
            row.setLayoutParams(params);
            row.addView(scriptLabel, new LinearLayout.LayoutParams(
                    0,
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    1f));
            row.addView(scriptLockButton, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            return row;
        }

        private void updateModeVisibility() {
            boolean javaScript = useJavaScriptInput != null && useJavaScriptInput.isChecked();
            setVisible(commitLabel, !javaScript);
            setVisible(commitInput, !javaScript);
            setVisible(scriptHeaderRow, javaScript);
            setVisible(scriptInput, javaScript);
            setVisible(timeoutLabel, javaScript);
            setVisible(timeoutInput, javaScript);
            setVisible(testInput, javaScript);
            setVisible(testButton, javaScript);
            setVisible(testResult, javaScript);
        }

        private void applyScriptLockState() {
            if (scriptInput == null || scriptLockButton == null) {
                return;
            }
            if (scriptLocked) {
                scriptInput.setKeyListener(null);
                scriptInput.setCursorVisible(false);
                scriptInput.setFocusable(true);
                scriptInput.setFocusableInTouchMode(true);
                scriptInput.setClickable(true);
                scriptInput.setLongClickable(true);
                scriptInput.setShowSoftInputOnFocus(false);
                hideSoftInputForEditor(scriptInput);
                scriptInput.clearFocus();
                scriptLockButton.setText("\uD83D\uDD12 " + strings.editorLockedState);
                return;
            }
            scriptInput.setKeyListener(scriptEditableKeyListener);
            scriptInput.setInputType(scriptEditableInputType);
            scriptInput.setCursorVisible(true);
            scriptInput.setFocusable(true);
            scriptInput.setFocusableInTouchMode(true);
            scriptInput.setClickable(true);
            scriptInput.setLongClickable(true);
            scriptInput.setShowSoftInputOnFocus(true);
            scriptLockButton.setText("\uD83D\uDD13 " + strings.editorUnlockedState);
            showSoftInputForEditor(scriptInput, true);
        }

        private void showSoftInputForEditor(EditText input, boolean moveCursorToEnd) {
            if (input == null) {
                return;
            }
            try {
                input.requestFocusFromTouch();
                input.requestFocus();
                input.post(() -> runUiActionSafely(
                        activity,
                        "show slot editor soft input",
                        () -> {
                            input.requestFocusFromTouch();
                            input.requestFocus();
                            InputMethodManager inputMethodManager = (InputMethodManager)
                                    activity.getSystemService(Activity.INPUT_METHOD_SERVICE);
                            if (inputMethodManager != null) {
                                inputMethodManager.restartInput(input);
                                inputMethodManager.showSoftInput(input,
                                        InputMethodManager.SHOW_IMPLICIT);
                            }
                            if (moveCursorToEnd && input.getText() != null) {
                                input.setSelection(input.getText().length());
                            }
                        }));
            } catch (Throwable throwable) {
                Log.w(TAG, "Failed to prepare slot editor soft input", throwable);
            }
        }

        private void hideSoftInputForEditor(EditText input) {
            if (input == null) {
                return;
            }
            try {
                InputMethodManager inputMethodManager = (InputMethodManager)
                        activity.getSystemService(Activity.INPUT_METHOD_SERVICE);
                if (inputMethodManager != null) {
                    inputMethodManager.hideSoftInputFromWindow(input.getWindowToken(), 0);
                }
            } catch (Throwable throwable) {
                Log.w(TAG, "Failed to hide slot editor soft input", throwable);
            }
        }

        private void revealViewNearKeyboard(View view) {
            if (scrollView == null || view == null) {
                return;
            }
            scrollView.post(() -> {
                int targetScrollY = Math.max(0,
                        view.getBottom() + dp(24) - scrollView.getHeight());
                scrollView.smoothScrollTo(0, targetScrollY);
            });
        }

        private void runJavaScriptTest() {
            if (scriptInput == null || timeoutInput == null || testResult == null) {
                return;
            }
            String input = testInputFromSelection(
                    testInput != null && testInput.getText() != null
                            ? testInput.getText().toString() : "",
                    testInput != null ? testInput.getSelectionStart() : -1,
                    testInput != null ? testInput.getSelectionEnd() : -1);
            String script = scriptInput.getText() != null
                    ? scriptInput.getText().toString() : "";
            int timeoutMs = parseTimeout(timeoutInput.getText() != null
                    ? timeoutInput.getText().toString() : "",
                    currentTimeoutMaxMs());
            testButton.setEnabled(false);
            testResult.setText(strings.editorTestRunning);
            String globalJavaScript = GboardTopRowSwipeSettings.readGlobalJavaScript(activity);
            GboardTopRowSwipeSettings.JavaScriptRuntimeLimits javaScriptRuntimeLimits =
                    GboardTopRowSwipeSettings.readJavaScriptRuntimeLimits(activity);
            Thread testThread = new Thread(
                    () -> runJavaScriptTestOnBackgroundThread(
                            script,
                            input,
                            timeoutMs,
                            globalJavaScript,
                            javaScriptRuntimeLimits),
                    "gboardpatches-top-row-js-test");
            testThread.setDaemon(true);
            testThread.start();
        }

        private void runJavaScriptTestOnBackgroundThread(
                String script, String input, int timeoutMs, String globalJavaScript,
                GboardTopRowSwipeSettings.JavaScriptRuntimeLimits javaScriptRuntimeLimits) {
            String message;
            try {
                QuickJsScriptEvaluator.Result result =
                        QuickJsScriptEvaluator.evaluate(
                                script,
                                input,
                                timeoutMs,
                                globalJavaScript,
                                javaScriptRuntimeLimits);
                message = strings.testResultMessage(
                        result.success,
                        result.timedOut,
                        result.shouldCommit,
                        result.committedText,
                        result.errorMessage);
            } catch (Throwable throwable) {
                message = strings.testResultMessage(false, false, false, null,
                        throwable.getMessage());
            }
            final String resultMessage = message;
            try {
                activity.runOnUiThread(() -> runUiActionSafely(
                        activity,
                        "publish slot JavaScript test result",
                        () -> {
                            if (testResult != null) {
                                testResult.setText(resultMessage);
                                revealViewNearKeyboard(testResult);
                            }
                            if (testButton != null) {
                                testButton.setEnabled(true);
                            }
                        }));
            } catch (Throwable throwable) {
                Log.w(TAG, "Failed to publish slot JavaScript test result", throwable);
            }
        }

        private void setVisible(View view, boolean visible) {
            if (view != null) {
                view.setVisibility(visible ? View.VISIBLE : View.GONE);
            }
        }

        private int dp(int value) {
            return Math.round(value * activity.getResources().getDisplayMetrics().density);
        }

        private static String safeTrim(String value) {
            return value == null ? "" : value.trim();
        }

        private int currentTimeoutMaxMs() {
            return GboardTopRowSwipeSettings.readJavaScriptRuntimeLimits(activity).timeoutMaxMs;
        }
    }

    static GboardTopRowSwipeSettings.SlotText slotFromEditorFields(
            GboardTopRowSwipeSettings.SlotText currentSlot,
            boolean useJavaScript,
            String display,
            String commit,
            String script,
            String timeout,
            boolean commitManuallyEdited) {
        return slotFromEditorFields(currentSlot, useJavaScript, display, commit, script,
                timeout, commitManuallyEdited,
                GboardTopRowSwipeSettings.DEFAULT_TIMEOUT_MAX_MS);
    }

    static GboardTopRowSwipeSettings.SlotText slotFromEditorFields(
            GboardTopRowSwipeSettings.SlotText currentSlot,
            boolean useJavaScript,
            String display,
            String commit,
            String script,
            String timeout,
            boolean commitManuallyEdited,
            int timeoutMaxMs) {
        if (!useJavaScript) {
            return GboardTopRowSwipeSettings.resolveEditedSlot(
                    currentSlot != null ? currentSlot.displayText : "",
                    currentSlot != null ? currentSlot.commitText : "",
                    display,
                    commit,
                    commitManuallyEdited);
        }

        String displayText = display != null ? display.trim() : "";
        String fallbackCommit = commit != null ? commit.trim() : "";
        if (fallbackCommit.isEmpty()) {
            fallbackCommit = displayText;
        }
        return new GboardTopRowSwipeSettings.SlotText(
                displayText,
                fallbackCommit,
                true,
                script != null ? script : "",
                parseTimeout(timeout, timeoutMaxMs));
    }

    private static int parseTimeout(String timeout) {
        return parseTimeout(timeout, GboardTopRowSwipeSettings.DEFAULT_TIMEOUT_MAX_MS);
    }

    private static int parseTimeout(String timeout, int timeoutMaxMs) {
        int parsed;
        if (timeout == null) {
            parsed = GboardTopRowSwipeSettings.DEFAULT_TIMEOUT_MS;
        } else {
            try {
                parsed = Integer.parseInt(timeout.trim());
            } catch (NumberFormatException exception) {
                parsed = GboardTopRowSwipeSettings.DEFAULT_TIMEOUT_MS;
            }
        }
        if (parsed < GboardTopRowSwipeSettings.MIN_TIMEOUT_MS) {
            return GboardTopRowSwipeSettings.MIN_TIMEOUT_MS;
        }
        if (parsed > timeoutMaxMs) {
            return timeoutMaxMs;
        }
        return parsed;
    }

    static String testInputFromSelection(String value, int selectionStart, int selectionEnd) {
        String text = value != null ? value : "";
        int start = Math.min(selectionStart, selectionEnd);
        int end = Math.max(selectionStart, selectionEnd);
        if (start < 0 || end > text.length() || start == end) {
            return "";
        }
        return text.substring(start, end);
    }

    static String testResultMessage(boolean success, boolean timedOut, boolean shouldCommit,
            String committedText, String errorMessage) {
        return GboardTopRowSwipeStrings.from(null).testResultMessage(
                success,
                timedOut,
                shouldCommit,
                committedText,
                errorMessage);
    }

    static boolean commitManuallyEditedAfterUserEdit(CharSequence value) {
        return value != null && !value.toString().trim().isEmpty();
    }

    private static void runUiActionSafely(Activity activity, String operationName,
            Runnable action) {
        if (action == null || activity == null || activity.isFinishing()) {
            return;
        }
        try {
            action.run();
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to " + operationName, throwable);
        }
    }
}
