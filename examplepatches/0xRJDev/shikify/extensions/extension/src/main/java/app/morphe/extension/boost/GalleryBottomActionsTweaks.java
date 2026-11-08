package app.morphe.extension.boost;

import android.app.Activity;
import android.os.Build;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import androidx.appcompat.widget.ActionMenuView;
import androidx.appcompat.widget.Toolbar;

/** Moves the original action menu: keeps Fragment dispatch, icons, submenus and enabled states. */
public final class GalleryBottomActionsTweaks {
    static final String GRID="com.rubenmayayo.reddit.ui.activities.GalleryGridActivity";
    private static final String PANEL_TAG = "app.shiki.boost.gallery.actions";
    private static final java.util.WeakHashMap<View,FeedPillBlur> GLASS=new java.util.WeakHashMap<>();
    private GalleryBottomActionsTweaks() { }
    static void glassSurfaces(View root,boolean active,boolean enabled){
        if(Build.VERSION.SDK_INT<31)return;
        for(String suffix:new String[]{".image",".gallery",".video",".grid"}){
            View panel=root.findViewWithTag(PANEL_TAG+suffix);
            FeedPillBlur glass=panel==null ? null:GLASS.get(panel);
            if(glass==null)continue;
            if(!active)glass.freeze();
            else if(enabled){
                if(panel.getBackground()!=glass)panel.setBackground(glass);
                glass.start();
            }else{
                glass.stop();
                panel.setBackground(SurfaceAppearanceTweaks.pillBackground(panel.getContext(),SurfaceAppearanceTweaks.role(panel.getContext(),true),32));
            }
        }
    }

    /** Single-image viewing has its own Activity and never enters GalleryActivity. */
    public static void onImageResume(Object instance) {
        if(!(instance instanceof Activity) || !instance.getClass().getName().equals("com.rubenmayayo.reddit.ui.activities.MediaImageActivity"))return;
        Activity activity=(Activity)instance;
        Object toolbar=CommentsChromeTweaks.field(activity,"toolbar"),bottom=CommentsChromeTweaks.field(activity,"bottomBar");
        View root=activity.getWindow().getDecorView().findViewById(android.R.id.content);
        if(!(root instanceof FrameLayout) || !(toolbar instanceof Toolbar) || !(bottom instanceof View) || root.findViewWithTag(PANEL_TAG+".image")!=null)return;
        new ImageControls((FrameLayout)root,(Toolbar)toolbar,(View)bottom).install();
    }

