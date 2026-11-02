package app.morphe.extension.chmate;

import android.content.Context;
import android.util.AtomicFile;
import org.json.JSONObject;
import java.io.*;
import java.util.*;
import java.util.zip.*;

/** Disk-backed ZIP container. No archive, DAT, post-history or memo is held in memory. */
final class HaiagaruBackupArchive {
    private static final String METADATA = "snapshot.json";
    static final int FILE_FLAGS = HaiagaruSyncSnapshot.RESPONSES | HaiagaruSyncSnapshot.THREAD_ARCHIVES
            | HaiagaruSyncSnapshot.DAT | HaiagaruSyncSnapshot.RESOURCES
            | HaiagaruSyncSnapshot.POST_HISTORY | HaiagaruSyncSnapshot.KAKIKOMI
            | HaiagaruSyncSnapshot.UPLOAD_HISTORY | HaiagaruSyncSnapshot.WACCHOI_HISTORY
            | HaiagaruSyncSnapshot.WACCHOI_CACHE;
    private static final long RESERVE = 8L * 1024 * 1024;

    static final class Backup implements Closeable {
        final File file;
        final JSONObject snapshot;
        final boolean zipped;
        private Backup(File file, JSONObject snapshot, boolean zipped) {
            this.file = file; this.snapshot = snapshot; this.zipped = zipped;
        }
        @Override public void close() { file.delete(); } // Only our private temporary copy.
    }

    private static final class Root {
        final String name;
        final int bit;
        final File file;
        final boolean single;
        Root(String name, int bit, File file, boolean single) throws IOException {
            this.name = name; this.bit = bit; this.file = file.getCanonicalFile(); this.single = single;
        }
    }

    private static List<Root> roots(Context context) throws IOException {
        File external = HaiagaruSyncSnapshot.externalRoot(context);
        List<Root> roots = new ArrayList<>();
        roots.add(new Root("responses", HaiagaruSyncSnapshot.RESPONSES,
                new File(context.getFilesDir(), "haiagaru-response-archive"), false));
        roots.add(new Root("archive", HaiagaruSyncSnapshot.THREAD_ARCHIVES, new File(external, "archive"), false));
        roots.add(new Root("archive-origins", HaiagaruSyncSnapshot.THREAD_ARCHIVES, ArchiveOrigins.directory(context), false));
        // Native .idx companions contain per-response marks independently of
        // postDataList.json. Back them up even when DAT bodies are not selected.
        roots.add(new Root("dat", HaiagaruSyncSnapshot.DAT | HaiagaruSyncSnapshot.POST_HISTORY, new File(external, "dat"), false));
        roots.add(new Root("posts", HaiagaruSyncSnapshot.POST_HISTORY, context.getFileStreamPath("postDataList.json"), true));
        roots.add(new Root("memo", HaiagaruSyncSnapshot.KAKIKOMI, new File(external, "kakikomi.txt"), true));
        for (String name : new String[]{"font", "theme"}) {
            roots.add(new Root(name, HaiagaruSyncSnapshot.RESOURCES, new File(external, name), false));
        }
        roots.add(new Root("keywords", HaiagaruSyncSnapshot.RESOURCES,
                context.getFileStreamPath("keyword_group_list.json"), true));
        roots.add(new Root("uploads", HaiagaruSyncSnapshot.UPLOAD_HISTORY, new File(external, "upload.json"), true));
        roots.add(new Root("wacchoi-history", HaiagaruSyncSnapshot.WACCHOI_HISTORY, WacchoiHistory.directory(context), false));
        roots.add(new Root("wacchoi-pages", HaiagaruSyncSnapshot.WACCHOI_CACHE, new File(context.getFilesDir(), "hissi-public-pages"), false));
        return roots;
    }

    static File temporary(Context context) throws IOException {
        File directory = new File(context.getCacheDir(), "haiagaru-backup-transfer");
        if (!directory.isDirectory() && !directory.mkdirs()) throw new IOException("バックアップ作業領域を作成できません");
        return File.createTempFile("transfer-", ".tmp", directory);
    }

