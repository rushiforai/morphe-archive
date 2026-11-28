package dev.rikunode.futatabi.bridge;

import android.content.Context;
import android.content.SharedPreferences;
import org.json.JSONArray;
import org.json.JSONObject;

/** Stock encoded-list setter versus whole-file restore; no device. */
public final class BoardDeletionContractTest {
    private static final String KEY="flutter.itaList";
    private static final String PREFIX="VGhpcyBpcyB0aGUgcHJlZml4IGZvciBhIGxpc3Qu!";
    private static void check(boolean ok,String message){if(!ok)throw new AssertionError(message);}
    private static String without(String raw,int... removed)throws Exception{
        JSONArray old=new JSONArray(raw.substring(PREFIX.length())), out=new JSONArray();
        for(int i=0;i<old.length();i++){
            boolean skip=false;
            for(int n:removed)if(i==n)skip=true;
            if(!skip)out.put(old.getString(i));
        }
        return PREFIX+out.toString();
    }
    public static void main(String[] args)throws Exception{
        String fresh=FutatabiProvider.completeBoards(null,true);
        check(new JSONArray(fresh.substring(PREFIX.length())).length()==6,"six defaults");
        for(int i=0;i<6;i++){
            Context c=new Context();SharedPreferences prefs=c.getSharedPreferences("FlutterSharedPreferences",0);
            FutatabiProvider.registerBoards(c);
            check(fresh.equals(prefs.getString(KEY,"")),"fresh initial registration");
            String absent=without(fresh,i);
            check(fresh.equals(FutatabiProvider.completeBoards(absent,false)),"old unconditional completion reproduces");
            check(Boolean.TRUE.equals(FutatabiProvider.persistBoardList(prefs,KEY,absent)),"stock deletion committed");
            FutatabiProvider.registerBoards(c);
            check(absent.equals(prefs.getString(KEY,"")),"single deletion survives cold start "+i);
            FutatabiProvider.registerBoards(c);
            check(absent.equals(prefs.getString(KEY,"")),"idempotent "+i);
            check(FutatabiProvider.persistBoardList(prefs,"flutter.other",fresh)==null,"unrelated setter untouched");
            check(FutatabiProvider.requestBoardRecovery(c),"manual undo persisted");
            FutatabiProvider.registerBoards(c);
            check(fresh.equals(prefs.getString(KEY,"")),"manual restores "+i);
            check(Boolean.TRUE.equals(FutatabiProvider.persistBoardList(prefs,KEY,absent)),"delete again");
            check(Boolean.TRUE.equals(FutatabiProvider.persistBoardList(prefs,KEY,fresh)),"explicit re-add");
            prefs.edit().clear().putString(KEY,without(fresh,0,1,2,3,4,5)).commit();
            FutatabiProvider.registerBoards(c);
            check(fresh.equals(prefs.getString(KEY,"")),"re-add clears suppression "+i);
        }
        Context c=new Context();SharedPreferences prefs=c.getSharedPreferences("FlutterSharedPreferences",0);
        FutatabiProvider.registerBoards(c);
        String stockOnly=without(fresh,2,3,4,5);
        prefs.edit().clear().putString(KEY,stockOnly).putBoolean("flutter.useHttps",true).commit();
        FutatabiProvider.registerBoards(c);
        check(fresh.equals(prefs.getString(KEY,"")),"stock restore all external + Jun restored");
        check(prefs.getBoolean("flutter.useHttps",false),"unrelated preference preserved");
        String empty=without(fresh,0,1,2,3,4,5);
        prefs.edit().clear().putString(KEY,empty).commit();
        FutatabiProvider.registerBoards(c);
        check(fresh.equals(prefs.getString(KEY,"")),"whole-list loss via restore recovers all");
        String missing=without(fresh,0,3,4,5);
        check(Boolean.TRUE.equals(FutatabiProvider.persistBoardList(prefs,KEY,missing)),"multiple intentional deletions");
        FutatabiProvider.registerBoards(c);
        check(missing.equals(prefs.getString(KEY,"")),"multiple deletions survive");
        prefs.edit().clear().putString(KEY,empty).commit();
        FutatabiProvider.registerBoards(c);
        check(missing.equals(prefs.getString(KEY,"")),"restore honors previous explicit deletions");
        // Legacy XML restore is decoded by the stock plugin before repair.
        prefs.edit().putString(KEY,"legacy-fixture").commit();
        FutatabiProvider.registerBoards(c);
        java.util.Map<String,Object> decoded=new java.util.HashMap<>();
        decoded.put(KEY,new java.util.ArrayList<String>());
        FutatabiProvider.repairDecodedPreferences(prefs,decoded);
        check(missing.equals(decoded.get(KEY))&&missing.equals(prefs.getString(KEY,"")),"legacy restore honors deletion mask");
        check(FutatabiProvider.requestBoardRecovery(c),"manual clears all flags");
        FutatabiProvider.registerBoards(c);
        check(fresh.equals(prefs.getString(KEY,"")),"manual restores all six");
        check(Boolean.TRUE.equals(FutatabiProvider.persistBoardList(prefs,KEY,empty)),"all intentionally removed");
        FutatabiProvider.registerBoards(c);
        check(empty.equals(prefs.getString(KEY,"")),"all intentionally removed stay absent");
        check(FutatabiProvider.requestBoardRecovery(c),"manual restore all");
        FutatabiProvider.registerBoards(c);
        check(fresh.equals(prefs.getString(KEY,"")),"all restored");
        System.out.println("PASS all six single deletions, manual undo and explicit re-add; whole-file restore vs multiple/all deletion; legacy restore; unrelated settings");
    }
}
