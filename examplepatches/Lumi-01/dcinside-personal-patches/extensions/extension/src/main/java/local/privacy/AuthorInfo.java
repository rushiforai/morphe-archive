package local.privacy;

import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.concurrent.ConcurrentHashMap;
import java.util.WeakHashMap;

/** Displays only author identifiers already supplied by the app's post data. */
public final class AuthorInfo {
    private static final ConcurrentHashMap<Class<?>, ConcurrentHashMap<String, Method>> GETTERS =
            new ConcurrentHashMap<>();
    private static volatile int cachedNameId;
    private static String postId = "S", commentId = "h0", headerId = "W1";
    private static String headerIp = "b";
    private static String commentIp = "";
    private static final WeakHashMap<TextView, WeakReference<TextView>> BUTTONS = new WeakHashMap<>();
    private AuthorInfo() { }
    public static void configure(String post, String comment, String header, String ip, String replyIp) {
        postId = post;
        commentId = comment;
        headerId = header;
        headerIp = ip;
        commentIp = replyIp;
    }
    public static void configure(String post, String comment, String header, String ip) {
        configure(post, comment, header, ip, "");
    }

    private static String value(Object item, String getter) {
        if (item == null) return null;
        try {
            Class<?> type = item.getClass();
            ConcurrentHashMap<String, Method> methods = GETTERS.computeIfAbsent(type,
                    unused -> new ConcurrentHashMap<>());
            Method method = methods.get(getter);
            if (method == null) {
                Method resolved = type.getDeclaredMethod(getter);
                Method existing = methods.putIfAbsent(getter, resolved);
                method = existing == null ? resolved : existing;
            }
            Object result = method.invoke(item);
            return result instanceof String ? (String) result : null;
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return null;
        }
    }

    private static String withId(String name, String id) {
        if (name == null) name = "";
        if (id == null) return name;
        String visibleId = id.trim();
        if (visibleId.isEmpty() || visibleId.equals(name)) return name;
        return name + " (" + visibleId + ")";
    }

    public static String listName(Object post, String name) {
        return withId(name, SettingsState.get("show_author_id") ? value(post, postId) : null);
    }

    public static String commentName(Object comment, String name) {
        return withId(name, SettingsState.get("show_author_id") ? value(comment, commentId) : null);
    }

    public static SpannableStringBuilder decorateCommentName(Object comment, SpannableStringBuilder rendered) {
        if (comment == null || rendered == null) return rendered;
        String userId = SettingsState.get("show_author_id") ? value(comment, commentId) : null;
        String ip = SettingsState.get("show_ip_info") ? value(comment, commentIp) : null;
        String original = rendered.toString();
        SpannableStringBuilder updated = new SpannableStringBuilder(rendered);
        if (userId != null) {
            String id = userId.trim();
            if (!id.isEmpty() && !original.contains("(" + id + ")")) {
                String ipText = ip == null ? "" : ip.trim();
                int ipStart = ipText.isEmpty() ? -1 : original.indexOf("(" + ipText + ")");
                if (ipStart >= 0) updated.insert(ipStart, "(" + id + ") ");
                else updated.append(" (" + id + ")");
            }
        }
        if (ip != null && !ip.trim().isEmpty()) {
            String visibleIp = ip.trim();
            String current = updated.toString();
            if (!current.contains(visibleIp)) updated.append(" (" + visibleIp + ")");
            String estimate = IpInfo.estimateForIp(visibleIp);
            if (estimate != null && !updated.toString().contains(estimate)) updated.append(" · ").append(estimate);
        }
        return updated;
    }

    public static void applyPostHeader(View header, Object post) {
        if (header == null || post == null) return;
        int nameId = cachedNameId;
        if (nameId == 0) {
            String packageName = header.getContext().getPackageName();
            nameId = header.getResources().getIdentifier("read_header_name", "id", packageName);
            if (nameId != 0) cachedNameId = nameId;
        }
        if (nameId == 0) return;
        View nameView = header.findViewById(nameId);
        if (!(nameView instanceof TextView)) return;
        TextView name = (TextView) nameView;
        TextView button = findOrCreateButton(name);
        final int tagId = nameId;
        boolean showId = SettingsState.get("show_author_id");
        boolean showIp = SettingsState.get("show_ip_info");
        name.setTag(tagId, post);
        if (!showId && !showIp) {
            if (button != null) {
                button.setVisibility(View.GONE);
                button.setOnClickListener(null);
            }
            return;
        }
        String userId = showId ? value(post, headerId) : null;
        String rawIp = value(post, headerIp);
        name.post(() -> {
            if (name.getTag(tagId) != post) return;
            decoratePostName(name, userId, rawIp);
            boolean hasIp = SettingsState.get("show_ip_info")
                    && rawIp != null && !rawIp.trim().isEmpty();
            if (!hasIp) {
                if (button != null) {
                    button.setVisibility(View.GONE);
                    button.setOnClickListener(null);
                }
                return;
            }
            boolean open = !SettingsState.get("collapse_long_ip_info");
            setExpanded(name, button, open);
            if (button != null) {
                button.setVisibility(View.VISIBLE);
                button.setOnClickListener(view -> setExpanded(name, button, name.getMaxLines() == 1));
            }
            if (button != null && !open) name.post(() -> {
                if (name.getTag(tagId) != post || name.getLayout() == null) return;
                // A short name and range need no expand control.
                if (name.getLayout().getEllipsisCount(0) == 0) button.setVisibility(View.GONE);
            });
        });
    }

