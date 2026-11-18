import android.app.*;
import android.view.*;
import android.widget.*;
import app.afterglow.extension.*;
import app.afterglow.extension.menus.*;
import app.afterglow.extension.settings.*;
import app.afterglow.extension.video.VideoState;

public final class DescriptionHeaderBindingTest {
    static int checks;
    static void check(boolean ok,String label){checks++;if(!ok)throw new AssertionError(label);}
    static final class Host implements DescriptionHeaderHost {
        View root;Object panel=new Object();String id=DescriptionHeaderPolicy.PANEL;
        Host(View view){root=view;}
        public View afterglow_descriptionRoot(){return root;}
        public Object afterglow_descriptionPanel(){return panel;}
        public String afterglow_descriptionPanelId(){return id;}
    }
    static ImageButton button(ViewGroup root){for(View v:root.children)if(v instanceof ImageButton)return (ImageButton)v;return null;}
    public static void main(String[] ignored){
        Activity activity=new Activity();Afterglow.activity=activity;
        FrameLayout root=new FrameLayout(activity);activity.window.decor=root;
        View nativeClose=new View(activity);root.addView(nativeClose);Object nativeListener=nativeClose.nativeListener;
        Host first=new Host(root);
        LiteMode.enabled=false;DescriptionHeaderActions.bind(first);
        check(button(root)==null&&root.children.size()==1,"default OFF adds no Copy view");
        LiteMode.enabled=true;AfterglowPrefs.changed();
        check(button(root)!=null&&root.children.size()==2,"live enable adds one button");
        DescriptionHeaderActions.bind(first);DescriptionHeaderActions.bind(first);
        check(root.children.size()==2,"repeated binds do not duplicate button");
        check(nativeClose.nativeListener==nativeListener&&nativeClose.parent==root,"native close listener and view preserved");
        DescriptionHeaderSource.rememberTitle(VideoState.id,"Full native title \uD83D\uDE00");
        button(root).performClick();AlertDialog menu=AlertDialog.last;
        check(menu.choices.length==2&&menu.choices[0].equals("Copy title")&&menu.choices[1].equals("Copy description"),"exact two explicit copy actions");
        menu.listener.onClick(menu,0);
        check(activity.clipboard.value.text.toString().equals("Full native title \uD83D\uDE00"),"current native full title copied");
        activity.clipboard.value=null;
        button(root).performClick();AlertDialog stale=AlertDialog.last;
        Host next=new Host(root);next.id="shorts-comments-panel";
        DescriptionHeaderActions.bind(next);
        check(button(root)==null&&root.getTag(1)==null,"different non-Description owner clears old binding and button");
        stale.listener.onClick(stale,0);
        check(activity.clipboard.value==null,"reused root cannot execute old menu copy even if old host still claims Description");
        check(AfterglowPrefs.listeners.isEmpty()&&VideoState.listeners.isEmpty(),"old recycled root observers detached");
        check(root.children.size()==1&&nativeClose.nativeListener==nativeListener,"recycle preserves every native child/listener");
        DescriptionHeaderActions.bind(first);button(root).performClick();stale=AlertDialog.last;
        root.detach();root.attach();stale.listener.onClick(stale,0);
        check(activity.clipboard.value==null,"same-owner detach/reattach invalidates old menu");
        button(root).performClick();stale=AlertDialog.last;
        VideoState.change("dQw4w9WgXcQ");stale.listener.onClick(stale,0);
        check(activity.clipboard.value==null,"native active-video change rejects old menu");
        LiteMode.enabled=false;AfterglowPrefs.changed();check(button(root)==null,"live disable removes only added button");
        root.detach();check(AfterglowPrefs.listeners.isEmpty()&&VideoState.listeners.isEmpty(),"detach releases observers");
        InstalledTweaks.installed=false;LiteMode.enabled=true;
        FrameLayout absent=new FrameLayout(activity);DescriptionHeaderActions.bind(new Host(absent));check(absent.children.isEmpty()&&absent.getTag(1)==null,"uninstalled feature is inert");
        InstalledTweaks.installed=true;
        LinearLayout legacy=new LinearLayout(activity);activity.window.decor=legacy;
        LinearLayout row=new LinearLayout(activity);legacy.addView(row);View title=new View(activity);View close=new View(activity);close.id=2;row.addView(title);row.addView(close);
        Object legacyNativeListener=close.nativeListener;DescriptionHeaderActions.bind(new Host(legacy));
        check(row.children.size()==3&&row.children.get(0)==title&&row.children.get(1) instanceof ImageButton&&row.children.get(2)==close,"legacy Copy immediately precedes native Close");
        check(close.nativeListener==legacyNativeListener,"legacy native close listener untouched");
        legacy.detach();
        for(float density:new float[]{1f,2.625f,4f}){
            android.content.res.Resources.density=density;
            FrameLayout scaled=new FrameLayout(activity);activity.window.decor=scaled;
            DescriptionHeaderActions.bind(new Host(scaled));ImageButton icon=button(scaled);
            check(icon.icon.getIntrinsicWidth()==Math.round(24*density)&&icon.icon.getIntrinsicHeight()==Math.round(24*density),"Copy drawable intrinsic pixels follow24dp at density "+density);
            check(icon.params.width==Math.round(40*density)&&icon.params.height==Math.round(40*density),"touch target remains40dp at density "+density);
            check(icon.paddingLeft==Math.round(8*density)&&icon.paddingRight==Math.round(8*density)&&icon.params.width-icon.paddingLeft-icon.paddingRight==icon.icon.getIntrinsicWidth(),"centered icon fits unchanged8dp padding at density "+density);
            scaled.detach();
        }
        android.content.res.Resources.density=1f;
        System.out.println("PASS "+checks+" actual Description header lifecycle/menu checks");
    }
}
