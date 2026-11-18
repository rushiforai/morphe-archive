#!/usr/bin/env python3
"""Compile the production helper and check its RemoteViews action contract.

Android fakes verify the transaction and guards, not OEM rendering. Device tests
and inspection of the emitted APK are separately documented.
"""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SOURCES = {
    "android/R.java": """
package android;
public final class R { public static final class id { public static final int content=16908290; } }
""",
    "android/os/Build.java": """
package android.os;
public class Build { public static class VERSION { public static int SDK_INT=36; } }
""",
    "android/util/Log.java": """
package android.util;
public class Log { public static int errors; public static int e(String t,String m){errors++;return 0;} }
""",
    "android/content/res/Resources.java": """
package android.content.res;
public class Resources {
    public int id=0x7f0e0700, lookups;
    public int getIdentifier(String name,String type,String pkg) {
        if(!name.equals("dudeks_calendar_widget_row")||!type.equals("layout")||
                !pkg.equals("com.google.android.calendar")) throw new AssertionError("wrong resource lookup");
        lookups++; return id;
    }
}
""",
    "android/content/Context.java": """
package android.content;
public class Context {
    public final android.content.res.Resources resources=new android.content.res.Resources();
    public android.content.res.Resources getResources(){return resources;}
    public String getPackageName(){return "com.google.android.calendar";}
}
""",
    "android/widget/RemoteViews.java": """
package android.widget;
import java.util.*;
public class RemoteViews {
    public record Action(String name,int target,RemoteViews child){}
    public final List<Action> actions=new ArrayList<>();
    public final String pkg; public final int layout;
    public RemoteViews(String p,int l){pkg=p;layout=l;}
    public String getPackage(){return pkg;}
    public int getLayoutId(){return layout;}
    public void removeAllViews(int id){actions.add(new Action("remove",id,null));}
    public void addView(int id,RemoteViews child){actions.add(new Action("add",id,child));}
}
""",
    "CalendarRowsTest.java": """
import android.content.Context;
import android.os.Build;
import android.widget.RemoteViews;
import pl.dudek.extension.calendar.ScheduleWidgetRows;
import java.util.*;
import java.util.concurrent.*;
public class CalendarRowsTest {
    static void check(boolean b,String s){if(!b)throw new AssertionError(s);}
    public static void main(String[] args)throws Exception {
        Context context=new Context();
        RemoteViews first=new RemoteViews(context.getPackageName(),101);
        if(args[0].equals("old")) {
            Build.VERSION.SDK_INT=35;
            ScheduleWidgetRows.initialize(context);
            check(ScheduleWidgetRows.wrap(first)==first,"older Android must pass through");
            check(context.resources.lookups==0,"older Android resource lookup");
        } else if(args[0].equals("missing")) {
            context.resources.id=0;
            ScheduleWidgetRows.initialize(context);
            ScheduleWidgetRows.initialize(context);
            check(ScheduleWidgetRows.wrap(first)==first,"missing resource must not blank row");
            check(android.util.Log.errors==1,"missing resource should log once");
        } else {
            check(ScheduleWidgetRows.wrap(first)==first,"before initialization");
            var pool=Executors.newFixedThreadPool(8);
            try {
                List<Callable<Void>> calls=new ArrayList<>();
                for(int i=0;i<100;i++) calls.add(()->{ScheduleWidgetRows.initialize(context);return null;});
                for(var f:pool.invokeAll(calls))f.get();
            } finally {pool.shutdown();}
            check(context.resources.lookups==1,"concurrent one-time resource resolution");
            check(ScheduleWidgetRows.wrap(null)==null,"null row");
            // Preserve every native action and fill-in click payload by nesting the
            // finished row itself, never a reconstruction from selected fields.
            first.actions.add(new RemoteViews.Action("native click payload",123,null));
            var firstWrapper=ScheduleWidgetRows.wrap(first);
            check(firstWrapper!=first,"row must be wrapped");
            check(firstWrapper.getPackage().equals(first.getPackage()),"resource package");
            check(firstWrapper.getLayoutId()==context.resources.id,"wrapper layout");
            check(ScheduleWidgetRows.wrap(firstWrapper)==firstWrapper,"no nested wrapper growth");
            List<RemoteViews> hostChildren=new ArrayList<>();
            hostChildren.add(new RemoteViews(context.getPackageName(),999));
            for(int i=0;i<100;i++) {
                RemoteViews row=i==0?first:new RemoteViews(context.getPackageName(),100+i%15);
                RemoteViews wrapper=ScheduleWidgetRows.wrap(row);
                check(wrapper.actions.size()==2,"exactly one complete replacement transaction");
                check(wrapper.actions.get(0).name().equals("remove"),"clear before add");
                check(wrapper.actions.get(1).name().equals("add"),"non-stable add after clear");
                for(var action:wrapper.actions) {
                    check(action.target()==android.R.id.content,"same wrapper container");
                    if(action.name().equals("remove"))hostChildren.clear();
                    else hostChildren.add(action.child());
                }
                check(hostChildren.size()==1&&hostChildren.get(0)==row,"no old/duplicate child survives reapply");
            }
            check(first.actions.size()==1,"original row actions remain intact");
            check(firstWrapper.actions.get(1).child()==first,"previous row snapshot is independent");
        }
        System.out.println("PASS: Calendar row action contract ("+args[0]+")");
    }
}
""",
}

with tempfile.TemporaryDirectory(prefix="calendar-rows-test-") as temporary:
    directory = Path(temporary)
    for name, content in SOURCES.items():
        file = directory / name
        file.parent.mkdir(parents=True, exist_ok=True)
        file.write_text(content)
    helper = ROOT / "extensions/calendar/src/main/java/pl/dudek/extension/calendar/ScheduleWidgetRows.java"
    subprocess.run(["javac", "-d", str(directory), *map(str, directory.rglob("*.java")), str(helper)], check=True)
    for scenario in ("normal", "old", "missing"):
        subprocess.run(["java", "-cp", str(directory), "CalendarRowsTest", scenario], check=True)
