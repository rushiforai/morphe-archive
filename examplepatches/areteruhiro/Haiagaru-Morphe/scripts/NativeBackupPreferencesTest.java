package app.morphe.extension.chmate;

import java.io.*;import java.nio.file.*;import java.util.*;import java.util.zip.*;

/** Isolated paths and ZIPs only: no application preferences or user backups are modified. */
public final class NativeBackupPreferencesTest {
    static int checks;static void ok(boolean value,String label){checks++;if(!value)throw new AssertionError(label);}
    public static void main(String[] args)throws Exception{
        Path root=Files.createTempDirectory("canonical-chmate-backup-");
        try {
            for(String pkg:List.of("jp.co.airfront.android.a2chMate","jp.co.airfront.android.a2chMate.haiagaru.reporter191","com.example.custommate")) {
                Path data=Files.createDirectories(root.resolve(pkg).resolve("shared_prefs"));
                String xml="<map><string name=\"fixture\">"+pkg+"</string></map>";
                Files.writeString(data.resolve(pkg+"_preferences.xml"),xml);
                File source=NativeBackupPreferences.exportFile(data.toFile(),NativeBackupPreferences.ORIGINAL+".xml");
                ok(source.toPath().equals(data.resolve(pkg+"_preferences.xml")),"backup reads real runtime preferences: "+pkg);
                Path staging=Files.createDirectories(root.resolve("staging-"+pkg).resolve("prefs"));
                File target=NativeBackupPreferences.exportFile(staging.toFile(),NativeBackupPreferences.ORIGINAL+".xml");
                ok(target.getName().equals(NativeBackupPreferences.ORIGINAL+".xml"),"archive staging keeps original XML name");
                Files.copy(source.toPath(),target.toPath());
                Path zip=root.resolve(pkg+".zip");try(ZipOutputStream output=new ZipOutputStream(Files.newOutputStream(zip))){output.putNextEntry(new ZipEntry("prefs/"+target.getName()));Files.copy(target.toPath(),output);output.closeEntry();}
                try(ZipFile backup=new ZipFile(zip.toFile())){ok(backup.getEntry("prefs/"+NativeBackupPreferences.ORIGINAL+".xml")!=null,"canonical ZIP entry exists");ok(backup.size()==1,"renamed duplicate XML is not exported");}
                ok(NativeBackupPreferences.restoreFile(staging.toFile(),NativeBackupPreferences.ORIGINAL+".xml",pkg).equals(target),"canonical restore reference resolves for each package");
                if(!pkg.equals("jp.co.airfront.android.a2chMate")) {
                    Path old=staging.resolve(pkg+"_preferences.xml");Files.writeString(old,"legacy");
                    ok(NativeBackupPreferences.restoreFile(staging.toFile(),NativeBackupPreferences.ORIGINAL+".xml",pkg).equals(target),"canonical file wins if legacy and canonical both exist");
                    Files.delete(target.toPath());
                    ok(NativeBackupPreferences.restoreFile(staging.toFile(),NativeBackupPreferences.ORIGINAL+".xml",pkg).toPath().equals(old),"same-package older backup remains readable");
                }
                ok(NativeBackupPreferences.exportFile(data.toFile(),"threadList.xml").equals(new File(data.toFile(),"threadList.xml")),"other preference files are unchanged");
                ok(Files.readString(source.toPath()).equals(xml),"runtime settings were not moved or rewritten");
            }
            System.out.println("PASS "+checks+" canonical native backup naming/ZIP/legacy-reference checks");
        }finally{try(var paths=Files.walk(root)){for(Path p:paths.sorted(Comparator.reverseOrder()).toList())Files.delete(p);}}
    }
}
