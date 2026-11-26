package de.mobile.archive;

import android.content.Context;
import android.util.Log;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import org.json.JSONArray;
import org.json.JSONObject;

public final class LocalArchiveStore {
    private static final String TAG = "MobileArchive";

    private final File rootDir;
    private final File listingsDir;
    private final File imagesDir;

    public static final class ListingMeta {
        public String adId;
        public String title;
        public String price;
        public long archivedAt;
        public boolean syncedToDrive;
        public boolean hasFullVip;
        public boolean fromDriveOnly;
        public List<String> imageUris = new ArrayList<>();
        public List<String> imageKeys = new ArrayList<>();

        public JSONObject toJson() {
            JSONObject obj = new JSONObject();
            try {
                obj.put("adId", adId != null ? adId : "");
                obj.put("title", title != null ? title : "");
                obj.put("price", price != null ? price : "");
                obj.put("archivedAt", archivedAt);
                obj.put("syncedToDrive", syncedToDrive);
                obj.put("hasFullVip", hasFullVip);
                JSONArray uris = new JSONArray();
                for (String u : imageUris) uris.put(u);
                obj.put("imageUris", uris);
                JSONArray keys = new JSONArray();
                for (String k : imageKeys) keys.put(k);
                obj.put("imageKeys", keys);
            } catch (Exception ignored) {
            }
            return obj;
        }

        public static ListingMeta fromJson(JSONObject obj) {
            if (obj == null) return null;
            ListingMeta m = new ListingMeta();
            m.adId = obj.optString("adId", "");
            m.title = obj.optString("title", "");
            m.price = obj.optString("price", "");
            m.archivedAt = obj.optLong("archivedAt", 0L);
            m.syncedToDrive = obj.optBoolean("syncedToDrive", false);
            m.hasFullVip = obj.optBoolean("hasFullVip", false);
            JSONArray uris = obj.optJSONArray("imageUris");
            if (uris != null) {
                for (int i = 0; i < uris.length(); i++) {
                    String u = uris.optString(i, "");
                    if (!u.isEmpty()) m.imageUris.add(u);
                }
            }
            JSONArray keys = obj.optJSONArray("imageKeys");
            if (keys != null) {
                for (int i = 0; i < keys.length(); i++) {
                    String k = keys.optString(i, "");
                    if (!k.isEmpty()) m.imageKeys.add(k);
                }
            }
            return m;
        }
    }

    public LocalArchiveStore(Context context) {
        this.rootDir = new File(context.getApplicationContext().getFilesDir(), "mobile_de_archive");
        this.listingsDir = new File(rootDir, "listings");
        this.imagesDir = new File(rootDir, "images");
        listingsDir.mkdirs();
        imagesDir.mkdirs();
    }

    private File listingDir(String adId) {
        String safe = adId.replaceAll("[^0-9A-Za-z_-]", "");
        File d = new File(listingsDir, safe);
        if (!d.exists()) d.mkdirs();
        return d;
    }

    public synchronized ListingMeta saveListing(String adId, String json, boolean isFullVip) {
        if (adId == null || adId.isEmpty() || json == null || json.isEmpty()) return null;
        try {
            File dir = listingDir(adId);
            File target = new File(dir, isFullVip ? "vip.json" : "parked.json");
            writeString(target, json);

            ListingMeta existing = readMeta(adId);
            ListingMeta meta = extractMeta(adId, json, isFullVip);
            if (existing != null) {
                if (!isFullVip && existing.hasFullVip) {
                    meta.hasFullVip = true;
                }
                if (meta.imageUris.isEmpty() && !existing.imageUris.isEmpty()) {
                    meta.imageUris = existing.imageUris;
                    meta.imageKeys = existing.imageKeys;
                }
                if (meta.title.isEmpty() && !existing.title.isEmpty()) {
                    meta.title = existing.title;
                }
                if (meta.price.isEmpty() && !existing.price.isEmpty()) {
                    meta.price = existing.price;
                }
            }
            meta.archivedAt = System.currentTimeMillis();
            meta.syncedToDrive = false;
            writeString(new File(dir, "meta.json"), meta.toJson().toString());
            return meta;
        } catch (Exception e) {
            Log.e(TAG, "Failed to save listing " + adId, e);
            return null;
        }
    }

    public synchronized void saveContact(String adId, String json) {
        if (adId == null || adId.isEmpty() || json == null || json.isEmpty()) return;
        try {
            writeString(new File(listingDir(adId), "contact.json"), json);
        } catch (Exception e) {
            Log.e(TAG, "Failed to save contact " + adId, e);
        }
    }

