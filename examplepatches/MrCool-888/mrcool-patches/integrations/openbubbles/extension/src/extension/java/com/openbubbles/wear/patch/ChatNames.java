package com.openbubbles.wear.patch;

import org.json.JSONArray;
import org.json.JSONObject;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

/** Names are presentation only; backend IDs and recipient addresses stay unchanged. */
final class ChatNames {
    interface Lookup { String name(String address) throws Exception; }
    private static final Pattern PHONE = Pattern.compile("(?i)^(?:tel:|sms:|smsto:)?[+0-9 ().-]+$");
    private static final Pattern EMAIL = Pattern.compile("(?i)^(?:mailto:)?[^\\s@<>]+@[^\\s@<>]+$");
    private final Lookup lookup;
    private final Map<String, String> cache = new HashMap<>();

    ChatNames(Lookup lookup) { this.lookup = lookup; }

    String name(String raw) {
        String address = BridgeOps.normalizeAddress(raw);
        if (address == null) return null;
        if (cache.containsKey(address)) return cache.get(address);
        String value = null;
        try { value = lookup.name(address); } catch (Exception ignored) { }
        if (value != null) value = value.trim();
        if (value != null && (value.isEmpty() || rawAddress(value) ||
                BridgeOps.validChatGuid(value) || value.equalsIgnoreCase(address))) value = null;
        cache.put(address, value);
        return value;
    }

    String sender(String raw) {
        String resolved = name(raw);
        return resolved == null ? raw : resolved;
    }

    void apply(JSONObject chat) throws Exception {
        String current = chat.optString("title").trim();
        String id = chat.optString("id");
        if (meaningful(current, id)) return;
        boolean group = chat.optBoolean("isGroup");
        JSONArray participants = chat.optJSONArray("participants");
        List<String> labels = new ArrayList<>();
        if (participants != null) {
            for (int i = 0; i < participants.length(); i++) {
                String raw = participants.optString(i);
                if (raw.trim().isEmpty()) continue;
                String resolved = name(raw);
                labels.add(resolved == null ? raw : resolved);
            }
        }
        String title;
        if (group) {
            title = labels.isEmpty() ? "Group" : String.join(", ", labels);
        } else {
            String address = chat.optString("address");
            if (address.isEmpty() && participants != null && participants.length() == 1)
                address = participants.optString(0);
            String resolved = name(address);
            title = resolved != null ? resolved : !address.isEmpty() ? address :
                    !labels.isEmpty() ? labels.get(0) : "Conversation";
        }
        chat.put("title", BridgeOps.bounded(title, 160));
    }

    private static boolean meaningful(String title, String id) {
        if (title.isEmpty() || title.equals(id) || BridgeOps.validChatGuid(title) ||
                BridgeOps.isChatIdentifier(title) ||
                title.equalsIgnoreCase("Conversation") || title.equalsIgnoreCase("Group") ||
                title.equalsIgnoreCase("Chat") || title.equalsIgnoreCase("Unknown") || rawAddress(title)) return false;
        String[] parts = title.split(",");
        if (parts.length > 1) {
            boolean addressesOnly = true;
            for (String part : parts) addressesOnly &= rawAddress(part.trim());
            if (addressesOnly) return false;
        }
        return true;
    }

    private static boolean rawAddress(String value) {
        return EMAIL.matcher(value).matches() ||
                PHONE.matcher(value).matches() && value.replaceAll("[^0-9]", "").length() >= 5;
    }
}