    private abstract static class Pill implements ViewTreeObserver.OnPreDrawListener,ViewTreeObserver.OnGlobalLayoutListener,View.OnAttachStateChangeListener {
        final FrameLayout root;
        final Toolbar toolbar;
        final View bottom;
        final int[] location=new int[2];
        View panel;
        FeedPillBlur glass;
        Pill(FrameLayout root,Toolbar toolbar,View bottom){this.root=root;this.toolbar=toolbar;this.bottom=bottom;}
        int dp(int value){return Math.round(value*root.getResources().getDisplayMetrics().density);}
        void style(View view){view.setBackground(SurfaceAppearanceTweaks.pillBackground(view.getContext(),SurfaceAppearanceTweaks.role(view.getContext(),true),32));view.setElevation(dp(6));}
        void install(View panel,int width,int height){
            this.panel=panel;
            FrameLayout.LayoutParams params=new FrameLayout.LayoutParams(width,height,Gravity.BOTTOM|Gravity.CENTER_HORIZONTAL);
            if(width==-1)params.leftMargin=params.rightMargin=dp(12);
            root.addView(panel,params);
            if(Build.VERSION.SDK_INT>=31 && root.getChildCount()>1){
                View source=root.getChildAt(0);
                if(source!=panel){
                    glass=new FeedPillBlur(source,panel,SurfaceAppearanceTweaks.role(root.getContext(),true),true);
                    GLASS.put(panel,glass);
                    if(android.preference.PreferenceManager.getDefaultSharedPreferences(root.getContext()).getBoolean("shikify_feed_pill_blur",true)){
                        panel.setBackground(glass);
                        glass.start();
                    }
                }
            }
            root.addOnAttachStateChangeListener(this);listen();onGlobalLayout();onPreDraw();Motion.enter(panel);
        }
        void listen(){
            ViewTreeObserver observer=root.getViewTreeObserver();
            observer.removeOnPreDrawListener(this);
            observer.removeOnGlobalLayoutListener(this);
            observer.addOnPreDrawListener(this);
            observer.addOnGlobalLayoutListener(this);
        }
        @Override public final boolean onPreDraw(){
            if(hideToolbar() && toolbar.getVisibility()!=View.GONE)toolbar.setVisibility(View.GONE);
            if(hideBottom() && bottom!=null && bottom.getVisibility()!=View.GONE)bottom.setVisibility(View.GONE);
            return updateControls();
        }
        boolean hideBottom(){return true;}
        boolean hideToolbar(){return true;}
        void positionNativeControls(int margin){}
        abstract boolean updateControls();
        @Override public final void onGlobalLayout(){
            WindowInsets insets=root.getRootWindowInsets();
            int safe=insets==null ? 0:insets.getSystemWindowInsetBottom();
            if(insets!=null && Build.VERSION.SDK_INT>=29)safe=Math.max(safe,insets.getSystemGestureInsets().bottom);
            root.getLocationOnScreen(location);int occupied=Math.max(0,root.getRootView().getHeight()-location[1]-root.getHeight());int margin=dp(16)+Math.max(0,safe-occupied);
            FrameLayout.LayoutParams params=(FrameLayout.LayoutParams)panel.getLayoutParams();if(params.bottomMargin!=margin){params.bottomMargin=margin;panel.setLayoutParams(params);}
            positionNativeControls(margin);
        }
        @Override public final void onViewAttachedToWindow(View view){
            listen();
            onGlobalLayout();
            if(Build.VERSION.SDK_INT>=31 && glass!=null){
                GLASS.put(panel,glass);
                glassSurfaces(root,true,android.preference.PreferenceManager.getDefaultSharedPreferences(root.getContext()).getBoolean("shikify_feed_pill_blur",true));
            }
        }
        @Override public final void onViewDetachedFromWindow(View view){
            ViewTreeObserver observer=root.getViewTreeObserver();
            if(observer.isAlive()){
                observer.removeOnPreDrawListener(this);
                observer.removeOnGlobalLayoutListener(this);
            }
            if(Build.VERSION.SDK_INT>=31 && glass!=null){
                glass.stop();
                GLASS.remove(panel);
            }
        }
    }

