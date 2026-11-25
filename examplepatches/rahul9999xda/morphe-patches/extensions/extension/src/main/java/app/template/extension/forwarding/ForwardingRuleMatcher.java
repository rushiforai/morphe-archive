package app.template.extension.forwarding;

import java.util.List;
import java.util.Locale;

/** Pure matching logic; deliberately has no Telegram or Android dependencies. */
public final class ForwardingRuleMatcher {
    private ForwardingRuleMatcher() { }

    public static boolean matches(ForwardingRule rule, ForwardingMessage message) {
        if (rule == null || message == null || !rule.isEnabled()) return false;
        if (!rule.getSourceChatIds().contains(message.getSourceChatId())) return false;
        if (message.isOutgoing() || message.isSecretChat() || message.isServiceMessage()) return false;
        // No sticker/emoji-only preference is applied here. That feature was removed;
        // matching is intentionally identical for COPY and FORWARD modes.
        // Media-only messages have no searchable text, but must still reach COPY when
        // the rule has no keyword filters. Keyword rules naturally fail against an
        // empty body below, while unfiltered rules can copy photos/videos/documents.

        String body = normalize(message.getText(), rule.isCaseSensitive());
        for (String excluded : rule.getExcludeKeywords()) {
            if (contains(body, normalize(excluded, rule.isCaseSensitive()))) return false;
        }

        List<String> included = rule.getIncludeKeywords();
        if (included.isEmpty()) return true;
        if (rule.getMatchMode() == ForwardingRule.MatchMode.ALL) {
            for (String keyword : included) {
                if (!contains(body, normalize(keyword, rule.isCaseSensitive()))) return false;
            }
            return true;
        }
        for (String keyword : included) {
            if (contains(body, normalize(keyword, rule.isCaseSensitive()))) return true;
        }
        return false;
    }

    private static String normalize(String value, boolean caseSensitive) {
        String clean = value == null ? "" : value.trim();
        return caseSensitive ? clean : clean.toLowerCase(Locale.ROOT);
    }

    private static boolean contains(String body, String keyword) {
        return !keyword.isEmpty() && body.contains(keyword);
    }
}
