package app.haiagaru.tests.sites;

import android.content.*;
import android.util.AtomicFile;
import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import org.json.*;

/** Hide stale unregistered loopback fixture tabs during tests and restore the exact original keys. */
public final class FixtureTabSandbox {
    private static final String[] KEYS={"lefttabs","righttabs","closed","leftselection","rightselection"};
    private final SharedPreferences prefs;private final Map<String,?> saved;private final File backup;
    public FixtureTabSandbox(Context context)throws Exception{
        prefs=context.getSharedPreferences("tabletHome2",0);saved=prefs.getAll();
        backup=new File(context.getCacheDir(),"site-fixture-tabs-backup-"+System.nanoTime()+".json");
        JSONObject copy=new JSONObject();for(String key:KEYS)if(saved.containsKey(key))copy.put(key,saved.get(key));
        AtomicFile file=new AtomicFile(backup);FileOutputStream out=file.startWrite();try{out.write(copy.toString().getBytes(StandardCharsets.UTF_8));file.finishWrite(out);}catch(Throwable error){file.failWrite(out);throw error;}
        Set<String> registered=new HashSet<>();JSONArray boards=new JSONArray(context.getSharedPreferences("haiagaru.site-boards",0).getString("boards","[]"));for(int i=0;i<boards.length();i++)registered.add(boards.getJSONObject(i).getString("key"));
        SharedPreferences.Editor editor=prefs.edit();boolean changed=false;
        for(String key:new String[]{"lefttabs","righttabs","closed"}){
            String raw=prefs.getString(key,null);if(raw==null)continue;JSONArray rows=new JSONArray(raw),keep=new JSONArray();
            for(int i=0;i<rows.length();i++){JSONObject row=rows.getJSONObject(i),args=new JSONObject(row.optString("args","{}"));boolean fixture=false;
                try{String address=args.optString("_data","");if(address.isEmpty()&&args.has("bid"))address="http://"+URLDecoder.decode(args.getString("bid"),"UTF-8");URI uri=URI.create(address);
                    java.util.regex.Matcher board=java.util.regex.Pattern.compile("/(h[bfa][a-f0-9]{32})/?").matcher(uri.getPath());
                    fixture="127.0.0.1".equals(uri.getHost())&&board.matches()&&!registered.contains(board.group(1));
                }catch(RuntimeException ignored){}
                if(!fixture)keep.put(row);
            }
            if(keep.length()!=rows.length()){editor.putString(key,keep.toString());if(!key.equals("closed"))editor.putInt(key.equals("lefttabs")?"leftselection":"rightselection",0);changed=true;}
        }
        if(changed&&!editor.commit())throw new IOException("Cannot isolate fixture tabs");
    }
    public void restore()throws IOException{
        SharedPreferences.Editor editor=prefs.edit();for(String key:KEYS){Object value=saved.get(key);if(value instanceof String)editor.putString(key,(String)value);else if(value instanceof Integer)editor.putInt(key,(Integer)value);else if(value==null)editor.remove(key);else throw new IOException("Unexpected saved tab key type");}
        if(!editor.commit())throw new IOException("Cannot restore original tab state; backup: "+backup);
        backup.delete();
    }
}
