package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.os.Looper;
import android.view.*;
import android.widget.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class) @Config(sdk=28)
public class SettingsListLifecycleTest {
    @Test public void realListRecyclesMultipleEditorsWithoutLosingFocusOnKeyboardResize(){
        Activity a=Robolectric.buildActivity(Activity.class).setup().visible().get();
        try {
            ListView list=new ListView(a);list.setItemsCanFocus(true);
            DeepSeekTextPreference address=new DeepSeekTextPreference(a);address.setKey(DeepSeekTextPreference.KEY_BASE_URL);
            ApiKeyPreference key=new ApiKeyPreference(a);key.setKey(DeepSeekTextPreference.KEY_API_KEY);
            DeepSeekTextPreference prompt=new DeepSeekTextPreference(a);prompt.setKey(DeepSeekTextPreference.KEY_PROMPT);
            DeepSeekModelPreference model=new DeepSeekModelPreference(a);model.setKey(DeepSeekModelPreference.KEY_MODEL);
            android.preference.Preference[] rows={address,key,model,prompt};
            BaseAdapter adapter=new BaseAdapter(){
                public int getCount(){return rows.length;}
                public Object getItem(int p){return rows[p];}
                public long getItemId(int p){return p;}
                public View getView(int p,View old,ViewGroup parent){return rows[p].getView(old,parent);}
            };
            list.setAdapter(adapter);a.setContentView(list);
            list.measure(View.MeasureSpec.makeMeasureSpec(600,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(1000,View.MeasureSpec.EXACTLY));
            list.layout(0,0,600,1000);Shadows.shadowOf(Looper.getMainLooper()).idle();
            View row=address.getView(null,list);EditText editor=row.findViewById(android.R.id.edit);editor.requestFocus();
            for(int height:new int[]{600,900,500,1000}){
                adapter.notifyDataSetChanged();
                list.measure(View.MeasureSpec.makeMeasureSpec(600,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(height,View.MeasureSpec.EXACTLY));
                list.layout(0,0,600,height);Shadows.shadowOf(Looper.getMainLooper()).idle();
                assertSame(editor,address.getView(null,list).findViewById(android.R.id.edit));
                assertTrue(editor.hasFocus());
            }
            list.setSelection(3);Shadows.shadowOf(Looper.getMainLooper()).idle();
            list.setSelection(0);Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertEquals(DeepSeekConfig.DEFAULT_BASE_URL,((EditText)address.getView(null,list).findViewById(android.R.id.edit)).getText().toString());
        } finally {a.finish();}
    }
}
