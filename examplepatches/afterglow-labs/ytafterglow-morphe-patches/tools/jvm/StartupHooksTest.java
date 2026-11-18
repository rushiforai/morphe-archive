import android.content.Intent;
import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.navigation.StartupHooks;
import app.afterglow.extension.navigation.StartupPage;
import app.afterglow.extension.settings.AfterglowPrefs;

public final class StartupHooksTest {
    private static int checks;
    private static void check(boolean pass,String message){checks++;if(!pass)throw new AssertionError(message);}
    public static void main(String[] args) {
        InstalledTweaks.mark("tab-bar");
        AfterglowPrefs.setBool("startupAnimation",true);
        check(!StartupHooks.animationEligible(false),"Tab bar hook dependency alone cannot enable animation");
        check(StartupHooks.animationEligible(true),"unselected owner retains native eligible startup");
        InstalledTweaks.mark("startup");
        check(StartupHooks.animationEligible(false),"selected setting enables an ineligible native startup");
        AfterglowPrefs.setBool("startupAnimation",false);
        check(!StartupHooks.animationEligible(false),"turning setting off restores native ineligible startup");
        check(StartupHooks.animationEligible(true),"OFF is native passthrough, not disable animation");
        AfterglowPrefs.setBool("startupAnimation",true);
        AfterglowPrefs.failReads=true;
        check(!StartupHooks.animationEligible(false),"unavailable preferences preserve native false");
        check(StartupHooks.animationEligible(true),"unavailable preferences preserve native true");
        check(Afterglow.errors==2,"both storage errors are reported without initializer poisoning");
        AfterglowPrefs.failReads=false;
        check(StartupHooks.animationEligible(false),"next launch can recover preferences");
        AfterglowPrefs.setString("startupTab","FEhistory");
        check(StartupHooks.browseId(StartupPage.HOME).equals("FEhistory"),"animation does not replace selected native page");
        check(StartupHooks.guideMilestone(7)==1,"non-Home page keeps immediate guide readiness");
        AfterglowPrefs.setString("startupTab",StartupPage.AFTERGLOW);
        check(StartupHooks.browseId(StartupPage.HOME).equals(StartupPage.HOME),"Afterglow startup leaves native Home for the separate attached tab route");
        AfterglowPrefs.setString("startupTab",StartupPage.SHORTS);
        Intent launcher=new Intent("android.intent.action.MAIN");StartupHooks.launchIntent(launcher);
        check(launcher.getAction().equals(StartupPage.SHORTS_INTENT_ACTION),"Shorts native launcher behavior retained");
        Intent videoLink=new Intent("android.intent.action.VIEW");StartupHooks.launchIntent(videoLink);
        check(videoLink.getAction().equals("android.intent.action.VIEW"),"external video link keeps its action");
        Intent shortcut=new Intent("custom.native.shortcut");StartupHooks.launchIntent(shortcut);
        check(shortcut.getAction().equals("custom.native.shortcut"),"native shortcut action retained");
        StartupHooks.launchIntent(null);check(true,"null launch intent remains safe");
        AfterglowPrefs.setBool("liteModeEnabled",true);
        Intent liteLauncher=new Intent("android.intent.action.MAIN");StartupHooks.launchIntent(liteLauncher);
        check(liteLauncher.getAction().equals("android.intent.action.MAIN"),"Lite Mode retains Home launcher action");
        check(StartupHooks.browseId(StartupPage.HOME).equals(StartupPage.HOME),"Lite Mode starts Home");
        check(AfterglowPrefs.getString("startupTab").equals(StartupPage.SHORTS),"Lite Mode leaves saved startup selection intact");
        check(StartupHooks.animationEligible(false),"explicit animation choice still works in Lite Mode");
        AfterglowPrefs.setBool("startupAnimation",false);
        check(!StartupHooks.animationEligible(false),"Lite Mode does not implicitly enable animation");
        AfterglowPrefs.setBool("liteModeEnabled",false);
        Intent restored=new Intent("android.intent.action.MAIN");StartupHooks.launchIntent(restored);
        check(restored.getAction().equals(StartupPage.SHORTS_INTENT_ACTION),"leaving Lite Mode restores saved Shorts startup");
        System.out.println("StartupHooksTest: "+checks+" checks passed");
    }
}
