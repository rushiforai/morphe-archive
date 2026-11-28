package app.template.extension.zalo.settings;

import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

public final class AnhpanUiHelper {

    private AnhpanUiHelper() { }

    public static CharSequence filterReadOnlyLabel(CharSequence text) {
        if (text != null && "This chat is locked.".contentEquals(text)) {
            return "";
        }
        return text;
    }

    public static void hideReadOnlySubtitleIfNeeded(View actionBar) {
        if (actionBar == null || !AnhpanPrefs.isReadOnlySubtitleHidden(actionBar.getContext())) {
            return;
        }
        int titleId = actionBar.getResources().getIdentifier(
            "actionbar_txtTitle", "id", actionBar.getContext().getPackageName()
        );
        if (titleId == 0) return;
        View titleView = actionBar.findViewById(titleId);
        if (titleView == null || !(titleView.getParent() instanceof ViewGroup)) return;

        ViewGroup parent = (ViewGroup) titleView.getParent();
        View root = actionBar.getRootView();
        boolean isReadOnly = hasReadOnlyBanner(root);
        for (int i = 0; i < parent.getChildCount(); i++) {
            View child = parent.getChildAt(i);
            if (child != titleView && child instanceof TextView) {
                child.setVisibility(isReadOnly ? View.GONE : View.VISIBLE);
            }
        }
    }

