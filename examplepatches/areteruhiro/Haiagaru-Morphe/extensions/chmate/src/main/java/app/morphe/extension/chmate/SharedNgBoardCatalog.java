package app.morphe.extension.chmate;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import java.util.*;

/** Read-only native board catalog, shared by all NG categories and board families. */
final class SharedNgBoardCatalog {
    private static List<String[]> boards=Collections.emptyList();
    private static long until;
    /** Force a fresh read before reconciling saved personal NG submissions. */
    static synchronized boolean refresh(Context context){
        long now=android.os.SystemClock.elapsedRealtime();
        List<String[]> next=new ArrayList<>();
        try(SQLiteDatabase db=SQLiteDatabase.openDatabase(context.getDatabasePath("roidon.sqlite").getPath(),null,SQLiteDatabase.OPEN_READONLY);
            Cursor rows=db.rawQuery("SELECT name,server FROM boards",null)){
            while(rows.moveToNext())next.add(new String[]{rows.getString(0),rows.getString(1)});
            if(next.isEmpty()){until=0;return false;}
            boards=next;until=now+300000;return true;
        }catch(Exception unavailable){until=0;return false;}
    }
    static synchronized String resolve(Context context,String scope){
        if(scope==null||scope.trim().isEmpty())return "*";
        String direct=SharedNgRules.nativeBoard(scope);if(!direct.isEmpty())return direct;
        long now=android.os.SystemClock.elapsedRealtime();
        if(now>=until){
            List<String[]> next=new ArrayList<>();
            try(SQLiteDatabase db=SQLiteDatabase.openDatabase(context.getDatabasePath("roidon.sqlite").getPath(),null,SQLiteDatabase.OPEN_READONLY);
                Cursor rows=db.rawQuery("SELECT name,server FROM boards",null)){
                while(rows.moveToNext())next.add(new String[]{rows.getString(0),rows.getString(1)});
                boards=next;until=now+300000;
            }catch(Exception unavailable){until=now+30000;}
        }
        return SharedNgRules.boardScope(scope,boards);
    }
    private SharedNgBoardCatalog(){}
}
