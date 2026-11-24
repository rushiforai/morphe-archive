package app.morphe.extension.chmate;

import java.util.*;

/** UI-independent grouping. Keys belong to native pages; this never closes a page. */
final class ThreadTabGroups {
    enum Display { TWO_ROWS, ONE_ROW }
    static final class Group {
        final String id;
        String name;
        int color;
        String active;
        final ArrayList<String> tabs = new ArrayList<>();
        Group(String id, String name, int color) {
            this.id=id; this.name=name; this.color=color;
        }
    }
    private final LinkedHashMap<String,Group> groups=new LinkedHashMap<>();
    private final ArrayList<String> order=new ArrayList<>();
    Display display=Display.TWO_ROWS;
    String expanded;

    List<String> order(){return Collections.unmodifiableList(new ArrayList<>(order));}
    List<Group> groups(){return Collections.unmodifiableList(new ArrayList<>(groups.values()));}
    Group owner(String tab){
        for(Group group:groups.values())if(group.tabs.contains(tab))return group;
        return null;
    }
    void reconcile(Collection<String> live){
        LinkedHashSet<String> unique=new LinkedHashSet<>(live);
        order.retainAll(unique);
        for(String key:unique)if(!order.contains(key))order.add(key);
        for(Iterator<Group> it=groups.values().iterator();it.hasNext();){
            Group group=it.next();group.tabs.retainAll(unique);
            if(group.tabs.isEmpty()){it.remove();continue;}
            if(!group.tabs.contains(group.active))group.active=group.tabs.get(0);
        }
    }
    Group create(Collection<String> members,String name){
        LinkedHashSet<String> unique=new LinkedHashSet<>(members);
        if(unique.isEmpty())throw new IllegalArgumentException("No tabs selected");
        for(String tab:unique)requireTab(tab);
        Group group=new Group(UUID.randomUUID().toString(),name==null||name.trim().isEmpty()?nextName():name.trim(),0xff1976d2);
        groups.put(group.id,group);
        for(String tab:unique)move(tab,group.id,group.tabs.size());
        return group;
    }
    Group merge(String source,String target){
        requireTab(source);requireTab(target);
        if(source.equals(target))return owner(target);
        Group destination=owner(target);
        if(destination==null){
            destination=new Group(UUID.randomUUID().toString(),nextName(),0xff1976d2);
            destination.tabs.add(target);destination.active=target;
            groups.put(destination.id,destination);
        }
        move(source,destination.id,destination.tabs.size());return destination;
    }
    void move(String tab,String groupId,int index){
        requireTab(tab);
        Group destination=groups.get(groupId);
        if(destination==null)throw new IllegalArgumentException("Unknown group");
        Group previous=owner(tab);
        if(previous!=null){
            previous.tabs.remove(tab);
            if(previous.tabs.isEmpty()&&previous!=destination)groups.remove(previous.id);
            if(tab.equals(previous.active))previous.active=previous.tabs.isEmpty()?null:previous.tabs.get(0);
        }
        destination.tabs.add(Math.max(0,Math.min(index,destination.tabs.size())),tab);
        destination.active=tab;
    }
    /** Called only on a completed outside drop, never on drag cancellation. */
    void detach(String tab){
        requireTab(tab);Group group=owner(tab);if(group==null)return;
        group.tabs.remove(tab);
        if(group.tabs.isEmpty())groups.remove(group.id);
        else if(tab.equals(group.active))group.active=group.tabs.get(0);
    }
    void ungroup(String id){groups.remove(id);}
    /** Merge membership, not nested containers; no native page is created or removed. */
    Group mergeGroups(String sourceId,String targetId){
        Group source=groups.get(sourceId),target=groups.get(targetId);
        if(source==null||target==null)throw new IllegalArgumentException("Unknown group");
        if(source==target)return source;
        Group merged=new Group(UUID.randomUUID().toString(),nextName(),target.color);
        merged.tabs.addAll(target.tabs);
        for(String tab:source.tabs)if(!merged.tabs.contains(tab))merged.tabs.add(tab);
        merged.active=target.active;
        LinkedHashMap<String,Group> next=new LinkedHashMap<>();
        for(Group group:groups.values()){
            if(group==target)next.put(merged.id,merged);
            else if(group!=source)next.put(group.id,group);
        }
        groups.clear();groups.putAll(next);return merged;
    }
    Group restore(String id,String name,int color,Collection<String> members,String active){
        if(groups.containsKey(id))throw new IllegalArgumentException("Duplicate group");
        Group group=new Group(id,name,color);groups.put(id,group);
        for(String tab:members)if(order.contains(tab)&&owner(tab)==null)group.tabs.add(tab);
        if(group.tabs.isEmpty()){groups.remove(id);return null;}
        group.active=group.tabs.contains(active)?active:group.tabs.get(0);return group;
    }
    void select(String tab){requireTab(tab);Group group=owner(tab);if(group!=null)group.active=tab;}
    boolean reorderMember(String source,String target){
        Group group=owner(source);
        if(group==null||group!=owner(target))return false;
        int from=group.tabs.indexOf(source),to=group.tabs.indexOf(target);
        if(from==to)return false;
        group.tabs.add(to,group.tabs.remove(from));
        return true;
    }

    boolean reorderTop(Object source,Object target){
        List<Object> blocks=new ArrayList<>();
        for(String key:order){
            Group group=owner(key);
            Object block=group==null?key:group;
            if(!blocks.contains(block))blocks.add(block);
        }
        int from=blocks.indexOf(source),to=blocks.indexOf(target);
        if(from<0||to<0||from==to)return false;
        blocks.add(to,blocks.remove(from));
        order.clear();
        for(Object block:blocks){
            if(block instanceof Group)order.addAll(((Group)block).tabs);
            else order.add((String)block);
        }
        return true;
    }

    void reorder(String tab,int index){
        requireTab(tab);order.remove(tab);order.add(Math.max(0,Math.min(index,order.size())),tab);
    }
    private void requireTab(String tab){if(!order.contains(tab))throw new IllegalArgumentException("Unknown tab");}
    private String nextName(){
        int n=1;Set<String> names=new HashSet<>();for(Group group:groups.values())names.add(group.name);
        while(names.contains("グループ"+n))n++;
        return "グループ"+n;
    }
}