    private static boolean hasReadOnlyBanner(View root) {
        if (root == null) return false;
        if (root instanceof TextView) {
            CharSequence t = ((TextView) root).getText();
            if (t != null && ("This chat is locked.".contentEquals(t) || "(Read Only)".contentEquals(t))) {
                return true;
            }
        }
        if (root instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) root;
            for (int i = 0; i < vg.getChildCount(); i++) {
                if (hasReadOnlyBanner(vg.getChildAt(i))) return true;
            }
        }
        return false;
    }

    public static void removeChatBubbleBorderIfNeeded(View chatRow) {
        if (chatRow == null || !AnhpanPrefs.isChatBubbleBorderRemoved(chatRow.getContext())) {
            return;
        }
        android.util.Log.d("AnhpanDebug", "removeChatBubbleBorderIfNeeded view=" + chatRow.getClass().getSimpleName());
        chatRow.setBackground(null);
        if (chatRow instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) chatRow;
            for (int i = 0; i < vg.getChildCount(); i++) {
                View child = vg.getChildAt(i);
                if (child.getBackground() != null) {
                    child.setBackground(null);
                }
            }
        }
    }

    public static void onBindNormalMsg(View view, Object pupVar) {
        if (view == null || pupVar == null) return;
        android.content.Context context = view.getContext();
        String convId = null;
        try {
            java.lang.reflect.Method eMethod = pupVar.getClass().getDeclaredMethod("e");
            eMethod.setAccessible(true);
            convId = (String) eMethod.invoke(pupVar);
        } catch (Throwable ignored) { }

        try {
            Object timeModule = view.getClass().getMethod("getMTime").invoke(view);
            if (timeModule != null) {
                String timeText = "";
                for (Class<?> cls = timeModule.getClass(); cls != null && timeText.isEmpty(); cls = cls.getSuperclass()) {
                    for (java.lang.reflect.Field f : cls.getDeclaredFields()) {
                        if (CharSequence.class.isAssignableFrom(f.getType())) {
                            f.setAccessible(true);
                            Object v = f.get(timeModule);
                            if (v instanceof CharSequence && v.toString().length() > 0) {
                                timeText = v.toString();
                                break;
                            }
                        }
                    }
                }
                boolean isDraft = "Draft".equalsIgnoreCase(timeText) || "Bản nháp".equalsIgnoreCase(timeText);
                boolean hide = isDraft ? AnhpanPrefs.isDraftPreviewHidden(context) : AnhpanPrefs.isChatTimeHidden(context);
                timeModule.getClass().getMethod("o0", int.class).invoke(
                    timeModule, hide ? View.GONE : View.VISIBLE
                );
            }
        } catch (Throwable ignored) { }

        if (convId != null && AnhpanPrefs.isChatPreviewHidden(context, convId)) {
            try {
                Object listItem = view.getClass().getMethod("getMListItemModule").invoke(view);
                if (listItem != null) {
                    for (java.lang.reflect.Method m : listItem.getClass().getMethods()) {
                        if (m.getParameterTypes().length == 1 && m.getParameterTypes()[0] == CharSequence.class) {
                            m.invoke(listItem, "");
                            break;
                        }
                    }
                }
            } catch (Throwable ignored) { }
        }

        if (convId != null) {
            try {
                Object avatar = view.getClass().getMethod("getMAvatar").invoke(view);
                if (avatar != null) {
                    boolean hideAvatar = AnhpanPrefs.isChatAvatarHidden(context, convId);
                    avatar.getClass().getMethod("o0", int.class).invoke(avatar, hideAvatar ? View.GONE : View.VISIBLE);
                }
            } catch (Throwable ignored) { }
        }


        try {
            Object timeModule = view.getClass().getMethod("getMTime").invoke(view);
            if (timeModule != null) {
                String timeText = "";
                for (Class<?> cls = timeModule.getClass(); cls != null && timeText.isEmpty(); cls = cls.getSuperclass()) {
                    for (java.lang.reflect.Field f : cls.getDeclaredFields()) {
                        if (CharSequence.class.isAssignableFrom(f.getType())) {
                            f.setAccessible(true);
                            Object v = f.get(timeModule);
                            if (v instanceof CharSequence && v.toString().length() > 0) {
                                timeText = v.toString();
                                break;
                            }
                        }
                    }
                }
                boolean isDraft = "Draft".equalsIgnoreCase(timeText) || "Bản nháp".equalsIgnoreCase(timeText);
                boolean hide = isDraft ? AnhpanPrefs.isDraftPreviewHidden(context) : AnhpanPrefs.isChatTimeHidden(context);
                timeModule.getClass().getMethod("o0", int.class).invoke(
                    timeModule, hide ? View.GONE : View.VISIBLE
                );
            }
        } catch (Throwable ignored) { }

        if (convId != null && AnhpanPrefs.isChatPreviewHidden(context, convId)) {
            try {
                Object listItem = view.getClass().getMethod("getMListItemModule").invoke(view);
                if (listItem != null) {
                    for (java.lang.reflect.Method m : listItem.getClass().getMethods()) {
                        if (m.getParameterTypes().length == 1 && m.getParameterTypes()[0] == CharSequence.class) {
                            m.invoke(listItem, "");
                            break;
                        }
                    }
                }
            } catch (Throwable ignored) { }
        }

        if (convId != null) {
            String customName = AnhpanPrefs.getCustomName(context, convId);
            if (customName != null) {
                try {
                    Object listItem = view.getClass().getMethod("getMListItemModule").invoke(view);
                    if (listItem != null) {
                        int matchCount = 0;
                        for (java.lang.reflect.Method m : listItem.getClass().getMethods()) {
                            if (m.getParameterTypes().length == 1 && m.getParameterTypes()[0] == CharSequence.class) {
                                matchCount++;
                                if (matchCount == 2) {
                                    m.invoke(listItem, customName);
                                }
                            }
                        }
                    }
                } catch (Throwable t) {
                    android.util.Log.e("AnhpanDebug", "Failed to set customName on getMListItemModule", t);
                }
            }
        }
    }

    private static boolean isMyCloud(View view, String convId, Object pupVar) {
        if (convId != null && (convId.contains("cloud") || convId.equals("0"))) return true;
        try {
            Object listItem = view.getClass().getMethod("getMListItemModule").invoke(view);
            if (listItem != null) {
                for (Class<?> cls = listItem.getClass(); cls != null; cls = cls.getSuperclass()) {
                    for (java.lang.reflect.Field f : cls.getDeclaredFields()) {
                        if (CharSequence.class.isAssignableFrom(f.getType())) {
                            f.setAccessible(true);
                            Object v = f.get(listItem);
                            if (v instanceof CharSequence) {
                                String s = v.toString();
                                if ("My Documents".equals(s) || "Cloud của tôi".equals(s) || "My Cloud".equals(s)) {
                                    return true;
                                }
                            }
                        }
                    }
                }
            }
        } catch (Throwable ignored) { }
        return false;
    }

    private static boolean isOfficialAccount(Object pupVar) {
        try {
            java.lang.reflect.Method gMethod = pupVar.getClass().getDeclaredMethod("g");
            gMethod.setAccessible(true);
            Object res = gMethod.invoke(pupVar);
            return Boolean.TRUE.equals(res);
        } catch (Throwable ignored) { }
        return false;
    }

    public static String stripPreviewEmojis(String input) {
        if (input == null || input.isEmpty()) return input;
        StringBuilder sb = new StringBuilder();
        int emojiCount = 0;
        int i = 0;
        while (i < input.length()) {
            int cp = input.codePointAt(i);
            int charCount = Character.charCount(cp);
            if (isEmojiCodePoint(cp)) {
                emojiCount++;
            } else {
                sb.appendCodePoint(cp);
            }
            i += charCount;
        }
        String stripped = sb.toString().trim();
        if (emojiCount > 0 && stripped.isEmpty()) {
            return "emoji";
        }
        return stripped;
    }

    private static boolean isEmojiCodePoint(int cp) {
        return (cp >= 0x1F300 && cp <= 0x1FAFF)
            || (cp >= 0x2600 && cp <= 0x27BF)
            || (cp >= 0xFE00 && cp <= 0xFE0F)
            || cp == 0x200D;
    }
}
