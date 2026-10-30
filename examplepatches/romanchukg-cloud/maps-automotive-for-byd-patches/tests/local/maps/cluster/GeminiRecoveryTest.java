package local.maps.cluster;
import java.io.IOException;
import java.util.*;

/** Actual fixed recovery protocol against an Android-role simulator, including races. */
public final class GeminiRecoveryTest {
    static int checks;
    static void ok(boolean b){checks++;if(!b)throw new AssertionError("check "+checks);}
    static String role(String user,String holder){return "users={\nuser_id="+user+"\nroles={\nname=android.app.role.ASSISTANT\n"+(holder==null?"":"holders="+holder+"\n")+"}\n}";}
    static class Shell implements GeminiRecoveryPolicy.Shell {
        String assistant="null",service="null",holder="",uid="2000",user="0";
        boolean allowed=true,reject,unknownRole,cancelAfterRemove,changeUserAfterRemove,changeAssistantAfterRemove;
        String binding="true mService=proxy";
        int writes;List<String> commands=new ArrayList<>();
        public String execute(String c)throws IOException {
            commands.add(c);
            if(c.equals("id -u"))return uid;
            if(c.equals("am get-current-user"))return user;
            if(c.equals("dumpsys role"))return unknownRole?"unavailable":role(user,holder);
            if(c.equals("dumpsys voiceinteraction"))return "mCurUser: "+user+"\ncomponent="+GeminiRecoveryPolicy.SERVICE+"\nmBound="+binding+"\nnestedSession:\n  mBound=true\n";
            if(c.equals("settings --user "+user+" get secure assistant"))return assistant;
            if(c.equals("settings --user "+user+" get secure voice_interaction_service"))return service;
            String prefix="cmd role ";if(!c.startsWith(prefix))throw new AssertionError("Unexpected command: "+c);
            ok(c.contains(" --user "+user+" android.app.role.ASSISTANT com.google.android.googlequicksearchbox 0; printf "));
            ok(!c.contains("clear-role-holders")&&!c.contains("settings put")&&!c.contains("force-stop"));
            writes++;
            if(reject)return "Error: denied|maps_gemini_role_rc=1|";
            if(c.startsWith("cmd role remove-role-holder ")){
                holder="";assistant=service="";
                if(cancelAfterRemove)allowed=false;
                if(changeUserAfterRemove)user="10";
                if(changeAssistantAfterRemove){holder="other.assistant";assistant=service="other.assistant/other.Assist";}
            }else if(c.startsWith("cmd role add-role-holder "))holder=GeminiRecoveryPolicy.GOOGLE;
            else throw new AssertionError(c);
            return "|maps_gemini_role_rc=0|";
        }
        GeminiRecoveryPolicy.Result repair()throws IOException{return GeminiRecoveryPolicy.repair(this,()->allowed);}
    }
    static void fails(Shell s,String expected)throws Exception{
        try{s.repair();throw new AssertionError("Expected "+expected);}catch(IOException e){ok(e.getMessage().equals(expected));}
    }
    public static void main(String[] args)throws Exception{
        Shell s=new Shell();ok(s.repair()==GeminiRecoveryPolicy.Result.RESTORED);ok(s.writes==1);
        s=new Shell();s.holder=GeminiRecoveryPolicy.GOOGLE;ok(s.repair()==GeminiRecoveryPolicy.Result.RESTORED);ok(s.writes==2);
        s=new Shell();s.assistant=s.service=GeminiRecoveryPolicy.SERVICE;s.holder=GeminiRecoveryPolicy.GOOGLE;ok(s.repair()==GeminiRecoveryPolicy.Result.READY);ok(s.writes==0);
        s=new Shell();s.assistant=s.service=GeminiRecoveryPolicy.SERVICE;s.holder=GeminiRecoveryPolicy.GOOGLE;s.binding="false mService=null";ok(s.repair()==GeminiRecoveryPolicy.Result.RESTORED);ok(s.writes==2);
        s=new Shell();s.assistant=s.service=GeminiRecoveryPolicy.SERVICE;s.holder=GeminiRecoveryPolicy.GOOGLE;s.binding="true mService=null";ok(s.repair()==GeminiRecoveryPolicy.Result.STARTING);ok(s.writes==0);
        s=new Shell();s.assistant=s.service=GeminiRecoveryPolicy.SERVICE;s.holder=GeminiRecoveryPolicy.GOOGLE;s.binding="false mService=bad";fails(s,"binding_unavailable");ok(s.writes==0);
        for(int part=0;part<3;part++){
            s=new Shell();if(part==0)s.assistant="other.assistant/.Activity";if(part==1)s.service="other.assistant/other.Service";if(part==2)s.holder="other.assistant";
            ok(s.repair()==GeminiRecoveryPolicy.Result.OTHER_ASSISTANT);ok(s.writes==0);
        }
        s=new Shell();s.service="bad\ncomponent";fails(s,"state_unavailable");ok(s.writes==0);
        s=new Shell();s.unknownRole=true;fails(s,"state_unavailable");ok(s.writes==0);
        s=new Shell();s.uid="0";fails(s,"not_shell");ok(s.writes==0);
        s=new Shell();s.user="0; other";fails(s,"user_unavailable");ok(s.writes==0);
        s=new Shell();s.allowed=false;fails(s,"cancelled");ok(s.commands.isEmpty());
        s=new Shell();s.reject=true;fails(s,"role_rejected");ok(s.writes==1);
        s=new Shell();s.holder=GeminiRecoveryPolicy.GOOGLE;s.cancelAfterRemove=true;fails(s,"cancelled");ok(s.writes==1);
        s=new Shell();s.holder=GeminiRecoveryPolicy.GOOGLE;s.changeUserAfterRemove=true;fails(s,"user_changed");ok(s.writes==1);
        s=new Shell();s.holder=GeminiRecoveryPolicy.GOOGLE;s.changeAssistantAfterRemove=true;ok(s.repair()==GeminiRecoveryPolicy.Result.OTHER_ASSISTANT);ok(s.writes==1);
        s=new Shell();s.user="10";ok(s.repair()==GeminiRecoveryPolicy.Result.RESTORED);ok(s.commands.stream().filter(c->c.startsWith("settings ")).allMatch(c->c.contains("--user 10")));
        String multi=role("0","other.assistant")+"\n"+role("10",GeminiRecoveryPolicy.GOOGLE);
        ok(GeminiRecoveryPolicy.holder(multi,"10")==GeminiRecoveryPolicy.Choice.GOOGLE);
        ok(GeminiRecoveryPolicy.holder(multi,"0")==GeminiRecoveryPolicy.Choice.OTHER);
        ok(GeminiRecoveryPolicy.holder(multi,"11")==GeminiRecoveryPolicy.Choice.UNKNOWN);
        ok(GeminiRecoveryPolicy.holder(role("0",null),"0")==GeminiRecoveryPolicy.Choice.NONE);
        ok(GeminiRecoveryPolicy.holder(role("0","a,b"),"0")==GeminiRecoveryPolicy.Choice.OTHER);
        ok(GeminiRecoveryPolicy.component(null)==GeminiRecoveryPolicy.Choice.UNKNOWN);
        String head="mCurUser: 0\ncomponent="+GeminiRecoveryPolicy.SERVICE+"\n";
        ok(GeminiRecoveryPolicy.binding(head+"mBound=false mService=null\nchild:\n mBound=true\n","0")==GeminiRecoveryPolicy.Binding.UNBOUND);
        ok(GeminiRecoveryPolicy.binding(head+"mBound=true mService=proxy\n","0")==GeminiRecoveryPolicy.Binding.BOUND);
        ok(GeminiRecoveryPolicy.binding(head+"mBound=true mService=null\n","0")==GeminiRecoveryPolicy.Binding.STARTING);
        ok(GeminiRecoveryPolicy.binding(head+"mBound=true mService=proxy\n","10")==GeminiRecoveryPolicy.Binding.UNKNOWN);
        ok(GeminiRecoveryPolicy.binding(head+"mBound=false mService=null\nmBound=true mService=proxy\n","0")==GeminiRecoveryPolicy.Binding.UNKNOWN);
        ok(GeminiRecoveryPolicy.binding("mCurUser: 0\nother.assistant/other.Service\nmBound=true mService=proxy\n","0")==GeminiRecoveryPolicy.Binding.UNKNOWN);
        ok(GeminiRecoveryPolicy.binding(head+"mBound=true\n","0")==GeminiRecoveryPolicy.Binding.UNKNOWN);
        System.out.println("PASS "+checks+" protocol checks: restore, already-ready, other assistant, malformed state, wrong UID, user switch, cancellation, denied RoleManager, multi-user and race after removal.");
    }
}
