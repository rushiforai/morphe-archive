package app.afterglow.extension.interfaceui;

import android.app.Activity;
import android.text.TextDirectionHeuristic;
import android.text.TextDirectionHeuristics;
import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.AfterglowPrefs;

public final class TextDirectionTest {
    private static int checks;
    private static void check(boolean value,String label){checks++;if(!value)throw new AssertionError(label);}
    public static void main(String[] args){
        TextDirectionHeuristic nativeRtl=new TextDirectionHeuristic(){};
        Activity activity=new Activity();
        AfterglowPrefs.enabled=true;
        check(TextDirectionPolicy.paragraph(nativeRtl)==nativeRtl,"uninstalled preserves exact native object");
        TextDirectionPolicy.onActivityCreate(activity);
        check(activity.window.decor.calls==0&&AfterglowPrefs.reads==0,"uninstalled does not read preference or mutate window");
        InstalledTweaks.installed=true;AfterglowPrefs.enabled=false;
        check(TextDirectionPolicy.paragraph(nativeRtl)==nativeRtl,"default off preserves native object");
        check(TextDirectionPolicy.paragraph(null)==null,"off preserves native null contract");
        TextDirectionPolicy.onActivityCreate(activity);
        check(activity.window.decor.calls==0&&activity.window.decor.direction==7,"default off preserves window inheritance");
        AfterglowPrefs.enabled=true;
        check(TextDirectionPolicy.paragraph(nativeRtl)==TextDirectionHeuristics.LTR,"on forces paragraph base LTR");
        check(TextDirectionPolicy.paragraph(TextDirectionHeuristics.LTR)==TextDirectionHeuristics.LTR,"on keeps native LTR identity");
        TextDirectionPolicy.onActivityCreate(activity);
        check(activity.window.decor.direction==3,"platform text inherits LTR from window");
        check(activity.window.decor.layoutDirection==1,"navigation layout direction preserved");
        AfterglowPrefs.fail=true;
        check(TextDirectionPolicy.paragraph(nativeRtl)==nativeRtl,"storage exception preserves native paragraph");
        Activity failed=new Activity();TextDirectionPolicy.onActivityCreate(failed);
        check(failed.window.decor.calls==0,"storage exception preserves window");
        check(Afterglow.errors==1,"storage failure logged once without class poisoning");
        AfterglowPrefs.fail=false;
        check(TextDirectionPolicy.paragraph(nativeRtl)==TextDirectionHeuristics.LTR,"recovered storage remains usable");
        AfterglowPrefs.enabled=false;
        check(TextDirectionPolicy.paragraph(nativeRtl)==nativeRtl,"reset passes subsequent native paragraph unchanged");
        Activity restarted=new Activity();TextDirectionPolicy.onActivityCreate(restarted);
        check(restarted.window.decor.calls==0&&restarted.window.decor.direction==7,"reset restart restores native window inheritance");
        TextDirectionPolicy.onActivityCreate(null);restarted.window=null;TextDirectionPolicy.onActivityCreate(restarted);
        check(Afterglow.errors==1,"absent window is harmless");
        System.out.println("PASS "+checks+" paragraph direction ownership/startup checks");
    }
}
