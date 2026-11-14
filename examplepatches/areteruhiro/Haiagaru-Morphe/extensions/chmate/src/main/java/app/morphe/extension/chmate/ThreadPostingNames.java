package app.morphe.extension.chmate;

import android.content.Context;
import android.content.SharedPreferences;
import android.text.Editable;
import android.text.TextWatcher;
import android.widget.EditText;
import java.lang.ref.WeakReference;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.WeakHashMap;

/** Private, opt-in thread names. Never copies a name into another thread or external app. */
final class ThreadPostingNames {
    static final String ENABLED="threadPostingNames";
    static final String PREFS="haiagaru_thread_posting_names";
    private static final WeakHashMap<EditText,Binding> bindings=new WeakHashMap<>();

    static String key(String url) {
        ThreadWatchRules.Target target=ThreadWatchRules.target(url);
        if(target==null)return null;
        try {
            byte[] digest=MessageDigest.getInstance("SHA-256").digest(target.url.getBytes(StandardCharsets.UTF_8));
            StringBuilder out=new StringBuilder("name_");
            for(byte b:digest)out.append(String.format(java.util.Locale.ROOT,"%02x",b&255));
            return out.toString();
        } catch(java.security.NoSuchAlgorithmException impossible) { throw new IllegalStateException(impossible); }
    }

    static void bind(EditText name,String url,boolean newThread) {
        if(name==null)return;
        String key=!newThread&&FeatureSwitches.enabled(ENABLED,false)?key(url):null;
        Binding old=bindings.get(name);
        if(old!=null&&old.key.equals(key))return;
        if(old!=null){name.removeTextChangedListener(old);bindings.remove(name);}
        if(key==null)return;
        SharedPreferences p=name.getContext().getSharedPreferences(PREFS,Context.MODE_PRIVATE);
        String saved=p.getString(key,"");
        if(!saved.contentEquals(name.getText())){name.setText(saved);name.setSelection(name.length());}
        Binding binding=new Binding(name,key,p);bindings.put(name,binding);name.addTextChangedListener(binding);
    }

    private static final class Binding implements TextWatcher {
        final WeakReference<EditText> name;final String key;final SharedPreferences prefs;
        Binding(EditText name,String key,SharedPreferences p){this.name=new WeakReference<>(name);this.key=key;prefs=p;}
        public void beforeTextChanged(CharSequence s,int start,int count,int after){}
        public void onTextChanged(CharSequence s,int start,int before,int count){}
        public void afterTextChanged(Editable text){
            if(name.get()!=null&&FeatureSwitches.enabled(ENABLED,false))prefs.edit().putString(key,text.toString()).apply();
        }
    }
    private ThreadPostingNames(){}
}
