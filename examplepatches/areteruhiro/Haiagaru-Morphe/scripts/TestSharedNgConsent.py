from pathlib import Path
import subprocess
root=Path(__file__).resolve().parents[1]
s=(root/'extensions/chmate/src/main/java/app/morphe/extension/chmate/SharedNg.java').read_text(encoding='utf-8')
a=s.index('on.setOnCheckedChangeListener(');b=s.index('\n',a)
listener=s[a:b].rstrip()
code='''public class ConsentTest {
 static int checks;static boolean enabled;
 static class Activity{} interface Listener{void changed(Switch v,boolean b);}
 static class Switch{boolean value;Listener l;void setOnCheckedChangeListener(Listener x){l=x;}void setChecked(boolean v){if(v==value)return;value=v;if(l!=null)l.changed(this,v);}}
 static class Prefs{Prefs edit(){return this;}Prefs putBoolean(String k,boolean v){enabled=v;return this;}void apply(){}}
 static Prefs prefs(){return new Prefs();}static void reload(){}static void schedule(){}
 static class PersonalNgSubmissions{static boolean consent;static Runnable awaiting;static boolean consented(){return consent;}static void enableWithConsent(Activity a,Runnable r){awaiting=r;}static void accept(){consent=true;Runnable r=awaiting;awaiting=null;r.run();}}
 static void check(boolean b,String s){if(!b)throw new AssertionError(s);checks++;}
 public static void main(String[] args){Activity a=new Activity();Switch on=new Switch();
'''+listener+'''
 on.setChecked(true);check(!on.value&&!enabled&&!PersonalNgSubmissions.consent,"no enable before consent");check(PersonalNgSubmissions.awaiting!=null,"consent screen requested");
 PersonalNgSubmissions.awaiting=null;check(!enabled,"cancel retains OFF");
 on.setChecked(true);PersonalNgSubmissions.accept();check(enabled&&on.value&&PersonalNgSubmissions.consent,"save consent enables both");
 on.setChecked(false);check(!enabled,"receive OFF");on.setChecked(true);check(enabled&&PersonalNgSubmissions.awaiting==null,"existing consent needs no repeated dialog");
 System.out.println("PASS "+checks+" production consent listener checks");}}
'''
out=root/'build/consent-host';out.mkdir(exist_ok=True);p=out/'ConsentTest.java';p.write_text(code,encoding='utf-8');jdk=Path('C:/Users/narum/jdk-21.0.9+10/bin')
subprocess.run([str(jdk/'javac.exe'),'-J-Xmx96m','-d',str(out),str(p)],check=True)
subprocess.run([str(jdk/'java.exe'),'-Xmx64m','-cp',str(out),'ConsentTest'],check=True)

# Exercise the actual first-settings offer with a captured dialog and no networking.
personal=(root/'extensions/chmate/src/main/java/app/morphe/extension/chmate/PersonalNgSubmissions.java').read_text(encoding='utf-8')
a=personal.index('    static void offerOnSettingsOpen(');b=personal.index('    static void enableWithConsent(',a)
offer=personal[a:b].replace("SharedPreferences p=", "Prefs p=")
first=r"""import java.util.*;
public class FirstSettingsConsentTest {
 static int checks,shown,continued;static Runnable accept,dismiss;static Prefs personal=new Prefs();
 static class Prefs {Map<String,Boolean> values=new HashMap<>();boolean contains(String k){return values.containsKey(k);}boolean getBoolean(String k,boolean d){return values.getOrDefault(k,d);}Prefs edit(){return this;}Prefs putBoolean(String k,boolean v){values.put(k,v);return this;}void apply(){}}
 static class Activity {boolean dead;boolean isFinishing(){return dead;}boolean isDestroyed(){return dead;}Activity getWindow(){return this;}Activity getDecorView(){return this;}void post(Runnable r){r.run();}}
 static class SharedNg {static Prefs p=new Prefs();static int scheduled;static void initialize(Activity a){}static Prefs prefs(){return p;}static void reload(){}static void schedule(){scheduled++;}}
 static Prefs prefs(){return personal;}
 static void showSettings(Activity a,boolean enabling,Runnable accepted,Runnable dismissed){shown++;accept=accepted;dismiss=dismissed;}
 static void check(boolean v){if(!v)throw new AssertionError("case "+checks);checks++;}
"""+offer+r"""
 public static void main(String[] args){Activity a=new Activity();Runnable next=()->continued++;
 offerOnSettingsOpen(a,next);check(shown==1&&continued==0);check(!personal.getBoolean("consent",false)&&!SharedNg.p.getBoolean("enabled",false));
 dismiss.run();check(continued==1&&!SharedNg.p.getBoolean("enabled",false));offerOnSettingsOpen(a,next);check(shown==1&&continued==2);
 personal=new Prefs();personal.putBoolean("consent",false);offerOnSettingsOpen(a,next);check(shown==1&&continued==3);
 personal=new Prefs();personal.putBoolean("consent",true);offerOnSettingsOpen(a,next);check(shown==1&&continued==4);
 personal=new Prefs();a.dead=true;offerOnSettingsOpen(a,next);check(shown==1&&continued==4);a.dead=false;
 offerOnSettingsOpen(a,next);check(shown==2&&!SharedNg.p.getBoolean("enabled",false));personal.putBoolean("consent",true);accept.run();check(SharedNg.p.getBoolean("enabled",false)&&SharedNg.scheduled==1);
 a.dead=true;dismiss.run();check(continued==4);
 System.out.println("PASS "+checks+" first-settings consent lifecycle checks");}}
"""
p=out/'FirstSettingsConsentTest.java';p.write_text(first,encoding='utf-8')
subprocess.run([str(jdk/'javac.exe'),'-J-Xmx96m','-d',str(out),str(p)],check=True)
subprocess.run([str(jdk/'java.exe'),'-Xmx64m','-cp',str(out),'FirstSettingsConsentTest'],check=True)
