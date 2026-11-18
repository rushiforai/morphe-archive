package io.github.sabopura.morphe.extension.twitch.chat.emotes;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.ui.EmoteSheet;
import io.github.sabopura.morphe.extension.twitch.ui.Ui;
import android.text.*;
import android.view.*;
import android.widget.*;

import io.github.sabopura.morphe.extension.twitch.chat.*;

import java.util.*;

public final class EmotePicker {
    private static final WeakHashMap<EditText, Boolean> ATTACHED = new WeakHashMap<>();

    public static void show(EditText target) {
        EmoteSheet.show(target, ChatEnhancements.channelId());
    }

    public static void attach(EditText input) {
        if (ATTACHED.put(input, true) != null) return;
        android.content.Context context = input.getContext();
        Ui ui = Ui.of(context);
        ListPopupWindow popup = new ListPopupWindow(context);
        popup.setAnchorView(input);
        popup.setModal(false);
        popup.setBackgroundDrawable(Ui.rounded(context, ui.surface, 12));
        List<String> names = new ArrayList<>();
        BaseAdapter adapter = new BaseAdapter() {
            public int getCount() {
                return names.size();
            }

            public Object getItem(int position) {
                return names.get(position);
            }

            public long getItemId(int position) {
                return position;
            }

            public View getView(int position, View recycled, ViewGroup parent) {
                Suggestion row = recycled instanceof Suggestion ? (Suggestion) recycled : new Suggestion(context, ui);
                try {
                    row.bind(names.get(position));
                } catch (RuntimeException | LinkageError e) {
                    Diagnostics.note("emotes.completion-row", e);
                }
                return row;
            }
        };
        popup.setAdapter(adapter);
        // An image that arrives while the list is up fills in its row.
        java.util.function.Consumer<String> onImage = url -> {
            if (popup.isShowing()) adapter.notifyDataSetChanged();
        };
        popup.setOnDismissListener(() -> EmoteSupport.removeImageListener(onImage));
        popup.setOnItemClickListener(
                (a, v, p, id) -> {
                    try {
                        insert(input, names.get(p), true);
                    } catch (RuntimeException | LinkageError e) {
                        Diagnostics.note("emotes.completion-pick", e);
                    }
                    popup.dismiss();
                });
        input.addTextChangedListener(
                new TextWatcher() {
                    public void beforeTextChanged(CharSequence s, int a, int c, int f) {}

                    public void onTextChanged(CharSequence s, int a, int b, int c) {}

                    public void afterTextChanged(Editable e) {
                        closeToken(input, e);
                    }
                });
        input.addTextChangedListener(
                watch(
                        () -> {
                            try {
                                if (!input.hasFocus()
                                        || !ChatSettings.preferences(input.getContext())
                                                .getBoolean("emote_completion", true)) {
                                    popup.dismiss();
                                    return;
                                }
                                int end = input.getSelectionStart(),
                                        start = tokenStart(input.getText(), end);
                                if (end < 0
                                        || end - start < 2
                                        || input.getText().charAt(start) != ':') {
                                    popup.dismiss();
                                    return;
                                }
                                names.clear();
                                names.addAll(EmoteCompletion.rank(
                                        EmoteSupport.names(input.getContext(), ChatEnhancements.channelId()),
                                        input.getText().subSequence(start + 1, end).toString(),
                                        20));
                                adapter.notifyDataSetChanged();
                                if (names.isEmpty()) {
                                    popup.dismiss();
                                } else {
                                    EmoteSupport.addImageListener(onImage);
                                    popup.show();
                                }
                            } catch (RuntimeException | LinkageError e) {
                                Diagnostics.note("emotes.completion", e);
                                closeQuietly(popup);
                            }
                        }));
        input.addOnAttachStateChangeListener(
                new View.OnAttachStateChangeListener() {
                    public void onViewAttachedToWindow(View v) {}

                    public void onViewDetachedFromWindow(View v) {
                        popup.dismiss();
                    }
                });
    }

    /** One suggestion after ':': the emote's image beside its name, since names alone are easy to mix up. */
    private static final class Suggestion extends LinearLayout {
        private final EmoteImageView image;
        private final TextView name;

        Suggestion(android.content.Context context, Ui ui) {
            super(context);
            setGravity(Gravity.CENTER_VERTICAL);
            setMinimumHeight(Ui.dp(context, 44));
            setPadding(Ui.dp(context, 12), Ui.dp(context, 4), Ui.dp(context, 16), Ui.dp(context, 4));
            image = new EmoteImageView(context);
            addView(image, new LayoutParams(Ui.dp(context, 32), Ui.dp(context, 32)));
            name = ui.text(context, "", 15, ui.text, false);
            name.setPadding(Ui.dp(context, 12), 0, 0, 0);
            name.setSingleLine(true);
            addView(name);
        }

        void bind(String emoteName) {
            name.setText(emoteName);
            Emote emote = EmoteSupport.find(getContext(), ChatEnhancements.channelId(), emoteName);
            EmoteImageLoader.Image loaded = emote == null ? null : EmoteSupport.images().image(getResources(), emote);
            image.show(loaded);
            if (emote != null && loaded == null) EmoteSupport.images().request(getContext(), emote, Ui.dp(getContext(), 32));
        }
    }

    /** ":name:" of a known emote becomes "name" the moment its closing colon is typed. */
    private static void closeToken(EditText input, Editable text) {
        try {
            if (!ChatSettings.preferences(input.getContext()).getBoolean("emote_completion", true)) return;
            int end = input.getSelectionStart(), start = tokenStart(text, end);
            if (end < 0 || end > text.length() || end - start < 3) return;
            android.content.Context c = input.getContext();
            String channel = ChatEnhancements.channelId();
            String name = EmoteCompletion.closedName(text.subSequence(start, end).toString(),
                    candidate -> EmoteSupport.find(c, channel, candidate) != null);
            if (name != null) text.replace(start, end, name);
        } catch (RuntimeException | LinkageError failure) {
            // A typing aid must never get in the way of the message box.
        }
    }

    public static int tokenStart(CharSequence text, int cursor) {
        if (cursor < 0) return 0;
        int s = Math.min(cursor, text.length());
        while (s > 0 && !Character.isWhitespace(text.charAt(s - 1))) s--;
        return s;
    }

    /** Puts an emote's name at the cursor of the message box. Nothing is sent. */
    public static void insert(EditText target, String name) {
        insert(target, name, false);
    }

    private static void insert(EditText t, String name, boolean completion) {
        int end = Math.max(0, t.getSelectionEnd()), start = Math.max(0, t.getSelectionStart());
        if (completion) start = tokenStart(t.getText(), start);
        if (start > end) {
            int n = start;
            start = end;
            end = n;
        }
        t.getText().replace(start, end, name + " ");
        t.setSelection(Math.min(t.length(), start + name.length() + 1));
    }

    /** Closes the suggestions after a failure; dismissing can fail too once their window is gone. */
    private static void closeQuietly(ListPopupWindow popup) {
        try {
            if (popup.isShowing()) popup.dismiss();
        } catch (RuntimeException ignored) {
        }
    }

    private static TextWatcher watch(Runnable r) {
        return new TextWatcher() {
            public void beforeTextChanged(CharSequence s, int a, int c, int f) {}

            public void onTextChanged(CharSequence s, int a, int b, int c) {
                r.run();
            }

            public void afterTextChanged(Editable e) {}
        };
    }
}
