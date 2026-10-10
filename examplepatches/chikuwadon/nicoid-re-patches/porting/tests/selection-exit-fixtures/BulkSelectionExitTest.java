import java.util.ArrayList;
import e.e.a.BulkSelection;
public class BulkSelectionExitTest {
 public static class Row {
  public boolean selected;public String title;
  public Row(String title,boolean value){this.title=title;selected=value;}
  public Object a(String key){return key.equals("isselect")?selected:title;}
  public void a(String key,Object value){if(key.equals("isselect"))selected=(Boolean)value;}
 }
 public static class Fragment {
  public boolean k0=false;public ArrayList<Object> a0=new ArrayList<>();public android.widget.BaseAdapter p0=new android.widget.BaseAdapter();public android.widget.TextView selectionCount;
  public void updateSelectionCount() {}
 }
 public static void main(String[] args){
  Fragment f=new Fragment();Row first=new Row("first",true),second=new Row("second",true);f.a0.add(first);f.a0.add(second);
  BulkSelection.modeChanged(f);
  if(first.selected||second.selected||f.p0.notifications!=1||f.a0.size()!=2||!first.title.equals("first"))throw new AssertionError("Fragment back leaves selection behind");
  first.selected=true;BulkSelection.modeChanged(f);if(first.selected||f.p0.notifications!=2)throw new AssertionError("Repeated fragment exit failed");
  com.sauzask.nicoid.NicoidCacheManagerActivity cache=new com.sauzask.nicoid.NicoidCacheManagerActivity();Row cached=new Row("cache",true);cache.z.add(cached);BulkSelection.modeChanged(cache);
  if(cached.selected||cache.C.notifications!=1||cache.z.size()!=1)throw new AssertionError("Cache back leaves selection behind");
  System.out.println("Selection exit regression: history/mylist and cache flags cleared, rows retained and adapter refreshed");
 }
}
