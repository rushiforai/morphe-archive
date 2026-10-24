package app.morphe.extension.chmate;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** Only manages custom theme files in the import destination; never recursively deletes assets. */
public final class ImportedThemes {
    private ImportedThemes() {}

    public static final class Entry {
        public final String relativePath;
        private final long length, modified;
        private Entry(String relativePath, File file) {
            this.relativePath=relativePath; length=file.length(); modified=file.lastModified();
        }
    }

    public static List<Entry> list(File root) throws IOException {
        root=root.getCanonicalFile();
        List<Entry> entries=new ArrayList<>();
        if (!root.exists()) return entries;
        File[] children=root.listFiles();
        if (children==null) throw new IOException("テーマ保存先を読み取れません");
        for (File child:children) {
            if (!ThemeImportFiles.safeName(child.getName()) || !regularPath(child)) continue;
            if (child.isFile()) add(entries,child.getName(),child);
            else if (child.isDirectory()) {
                File[] files=child.listFiles();
                if (files==null) throw new IOException("テーマフォルダを読み取れません: "+child.getName());
                for (File file:files) if (regularPath(file) && file.isFile())
                    add(entries,child.getName()+"/"+file.getName(),file);
            }
        }
        Collections.sort(entries,(a,b)->{
            int order=a.relativePath.compareToIgnoreCase(b.relativePath);
            return order!=0?order:a.relativePath.compareTo(b.relativePath);
        });
        return entries;
    }

    private static boolean regularPath(File file) throws IOException {
        return file.getAbsoluteFile().equals(file.getCanonicalFile());
    }

    private static void add(List<Entry> entries,String relative,File file) {
        if (ThemeImportFiles.theme(file.getName())) entries.add(new Entry(relative,file));
    }

    public static void delete(File root,Entry entry) throws IOException {
        if (entry==null) throw new IOException("テーマが選択されていません");
        File file=ThemeImportFiles.child(root.getCanonicalFile(),entry.relativePath);
        if (!ThemeImportFiles.theme(file.getName()) || !regularPath(file) || !file.isFile())
            throw new IOException("テーマが見つかりません。一覧を開き直してください");
        if (file.length()!=entry.length || file.lastModified()!=entry.modified)
            throw new IOException("テーマが更新されています。一覧を開き直して確認してください");
        if (!file.delete()) throw new IOException("テーマを削除できませんでした");
    }
}
