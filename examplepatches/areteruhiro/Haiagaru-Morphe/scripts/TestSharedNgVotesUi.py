from pathlib import Path
import subprocess
root=Path(__file__).resolve().parents[1]
s=(root/'extensions/chmate/src/main/java/app/morphe/extension/chmate/SharedNg.java').read_text(encoding='utf-8');a=s.index('saveVotes.setOnClickListener(');b=s.index('\n',a);listener=s[a:b]
code='''package app.morphe.extension.chmate;
public class VotesUiTest {
 static int threshold=5,stored=5,checks;static Object a=new Object();
 interface Click{void click(Object v);}static class Button{Click listener;void setOnClickListener(Click x){listener=x;}void click(){listener.click(null);}}
 static class Edit{String value="5",error;String getText(){return value;}void setText(String v){value=v;}void setError(String v){error=v;}}
 static class Prefs{Prefs edit(){return this;}Prefs putInt(String k,int v){stored=v;return this;}void apply(){}}static Prefs prefs(){return new Prefs();}static void reload(){threshold=stored;}
 static class Toast{static int LENGTH_SHORT;static Toast makeText(Object a,String s,int n){return new Toast();}void show(){}}
 static void check(boolean b){if(!b)throw new AssertionError();checks++;}
 public static void main(String[] args){Button saveVotes=new Button();Edit votes=new Edit();
'''+listener+'''
 for(String v:new String[]{"2","7","20","2147483647"}){votes.value=v;saveVotes.click();check(stored==Integer.parseInt(v)&&threshold==stored);}
 for(String v:new String[]{"","0","-1","1.2","2147483648"}){int old=stored;votes.value=v;votes.error=null;saveVotes.click();check(stored==old&&votes.error!=null);}
 System.out.println("PASS "+checks+" production votes UI save checks");}}
'''
out=root/'build/votes-ui-host';out.mkdir(exist_ok=True);file=out/'VotesUiTest.java';file.write_text(code,encoding='utf-8');jdk=Path('C:/Users/narum/jdk-21.0.9+10/bin')
subprocess.run([str(jdk/'javac.exe'),'-J-Xmx96m','-d',str(out),str(file),str(root/'extensions/chmate/src/main/java/app/morphe/extension/chmate/SharedNgRules.java')],check=True)
subprocess.run([str(jdk/'java.exe'),'-Xmx64m','-cp',str(out),'app.morphe.extension.chmate.VotesUiTest'],check=True)
