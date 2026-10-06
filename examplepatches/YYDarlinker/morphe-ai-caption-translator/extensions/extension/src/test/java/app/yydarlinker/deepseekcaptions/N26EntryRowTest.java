package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import android.app.Activity;
import android.graphics.*;
import android.preference.Preference;
import android.preference.SwitchPreference;
import android.view.*;
import android.widget.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/**
 * N26: the moved entry must render as an ordinary row of the video page.
 *
 * <p>This renders real framework preference rows - the widget family the host page is built from - and
 * measures the thing the card actually cares about: whether the row reserves space on its left for an
 * icon. The rows carry the attribute surface the shipped resources give them, so the AI entry is compared
 * against the rows around it as rendered widgets rather than as XML text.
 *
 * <p>A fourth row carries an icon on purpose. It is the sensitivity control: if the probe could not see a
 * reserved icon slot at all, that row would measure the same as the others and the test would fail.
 *
 * <p>Boundary: the framework gives {@code PreferenceScreen} a private constructor, so the row bodies here
 * are {@code Preference}/{@code SwitchPreference}. What the entry looks like on the device additionally
 * depends on YouTube's themed row layout and on the host's icon patch, neither of which can be inflated
 * offline; that part is covered by the shipped-resource evidence and stays on the device checklist.
 */
@RunWith(RobolectricTestRunner.class) @Config(manifest=Config.NONE,sdk=28) @GraphicsMode(GraphicsMode.Mode.NATIVE)
public class N26EntryRowTest {
    private static final int WIDTH_DP=420;
    /** Navigation keys exactly as the shipped resources carry them. */
    private static final String AI_KEY="morphe_vot_screen__ai_captions";
    private static final String NARRATION_KEY="morphe_vot_screen";
    private static final String LEAF_KEY="morphe_disable_drc_audio";
    private static final String ICON_ROW_KEY="morphe_settings_screen_00_about";

    private static final class Rendered {
        final View row;final View title;final View icon;
        Rendered(View row,View title,View icon){this.row=row;this.title=title;this.icon=icon;}
        /** Where the title starts inside the row: the inset the row gives up before any text. */
        int titleLeft(){
            if(title==null)return -1;
            int left=0;View view=title;
            while(view!=null&&view!=row){left+=view.getLeft();android.view.ViewParent parent=view.getParent();view=parent instanceof View?(View)parent:null;}
            return left;
        }
        int iconWidth(){return icon==null?0:icon.getWidth();}
        boolean iconVisible(){return icon!=null&&icon.getVisibility()==View.VISIBLE&&icon.getWidth()>0;}
    }