    public synchronized String getListingJson(String adId) {
        if (adId == null || adId.isEmpty()) return null;
        File dir = new File(listingsDir, adId.replaceAll("[^0-9A-Za-z_-]", ""));
        if (!dir.exists()) return null;
        File vip = new File(dir, "vip.json");
        if (vip.exists()) return readString(vip);
        File parked = new File(dir, "parked.json");
        if (parked.exists()) return readString(parked);
        return null;
    }

    public synchronized boolean hasFullVip(String adId) {
        if (adId == null || adId.isEmpty()) return false;
        File vip = new File(new File(listingsDir, adId.replaceAll("[^0-9A-Za-z_-]", "")), "vip.json");
        return vip.exists() && vip.length() > 10;
    }

    public boolean hasListing(String adId) {
        if (adId == null || adId.isEmpty()) return false;
        File dir = new File(listingsDir, adId.replaceAll("[^0-9A-Za-z_-]", ""));
        if (!dir.exists()) return false;
        File vip = new File(dir, "vip.json");
        if (vip.exists() && vip.length() > 10) return true;
        File parked = new File(dir, "parked.json");
        return parked.exists() && parked.length() > 10;
    }

    public synchronized String getContactJson(String adId) {
        if (adId == null || adId.isEmpty()) return null;
        File f = new File(new File(listingsDir, adId.replaceAll("[^0-9A-Za-z_-]", "")), "contact.json");
        return f.exists() ? readString(f) : null;
    }

    public synchronized ListingMeta readMeta(String adId) {
        if (adId == null || adId.isEmpty()) return null;
        File f = new File(new File(listingsDir, adId.replaceAll("[^0-9A-Za-z_-]", "")), "meta.json");
        if (!f.exists()) return null;
        String s = readString(f);
        if (s == null) return null;
        try {
            return ListingMeta.fromJson(new JSONObject(s));
        } catch (Exception e) {
            return null;
        }
    }

    public synchronized void markSynced(String adId, boolean synced) {
        ListingMeta meta = readMeta(adId);
        if (meta != null) {
            meta.syncedToDrive = synced;
            try {
                writeString(new File(listingDir(adId), "meta.json"), meta.toJson().toString());
            } catch (Exception ignored) {
            }
        }
    }

    public synchronized List<ListingMeta> listAllMeta() {
        List<ListingMeta> result = new ArrayList<>();
        File[] dirs = listingsDir.listFiles();
        if (dirs == null) return result;
        for (File d : dirs) {
            if (!d.isDirectory()) continue;
            ListingMeta meta = readMeta(d.getName());
            if (meta != null && !meta.adId.isEmpty()) {
                result.add(meta);
            }
        }
        Collections.sort(result, new Comparator<ListingMeta>() {
            @Override
            public int compare(ListingMeta a, ListingMeta b) {
                return Long.compare(b.archivedAt, a.archivedAt);
            }
        });
        return result;
    }

    public static final class StorageStats {
        public int listingCount;
        public int imageCount;
        public long listingsBytes;
        public long imagesBytes;

        public long totalBytes() {
            return listingsBytes + imagesBytes;
        }
    }

    public synchronized StorageStats getStorageStats() {
        StorageStats stats = new StorageStats();
        File[] dirs = listingsDir.listFiles();
        if (dirs != null) {
            for (File d : dirs) {
                if (!d.isDirectory()) continue;
                boolean hasJson = false;
                File[] files = d.listFiles();
                if (files != null) {
                    for (File f : files) {
                        if (f.isFile()) {
                            stats.listingsBytes += f.length();
                            String n = f.getName();
                            if ("vip.json".equals(n) || "parked.json".equals(n)) {
                                hasJson = true;
                            }
                        }
                    }
                }
                if (hasJson) stats.listingCount++;
            }
        }
        File[] imgs = imagesDir.listFiles();
        if (imgs != null) {
            for (File f : imgs) {
                if (f.isFile()) {
                    stats.imageCount++;
                    stats.imagesBytes += f.length();
                }
            }
        }
        return stats;
    }

    public synchronized boolean deleteListing(String adId) {
        if (adId == null || adId.isEmpty()) return false;
        File dir = new File(listingsDir, adId.replaceAll("[^0-9A-Za-z_-]", ""));
        if (!dir.exists()) return false;
        File[] files = dir.listFiles();
        if (files != null) {
            for (File f : files) {
                f.delete();
            }
        }
        return dir.delete();
    }

    public synchronized int clearImageCache() {
        File[] imgs = imagesDir.listFiles();
        if (imgs == null) return 0;
        int deleted = 0;
        for (File f : imgs) {
            if (f.isFile() && f.delete()) {
                deleted++;
            }
        }
        return deleted;
    }

