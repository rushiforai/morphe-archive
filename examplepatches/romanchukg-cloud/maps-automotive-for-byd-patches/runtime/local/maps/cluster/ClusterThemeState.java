// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/** Independent, timestamp-ordered reducer of four allowlisted lifecycle signals; no Android/I/O. */
public final class ClusterThemeState {
    public static final String FULL="com.byd.automap.meter.MeterActivity",MINI="com.byd.automap.meter.MeterSmallScreenActivity";
    public static final String SCENARIO="com.byd.sr.cluster.ClusterActivity",SIMPLE="com.byd.cluster.SimpleClusterDynastyActivity";
    private static final int LIMIT=1024;
    private final Map<Key,Entry> entries=new HashMap<>();
    private long resetAt=Long.MIN_VALUE;
    private String failure="no_stock_history";
    private boolean overflow;
    public static final class Snapshot {
        public final DiLink51Profile.Theme theme;
        public final boolean mapVisible,smallWindow,reliable;
        public final String reason;
        public Snapshot(DiLink51Profile.Theme theme,boolean mapVisible,boolean smallWindow,boolean reliable,String reason){
            this.reliable=reliable;this.theme=reliable&&theme!=null?theme:DiLink51Profile.Theme.UNKNOWN;
            this.mapVisible=reliable&&mapVisible;this.smallWindow=this.mapVisible&&smallWindow;
            this.reason=token(reason);
        }
    }
    public static Snapshot unknown(String reason){return new Snapshot(DiLink51Profile.Theme.UNKNOWN,false,false,false,reason);}
    private static String token(String reason){return reason!=null&&reason.matches("[a-z][a-z0-9_]{0,63}")?reason:"unavailable";}
    public void clear(String reason){entries.clear();resetAt=Long.MIN_VALUE;overflow=false;failure=token(reason);}
    public static boolean accepted(String pkg,String cls){
        if("com.byd.launchermap".equals(pkg)||"com.byd.automap".equals(pkg))return FULL.equals(cls)||MINI.equals(cls);
        return "com.byd.sr".equals(pkg)&&SCENARIO.equals(cls)||"com.byd.cluster".equals(pkg)&&SIMPLE.equals(cls);
    }
    private static final class Key {
        final String pkg,cls;final int instance;
        Key(String pkg,String cls,int instance){this.pkg=pkg;this.cls=cls;this.instance=instance;}
        @Override public boolean equals(Object value){if(!(value instanceof Key))return false;Key other=(Key)value;return instance==other.instance&&pkg.equals(other.pkg)&&cls.equals(other.cls);}
        @Override public int hashCode(){return (pkg.hashCode()*31+cls.hashCode())*31+instance;}
    }
    private static final class Entry {long time;int type;boolean ambiguous;Entry(long time,int type,boolean ambiguous){this.time=time;this.type=type;this.ambiguous=ambiguous;}}
    /** instance0 means unavailable. Valid nonzero instance identifiers may be signed. */
    public void event(String pkg,String cls,int instance,int type,long time){
        if(overflow||time<0)return;
        if(type==26||type==27){
            if(time<resetAt)return;resetAt=time;
            for(Iterator<Entry> it=entries.values().iterator();it.hasNext();)if(it.next().time<=time)it.remove();
            failure="runtime_reset";return;
        }
        if(!accepted(pkg,cls)||(type!=1&&type!=23)||time<=resetAt)return;
        Key key=new Key(pkg,cls,instance);Entry old=entries.get(key);
        if(old!=null){
            if(time<old.time)return; // A late RESUME cannot resurrect a newer STOP tombstone.
            if(time==old.time){if(type!=old.type)old.ambiguous=true;return;}
            // No instance getter: another RESUME may be an overlapping incarnation.
            boolean ambiguous=instance==0&&type==1&&old.type==1;
            entries.put(key,new Entry(time,type,ambiguous));return;
        }
        if(entries.size()>=LIMIT){entries.clear();overflow=true;failure="event_capacity";return;}
        entries.put(key,new Entry(time,type,false));
    }
    private static DiLink51Profile.Theme theme(String cls){
        if(FULL.equals(cls))return DiLink51Profile.Theme.MAP;
        if(SCENARIO.equals(cls))return DiLink51Profile.Theme.SCENARIO;
        if(SIMPLE.equals(cls))return DiLink51Profile.Theme.SIMPLE;
        return DiLink51Profile.Theme.UNKNOWN;
    }
    public Snapshot snapshot(){
        if(overflow)return unknown(failure);
        DiLink51Profile.Theme selected=DiLink51Profile.Theme.UNKNOWN;long themeAt=Long.MIN_VALUE,mapAt=Long.MIN_VALUE;
        boolean mini=false,small=false,themeTie=false,mapTie=false;long ambiguousTheme=Long.MIN_VALUE,ambiguousMap=Long.MIN_VALUE;
        for(Map.Entry<Key,Entry> pair:entries.entrySet()){
            Key key=pair.getKey();Entry entry=pair.getValue();DiLink51Profile.Theme candidate=theme(key.cls);
            boolean map=FULL.equals(key.cls)||MINI.equals(key.cls);
            if(entry.ambiguous){if(candidate!=DiLink51Profile.Theme.UNKNOWN)ambiguousTheme=Math.max(ambiguousTheme,entry.time);if(map)ambiguousMap=Math.max(ambiguousMap,entry.time);continue;}
            if(entry.type!=1)continue;
            if(candidate!=DiLink51Profile.Theme.UNKNOWN){
                if(entry.time>themeAt){selected=candidate;themeAt=entry.time;themeTie=false;}
                else if(entry.time==themeAt&&selected!=candidate)themeTie=true;
            }
            if(MINI.equals(key.cls))mini=true;
            if(map){boolean candidateSmall=MINI.equals(key.cls);if(entry.time>mapAt){mapAt=entry.time;small=candidateSmall;mapTie=false;}else if(entry.time==mapAt&&small!=candidateSmall)mapTie=true;}
        }
        if(themeTie||mapTie||ambiguousTheme>=themeAt&&ambiguousTheme!=Long.MIN_VALUE||ambiguousMap>=mapAt&&ambiguousMap!=Long.MIN_VALUE)return unknown("event_order_ambiguous");
        if(selected==DiLink51Profile.Theme.UNKNOWN&&!mini)return unknown(failure);
        return new Snapshot(selected,selected==DiLink51Profile.Theme.MAP||mini,small,true,selected==DiLink51Profile.Theme.UNKNOWN?"mini_without_theme":"observed");
    }
}
