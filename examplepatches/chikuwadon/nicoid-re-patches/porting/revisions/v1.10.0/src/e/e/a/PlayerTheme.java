package e.e.a;
import android.view.View;
/** Theme player information surfaces without recoloring the video overlay. */
public final class PlayerTheme {
    private PlayerTheme() {}
    private static final java.util.WeakHashMap<View,android.graphics.drawable.Drawable> DETAILS=new java.util.WeakHashMap<>();
    static void detailItem(View view){if(view==null||!ThemeChoice.isNight(view.getContext()))return;if(DETAILS.get(view)==view.getBackground()&&view.getBackground()!=null)return;android.content.Context c=view.getContext();int id=c.getResources().getIdentifier("nicoid_detail_item_dark","color",c.getPackageName());int color=id==0?0xff292b31:c.getResources().getColor(id);android.graphics.drawable.Drawable bg=new android.graphics.drawable.RippleDrawable(android.content.res.ColorStateList.valueOf((UiDialogs.accent(c)&0xffffff)|0x22000000),new android.graphics.drawable.ColorDrawable(color),null);view.setBackgroundTintList(null);view.setBackground(bg);DETAILS.put(view,bg);}
    static final java.util.Map<View,Boolean> TAG_MODE=new java.util.WeakHashMap<>();
    static void tagItem(View item,boolean last){android.content.Context c=item.getContext();boolean dark=ThemeChoice.isNight(c);boolean fresh=!TAG_MODE.containsKey(item)||TAG_MODE.get(item)!=dark||DETAILS.get(item)!=item.getBackground();if(fresh){String name=dark?"nicoid_tag_item_dark":"nicoid_tag_item_light";int id=c.getResources().getIdentifier(name,"color",c.getPackageName());int color=id==0?(dark?0xff24262b:0xfff0f0f0):c.getResources().getColor(id);android.graphics.drawable.Drawable bg=new android.graphics.drawable.RippleDrawable(android.content.res.ColorStateList.valueOf((UiDialogs.accent(c)&0xffffff)|0x33000000),new android.graphics.drawable.ColorDrawable(color),null);FlatUi191.replaceBackground(item,bg);DETAILS.put(item,bg);TAG_MODE.put(item,dark);}FlatUi191.tagDepth(item);tagGap(item,last?0:PanelUi.dp(c,4));}
    private static void tagGap(View view,int bottom){android.view.ViewGroup.LayoutParams p=view.getLayoutParams();if(p instanceof android.view.ViewGroup.MarginLayoutParams){android.view.ViewGroup.MarginLayoutParams margin=(android.view.ViewGroup.MarginLayoutParams)p;if(margin.bottomMargin!=bottom){margin.bottomMargin=bottom;view.setLayoutParams(margin);}}}
    static void tagRows(android.view.ViewGroup group){if(group.getBackground()!=null){android.graphics.drawable.Drawable bg=group.getBackground();if(!(bg instanceof android.graphics.drawable.ColorDrawable)||((android.graphics.drawable.ColorDrawable)bg).getColor()!=android.graphics.Color.TRANSPARENT)group.setBackgroundColor(android.graphics.Color.TRANSPARENT);}for(int n=0;n<group.getChildCount();n++){View child=group.getChildAt(n);if(child instanceof android.widget.Button||child instanceof android.widget.TextView)tagItem(child,n==group.getChildCount()-1);else if(child instanceof android.view.ViewGroup)tagRows((android.view.ViewGroup)child);}}
    public static void detailRows(View root){if(root==null)return;android.content.Context c=root.getContext();int user=c.getResources().getIdentifier("userinfo","id",c.getPackageName()),tags=c.getResources().getIdentifier("taglist","id",c.getPackageName());if(user!=0)detailItem(root.findViewById(user));View list=tags==0?null:root.findViewById(tags);if(list instanceof android.view.ViewGroup)tagRows((android.view.ViewGroup)list);}
    public static void information(View root) {
        if(root==null)return;
        if("nicoid_short_metadata".equals(root.getTag())){root.setBackgroundColor(android.graphics.Color.TRANSPARENT);return;}
        ThemeChoice.background(root);UiTheme191.surface(root);
        android.content.Context c=root.getContext();
        for(String name:new String[]{"info","tabinfo","scrollView1","userinfo"}) {
            int id=c.getResources().getIdentifier(name,"id",c.getPackageName());
            View view=id==0?null:root.findViewById(id);
            if(view!=null){ThemeChoice.background(view);ThemeChoice.tree(view);}
        }
        View description=root.findViewById(0x7f08007a);
        if(description!=null&&description.getParent() instanceof View){View parent=(View)description.getParent();ThemeChoice.background(parent);ThemeChoice.tree(parent);}
    }
    public static void apply(View root) {
        ThemeChoice.background(root);
        android.content.Context c=root.getContext();
        for(String name:new String[]{"info","tabinfo","pager_title_strip","pager","scrollView1","loadstatuslay","videoinfotitlelay","videomenulist","infoscroll"}) {
            int id=c.getResources().getIdentifier(name,"id",c.getPackageName());
            View view=id==0?null:root.findViewById(id);
            if(view!=null) {
                ThemeChoice.background(view);if(!name.equals("pager"))UiTheme191.surface(view);
                if(name.equals("pager_title_strip"))try {
                    view.getClass().getMethod("setTextColor",int.class).invoke(view,ThemeChoice.textColor(view));
                }catch(Exception ignored){}
            }
        }
    }
}
