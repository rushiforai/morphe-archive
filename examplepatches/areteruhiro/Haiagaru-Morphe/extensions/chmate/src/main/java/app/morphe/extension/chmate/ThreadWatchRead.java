package app.morphe.extension.chmate;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import java.io.File;

/** Reconcile polling with native reading, without treating downloaded/patrol rows as read. */
final class ThreadWatchRead {
    static int count(Context context,ThreadWatchRules.Target target){
        File file=context.getDatabasePath("roidon.sqlite");
        if(file==null||!file.isFile())return -1;
        try{
            String board=ThreadWatchOwnPosts.board(context,target);
            try(SQLiteDatabase db=SQLiteDatabase.openDatabase(file.getPath(),null,SQLiteDatabase.OPEN_READONLY);
                Cursor rows=db.rawQuery("SELECT read_count FROM bookmarks WHERE name=? AND created=?",
                        new String[]{board,target.id})){
                if(rows.moveToFirst()){
                    int count=rows.getInt(0);
                    return count>0&&count<=9_999_999?count:-1;
                }
            }
        }catch(Exception unavailable){
            // A missing/locked/older native store must not consume unseen responses.
        }
        return -1;
    }
    private ThreadWatchRead(){}
}
