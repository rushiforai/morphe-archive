package software.santodan.extension.nuviomenu;

import software.santodan.nuvio.NuvioNative;
import java.util.*;
import java.lang.reflect.*;
import static software.santodan.extension.nuviomenu.NuvioDateLabelStyle.*;

/** Per-label sessions reuse the date editor's native color dialog, controls, nodes and preview. */
public final class NuvioLabelsEditor {
    private static final String STATE="label-editor:";
    private static volatile Session session;
    private NuvioLabelsEditor() {}
    private static final class Session {
        final ClassLoader loader; final Map<String,LabelCustomization.Draft> drafts=new LinkedHashMap<>();
        String label="new_season",modal="",copySource="",error=""; int target=2,epoch=1;
        Object text,focus,focused; final Object open,revision,expanded;
        final float dialogWidth,leftWidth,rightWidth,panelHeight;
        Session(ClassLoader loader,Object composer) throws Exception {
            this.loader=loader;
            String configuration=NuvioNative.REF_LABEL_CONFIGURATION;
            Object key=staticValue(loader,referenceOwner(configuration),referenceField(configuration));
            android.content.res.Configuration config=(android.content.res.Configuration)method(composer.getClass(),"j",1).invoke(composer,key);
            dialogWidth=Math.max(320f,config.screenWidthDp-48f);
            leftWidth=(dialogWidth-32f-24f)*0.56f;rightWidth=dialogWidth-32f-24f-leftWidth;
            panelHeight=Math.max(220f,config.screenHeightDp-144f);
            android.util.Log.d("SantodanLabels","mockup-layout-v1 active="+config.screenWidthDp+"x"+config.screenHeightDp+" dialog="+dialogWidth+" controls="+leftWidth+" viewport="+panelHeight);
            open=state(loader,STATE+"open",false);revision=state(loader,STATE+"revision",0);expanded=state(loader,STATE+"expanded",false);
            set(open,true);newPreviewSample();
        }
        LabelCustomization.Draft draft(String id) throws Exception {
            LabelCustomization.Draft value=drafts.get(id);if(value==null){value=NuvioLabelStyles.draft(id);drafts.put(id,value);}return value;
        }
        LabelCustomization.Draft draft() throws Exception {return draft(label);}
        void changed(boolean recreate) throws Exception {if(recreate)epoch++;set(revision,((Number)get(revision)).intValue()+1);}
        void capture(Object model) throws Exception {
            int rgb=((Number)invokeReferenceInstance(model,NuvioNative.REF_DATE_CUSTOM_COLOR_GET)).intValue();
            long current=draft().color(target==2);
            if((current&0x00ffffff00000000L)!=((long)(rgb&0xffffff)<<32))draft().set(target==2?"background_color":"foreground_color",(current&0xff00000000000000L)|((long)(rgb&0xffffff)<<32));
        }
        void close() throws Exception {modal="";set(open,false);session=null;changed(false);}
    }
    static Object invokeReferenceInstance(Object object,String reference) throws Exception {return method(object.getClass(),referenceName(reference),0).invoke(object);}
    private static Object click(Session s,Action action) throws Exception {return callback(s.loader,"Function0",args->{action.run();return unit(s.loader);});}
    interface Action {void run() throws Exception;}
    private static void button(Session s,Object composer,String title,Action action) throws Exception {
        invokeReference(s.loader,NuvioNative.REF_SETTINGS_ROWS_D,title,click(s,action),false,true,composer,0,0);
    }
    public static void renderSettings(Object composer) throws Exception {
        if(!NuvioLabelStyles.available())return;
        ClassLoader loader=composer.getClass().getClassLoader();
        Object enabled=state(loader,STATE+"enabled",NuvioLabelStyles.prefs().getBoolean("enabled",false));
        Object toggle=callback(loader,"Function0",args->{boolean value=!(Boolean)get(enabled);set(enabled,value);NuvioLabelStyles.prefs().edit().putBoolean("enabled",value).apply();NuvioLabelStyles.changed(loader);return unit(loader);});
        Object noop=callback(loader,"Function0",args->unit(loader));
        invokeReference(loader,NuvioNative.REF_SETTINGS_ROWS_M,"Enable label customizations","Use your saved text and appearance for Nuvio's badges.",get(enabled),toggle,
            staticValue(loader,NuvioNative.EMPTY_MODIFIER_NAME,"b"),noop,true,null,0L,false,composer,0,0);
        Object open=callback(loader,"Function0",args->{NuvioLabelStyles.invalidate();session=new Session(loader,composer);return unit(loader);});
        invokeReference(loader,NuvioNative.REF_SETTINGS_ROWS_A,"Label customization","Choose a label, edit it, copy another style, or reset just that label.",null,
            open,null,noop,true,null,null,0L,null,null,0f,0L,composer,0,0,16336);
        get(state(loader,STATE+"open",false));
        Session s=session;if(s==null)return;
        get(s.revision);
        Object body=loader.loadClass(NuvioNative.COMPOSABLE_LAMBDA_NAME).getDeclaredConstructor(int.class,Object.class,boolean.class).newInstance(0x534c574e,
            callback(loader,"Function3",args->{window(s,args[1]);return unit(loader);}),true);
        invokeReference(loader,NuvioNative.REF_LIBRARY_CONTENT_Z,click(s,s::close),"",null,s.dialogWidth,0,false,false,null,null,
            0f,0f,16f,0f,null,body,composer,0,24576,14224);
        renderModal(s,composer);
    }
    /** Mockup layout: fixed selectors above left scrolling controls, full-height preview on the right. */
    private static void window(Session s,Object composer) throws Exception {
        get(s.revision);
        Object empty=staticValue(s.loader,NuvioNative.EMPTY_MODIFIER_NAME,"b");
        Object alignment=staticValue(s.loader,"w1.b","j");
        Object row=invokeReference(s.loader,NuvioNative.REF_DATE_ROW_POLICY,invokeReference(s.loader,NuvioNative.REF_DATE_SPACED_BY,24f),alignment,composer,0);
        node(composer,empty,row,()->{
            Object left=invokeReference(s.loader,NuvioNative.REF_LABEL_WIDTH,empty,s.leftWidth);
            left=invokeReference(s.loader,NuvioNative.REF_DATE_PREVIEW_HEIGHT,left,s.panelHeight);
            column(composer,left,10f,()->{
                LabelCustomization.Draft draft=s.draft();int rgb=(int)(draft.color(s.target==2)>>>32)&0xffffff;
                Object model=s.loader.loadClass(referenceOwner(NuvioNative.REF_DATE_CUSTOM_COLOR_INIT)).getDeclaredConstructor(int.class,int.class,int.class).newInstance(rgb,rgb,rgb);
                header(s,model,composer);
                Object scroll=invokeReference(s.loader,NuvioNative.REF_LABEL_COLUMN_WEIGHT,staticValue(s.loader,"d0.b0","a"),empty);
                scroll=invokeReference(s.loader,NuvioNative.REF_DATE_SCROLL,scroll,invokeReference(s.loader,NuvioNative.REF_DATE_SCROLL_STATE,composer),true);
                column(composer,scroll,10f,()->{
                    if(s.focus==null)s.focus=s.loader.loadClass(NuvioNative.FOCUS_REQUESTER_NAME).getDeclaredConstructor().newInstance();
                    Object change=callback(s.loader,"Function1",args->{long color=draft.color(s.target==2);draft.set(s.target==2?"background_color":"foreground_color",(color&0xff00000000000000L)|((((Number)args[0]).longValue()&0xffffffL)<<32));s.changed(false);return unit(s.loader);});
                    method(composer.getClass(),"d0",1).invoke(composer,0x534c5000+s.epoch);
                    try {invokeReference(s.loader,NuvioNative.REF_LABEL_RGB_PICKER,rgb,0,change,s.focus,empty,composer,3072);}
                    finally {method(composer.getClass(),"p",1).invoke(composer,false);}
                    controls(s,model,composer);
                });
            });
            Object right=invokeReference(s.loader,NuvioNative.REF_LABEL_WIDTH,empty,s.rightWidth);
            right=invokeReference(s.loader,NuvioNative.REF_DATE_PREVIEW_HEIGHT,right,s.panelHeight);
            LabelCustomization.Draft draft=s.draft();
            renderSamplePreviewSized(right,composer,draft.color(true),draft.color(false),draft.size(true),draft.size(false),draft.position(),draft.caption(),s.rightWidth,s.panelHeight);
        });
        node(composer,empty,row,()->{
            button(s,composer,"Apply",()->{NuvioLabelStyles.save(s.drafts.values());NuvioLabelStyles.changed(s.loader);s.close();});
            button(s,composer,"Cancel",s::close);
        });
    }
    /** Called by the existing shared editor hooks; absent/inactive labels never intercept date/theme editors. */
    public static boolean dispatch(String name,Object[] args) throws Exception {
        Session s=session;if(s==null)return false;
        if(name.equals("active"))return true;
        if(name.equals("renderEditorTargetRow")){header(s,args[0],args[1]);return true;}
        if(name.equals("renderEditorControls")){controls(s,args[0],args[1]);return true;}
        if(name.equals("renderEditorPreview")) {
            Object model=args[0],composer=args[2];LabelCustomization.Draft draft=s.draft();
            long original=draft.color(s.target==2);
            long live=(original&0xff00000000000000L)|(((Number)invokeReferenceInstance(model,NuvioNative.REF_DATE_CUSTOM_COLOR_GET)).longValue()&0xffffffL)<<32;
            return renderSamplePreview(args[1],composer,s.target==2?live:draft.color(true),s.target==4?live:draft.color(false),
                draft.size(true),draft.size(false),draft.position(),draft.caption());
        }
        return false;
    }
    private static void header(Session s,Object model,Object composer) throws Exception {
        Map<String,String> labels=NuvioLabelStyles.labels();
        List<Object> options=new ArrayList<>();Constructor<?> option=s.loader.loadClass(NuvioNative.DROPDOWN_OPTION_NAME).getDeclaredConstructor(String.class,String.class);
        labels.forEach((id,title)->{try{options.add(option.newInstance(title,id));}catch(ReflectiveOperationException failure){throw new IllegalStateException(failure);}});
        Object expand=callback(s.loader,"Function1",args->{set(s.expanded,args[0]);return unit(s.loader);});
        Object choose=callback(s.loader,"Function1",args->{String id=(String)field(args[0].getClass(),"b").get(args[0]);
            if(labels.containsKey(id)){s.capture(model);s.label=id;set(s.expanded,false);s.changed(true);}return unit(s.loader);});
        Object alignment=field(s.loader.loadClass(referenceOwner(NuvioNative.REF_DATE_ROW_ALIGNMENT)),referenceField(NuvioNative.REF_DATE_ROW_ALIGNMENT)).get(null);
        Object policy=invokeReference(s.loader,NuvioNative.REF_DATE_ROW_POLICY,invokeReference(s.loader,NuvioNative.REF_DATE_SPACED_BY,12f),alignment,composer,0);
        node(composer,staticValue(s.loader,NuvioNative.EMPTY_MODIFIER_NAME,"b"),policy,()->{
            Object dropdown=invokeReference(s.loader,NuvioNative.REF_LABEL_WIDTH,staticValue(s.loader,NuvioNative.EMPTY_MODIFIER_NAME,"b"),s.leftWidth*0.55f);
            invokeReference(s.loader,NuvioNative.REF_DROPDOWN_B,dropdown,"Label",labels.get(s.label),s.label,
                get(s.expanded),options,expand,choose,false,composer,0);
            button(s,composer,"Text",()->{s.capture(model);if(s.target!=4){s.target=4;s.changed(true);}});
            button(s,composer,"Label",()->{s.capture(model);if(s.target!=2){s.target=2;s.changed(true);}});
        });
        caption(composer,s.target==2?"Editing: Label":"Editing: Text");
    }
    private static void controls(Session s,Object model,Object composer) throws Exception {
        LabelCustomization.Draft draft=s.draft();boolean background=s.target==2;
        Object modifier=staticValue(s.loader,NuvioNative.EMPTY_MODIFIER_NAME,"b");
        column(composer,modifier,10f,()->{
            int opacity=Math.round((draft.color(background)>>>56)*100f/255f),size=draft.size(background);
            Object alpha=callback(s.loader,"Function1",args->{int percent=Math.max(0,Math.min(100,((Number)args[0]).intValue()));
                draft.set(background?"background_color":"foreground_color",(draft.color(background)&0x00ffffff00000000L)|((long)Math.round(percent*255f/100f)<<56));s.changed(false);return unit(s.loader);});
            Object scale=callback(s.loader,"Function1",args->{draft.set(background?"size_percent":"font_size_percent",((Number)args[0]).intValue());s.changed(false);return unit(s.loader);});
            Object noop=click(s,()->{}),empty=staticValue(s.loader,NuvioNative.EMPTY_MODIFIER_NAME,"b");
            invokeReference(s.loader,NuvioNative.REF_DATE_PERCENT_ROW,background?"Label opacity":"Font opacity",opacity,opacity+"%",0,100,1,alpha,null,noop,true,empty,composer,0,128);
            invokeReference(s.loader,NuvioNative.REF_DATE_PERCENT_ROW,background?"Label size":"Font size",size,size+"%",50,200,10,scale,null,noop,true,empty,composer,0,128);
            button(s,composer,"Label text",()->{
                s.capture(model);s.text=state(s.loader,STATE+"text",draft.textOverride());set(s.text,draft.textOverride());
                s.focus=s.loader.loadClass(NuvioNative.FOCUS_REQUESTER_NAME).getDeclaredConstructor().newInstance();
                s.focused=state(s.loader,STATE+"focused",false);s.error="";s.modal="text";s.changed(false);
            });
            button(s,composer,"Copy from another label",()->{s.capture(model);s.modal="copy_source";s.changed(false);});
            button(s,composer,"Label position",()->{s.capture(model);s.modal="position";s.changed(false);});
            button(s,composer,"Reset label",()->{draft.reset();s.changed(true);});
        });
    }
    private static void picker(Session s,Object composer,String title,Map<String,String> values,Selection selection) throws Exception {
        List<Object> options=new ArrayList<>();
        Constructor<?> option=Arrays.stream(s.loader.loadClass(NuvioNative.SETTINGS_PICKER_NAME).getDeclaredConstructors()).filter(c->c.getParameterCount()==6).findFirst().orElseThrow();
        option.setAccessible(true);for(var entry:values.entrySet())options.add(option.newInstance(entry.getKey(),entry.getValue(),null,null,null,28));
        Object choose=callback(s.loader,"Function1",args->{String value=String.valueOf(args[0]);if(values.containsKey(value))selection.choose(value);return unit(s.loader);});
        invokeReference(s.loader,NuvioNative.REF_SETTINGS_ROWS_J,title,options,"",choose,click(s,()->{s.modal="";s.changed(false);}),null,480f,360f,composer,0,32);
    }
    private interface Selection {void choose(String value) throws Exception;}
    private static void renderModal(Session s,Object composer) throws Exception {
        if(s.modal.equals("copy_source")) {
            Map<String,String> labels=NuvioLabelStyles.labels();labels.remove(s.label);
            picker(s,composer,"Copy from another label",labels,value->{s.copySource=value;s.modal="copy_part";s.changed(false);});
        } else if(s.modal.equals("copy_part")) {
            Map<String,String> parts=new LinkedHashMap<>();parts.put("TEXT","Text (caption and text appearance)");parts.put("LABEL","Label (background, size and position)");parts.put("ALL","All");
            picker(s,composer,"What to copy",parts,value->{s.draft().copyFrom(s.draft(s.copySource),LabelCustomization.Copy.valueOf(value));s.modal="";s.changed(true);});
        } else if(s.modal.equals("position")) {
            Map<String,String> positions=new LinkedHashMap<>();for(int i=0;i<DateLabelStyle.POSITIONS.length;i++)positions.put(Integer.toString(i),DateLabelStyle.POSITIONS[i]);
            picker(s,composer,"Label position",positions,value->{s.draft().set("position",Integer.valueOf(value));s.modal="";s.changed(false);});
        } else if(s.modal.equals("text")) {
            Object body=s.loader.loadClass(NuvioNative.COMPOSABLE_LAMBDA_NAME).getDeclaredConstructor(int.class,Object.class,boolean.class).newInstance(0x534c5458,
                callback(s.loader,"Function3",args->{Object nested=args[1];
                    NuvioLabelTextInput.render(nested,s.text,s.focus,s.focused);
                    if(!s.error.isEmpty())caption(nested,s.error);
                    button(s,nested,"Apply text",()->{try{s.draft().set("text",get(s.text));s.modal="";s.changed(false);}catch(IllegalArgumentException invalid){s.error=invalid.getMessage();s.changed(false);}});
                    button(s,nested,"Use original text",()->{s.draft().set("text","");s.modal="";s.changed(false);});
                    button(s,nested,"Cancel",()->{s.modal="";s.changed(false);});return unit(s.loader);}),true);
            invokeReference(s.loader,NuvioNative.REF_LIBRARY_CONTENT_Z,click(s,()->{s.modal="";s.changed(false);}),"Label text",
                "Leave empty for the original text. Use {value} to include the original label value.",640f,0,false,false,null,null,0f,0f,0f,0f,null,body,composer,0,24576,16336);
        }
    }
    /** Replaces the API-key-only decoration while reusing the native single-line field and keyboard behavior. */
    public static Object textDecoration(Object original) throws Exception {
        Session s=session;if(s==null||!s.modal.equals("text"))return original;
        return callback(s.loader,"Function3",args->{s.loader.loadClass("kotlin.jvm.functions.Function2").getMethod("invoke",Object.class,Object.class).invoke(args[0],args[1],0);return unit(s.loader);});
    }
}