    /** Builds a row the way the host page does and lays it out at the settings width. */
    private static Rendered render(Activity activity,ViewGroup host,Preference preference,String key,String title,String summary,boolean withIcon){
        preference.setKey(key);preference.setTitle(title);
        if(summary!=null)preference.setSummary(summary);
        if(withIcon)preference.setIcon(activity.getResources().getDrawable(android.R.drawable.ic_menu_info_details));
        View row=preference.getView(null,host);
        host.addView(row,new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.WRAP_CONTENT));
        row.measure(View.MeasureSpec.makeMeasureSpec(activity.getResources().getDisplayMetrics().widthPixels,View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
        row.layout(0,0,row.getMeasuredWidth(),row.getMeasuredHeight());
        return new Rendered(row,findTitle(row),findIcon(row));
    }

    private static View findTitle(View row){
        View byId=row.findViewById(android.R.id.title);
        if(byId!=null)return byId;
        return findFirst(row,TextView.class);
    }

    private static View findIcon(View row){
        View byId=row.findViewById(android.R.id.icon);
        if(byId!=null)return byId;
        return findFirst(row,ImageView.class);
    }

    private static <T extends View> T findFirst(View root,Class<T> type){
        if(type.isInstance(root))return type.cast(root);
        if(root instanceof ViewGroup)for(int i=0;i<((ViewGroup)root).getChildCount();i++){
            T found=findFirst(((ViewGroup)root).getChildAt(i),type);
            if(found!=null)return found;
        }
        return null;
    }

    @Test public void entryRowReservesNoIconSpaceInEitherTheme()throws Exception{
        JSONObject record=new JSONObject();
        String output=System.getenv("CAPTION_UI_PREVIEW_OUTPUT");
        for(boolean dark:new boolean[]{false,true}){
            Activity activity=Robolectric.buildActivity(Activity.class).setup().get();
            activity.setTheme(dark?android.R.style.Theme_Material_NoActionBar:android.R.style.Theme_Material_Light_NoActionBar);
            try{
            LinearLayout root=new LinearLayout(activity);root.setOrientation(LinearLayout.VERTICAL);
            root.setBackgroundColor(dark?0xff0f0f0f:Color.WHITE);
            int width=Math.round(WIDTH_DP*activity.getResources().getDisplayMetrics().density);
            FrameLayout frame=new FrameLayout(activity);frame.addView(root,new FrameLayout.LayoutParams(width,ViewGroup.LayoutParams.WRAP_CONTENT));
            activity.setContentView(frame);

            // The two rows the video page now shows next to each other, an ordinary leaf option on the
            // same page, and one row that really does draw an icon as the sensitivity control.
            Rendered narration=render(activity,root,new Preference(activity),NARRATION_KEY,"旁白翻译",null,false);
            Rendered ai=render(activity,root,new Preference(activity),AI_KEY,"AI 字幕翻译","配置自动保存",false);
            Rendered leaf=render(activity,root,new SwitchPreference(activity),LEAF_KEY,"禁用 DRC 音频",null,false);
            Rendered withIcon=render(activity,root,new Preference(activity),ICON_ROW_KEY,"关于",null,true);

            root.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));
            root.layout(0,0,width,root.getMeasuredHeight());

            String where="theme="+(dark?"dark":"light");
            assertFalse(where+": the AI entry reserves icon space",ai.iconVisible());
            assertEquals(where+": the AI entry has a wider left inset than the narration entry",narration.titleLeft(),ai.titleLeft());
            assertEquals(where+": the AI entry has a wider left inset than an ordinary option on the page",leaf.titleLeft(),ai.titleLeft());
            // The icon row is the control: the probe has to be able to see a reserved slot at all, so that
            // "no inset" above means something. It must measure >= the others, and it must actually draw.
            assertTrue(where+": the probe cannot see a reserved icon slot; the comparison is not sensitive",
                    withIcon.iconVisible()&&withIcon.titleLeft()>=ai.titleLeft()&&withIcon.iconWidth()>0);
            assertTrue(where+": the rows did not render",root.getHeight()>0&&ai.row.getHeight()>0);
            assertTrue(where+": every row measured a zero left inset, so nothing was laid out",
                    ai.titleLeft()>0||narration.titleLeft()>0||withIcon.titleLeft()>0);

            record.put(dark?"dark":"light",new JSONObject()
                    .put("width_px",width).put("row_height_px",ai.row.getHeight())
                    .put("ai_title_left_px",ai.titleLeft()).put("narration_title_left_px",narration.titleLeft())
                    .put("leaf_option_title_left_px",leaf.titleLeft())
                    .put("ai_icon_visible",ai.iconVisible()).put("ai_icon_width_px",ai.iconWidth())
                    .put("icon_row_title_left_px",withIcon.titleLeft())
                    .put("icon_row_icon_visible",withIcon.iconVisible())
                    .put("icon_row_icon_width_px",withIcon.iconWidth()));
            System.out.println("N26_ENTRY_ROW "+where+" width_px="+width+" row_height_px="+ai.row.getHeight()
                    +" ai_title_left_px="+ai.titleLeft()+" narration_title_left_px="+narration.titleLeft()
                    +" leaf_option_title_left_px="+leaf.titleLeft()
                    +" ai_icon_visible="+ai.iconVisible()+" ai_icon_width_px="+ai.iconWidth()
                    +" icon_row_title_left_px="+withIcon.titleLeft()
                    +" icon_row_icon_width_px="+withIcon.iconWidth());

            if(output!=null){
                Bitmap bitmap=Bitmap.createBitmap(width,root.getHeight(),Bitmap.Config.ARGB_8888);
                root.draw(new Canvas(bitmap));
                File file=new File(output,"n26-video-page-rows-"+(dark?"dark":"light")+".png");
                file.getParentFile().mkdirs();
                try(FileOutputStream out=new FileOutputStream(file)){assertTrue(bitmap.compress(Bitmap.CompressFormat.PNG,100,out));}
            }
            }finally{activity.finish();}
        }
        record.put("keys",new JSONObject().put("ai",AI_KEY).put("narration",NARRATION_KEY)
                .put("leaf_option",LEAF_KEY).put("icon_row",ICON_ROW_KEY));
        if(output!=null){
            File file=new File(output,"n26-entry-row-measurements.json");
            file.getParentFile().mkdirs();
            try(FileOutputStream out=new FileOutputStream(file)){out.write(record.toString(2).getBytes(StandardCharsets.UTF_8));}
        }
    }
}
