package n34;

import android.app.*;
import android.content.*;
import android.content.res.Configuration;
import android.graphics.Rect;
import android.os.*;
import android.preference.*;
import android.view.*;
import android.widget.*;
import org.json.*;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.lang.reflect.*;

/** Real pointer events through original official debounced listeners, ART and WindowManager. */
@SuppressWarnings("deprecation")
public final class N34Instrumentation extends Instrumentation {
    private Bundle arguments;
    private N34Host host;
    private final JSONArray events = new JSONArray();
    private PreferenceScreen video, ai;
    private final List<String> toasts=Collections.synchronizedList(new ArrayList<>());
    @Override public void onCreate(Bundle arguments) { this.arguments = arguments; start(); }
    @Override public void onStart() {
        Bundle result = new Bundle();
        try {
            N34Host.callerLocale=arguments.getString("caller","zh-CN");N34Host.callerFontScale=Float.parseFloat(arguments.getString("fontScale","1.0"));N34Host.callerDark="true".equals(arguments.getString("dark"));
            getUiAutomation().setOnAccessibilityEventListener(event->{if(event.getEventType()==android.view.accessibility.AccessibilityEvent.TYPE_NOTIFICATION_STATE_CHANGED)for(CharSequence value:event.getText())toasts.add(String.valueOf(value));});
            Intent intent = new Intent(getTargetContext(), N34Host.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            intent.putExtra("locale", arguments.getString("locale", "ja"));
            intent.putExtra("dark", "true".equals(arguments.getString("dark")));
            intent.putExtra("scenario",arguments.getString("scenario","navigation"));
            host = (N34Host) startActivitySync(intent); waitForIdleSync();
            record("root", host.preferences.getPreferenceScreen().getKey());
            video = (PreferenceScreen) host.preferences.findPreference("morphe_settings_screen_12_video_sort_by_key");
            ai = (PreferenceScreen) host.preferences.findPreference("morphe_vot_screen__ai_captions");
            check(video != null && ai != null, "actual final Morphe video and AI screens");
            clickPreference(find(host.preferences.getView(),ListView.class), video.getKey());
            check(video.getDialog() != null && video.getDialog().isShowing(), "video screen actually visible");
            clickPreference(list(video.getDialog()), ai.getKey());
            check(ai.getDialog() != null && ai.getDialog().isShowing(), "AI screen actually visible");
            boolean observedDark=(Boolean)Class.forName("app.morphe.extension.shared.Utils").getMethod("isDarkModeEnabled").invoke(null);
            int dialogColor=(Integer)Class.forName("app.morphe.extension.shared.theme.ThemeUtils").getMethod("getDialogBackgroundColor").invoke(null);
            check(observedDark==N34Host.callerDark,"real official theme matches requested night mode");
            check(N34Host.callerDark ? android.graphics.Color.red(dialogColor)<128 : android.graphics.Color.red(dialogColor)>=128,"observed dialog background brightness");
            record("observed_official_theme",new JSONObject().put("dark",observedDark).put("dialog_color",String.format(Locale.ROOT,"#%08X",dialogColor)).put("system_ui_mode",android.content.res.Resources.getSystem().getConfiguration().uiMode));
            ListView aiList = list(ai.getDialog());
            JSONObject titles = new JSONObject();
            snapshot(ai, titles);
            record("actual_preference_inventory", titles);
            clickPreference(aiList, "deepseek_caption_languages");
            Dialog picker = newestDialog(ai.getDialog());
            check(picker instanceof AlertDialog && picker.isShowing(), "picker attached to WMS after real row click");
            ListView languages = ((AlertDialog) picker).getListView();
            JSONArray labels = new JSONArray();
            for (int i = 0; i < languages.getAdapter().getCount(); i++) labels.put(String.valueOf(languages.getAdapter().getItem(i)));
            record("actual_picker_labels", labels);
            check(labels.length() == 14, "all language rows");
            capture("picker");
            tap(((AlertDialog) picker).getButton(DialogInterface.BUTTON_NEGATIVE));
            waitForIdleSync();
            check(!picker.isShowing() && ai.getDialog().isShowing(), "Cancel returns to AI screen");
            record("picker_cancel_return", true);
            String scenario=arguments.getString("scenario","navigation");
            if("parity".equals(scenario))parity();
            if("actions".equals(scenario))actions(aiList);
            if("matrix".equals(scenario))matrix(aiList);
            if("presentation".equals(scenario))presentation(aiList);
            if("extras".equals(scenario))extras(aiList);
            if("owned".equals(scenario))owned();
            record("actual_toasts",new JSONArray(toasts));
            writeEvidence("PASS");
            result.putString("result", "PASS");
            finish(Activity.RESULT_OK, result);
        } catch (Throwable error) {
            android.util.Log.e("N34", "REAL_UI_FAILURE", error);
            try { capture("failure-frame");record("failure", android.util.Log.getStackTraceString(error)); writeEvidence("FAIL"); } catch (Exception ignored) {}
            result.putString("failure", android.util.Log.getStackTraceString(error)); finish(Activity.RESULT_CANCELED, result);
        }
    }
    private void record(String name, Object value) throws Exception { events.put(new JSONObject().put("event", name).put("value", value).put("uptime_ms", SystemClock.uptimeMillis())); }
    private void check(boolean condition, String message) { if (!condition) throw new AssertionError(message); }
    private void snapshot(PreferenceGroup group, JSONObject rows) throws Exception {
        if(group.getKey()!=null)rows.put(group.getKey(), metadata(group));
        for (int i = 0; i < group.getPreferenceCount(); i++) {
            Preference child = group.getPreference(i);
            rows.put(child.getKey() == null ? group.getKey()+"/category/"+i : child.getKey(),metadata(child));
            if (child instanceof PreferenceGroup) snapshot((PreferenceGroup) child, rows);
        }
    }
    private JSONObject metadata(Preference preference)throws Exception{
        JSONObject value=new JSONObject().put("title",String.valueOf(preference.getTitle())).put("summary",String.valueOf(preference.getSummary())).put("class",preference.getClass().getName());
        for(String name:new String[]{"titleSlot","summarySlot"})for(Class<?> type=preference.getClass();type!=null;type=type.getSuperclass())try{Field slot=type.getDeclaredField(name);slot.setAccessible(true);Object key=slot.get(preference);if(key!=null)value.put(name,"cap_"+key);break;}catch(NoSuchFieldException absent){}
        return value;
    }
    private void clickPreference(ListView list, String key) throws Exception {
        int position = -1;
        for (int i = 0; i < list.getAdapter().getCount(); i++) {
            Object item = list.getAdapter().getItem(i);
            if (item instanceof Preference && key.equals(((Preference) item).getKey())) position = i;
        }
        check(position >= 0, "adapter contains " + key);
        final int selected = position;
        runOnMainSync(() -> list.setSelection(selected)); waitForIdleSync(); SystemClock.sleep(850);
        View row = list.getChildAt(position - list.getFirstVisiblePosition());
        check(row != null, "actual child row for " + key);
        record("pointer_target", new JSONObject().put("key",key).put("class",list.getAdapter().getItem(position).getClass().getName()).put("listener",list.getOnItemClickListener().getClass().getName()));
        tap(row); waitForIdleSync(); SystemClock.sleep(700);
    }
    private void tap(View view) {
        check(view != null && view.isShown(), "pointer target is shown");
        for(int attempt=0;attempt<20&&!view.hasWindowFocus();attempt++){SystemClock.sleep(100);waitForIdleSync();}
        int[] point = new int[2]; view.getLocationOnScreen(point);
        Rect visible=new Rect(),frame=new Rect();check(view.getGlobalVisibleRect(visible),"visible target rectangle");int[] rootLocation=new int[2];view.getRootView().getLocationOnScreen(rootLocation);visible.offset(rootLocation[0],rootLocation[1]);view.getWindowVisibleDisplayFrame(frame);visible.intersect(frame);
        float x = visible.centerX(), y = visible.top + Math.min(visible.height()/2f, 12*view.getResources().getDisplayMetrics().density);
        long now = SystemClock.uptimeMillis();
        android.util.Log.i("N34","REAL_POINTER x="+x+" y="+y+" focus="+view.hasWindowFocus()+" size="+view.getWidth()+"x"+view.getHeight());
        getUiAutomation().injectInputEvent(MotionEvent.obtain(now,now,MotionEvent.ACTION_DOWN,x,y,0),true);
        getUiAutomation().injectInputEvent(MotionEvent.obtain(now,now+80,MotionEvent.ACTION_UP,x,y,0),true);
        waitForIdleSync();
        SystemClock.sleep(250);waitForIdleSync();
    }
    private void capture(String name) throws Exception {
        File directory=new File(getTargetContext().getFilesDir(),"n34-evidence");directory.mkdirs();
        android.graphics.Bitmap bitmap=getUiAutomation().takeScreenshot();
        try(FileOutputStream output=new FileOutputStream(new File(directory,name+".png"))){check(bitmap!=null,"WMS screenshot");bitmap.compress(android.graphics.Bitmap.CompressFormat.PNG,100,output);}
        android.accessibilityservice.AccessibilityServiceInfo service=getUiAutomation().getServiceInfo();service.flags|=android.accessibilityservice.AccessibilityServiceInfo.FLAG_RETRIEVE_INTERACTIVE_WINDOWS;getUiAutomation().setServiceInfo(service);
        JSONArray windows=new JSONArray();for(android.view.accessibility.AccessibilityWindowInfo window:getUiAutomation().getWindows()){Rect bounds=new Rect();window.getBoundsInScreen(bounds);windows.put(new JSONObject().put("title",String.valueOf(window.getTitle())).put("active",window.isActive()).put("focused",window.isFocused()).put("bounds",bounds.toShortString()));}
        record("real_windows_"+name,windows);
    }
    private ListView list(Dialog dialog) { return find(dialog.getWindow().getDecorView(), ListView.class); }
    private <T> T find(View view, Class<T> type) {
        if (type.isInstance(view)) return type.cast(view);
        if (view instanceof ViewGroup) for (int i = 0; i < ((ViewGroup)view).getChildCount(); i++) { T child = find(((ViewGroup)view).getChildAt(i),type); if (child != null) return child; }
        return null;
    }
    private Dialog newestDialog(Dialog screen) throws Exception {
        // Read the actual window roots; this is evidence discovery in the test, never product binding.
        Class<?> global = Class.forName("android.view.WindowManagerGlobal");
        Object owner = global.getMethod("getInstance").invoke(null);
        java.lang.reflect.Field views = global.getDeclaredField("mViews"); views.setAccessible(true);
        List<?> roots = (List<?>) views.get(owner);
        for (int i = roots.size()-1; i >= 0; i--) {
            View root = (View) roots.get(i);
            if (root == screen.getWindow().getDecorView()) continue;
            Context context = root.getContext();
            while (context instanceof ContextWrapper) {
                if (context instanceof Activity) break;
                context = ((ContextWrapper) context).getBaseContext();
            }
            // Production row owns the real AlertDialog; reflection only observes it through the window callback.
            java.lang.reflect.Field window = root.getClass().getDeclaredField("mWindow");window.setAccessible(true);
            Object value = window.get(root);
            Object callback = ((Window)value).getCallback();
            if (callback instanceof Dialog&&((Dialog)callback).isShowing()) return (Dialog) callback;
        }
        throw new AssertionError("No real picker Window root");
    }
    private void writeEvidence(String status) throws Exception {
        File directory = new File(getTargetContext().getFilesDir(), "n34-evidence"); directory.mkdirs();
        JSONObject data = new JSONObject().put("status", status).put("sdk", Build.VERSION.SDK_INT).put("locale", arguments.getString("locale", "ja")).put("dark",arguments.getString("dark","false")).put("events", events);
        try (FileOutputStream output = new FileOutputStream(new File(directory,"ui.json"))) { output.write(data.toString(2).getBytes(StandardCharsets.UTF_8)); }
    }

    private static Class<?> production(String name)throws Exception{return Class.forName("app.yydarlinker.deepseekcaptions."+name);}
    private static Method method(Class<?> owner,String name,Class<?>...types)throws Exception{Method value=owner.getDeclaredMethod(name,types);value.setAccessible(true);return value;}
    private static Object field(Object owner,String name)throws Exception{Field value=owner.getClass().getDeclaredField(name);value.setAccessible(true);return value.get(owner);}
    private String text(String key)throws Exception{return(String)method(production("CaptionStrings"),"settings",Context.class,String.class).invoke(null,host,key);}
    private String expected(String key,String tag){Configuration config=new Configuration(host.getResources().getConfiguration());config.setLocale(Locale.forLanguageTag(tag));Context resources=host.createConfigurationContext(config);int id=host.getResources().getIdentifier("cap_"+key,"string",host.getPackageName());return resources.getString(id);}
    private View reveal(ListView list,String key)throws Exception{
        int position=-1;for(int i=0;i<list.getAdapter().getCount();i++){Object value=list.getAdapter().getItem(i);if(value instanceof Preference&&key.equals(((Preference)value).getKey()))position=i;}
        check(position>=0,"actual adapter key "+key);final int selected=position;runOnMainSync(()->list.setSelection(selected));waitForIdleSync();SystemClock.sleep(150);return list.getChildAt(position-list.getFirstVisiblePosition());
    }
    private TextView label(View view,String value){Button button=buttonLabel(view,value);return button!=null?button:plainLabel(view,value);}
    private Button buttonLabel(View view,String value){if(view instanceof Button&&value.contentEquals(((Button)view).getText()))return(Button)view;if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){Button result=buttonLabel(((ViewGroup)view).getChildAt(i),value);if(result!=null)return result;}return null;}
    private TextView plainLabel(View view,String value){if(view instanceof TextView&&value.contentEquals(((TextView)view).getText()))return(TextView)view;if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){TextView result=plainLabel(((ViewGroup)view).getChildAt(i),value);if(result!=null)return result;}return null;}
    private View tag(View view,String value){if(value.equals(view.getTag()))return view;if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++){View result=tag(((ViewGroup)view).getChildAt(i),value);if(result!=null)return result;}return null;}
    private void chooseLanguage(String locale)throws Exception{
        final Throwable[] failure={null};runOnMainSync(()->{try{N34Host.setLanguage(locale);host.synchronizeOfficialLanguagePreference(locale);}catch(Throwable error){failure[0]=error;}});if(failure[0]!=null)throw new Exception(failure[0]);waitForIdleSync();SystemClock.sleep(300);waitForIdleSync();
        // Follow genuine official informational confirmation/restart-later UI; never rewrite its methods.
        for(int pass=0;pass<2;pass++){
            Dialog dialog;try{dialog=newestDialog(ai.getDialog());}catch(AssertionError absent){break;}
            if(dialog==ai.getDialog()||dialog==video.getDialog()||dialog instanceof AlertDialog)break;
            TextView confirm=label(dialog.getWindow().getDecorView(),host.getString(android.R.string.ok));
            if(confirm==null)confirm=label(dialog.getWindow().getDecorView(),host.getString(android.R.string.cancel));
            if(!(confirm instanceof Button))break;
            tap(confirm);waitForIdleSync();SystemClock.sleep(700);record("official_language_confirmation",locale);
        }
    }

    private void matrix(ListView list)throws Exception{
        int width=Integer.parseInt(arguments.getString("width","320"));
        runOnMainSync(()->ai.getDialog().getWindow().setLayout(Math.round(width*host.getResources().getDisplayMetrics().density),ViewGroup.LayoutParams.MATCH_PARENT));waitForIdleSync();
        JSONArray cases=new JSONArray();
        String[] locales="true".equals(arguments.getString("onlyDefault"))?new String[]{"DEFAULT"}:new String[]{"en","zh-CN","es","fr","de","pt","ru","ja","ko","ar","hi","id","vi","DEFAULT"};
        Map<String,?> configBefore=new TreeMap<>(host.getSharedPreferences("deepseek_caption_translator",0).getAll());
        for(String locale:locales){
            chooseLanguage(locale);String actual="DEFAULT".equals(locale)?N34Host.callerLocale:locale;
            check(expected("ai_title",actual).contentEquals(ai.getTitle()),"actual AI title after official save "+locale);
            check(expected("ai_summary",actual).contentEquals(ai.getSummary()),"actual AI summary "+locale);
            Locale resolved=(Locale)method(production("CaptionTextResolver"),"locale",Context.class).invoke(null,host);
            if("DEFAULT".equals(locale)&&N34Host.callerLocale.startsWith("zh-Hant"))check("Hant".equals(resolved.getScript()),"genuine DEFAULT resolves zh-Hant");
            JSONObject row=new JSONObject().put("locale",locale).put("resolved_ui_locale",resolved.toLanguageTag()).put("caller_locale",N34Host.callerLocale).put("width_dp",width).put("fontScale",N34Host.callerFontScale).put("dark",arguments.getString("dark","false"));JSONArray controls=new JSONArray();
            JSONObject preferenceInventory=new JSONObject();snapshot(ai,preferenceInventory);row.put("preference_inventory",preferenceInventory);
            for(int position=0;position<list.getAdapter().getCount();position++){Object entry=list.getAdapter().getItem(position);if(!(entry instanceof Preference))continue;Preference preference=(Preference)entry;String key=preference.getKey();View view;if(key!=null)view=reveal(list,key);else{final int selected=position;runOnMainSync(()->list.setSelection(selected));waitForIdleSync();SystemClock.sleep(150);view=list.getChildAt(position-list.getFirstVisiblePosition());key="category/"+metadata(preference).optString("titleSlot",String.valueOf(position));}check(view!=null,"real visible row "+key);if("deepseek_caption_diagnostics".equals(key)){View body=tag(view,"ai_diagnostics_body");if(body!=null&&!body.isShown()){tap(tag(view,"ai_diagnostics_toggle"));waitForIdleSync();SystemClock.sleep(150);}TextView toggle=(TextView)tag(view,"ai_diagnostics_toggle");check(toggle.getText().equals(toggle.getContentDescription()),"diagnostic accessibility follows current locale");}measure(view,controls,key);}
            View prompt=reveal(list,"deepseek_caption_prompt");EditText editor=find(prompt,EditText.class);
            record("default_editor_observation",new JSONObject().put("locale",locale).put("resolved",resolved.toLanguageTag()).put("actual",editor==null?"<missing>":editor.getText().toString()).put("expected",expected("default_prompt",actual)));
            check(editor!=null&&expected("default_prompt",actual).equals(editor.getText().toString()),"actual default editor "+locale+" observed="+(editor==null?"<missing>":editor.getText()));
            check(!host.getSharedPreferences("deepseek_caption_translator",0).contains("prompt"),"matrix UI never persisted a default");
            check(configBefore.equals(host.getSharedPreferences("deepseek_caption_translator",0).getAll()),"UI-only locale refresh writes zero caption config");
            String sample=expected("preview_sample",actual);TextView sampleView=(TextView)method(production("SubtitleStylePreview"),"sampleLabel",Context.class,String.class,int.class,int.class,float.class,float.class).invoke(null,host,sample,4,70,2736f,2736f);
            check(sampleView.getLayout().getLineCount()==1&&sampleView.getLayout().getLineEnd(0)==sample.length(),"actual maximum preview sample full single line "+locale);
            row.put("preview_sample",new JSONObject().put("text",sample).put("line_count",sampleView.getLayout().getLineCount()).put("line_end",sampleView.getLayout().getLineEnd(0)).put("text_locale",sampleView.getTextLocale().toLanguageTag()).put("width",sampleView.getMeasuredWidth()));
            View actualCanvas=tag(reveal(list,"deepseek_caption_style_preview"),"ai_style_preview_canvas");check(actualCanvas!=null&&actualCanvas.isShown(),"real production preview canvas visible");runOnMainSync(actualCanvas::invalidate);waitForIdleSync();SystemClock.sleep(100);Field boxField=production("SubtitleStylePreview").getDeclaredField("LAST_CAPTION_BOX");boxField.setAccessible(true);android.graphics.RectF actualBox=(android.graphics.RectF)boxField.get(null);check(actualBox!=null&&actualBox.left>=0&&actualBox.top>=0&&actualBox.right<=actualCanvas.getWidth()+1&&actualBox.bottom<=actualCanvas.getHeight()+1,"actual onDraw sample stays in frame");check((Integer)field(actualCanvas,"sizeTier")==4,"actual canvas maximum tier");check(expected("preview",actual).contentEquals(actualCanvas.getContentDescription()),"actual canvas accessibility localized");row.put("actual_preview_canvas",new JSONObject().put("class",actualCanvas.getClass().getName()).put("width",actualCanvas.getWidth()).put("height",actualCanvas.getHeight()).put("caption_box",actualBox.toString()).put("description",String.valueOf(actualCanvas.getContentDescription())));
            if(width==320&&N34Host.callerFontScale==1.3f&&(Arrays.asList("zh-CN","en","ja","ar").contains(locale)||"true".equals(arguments.getString("onlyDefault"))))capture("preview-"+locale);
            row.put("controls",controls);cases.put(row);
            clickPreference(list,"deepseek_caption_languages");AlertDialog localePicker=(AlertDialog)newestDialog(ai.getDialog());ListView languageList=localePicker.getListView();
            int pickerWidth=Math.round(width*host.getResources().getDisplayMetrics().density);runOnMainSync(()->localePicker.getWindow().setLayout(pickerWidth,ViewGroup.LayoutParams.WRAP_CONTENT));waitForIdleSync();SystemClock.sleep(100);check(localePicker.getWindow().getDecorView().getWidth()==pickerWidth,"actual picker viewport width");row.put("actual_picker_width",pickerWidth);
            String[] codes={"ar","de","en","es","fr","hi","id","ja","ko","pt","ru","vi","zh-Hans","zh-Hant"};JSONArray observedNames=new JSONArray();
            check(languageList.getChoiceMode()==ListView.CHOICE_MODE_MULTIPLE,"real picker uses native checkboxes");
            for(int index=0;index<codes.length;index++){String name=String.valueOf(languageList.getAdapter().getItem(index));String reference=index<12?Locale.forLanguageTag(codes[index]).getDisplayLanguage(resolved):expected(index==12?"language_zh_hans":"language_zh_hant",actual);check(reference.equals(name),"pure localized picker name "+locale+" "+codes[index]);observedNames.put(name);}
            row.put("picker_names",observedNames);check(expected("languages_save",actual).contentEquals(localePicker.getButton(DialogInterface.BUTTON_POSITIVE).getText()),"localized real Save button");check(expected("cancel",actual).contentEquals(localePicker.getButton(DialogInterface.BUTTON_NEGATIVE).getText()),"localized real Cancel button");
            JSONArray pickerMeasurements=new JSONArray();for(int index=0;index<14;index++){final int position=index;runOnMainSync(()->languageList.setSelection(position));waitForIdleSync();SystemClock.sleep(35);View nativeRow=languageList.getChildAt(position-languageList.getFirstVisiblePosition());check(nativeRow!=null,"actual native language row visible");measure(nativeRow,pickerMeasurements,"language-picker/"+codes[index]);}row.put("actual_picker_rows",pickerMeasurements);runOnMainSync(()->languageList.setSelection(0));waitForIdleSync();
            if(width==320&&N34Host.callerFontScale==1.3f&&(Arrays.asList("zh-CN","en","ja","ar").contains(locale)||"true".equals(arguments.getString("onlyDefault"))))capture("picker-"+locale);
            tap(localePicker.getButton(DialogInterface.BUTTON_NEGATIVE));check(!localePicker.isShowing(),"matrix picker Cancel returns");
            if(width==320&&N34Host.callerFontScale==1.3f&&(Arrays.asList("zh-CN","en","ja","ar").contains(locale)||"true".equals(arguments.getString("onlyDefault")))){
                reveal(list,"deepseek_caption_text_size");capture("style-"+locale);
                reveal(list,"deepseek_caption_enabled");capture("screen-"+locale);
            }
        }
        record("runtime_matrix",cases);
    }
    private void measure(View view,JSONArray controls,String key)throws Exception{
        if(view.getVisibility()!=View.VISIBLE)return;
        if(view instanceof TextView){TextView label=(TextView)view;android.text.Layout layout=label.getLayout();JSONObject value=new JSONObject().put("key",key).put("class",view.getClass().getName()).put("text",label.getText().toString()).put("hint",String.valueOf(label.getHint())).put("description",String.valueOf(label.getContentDescription())).put("text_locale",label.getTextLocale().toLanguageTag()).put("direction",view.getLayoutDirection()).put("width",view.getWidth()).put("height",view.getHeight());
            if(layout!=null){value.put("lines",layout.getLineCount()).put("lineEnd",layout.getLineEnd(layout.getLineCount()-1));
                // Editors and user/provider names retain their N30 scrolling/selection contract.
                if(!(label instanceof EditText)&&label.getEllipsize()==null&&label.getText().length()>0){check(layout.getLineEnd(layout.getLineCount()-1)==label.getText().length(),"complete UI text "+key);check(layout.getHeight()<=label.getHeight()-label.getCompoundPaddingTop()-label.getCompoundPaddingBottom()+2,"no clipped static UI text "+key+" "+label.getText()+" lines="+layout.getLineCount()+" max="+label.getMaxLines()+" layout_h="+layout.getHeight()+" view_h="+label.getHeight()+" measured_h="+label.getMeasuredHeight()+" width="+label.getWidth());}}
            controls.put(value);
        }
        if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)measure(((ViewGroup)view).getChildAt(i),controls,key);
    }

    private void presentation(ListView list)throws Exception{
        int width=Integer.parseInt(arguments.getString("width","320"));int pixels=Math.round(width*host.getResources().getDisplayMetrics().density);
        runOnMainSync(()->ai.getDialog().getWindow().setLayout(pixels,ViewGroup.LayoutParams.MATCH_PARENT));waitForIdleSync();
        JSONArray observations=new JSONArray();String[] locales="true".equals(arguments.getString("onlyDefault"))?new String[]{"DEFAULT"}:new String[]{"en","zh-CN","es","fr","de","pt","ru","ja","ko","ar","hi","id","vi","DEFAULT"};
        for(String language:locales){
            chooseLanguage(language);String actual="DEFAULT".equals(language)?N34Host.callerLocale:language;
            View previewRow=reveal(list,"deepseek_caption_style_preview");View canvas=tag(previewRow,"ai_style_preview_canvas");check(canvas!=null&&canvas.isShown(),"actual production canvas is visible");runOnMainSync(canvas::invalidate);waitForIdleSync();SystemClock.sleep(100);
            check(expected("preview",actual).contentEquals(canvas.getContentDescription()),"actual preview accessibility follows locale");
            Field captionBox=production("SubtitleStylePreview").getDeclaredField("LAST_CAPTION_BOX");captionBox.setAccessible(true);android.graphics.RectF box=(android.graphics.RectF)captionBox.get(null);
            check(box!=null&&box.left>=0&&box.top>=0&&box.right<=canvas.getWidth()+1&&box.bottom<=canvas.getHeight()+1,"real onDraw caption box stays inside video frame");check((Integer)field(canvas,"sizeTier")==4,"visible preview uses maximum tier");
            boolean screenshot=width==320&&N34Host.callerFontScale==1.3f&&(Arrays.asList("en","zh-CN","ja","ar").contains(language)||"true".equals(arguments.getString("onlyDefault")));
            if(screenshot)capture("preview-"+language);
            JSONObject row=new JSONObject().put("locale",language).put("resolved_ui_locale",((Locale)method(production("CaptionTextResolver"),"locale",Context.class).invoke(null,host)).toLanguageTag()).put("width_dp",width).put("fontScale",N34Host.callerFontScale).put("dark",N34Host.callerDark).put("preview_description",String.valueOf(canvas.getContentDescription())).put("actual_canvas",canvas.getClass().getName()).put("canvas_width",canvas.getWidth()).put("canvas_height",canvas.getHeight()).put("caption_box",box.toString()).put("sample",expected("preview_sample",actual));
            clickPreference(list,"deepseek_caption_languages");AlertDialog picker=(AlertDialog)newestDialog(ai.getDialog());runOnMainSync(()->picker.getWindow().setLayout(pixels,ViewGroup.LayoutParams.WRAP_CONTENT));waitForIdleSync();SystemClock.sleep(100);
            check(picker.getWindow().getDecorView().getWidth()==pixels,"real picker has requested viewport width");JSONArray labels=new JSONArray();ListView pickerList=picker.getListView();
            for(int index=0;index<14;index++){final int position=index;runOnMainSync(()->pickerList.setSelection(position));waitForIdleSync();SystemClock.sleep(35);View nativeRow=pickerList.getChildAt(position-pickerList.getFirstVisiblePosition());TextView label=nativeRow.findViewById(android.R.id.text1);check(label!=null,"actual native checkbox row attached");check(label.getLayout().getLineEnd(label.getLayout().getLineCount()-1)==label.getText().length(),"picker row has complete language name");check(label.getLayout().getHeight()<=label.getHeight()-label.getCompoundPaddingTop()-label.getCompoundPaddingBottom()+2,"picker name not clipped");labels.put(new JSONObject().put("text",label.getText().toString()).put("lines",label.getLayout().getLineCount()).put("text_locale",label.getTextLocale().toLanguageTag()).put("width",label.getWidth()));}
            row.put("picker_width",picker.getWindow().getDecorView().getWidth()).put("picker_labels",labels);if(screenshot){runOnMainSync(()->pickerList.setSelection(0));waitForIdleSync();capture("picker-width-"+language);}tap(picker.getButton(DialogInterface.BUTTON_NEGATIVE));check(!picker.isShowing()&&ai.getDialog().isShowing(),"narrow picker Cancel returns to AI");observations.put(row);
        }
        record("actual_preview_and_picker_viewports",observations);
    }

    private void actions(ListView list)throws Exception{
        chooseLanguage(arguments.getString("locale","ja"));
        record("action_ui_locale",((Locale)method(production("CaptionTextResolver"),"locale",Context.class).invoke(null,host)).toLanguageTag());
        host.getSharedPreferences("caption_language_menu",0).edit().remove("selected_codes").commit();
        clickPreference(list,"deepseek_caption_languages");AlertDialog picker=(AlertDialog)newestDialog(ai.getDialog());ListView languages=picker.getListView();
        for(int position:new int[]{4,12}){final int selected=position;runOnMainSync(()->languages.setSelection(selected));waitForIdleSync();SystemClock.sleep(150);tap(languages.getChildAt(position-languages.getFirstVisiblePosition()));}
        tap(picker.getButton(DialogInterface.BUTTON_POSITIVE));check(!picker.isShowing(),"Save dismisses language picker");
        Set<String> saved=new HashSet<>(host.getSharedPreferences("caption_language_menu",0).getStringSet("selected_codes",Collections.emptySet()));check(saved.equals(new HashSet<>(Arrays.asList("fr","zh-Hans"))),"saved actual two-language set");
        clickPreference(list,"deepseek_caption_languages");picker=(AlertDialog)newestDialog(ai.getDialog());check(picker.getListView().isItemChecked(4)&&picker.getListView().isItemChecked(12),"reopened checks persisted");tap(picker.getListView().getChildAt(0));tap(picker.getButton(DialogInterface.BUTTON_NEGATIVE));check(saved.equals(host.getSharedPreferences("caption_language_menu",0).getStringSet("selected_codes",Collections.emptySet())),"Cancel does not write selection");
        clickPreference(list,"deepseek_caption_languages");picker=(AlertDialog)newestDialog(ai.getDialog());sendKeyDownUpSync(KeyEvent.KEYCODE_BACK);waitForIdleSync();SystemClock.sleep(250);check(!picker.isShowing()&&ai.getDialog().isShowing(),"Back returns to AI");
        record("real_picker_save_cancel_back",saved.toString());
        try(LocalProvider server=new LocalProvider()){
            method(production("SecureApiKey"),"clear",Context.class).invoke(null,host);
            clickPreference(list,"deepseek_caption_test_api");SystemClock.sleep(500);check(server.requests.isEmpty(),"empty key API zero");
            host.getSharedPreferences("deepseek_caption_translator",0).edit().putString("base_url","http://127.0.0.1:38433/v1").putString("model","n34-local-model").commit();
            method(production("SecureApiKey"),"save",Context.class,String.class).invoke(null,host,"n34-fake-local-key");
            clickPreference(list,"deepseek_caption_test_api");waitEnabled(ai.findPreference("deepseek_caption_test_api"));check(server.chatCalls>0,"real Test API request reached local provider");String expectedSuccess=String.format(Locale.ROOT,text("api_test_ok"),"这是一条完整的测试字幕。");long toastDeadline=SystemClock.uptimeMillis()+5000;while(!toasts.contains(expectedSuccess)&&SystemClock.uptimeMillis()<toastDeadline){SystemClock.sleep(100);waitForIdleSync();}check(toasts.contains(expectedSuccess),"actual API feedback uses current UI locale");record("real_api_success",new JSONArray(server.requests));record("observed_api_success_toast",expectedSuccess);
            server.fail=true;clickPreference(list,"deepseek_caption_test_api");waitEnabled(ai.findPreference("deepseek_caption_test_api"));server.fail=false;record("real_api_failure_completed",true);
            View model=reveal(list,"deepseek_caption_model");TextView refresh=label(model,text("refresh"));check(refresh!=null,"real refresh button");tap(refresh);
            long deadline=SystemClock.uptimeMillis()+12000;while(!refresh.isEnabled()&&SystemClock.uptimeMillis()<deadline){SystemClock.sleep(100);waitForIdleSync();}check(refresh.isEnabled()&&server.modelCalls>0,"model response completed and button enabled");
            Object modelPreference=ai.findPreference("deepseek_caption_model");TextView choices=(TextView)field(modelPreference,"choices");tap(choices);SystemClock.sleep(250);waitForIdleSync();PopupWindow popup=(PopupWindow)field(modelPreference,"modelMenu");check(popup!=null&&popup.isShowing(),"actual model PopupWindow visible");capture("model-popup");
            TextView selected=label(popup.getContentView(),"    n34-second-model");check(selected!=null,"actual second model row");tap(selected);check("n34-second-model".equals(host.getSharedPreferences("deepseek_caption_translator",0).getString("model","")),"popup selection persisted");record("real_model_popup_selection",true);
        }
        View diagnostics=reveal(list,"deepseek_caption_diagnostics");View toggle=tag(diagnostics,"ai_diagnostics_toggle");tap(toggle);waitForIdleSync();
        // Scroll the actual row to bring its lower action buttons into the real window.
        View save=tag(diagnostics,"ai_diagnostics_save");runOnMainSync(()->save.requestRectangleOnScreen(new Rect(0,0,save.getWidth(),save.getHeight()),true));waitForIdleSync();SystemClock.sleep(250);
        long before=lastDownload();tap(save);long deadline=SystemClock.uptimeMillis()+12000;while(!save.isEnabled()&&SystemClock.uptimeMillis()<deadline){SystemClock.sleep(100);waitForIdleSync();}check(save.isEnabled(),"diagnostic save button restored");long after=lastDownload();check(after>before,"actual MediaStore file created");verifyDownload(after);record("real_diagnostics_media_store",after);
        SharedPreferences settings=host.getSharedPreferences("deepseek_caption_translator",0);settings.edit().putFloat("position_portrait_y",0.2f).putFloat("position_landscape_y",0.3f).putFloat("shorts_y",0.4f).commit();
        File cacheDirectory=(File)method(production("RebuildCache"),"directory",Context.class).invoke(null,host);File cacheProbe=new File(cacheDirectory,"n34-real-clear-probe.json");try(FileOutputStream output=new FileOutputStream(cacheProbe)){output.write("n34 local probe".getBytes(StandardCharsets.UTF_8));}
        clickPreference(list,"deepseek_caption_reset_position");check(!settings.contains("position_portrait_y")&&!settings.contains("position_landscape_y")&&!settings.contains("shorts_y"),"reset position actually removed saved coordinates");
        clickPreference(list,"deepseek_caption_clear_cache");check(!cacheProbe.exists(),"clear cache actually removed real cache file");record("real_cache_file_and_position_reset",true);
        clickPreference(list,"deepseek_caption_delete_key");Dialog confirm=newestDialog(ai.getDialog());TextView clear=label(confirm.getWindow().getDecorView(),text("profile_clear_key"));check(clear!=null,"clear key confirmation");tap(clear);check(!(Boolean)method(production("SecureApiKey"),"hasSavedValue",Context.class).invoke(null,host),"actual encrypted key removed");
        method(production("CaptionDiagnostics"),"mark",Context.class,String.class,String.class).invoke(null,host,"N34_CLEAR_UI_PROBE","raw中文 preserved");
        diagnostics=reveal(list,"deepseek_caption_diagnostics");View clearDiagnostic=tag(diagnostics,"ai_diagnostics_clear");if(!clearDiagnostic.isShown()){tap(tag(diagnostics,"ai_diagnostics_toggle"));waitForIdleSync();}runOnMainSync(()->clearDiagnostic.requestRectangleOnScreen(new Rect(0,0,clearDiagnostic.getWidth(),clearDiagnostic.getHeight()),true));waitForIdleSync();tap(clearDiagnostic);confirm=newestDialog(ai.getDialog());tap(label(confirm.getWindow().getDecorView(),text("clear_diagnostics")));check(!((String)method(production("CaptionDiagnostics"),"fullText",Context.class).invoke(null,host)).contains("N34_CLEAR_UI_PROBE"),"clear diagnostics actually cleared marker");record("real_clear_key_cache_position_diagnostics",true);
        segmentedClipboard();
        profiles(list);
        sendKeyDownUpSync(KeyEvent.KEYCODE_BACK);waitForIdleSync();SystemClock.sleep(600);waitForIdleSync();check((ai.getDialog()==null||!ai.getDialog().isShowing())&&video.getDialog().isShowing(),"AI Back returns to video");sendKeyDownUpSync(KeyEvent.KEYCODE_BACK);waitForIdleSync();SystemClock.sleep(600);waitForIdleSync();check(video.getDialog()==null||!video.getDialog().isShowing(),"video Back returns to Morphe root");
        Preference general=host.preferences.findPreference("morphe_settings_screen_01_general_sort_by_key");if(general==null){PreferenceGroup root=host.preferences.getPreferenceScreen();for(int i=0;i<root.getPreferenceCount();i++){Preference p=root.getPreference(i);if(p.getKey()!=null&&p.getKey().contains("_general"))general=p;}}
        check(general instanceof PreferenceScreen,"actual General root exists");clickPreference(find(host.preferences.getView(),ListView.class),general.getKey());check(((PreferenceScreen)general).getDialog().isShowing(),"normal General navigation");sendKeyDownUpSync(KeyEvent.KEYCODE_BACK);waitForIdleSync();record("real_navigation_return_and_general",true);
    }
    private void waitEnabled(Preference preference){long deadline=SystemClock.uptimeMillis()+15000;while(!preference.isEnabled()&&SystemClock.uptimeMillis()<deadline){SystemClock.sleep(100);waitForIdleSync();}check(preference.isEnabled(),"API button restored after completion");SystemClock.sleep(350);waitForIdleSync();}
    private void extras(ListView list)throws Exception{
        chooseLanguage("ja");
        try(LocalProvider server=new LocalProvider()){
            host.getSharedPreferences("deepseek_caption_translator",0).edit().putString("base_url","http://127.0.0.1:38433/v1").putString("model","n34-local-model").commit();method(production("SecureApiKey"),"save",Context.class,String.class).invoke(null,host,"n34-fake-local-key");
            Object model=ai.findPreference("deepseek_caption_model");View row=reveal(list,"deepseek_caption_model");TextView refresh=label(row,text("refresh"));server.fail=true;tap(refresh);waitModel(refresh);TextView state=(TextView)field(model,"state");check(state.getText().toString().contains("HTTP 503")&&!state.getText().toString().contains("模型列表 HTTP"),"authored model HTTP envelope localized, provider details preserved");record("real_model_http_failure",state.getText().toString());
            server.fail=false;server.emptyModels=true;tap(refresh);waitModel(refresh);check(state.getText().toString().contains(text("model_ids_empty"))&&!state.getText().toString().contains("接口没有返回可选择"),"localized no-model response");record("real_model_empty_response",state.getText().toString());capture("model-empty-error");
            server.emptyModels=false;server.delayMs=4000;clickPreference(list,"deepseek_caption_test_api");chooseLanguage("fr");waitEnabled(ai.findPreference("deepseek_caption_test_api"));String expected=String.format(Locale.ROOT,text("api_test_ok"),"这是一条完整的测试字幕。");long deadline=SystemClock.uptimeMillis()+7000;while(!toasts.contains(expected)&&SystemClock.uptimeMillis()<deadline){SystemClock.sleep(100);waitForIdleSync();}check(toasts.contains(expected),"in-flight API response uses new French UI locale");record("in_flight_locale_response",expected);
        }
        method(production("SecureApiKey"),"clear",Context.class).invoke(null,host);
    }
    private void waitModel(View refresh){long deadline=SystemClock.uptimeMillis()+12000;while(!refresh.isEnabled()&&SystemClock.uptimeMillis()<deadline){SystemClock.sleep(100);waitForIdleSync();}check(refresh.isEnabled(),"real model button restored");SystemClock.sleep(250);waitForIdleSync();}
    private void segmentedClipboard()throws Exception{
        StringBuilder report=new StringBuilder();while(report.length()<120005)report.append("N34 raw中文\n");final String raw=report.toString();final Throwable[] error={null};runOnMainSync(()->{try{method(production("DeepSeekDiagnosticsPreference"),"copyPages",Context.class,String.class).invoke(null,host,raw);}catch(Throwable failure){error[0]=failure;}});if(error[0]!=null)throw new Exception(error[0]);waitForIdleSync();SystemClock.sleep(300);
        AlertDialog pages=(AlertDialog)newestDialog(ai.getDialog());ListView list=pages.getListView();check(list.getAdapter().getCount()==3,"production Android-9 export branch has three parts");check(String.format(Locale.ROOT,text("copy_part_label"),1,3).equals(String.valueOf(list.getAdapter().getItem(0))),"localized part ordinal template");tap(list.getChildAt(0));ClipboardManager clipboard=(ClipboardManager)host.getSystemService(Context.CLIPBOARD_SERVICE);check(raw.substring(0,60000).contentEquals(clipboard.getPrimaryClip().getItemAt(0).getText()),"actual part click copied original raw text");record("android9_branch_real_window_clipboard_on_sdk35",true);
    }
    private long lastDownload(){long id=-1;try(android.database.Cursor cursor=host.getContentResolver().query(android.provider.MediaStore.Downloads.EXTERNAL_CONTENT_URI,new String[]{"_id"},null,null,"_id DESC")){if(cursor!=null&&cursor.moveToFirst())id=cursor.getLong(0);}return id;}
    private void verifyDownload(long id)throws Exception{
        android.net.Uri uri=ContentUris.withAppendedId(android.provider.MediaStore.Downloads.EXTERNAL_CONTENT_URI,id);
        try(android.database.Cursor cursor=host.getContentResolver().query(uri,new String[]{"is_pending","_display_name"},null,null,null)){check(cursor!=null&&cursor.moveToFirst()&&cursor.getInt(0)==0,"IS_PENDING cleared");record("saved_diagnostic_name",cursor.getString(1));}
        ByteArrayOutputStream bytes=new ByteArrayOutputStream();try(InputStream input=host.getContentResolver().openInputStream(uri)){byte[] buffer=new byte[8192];for(int read;(read=input.read(buffer))>=0;)bytes.write(buffer,0,read);}
        String saved=new String(bytes.toByteArray(),StandardCharsets.UTF_8);String raw=(String)method(production("CaptionDiagnostics"),"fullText",Context.class).invoke(null,host);
        String normalizedSaved=saved.replaceAll("exported_at=\\d+","exported_at=<clock>").replaceAll("\\(approx \\d+ seconds ago\\)","(approx <clock> seconds ago)");
        String normalizedRaw=raw.replaceAll("exported_at=\\d+","exported_at=<clock>").replaceAll("\\(approx \\d+ seconds ago\\)","(approx <clock> seconds ago)");
        check(normalizedSaved.equals(normalizedRaw),"file equals raw report apart from observation clock");record("saved_raw_utf8_bytes",bytes.size());
    }
    private void profiles(ListView list)throws Exception{
        clickPreference(list,"deepseek_caption_profiles");Object preference=ai.findPreference("deepseek_caption_profiles");Dialog dialog=(Dialog)field(preference,"dialog");check(dialog.isShowing(),"actual profile selector");tap(label(dialog.getWindow().getDecorView(),text("profile_add")));dialog=(Dialog)field(preference,"dialog");EditText name=find(dialog.getWindow().getDecorView(),EditText.class);final EditText creationName=name;runOnMainSync(()->creationName.setText("N34 用户原名"));tap(label(dialog.getWindow().getDecorView(),text("profile_save")));waitForIdleSync();
        clickPreference(list,"deepseek_caption_profiles");dialog=(Dialog)field(preference,"dialog");View row=label(dialog.getWindow().getDecorView(),"✓  N34 用户原名");check(row!=null,"new profile selected");ViewGroup header=(ViewGroup)row.getParent();tap(header.getChildAt(1));tap(label(dialog.getWindow().getDecorView(),text("profile_rename")));SystemClock.sleep(600);waitForIdleSync();name=find(dialog.getWindow().getDecorView(),EditText.class);final EditText rename=name;runOnMainSync(()->rename.setText("N34 改名 сохраняется"));View renameSave=label(dialog.getWindow().getDecorView(),text("profile_save"));runOnMainSync(()->renameSave.requestRectangleOnScreen(new Rect(0,0,renameSave.getWidth(),renameSave.getHeight()),true));waitForIdleSync();SystemClock.sleep(400);capture("profile-rename-before-save");tap(renameSave);waitForIdleSync();
        row=label(dialog.getWindow().getDecorView(),"✓  N34 改名 сохраняется");check(row!=null,"rename preserved original bytes");header=(ViewGroup)row.getParent();tap(header.getChildAt(1));tap(label(dialog.getWindow().getDecorView(),text("profile_delete")));tap(label(dialog.getWindow().getDecorView(),text("profile_confirm_delete")));check(label(dialog.getWindow().getDecorView(),"✓  N34 改名 сохраняется")==null,"profile deleted");sendKeyDownUpSync(KeyEvent.KEYCODE_BACK);waitForIdleSync();record("real_profile_create_rename_delete",true);
    }

    private void parity()throws Exception{
        JSONArray results=new JSONArray();
        try(LocalProvider provider=new LocalProvider()){
            Class<?> config=production("DeepSeekConfig"),snapshot=production("DeepSeekConfig$Snapshot"),sourceClass=production("RebuildSource"),wordClass=production("RebuildSource$Word"),precision=production("RebuildSource$Precision"),policyClass=production("CaptionLanguageContext"),blockClass=production("RebuildPlanner$Block");
            Constructor<?> word=wordClass.getDeclaredConstructor(String.class,long.class,long.class,int.class,precision);word.setAccessible(true);Object nativeTiming=Enum.valueOf((Class)precision,"NATIVE");List<Object> words=new ArrayList<>();String[] tokens={"This","is","a","complete","test."};for(int i=0;i<tokens.length;i++)words.add(word.newInstance(tokens[i],i*800L,(i+1)*800L,0,nativeTiming));Constructor<?> constructor=sourceClass.getDeclaredConstructor(List.class);constructor.setAccessible(true);Object source=constructor.newInstance(words);
            SharedPreferences values=host.getSharedPreferences("deepseek_caption_translator",0);values.edit().putString("base_url","http://127.0.0.1:38433/v1").putString("model","n34-parity-model").commit();method(production("SecureApiKey"),"save",Context.class,String.class).invoke(null,host,"n34-fake-local-key");
            for(String custom:new String[]{"","保留用户要求：中文 custom 原文。"}){
                if(custom.isEmpty())values.edit().remove("prompt").commit();else values.edit().putString("prompt",custom).commit();
                for(String target:new String[]{"zh-Hans","zh-Hant","ja","ar"}){
                    Object policy=method(policyClass,"explicit",String.class,String.class).invoke(null,"en",target);Object block=((List<?>)method(production("RebuildPlanner"),"plan",sourceClass,policyClass).invoke(null,source,policy)).get(0);
                    for(String locale:new String[]{"en","zh-CN","es","fr","de","pt","ru","ja","ko","ar","hi","id","vi"}){
                        chooseLanguage(locale);Object cfg=method(config,"load",Context.class).invoke(null,host);String prompt=(String)method(production("RebuildApi"),"prompt",snapshot,String.class,policyClass).invoke(null,cfg,target,policy);
                        String cache=(String)method(production("RebuildCache"),"identity",sourceClass,snapshot,String.class,policyClass).invoke(null,source,cfg,target,policy);
                        int before=provider.requests.size();Object plan=method(production("RebuildApi"),"translate",sourceClass,blockClass,snapshot,String.class,production("DeepSeekApiClient$RequestControl"),boolean.class,String.class,policyClass).invoke(null,source,block,cfg,target,null,true,"",policy);
                        check(provider.requests.size()==before+1,"one actual parity HTTP request");
                        results.put(new JSONObject().put("custom",!custom.isEmpty()).put("target",target).put("ui_locale",locale).put("cfg_prompt",field(cfg,"prompt")).put("effectivePreference",field(cfg,"effectivePreference")).put("prompt",prompt).put("cache_identity",cache).put("actual_request_json",provider.requests.get(before)).put("actual_plan_json",field(plan,"json")));
                    }
                }
            }
            method(production("SecureApiKey"),"clear",Context.class).invoke(null,host);values.edit().remove("prompt").remove("base_url").remove("model").commit();
        }
        record("real_request_cache_source_block_parity",results);
    }

    private Object staticField(Class<?> type,String name)throws Exception{Field f=type.getDeclaredField(name);f.setAccessible(true);return f.get(null);}
    private void owned()throws Exception {
        Class<?> overlay=production("CaptionOverlay"),guard=production("CaptionOverlay$RenderGuard"),renderSpec=production("CaptionRenderSpec");
        Method show=method(overlay,"showEvent",String.class,guard,java.util.function.Supplier.class,String.class,long.class,long.class,long.class,renderSpec);
        Method position=method(overlay,"position",long.class,guard);
        final FrameLayout[] player={null};final int screen=host.getResources().getDisplayMetrics().widthPixels;
        runOnMainSync(()->{ai.getDialog().dismiss();video.getDialog().dismiss();FrameLayout content=new FrameLayout(host);content.setBackgroundColor(0xff203044);
            FrameLayout surface=new FrameLayout(host);int id=host.getResources().getIdentifier("player_overlays","id",host.getPackageName());check(id!=0,"actual player_overlays resource exists");surface.setId(id);surface.setBackgroundColor(0xff101b2b);player[0]=surface;
            content.addView(surface,new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,Math.round(500*host.getResources().getDisplayMetrics().density)));
            host.setContentView(content);try{method(production("DeepSeekConfig"),"saveCaptionSizeTier",Context.class,int.class).invoke(null,host,2);
                method(production("DeepSeekConfig"),"saveDisplayTextDebugEnabled",Context.class,boolean.class).invoke(null,host,true);method(overlay,"setActivity",Activity.class).invoke(null,host);
            }catch(Exception e){throw new RuntimeException(e);}});waitForIdleSync();SystemClock.sleep(200);
        String[] targets={"zh-Hans","ja","ar","hi","en"};String[] samples={"比如，这是Pixel 11 Pro。","これは完全な字幕のテストです。","نعم، 144Hz (جيد).","क्ष क़ि ठीक है।","Complete words and 144Hz stay."};
        JSONArray rows=new JSONArray();
        for(int n=0;n<targets.length;n++) {
            final String target=targets[n],text=samples[n];final java.util.concurrent.atomic.AtomicLong latest=new java.util.concurrent.atomic.AtomicLong(100);
            final java.util.concurrent.atomic.AtomicBoolean valid=new java.util.concurrent.atomic.AtomicBoolean(true);
            Object owner=Proxy.newProxyInstance(guard.getClassLoader(),new Class<?>[]{guard},(proxy,m,args)->{
                switch(m.getName()){case "isValid":return valid.get();case "displayPosition":return latest.get();case "identity":return "sdk35:"+target;case "blankReason":return "source_gap";case "toString":return "N34 synthetic owned guard";case "hashCode":return System.identityHashCode(proxy);case "equals":return proxy==args[0];default:return null;}});
            Object policy=method(production("CaptionLanguageContext"),"explicit",String.class,String.class).invoke(null,"en",target);Object spec=field(policy,"renderSpec");
            runOnMainSync(()->{try{show.invoke(null,text,owner,(java.util.function.Supplier<String>)()->"","sdk35:"+target,100L,2300L,100L,spec);}catch(Exception e){throw new RuntimeException(e);}});
            waitForIdleSync();SystemClock.sleep(180);TextView view=(TextView)((java.lang.ref.WeakReference<?>)staticField(overlay,"textRef")).get();View anchor=(View)((java.lang.ref.WeakReference<?>)staticField(overlay,"anchorRef")).get();
            check(anchor.isShown()&&text.contentEquals(view.getText()),"current owned caption complete "+target);check(view.getLineCount()<=2&&view.getLayout().getLineEnd(view.getLineCount()-1)==text.length(),"real final TextView covers text "+target);
            capture("owned-current-"+target);rows.put(new JSONObject().put("target",target).put("case","current").put("media_position",latest.get()).put("visible",anchor.isShown()).put("text",view.getText()).put("lines",view.getLineCount()).put("observed_uptime_ms",SystemClock.uptimeMillis()).put("window_start",100).put("window_end",2300));
            latest.set(2300);runOnMainSync(()->{try{position.invoke(null,100L,owner);}catch(Exception e){throw new RuntimeException(e);}});waitForIdleSync();check(!anchor.isShown()&&view.getText().length()==0,"exclusive end hides "+target);capture("owned-expired-"+target);
            latest.set(499);runOnMainSync(()->{try{show.invoke(null,text,owner,(java.util.function.Supplier<String>)()->"","sdk35:future:"+target,500L,2700L,499L,spec);}catch(Exception e){throw new RuntimeException(e);}});waitForIdleSync();check(!anchor.isShown(),"future caption not shown "+target);
            latest.set(500);runOnMainSync(()->{try{position.invoke(null,499L,owner);}catch(Exception e){throw new RuntimeException(e);}});waitForIdleSync();check(anchor.isShown()&&text.contentEquals(view.getText()),"first onset recovers after early hide "+target);
            latest.set(100);runOnMainSync(()->{Thread background=new Thread(()->{try{show.invoke(null,text,owner,(java.util.function.Supplier<String>)()->"","sdk35:queued:"+target,100L,2300L,100L,spec);}catch(Exception e){throw new RuntimeException(e);}});background.start();try{background.join();}catch(InterruptedException e){throw new RuntimeException(e);}latest.set(2300);});waitForIdleSync();check(!anchor.isShown()&&view.getText().length()==0,"queued old time cannot resurrect expired caption "+target);capture("owned-main-delay-"+target);
            rows.put(new JSONObject().put("target",target).put("case","expired_future_and_main_delay").put("visible",false).put("media_position",latest.get()).put("observed_uptime_ms",SystemClock.uptimeMillis()));
            valid.set(false);
        }
        Object policy=method(production("CaptionLanguageContext"),"explicit",String.class,String.class).invoke(null,"en","en");Object spec=field(policy,"renderSpec");
        final java.util.concurrent.atomic.AtomicLong latest=new java.util.concurrent.atomic.AtomicLong(100);
        Object owner=Proxy.newProxyInstance(guard.getClassLoader(),new Class<?>[]{guard},(proxy,m,args)->{if(m.getName().equals("isValid"))return true;if(m.getName().equals("displayPosition"))return latest.get();if(m.getReturnType()==String.class)return "fixture";return null;});
        String wide="Complete words, 144Hz and punctuation stay.";
        runOnMainSync(()->{player[0].getLayoutParams().width=Math.round(screen*.35f);player[0].requestLayout();});waitForIdleSync();SystemClock.sleep(200);
        runOnMainSync(()->{try{show.invoke(null,wide,owner,(java.util.function.Supplier<String>)()->"","sdk35:narrow",100L,1300L,100L,spec);}catch(Exception e){throw new RuntimeException(e);}});waitForIdleSync();
        View anchor=(View)((java.lang.ref.WeakReference<?>)staticField(overlay,"anchorRef")).get();
        TextView narrowView=(TextView)((java.lang.ref.WeakReference<?>)staticField(overlay,"textRef")).get();
        Object budget=method(overlay,"budget").invoke(null);boolean narrowFits=(Boolean)method(budget.getClass(),"fitsPreferred",String.class).invoke(budget,wide);
        if(narrowFits)check(anchor.isShown()&&wide.contentEquals(narrowView.getText()),"N33 calibrated narrow geometry fitting text must remain visible");
        else check(!anchor.isShown(),"measured narrow hard capacity remains blank");
        record("actual_narrow_budget",new JSONObject().put("fits_complete",narrowFits).put("width",field(budget,"width")).put("size_px",field(budget,"preferredPx")).put("visible",anchor.isShown()));
        capture("owned-narrow-measured");
        String dense=String.join(" ",Collections.nCopies(60,"unchanged"));
        runOnMainSync(()->{try{show.invoke(null,dense,owner,(java.util.function.Supplier<String>)()->"","sdk35:hard-capacity",100L,383L,100L,spec);}catch(Exception e){throw new RuntimeException(e);}});waitForIdleSync();check(!anchor.isShown(),"true dense physical short-window capacity remains blank");capture("owned-hard-capacity-blank");
        runOnMainSync(()->{try{show.invoke(null,wide,owner,(java.util.function.Supplier<String>)()->"","sdk35:narrow-restore",100L,1300L,100L,spec);}catch(Exception e){throw new RuntimeException(e);}});waitForIdleSync();
        latest.set(500);runOnMainSync(()->{player[0].getLayoutParams().width=ViewGroup.LayoutParams.MATCH_PARENT;player[0].requestLayout();});waitForIdleSync();SystemClock.sleep(200);
        runOnMainSync(()->{try{method(overlay,"refreshStyle",Context.class).invoke(null,host);}catch(Exception e){throw new RuntimeException(e);}});waitForIdleSync();TextView view=(TextView)((java.lang.ref.WeakReference<?>)staticField(overlay,"textRef")).get();check(anchor.isShown()&&wide.contentEquals(view.getText()),"geometry restores unchanged full current owned text");capture("owned-width-restored");
        record("final_dex_owned_window_observations",rows);record("narrow_geometry_preserves_primary",true);
        record("final_dex_display_diagnostics",method(production("CaptionDiagnostics"),"fullText",Context.class).invoke(null,host));
        record("scope","Final delivered DEX/resources plus test-only host; synthetic source/media windows, not a real YouTube network video or audio sync certification.");
    }

    private static final class LocalProvider implements AutoCloseable {
        final java.net.ServerSocket socket;
        final List<String> requests=Collections.synchronizedList(new ArrayList<>());
        volatile int chatCalls,modelCalls,delayMs;volatile boolean fail,emptyModels;
        LocalProvider()throws Exception{socket=new java.net.ServerSocket(38433,10,java.net.InetAddress.getByName("127.0.0.1"));Thread thread=new Thread(()->{while(!socket.isClosed())try{serve(socket.accept());}catch(Exception error){if(!socket.isClosed())android.util.Log.e("N34","local provider",error);}},"n34-local-provider");thread.setDaemon(true);thread.start();}
        private void serve(java.net.Socket client)throws Exception{try(java.net.Socket connection=client){InputStream input=connection.getInputStream();String line=readLine(input),path=line.split(" ")[1];int length=0;for(String header;(header=readLine(input))!=null&&!header.isEmpty();)if(header.toLowerCase(Locale.ROOT).startsWith("content-length:"))length=Integer.parseInt(header.substring(header.indexOf(':')+1).trim());byte[] body=new byte[length];for(int offset=0;offset<length;){int count=input.read(body,offset,length-offset);if(count<0)throw new EOFException();offset+=count;}
            String result;int status=fail?503:200;
            if(path.startsWith("/v1/models")){modelCalls++;result=emptyModels?"{\"data\":[]}":"{\"data\":[{\"id\":\"n34-local-model\"},{\"id\":\"n34-second-model\"}]}";}
            else{chatCalls++;String request=new String(body,StandardCharsets.UTF_8);requests.add(request);JSONObject payload=new JSONObject(new JSONObject(request).getJSONArray("messages").getJSONObject(1).getString("content"));JSONArray tokens=payload.getJSONArray("owned_tokens");String target=payload.optString("language");String translation="zh-Hant".equals(target)?"這是一條完整的測試字幕。":"ja".equals(target)?"これはテスト字幕です。":"ar".equals(target)?"هذا اختبار للترجمة.":"这是一条完整的测试字幕。";JSONObject event=new JSONObject().put("from",tokens.getJSONArray(0).getInt(0)).put("to",tokens.getJSONArray(tokens.length()-1).getInt(0)).put("source",payload.getString("source_text")).put("text",translation);String plan=new JSONObject().put("block",payload.getString("block")).put("events",new JSONArray().put(event)).toString();result=new JSONObject().put("choices",new JSONArray().put(new JSONObject().put("finish_reason","stop").put("message",new JSONObject().put("content",plan)))).toString();}
            if(fail)result="{\"error\":{\"message\":\"n34 controlled local failure\"}}";if(delayMs>0)Thread.sleep(delayMs);byte[] output=result.getBytes(StandardCharsets.UTF_8);OutputStream stream=connection.getOutputStream();stream.write(("HTTP/1.1 "+status+" "+(status==200?"OK":"Unavailable")+"\r\nContent-Type: application/json\r\nContent-Length: "+output.length+"\r\nConnection: close\r\n\r\n").getBytes(StandardCharsets.US_ASCII));stream.write(output);stream.flush();}}
        private static String readLine(InputStream input)throws Exception{ByteArrayOutputStream line=new ByteArrayOutputStream();for(int value;(value=input.read())>=0;){if(value=='\n')break;if(value!='\r')line.write(value);}return line.toString("UTF-8");}
        public void close()throws Exception{socket.close();}
    }
}
