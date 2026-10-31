from pathlib import Path
import subprocess
root=Path.cwd();s=(root/'extensions/chmate/src/main/java/app/morphe/extension/chmate/PersonalNgSubmissions.java').read_text(encoding='utf-8');a=s.index('    static void initialize(Context c)');b=s.index('    private static synchronized void cancelRetry()',a)
code=r'''import java.util.*;import java.util.concurrent.*;
public class PersonalNgSubmissions {
 static Context context;static SharedPreferences p=new SharedPreferences();static FakeIO IO=new FakeIO();static int collects,checks;
 static class Context{Context getApplicationContext(){return this;}}
 static SharedPreferences prefs(){return p;}static void collect(){collects++;}
 static class SharedPreferences{Map<String,Object> values=new HashMap<>();boolean getBoolean(String k,boolean d){return (boolean)values.getOrDefault(k,d);}String getString(String k,String d){return (String)values.getOrDefault(k,d);}Editor edit(){return new Editor();}class Editor{Editor remove(String k){values.remove(k);return this;}Editor putBoolean(String k,boolean v){values.put(k,v);return this;}void apply(){}}}
 static class FakeIO{int count;long delay;Runnable task;void schedule(Runnable r,long d,TimeUnit u){count++;delay=u.toMillis(d);task=r;}}
 static void check(boolean ok,String label){if(!ok)throw new AssertionError(label);checks++;}
'''+s[a:b]+r'''
 public static void main(String[]args){
 p.values.put("periodicEnabled",true);p.values.put("periodicSeconds",60L);p.values.put("retryAfter",900000L);p.values.put("status","審査用NGを送信しました。残り 0件");initialize(new Context());
 check(!p.values.containsKey("periodicEnabled")&&!p.values.containsKey("periodicSeconds"),"legacy polling settings removed");check(!p.values.containsKey("retryAfter"),"legacy success throttle removed");check(p.getBoolean("eventDrivenV1",false),"migration version saved");check(IO.count==1&&IO.delay==20000,"one startup recovery task");initialize(new Context());check(IO.count==1,"initialize does not duplicate recovery");IO.task.run();check(collects==1,"startup recovery executes collector");
 context=null;p=new SharedPreferences();p.values.put("status","送信待ちを維持しています：offline");p.values.put("retryAfter",123456L);initialize(new Context());check(p.values.get("retryAfter").equals(123456L),"actual failure backoff retained");
 context=null;p.values.put("eventDrivenV1",true);p.values.put("status","審査用NGを送信しました。残り 0件");initialize(new Context());check(p.values.get("retryAfter").equals(123456L),"migration runs only once");
 System.out.println("PASS "+checks+" event migration checks");}}
'''
out=root/'build/shared-ng-migration-host';out.mkdir(exist_ok=True);f=out/'PersonalNgSubmissions.java';f.write_text(code,encoding='utf-8');jdk=Path('C:/Users/narum/jdk-21.0.9+10/bin')
subprocess.run([str(jdk/'javac.exe'),'-J-Xmx96m','-encoding','UTF-8','-d',str(out),str(f)],check=True);subprocess.run([str(jdk/'java.exe'),'-Xmx64m','-cp',str(out),'PersonalNgSubmissions'],check=True)
