// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.syncforreddit.authorcolors;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.DialogFragment;
import android.app.FragmentManager;
import android.content.Context;
import android.content.DialogInterface;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.os.Bundle;
import android.text.InputFilter;
import android.text.InputType;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.EditorInfo;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.regex.Pattern;

@SuppressWarnings("deprecation")
public final class AuthorColorDialog extends DialogFragment {
    private static final String TAG = "edbfi.authorColors";
    private static final String PROFILE = "profile";
    private static final String AUTHOR = "author";
    private static final String FROM_SETTINGS = "fromSettings";
    private static final String HEX = "hex";
    private static final String HEX_FOCUSED = "hexFocused";
    private static final String SELECTION_START = "selectionStart";
    private static final String SELECTION_END = "selectionEnd";
    private static final String PALETTE_SELECTION = "paletteSelection";
    private static final Pattern HEX_COLOR = Pattern.compile("#?[0-9a-fA-F]{6}");
    private static final String[] COLOR_NAMES = {"Red", "Orange", "Gold", "Green", "Teal", "Blue", "Purple", "Pink"};
    private static final int[] COLORS = {
        0xffe57373, 0xffffa65c, 0xffffd166, 0xff7cc576, 0xff56c8be, 0xff79b5ff, 0xffb69af0, 0xffef96cb
    };

    private EditText hex;
    private int selected = -1;

    static void open(Activity activity, String author) {
        FragmentManager fragments = activity.getFragmentManager();
        String profile = AuthorColors.currentProfile();
        if (profile != null && canShow(activity, fragments) && fragments.findFragmentByTag(TAG) == null) {
            show(fragments, profile, author, false);
        }
    }

    private static void show(FragmentManager fragments, String profile, String author, boolean fromSettings) {
        Bundle args = new Bundle();
        args.putString(PROFILE, profile);
        args.putString(AUTHOR, author);
        args.putBoolean(FROM_SETTINGS, fromSettings);
        AuthorColorDialog fragment = new AuthorColorDialog();
        fragment.setArguments(args);
        fragment.show(fragments, TAG);
    }

    private static boolean canShow(Activity activity, FragmentManager fragments) {
        return activity != null && fragments != null && !activity.isFinishing() && !fragments.isDestroyed()
                && (Build.VERSION.SDK_INT < 26 || !fragments.isStateSaved());
    }

    @Override
    public Dialog onCreateDialog(Bundle state) {
        Activity activity = getActivity();
        if (!isOriginatingProfile()) {
            return new Dialog(activity);
        }
        String author = getArguments().getString(AUTHOR);
        return author == null ? manager(activity) : editor(activity, author, state);
    }

    @Override
    public void onStart() {
        super.onStart();
        if (!isOriginatingProfile()) {
            dismissAllowingStateLoss();
        }
    }

    @Override
    public void onSaveInstanceState(Bundle state) {
        if (hex != null) {
            state.putString(HEX, hex.getText().toString());
            state.putBoolean(HEX_FOCUSED, hex.hasFocus());
            state.putInt(SELECTION_START, hex.getSelectionStart());
            state.putInt(SELECTION_END, hex.getSelectionEnd());
            state.putInt(PALETTE_SELECTION, selected);
        }
        super.onSaveInstanceState(state);
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        hex = null;
    }

    @Override
    public void onCancel(DialogInterface dialog) {
        super.onCancel(dialog);
        returnToManager();
    }

    private Dialog manager(Activity activity) {
        List<String> authors = new ArrayList<>();
        for (String author : AuthorColors.storedColors().keySet()) {
            if (AuthorColors.isUsername(author)) {
                authors.add(author);
            }
        }
        Collections.sort(authors, String.CASE_INSENSITIVE_ORDER);
        AlertDialog.Builder dialog = new AlertDialog.Builder(activity)
                .setTitle("Local author colors")
                .setNegativeButton(android.R.string.cancel, null);
        if (authors.isEmpty()) {
            dialog.setMessage("Set an author color from a comment's options.");
        } else {
            String[] labels = new String[authors.size()];
            for (int index = 0; index < authors.size(); index++) {
                labels[index] = "u/" + authors.get(index);
            }
            dialog.setItems(labels, (window, which) -> {
                if (isOriginatingProfile() && canShow(activity, getFragmentManager())) {
                    dismiss();
                    show(activity.getFragmentManager(), getArguments().getString(PROFILE), authors.get(which), true);
                }
            });
        }
        return dialog.create();
    }

