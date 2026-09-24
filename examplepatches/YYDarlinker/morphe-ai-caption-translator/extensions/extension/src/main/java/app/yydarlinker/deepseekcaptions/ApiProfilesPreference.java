package app.yydarlinker.deepseekcaptions;

import android.app.Dialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Rect;
import android.graphics.drawable.*;
import android.util.AttributeSet;
import android.view.*;
import android.view.inputmethod.InputMethodManager;
import android.widget.*;
import java.util.*;

/** One settings row; per-profile management stays inside the existing selector dialog. */
@SuppressWarnings("deprecation")
public final class ApiProfilesPreference extends android.preference.Preference {
    private Dialog dialog;
    private Dialog listDialog;
    private LinearLayout listBody;
    private final LinkedHashMap<String,ProfileRow> rows=new LinkedHashMap<>();
    private ProfileRow expanded;
    private EditText renameEditor;
    private String renameOriginal="";

    private final class ProfileRow {
        final String id;
        final LinearLayout root=column(),header=new LinearLayout(getContext()),panel=column();
        final TextView name=new TextView(getContext());
        final ImageButton more=new ImageButton(getContext());
        ProfileRow(String id){this.id=id;}
    }

    public ApiProfilesPreference(Context c){super(c);init();}
    public ApiProfilesPreference(Context c,AttributeSet a){super(c,a);init();}
    public ApiProfilesPreference(Context c,AttributeSet a,int d){super(c,a,d);init();}
    public ApiProfilesPreference(Context c,AttributeSet a,int d,int r){super(c,a,d,r);init();}
    private void init(){setPersistent(false);setSelectable(true);}
    private String text(String key){return CaptionStrings.settings(getContext(),key);}
    private int dp(int value){return CaptionSettingsStyle.dp(getContext(),value);}
    private LinearLayout column(){LinearLayout v=new LinearLayout(getContext());v.setOrientation(LinearLayout.VERTICAL);return v;}

    @Override protected void onBindView(View view){
        setTitle(text("profiles_title"));
        setSummary(ApiProfiles.list(getContext()).get(ApiProfiles.active(getContext())));
        super.onBindView(view);
        TextView summary=view.findViewById(android.R.id.summary);
        if(summary!=null){summary.setMaxLines(1);summary.setEllipsize(android.text.TextUtils.TruncateAt.END);}
    }
    @Override protected void onClick(){showProfiles();}

    private void show(String title,LinearLayout body,String closeLabel){
        close();
        dialog=CaptionSettingsDialogs.show(getContext(),title,body,text(closeLabel));
        final Dialog shown=dialog;
        shown.setOnDismissListener(ignored->{
            if(dialog==shown){endRename();dialog=null;listDialog=null;expanded=null;rows.clear();listBody=null;notifyChanged();}
        });
    }
    private void close(){
        if(dialog!=null)dialog.dismiss();
        dialog=null;notifyChanged();
    }
    private void message(LinearLayout parent,String value){
        TextView v=new TextView(getContext());CaptionSettingsStyle.caption(v);v.setText(value);
        v.setPadding(0,dp(8),0,dp(12));parent.addView(v,new LinearLayout.LayoutParams(-1,-2));
    }
    private void styleAction(TextView view){
        CaptionSettingsStyle.title(view);view.setPadding(dp(12),dp(12),dp(12),dp(12));
        view.setMinHeight(dp(48));view.setGravity(Gravity.CENTER_VERTICAL|Gravity.START);
        view.setFocusable(true);view.setClickable(true);
        view.setBackground(new RippleDrawable(ColorStateList.valueOf(CaptionSettingsStyle.tint(CaptionSettingsStyle.primary(getContext()),24)),
                null,new android.graphics.drawable.ColorDrawable(android.graphics.Color.WHITE)));
    }
    private TextView action(LinearLayout parent,String label,Runnable click){
        TextView v=new TextView(getContext());styleAction(v);v.setText(label);v.setOnClickListener(w->click.run());
        parent.addView(v,new LinearLayout.LayoutParams(-1,-2));return v;
    }
    private void error(String key){Toast.makeText(getContext(),text(key),Toast.LENGTH_LONG).show();}
    private boolean flush(){if(ApiProfiles.flushCurrent())return true;error("profile_invalid_edits");return false;}
    private boolean current(ProfileRow row){
        return dialog!=null && dialog==listDialog && dialog.isShowing() && rows.get(row.id)==row
                && ApiProfiles.list(getContext()).containsKey(row.id);
    }
    private boolean dirty(){return renameEditor!=null && !renameOriginal.equals(renameEditor.getText().toString());}
    private boolean finishBeforeLeaving(){
        if(!dirty())return true;
        renameEditor.setError(text("profile_finish_name"));renameEditor.requestFocus();return false;
    }

