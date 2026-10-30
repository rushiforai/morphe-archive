// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import java.io.IOException;
import java.util.function.BooleanSupplier;

/** Fixed RoleManager protocol; no arbitrary package, setting writes or role clearing. */
final class GeminiRecoveryPolicy {
    static final String GOOGLE="com.google.android.googlequicksearchbox";
    static final String SERVICE=GOOGLE+"/com.google.android.voiceinteraction.GsaVoiceInteractionService";
    static final String ROLE="android.app.role.ASSISTANT";
    interface Shell { String execute(String command)throws IOException; }
    enum Result { READY, STARTING, RESTORED, OTHER_ASSISTANT }
    enum Binding { BOUND, STARTING, UNBOUND, UNKNOWN }
    enum Choice { NONE, GOOGLE, OTHER, UNKNOWN }
    static Choice component(String text){
        if(text==null)return Choice.UNKNOWN;
        String s=text.trim();if(s.isEmpty()||s.equals("null"))return Choice.NONE;
        if(s.equals(SERVICE))return Choice.GOOGLE;
        return s.matches("[A-Za-z0-9_.]+/[A-Za-z0-9_.$]+")?Choice.OTHER:Choice.UNKNOWN;
    }
    static Choice holder(String dump,String user){
        if(dump==null)return Choice.UNKNOWN;
        boolean inUser=false,inRole=false,found=false;Choice result=Choice.NONE;
        for(String line:dump.split("\n")){
            String s=line.trim();
            if(s.startsWith("user_id=")){
                if(inUser)return found?result:Choice.UNKNOWN;
                inUser=s.equals("user_id="+user);continue;
            }
            if(!inUser)continue;
            if(s.startsWith("name=")){
                if(inRole)return result;
                inRole=s.equals("name="+ROLE);found|=inRole;
            }else if(inRole&&s.startsWith("holders=")){
                String value=s.substring(8).trim();
                result=value.isEmpty()?Choice.NONE:value.equals(GOOGLE)?Choice.GOOGLE:Choice.OTHER;
            }
        }
        return found?result:Choice.UNKNOWN;
    }
    /** Only the manager's Google service binding, never a nested session's mBound flag. */
    static Binding binding(String dump,String user){
        if(dump==null||!dump.contains(SERVICE)||!java.util.regex.Pattern.compile("\\bmCurUser[=:]\\s*"+java.util.regex.Pattern.quote(user)+"\\b").matcher(dump).find())return Binding.UNKNOWN;
        java.util.regex.Matcher m=java.util.regex.Pattern.compile("(?m)^\\s*mBound=(true|false) mService=([^\\r\\n]+)$").matcher(dump);
        if(!m.find())return Binding.UNKNOWN;
        String flag=m.group(1),service=m.group(2).trim();if(m.find())return Binding.UNKNOWN;
        if(flag.equals("true"))return service.equals("null")?Binding.STARTING:Binding.BOUND;
        return service.equals("null")?Binding.UNBOUND:Binding.UNKNOWN;
    }
    private static String user(Shell shell)throws IOException{
        String s=shell.execute("am get-current-user").trim();
        if(!s.matches("0|[1-9][0-9]{0,5}"))throw new IOException("user_unavailable");
        return s;
    }
    private static Choice setting(Shell shell,String user,String key)throws IOException{
        return component(shell.execute("settings --user "+user+" get secure "+key));
    }
    private static boolean safe(Shell shell,String user,BooleanSupplier allowed)throws IOException{
        check(allowed);if(!user.equals(user(shell)))throw new IOException("user_changed");
        Choice a=setting(shell,user,"assistant"),v=setting(shell,user,"voice_interaction_service");
        Choice h=holder(shell.execute("dumpsys role"),user);
        check(allowed);
        if(a==Choice.UNKNOWN||v==Choice.UNKNOWN||h==Choice.UNKNOWN)throw new IOException("state_unavailable");
        return a!=Choice.OTHER&&v!=Choice.OTHER&&h!=Choice.OTHER;
    }
    private static void check(BooleanSupplier allowed)throws IOException{
        if(!allowed.getAsBoolean())throw new IOException("cancelled");
    }
    private static void command(Shell shell,String action,String user)throws IOException{
        String marker="|maps_gemini_role_rc=0|";
        String output=shell.execute("cmd role "+action+" --user "+user+" "+ROLE+" "+GOOGLE+" 0; printf '|maps_gemini_role_rc=%s|' \"$?\"").trim();
        if(!output.equals(marker))throw new IOException("role_rejected");
    }
    static Result repair(Shell shell,BooleanSupplier allowed)throws IOException{return repair(shell,allowed,false);}
    /** stalled: a session was shown but no Gemini window followed. On Tang after a quickboot wake the
     * manager binding can stay STARTING (mBound=true mService=null) for good; if it is still STARTING
     * after two more one-second checks it gets the same Google-only re-register as UNBOUND. */
    static Result repair(Shell shell,BooleanSupplier allowed,boolean stalled)throws IOException{
        check(allowed);if(!shell.execute("id -u").trim().equals("2000"))throw new IOException("not_shell");
        String u=user(shell);
        if(!safe(shell,u,allowed))return Result.OTHER_ASSISTANT;
        if(setting(shell,u,"voice_interaction_service")==Choice.GOOGLE){
            Binding b=binding(shell.execute("dumpsys voiceinteraction"),u);
            for(int i=0;stalled&&b==Binding.STARTING&&i<2;i++){check(allowed);b=binding(shell.execute("sleep 1; dumpsys voiceinteraction"),u);}
            if(b==Binding.BOUND)return Result.READY;
            if(b==Binding.STARTING&&!stalled)return Result.STARTING;
            if(b!=Binding.UNBOUND&&b!=Binding.STARTING)throw new IOException("binding_unavailable");
            // A force-stop can leave Google selected but unbound. Re-register only our Google role.
        }
        // Remove only Google if Android still holds its stale role. Never clear all holders.
        Choice h=holder(shell.execute("dumpsys role"),u);
        if(h==Choice.GOOGLE){
            if(!safe(shell,u,allowed))return Result.OTHER_ASSISTANT;
            command(shell,"remove-role-holder",u);
        }
        if(!safe(shell,u,allowed))return Result.OTHER_ASSISTANT;
        command(shell,"add-role-holder",u);
        check(allowed);
        if(!u.equals(user(shell)))throw new IOException("user_changed");
        return Result.RESTORED;
    }
}
