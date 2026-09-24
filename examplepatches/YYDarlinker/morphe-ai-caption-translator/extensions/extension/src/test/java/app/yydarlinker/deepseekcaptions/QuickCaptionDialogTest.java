package app.yydarlinker.deepseekcaptions;
import android.app.Activity;import android.view.View;import android.widget.LinearLayout;
import org.junit.*;import org.junit.runner.RunWith;import org.robolectric.*;import org.robolectric.annotation.*;import static org.junit.Assert.*;
@RunWith(RobolectricTestRunner.class) @Config(sdk=28)
public class QuickCaptionDialogTest {
    @Test public void nativeGapRemovesOnlyTopInsetAndPreservesRowSpacing(){
        Activity a=Robolectric.buildActivity(Activity.class).setup().get();
        LinearLayout menu=new LinearLayout(a);menu.setOrientation(1);menu.addView(new View(a));
        LinearLayout list=new LinearLayout(a);list.setPadding(12,24,13,16);
        LinearLayout.LayoutParams params=new LinearLayout.LayoutParams(-1,-2);params.topMargin=24;params.bottomMargin=8;menu.addView(list,params);
        View row=new View(a);row.setPadding(5,12,5,12);list.addView(row,new LinearLayout.LayoutParams(-1,48));
        CaptionQuickToggle.normalizeNativeGap(menu);CaptionQuickToggle.normalizeNativeGap(menu);
        assertEquals(0,list.getPaddingTop());assertEquals(0,params.topMargin);assertEquals(12,list.getPaddingLeft());assertEquals(16,list.getPaddingBottom());assertEquals(8,params.bottomMargin);
        assertEquals(12,row.getPaddingTop());assertEquals(48,row.getLayoutParams().height);a.finish();
    }
}
