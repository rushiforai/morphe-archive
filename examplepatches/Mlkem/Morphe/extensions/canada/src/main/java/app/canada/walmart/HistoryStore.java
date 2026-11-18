package app.canada.walmart;

import android.app.AlertDialog;
import android.content.*;
import android.view.View;
import android.widget.*;
import java.util.*;
import java.text.DateFormat;

/** Keeps the existing v1 observation store; metadata is separate so old history remains readable. */
public final class HistoryStore {
    static SharedPreferences data(Context c){return c.getSharedPreferences("morphe_canada_price_history_v1",Context.MODE_PRIVATE);}
    static SharedPreferences meta(Context c){return c.getSharedPreferences("morphe_canada_price_history_meta_v1",Context.MODE_PRIVATE);}
    static List<String> keys(Context c){List<String> keys=new ArrayList<>();for(String key:data(c).getAll().keySet())if(key.startsWith("p_")&&!PriceLedger.decode(data(c).getString(key,"")).isEmpty())keys.add(key);keys.sort((a,b)->Long.compare(last(c,b),last(c,a)));return keys;}
    static long last(Context c,String key){List<PriceLedger.Point> p=PriceLedger.decode(data(c).getString(key,""));return p.isEmpty()?0:p.get(p.size()-1).time;}
    static List<PriceLedger.Point> record(Context c,String key,String name,String scope,String seller,long cents){
        SharedPreferences p=data(c);String old=p.getString(key,"");List<PriceLedger.Point> rows=PriceLedger.observe(PriceLedger.decode(old),System.currentTimeMillis(),cents);String encoded=PriceLedger.encode(rows);
        if(!old.equals(encoded)){p.edit().putString(key,encoded).apply();RuntimeStats.hit("Price observations saved");}
        meta(c).edit().putString(key+"_name",name).putString(key+"_scope",scope).putString(key+"_seller",seller).apply();
        List<String> keys=keys(c);if(keys.size()>128){keys.remove(key);SharedPreferences.Editor e=p.edit(),m=meta(c).edit();for(int i=127;i<keys.size();i++){String k=keys.get(i);e.remove(k);m.remove(k+"_name").remove(k+"_scope").remove(k+"_seller").remove(k+"_favorite").remove(k+"_target");}e.apply();m.apply();}
        return rows;
    }
    static boolean fr(Context c){return "fr".equals(c.getResources().getConfiguration().getLocales().get(0).getLanguage());}
    public static void showAll(Context c){HistoryTools.browse(c,false);}
    static void show(Context c,String key,Runnable cleared){HistoryTools.detail(c,key,cleared);}
}
