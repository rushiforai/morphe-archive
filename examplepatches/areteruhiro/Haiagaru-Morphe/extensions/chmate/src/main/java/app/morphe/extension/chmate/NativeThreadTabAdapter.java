package app.morphe.extension.chmate;

import android.database.DataSetObserver;
import android.os.Bundle;
import android.view.*;
import android.widget.*;
import java.lang.reflect.*;
import java.util.*;

/** Projects groups onto ChMate's own tab views, preserving native page objects and IDs. */
final class NativeThreadTabAdapter extends BaseAdapter {
    private final ListAdapter nativeAdapter;
    private final ThreadTabGroups state;
    private final boolean old,middle;
    private final boolean membersOnly;
    private final ArrayList<Integer> positions=new ArrayList<>();
    private final ArrayList<String> keys=new ArrayList<>();
    private final Set<Integer> headers=new HashSet<>();
    private String expanded;
    private boolean disposed;
    private final Map<View,Object> viewItems=new WeakHashMap<>();
    private final DataSetObserver observer=new DataSetObserver(){
        public void onChanged(){rebuild();}
        public void onInvalidated(){positions.clear();keys.clear();notifyDataSetInvalidated();}
    };
    NativeThreadTabAdapter(ListAdapter nativeAdapter,ThreadTabGroups state,String version){
        this(nativeAdapter,state,version,false);
    }
    NativeThreadTabAdapter(ListAdapter nativeAdapter,ThreadTabGroups state,String version,boolean membersOnly){
        this.membersOnly=membersOnly;
        this.nativeAdapter=nativeAdapter;this.state=state;expanded=state.expanded;
        old=version.equals("0.8.10.191 dev");middle=version.equals("0.8.10.226 dev");
        if(!old&&!middle&&!version.equals("0.8.10.242 dev"))throw new IllegalArgumentException("Unsupported tab model");
        nativeAdapter.registerDataSetObserver(observer);rebuild();
    }
    void dispose(){if(disposed)return;disposed=true;nativeAdapter.unregisterDataSetObserver(observer);}
    void activate(){if(!disposed)return;disposed=false;nativeAdapter.registerDataSetObserver(observer);rebuild();}
    void rebuild(){
        keys.clear();positions.clear();headers.clear();List<String> live=new ArrayList<>();
        for(int i=0;i<nativeAdapter.getCount();i++){
            String key=key(nativeAdapter.getItem(i));keys.add(key);if(key!=null)live.add(key);
        }
        // A temporarily empty native restore must not erase persisted groups.
        if(!live.isEmpty())state.reconcile(live);
        if(membersOnly){
            for(ThreadTabGroups.Group group:state.groups())if(group.id.equals(expanded))
                for(String member:group.tabs){int index=keys.indexOf(member);if(index>=0)positions.add(index);}
            notifyDataSetChanged();return;
        }
        Set<String> emitted=new HashSet<>();
        Iterator<String> ordered=state.order().iterator();
        for(int slot=0;slot<keys.size();slot++){
            int i=keys.get(slot)==null?slot:ordered.hasNext()?keys.indexOf(ordered.next()):slot;
            if(i<0)continue;
            String key=keys.get(i);ThreadTabGroups.Group group=key==null?null:state.owner(key);
            if(group==null){positions.add(i);continue;}
            if(!emitted.add(group.id))continue;
            int active=keys.indexOf(group.active);headers.add(positions.size());positions.add(active>=0?active:i);
            if(state.display==ThreadTabGroups.Display.ONE_ROW&&group.id.equals(expanded))for(String member:group.tabs){int index=keys.indexOf(member);if(index>=0)positions.add(index);}
        }
        notifyDataSetChanged();
    }
    void expand(String groupId){expanded=groupId;if(!membersOnly)state.expanded=groupId;rebuild();}
    String expanded(){return expanded;}
    String pageKey(Object page){return key(page);}
    Object representative(Object page){
        String key=key(page);ThreadTabGroups.Group group=key==null?null:state.owner(key);
        if(group!=null&&(state.display==ThreadTabGroups.Display.TWO_ROWS||!group.id.equals(expanded)))return group;
        return page;
    }
    ThreadTabGroups.Group groupAt(int position){String key=keys.get(positions.get(position));return headers.contains(position)&&key!=null?state.owner(key):null;}
    public int getCount(){return positions.size();}
    public Object getItem(int position){ThreadTabGroups.Group group=groupAt(position);return group==null?nativeAdapter.getItem(positions.get(position)):group;}
    public long getItemId(int position){ThreadTabGroups.Group group=groupAt(position);return group==null?nativeAdapter.getItemId(positions.get(position)):UUID.fromString(group.id).getMostSignificantBits();}
    public boolean hasStableIds(){return false;}
    public boolean areAllItemsEnabled(){return nativeAdapter.areAllItemsEnabled();}
    public boolean isEnabled(int position){return nativeAdapter.isEnabled(positions.get(position));}
    public int getItemViewType(int position){return nativeAdapter.getItemViewType(positions.get(position));}
    public int getViewTypeCount(){return nativeAdapter.getViewTypeCount();}
    public View getView(int position,View reusable,ViewGroup parent){
        View view=nativeAdapter.getView(positions.get(position),reusable,parent);
        ThreadTabGroups.Group group=groupAt(position);
        if(group!=null)try{
            Method text=view.getClass().getMethod("setText",String.class);text.setAccessible(true);
            Method color=view.getClass().getMethod("setTextColor",int.class);color.setAccessible(true);color.invoke(view,group.color);
            text.invoke(view,group.name+(group.id.equals(expanded)?" ▾ ":" ▸ ")+group.tabs.size());
            view.setContentDescription(group.name+"、スレ"+group.tabs.size()+"件");
        }catch(Exception error){android.util.Log.w("Haiagaru","Native group label unavailable",error);}
        viewItems.put(view,getItem(position));
        return view;
    }
    Object hit(float x,float y){
        for(Map.Entry<View,Object> entry:viewItems.entrySet()){
            View view=entry.getKey();if(!view.isShown())continue;
            float left=view.getLeft(),top=view.getTop();
            if(x>=left+view.getWidth()*.25f&&x<=left+view.getWidth()*.75f&&y>=top&&y<top+view.getHeight())return entry.getValue();
        }
        return null;
    }
    private String key(Object page){
        if(page==null||page instanceof ThreadTabGroups.Group)return null;
        try{
            if(((Number)field(page,old?"i":middle?"o":"f")).intValue()!=2)return null;
            Bundle args=(Bundle)field(page,old?"d":middle?"f":"i");
            return args==null?null:args.getString("_data");
        }catch(ReflectiveOperationException error){throw new IllegalStateException("Native tab schema changed",error);}
    }
    private static Object field(Object owner,String name)throws ReflectiveOperationException{
        for(Class<?> type=owner.getClass();type!=null;type=type.getSuperclass())try{
            Field f=type.getDeclaredField(name);f.setAccessible(true);return f.get(owner);
        }catch(NoSuchFieldException ignored){}
        throw new NoSuchFieldException(name);
    }
}
