package app.template.extension.forwarding;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/** Immutable forwarding configuration. Chat identifiers are Telegram dialog IDs. */
public final class ForwardingRule {
    public enum DeliveryMode { FORWARD, COPY }
    public enum MatchMode { ANY, ALL }

    private final String id;
    private final String name;
    private final boolean enabled;
    private final Set<Long> sourceChatIds;
    private final Set<Long> destinationChatIds;
    private final List<String> includeKeywords;
    private final List<String> excludeKeywords;
    private final MatchMode matchMode;
    private final boolean caseSensitive;
    private final DeliveryMode deliveryMode;
    private final boolean showSenderName;

    public ForwardingRule(
            String id,
            String name,
            boolean enabled,
            Set<Long> sourceChatIds,
            Set<Long> destinationChatIds,
            List<String> includeKeywords,
            List<String> excludeKeywords,
            MatchMode matchMode,
            boolean caseSensitive,
            DeliveryMode deliveryMode) {
        this(id, name, enabled, sourceChatIds, destinationChatIds, includeKeywords, excludeKeywords, matchMode, caseSensitive, deliveryMode, false);
    }

    public ForwardingRule(
            String id, String name, boolean enabled, Set<Long> sourceChatIds, Set<Long> destinationChatIds,
            List<String> includeKeywords, List<String> excludeKeywords, MatchMode matchMode,
            boolean caseSensitive, DeliveryMode deliveryMode, boolean showSenderName) {
        if (id == null || id.trim().isEmpty()) throw new IllegalArgumentException("Rule id is required");
        if (name == null || name.trim().isEmpty()) throw new IllegalArgumentException("Rule name is required");
        this.id = id;
        this.name = name;
        this.enabled = enabled;
        this.sourceChatIds = immutableSet(sourceChatIds);
        this.destinationChatIds = immutableSet(destinationChatIds);
        this.includeKeywords = immutableList(includeKeywords);
        this.excludeKeywords = immutableList(excludeKeywords);
        this.matchMode = matchMode == null ? MatchMode.ANY : matchMode;
        this.caseSensitive = caseSensitive;
        this.deliveryMode = deliveryMode == null ? DeliveryMode.FORWARD : deliveryMode;
        this.showSenderName = showSenderName;
        if (this.sourceChatIds.isEmpty()) throw new IllegalArgumentException("At least one source chat is required");
        if (this.destinationChatIds.isEmpty()) throw new IllegalArgumentException("At least one destination chat is required");
    }

    private static Set<Long> immutableSet(Set<Long> values) {
        if (values == null) return Collections.emptySet();
        LinkedHashSet<Long> copy = new LinkedHashSet<>();
        for (Long value : values) if (value != null) copy.add(value);
        return Collections.unmodifiableSet(copy);
    }

    private static List<String> immutableList(List<String> values) {
        if (values == null) return Collections.emptyList();
        ArrayList<String> copy = new ArrayList<>();
        for (String value : values) if (value != null && !value.trim().isEmpty()) copy.add(value.trim());
        return Collections.unmodifiableList(copy);
    }

    public String getId() { return id; }
    public String getName() { return name; }
    public boolean isEnabled() { return enabled; }
    public Set<Long> getSourceChatIds() { return sourceChatIds; }
    public Set<Long> getDestinationChatIds() { return destinationChatIds; }
    public List<String> getIncludeKeywords() { return includeKeywords; }
    public List<String> getExcludeKeywords() { return excludeKeywords; }
    public MatchMode getMatchMode() { return matchMode; }
    public boolean isCaseSensitive() { return caseSensitive; }
    public DeliveryMode getDeliveryMode() { return deliveryMode; }
    public boolean isShowSenderName() { return showSenderName; }
}