    void showProfiles(){
        close();
        LinearLayout body=column();
        // show() disposes old state; populate afterwards so dismiss callbacks never invalidate new rows.
        show(text("profiles_title"),body,"cancel");
        listBody=body;listDialog=dialog;
        for(String id:ApiProfiles.list(getContext()).keySet())addRow(id);
        View divider=new View(getContext());divider.setBackgroundColor(CaptionSettingsStyle.tint(CaptionSettingsStyle.primary(getContext()),24));
        body.addView(divider,new LinearLayout.LayoutParams(-1,dp(1)));
        action(body,text("profile_add"),()->{if(finishBeforeLeaving() && flush())addProfile();});
        dialog.setOnKeyListener((d,key,event)->{
            if(key!=KeyEvent.KEYCODE_BACK || expanded==null)return false;
            if(event.getAction()==KeyEvent.ACTION_UP){
                if(!finishBeforeLeaving())return true;
                if(renameEditor!=null)showActions(expanded);else collapse();
            }
            return true;
        });
        refreshNames();
    }
    private void addRow(String id){
        ProfileRow row=new ProfileRow(id);rows.put(id,row);
        row.root.setTag("profile_row:"+id);row.more.setTag("profile_more:"+id);row.panel.setTag("profile_panel:"+id);
        row.header.setGravity(Gravity.CENTER_VERTICAL);styleAction(row.name);
        row.more.setScaleType(ImageView.ScaleType.CENTER);row.more.setPadding(0,0,0,0);
        row.more.setBackground(new RippleDrawable(ColorStateList.valueOf(CaptionSettingsStyle.tint(CaptionSettingsStyle.primary(getContext()),24)),
                null,new android.graphics.drawable.ColorDrawable(android.graphics.Color.WHITE)));
        row.header.addView(row.name,new LinearLayout.LayoutParams(0,-2,1));
        row.header.addView(row.more,new LinearLayout.LayoutParams(dp(48),dp(48)));
        row.root.addView(row.header,new LinearLayout.LayoutParams(-1,-2));
        row.panel.setPadding(dp(12),0,dp(12),dp(10));row.panel.setVisibility(View.GONE);
        row.root.addView(row.panel,new LinearLayout.LayoutParams(-1,-2));
        listBody.addView(row.root,new LinearLayout.LayoutParams(-1,-2));
        row.name.setOnClickListener(v->{
            if(!current(row) || !finishBeforeLeaving())return;
            if(ApiProfiles.select(getContext(),id))close();else error("profile_invalid_edits");
        });
        row.more.setOnClickListener(v->toggle(row));
        row.name.setOnLongClickListener(v->{toggle(row);return true;});
        row.name.setAccessibilityDelegate(new View.AccessibilityDelegate(){
            @Override public void onInitializeAccessibilityNodeInfo(View host,android.view.accessibility.AccessibilityNodeInfo info){
                super.onInitializeAccessibilityNodeInfo(host,info);
                info.addAction(new android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction(
                        android.view.accessibility.AccessibilityNodeInfo.ACTION_LONG_CLICK,text("profile_more")));
            }
        });
    }
    private void refreshNames(){
        Map<String,String> names=ApiProfiles.list(getContext());String active=ApiProfiles.active(getContext());
        for(ProfileRow row:rows.values()){
            String name=names.get(row.id);if(name==null)continue;
            boolean selected=row.id.equals(active);
            row.name.setText((selected?"✓  ":"    ")+name);row.name.setSelected(selected);
            row.name.setContentDescription(name+(selected?", "+text("profile_current"):""));
            row.more.setImageDrawable(ProfileActionStrip.icon(getContext(),row==expanded?4:3,CaptionSettingsStyle.primary(getContext())));
            row.more.setContentDescription(text(row==expanded?"profile_collapse":"profile_more")+": "+name);
        }
        notifyChanged();
    }
    private void toggle(ProfileRow row){
        if(!current(row) || !finishBeforeLeaving())return;
        if(expanded==row){collapse();return;}
        collapse();expanded=row;
        GradientDrawable bg=new GradientDrawable();bg.setCornerRadius(dp(10));
        bg.setColor(CaptionSettingsStyle.tint(CaptionSettingsStyle.primary(getContext()),5));row.root.setBackground(bg);row.root.setClipToOutline(true);
        row.panel.setVisibility(View.VISIBLE);showActions(row);refreshNames();
    }
    private void collapse(){
        endRename();
        if(expanded!=null){expanded.panel.removeAllViews();expanded.panel.setVisibility(View.GONE);expanded.root.setClipToOutline(false);expanded.root.setBackground(null);expanded=null;}
        refreshNames();
    }
    private void endRename(){
        EditText old=renameEditor;renameEditor=null;renameOriginal="";
        if(old!=null){
            if(old.hasFocus()){
                InputMethodManager ime=(InputMethodManager)getContext().getSystemService(Context.INPUT_METHOD_SERVICE);
                if(ime!=null)ime.hideSoftInputFromWindow(old.getWindowToken(),0);
            }
            old.clearFocus();
        }
        if(dialog!=null)dialog.setCanceledOnTouchOutside(true);
    }
    private ProfileActionStrip strip(ProfileRow row){
        ProfileActionStrip actions=new ProfileActionStrip(getContext());
        row.panel.addView(actions,new LinearLayout.LayoutParams(-1,-2));return actions;
    }
    private void reveal(ProfileRow row){
        row.panel.post(()->{if(current(row) && expanded==row)row.panel.requestRectangleOnScreen(new Rect(0,0,row.panel.getWidth(),row.panel.getHeight()),true);});
    }
    private void showActions(ProfileRow row){
        if(!current(row) || expanded!=row)return;
        endRename();row.panel.removeAllViews();
        ProfileActionStrip actions=strip(row);
        actions.add(text("profile_rename"),false,1,()->beginRename(row));
        if(ApiProfiles.list(getContext()).size()>1)actions.add(text("profile_delete"),true,2,()->beginDelete(row));
        else message(row.panel,text("profile_keep_one"));
        reveal(row);
    }
    private void beginRename(ProfileRow row){
        if(!current(row) || expanded!=row)return;
        row.panel.removeAllViews();
        EditText input=new InlineCaptionEditor(getContext());CaptionSettingsStyle.editor(input);
        input.setSingleLine(true);input.setHint(text("profile_name"));input.setContentDescription(text("profile_name"));
        input.setFilters(new android.text.InputFilter[]{new android.text.InputFilter.LengthFilter(60)});
        renameOriginal=ApiProfiles.list(getContext()).get(row.id);input.setText(renameOriginal);input.selectAll();
        renameEditor=input;row.panel.addView(input,new LinearLayout.LayoutParams(-1,-2));
        ProfileActionStrip actions=strip(row);actions.setPadding(0,dp(8),0,0);
        actions.add(text("cancel"),false,0,()->{if(current(row) && renameEditor==input)showActions(row);});
        Runnable save=()->{
            if(!current(row) || renameEditor!=input)return;
            String value=input.getText().toString().trim();
            if(value.isEmpty()){input.setError(text("profile_name_error"));return;}
            ApiProfiles.rename(getContext(),row.id,value);
            collapse();row.more.requestFocus();
        };
        actions.add(text("profile_save"),false,0,save);
        input.setImeOptions(android.view.inputmethod.EditorInfo.IME_ACTION_DONE);
        input.setOnEditorActionListener((v,id,event)->{if(id==android.view.inputmethod.EditorInfo.IME_ACTION_DONE){save.run();return true;}return false;});
        // Outside taps cannot silently throw away a name draft. Footer Cancel is explicit cancellation.
        dialog.setCanceledOnTouchOutside(false);
        input.post(()->{
            if(!current(row) || renameEditor!=input)return;
            input.requestFocus();
            InputMethodManager ime=(InputMethodManager)getContext().getSystemService(Context.INPUT_METHOD_SERVICE);
            if(ime!=null)ime.showSoftInput(input,InputMethodManager.SHOW_IMPLICIT);
        });
    }
    private String deletionContext(ProfileRow row){
        LinkedHashMap<String,String> names=ApiProfiles.list(getContext());
        String target=names.remove(row.id);
        return target+"\n"+ApiProfiles.active(getContext())+"\n"+names.toString();
    }
    private void beginDelete(ProfileRow row){
        if(!current(row) || expanded!=row)return;
        if(ApiProfiles.list(getContext()).size()<=1){showActions(row);return;}
        row.panel.removeAllViews();refreshNames();
        message(row.panel,text("profile_delete_inline"));
        if(row.id.equals(ApiProfiles.active(getContext()))){
            LinkedHashMap<String,String> remaining=ApiProfiles.list(getContext());remaining.remove(row.id);
            message(row.panel,text("profile_delete_switch")+" "+remaining.values().iterator().next());
        }
        final String confirmedContext=deletionContext(row);
        ProfileActionStrip actions=strip(row);
        actions.add(text("profile_keep"),false,0,()->{if(current(row))showActions(row);});
        actions.add(text("profile_confirm_delete"),true,2,()->{
            if(!current(row))return;
            if(ApiProfiles.list(getContext()).size()<=1){showActions(row);return;}
            // If another UI changed the name/active profile, show the updated consequence first.
            if(!confirmedContext.equals(deletionContext(row))){beginDelete(row);return;}
            ApiProfiles.delete(getContext(),row.id);
            expanded=null;listBody.removeView(row.root);rows.remove(row.id);refreshNames();
        });
        reveal(row);
    }

