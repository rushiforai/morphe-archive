package app.morphe.extension.chmate;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import java.io.*;
import java.util.*;

/** app_process test; all writes are restricted to a disposable shell-owned fixture directory. */
public final class NativeRestoreDatabaseAndroidTest {
    static int checks;
    static void check(boolean ok, String label) { if (!ok) throw new AssertionError(label); checks++; }
    static String value(File file) throws Exception {
        try (SQLiteDatabase db=NativeRestoreDatabase.open(file,SQLiteDatabase.OPEN_READONLY);
             Cursor row=db.rawQuery("SELECT value FROM fixture WHERE id=1",null)) {
            check(row.moveToFirst(),"fixture row exists"); return row.getString(0);
        }
    }
    static void validate(File file) throws IOException {
        try (SQLiteDatabase db=NativeRestoreDatabase.open(file,SQLiteDatabase.OPEN_READONLY);
             Cursor row=db.rawQuery("PRAGMA quick_check(1)",null)) {
            if(!row.moveToFirst()||!"ok".equals(row.getString(0)))throw new IOException("invalid fixture");
        }
    }
    public static void main(String[] args) throws Exception {
        File root=new File(args[0]).getCanonicalFile();
        if(!root.getPath().startsWith("/data/local/tmp/haiagaru-restore-fixtures-"))throw new AssertionError("not a test directory");
        for(String name:new String[]{"source-persist","target-persist","source-hot","target-hot","source-wal","target-wal"}) {
            File dir=new File(root,name),source=new File(dir,"source.sqlite"),target=new File(dir,"target.sqlite");
            boolean rejected=false;
            try { NativeRestoreFiles.install(source,target,NativeRestoreDatabaseAndroidTest::validate); }
            catch(IOException expected) { rejected=true; }
            check(rejected,"old sidecar-only guard reproduces failure: "+name);
            NativeRestoreDatabase.prepare(source,"source");
            NativeRestoreDatabase.prepare(target,"target");
            check(value(source).equals("source-committed"),"source recovery retains committed state: "+name);
            check(value(target).equals("target-committed"),"target recovery retains committed state: "+name);
            NativeRestoreFiles.install(source,target,NativeRestoreDatabaseAndroidTest::validate);
            check(value(target).equals("source-committed"),"new DB installed: "+name);
            File[] previous=dir.listFiles((parent,n)->n.startsWith("target.sqlite.before-restore-"));
            check(previous.length==1&&value(previous[0]).equals("target-committed"),"previous DB recoverable: "+name);
            check(value(source).equals("source-committed"),"restore source retained: "+name);
            System.out.println("PASS "+name);
        }
        File corrupt=new File(root,"corrupt.sqlite");long length=corrupt.length();
        boolean rejected=false;try{NativeRestoreDatabase.prepare(corrupt,"source");}catch(IOException expected){rejected=true;}
        check(rejected&&corrupt.isFile()&&corrupt.length()==length,"corruption handler never deletes source");
        System.out.println("PASS "+checks+" Android SQLite journal recovery and restore checks");
    }
}
