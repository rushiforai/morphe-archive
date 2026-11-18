import android.app.*;
import android.view.*;
import android.widget.*;
import app.afterglow.extension.*;
import app.afterglow.extension.menus.*;
import app.afterglow.extension.settings.*;
import app.afterglow.extension.video.VideoState;

public final class DescriptionHeaderContentTest {
    static int checks;
    static void check(boolean ok,String label){checks++;if(!ok)throw new AssertionError(label);}
    static final class Host implements DescriptionHeaderHost {
        final View root;Object panel=new Object();String id=DescriptionHeaderPolicy.PANEL;
        Host(View root){this.root=root;}
        public View afterglow_descriptionRoot(){return root;}
        public Object afterglow_descriptionPanel(){return panel;}
        public String afterglow_descriptionPanelId(){return id;}
    }
    static final class Context implements LongPressCaptureContext,LongPressMountedTextModel {
        final View root;final Object token;String id="video_title_header.eml-fe|37009a687a6eb31d";
        Context(View root,Object token){this.root=root;this.token=token;}
        public View afterglow_captureRoot(){return root;}
        public Object afterglow_captureBinding(){return token;}
        public String afterglow_captureIdentifier(){return id;}
        public StringBuilder afterglow_capturePath(){return new StringBuilder(id+"|CellType|ContainerType|TextType|");}
        public Object afterglow_captureSource(){return this;}
    }
    static ImageButton button(ViewGroup root){for(View v:root.children){if(v instanceof ImageButton)return (ImageButton)v;if(v instanceof ViewGroup){ImageButton b=button((ViewGroup)v);if(b!=null)return b;}}return null;}
    public static void main(String[] ignored){
        Activity activity=new Activity();Afterglow.activity=activity;InstalledTweaks.installed=true;VideoState.id="rfscVS0vtbw";
        FrameLayout panel=new FrameLayout(activity);panel.width=1000;panel.height=1600;panel.y=600;activity.window.decor=panel;
        ViewGroup recycler=new ViewGroup(activity);panel.addView(recycler);
        ViewGroup title=new ViewGroup(activity);title.width=1000;title.height=72;title.y=600;recycler.addView(title);
        View close=new View(activity);title.addView(close);Object listener=close.nativeListener;
        Host host=new Host(panel);DescriptionHeaderContent.bindPanel(host);Object token=new Object();Context context=new Context(title,token);
        DescriptionHeaderContent.bindRoot(title,token);LiteMode.enabled=false;DescriptionHeaderContent.onText(context);
        check(button(panel)==null&&panel.children.size()==1,"OFF content path preserves native children");
        LiteMode.enabled=true;title.tree.draw();check(button(panel)!=null&&panel.children.size()==2,"current content title creates Copy control");
        check(title.children.size()==1&&title.children.get(0)==close&&close.nativeListener==listener,"actual title and native Close stay unchanged");
        FrameLayout controls=(FrameLayout)panel.children.get(1);FrameLayout.LayoutParams p=(FrameLayout.LayoutParams)controls.params;
        check(p.width==1000&&p.height==56&&p.topMargin==0,"Copy follows title geometry instead of outer empty header");
        DescriptionHeaderSource.rememberTitle(VideoState.id,"Current full title");button(panel).performClick();AlertDialog menu=AlertDialog.last;
        menu.listener.onClick(menu,0);check(activity.clipboard.value.text.toString().equals("Current full title"),"content menu copies full current title");
        activity.clipboard.value=null;button(panel).performClick();menu=AlertDialog.last;
        title.y=580;title.tree.draw();check(button(panel)==null&&panel.children.size()==1,"scrolled title does not float Copy over another row");
        menu.listener.onClick(menu,0);check(activity.clipboard.value==null,"scrolled-away menu is invalidated");
        title.y=600;title.tree.draw();check(button(panel)!=null,"same mounted header restores Copy on return");
        button(panel).performClick();menu=AlertDialog.last;
        host.panel=new Object();title.tree.draw();check(button(panel)==null,"same native panel controller with a new model rejects old title");
        menu.listener.onClick(menu,0);check(activity.clipboard.value==null,"new panel model invalidates pending old menu");
        token=new Object();context=new Context(title,token);DescriptionHeaderContent.bindRoot(title,token);DescriptionHeaderContent.onText(context);
        check(button(panel)!=null,"fresh matching title token binds new panel model");
        Context old=context;token=new Object();context=new Context(title,token);DescriptionHeaderContent.bindRoot(title,token);
        DescriptionHeaderContent.onText(old);check(button(panel)==null,"old text context cannot claim a recycled root");
        context.id="video_description_header.eml-fe|544f1e26a3638932";DescriptionHeaderContent.onText(context);
        check(button(panel)==null,"creator and factoid header is not the title header");
        context.id="video_title_header.eml-fe|37009a687a6eb31d";host.id="engagement-panel-comments-section";DescriptionHeaderContent.onText(context);
        check(button(panel)==null,"exact title template in a non-Description panel is rejected");
        host.id=DescriptionHeaderPolicy.PANEL;title.tree.draw();check(button(panel)!=null,"matching actual Description owner is required");
        button(panel).performClick();menu=AlertDialog.last;title.detach();check(button(panel)==null,"detaching the title removes overlay");
        menu.listener.onClick(menu,0);check(activity.clipboard.value==null,"detached header cannot use old menu");title.attach();
        check(button(panel)!=null,"reattached current title restores current action");
        VideoState.id="dQw4w9WgXcQ";title.tree.draw();check(button(panel)==null,"old title never follows a new active video");
        check(close.nativeListener==listener&&title.children.size()==1,"all lifecycle changes preserve native close and title");
        title.detach();check(AfterglowPrefs.listeners.isEmpty()&&VideoState.listeners.isEmpty()&&title.tree.listeners.isEmpty(),"all overlay and draw observers released on detach");
        VideoState.id="rfscVS0vtbw";title.attach();
        Context rootless=new Context(null,null);Object item=new Object();
        LongPressMountedText.observeSource(rootless,rootless,"Full native title",false);
        check(LongPressMountedText.contextForModel(rootless)!=rootless,"actual shared model lookup returns immutable title context snapshot");
        DescriptionHeaderContent.onNativeMounted(title,item,rootless);
        check(button(panel)!=null,"exact native mount supports a context with no optional root or token");
        button(panel).performClick();menu=AlertDialog.last;
        DescriptionHeaderContent.onUnmounted(title,new Object());
        check(button(panel)!=null,"unbinding a different item in the host preserves the title action");
        DescriptionHeaderContent.onUnmounted(title,item);
        check(button(panel)==null&&title.getTag(4)==null,"native unbind clears the exact title item and observers");
        DescriptionHeaderContent.onMounted(rootless,title,item);
        menu.listener.onClick(menu,0);check(activity.clipboard.value==null,"same-item rebind creates a new action generation");
        Context wrong=new Context(null,null);wrong.id="comment.eml-fe|different";
        DescriptionHeaderContent.onMounted(wrong,title,item);
        check(button(panel)==null,"same mount item reused by another component invalidates prior title");
        DescriptionHeaderContent.onMounted(rootless,title,item);host.id="engagement-panel-comments-section";title.tree.draw();
        check(button(panel)==null,"root-free mount still requires actual Description panel ownership");
        DescriptionHeaderContent.onUnmounted(title,item);
        check(AfterglowPrefs.listeners.isEmpty()&&VideoState.listeners.isEmpty()&&title.tree.listeners.isEmpty(),"native unbind releases all observers");
        host.id=DescriptionHeaderPolicy.PANEL;Context newer=new Context(null,null);
        LongPressMountedText.observeSource(newer,newer,"New full native title",false);
        DescriptionHeaderContent.onNativeMounted(title,item,rootless);DescriptionHeaderContent.onNativeMounted(title,item,newer);
        DescriptionHeaderContent.onNativeUnmounted(title,item,rootless);
        check(button(panel)!=null,"late old-model unbind cannot remove the newer same-item title");
        DescriptionHeaderContent.onNativeUnmounted(title,item,newer);
        check(button(panel)==null&&title.tree.listeners.isEmpty(),"matching current-model unbind releases the title");
        FrameLayout returnedRoot=new FrameLayout(activity);returnedRoot.width=1000;returnedRoot.height=1600;activity.window.decor=returnedRoot;
        ViewGroup content=new ViewGroup(activity);returnedRoot.addView(content);
        ViewGroup actualTitle=new ViewGroup(activity);actualTitle.width=1000;actualTitle.height=72;content.addView(actualTitle);
        FrameLayout footer=new FrameLayout(activity);returnedRoot.addView(footer);
        DescriptionHeaderContent.bindPanel(new Host(footer));Object footerItem=new Object();
        DescriptionHeaderContent.onNativeMounted(actualTitle,footerItem,rootless);
        check(button(returnedRoot)==null,"tagging sibling footer cannot establish title ownership");
        Host returnedOwner=new Host(returnedRoot);DescriptionHeaderContent.bindPanel(returnedOwner);actualTitle.tree.draw();
        check(button(returnedRoot)!=null,"controller returned LoadingFrameLayout owns the actual title subtree");
        DescriptionHeaderContent.onNativeUnmounted(actualTitle,footerItem,rootless);
        System.out.println("PASS "+checks+" actual content header ownership/recycle/scroll checks");
    }
}