    public synchronized int pruneImageCacheIfNeeded(long maxBytes) {
        if (maxBytes <= 0) return 0;
        File[] imgs = imagesDir.listFiles();
        if (imgs == null || imgs.length == 0) return 0;
        long total = 0L;
        List<File> fileList = new ArrayList<>(imgs.length);
        for (File f : imgs) {
            if (f.isFile()) {
                total += f.length();
                fileList.add(f);
            }
        }
        if (total <= maxBytes) return 0;

        long targetBytes = (long) (maxBytes * 0.80);
        Collections.sort(fileList, new Comparator<File>() {
            @Override
            public int compare(File a, File b) {
                return Long.compare(a.lastModified(), b.lastModified());
            }
        });
        int deleted = 0;
        for (File f : fileList) {
            if (total <= targetBytes) break;
            long len = f.length();
            if (f.delete()) {
                total -= len;
                deleted++;
            }
        }
        return deleted;
    }

    public synchronized int getLocalCount() {
        File[] dirs = listingsDir.listFiles();
        if (dirs == null) return 0;
        int count = 0;
        for (File d : dirs) {
            if (d.isDirectory() && (new File(d, "vip.json").exists() || new File(d, "parked.json").exists())) {
                count++;
            }
        }
        return count;
    }

    public synchronized void saveImage(String imageKey, byte[] data) {
        if (imageKey == null || imageKey.isEmpty() || data == null || data.length == 0) return;
        File f = new File(imagesDir, imageKey + ".jpg");
        try {
            writeBytes(f, data);
        } catch (Exception e) {
            Log.e(TAG, "Failed to save image " + imageKey, e);
        }
    }

    public synchronized boolean hasImage(String imageKey) {
        if (imageKey == null || imageKey.isEmpty()) return false;
        File f = new File(imagesDir, imageKey + ".jpg");
        return f.exists() && f.length() > 100;
    }

    public synchronized byte[] getImage(String imageKey) {
        if (imageKey == null || imageKey.isEmpty()) return null;
        File f = new File(imagesDir, imageKey + ".jpg");
        if (!f.exists()) return null;
        try {
            f.setLastModified(System.currentTimeMillis());
        } catch (Throwable ignored) {
        }
        return readBytes(f);
    }

    public static String normalizeImageKey(String rawUrl) {
        if (rawUrl == null || rawUrl.trim().isEmpty()) return null;
        String s = rawUrl.trim();
        int q = s.indexOf('?');
        if (q >= 0) s = s.substring(0, q);
        int hash = s.indexOf('#');
        if (hash >= 0) s = s.substring(0, hash);
        if (s.startsWith("https://")) s = s.substring(8);
        else if (s.startsWith("http://")) s = s.substring(7);
        while (s.startsWith("/")) s = s.substring(1);
        while (s.endsWith("/")) s = s.substring(0, s.length() - 1);
        if (s.isEmpty()) return null;
        return sha256Hex(s).substring(0, 24);
    }

    public static String toHighResImageUrl(String baseUri) {
        if (baseUri == null || baseUri.trim().isEmpty()) return null;
        String s = baseUri.trim();
        if (!s.startsWith("http://") && !s.startsWith("https://")) {
            s = "https://" + s;
        }
        if (s.contains("img.classistatic.de")) {
            int q = s.indexOf('?');
            if (q >= 0) s = s.substring(0, q);
            return s + "?rule=mo-1024.jpg";
        }
        return s;
    }

    public static ListingMeta extractMeta(String adId, String json, boolean isFullVip) {
        ListingMeta meta = new ListingMeta();
        meta.adId = adId;
        meta.hasFullVip = isFullVip;
        meta.title = "Inserat " + adId;
        meta.price = "";
        try {
            JSONObject obj = new JSONObject(json);
            String title = obj.optString("title", "");
            if (title.isEmpty()) title = obj.optString("shortTitle", "");
            if (!title.isEmpty()) meta.title = title;

            JSONObject priceObj = obj.optJSONObject("price");
            if (priceObj != null) {
                JSONObject gross = priceObj.optJSONObject("gross");
                if (gross != null) {
                    meta.price = gross.optString("localized", "");
                }
                if (meta.price.isEmpty()) {
                    meta.price = priceObj.optString("localized", "");
                }
            }

            JSONArray images = obj.optJSONArray("images");
            if (images != null) {
                for (int i = 0; i < images.length(); i++) {
                    JSONObject img = images.optJSONObject(i);
                    String uri = img != null ? img.optString("uri", "") : images.optString(i, "");
                    if (!uri.isEmpty()) {
                        meta.imageUris.add(uri);
                        String key = normalizeImageKey(uri);
                        if (key != null) meta.imageKeys.add(key);
                    }
                }
            }
        } catch (Exception ignored) {
        }
        return meta;
    }

