package dev.rikunode.futatabi.bridge;

import android.content.Context;
import android.content.SharedPreferences;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

/**
 * Stable virtual 13-digit futaba identifiers for UUID threads / attachments.
 * Never send a generated ID upstream. Maps are persisted independently of
 * Flutter's board list, and work with cloned package storage.
 */
final class BridgeIndex {
    private final SharedPreferences prefs;
    BridgeIndex(Context context) {
        prefs = context.getSharedPreferences("futatabi_ids", Context.MODE_PRIVATE);
    }

    synchronized String threadId(String uuid) {
        return remember("thread.", uuid);
    }

    synchronized String imageId(String key, String originalUrl, String thumbnailUrl) {
        String id = remember("image.", key);
        if (originalUrl != null && originalUrl.startsWith("https://storage.nijiurachan.net/")) {
            prefs.edit().putString("src." + id, originalUrl).apply();
        }
        if (thumbnailUrl != null && thumbnailUrl.startsWith("https://storage.nijiurachan.net/")) {
            prefs.edit().putString("thumb." + id, thumbnailUrl).apply();
        }
        return id;
    }

    String threadUuid(String id) { return prefs.getString("thread." + id, null); }
    String imageUrl(String id, boolean thumb) {
        return prefs.getString((thumb ? "thumb." : "src.") + id, null);
    }

    synchronized String catalogThreadId(String uuid, java.util.Map<String,String> pending) {
        return remember("thread.",uuid,pending);
    }

    synchronized String catalogImageId(String key,String originalUrl,String thumbnailUrl,java.util.Map<String,String> pending) {
        String id=remember("image.",key,pending);
        if(originalUrl!=null&&originalUrl.startsWith("https://storage.nijiurachan.net/"))pending.put("src."+id,originalUrl);
        if(thumbnailUrl!=null&&thumbnailUrl.startsWith("https://storage.nijiurachan.net/"))pending.put("thumb."+id,thumbnailUrl);
        return id;
    }

    synchronized void commitCatalog(java.util.Map<String,String> pending) {
        if(pending.isEmpty())return;
        SharedPreferences.Editor editor=prefs.edit();
        for(java.util.Map.Entry<String,String> entry:pending.entrySet())editor.putString(entry.getKey(),entry.getValue());
        if(!editor.commit())throw new IllegalStateException("Catalog index save failed");
    }

    private String remember(String kind, String value) {
        return remember(kind,value,null);
    }
    private String remember(String kind, String value, java.util.Map<String,String> pending) {
        if (value == null || value.isEmpty()) throw new IllegalArgumentException("Missing source ID");
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] bytes = digest.digest((kind + value).getBytes(StandardCharsets.UTF_8));
            long n = 0;
            for (int i = 0; i < 8; i++) n = (n << 8) | (bytes[i] & 0xffL);
            long candidate = 1000000000000L + ((n & Long.MAX_VALUE) % 9000000000000L);
            for (int attempts = 0; attempts < 100; attempts++, candidate++) {
                if (candidate > 9999999999999L) candidate = 1000000000000L;
                String id = Long.toString(candidate);
                String previous = pending!=null&&pending.containsKey(kind+id)?pending.get(kind+id):prefs.getString(kind + id, null);
                if (previous == null || previous.equals(value)) {
                    if (previous == null) {
                        if(pending!=null)pending.put(kind+id,value);
                        else prefs.edit().putString(kind + id, value).commit();
                    }
                    return id;
                }
            }
        } catch (Exception e) {
            throw new IllegalStateException("Virtual ID generation failed", e);
        }
        throw new IllegalStateException("Too many virtual ID collisions");
    }
}
