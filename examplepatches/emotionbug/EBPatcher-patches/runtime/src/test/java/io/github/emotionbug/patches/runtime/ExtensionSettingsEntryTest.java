package io.github.emotionbug.patches.runtime;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 29)
public final class ExtensionSettingsEntryTest {
    @Test public void unavailableOptionalRowDoesNotEscapeIntoSettings() {
        Context app=RuntimeEnvironment.getApplication();
        View absent=ExtensionSettingsEntry.createRow(app);
        assertEquals(View.GONE,absent.getVisibility());
        assertFalse(absent.hasOnClickListeners());
        ExtensionSettingsEntry.install(null);
        ExtensionSettingsEntry.install(new Object());
    }

    @Test public void nativeBindingKeepsNavigationAndBadgeWithoutAttachingOrDuplicatingRows() {
        Context app=RuntimeEnvironment.getApplication();
        int[] ids={0x7f0a0424,0x7f0a07c8,0x7f0a053d,0x7f0a03ec,0x7f0a0773,0x7f0a0718,
                0x7f0a0695,0x7f0a068f,0x7f0a0777,0x7f0a01d6,0x7f0a029e,0x7f0d01ca,0x7f08050a};
        String[] names={"item_layout","title","next_icon","icon","subtitle","setting_value",
                "right_status_icon","right_button","switch_button","category_divider","divide_line",
                "settings_common_normal_row","icn_new_circle_fill"};
        Map<Integer,String> resourcesById=new HashMap<>();
        for(int i=0;i<ids.length;i++) resourcesById.put(ids[i],names[i]);
        Resources resources=new Resources(app.getAssets(),app.getResources().getDisplayMetrics(),app.getResources().getConfiguration()) {
            @Override public String getResourceEntryName(int id) {
                String name=resourcesById.get(id);
                if(name==null) throw new NotFoundException();
                return name;
            }
        };
        Context context=new ContextWrapper(app) {
            @Override public Resources getResources() {return resources;}
            @Override public Object getSystemService(String name) {
                return LAYOUT_INFLATER_SERVICE.equals(name)?new RowInflater(this):super.getSystemService(name);
            }
        };
        FrameLayout parent=new FrameLayout(context);
        AtomicInteger clicks=new AtomicInteger();
        ExtensionSettingsEntry.NativeRow row=ExtensionSettingsEntry.nativeRow(context,parent,"EBPatcher settings",clicks::incrementAndGet);
        assertEquals(0,parent.getChildCount());
        View item=row.view.findViewById(0x7f0a0424);
        assertTrue(item.isEnabled());assertTrue(item.isFocusable());
        assertEquals("EBPatcher settings",((TextView)row.view.findViewById(0x7f0a07c8)).getText().toString());
        assertEquals(View.VISIBLE,row.view.findViewById(0x7f0a053d).getVisibility());
        assertEquals(View.VISIBLE,row.view.findViewById(0x7f0a029e).getVisibility());
        for(int i=3;i<=9;i++) assertEquals(View.GONE,row.view.findViewById(ids[i]).getVisibility());
        assertTrue(item.performClick());assertEquals(1,clicks.get());
        parent.addView(row.view);
        row.badge(false);row.badge(false);
        assertEquals(1,parent.getChildCount());
        assertTrue(item.performClick());assertEquals(2,clicks.get());
    }

    // Actual framework widgets exercise binding; the private-APK resource test independently
    // checks the shipped XML hierarchy and resource IDs used to inflate this same row.
    private static final class RowInflater extends LayoutInflater {
        RowInflater(Context context) {super(context);}
        @Override public LayoutInflater cloneInContext(Context context) {return new RowInflater(context);}
        @Override public View inflate(int resource,ViewGroup parent,boolean attach) {
            assertEquals(0x7f0d01ca,resource);assertFalse(attach);
            FrameLayout row=new FrameLayout(getContext()),item=new FrameLayout(getContext());
            item.setId(0x7f0a0424);row.addView(item);
            TextView title=new TextView(getContext());title.setId(0x7f0a07c8);item.addView(title);
            ImageView chevron=new ImageView(getContext());chevron.setId(0x7f0a053d);item.addView(chevron);
            int[] other={0x7f0a03ec,0x7f0a0773,0x7f0a0718,0x7f0a0695,0x7f0a068f,0x7f0a0777,0x7f0a01d6,0x7f0a029e};
            for(int id:other) {View child=new View(getContext());child.setId(id);row.addView(child);}
            return row;
        }
    }

    @Test public void badgeUsesMappedNativeIconAndRetainsEnglishAccessibilityLabel() {
        Context app=RuntimeEnvironment.getApplication();
        Resources resources=new Resources(app.getAssets(),app.getResources().getDisplayMetrics(),app.getResources().getConfiguration()) {
            @Override public Drawable getDrawable(int id,Theme theme) {
                if(id==0x7f08050a) return new ColorDrawable(Color.RED);
                return super.getDrawable(id,theme);
            }
        };
        Context context=new ContextWrapper(app) {
            @Override public Resources getResources() {return resources;}
        };
        FrameLayout root=new FrameLayout(context),item=new FrameLayout(context);
        TextView title=new TextView(context);
        root.addView(item);item.addView(title);
        ExtensionSettingsEntry.NativeRow row=new ExtensionSettingsEntry.NativeRow(root,item,title,"EBPatcher settings");
        row.badge(true);
        Drawable[] drawables=title.getCompoundDrawables();
        assertNull(drawables[0]);assertNull(drawables[1]);assertNull(drawables[3]);assertNotNull(drawables[2]);
        int size=(int)(20*resources.getDisplayMetrics().density);
        assertEquals(size,drawables[2].getBounds().width());assertEquals(size,drawables[2].getBounds().height());
        assertEquals("EBPatcher settings. New models available",title.getContentDescription());
        assertEquals(title.getContentDescription(),item.getContentDescription());
        row.badge(false);
        assertNull(title.getCompoundDrawables()[2]);
        assertEquals("EBPatcher settings",title.getContentDescription());
        assertEquals(title.getContentDescription(),item.getContentDescription());
    }
}
