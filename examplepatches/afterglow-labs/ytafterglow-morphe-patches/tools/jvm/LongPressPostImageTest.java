package app.afterglow.extension.menus;

import android.app.Activity;
import android.view.ViewGroup;
import android.widget.Toast;
import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.AfterglowPrefs;

/** Production snapshot and stale-action checks; original parser selection is audited in DEX. */
public final class LongPressPostImageTest {
    static int checks,calls;
    static String[] image;
    static Activity activity;
    static ViewGroup root;
    static void check(boolean value,String label){checks++;if(!value)throw new AssertionError(label);}
    static void fixture(){
        activity=new Activity();ViewGroup decor=new ViewGroup(activity);activity.window.decor=decor;
        root=new ViewGroup(activity);decor.addView(root);Afterglow.activity=activity;
        InstalledTweaks.installed=true;AfterglowPrefs.post=true;calls=0;Toast.last=null;
        image=new String[]{"post-key","https://yt3.ggpht.com/post-image=s736-rw-nd-v1"};
        LongPressPostImageActions.resolver=view->{calls++;check(view==root,"exact root passed to original resolver");return image;};
    }
    public static void main(String[] args){
        fixture();check(LongPressPostImageActions.copyAction(activity,root)!=null,"one selected image available");
        fixture();image=null;check(LongPressPostImageActions.copyAction(activity,root)==null,"missing/disabled original result unavailable");
        fixture();image=new String[0];check(LongPressPostImageActions.copyAction(activity,root)==null,"empty original result unavailable");
        fixture();image=new String[]{"key"};check(LongPressPostImageActions.copyAction(activity,root)==null,"incomplete snapshot unavailable");
        fixture();image=new String[]{"",image[1]};check(LongPressPostImageActions.copyAction(activity,root)==null,"ambiguous post key unavailable");
        fixture();image=new String[]{null,image[1]};check(LongPressPostImageActions.copyAction(activity,root)==null,"null post key unavailable");
        fixture();image[1]="https://example.com/image";check(LongPressPostImageActions.copyAction(activity,root)==null,"untrusted source unavailable");
        fixture();image[1]=null;check(LongPressPostImageActions.copyAction(activity,root)==null,"missing URL unavailable");
        fixture();AfterglowPrefs.post=false;check(LongPressPostImageActions.copyAction(activity,root)==null&&calls==0,"post preference off does not touch upstream");
        fixture();InstalledTweaks.installed=false;check(LongPressPostImageActions.copyAction(activity,root)==null&&calls==0,"omitted Afterglow owner does not touch upstream");
        fixture();root.attached=false;check(LongPressPostImageActions.copyAction(activity,root)==null&&calls==0,"detached root unavailable");
        fixture();root.shown=false;check(LongPressPostImageActions.copyAction(activity,root)==null&&calls==0,"hidden root unavailable");
        fixture();root.parent=null;check(LongPressPostImageActions.copyAction(activity,root)==null&&calls==0,"unmounted tree unavailable");
        fixture();activity.destroyed=true;check(LongPressPostImageActions.copyAction(activity,root)==null&&calls==0,"destroyed activity unavailable");
        fixture();activity.finishing=true;check(LongPressPostImageActions.copyAction(activity,root)==null&&calls==0,"finishing activity unavailable");
        fixture();Afterglow.activity=new Activity();check(LongPressPostImageActions.copyAction(activity,root)==null&&calls==0,"stale activity unavailable");
        fixture();Runnable copy=LongPressPostImageActions.copyAction(activity,root);image[1]="https://yt3.ggpht.com/next-image=s512";copy.run();
        check(Toast.last!=null&&Toast.last.contains("changed"),"selected slide change refuses old clipboard action");
        fixture();copy=LongPressPostImageActions.copyAction(activity,root);image[0]="another-post";copy.run();
        check(Toast.last!=null&&Toast.last.contains("changed"),"post change refused even if image URL repeats");
        fixture();copy=LongPressPostImageActions.copyAction(activity,root);image=null;copy.run();
        check(Toast.last!=null&&Toast.last.contains("changed"),"lost upstream selection refuses action");
        fixture();copy=LongPressPostImageActions.copyAction(activity,root);root.attached=false;copy.run();
        check(calls==1&&Toast.last!=null,"detached after opening does not resolve or fetch");
        fixture();copy=LongPressPostImageActions.copyAction(activity,root);AfterglowPrefs.post=false;copy.run();
        check(calls==1&&Toast.last!=null,"disabled after opening does not resolve or fetch");
        fixture();LongPressPostImageActions.resolver=view->{throw new IllegalStateException();};
        check(LongPressPostImageActions.copyAction(activity,root)==null,"upstream exception remains unavailable");
        System.out.println("PASS: "+checks+" production post-image snapshot checks");
    }
}