    private Dialog editor(Activity activity, String author, Bundle state) {
        Integer existing = AuthorColors.savedColor(author);
        hex = new EditText(activity);
        hex.setSingleLine();
        // IME composition can move the cursor when the window closes.
        hex.setRawInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_VISIBLE_PASSWORD
                | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        hex.setImeOptions(EditorInfo.IME_FLAG_NO_EXTRACT_UI);
        hex.setHint("Hex color (#RRGGBB)");
        hex.setFilters(new InputFilter[]{new InputFilter.LengthFilter(7)});
        if (state != null && state.containsKey(HEX)) {
            hex.setText(state.getString(HEX));
            selected = state.getInt(PALETTE_SELECTION, -1);
        } else if (existing != null) {
            hex.setText(asHex(existing));
            for (int index = 0; index < COLORS.length; index++) {
                if (existing == COLORS[index]) {
                    selected = index;
                    break;
                }
            }
        }
        LinearLayout content = new LinearLayout(activity);
        content.setOrientation(LinearLayout.VERTICAL);
        content.addView(hex, ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        ListView choices = new ListView(activity);
        choices.setAdapter(palette(activity));
        choices.setChoiceMode(ListView.CHOICE_MODE_SINGLE);
        if (selected >= 0) {
            choices.setItemChecked(selected, true);
            choices.setSelection(selected);
        }
        choices.setOnItemClickListener((parent, row, which, id) -> {
            selected = which;
            hex.setText(asHex(COLORS[which]));
            hex.setSelection(hex.length());
        });
        content.addView(choices, ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);

        AlertDialog.Builder builder = new AlertDialog.Builder(activity)
                .setTitle("Author color for u/" + author)
                .setView(content)
                .setNegativeButton(android.R.string.cancel, (dialog, which) -> closeEditor())
                .setPositiveButton("Save", null);
        if (existing != null) {
            builder.setNeutralButton("Remove color", (dialog, which) -> save(author, null));
        }
        AlertDialog dialog = builder.create();
        dialog.setOnShowListener(window -> {
            if (state != null) {
                if (state.getBoolean(HEX_FOCUSED)) {
                    hex.requestFocus();
                }
                int start = state.getInt(SELECTION_START, -1);
                int end = state.getInt(SELECTION_END, -1);
                if (start >= 0 && end >= 0 && start <= hex.length() && end <= hex.length()) {
                    hex.setSelection(start, end);
                }
            }
            dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(button -> {
                String input = hex.getText().toString().trim();
                if (!HEX_COLOR.matcher(input).matches()) {
                    hex.setError("Enter six hexadecimal digits");
                    return;
                }
                save(author, input.startsWith("#") ? input : "#" + input);
            });
        });
        return dialog;
    }

    private static ArrayAdapter<String> palette(Context context) {
        return new ArrayAdapter<String>(context, android.R.layout.select_dialog_singlechoice, COLOR_NAMES) {
            @Override
            public View getView(int position, View recycled, ViewGroup parent) {
                TextView row = (TextView) super.getView(position, recycled, parent);
                int size = Math.round(18 * row.getResources().getDisplayMetrics().density);
                GradientDrawable swatch = new GradientDrawable();
                swatch.setColor(COLORS[position]);
                swatch.setBounds(0, 0, size, size);
                row.setCompoundDrawablePadding(size / 2);
                row.setCompoundDrawablesRelative(swatch, null, null, null);
                return row;
            }
        };
    }

    private boolean isOriginatingProfile() {
        String profile = getArguments().getString(PROFILE);
        return profile != null && profile.equals(AuthorColors.currentProfile());
    }

    private void save(String author, String color) {
        if (isOriginatingProfile()) {
            AuthorColors.writeColor(getArguments().getString(PROFILE), author, color);
        }
        closeEditor();
    }

    private void closeEditor() {
        dismiss();
        returnToManager();
    }

    private void returnToManager() {
        FragmentManager fragments = getFragmentManager();
        if (getArguments().getBoolean(FROM_SETTINGS) && isOriginatingProfile()
                && canShow(getActivity(), fragments)) {
            show(fragments, getArguments().getString(PROFILE), null, false);
        }
    }

    private static String asHex(int color) {
        return String.format(Locale.ROOT, "#%06X", color & 0xffffff);
    }
}
