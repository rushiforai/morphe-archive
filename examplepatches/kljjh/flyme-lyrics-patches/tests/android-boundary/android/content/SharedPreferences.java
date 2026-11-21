package android.content;
public class SharedPreferences {
    private final java.util.Map<String,Object> values = new java.util.HashMap<>();
    public int getInt(String key,int fallback){return (Integer)values.getOrDefault(key,fallback);}
    public boolean getBoolean(String key,boolean fallback){return (Boolean)values.getOrDefault(key,fallback);}
    public SharedPreferences edit(){return this;}
    public SharedPreferences putInt(String key,int value){values.put(key,value);return this;}
    public SharedPreferences putBoolean(String key,boolean value){values.put(key,value);return this;}
    public void apply(){}
}