    static File capture(Context context, int flags) throws Exception {
        if ((flags & HaiagaruSyncSnapshot.ALL) == 0) throw new IOException("バックアップ対象がありません");
        if ((flags & HaiagaruSyncSnapshot.THREAD_ARCHIVES) != 0) ArchiveOrigins.flush();
        File target = temporary(context);
        boolean complete = false;
        try {
            JSONObject metadata = HaiagaruSyncSnapshot.validate(HaiagaruSyncSnapshot.captureMetadata(context, flags));
            metadata.put("archiveFormat", 2);
            if ((flags & HaiagaruSyncSnapshot.AUTH) != 0) metadata.put("authentication", HaiagaruBackupSecrets.capture(context));
            if ((flags & HaiagaruSyncSnapshot.DEVICE_DATA) != 0) metadata.put("deviceData", HaiagaruBackupSecrets.captureDevice(context));
            byte[] metadataBytes = metadata.toString().getBytes(java.nio.charset.StandardCharsets.UTF_8);
            if (metadataBytes.length > HaiagaruSyncSnapshot.MAX_METADATA_BYTES) throw new IOException("設定・認証情報のJSONが64 MiBを超えています（ZIP全体の容量制限ではありません）");
            long required = RESERVE + metadataBytes.length;
            List<Root> roots = roots(context);
            for (Root root : roots) if ((flags & root.bit) != 0) required = Math.addExact(required, size(root.file, 0,indexOnly(root,flags)));
            // ZIP can be slightly larger than its input. Leave headroom and fail before transfer.
            required = Math.addExact(required, required / 50);
            if (target.getParentFile().getUsableSpace() < required) throw new IOException("バックアップ用の空き容量が不足しています");
            try (FileOutputStream stream = new FileOutputStream(target);
                 ZipOutputStream output = new ZipOutputStream(new BufferedOutputStream(stream))) {
                output.putNextEntry(new ZipEntry(METADATA));
                output.write(metadataBytes);
                output.closeEntry();
                for (Root root : roots) if ((flags & root.bit) != 0 && root.file.exists()) {
                    if (root.single) writeFile(output, root.file, root.name + "/data");
                    else writeTree(output, root.file, root.name, 0,indexOnly(root,flags));
                }
                output.finish(); output.flush(); stream.getFD().sync();
            }
            complete = true;
            return target;
        } finally { if (!complete) target.delete(); }
    }

    private static long size(File file, int depth) throws IOException {
        return size(file,depth,false);
    }
    private static boolean indexOnly(Root root,int flags){return root.name.equals("dat")&&(flags&HaiagaruSyncSnapshot.DAT)==0;}
    private static boolean selected(Root root,String path,int flags){
        return (root.bit&flags)!=0&&(!indexOnly(root,flags)||path.endsWith(".idx"));
    }
    private static long size(File file,int depth,boolean indices) throws IOException {
        checkFile(file, depth);
        if (!file.exists()) return 0;
        if (file.isFile()) return !indices||file.getName().endsWith(".idx")?file.length():0;
        long result = 0;
        File[] children = file.listFiles();
        if (children == null) throw new IOException("保存対象のフォルダを読み取れません");
        for (File child : children) result = Math.addExact(result, size(child, depth + 1,indices));
        return result;
    }

    private static void checkFile(File file, int depth) throws IOException {
        if (depth > 64 || !file.getAbsolutePath().equals(file.getCanonicalPath())) {
            throw new IOException("シンボリックリンクまたは深すぎる保存先は対象外です");
        }
    }

    private static void writeTree(ZipOutputStream output, File directory, String prefix, int depth,boolean indices) throws IOException {
        checkFile(directory, depth);
        File[] children = directory.listFiles();
        if (children == null) throw new IOException("保存対象のフォルダを読み取れません");
        for (File child : children) {
            checkFile(child, depth + 1);
            String name = prefix + "/" + child.getName();
            if (child.isDirectory()) writeTree(output, child, name, depth + 1,indices);
            else if (child.isFile()&&(!indices||child.getName().endsWith(".idx"))) writeFile(output, child, name);
        }
    }

    private static void writeFile(ZipOutputStream output, File file, String name) throws IOException {
        long length = file.length(), modified = file.lastModified();
        ZipEntry entry = new ZipEntry(name);
        entry.setTime(modified);
        output.putNextEntry(entry);
        long copied;
        try (InputStream input = new FileInputStream(file)) { copied = copy(input, output); }
        output.closeEntry();
        if (copied != length || length != file.length() || modified != file.lastModified()) {
            throw new IOException("保存対象が更新されました。しばらくして再実行してください");
        }
    }

