package app.morphe.extension.chmate;

import java.util.Arrays;

/** Regression: replacing http.agent's suffix must not erase ChMate's native client identification. */
public final class NativeUserAgentIdentityTest {
    private static int checks;
    private static void check(boolean ok,String message){if(!ok)throw new AssertionError(message);checks++;}
    public static void main(String[] args){
        String selected=BrowserUaTemplates.value(1);
        for(String version:new String[]{"0.8.10.191","0.8.10.226","0.8.10.242 dev"}){
            String prefix="Monazilla/1.00 2chMate/"+version+" ";
            String nativeAgent=prefix+"Dalvik/2.1.0 (Linux; U; Android 15; ActualDevice Build/ACTUAL)";
            String expected=prefix+selected;
            String changed=ViewingUserAgentRules.withNativeIdentity(nativeAgent,selected);
            check(expected.equals(changed),"native identity and complete version retained: "+version);
            check(changed.equals(ViewingUserAgentRules.withNativeIdentity(changed,selected)),"repeated preparation does not duplicate identity");
            String[] headers={"Cookie","session=unchanged","user-agent",nativeAgent,"User-Agent","duplicate","X-Test","keep"};
            String[] result=ViewingUserAgentRules.headers(headers,selected);
            check(Arrays.equals(result,new String[]{"Cookie","session=unchanged","X-Test","keep","User-Agent",expected}),"native request identity, Cookie and other headers retained");
            check(headers[3].equals(nativeAgent)&&headers[5].equals("duplicate"),"shared input headers not modified");
        }
        check(selected.equals(ViewingUserAgentRules.withNativeIdentity(null,selected)),"missing native header uses selected UA");
        check(selected.equals(ViewingUserAgentRules.withNativeIdentity("Generic-Agent",selected)),"ordinary client uses selected UA");
        String unknown="Monazilla/1.00 2chMate/0.8.10.242 UnknownRuntime/1.0";
        check(unknown.equals(ViewingUserAgentRules.withNativeIdentity(unknown,selected)),"unknown native format does not lose identity");
        check(unknown.equals(ViewingUserAgentRules.withNativeIdentity(unknown,"bad\r\nheader")),"invalid replacement leaves original UA intact");
        String legacyBrowser="Monazilla/1.00 2chMate/0.8.10.242 Mozilla/5.0 Old-Agent";
        check(("Monazilla/1.00 2chMate/0.8.10.242 "+selected).equals(ViewingUserAgentRules.withNativeIdentity(legacyBrowser,selected)),"previous browser suffix can be replaced");
        check(unknown.equals(ViewingUserAgentRules.withNativeIdentity(unknown,unknown)),"explicit complete UA not prefixed twice");
        String large="Dalvik/"+"x".repeat(1010),nativeAgent="Monazilla/1.00 2chMate/0.8.10.242 Dalvik/2.1.0";
        check(nativeAgent.equals(ViewingUserAgentRules.withNativeIdentity(nativeAgent,large)),"oversized combined UA does not corrupt native identity");
        System.out.println("COMPLETE checks="+checks);
    }
}