    private static void setExpanded(TextView name, TextView button, boolean expanded) {
        name.setSingleLine(!expanded);
        if (expanded) {
            name.setMaxLines(Integer.MAX_VALUE);
            name.setEllipsize(null);
        } else {
            name.setEllipsize(TextUtils.TruncateAt.END);
        }
        if (button != null) {
            button.setText(expanded ? "접기" : "펼치기");
            button.setContentDescription(expanded ? "IP 정보 접기" : "IP 정보 펼치기");
        }
    }

    private static void decoratePostName(TextView name, String userId, String rawIp) {
        CharSequence current = name.getText();
        if (current == null || current.length() == 0) return;
        String text = current.toString();
        String ip = rawIp == null ? "" : rawIp.trim();
        SpannableStringBuilder updated = new SpannableStringBuilder(current);
        if (SettingsState.get("show_ip_info") && !ip.isEmpty() && !text.contains(ip)) {
            updated.append(" (" + ip + ")");
            text = updated.toString();
        }
        if (SettingsState.get("show_author_id") && userId != null) {
            String id = userId.trim();
            if (!id.isEmpty() && !text.contains("(" + id + ")")) {
                int ipStart = ip.isEmpty() ? -1 : text.indexOf("(" + ip + ")");
                if (ipStart >= 0) updated.insert(ipStart, "(" + id + ") ");
                else updated.append(" (" + id + ")");
            }
        }
        if (SettingsState.get("show_ip_info") && !ip.isEmpty()) {
            String estimate = IpInfo.estimateForIp(ip);
            if (estimate != null && !updated.toString().contains(estimate)) updated.append(" · ").append(estimate);
        }
        name.setText(updated);
    }

    private static TextView findOrCreateButton(TextView name) {
        synchronized (BUTTONS) {
            WeakReference<TextView> reference = BUTTONS.get(name);
            TextView button = reference == null ? null : reference.get();
            if (button != null) return button;
            ViewParent parent = name.getParent();
            if (!(parent instanceof ViewGroup)) return null;
            ViewGroup group = (ViewGroup) parent;
            button = new TextView(name.getContext());
            button.setId(View.generateViewId());
            button.setTextSize(12);
            button.setGravity(Gravity.CENTER);
            button.setPadding(dp(name, 6), 0, dp(name, 6), 0);
            button.setTextColor(name.getCurrentTextColor());
            button.setSingleLine(true);
            try {
                if (group.getClass().getName().contains("ConstraintLayout")) {
                    Class<?> paramsType = Class.forName("androidx.constraintlayout.widget.ConstraintLayout$LayoutParams");
                    Object buttonParams = paramsType.getConstructor(int.class, int.class)
                            .newInstance(dp(name, 68), ViewGroup.LayoutParams.WRAP_CONTENT);
                    setConstraint(buttonParams, "startToEnd", name.getId());
                    setConstraint(buttonParams, "endToEnd", 0);
                    setConstraint(buttonParams, "topToTop", name.getId());
                    setConstraint(buttonParams, "bottomToBottom", name.getId());
                    group.addView(button, (ViewGroup.LayoutParams) buttonParams);
                    ViewGroup.LayoutParams nameParams = name.getLayoutParams();
                    setConstraint(nameParams, "endToStart", button.getId());
                    setConstraint(nameParams, "endToEnd", -1);
                    name.setLayoutParams(nameParams);
                } else if (group instanceof LinearLayout) {
                    ViewGroup.LayoutParams raw = name.getLayoutParams();
                    if (raw instanceof LinearLayout.LayoutParams) {
                        LinearLayout.LayoutParams nameParams = (LinearLayout.LayoutParams) raw;
                        nameParams.width = 0;
                        nameParams.weight = 1;
                        name.setLayoutParams(nameParams);
                    }
                    int index = group.indexOfChild(name);
                    group.addView(button, Math.max(0, index + 1),
                            new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                                    ViewGroup.LayoutParams.MATCH_PARENT));
                } else {
                    return null;
                }
                BUTTONS.put(name, new WeakReference<>(button));
                return button;
            } catch (ReflectiveOperationException | RuntimeException ignored) {
                if (button.getParent() instanceof ViewGroup) ((ViewGroup) button.getParent()).removeView(button);
                return null;
            }
        }
    }

    private static void setConstraint(Object params, String fieldName, int value)
            throws ReflectiveOperationException {
        params.getClass().getField(fieldName).setInt(params, value);
    }

    private static int dp(View view, int value) {
        return Math.round(value * view.getResources().getDisplayMetrics().density);
    }
}