    static Backup read(Context context, File ownedTemporary) throws Exception {
        boolean complete = false;
        try {
            boolean zipped;
            try (InputStream input = new FileInputStream(ownedTemporary)) { zipped = input.read() == 'P' && input.read() == 'K'; }
            JSONObject snapshot;
            if (zipped) {
                try (ZipFile zip = new ZipFile(ownedTemporary)) {
                    ZipEntry metadata = zip.getEntry(METADATA);
                    if (metadata == null) throw new IOException("バックアップ情報がありません");
                    try (InputStream input = zip.getInputStream(metadata)) { snapshot = HaiagaruSyncSnapshot.validate(readMetadata(input)); }
                    if (snapshot.optInt("archiveFormat") != 2) throw new IOException("未対応のZIPバックアップです");
                    if ((snapshot.optInt("categories") & HaiagaruSyncSnapshot.AUTH) != 0
                            && snapshot.optJSONObject("authentication") == null) throw new IOException("認証情報がありません");
                    if ((snapshot.optInt("categories") & HaiagaruSyncSnapshot.DEVICE_DATA) != 0
                            && snapshot.optJSONObject("deviceData") == null) throw new IOException("端末依存データがありません");
                    validateEntries(context, zip, snapshot.optInt("categories"));
                }
            } else {
                try (InputStream input = new FileInputStream(ownedTemporary)) { snapshot = HaiagaruSyncSnapshot.validate(readMetadata(input)); }
                if ((snapshot.optInt("categories") & ~63) != 0) throw new IOException("アーカイブ・認証情報の復元にはZIP形式が必要です");
            }
            complete = true;
            return new Backup(ownedTemporary, snapshot, zipped);
        } finally { if (!complete) ownedTemporary.delete(); }
    }

    private static byte[] readMetadata(InputStream input) throws IOException {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        byte[] buffer = new byte[8192]; int read;
        while ((read = input.read(buffer)) != -1) {
            if ((long) output.size() + read > HaiagaruSyncSnapshot.MAX_METADATA_BYTES) {
                throw new IOException("設定情報のJSONが大きすぎます（ZIP全体の容量制限ではありません）");
            }
            output.write(buffer, 0, read);
        }
        return output.toByteArray();
    }

    private static Root rootFor(List<Root> roots, String path) throws IOException {
        if (path.length() > 4096 || path.indexOf('\\') >= 0 || path.indexOf('\0') >= 0) throw new IOException("不正なバックアップパスです");
        String[] parts = path.split("/", -1);
        if (parts.length < 2 || parts.length > 65) throw new IOException("不正なバックアップパスです");
        for (String part : parts) if (part.isEmpty() || part.equals(".") || part.equals("..") || part.indexOf(':') >= 0) throw new IOException("不正なバックアップパスです");
        for (Root root : roots) if (parts[0].equals(root.name)) {
            if (root.single && !path.equals(root.name + "/data")) throw new IOException("不正な単一ファイルです");
            return root;
        }
        throw new IOException("許可されていないバックアップ領域です");
    }

    private static File destination(Root root, String path) throws IOException {
        if (root.single) return root.file;
        File target = new File(root.file, path.substring(root.name.length() + 1));
        if (!target.getCanonicalPath().startsWith(root.file.getPath() + File.separator)
                || !target.getAbsolutePath().equals(target.getCanonicalPath())) throw new IOException("復元先が保存領域外です");
        return target;
    }

    private static void validateEntries(Context context, ZipFile zip, int flags) throws IOException {
        Set<String> names = new HashSet<>();
        List<Root> roots = roots(context);
        Enumeration<? extends ZipEntry> entries = zip.entries();
        while (entries.hasMoreElements()) {
            ZipEntry entry = entries.nextElement();
            if (!names.add(entry.getName()) || names.size() > 1_000_000 || entry.isDirectory()) throw new IOException("重複・過剰・不正なZIP項目です");
            if (!entry.getName().equals(METADATA)) {
                Root root = rootFor(roots, entry.getName());
                if (!selected(root,entry.getName(),flags)) throw new IOException("宣言されていないバックアップ項目です");
                destination(root, entry.getName());
            }
            checkedCopy(zip, entry, null);
        }
    }

