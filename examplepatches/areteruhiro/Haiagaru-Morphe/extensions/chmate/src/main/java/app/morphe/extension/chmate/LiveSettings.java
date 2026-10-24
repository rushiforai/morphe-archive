package app.morphe.extension.chmate;

import android.content.Context;
import android.content.SharedPreferences;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.widget.AdapterView;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Switch;

/** Saves user edits only; initial selection/layout callbacks never write preferences. */
final class LiveSettings {
    static final class Toggle extends Switch {
        private android.widget.CompoundButton.OnCheckedChangeListener external;
        Runnable changed;
        Toggle(Context c) {
            super(c);
            super.setOnCheckedChangeListener((v,on)->{if(external!=null)external.onCheckedChanged(v,on);if(changed!=null)changed.run();});
        }
        @Override public void setOnCheckedChangeListener(android.widget.CompoundButton.OnCheckedChangeListener l){external=l;}
    }
    static final class Choice extends Spinner {
        private AdapterView.OnItemSelectedListener external;
        Runnable changed;
        Choice(Context c) {
            super(c);
            super.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){
                public void onItemSelected(AdapterView<?> p,View v,int pos,long id){if(external!=null)external.onItemSelected(p,v,pos,id);if(changed!=null)changed.run();}
                public void onNothingSelected(AdapterView<?> p){if(external!=null)external.onNothingSelected(p);}
            });
        }
        @Override public void setOnItemSelectedListener(AdapterView.OnItemSelectedListener l){external=l;}
    }
    private final SharedPreferences prefs;
    private final Runnable refreshed;
    LiveSettings(SharedPreferences p,Runnable refreshed){this.prefs=p;this.refreshed=refreshed;}
    void toggle(Switch v,String key){toggle(v,key,null);}
    void toggle(Switch v,String key,Runnable effect){
        if(v==null)return;
        if(prefs==SettingsProfiles.prefs(v.getContext())){SettingsProfiles.booleanKey(key);SettingsProfiles.defaultValue(key,v.isChecked());}
        final boolean[] previous={v.isChecked()};
        ((Toggle)v).changed=()->{boolean value=v.isChecked();if(previous[0]==value)return;previous[0]=value;
            prefs.edit().putBoolean(key,value).apply();if(effect!=null)effect.run();refreshed.run();SettingsEffects.changed(v.getContext(),key,value);};
    }
    void choice(Spinner v,String key){choice(v,key,i->i);}
    interface NumberValue { int value(int position); }
    void choice(Spinner v,String key,NumberValue value){
        if(v!=null&&prefs==SettingsProfiles.prefs(v.getContext())){java.util.Set<Integer> allowed=new java.util.HashSet<>();for(int i=0;i<v.getCount();i++)allowed.add(value.value(i));SettingsProfiles.choiceKey(key,allowed);SettingsProfiles.defaultValue(key,value.value(v.getSelectedItemPosition()));}
        choice(v,()->prefs.edit().putInt(key,value.value(v.getSelectedItemPosition())).apply());
    }
    void choice(Spinner v,Runnable save){
        if(v==null)return;
        final int[] previous={v.getSelectedItemPosition()};
        ((Choice)v).changed=()->{int position=v.getSelectedItemPosition();if(position==previous[0])return;previous[0]=position;save.run();refreshed.run();};
    }
    static void watch(EditText v,Runnable save){
        if(v==null)return;
        v.addTextChangedListener(new TextWatcher(){
            public void beforeTextChanged(CharSequence s,int st,int count,int after){}
            public void onTextChanged(CharSequence s,int st,int before,int count){save.run();}
            public void afterTextChanged(Editable e){}
        });
    }
    void string(EditText v,String key){watch(v,()->{prefs.edit().putString(key,v.getText().toString().trim()).apply();refreshed.run();});}
    void number(EditText v,String key,int min,int max){watch(v,()->{
        try{int value=Integer.parseInt(v.getText().toString().trim());if(value<min||value>max)throw new NumberFormatException();
            v.setError(null);prefs.edit().putInt(key,value).apply();refreshed.run();
        }catch(NumberFormatException e){v.setError(min+"〜"+max);}
    });if(v!=null&&prefs==SettingsProfiles.prefs(v.getContext()))SettingsProfiles.numberKey(key,min,max);}
}
