
package android.os;
public class Bundle extends java.util.HashMap<String,Object> {
  public void putBoolean(String k, boolean v) { put(k,v); }
  public boolean getBoolean(String k, boolean d) { return containsKey(k) ? (Boolean)get(k) : d; }
  public <T> T getParcelable(String k) { return (T)get(k); }
}
