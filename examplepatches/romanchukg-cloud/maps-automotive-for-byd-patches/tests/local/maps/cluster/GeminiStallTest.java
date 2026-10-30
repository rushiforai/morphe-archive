package local.maps.cluster;
import java.io.IOException;
import java.util.*;

/** 54Q: a manager binding stuck in STARTING after a stalled session gets the Google-only re-register. */
public final class GeminiStallTest {
    static int checks;
    static void ok(boolean b,String why){checks++;if(!b)throw new AssertionError(why);}
    static final class Shell implements GeminiRecoveryPolicy.Shell {
        final Deque<String> later=new ArrayDeque<>();String binding="true mService=null",holder=GeminiRecoveryPolicy.GOOGLE,service=GeminiRecoveryPolicy.SERVICE;
        boolean allowed=true,cancelOnSleep;int writes,sleeps;List<String> commands=new ArrayList<>();
        String dump(){return "mCurUser: 0\ncomponent="+GeminiRecoveryPolicy.SERVICE+"\n  mBound="+binding+"\n    mShown=true\n    mBound=true\n    mService=sessionProxy\n";}
        public String execute(String c)throws IOException{
            commands.add(c);
            if(c.equals("id -u"))return "2000";
            if(c.equals("am get-current-user"))return "0";
            if(c.equals("dumpsys role"))return "users={\nuser_id=0\nroles={\nname=android.app.role.ASSISTANT\n"+(holder.isEmpty()?"":"holders="+holder+"\n")+"}\n}";
            if(c.equals("settings --user 0 get secure assistant")||c.equals("settings --user 0 get secure voice_interaction_service"))return service;
            if(c.equals("dumpsys voiceinteraction"))return dump();
            if(c.equals("sleep 1; dumpsys voiceinteraction")){sleeps++;if(cancelOnSleep)allowed=false;if(!later.isEmpty())binding=later.poll();return dump();}
            ok(c.endsWith(" --user 0 android.app.role.ASSISTANT com.google.android.googlequicksearchbox 0; printf '|maps_gemini_role_rc=%s|' \"$?\""),"fixed role command");
            ok(!c.contains("clear-role-holders")&&!c.contains("force-stop")&&!c.contains("settings put"),"no other writes");
            writes++;
            if(c.startsWith("cmd role remove-role-holder ")){holder="";service="";}
            else if(c.startsWith("cmd role add-role-holder ")){holder=GeminiRecoveryPolicy.GOOGLE;service=GeminiRecoveryPolicy.SERVICE;binding="true mService=proxy";}
            else throw new AssertionError(c);
            return "|maps_gemini_role_rc=0|";
        }
        GeminiRecoveryPolicy.Result repair(boolean stalled)throws IOException{return GeminiRecoveryPolicy.repair(this,()->allowed,stalled);}
    }
    public static void main(String[] a)throws Exception{
        // Tang after quickboot: STARTING stays; stalled repair re-registers Google only (remove + add).
        Shell s=new Shell();ok(s.repair(true)==GeminiRecoveryPolicy.Result.RESTORED,"stuck STARTING restored");ok(s.writes==2&&s.sleeps==2,"two re-checks then remove+add");
        ok(s.commands.indexOf("sleep 1; dumpsys voiceinteraction")<s.commands.indexOf(s.commands.stream().filter(c->c.startsWith("cmd role remove")).findFirst().get()),"waits before writing");
        // Genuinely starting: becomes BOUND during the re-check, nothing is written.
        s=new Shell();s.later.add("true mService=proxy");ok(s.repair(true)==GeminiRecoveryPolicy.Result.READY,"late bind is ready");ok(s.writes==0&&s.sleeps==1,"no write when it binds");
        s=new Shell();s.later.add("true mService=null");s.later.add("true mService=proxy");ok(s.repair(true)==GeminiRecoveryPolicy.Result.READY&&s.writes==0&&s.sleeps==2,"binds on second re-check");
        // Not stalled keeps the 54N contract: STARTING waits without any write or sleep.
        s=new Shell();ok(s.repair(false)==GeminiRecoveryPolicy.Result.STARTING&&s.writes==0&&s.sleeps==0,"54N STARTING contract");
        final Shell two=new Shell();ok(GeminiRecoveryPolicy.repair(two,()->two.allowed)==GeminiRecoveryPolicy.Result.STARTING&&two.writes==0&&two.sleeps==0,"two-argument repair = 54N");
        // Already bound: no re-check, no write, in both modes.
        s=new Shell();s.binding="true mService=proxy";ok(s.repair(true)==GeminiRecoveryPolicy.Result.READY&&s.writes==0&&s.sleeps==0,"bound stays untouched");
        // UNBOUND: same 54N re-register, no extra wait.
        s=new Shell();s.binding="false mService=null";ok(s.repair(true)==GeminiRecoveryPolicy.Result.RESTORED&&s.writes==2&&s.sleeps==0,"unbound restored as before");
        // Cancellation during the wait (Gemini opened late / Maps left): nothing is written.
        s=new Shell();s.cancelOnSleep=true;try{s.repair(true);ok(false,"expected cancel");}catch(IOException e){ok(e.getMessage().equals("cancelled"),"cancelled");}ok(s.writes==0,"no write after cancel");
        // Another assistant: never touched, even when stalled.
        s=new Shell();s.holder="other.assistant";ok(s.repair(true)==GeminiRecoveryPolicy.Result.OTHER_ASSISTANT&&s.writes==0&&s.sleeps==0,"other assistant kept");
        s=new Shell();s.service="other.assistant/other.Service";ok(s.repair(true)==GeminiRecoveryPolicy.Result.OTHER_ASSISTANT&&s.writes==0,"other service kept");
        // Malformed binding still fails closed.
        s=new Shell();s.binding="false mService=bad";try{s.repair(true);ok(false,"expected failure");}catch(IOException e){ok(e.getMessage().equals("binding_unavailable"),"bad binding");}ok(s.writes==0,"no write on bad binding");
        // The nested session's mBound=true/mService never counts as the manager binding.
        ok(GeminiRecoveryPolicy.binding(new Shell().dump(),"0")==GeminiRecoveryPolicy.Binding.STARTING,"session binding ignored");
        System.out.println("PASS 54Q stalled recovery "+checks+" assertions");
    }
}
