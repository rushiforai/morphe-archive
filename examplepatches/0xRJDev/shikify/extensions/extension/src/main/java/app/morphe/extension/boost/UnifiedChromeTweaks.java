package app.morphe.extension.boost;

import android.app.Activity;
import android.content.Context;
import android.graphics.Outline;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/** Shared native search, destination-list and profile styling. No replacement actions. */
public final class UnifiedChromeTweaks {
    private static final WeakHashMap<View,Boolean> CARDS=new WeakHashMap<>();
    private static final ViewOutlineProvider OUTLINE=new ViewOutlineProvider(){
        @Override public void getOutline(View view,Outline outline){
            outline.setRoundRect(0,0,view.getWidth(),view.getHeight(),dp(view,16));
        }
    };
    private UnifiedChromeTweaks(){}
    private static final int EMPTY_TAG=0x7f5f0003;
    /** Material 3 empty screen: the icon in a tonal circle, and a tonal action button. */
    static void emptyState(ViewGroup view){
        Context context=view.getContext();
        if(view.getTag(EMPTY_TAG)!=null || !SurfaceSettingsActivity.enabled(context,"empty_screens"))return;
        view.setTag(EMPTY_TAG,Boolean.TRUE);
        int container=MaterialYouTweaks.color(context,"colorSecondaryContainer",android.R.attr.colorBackground);
        int content=MaterialYouTweaks.color(context,"colorOnSecondaryContainer",android.R.attr.textColorPrimary);
        View icon=SurfaceAppearanceTweaks.find(view,"empty_state_icon"),text=SurfaceAppearanceTweaks.find(view,"empty_state_text"),button=SurfaceAppearanceTweaks.find(view,"empty_state_button");
        if(icon instanceof ImageView){
            GradientDrawable circle=new GradientDrawable();circle.setShape(GradientDrawable.OVAL);circle.setColor(container);
            icon.setBackground(circle);
            ViewGroup.LayoutParams size=icon.getLayoutParams();size.width=dp(view,96);size.height=dp(view,96);icon.setLayoutParams(size);
            int inset=dp(view,26);icon.setPadding(inset,inset,inset,inset);
            ((ImageView)icon).setScaleType(ImageView.ScaleType.FIT_CENTER);
            ((ImageView)icon).setImageTintList(android.content.res.ColorStateList.valueOf(content));
            if(size instanceof ViewGroup.MarginLayoutParams)((ViewGroup.MarginLayoutParams)size).bottomMargin=dp(view,16);
        }
        if(text instanceof TextView){
            ((TextView)text).setTextColor(MaterialYouTweaks.color(context,"colorOnSurfaceVariant",android.R.attr.textColorSecondary));
            ((TextView)text).setTextSize(android.util.TypedValue.COMPLEX_UNIT_SP,16);
            ((TextView)text).setGravity(android.view.Gravity.CENTER);
        }
        if(button instanceof TextView){
            button.setBackgroundTintList(android.content.res.ColorStateList.valueOf(container));
            ((TextView)button).setTextColor(content);
            try {button.getClass().getMethod("setIconTint",android.content.res.ColorStateList.class).invoke(button,android.content.res.ColorStateList.valueOf(content));}
            catch(ReflectiveOperationException | RuntimeException ignored){ }
            if(button.getLayoutParams() instanceof ViewGroup.MarginLayoutParams)((ViewGroup.MarginLayoutParams)button.getLayoutParams()).topMargin=dp(view,16);
        }
    }
    static int dp(View view,int value){return Math.round(value*view.getResources().getDisplayMetrics().density);}
    static Drawable surface(Context context,int radius){
        return SurfaceAppearanceTweaks.pillBackground(context,MaterialYouTweaks.color(context,"colorSurfaceContainerHigh",android.R.attr.colorBackground),radius);
    }
    public static void onProfileCommentBound(Object holder){
        if(!CommentsChromeTweaks.materialYouEnabled())return;
        CommentLayoutTweaks.bind(holder);CommentLayoutTweaks.onBound(holder);profileRow(holder);
    }
    static void profilePost(Object holder){
        Object value=CommentsChromeTweaks.field(holder,"a");
        if(!(value instanceof View))return;
        Activity owner=CommentsChromeTweaks.activity(((View)value).getContext());
        if(owner!=null && owner.getClass().getName().equals("com.rubenmayayo.reddit.ui.profile.UserActivity"))profileRow(holder);
    }
    static void profileRow(Object holder){
        Object value=CommentsChromeTweaks.field(holder,"a");if(!(value instanceof View))return;View row=(View)value;card(row);
        for(String name:new String[]{"item_comment_submission_info","item_comment_container"}){View view=SurfaceAppearanceTweaks.find(row,name);if(view!=null && view!=row)view.setBackground(null);}
        CommentLayoutTweaks.compactHeader(SurfaceAppearanceTweaks.find(row,"item_comment_container"));
        Object score=CommentsChromeTweaks.field(holder,"scoreTv");if(score instanceof TextView){CommentLayoutTweaks.regularScore((View)score);CommentLayoutTweaks.scoreLabel((TextView)score);}
        if(SurfaceAppearanceTweaks.find(row,"item_comment_submission_info")!=null && row instanceof ViewGroup){
            ViewGroup group=(ViewGroup)row;
            for(int i=0;i<group.getChildCount();i++){
                View child=group.getChildAt(i);
                int height=child.getLayoutParams().height;
                if(child.getClass()==View.class && height>=0 && height<=dp(row,16))child.setVisibility(View.GONE);
            }
        }
    }
    private static void card(View row){
        if(CARDS.containsKey(row))return;CARDS.put(row,true);Motion.press(row,0.98f);row.setBackground(surface(row.getContext(),16));row.setOutlineProvider(OUTLINE);row.setClipToOutline(true);
        if(row.getLayoutParams() instanceof ViewGroup.MarginLayoutParams){
            ViewGroup.MarginLayoutParams params=(ViewGroup.MarginLayoutParams)row.getLayoutParams();
            params.leftMargin=params.rightMargin=dp(row,12);
            params.setMarginStart(params.leftMargin);
            params.setMarginEnd(params.rightMargin);
            params.topMargin=params.bottomMargin=dp(row,6);
            row.setLayoutParams(params);
        }
    }
    static final class Screen {
        final WeakReference<View> root;final boolean profile,reply,messages,search,settings;final int background;
        WeakReference<View> settingsList;
        Groups settingsGroups;final WeakHashMap<View,Boolean> styled=new WeakHashMap<>();
        Screen(Activity activity,View root){
            this.root=new WeakReference<>(root);
            messages=activity.getClass().getName().startsWith("com.rubenmayayo.reddit.ui.messages.");
            profile=activity.getClass().getName().equals("com.rubenmayayo.reddit.ui.profile.UserActivity");
            reply=activity.getClass().getName().equals("com.rubenmayayo.reddit.ui.compose.ReplyActivity");
            search=activity.getClass().getName().startsWith("com.rubenmayayo.reddit.ui.search.");settings=activity.getClass().getName().endsWith(".SettingsActivityCompat");
            background=SurfaceAppearanceTweaks.role(activity,false);
        }
        void update(){
            View decor=root.get();
            if(decor==null)return;
            View base=SurfaceAppearanceTweaks.find(decor,"content");
            if(base==null){
                View host=decor.findViewById(android.R.id.content);
                if(host instanceof ViewGroup && ((ViewGroup)host).getChildCount()>0)base=((ViewGroup)host).getChildAt(0);
            }
            if(base!=null && !styled.containsKey(base)){
                styled.put(base,true);
                base.setBackgroundColor(background);
            }
            if(reply){
                reply(decor);
                return;
            }
            View input=SurfaceAppearanceTweaks.find(decor,"toolbar_search");
            if(input instanceof EditText && !styled.containsKey(input)){
                styled.put(input,true);
                EditText edit=(EditText)input;
                Activity activity=CommentsChromeTweaks.activity(input.getContext());
                Context palette=activity==null ? input.getContext():activity;
                edit.setBackgroundTintList(null);
                edit.setBackground(surface(palette,28));
                edit.setPaddingRelative(dp(edit,16),0,dp(edit,48),0);
                edit.setMinHeight(dp(edit,48));
                int text=SurfaceAppearanceTweaks.foreground(palette,false),support=MaterialYouTweaks.color(palette,"colorOnSurfaceVariant",android.R.attr.textColorSecondary);
                edit.setTextColor(text);
                edit.setHintTextColor(support);
                int glass=edit.getResources().getIdentifier("ic_search_24dp","drawable",edit.getContext().getPackageName());
                if(glass!=0){
                    Drawable icon=palette.getDrawable(glass).mutate();
                    icon.setTint(support);
                    icon.setBounds(0,0,dp(edit,24),dp(edit,24));
                    edit.setCompoundDrawablesRelative(icon,null,null,null);
                    edit.setCompoundDrawablePadding(dp(edit,12));
                }
                    if(edit.getLayoutParams() instanceof ViewGroup.MarginLayoutParams){
                        ViewGroup.MarginLayoutParams p=(ViewGroup.MarginLayoutParams)edit.getLayoutParams();
                        p.topMargin=p.bottomMargin=dp(edit,4);
                        edit.setLayoutParams(p);
                    }
                }
            if(profile || messages){
                View tabs=SurfaceAppearanceTweaks.find(decor,"tabs");
                if(tabs!=null && !styled.containsKey(tabs)){
                    styled.put(tabs,true);
                    tabs.setBackground(surface(tabs.getContext(),24));
                    if(tabs.getLayoutParams() instanceof ViewGroup.MarginLayoutParams){
                        ViewGroup.MarginLayoutParams p=(ViewGroup.MarginLayoutParams)tabs.getLayoutParams();
                        p.leftMargin=p.rightMargin=dp(tabs,12);
                        p.topMargin=p.bottomMargin=dp(tabs,6);
                        tabs.setLayoutParams(p);
                    }
                }
                View banner=SurfaceAppearanceTweaks.find(decor,"user_info_banner");
                if(banner instanceof ImageView){
                    ImageView image=(ImageView)banner;
                    if(!styled.containsKey(image)){
                        styled.put(image,true);
                        image.setBackground(surface(image.getContext(),0));
                    }
                    try{
                        int id=image.getResources().getIdentifier("trianglespattern75","drawable",image.getContext().getPackageName());
                        Drawable fallback=id==0 ? null:image.getContext().getDrawable(id),current=image.getDrawable();
                        if(current!=null && (current.getConstantState()!=null && current.getConstantState()==(fallback==null ? null:fallback.getConstantState()) || current instanceof BitmapDrawable && fallback instanceof BitmapDrawable && ((BitmapDrawable)current).getBitmap()==((BitmapDrawable)fallback).getBitmap()))image.setImageDrawable(null);
                    }catch(RuntimeException ignored){
                    }
                }
            }
            if(messages)messageControls(decor);
            View content=SurfaceAppearanceTweaks.find(decor,"container");if(content==null)content=decor.findViewById(android.R.id.content);if(content==null)content=decor;lists(content);
        }
        /** Boost hides the header button for these sections, so the chevron is set on each frame. */
        private void searchHeaders(){
            View decor=root.get(),list=decor==null ? null:SurfaceAppearanceTweaks.find(decor,"recyclerview");if(!(list instanceof ViewGroup))return;
            ViewGroup rows=(ViewGroup)list;Context context=list.getContext();
            for(int index=0;index<rows.getChildCount();index++){
                View row=rows.getChildAt(index),button=SurfaceAppearanceTweaks.find(row,"item_search_header_button"),label=SurfaceAppearanceTweaks.find(row,"item_search_text");
                if(!(button instanceof TextView) || !(label instanceof TextView))continue;
                TextView action=(TextView)button;String title=((TextView)label).getText().toString();
                boolean section=SearchTweaks.FEEDS.equals(title) || SearchTweaks.SUBSCRIPTIONS.equals(title);
                if(!section){if(action.getCompoundDrawablesRelative()[2]!=null)action.setCompoundDrawablesRelative(null,null,null,null);continue;}
                String arrow=SearchTweaks.collapsed(context,title) ? "ic_keyboard_arrow_down_24dp":"ic_keyboard_arrow_up_24dp";
                if(arrow.equals(action.getTag())&& action.getVisibility()==View.VISIBLE)continue;
                action.setTag(arrow);action.setText("");action.setVisibility(View.VISIBLE);
                action.setCompoundDrawablesRelativeWithIntrinsicBounds(0,0,context.getResources().getIdentifier(arrow,"drawable",context.getPackageName()),0);
                action.setCompoundDrawableTintList(android.content.res.ColorStateList.valueOf(MaterialYouTweaks.color(context,"colorOnSurfaceVariant",android.R.attr.textColorSecondary)));
            }
        }
        /** Settings categories sit on rounded surfaces; a category title has no widget frame. */
        void frame(){
            View host=root.get();
            if(search && host!=null && Features.search() && SurfaceSettingsActivity.enabled(host.getContext(),"search_page"))searchHeaders();
            if(!settings)return;
            View decor=root.get(),list=decor==null ? null:SurfaceAppearanceTweaks.find(decor,"recycler_view");if(!(list instanceof ViewGroup))return;
            if(settingsList==null || settingsList.get()!=list){settingsList=new WeakReference<>(list);settingsGroups=new Groups(list);}
            settingsGroups.collect((ViewGroup)list,row->row.findViewById(android.R.id.widget_frame)!=null);
        }
        private void messageControls(View decor){
            for(String name:new String[]{"reply_field_view","edit_text"}){View view=SurfaceAppearanceTweaks.find(decor,name);if(view==null || styled.containsKey(view))continue;styled.put(view,true);
                view.setBackgroundTintList(null);view.setBackground(surface(view.getContext(),name.equals("edit_text") ? 24:16));
                if(view instanceof EditText){
                    ((EditText)view).setTextColor(SurfaceAppearanceTweaks.foreground(view.getContext(),false));
                    ((EditText)view).setHintTextColor(MaterialYouTweaks.color(view.getContext(),"colorOnSurfaceVariant",android.R.attr.textColorSecondary));
                }
            }
            for(String name:new String[]{"fab","fab_submit"}){View fab=SurfaceAppearanceTweaks.find(decor,name);if(fab==null || styled.containsKey(fab))continue;styled.put(fab,true);
                try{
                    Object shape=fab.getClass().getMethod("getShapeAppearanceModel").invoke(fab);
                    Object half=shape.getClass().getField("m").get(null);
                    shape=shape.getClass().getMethod("e",half.getClass()).invoke(shape,half);
                    fab.getClass().getMethod("setShapeAppearanceModel",shape.getClass()).invoke(fab,shape);
                }catch(ReflectiveOperationException | RuntimeException ignored){
                }
            }
        }
        private void reply(View decor){
            for(String name:new String[]{"parent_container","formatting_bar"}){
                View view=SurfaceAppearanceTweaks.find(decor,name);
                if(view==null || styled.containsKey(view))continue;
                styled.put(view,true);
                view.setBackgroundTintList(null);
                view.setBackground(surface(view.getContext(),name.equals("parent_container") ? 16:24));
                if(view.getLayoutParams() instanceof ViewGroup.MarginLayoutParams){
                    ViewGroup.MarginLayoutParams p=(ViewGroup.MarginLayoutParams)view.getLayoutParams();
                    p.leftMargin=p.rightMargin=dp(view,12);
                    p.setMarginStart(p.leftMargin);
                    p.setMarginEnd(p.rightMargin);
                    p.topMargin=dp(view,8);
                    p.bottomMargin=dp(view,8);
                    view.setLayoutParams(p);
                }
                if(name.equals("formatting_bar") && view.getParent() instanceof View)((View)view.getParent()).setBackgroundColor(background);
                if(name.equals("parent_container"))view.setPadding(dp(view,4),dp(view,8),dp(view,4),dp(view,8));
            }
            View edit=SurfaceAppearanceTweaks.find(decor,"edit");
            if(edit instanceof EditText && !styled.containsKey(edit)){
                styled.put(edit,true);
                ((EditText)edit).setTextColor(SurfaceAppearanceTweaks.foreground(edit.getContext(),false));
                ((EditText)edit).setHintTextColor(MaterialYouTweaks.color(edit.getContext(),"colorOnSurfaceVariant",android.R.attr.textColorSecondary));
            }
            View quote=SurfaceAppearanceTweaks.find(decor,"parent_body");if(quote!=null && !styled.containsKey(quote)){styled.put(quote,true);quote.setBackground(null);}
        }
        private void lists(View view){
            for(Class<?> type=view.getClass();type!=null;type=type.getSuperclass())if(type.getName().equals("androidx.recyclerview.widget.RecyclerView")){
                ViewGroup list=(ViewGroup)view;
                View parent=list.getParent() instanceof View ? (View)list.getParent():null;
                if(parent!=null && !styled.containsKey(parent)){
                    styled.put(parent,true);
                    parent.setBackground(null);
                }
                removeListDividers(list);
                    for(int index=0;index<list.getChildCount();index++){
                        View row=list.getChildAt(index);
                        if(profile){
                            if(SurfaceAppearanceTweaks.find(row,"submission_header_title")!=null)card(row);
                        }else if(messages && SurfaceAppearanceTweaks.find(row,"item_message_container")!=null){
                            card(row);
                        }else if(SurfaceAppearanceTweaks.find(row,"item_search_text")!=null || SurfaceAppearanceTweaks.find(row,"item_subreddit_name")!=null || SurfaceAppearanceTweaks.find(row,"item_subreddit_view")!=null){
                            if(!styled.containsKey(row)){
                                styled.put(row,true);
                                if(search){
                                    dividers(row);
                                    continue;
                                }
                                card(row);
                                if(row.getLayoutParams().height>0 && row.getLayoutParams().height<dp(row,56)){
                                    ViewGroup.LayoutParams p=row.getLayoutParams();
                                    p.height=dp(row,56);
                                    row.setLayoutParams(p);
                                }
                                dividers(row);
                            }
                        }
                    }
                    return;
                }
            if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int index=0;index<group.getChildCount();index++)lists(group.getChildAt(index));}
        }
        private void removeListDividers(View list){
            Object value=CommentsChromeTweaks.field(list,"K");
            if(!(value instanceof java.util.List))return;
            java.util.List<?> decorations=(java.util.List<?>)value;
            for(int index=decorations.size()-1;index>=0;index--){
                Object decoration=decorations.get(index);
                if(!decoration.getClass().getName().equals("fp1"))continue;
                try{
                    Class<?> type=Class.forName("androidx.recyclerview.widget.RecyclerView$l",false,list.getContext().getClassLoader());
                    list.getClass().getMethod("a0",type).invoke(list,decoration);
                }catch(ReflectiveOperationException | RuntimeException ignored){
                }
            }
        }
        private void dividers(View view){
            if(!(view instanceof ViewGroup))return;
            ViewGroup group=(ViewGroup)view;
            for(int index=0;index<group.getChildCount();index++){
                View child=group.getChildAt(index);
                if(child.getClass()==View.class && child.getLayoutParams().height>=0 && child.getLayoutParams().height<=dp(child,1))child.setVisibility(View.GONE);
                else if(!(child instanceof ImageView))dividers(child);
            }
        }
    }
    /** Rounded surfaces behind runs of list rows, redrawn only when their bounds change. */
    static final class Groups extends Drawable {
        final android.graphics.Paint paint=new android.graphics.Paint(android.graphics.Paint.ANTI_ALIAS_FLAG);
        final android.graphics.RectF box=new android.graphics.RectF();
        final float[] bounds=new float[32],scratch=new float[32];
        final float inset,radius;
        int count;
        Groups(View view){inset=dp(view,12);radius=dp(view,24);paint.setColor(MaterialYouTweaks.color(view.getContext(),"colorSurfaceContainerHigh",android.R.attr.colorBackground));}
        void collect(ViewGroup rows,java.util.function.Predicate<View> member){
            if(rows.getBackground()!=this)rows.setBackground(this);
            int found=0;boolean open=false;float top=0,bottom=0,reach=radius*2;
            for(int index=0;index<rows.getChildCount();index++){
                View row=rows.getChildAt(index);
                if(member.test(row)){
                    if(!open){open=true;top=index==0 && rows.canScrollVertically(-1) ? -reach:row.getTop();}
                    bottom=row.getBottom();
                }else if(open){open=false;if(found<scratch.length){scratch[found++]=top;scratch[found++]=bottom;}}
            }
            if(open && found<scratch.length){scratch[found++]=top;scratch[found++]=rows.canScrollVertically(1) ? rows.getHeight()+reach:bottom;}
            boolean same=found==count;
            for(int index=0;same && index<found;index++)same=bounds[index]==scratch[index];
            if(same)return;
            System.arraycopy(scratch,0,bounds,0,found);count=found;invalidateSelf();
        }
        @Override public void draw(android.graphics.Canvas canvas){
            for(int index=0;index+1<count;index+=2){box.set(inset,bounds[index],getBounds().width()-inset,bounds[index+1]);canvas.drawRoundRect(box,radius,radius,paint);}
        }
        @Override public void setAlpha(int alpha){} @Override public void setColorFilter(android.graphics.ColorFilter filter){}
        @Override public int getOpacity(){return android.graphics.PixelFormat.TRANSLUCENT;}
    }
    /** Material 3 modal drawer surface; the library keeps its items, state and listeners. */
    static final class Drawer {
        final WeakReference<View> slider;
        final int banner,list;
        Groups groups;
        static java.lang.reflect.Method circleColor,setCircleColor;
        Drawer(View view){
            slider=new WeakReference<>(view);Context context=view.getContext();
            banner=view.getResources().getIdentifier("material_drawer_account_header_background","id",context.getPackageName());
            list=view.getResources().getIdentifier("material_drawer_recycler_view","id",context.getPackageName());
            view.setBackgroundColor(MaterialYouTweaks.color(context,"colorSurfaceContainerLow",android.R.attr.colorBackground));
            int radius=dp(view,16);
            view.setOutlineProvider(new android.view.ViewOutlineProvider(){@Override public void getOutline(View target,android.graphics.Outline outline){
                boolean rtl=target.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL;outline.setRoundRect(rtl ? 0:-radius,0,target.getWidth()+(rtl ? radius:0),target.getHeight(),radius);}});
            view.setClipToOutline(true);
            // The surface reaches the screen edges, so the library's darker system-bar bands go.
            try{
                view.getClass().getMethod("setTintStatusBar",boolean.class).invoke(view,false);
                view.getClass().getMethod("setTintNavigationBar",boolean.class).invoke(view,false);
                view.getClass().getMethod("setInsetForeground",Drawable.class).invoke(view,(Object)null);
                view.invalidate();
            }catch(ReflectiveOperationException | RuntimeException error){
            }
        }
        void update(){
            View view=slider.get();if(view==null || !view.isShown())return;
            View image=banner==0 ? null:view.findViewById(banner);if(image!=null && image.getVisibility()!=View.INVISIBLE)image.setVisibility(View.INVISIBLE);
            View rows=list==0 ? null:view.findViewById(list);if(!(rows instanceof ViewGroup))return;ViewGroup group=(ViewGroup)rows;
            for(int index=0;index<group.getChildCount();index++){View row=group.getChildAt(index);if(!(row instanceof ViewGroup))continue;ViewGroup parts=(ViewGroup)row;
                // Only the account header row carries this anonymous full-width rule.
                for(int part=0;part<parts.getChildCount();part++){
                    View child=parts.getChildAt(part);
                    if(child.getClass()==View.class && child.getId()==View.NO_ID && child.getVisibility()!=View.GONE && child.getLayoutParams().height>=0 && child.getLayoutParams().height<=dp(child,2))child.setVisibility(View.GONE);
                }
            }
            if(group.isVerticalScrollBarEnabled())group.setVerticalScrollBarEnabled(false);
            arrange(group);
        }
        /** Each run of menu rows sits on one rounded surface; rows and their selection stay native. */
        private void arrange(ViewGroup rows){
            if(groups==null)groups=new Groups(rows);
            groups.collect(rows,row->{
                View icon=SurfaceAppearanceTweaks.find(row,"material_drawer_icon");
                if(icon==null || SurfaceAppearanceTweaks.find(row,"material_drawer_name")==null)return false;
                tone(icon);return true;
            });
        }
        /** Boost paints built-in destinations in fixed colours. Community icons are bitmaps and stay as they are. */
        private void tone(View icon){
            if(!(icon instanceof ImageView) || !icon.getClass().getName().endsWith("CircleImageView"))return;
            ImageView image=(ImageView)icon;Drawable picture=image.getDrawable();
            boolean builtIn=picture!=null && picture.getClass().getName().contains("Vector");
            if(!builtIn){if(image.getColorFilter()!=null)image.setColorFilter(null);return;}
            try{
                if(circleColor==null){circleColor=icon.getClass().getMethod("getCircleBackgroundColor");setCircleColor=icon.getClass().getMethod("setCircleBackgroundColor",int.class);}
                Context context=icon.getContext();int container=MaterialYouTweaks.color(context,"colorSecondaryContainer",android.R.attr.colorBackground);
                if((Integer)circleColor.invoke(icon)!=container)setCircleColor.invoke(icon,container);
                if(image.getColorFilter()==null)image.setColorFilter(new android.graphics.PorterDuffColorFilter(MaterialYouTweaks.color(context,"colorOnSecondaryContainer",android.R.attr.textColorPrimary),android.graphics.PorterDuff.Mode.SRC_IN));
            }catch(ReflectiveOperationException | RuntimeException error){}
        }
        /** 0 when closed, 1 when fully open. */
        float open(){View view=slider.get();return view==null || view.getWidth()==0 ? 0:Math.max(0,Math.min(1,view.getRight()/(float)view.getWidth()));}
    }
    /** Draw behind the native Material FAB: its listeners, icon and menu animation remain native. */
    static final class Corner {
        final WeakReference<View> button,menu;
        final Drawable original;
        final FeedPillBlur blur;
        final CircleGlass glass;
        boolean running;
        Corner(View root,View menu,View button,boolean enabled){
            this.menu=new WeakReference<>(menu);this.button=new WeakReference<>(button);original=menu.getBackground();
            View source=SurfaceAppearanceTweaks.find(root,"recyclerview");if(source==null)source=SurfaceAppearanceTweaks.find(root,"fragment_container");
            FeedPillBlur renderer=null;
            try{
                Object shape=button.getClass().getMethod("getShapeAppearanceModel").invoke(button);
                Object half=shape.getClass().getField("m").get(null);
                shape=shape.getClass().getMethod("e",half.getClass()).invoke(shape,half);
                button.getClass().getMethod("setShapeAppearanceModel",shape.getClass()).invoke(button,shape);
                if(android.os.Build.VERSION.SDK_INT>=31 && enabled && source!=null)renderer=new FeedPillBlur(source,button,SurfaceAppearanceTweaks.role(button.getContext(),false));
                int color=renderer==null ? MaterialYouTweaks.color(button.getContext(),"colorSecondaryContainer",android.R.attr.colorAccent):android.graphics.Color.TRANSPARENT;
                button.getClass().getMethod("setBackgroundTintList",android.content.res.ColorStateList.class).invoke(button,android.content.res.ColorStateList.valueOf(color));
            }catch(ReflectiveOperationException | RuntimeException error){}
            blur=renderer;glass=blur==null ? null:new CircleGlass(button,blur);if(glass!=null)menu.setBackground(glass);
        }
        void start(){if(blur!=null && !running){running=true;blur.start();}}
        void stop(){running=false;if(blur!=null)blur.stop();}
        void freeze(){running=false;if(blur!=null)blur.freeze();}
        void dispose(){stop();View view=menu.get();if(view!=null && view.getBackground()==glass)view.setBackground(original);}
    }
    private static final class CircleGlass extends Drawable implements Drawable.Callback {
        final WeakReference<View> button;final FeedPillBlur blur;
        CircleGlass(View button,FeedPillBlur blur){this.button=new WeakReference<>(button);this.blur=blur;blur.setCallback(this);}
        @Override public void draw(android.graphics.Canvas canvas){
            View view=button.get();
            if(view==null || view.getVisibility()!=View.VISIBLE)return;
            int insetX=Math.max(0,(view.getWidth()-Math.round(56*view.getResources().getDisplayMetrics().density))/2),insetY=Math.max(0,(view.getHeight()-Math.round(56*view.getResources().getDisplayMetrics().density))/2);
            int saved=canvas.save();
            canvas.translate(view.getX()+insetX,view.getY()+insetY);
            canvas.scale(view.getScaleX(),view.getScaleY(),(view.getWidth()-2*insetX)/2f,(view.getHeight()-2*insetY)/2f);
            blur.setBounds(0,0,view.getWidth()-2*insetX,view.getHeight()-2*insetY);
            blur.setAlpha(Math.round(255*view.getAlpha()));
            blur.draw(canvas);
            canvas.restoreToCount(saved);
        }
        @Override public void setAlpha(int alpha){
        }
        @Override public void setColorFilter(android.graphics.ColorFilter filter){
        }
        @Override public int getOpacity(){
            return android.graphics.PixelFormat.TRANSLUCENT;
        }
        @Override public void invalidateDrawable(Drawable who){invalidateSelf();}
        @Override public void scheduleDrawable(Drawable who,Runnable what,long when){scheduleSelf(what,when);}
        @Override public void unscheduleDrawable(Drawable who,Runnable what){unscheduleSelf(what);}
    }
    /** Transparent media top chrome; retain native side/bottom safety and controls. */
    static final class MediaTop {
        final WeakReference<View> content,body,toolbar;
        MediaTop(View decor){
            View content=decor.findViewById(android.R.id.content);
            this.content=new WeakReference<>(content);
            View body=content instanceof ViewGroup && ((ViewGroup)content).getChildCount()>0 ? ((ViewGroup)content).getChildAt(0):null;
            this.body=new WeakReference<>(body);
            View tools=body==null ? null:SurfaceAppearanceTweaks.find(body,"toolbar");
            if(tools==null && body!=null)tools=SurfaceAppearanceTweaks.find(body,"my_awesome_toolbar");
            toolbar=new WeakReference<>(tools);
        }
        void update(){clearTop(content.get());clearTop(body.get());View tools=toolbar.get();if(tools!=null && tools.getBackground()!=null)tools.setBackground(null);
        }
        private static void clearTop(View view){
            if(view!=null){
                if(view.getFitsSystemWindows())view.setFitsSystemWindows(false);
                if(view.getPaddingTop()!=0)view.setPadding(view.getPaddingLeft(),0,view.getPaddingRight(),view.getPaddingBottom());
            }
        }
        void dispose(){content.clear();body.clear();toolbar.clear();}
    }
}