    public static String buildReadableInfoText(String adId, String vipJson, String contactJson) {
        StringBuilder sb = new StringBuilder();
        try {
            JSONObject obj = new JSONObject(vipJson);
            sb.append("mobile.de Archiv - Inserat #").append(adId).append("\n");
            sb.append("Archiviert am: ")
                    .append(new SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.GERMANY).format(new Date()))
                    .append("\n");
            sb.append("Link: https://suchen.mobile.de/fahrzeuge/details.html?id=").append(adId).append("\n");
            sb.append("========================================\n\n");

            String title = obj.optString("title", "");
            if (!title.isEmpty()) sb.append("Titel: ").append(title).append("\n");
            String sub = obj.optString("subTitle", "");
            if (!sub.isEmpty()) sb.append("Untertitel: ").append(sub).append("\n");

            JSONObject priceObj = obj.optJSONObject("price");
            if (priceObj != null) {
                JSONObject gross = priceObj.optJSONObject("gross");
                if (gross != null && !gross.optString("localized", "").isEmpty()) {
                    sb.append("Preis: ").append(gross.optString("localized")).append("\n");
                }
            }

            JSONArray attrs = obj.optJSONArray("attributes");
            if (attrs != null && attrs.length() > 0) {
                sb.append("\n--- Fahrzeugdaten ---\n");
                for (int i = 0; i < attrs.length(); i++) {
                    JSONObject a = attrs.optJSONObject(i);
                    if (a == null) continue;
                    String label = a.optString("label", a.optString("tag", ""));
                    String val = a.optString("value", "");
                    if (!label.isEmpty() || !val.isEmpty()) {
                        sb.append(label).append(": ").append(val).append("\n");
                    }
                }
            }

            JSONArray features = obj.optJSONArray("features");
            if (features != null && features.length() > 0) {
                sb.append("\n--- Ausstattung ---\n");
                for (int i = 0; i < features.length(); i++) {
                    sb.append("- ").append(features.optString(i, "")).append("\n");
                }
            }

            String desc = obj.optString("description", "");
            if (!desc.isEmpty()) {
                sb.append("\n--- Beschreibung ---\n").append(desc).append("\n");
            }

            JSONObject contact = obj.optJSONObject("contact");
            if (contact != null) {
                sb.append("\n--- Verkäufer ---\n");
                if (!contact.optString("name", "").isEmpty()) sb.append("Name: ").append(contact.optString("name")).append("\n");
                if (!contact.optString("address1", "").isEmpty()) sb.append("Adresse: ").append(contact.optString("address1")).append("\n");
                if (!contact.optString("address2", "").isEmpty()) sb.append("Ort: ").append(contact.optString("address2")).append("\n");
            }
            if (contactJson != null && !contactJson.isEmpty()) {
                sb.append("\n--- Kontakt-API ---\n").append(contactJson).append("\n");
            }
        } catch (Exception e) {
            sb.append("Inserat #").append(adId).append("\n");
        }
        return sb.toString();
    }

    private static String sha256Hex(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] digest = md.digest(input.getBytes(StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder(digest.length * 2);
            for (byte b : digest) {
                sb.append(String.format(Locale.US, "%02x", b & 0xff));
            }
            return sb.toString();
        } catch (Exception e) {
            return Integer.toHexString(input.hashCode());
        }
    }

    private static void writeString(File file, String content) throws IOException {
        writeBytes(file, content.getBytes(StandardCharsets.UTF_8));
    }

    private static void writeBytes(File file, byte[] data) throws IOException {
        File tmp = new File(file.getParentFile(), file.getName() + ".tmp");
        FileOutputStream fos = new FileOutputStream(tmp);
        try {
            fos.write(data);
            fos.flush();
        } finally {
            fos.close();
        }
        if (file.exists()) file.delete();
        tmp.renameTo(file);
    }

    private static String readString(File file) {
        byte[] b = readBytes(file);
        return b == null ? null : new String(b, StandardCharsets.UTF_8);
    }

    private static byte[] readBytes(File file) {
        try {
            FileInputStream fis = new FileInputStream(file);
            try {
                ByteArrayOutputStream bos = new ByteArrayOutputStream();
                byte[] buf = new byte[8192];
                int n;
                while ((n = fis.read(buf)) != -1) {
                    bos.write(buf, 0, n);
                }
                return bos.toByteArray();
            } finally {
                fis.close();
            }
        } catch (Exception e) {
            return null;
        }
    }
}