    private static void checkedCopy(ZipFile zip, ZipEntry entry, OutputStream output) throws IOException {
        CRC32 crc = new CRC32(); long total = 0;
        try (InputStream input = zip.getInputStream(entry)) {
            byte[] buffer = new byte[64 * 1024]; int read;
            while ((read = input.read(buffer)) != -1) {
                total = Math.addExact(total, read);
                if (total > entry.getSize()) throw new IOException("ZIPの展開サイズが一致しません");
                crc.update(buffer, 0, read);
                if (output != null) output.write(buffer, 0, read);
            }
        }
        if (total != entry.getSize() || crc.getValue() != entry.getCrc()) throw new IOException("バックアップの破損を検出しました");
    }

    static void restore(Context context, Backup backup, int flags, boolean merge) throws Exception {
        int selected = flags & backup.snapshot.optInt("categories") & HaiagaruSyncSnapshot.ALL;
        if (selected == 0) throw new IOException("復元対象がありません");
        HaiagaruBackupSecrets.validateDevice(context, backup.snapshot, selected);
        // Do not change live files until every incoming ZIP entry has passed CRC/path validation.
        if (backup.zipped) try (ZipFile zip = new ZipFile(backup.file)) { validateEntries(context, zip, backup.snapshot.optInt("categories")); }
        File recoveryDir = new File(context.getFilesDir(), "haiagaru-sync-recovery");
        if (!recoveryDir.isDirectory() && !recoveryDir.mkdirs()) throw new IOException("退避領域を作成できません");
        File recovery = capture(context, selected);
        if (!recovery.renameTo(new File(recoveryDir, "before-restore-" + UUID.randomUUID() + ".zip"))) {
            recovery.delete(); throw new IOException("復元前の退避を確定できません");
        }
        int core = selected & 63 & (backup.zipped ? ~FILE_FLAGS : -1);
        if (core != 0) {
            if (merge) HaiagaruSyncSnapshot.mergeMissing(context, backup.snapshot, core);
            else HaiagaruSyncSnapshot.restore(context, backup.snapshot, core);
        }
        if (backup.zipped) try (ZipFile zip = new ZipFile(backup.file)) {
            List<Root> roots = roots(context);
            Enumeration<? extends ZipEntry> entries = zip.entries();
            while (entries.hasMoreElements()) {
                ZipEntry entry = entries.nextElement();
                if (entry.getName().equals(METADATA)) continue;
                Root root = rootFor(roots, entry.getName());
                if (!selected(root,entry.getName(),selected)) continue;
                File target = destination(root, entry.getName());
                // In two-way sync existing binary/native records are never overwritten.
                boolean mergeHistory = merge && target.isFile()
                        && (root.bit == HaiagaruSyncSnapshot.POST_HISTORY || root.bit == HaiagaruSyncSnapshot.KAKIKOMI);
                if (merge && target.exists() && !mergeHistory) continue;
                File parent = target.getParentFile();
                if (!parent.isDirectory() && !parent.mkdirs()) throw new IOException("復元先を作成できません");
                if (parent.getUsableSpace() < entry.getSize() + RESERVE) throw new IOException("復元先の空き容量が不足しています");
                AtomicFile atomic = new AtomicFile(target);
                FileOutputStream output = null;
                File incoming = null, current = null;
                try {
                    if (mergeHistory) {
                        // Stage incoming and current before AtomicFile renames its original to .bak.
                        incoming = temporary(context); current = temporary(context);
                        try (OutputStream stage = new FileOutputStream(incoming)) { checkedCopy(zip, entry, stage); }
                        try (InputStream input = new FileInputStream(target); OutputStream stage = new FileOutputStream(current)) { copy(input, stage); }
                    }
                    output = atomic.startWrite();
                    if (!mergeHistory) checkedCopy(zip, entry, output);
                    else if (root.bit == HaiagaruSyncSnapshot.POST_HISTORY) {
                        try (InputStream input = new FileInputStream(incoming)) { BackupHistoryMerge.posts(current, input, output); }
                    } else BackupHistoryMerge.memo(current, incoming, output);
                    atomic.finishWrite(output); output = null;
                } finally {
                    if (output != null) atomic.failWrite(output);
                    if (incoming != null) incoming.delete(); if (current != null) current.delete();
                }
                if (entry.getTime() > 0) target.setLastModified(entry.getTime());
            }
        }
        HaiagaruBackupSecrets.restore(context, backup.snapshot, selected, merge);
    }

    static long copy(InputStream input, OutputStream output) throws IOException {
        byte[] buffer = new byte[64 * 1024]; long total = 0; int read;
        while ((read = input.read(buffer)) != -1) {
            output.write(buffer, 0, read); total = Math.addExact(total, read);
        }
        return total;
    }
}