    private String defaultName(){
        Collection<String> names=ApiProfiles.list(getContext()).values();
        for(int n=1;;n++)if(!names.contains("API "+n))return "API "+n;
    }
    private void addProfile(){
        LinearLayout body=column();EditText name=new InlineCaptionEditor(getContext());
        CaptionSettingsStyle.editor(name);name.setSingleLine(true);name.setHint(text("profile_name"));
        name.setFilters(new android.text.InputFilter[]{new android.text.InputFilter.LengthFilter(60)});
        name.setText(defaultName());body.addView(name,new LinearLayout.LayoutParams(-1,-2));
        message(body,text("profile_new_summary"));
        action(body,text("profile_save"),()->{
            String value=name.getText().toString().trim();if(value.isEmpty())value=defaultName();
            try{
                if(!flush())return;
                String id=ApiProfiles.create(getContext(),value,DeepSeekConfig.DEFAULT_BASE_URL);
                if(!ApiProfiles.select(getContext(),id)){error("profile_invalid_edits");return;}
                close();
            }catch(IllegalArgumentException invalid){name.setError(text("profile_name_error"));}
            catch(IllegalStateException failed){error("profile_add_failed");}
        });
        show(text("profile_add"),body,"cancel");
    }
    void clearCurrentKey(){
        if(!ApiProfiles.flushExceptKey()){error("profile_invalid_edits");return;}
        final String id=ApiProfiles.active(getContext());String name=ApiProfiles.list(getContext()).get(id);
        LinearLayout body=column();message(body,text("profile_clear_key_summary"));
        action(body,text("profile_clear_key"),()->{ApiProfiles.clearKey(getContext(),id);close();});
        show(name,body,"cancel");
    }
    @Override protected void onPrepareForRemoval(){close();super.onPrepareForRemoval();}
}
