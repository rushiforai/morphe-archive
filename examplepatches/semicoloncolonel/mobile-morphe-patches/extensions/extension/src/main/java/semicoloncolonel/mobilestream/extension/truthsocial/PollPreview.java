package semicoloncolonel.mobilestream.extension.truthsocial;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.List;

/**
 * Truth Social "Show poll results": the server sends each option's vote
 * count, but the app shows the counts only after you vote. Before you vote,
 * this adds each option's share of the votes to its label, so you can see
 * the results and still vote. Called at the start of the Poll constructor.
 */
@SuppressWarnings("unused")
public final class PollPreview {
    private PollPreview() {
    }

    public static void annotate(List<?> options, int votesCount, Boolean voted, boolean expired) {
        if (options == null || options.isEmpty() || expired || Boolean.TRUE.equals(voted)) return;
        try {
            int total = 0;
            for (Object option : options) total += votes(option);
            if (total <= 0) total = votesCount;
            for (Object option : options) {
                if (option == null) continue;
                Field title = field(option.getClass(), String.class);
                if (title == null) return;
                String text = (String) title.get(option);
                if (text == null || text.endsWith("%")) continue;
                int percent = total > 0 ? Math.round(votes(option) * 100f / total) : 0;
                title.set(option, text + " · " + percent + "%");
            }
        } catch (Throwable ignored) {
            // Leave the poll as the server sent it.
        }
    }

    private static int votes(Object option) throws IllegalAccessException {
        if (option == null) return 0;
        Field count = field(option.getClass(), Integer.class);
        Object value = count == null ? null : count.get(option);
        return value instanceof Integer ? (Integer) value : 0;
    }

    private static Field field(Class<?> type, Class<?> fieldType) {
        for (Field f : type.getDeclaredFields()) {
            if (f.getType() == fieldType && !Modifier.isStatic(f.getModifiers())) {
                f.setAccessible(true);
                return f;
            }
        }
        return null;
    }
}
