package app.yydarlinker.deepseekcaptions;
import android.app.Activity;import android.graphics.drawable.Drawable;import android.view.View;import android.widget.*;
import org.junit.*;import org.junit.runner.RunWith;import org.robolectric.*;import org.robolectric.annotation.*;import static org.junit.Assert.*;
/** Models the inspected official inflater index contract; not a real-device screenshot. */
@RunWith(RobolectricTestRunner.class) @Config(sdk=28,shadows={CaptionMenuLayout121Test.Flags.class,CaptionMenuLayout121Test.Menu.class})
public class CaptionMenuLayout121Test {
    static LinearLayout container;static boolean popup,shorts;
    @Implements(CaptionAddonSupport.class) public static class Flags {@Implementation public static boolean aiInstalled(){return true;}}
    @Implements(CaptionQuickToggle.class) public static class Menu {
        @Implementation public static boolean topMenu(){return !shorts;}
        @Implementation public static boolean shortsOpen(){return shorts;}
        @Implementation public static LinearLayout nativeContainer(Object panel){return container;}
        @Implementation public static int addNativeRow(Object panel,Drawable icon,String text,View.OnClickListener click,int index){
            TextView row=new TextView(container.getContext());row.setText(text);row.setOnClickListener(click);
            LinearLayout.LayoutParams lp=new LinearLayout.LayoutParams(-1,48);if(index==0&&!popup)lp.topMargin=24;
            container.addView(row,popup?index:index+1,lp);return index+1;
        }
    }
    @Test public void normalAndShortsShareOneDividerWithoutAnExtraGap(){
        Activity a=Robolectric.buildActivity(Activity.class).setup().get();CaptionAddonSupport.initialize(a);
        for(boolean isPopup:new boolean[]{false,true})for(boolean isShorts:new boolean[]{false,true})for(int originalRows:new int[]{0,3}){
            popup=isPopup;shorts=isShorts;container=new LinearLayout(a);container.setOrientation(1);
            if(!popup)container.addView(new ImageView(a),new LinearLayout.LayoutParams(-1,0));
            for(int i=0;i<originalRows;i++){LinearLayout.LayoutParams lp=new LinearLayout.LayoutParams(-1,48);if(i==0&&!popup)lp.topMargin=24;container.addView(new TextView(a),lp);}
            LinearLayout nativeList=new LinearLayout(a);nativeList.setOrientation(1);nativeList.setPadding(0,24,0,16);nativeList.addView(new TextView(a),new LinearLayout.LayoutParams(-1,48));container.addView(nativeList);
            if(shorts)CaptionQuickToggle.observeMenuPath("overflow_menu_item.e","yt_outline_closed_caption_".getBytes(java.nio.charset.StandardCharsets.US_ASCII));
            int next=CaptionQuickToggle.onMenu(new Object(),originalRows);assertEquals(originalRows+1,next);
            View divider=new View(a);container.addView(divider,popup?next:next+1,new LinearLayout.LayoutParams(-1,1));
            container.measure(View.MeasureSpec.makeMeasureSpec(400,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(1200,View.MeasureSpec.AT_MOST));container.layout(0,0,400,container.getMeasuredHeight());
            View ai=container.getChildAt((popup?0:1)+originalRows);assertTrue(ai instanceof TextView);
            assertEquals(ai.getBottom(),divider.getTop());assertEquals(divider.getBottom(),nativeList.getTop());assertEquals(0,nativeList.getChildAt(0).getTop());
            assertEquals((originalRows+2)*48+1+16+(popup?0:24),container.getHeight());
        }a.finish();
    }
}