    /** The grid keeps its title; only the download action moves to the shared bottom pill. */
    static void onGridResume(Activity activity){
        if(!GRID.equals(activity.getClass().getName()))return;
        Object toolbar=CommentsChromeTweaks.field(activity,"toolbar");View root=activity.getWindow().getDecorView().findViewById(android.R.id.content);
        if(!(root instanceof FrameLayout) || !(toolbar instanceof Toolbar) || root.findViewWithTag(PANEL_TAG+".grid")!=null)return;
        FrameLayout host=(FrameLayout)root;int surface=SurfaceAppearanceTweaks.role(activity,true);
        activity.getWindow().setStatusBarColor(android.graphics.Color.TRANSPARENT);
        activity.getWindow().setNavigationBarColor(android.graphics.Color.TRANSPARENT);
        activity.getWindow().setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(surface));
        if(host.getChildCount()>0)host.getChildAt(0).setBackgroundColor(surface);
        new GridControls(host,(Toolbar)toolbar).install();
    }
    private static final class GridControls extends Pill {
        final LinearLayout bubble;final int action;
        GridControls(FrameLayout root,Toolbar toolbar){
            super(root,toolbar,null);
            action=root.getResources().getIdentifier("action_download","id",root.getContext().getPackageName());
            bubble=new LinearLayout(root.getContext());bubble.setTag(PANEL_TAG+".grid");bubble.setGravity(Gravity.CENTER);bubble.setPadding(dp(6),dp(4),dp(6),dp(4));style(bubble);
            android.widget.ImageButton button=new android.widget.ImageButton(root.getContext());button.setContentDescription("Download");
            button.setImageResource(root.getResources().getIdentifier("ic_save_alt_white_24dp","drawable",root.getContext().getPackageName()));
            button.setImageTintList(android.content.res.ColorStateList.valueOf(SurfaceAppearanceTweaks.foreground(root.getContext(),true)));
            button.setScaleType(android.widget.ImageView.ScaleType.CENTER_INSIDE);
            android.util.TypedValue ripple=new android.util.TypedValue();
            root.getContext().getTheme().resolveAttribute(android.R.attr.selectableItemBackgroundBorderless,ripple,true);
            if(ripple.resourceId!=0)button.setBackgroundResource(ripple.resourceId);
            button.setOnClickListener(view->toolbar.getMenu().performIdentifierAction(action,0));
            bubble.addView(button,new LinearLayout.LayoutParams(dp(48),dp(48)));
        }
        void install(){install(bubble,-2,-2);}
        @Override boolean hideToolbar(){return false;}
        @Override boolean updateControls(){android.view.MenuItem item=toolbar.getMenu().findItem(action);if(item!=null && item.isVisible())item.setVisible(false);return true;}
    }

    private static final class ImageControls extends Pill {
        final LinearLayout bubble;
        final android.widget.ImageButton[] buttons;
        final String[] names;
        final int[] actionIds;
        final android.graphics.Rect bounds=new android.graphics.Rect();
        View singlePhoto;
        final View shareButton,pager;
        final int photoId,singlePhotoId;
        ImageControls(FrameLayout root,Toolbar toolbar,View bottom){
            super(root,toolbar,bottom);
            photoId=resource("fragment_image_photoview","id");
            singlePhotoId=resource("image_photoview","id");
            singlePhoto=SurfaceAppearanceTweaks.find(root,"image_photoview");
            shareButton=SurfaceAppearanceTweaks.find(root,"submission_media_overflow");
            pager=SurfaceAppearanceTweaks.find(root,"view_pager");
            names=bottom==null ? new String[]{"action_fit","action_share","action_download","action_grid"}:new String[]{"action_fit","action_share","action_download"};
            buttons=new android.widget.ImageButton[names.length];
            actionIds=new int[names.length];
            for(int index=0;index<names.length;index++)actionIds[index]=resource(names[index],"id");
            bubble=new LinearLayout(root.getContext());bubble.setTag(PANEL_TAG+(bottom==null ? ".gallery":".image"));
            bubble.setGravity(Gravity.CENTER);bubble.setPadding(dp(6),dp(4),dp(6),dp(4));
            style(bubble);
            String[] icons={"ic_aspect_ratio_white_24dp","ic_share_white_24dp","ic_save_alt_white_24dp","ic_grid_on_white_24dp"};
            String[] labels={"Fit / fullscreen","Share image","Download image","Gallery grid"};
            for(int index=0;index<names.length;index++){
                final int selected=index;android.widget.ImageButton button=new android.widget.ImageButton(root.getContext());buttons[index]=button;
                button.setContentDescription(labels[index]);button.setImageResource(resource(icons[index],"drawable"));
                button.setImageTintList(android.content.res.ColorStateList.valueOf(SurfaceAppearanceTweaks.foreground(root.getContext(),true)));
                button.setScaleType(android.widget.ImageView.ScaleType.CENTER_INSIDE);
                android.util.TypedValue ripple=new android.util.TypedValue();
                root.getContext().getTheme().resolveAttribute(android.R.attr.selectableItemBackgroundBorderless,ripple,true);
                if(ripple.resourceId!=0)button.setBackgroundResource(ripple.resourceId);
                button.setOnClickListener(view->{
                    android.view.MenuItem item=toolbar.getMenu().findItem(actionIds[selected]);
                    if(item!=null && item.isEnabled() && item.isVisible())toolbar.getMenu().performIdentifierAction(item.getItemId(),0);
                    else if(selected==0){
                        View photo=activePhoto();
                        if(photo instanceof android.widget.ImageView){
                            boolean cropped=((android.widget.ImageView)photo).getScaleType()!=android.widget.ImageView.ScaleType.CENTER_CROP;
                            ((android.widget.ImageView)photo).setScaleType(cropped ? android.widget.ImageView.ScaleType.CENTER_CROP:android.widget.ImageView.ScaleType.FIT_CENTER);
                        }
                    }
                    else if(selected==1){View share=shareButton;if(share!=null)share.performClick();else shareGallery();}
                });
                bubble.addView(button,new LinearLayout.LayoutParams(dp(48),dp(48)));
            }
        }
        int resource(String name,String type){return root.getResources().getIdentifier(name,type,root.getContext().getPackageName());}
        View activePhoto(){
            if(singlePhoto==null)singlePhoto=root.findViewById(singlePhotoId);
            if(singlePhoto!=null)return singlePhoto;
            if(!(pager instanceof ViewGroup))return null;
            View best=null;long largest=0;ViewGroup pages=(ViewGroup)pager;
            for(int index=0;index<pages.getChildCount();index++){
                View candidate=pages.getChildAt(index).findViewById(photoId);
                if(candidate!=null && candidate.getGlobalVisibleRect(bounds)){
                    long area=(long)bounds.width()*bounds.height();
                    if(area>largest){
                        largest=area;
                        best=candidate;
                    }
                }
            }
            return best;
        }
        boolean hasPhoto(){
            if(singlePhoto==null)singlePhoto=root.findViewById(singlePhotoId);if(singlePhoto!=null)return true;
            if(pager instanceof ViewGroup){
                ViewGroup pages=(ViewGroup)pager;
                for(int index=0;index<pages.getChildCount();index++)if(pages.getChildAt(index).findViewById(photoId)!=null)return true;
            }
            return false;
        }
        void shareGallery(){
            try{
                Activity activity=CommentsChromeTweaks.activity(root.getContext());Object models=CommentsChromeTweaks.field(activity,"A"),pager=CommentsChromeTweaks.field(activity,"viewPager");
                if(!(models instanceof java.util.List) || pager==null)return;
                int index=(Integer)pager.getClass().getMethod("getCurrentItem").invoke(pager);java.util.List<?> images=(java.util.List<?>)models;if(index<0 || index>=images.size())return;
                Object model=images.get(index);String url=(String)model.getClass().getMethod("getDownloadUrl").invoke(model);if(url==null || url.isEmpty())return;
                android.content.Intent send=new android.content.Intent(android.content.Intent.ACTION_SEND).setType("text/plain").putExtra(android.content.Intent.EXTRA_TEXT,url);
                activity.startActivity(android.content.Intent.createChooser(send,"Share image"));
            }catch(ReflectiveOperationException | RuntimeException error){}
        }
        void install(){install(bubble,-2,-2);}
        @Override boolean updateControls(){
            for(int index=0;index<names.length;index++){
                android.view.MenuItem item=toolbar.getMenu().findItem(actionIds[index]);
                boolean enabled=item!=null && item.isEnabled() && item.isVisible();
                if(index==0 && !enabled)enabled=hasPhoto();
                if(index==1 && !enabled)enabled=shareButton!=null;
                if(index==1 && bottom==null)enabled=true;
                buttons[index].setEnabled(enabled);buttons[index].setAlpha(enabled ? 1f:0.38f);
            }
            return true;
        }
    }
    /** Native video/GIF format selection must anchor to the relocated button. */
    public static View findActionAnchor(View toolbar,int id) {
        if(toolbar==null)return null;
        View root=toolbar.getRootView();return root==null ? toolbar.findViewById(id):root.findViewById(id);
    }
    public static void onGalleryCreate(Object instance) {
        if (!(instance instanceof Activity)) return;
        Activity activity = (Activity) instance;
        Object value = CommentsChromeTweaks.field(activity, "toolbar");
        if (!(value instanceof Toolbar)) return;
        Toolbar toolbar = (Toolbar) value;
        // Menu inflation happens later. The pre-draw listener sees Fragment menu additions too.
        View root = activity.getWindow().getDecorView().findViewById(android.R.id.content);
        if (!(root instanceof FrameLayout) || root.findViewWithTag(PANEL_TAG+".gallery") != null) return;
        try {
            new ImageControls((FrameLayout)root,toolbar,null).install();
        } catch (RuntimeException | LinkageError e) {
        }
    }
    /** Native menu and format chooser stay in charge; only the visible button moves to the bottom row. */
    public static void onVideoResume(Object instance) {
        if(!(instance instanceof Activity))return;
        Activity activity=(Activity)instance;
        Object toolbar=CommentsChromeTweaks.field(activity,"toolbar");
        View root=activity.getWindow().getDecorView().findViewById(android.R.id.content);
        if(!(toolbar instanceof Toolbar) || root==null)return;
        View row=SurfaceAppearanceTweaks.find(root,"submission_header_buttons");
        int action=Ids.view(root,"action_download");
        View button=row==null ? null:row.findViewById(action);
        if(button==null || button.getVisibility()==View.VISIBLE && button.isAttachedToWindow() && ((View)button.getParent()).getVisibility()==View.VISIBLE)return;
        button.setVisibility(View.VISIBLE);
        if(button.getParent() instanceof View)((View)button.getParent()).setVisibility(View.VISIBLE);
        Toolbar bar=(Toolbar)toolbar;
        button.setOnClickListener(view->bar.getMenu().performIdentifierAction(action,0));
        // The first resume runs before the window attaches; post waits for it.
        root.post(()->FrameBus.add(root,()->{
            android.view.MenuItem item=bar.getMenu().findItem(action);
            if(item!=null && item.isVisible())item.setVisible(false);
            return true;
        }));
    }
}
