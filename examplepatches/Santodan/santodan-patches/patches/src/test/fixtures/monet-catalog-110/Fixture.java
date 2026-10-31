import a.*;
import java.util.*;
import android.content.Context;
import android.os.Handler;
import software.santodan.extension.monetchannels.*;

public class Fixture {
    static final String OWNER="com.nuvio.santodan";
    static final Context context=new Context();
    static void check(boolean ok,String message) { if(!ok)throw new AssertionError(message); }
    static String[] channel(long id,String key,String title) { return new String[]{Long.toString(id),OWNER,"santodan-launcher/"+key,title,"TYPE_PREVIEW"}; }
    static List<vs0> items(String selected) { return (List<vs0>)(List<?>)MonetCatalogChannels.rowItems(new ArrayList<>(),selected); }
    static String label(Object choice) { return (String)f24.label.e(choice,new jw1(),0); }
    static j83 picker(wv0 row,Object selected,boolean nativeEmpty) {
        List<Object> options=new ArrayList<>();
        if(!nativeEmpty) {
            for(vv0 mode:vv0.values())options.add(new wr4(mode));
            for(String[] entry:context.resolver.rows)options.add(new vr4(new ip4(entry[2],entry[3],Long.parseLong(entry[0]))));
        }
        lv1 names=(value,composer,flags)->{
            if(!(value instanceof xr4))throw new AssertionError("Native primary received synthetic ID");
            return value instanceof wr4?((wr4)value).a.name():((vr4)value).a.b;
        };
        lv1 secondary=(value,composer,flags)->{check(value instanceof xr4,"Native secondary received synthetic ID");return "native details";};
        wu1 action=value->{check(value instanceof xr4,"Native auxiliary callback received synthetic ID");return Boolean.TRUE;};
        wu1 key=value->{check(value instanceof xr4,"Native key extractor received synthetic ID");return ((xr4)value).a();};
        j83 callback=new j83();
        int queries=context.resolver.queries;
        MonetCatalogChannels.preparePicker(row);
        MonetCatalogChannels.contentPicker110("Content","",options,selected,names,true,secondary,key,action,
            Set.of(),Set.of(),null,callback,(uu1)()->null,new jw1(),11,22,3872);
        check(context.resolver.queries==queries,"Composition queried TvProvider");
        check(f24.defaults==3872,"Native default mask changed");
        return callback;
    }
    static String catalog(String name) {
        for(Object choice:f24.choices)if(choice instanceof String&&label(choice).equals(name))return (String)choice;
        throw new AssertionError("Missing catalog "+name);
    }
    public static void run() {
        NativeLayout.modern=true;
        context.resolver.rows.add(channel(1,"action","Action"));context.resolver.rows.add(channel(2,"drama","Drama"));
        vt5.channels.put(1L,List.of(new pt5(OWNER,1,"shared"),new pt5(OWNER,1,"exclusive")));
        vt5.channels.put(2L,List.of(new pt5(OWNER,2,"shared")));
        u64 model=new u64();ct6 combined=(ct6)MonetCatalogChannels.wrap(model.A);
        CatalogRefresh.resume(context);Handler.drain();
        check(context.resolver.observers.size()==2,"Missing foreground subscription");
        check(vt5.lastLimit==101,"Native channel-read bound changed");
        check(((List)model.A.value).isEmpty()&&model.A.writes==0&&combined.writes>0,"Independent revision wrote Recommendations or did not refresh");
        wv0 normal=new wv0(OWNER);j83 callback=picker(normal,new wr4(vv0.RECOMMENDATIONS),false);
        String action=catalog("Action"),drama=catalog("Drama");
        check(f24.choices.size()==5,"Native channel choices duplicated instead of replaced");
        check(f24.choices.stream().filter(v->v instanceof String).count()==2,"Wrong catalog choices");
        Set<Object> keys=new HashSet<>();for(Object choice:f24.choices)check(keys.add(f24.first.a(choice)),"Duplicate native/catalog picker key");
        check(MonetCatalogChannels.owner(action).equals(OWNER)&&MonetCatalogChannels.owner(OWNER).equals(OWNER),"Real app icon owner");
        check(f24.secondary.e(action,null,0).equals(""),"Catalog section label must be non-null and empty");
        // Native B1 compares adjacent section labels and dereferences a changed label.
        String previousSection=null;
        for(Object choice:f24.choices) {
            String section=(String)f24.secondary.e(choice,new jw1(),0);
            if(!Objects.equals(section,previousSection))check(section.length()>=0,"Section renderer failed");
            previousSection=section;
        }
        check(f24.first.a(action).equals(action)&&f24.first.a(drama).equals(drama)&&!f24.first.a(action).equals(f24.first.a(drama)),"Catalog picker keys collide");
        check(f24.second.a(action).equals(Boolean.TRUE),"Auxiliary callback not mapped");
        check(f24.callback.a(action)==callback,"Native callback result lost");
        check(((wr4)callback.selected).a==vv0.RECOMMENDATIONS,"Native mode changed");
        check(callback.l.lastPackages.equals(List.of(action))&&callback.l.lastChannel==null,"Stable selection/channel-clear persistence");
        wv0 selected=new wv0(action);selected.A=List.of("own-hidden");
        callback=picker(selected,new wr4(vv0.RECOMMENDATIONS),false);
        check(f24.selected.equals(action)&&label(f24.selected).equals("Action"),"Saved catalog not selected");
        check(MonetCatalogChannels.contentLabel("Recommendations",selected).equals("Action"),"Catalog label missing");
        List<vs0> actionItems=items(action),dramaItems=items(drama);
        check(actionItems.size()==2&&dramaItems.size()==1,"Catalogs depend on empty Recommendations");
        check(actionItems.get(0).n.equals("shared")&&actionItems.get(0).l.equals("Action"),"Native key/channel-name conversion");
        check(MonetCatalogChannels.matches(actionItems.get(0),action)&&MonetCatalogChannels.matches(actionItems.get(0),drama),"Shared title membership");
        check(!MonetCatalogChannels.matches(actionItems.get(1),drama),"Catalog isolation");
        check(!MonetCatalogChannels.matches(new vs0("other","shared",1,"Action"),action),"Foreign app membership");
        check(MonetCatalogChannels.hidden(Set.of("global-hidden"),selected).equals(new LinkedHashSet<>(List.of("own-hidden"))),"Catalog hidden-title isolation");
        check(MonetCatalogChannels.hidden(Set.of("global-hidden"),normal).contains("global-hidden"),"Native hidden-title semantics changed");
        ip4 filter=new ip4("channel","Action",1);
        check(MonetCatalogChannels.matches110(actionItems.get(0),action,filter)&&yp7.owner.equals(OWNER)&&yp7.filter==filter,"Native channel filter lost");
        check(!MonetCatalogChannels.matches110(actionItems.get(0),action,new ip4("other","Other",2)),"Native filter bypassed");
        check(MonetCatalogChannels.matches110(actionItems.get(0),OWNER,filter),"Normal native filter changed");
        List<gt4> sources=(List<gt4>)MonetCatalogChannels.sources(List.of(),new LinkedHashMap<>(),Set.of(OWNER),Locale.ENGLISH);
        check(sources.size()==1&&sources.get(0).a.equals(OWNER)&&!sources.get(0).d,"Real app source lost with Recommendations disabled");
        check(items(action).size()==2,"Disabled aggregate emptied independent catalog");
        check(!MonetCatalogChannels.disabled(Set.of(action),actionItems.get(0))&&MonetCatalogChannels.disabled(Set.of(action,drama),actionItems.get(0)),"Shared-source disabled semantics");
        check(MonetCatalogChannels.disabled(Set.of(OWNER),actionItems.get(0)),"Disabled real owner ignored");
        // Ordinary choices, including native channel filters, preserve their native objects/actions.
        vr4 ordinary=new vr4(new ip4("native-other","Other",99));
        check(f24.callback.a(ordinary)==callback&&callback.selected==ordinary&&callback.l.lastChannel==ordinary.a&&callback.l.lastPackages.equals(List.of(OWNER)),"Leaving a catalog broke native channel selection");
        callback=picker(selected,new wr4(vv0.RECOMMENDATIONS),true);
        check(f24.choices.size()==5&&f24.selected.equals(action),"Native channel-query failure hides base modes/catalogs");
        picker(new wv0("other.app"),new wr4(vv0.RECOMMENDATIONS),true);
        check(f24.choices.isEmpty(),"Ordinary app loading/empty picker changed");
        int reads=vt5.reads,revision=combined.writes;
        context.resolver.change();context.resolver.change();Handler.drain();
        check(vt5.reads==reads+2&&combined.writes==revision,"Provider notifications not coalesced or equal snapshots churn");
        context.resolver.fail=true;int queries=context.resolver.queries;context.resolver.change();Handler.drain();
        check(items(action).size()==2&&context.resolver.queries-queries==4,"Failed reads not retained/bounded");context.resolver.fail=false;
        vt5.fail=true;context.resolver.change();Handler.drain();check(items(action).size()==2,"Null program result erased snapshot");vt5.fail=false;
        context.resolver.nullRead=true;context.resolver.change();Handler.drain();check(items(action).size()==2,"Null channel result erased snapshot");context.resolver.nullRead=false;
        // Recreated numeric channel ID, same stable owner/provider selection, new native metadata.
        context.resolver.rows.set(0,channel(11,"action","Renamed"));
        vt5.channels.put(11L,List.of(new pt5(OWNER,11,"new")));context.resolver.change();Handler.drain();
        picker(selected,new wr4(vv0.RECOMMENDATIONS),false);
        check(catalog("Renamed").equals(action)&&f24.selected.equals(action),"Numeric recreation changed saved catalog identity");
        check(items(action).size()==1&&items(action).get(0).n.equals("new")&&items(action).get(0).k==11&&items(action).get(0).l.equals("Renamed"),"New channel contents/name not refreshed");
        check(combined.writes>revision&&model.A.writes==0,"Catalog-only revision not independent");
        vt5.channels.put(11L,List.of());context.resolver.change();Handler.drain();picker(selected,new wr4(vv0.RECOMMENDATIONS),false);
        check(catalog("Renamed").equals(action)&&items(action).isEmpty(),"Empty catalog no longer selectable");
        context.resolver.rows.set(0,channel(22,"action","Renamed"));vt5.channels.put(22L,List.of());
        context.resolver.change();Handler.drain();picker(selected,new wr4(vv0.RECOMMENDATIONS),false);
        check(f24.choices.size()==5&&catalog("Renamed").equals(action),"Empty-channel recreation retained stale native ID or duplicated a native choice");
        context.resolver.rows.remove(0);context.resolver.change();Handler.drain();picker(selected,new wr4(vv0.RECOMMENDATIONS),false);
        check(f24.selected.equals(action)&&label(action).equals("Unavailable catalog")&&items(action).isEmpty(),"Unavailable selection discarded");
        context.resolver.change();CatalogRefresh.pause(context);Handler.drain();
        check(context.resolver.observers.isEmpty(),"Pause leaked observers");
        int late=context.resolver.queries;MonetCatalogChannels.reader(context,null,512,null);MonetCatalogChannels.programs(List.of());
        check(context.resolver.queries==late,"Late native scan replaced foreground snapshot");
        context.resolver.rows.add(channel(12,"action","Restored"));vt5.channels.put(12L,List.of(new pt5(OWNER,12,"restored")));
        CatalogRefresh.resume(context);Handler.drain();check(items(action).get(0).n.equals("restored"),"Resume did not recover");
        CatalogRefresh.pause(context);check(context.resolver.observers.isEmpty()&&Handler.pending.isEmpty(),"Observer/worker leak");
    }
}
