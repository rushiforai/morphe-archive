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
    static List<mu0> items(String selected) { return (List<mu0>)(List<?>)MonetCatalogChannels.rowItems(new ArrayList<>(),selected); }
    static String label(Object choice) { return (String)b84.label.e(choice,new iy1(),0); }
    static nd3 picker(nx0 row,Object selected,boolean nativeEmpty) {
        List<Object> options=new ArrayList<>();
        if(!nativeEmpty) {
            for(mx0 mode:mx0.values())options.add(new by4(mode));
            for(String[] entry:context.resolver.rows)options.add(new ay4(new ov4(entry[2],entry[3],Long.parseLong(entry[0]))));
        }
        kx1 names=(value,composer,flags)->{
            if(!(value instanceof xr4))throw new AssertionError("Native primary received synthetic ID");
            return value instanceof by4?((by4)value).a.name():((ay4)value).a.b;
        };
        kx1 secondary=(value,composer,flags)->{check(value instanceof xr4,"Native secondary received synthetic ID");return "native details";};
        vw1 action=value->{check(value instanceof xr4,"Native auxiliary callback received synthetic ID");return Boolean.TRUE;};
        vw1 key=value->{check(value instanceof xr4,"Native key extractor received synthetic ID");return ((xr4)value).a();};
        nd3 callback=new nd3();
        int queries=context.resolver.queries;
        MonetCatalogChannels.preparePicker(row);
        MonetCatalogChannels.contentPicker110("Content","",options,selected,names,true,secondary,key,action,
            Set.of(),Set.of(),null,callback,(tw1)()->null,new iy1(),11,22,3872);
        check(context.resolver.queries==queries,"Composition queried TvProvider");
        check(b84.defaults==3872,"Native default mask changed");
        return callback;
    }
    static String catalog(String name) {
        for(Object choice:b84.choices)if(choice instanceof String&&label(choice).equals(name))return (String)choice;
        throw new AssertionError("Missing catalog "+name);
    }
    public static void run() {
        NativeLayout.modern=true;NativeLayout.v111=true;
        context.resolver.rows.add(channel(1,"action","Action"));context.resolver.rows.add(channel(2,"drama","Drama"));
        s46.channels.put(1L,List.of(new n46(OWNER,1,"shared"),new n46(OWNER,1,"exclusive")));
        s46.channels.put(2L,List.of(new n46(OWNER,2,"shared")));
        qc4 model=new qc4();w47 combined=(w47)MonetCatalogChannels.wrap(model.A);
        CatalogRefresh.resume(context);Handler.drain();
        check(context.resolver.observers.size()==2,"Missing foreground subscription");
        check(s46.lastLimit==101,"Native channel-read bound changed");
        check(((List)model.A.value).isEmpty()&&model.A.writes==0&&combined.writes>0,"Independent revision wrote Recommendations or did not refresh");
        nx0 normal=new nx0(OWNER);nd3 callback=picker(normal,new by4(mx0.RECOMMENDATIONS),false);
        String action=catalog("Action"),drama=catalog("Drama");
        check(b84.choices.size()==5,"Native channel choices duplicated instead of replaced");
        check(b84.choices.stream().filter(v->v instanceof String).count()==2,"Wrong catalog choices");
        Set<Object> keys=new HashSet<>();for(Object choice:b84.choices)check(keys.add(b84.first.a(choice)),"Duplicate native/catalog picker key");
        check(MonetCatalogChannels.owner(action).equals(OWNER)&&MonetCatalogChannels.owner(OWNER).equals(OWNER),"Real app icon owner");
        check(b84.secondary.e(action,null,0).equals(""),"Catalog section label must be non-null and empty");
        // Native B1 compares adjacent section labels and dereferences a changed label.
        String previousSection=null;
        for(Object choice:b84.choices) {
            String section=(String)b84.secondary.e(choice,new iy1(),0);
            if(!Objects.equals(section,previousSection))check(section.length()>=0,"Section renderer failed");
            previousSection=section;
        }
        check(b84.first.a(action).equals(action)&&b84.first.a(drama).equals(drama)&&!b84.first.a(action).equals(b84.first.a(drama)),"Catalog picker keys collide");
        check(b84.second.a(action).equals(Boolean.TRUE),"Auxiliary callback not mapped");
        check(b84.callback.a(action)==callback,"Native callback result lost");
        check(((by4)callback.selected).a==mx0.RECOMMENDATIONS,"Native mode changed");
        check(callback.l.lastPackages.equals(List.of(action))&&callback.l.lastChannel==null,"Stable selection/channel-clear persistence");
        nx0 selected=new nx0(action);selected.A=List.of("own-hidden");
        callback=picker(selected,new by4(mx0.RECOMMENDATIONS),false);
        check(b84.selected.equals(action)&&label(b84.selected).equals("Action"),"Saved catalog not selected");
        check(MonetCatalogChannels.contentLabel("Recommendations",selected).equals("Action"),"Catalog label missing");
        List<mu0> actionItems=items(action),dramaItems=items(drama);
        check(actionItems.size()==2&&dramaItems.size()==1,"Catalogs depend on empty Recommendations");
        check(actionItems.get(0).n.equals("shared")&&actionItems.get(0).l.equals("Action"),"Native key/channel-name conversion");
        check(MonetCatalogChannels.matches(actionItems.get(0),action)&&MonetCatalogChannels.matches(actionItems.get(0),drama),"Shared title membership");
        check(!MonetCatalogChannels.matches(actionItems.get(1),drama),"Catalog isolation");
        check(!MonetCatalogChannels.matches(new mu0("other","shared",1,"Action"),action),"Foreign app membership");
        check(MonetCatalogChannels.hidden(Set.of("global-hidden"),selected).equals(new LinkedHashSet<>(List.of("own-hidden"))),"Catalog hidden-title isolation");
        check(MonetCatalogChannels.hidden(Set.of("global-hidden"),normal).contains("global-hidden"),"Native hidden-title semantics changed");
        ov4 filter=new ov4("channel","Action",1);
        check(MonetCatalogChannels.matches110(actionItems.get(0),action,filter)&&m42.owner.equals(OWNER)&&m42.filter==filter,"Native channel filter lost");
        check(!MonetCatalogChannels.matches110(actionItems.get(0),action,new ov4("other","Other",2)),"Native filter bypassed");
        check(MonetCatalogChannels.matches110(actionItems.get(0),OWNER,filter),"Normal native filter changed");
        List<lz4> sources=(List<lz4>)MonetCatalogChannels.sources(List.of(),new LinkedHashMap<>(),Set.of(OWNER),Locale.ENGLISH);
        check(sources.size()==1&&sources.get(0).a.equals(OWNER)&&!sources.get(0).d,"Real app source lost with Recommendations disabled");
        check(items(action).size()==2,"Disabled aggregate emptied independent catalog");
        check(!MonetCatalogChannels.disabled(Set.of(action),actionItems.get(0))&&MonetCatalogChannels.disabled(Set.of(action,drama),actionItems.get(0)),"Shared-source disabled semantics");
        check(MonetCatalogChannels.disabled(Set.of(OWNER),actionItems.get(0)),"Disabled real owner ignored");
        // Ordinary choices, including native channel filters, preserve their native objects/actions.
        ay4 ordinary=new ay4(new ov4("native-other","Other",99));
        check(b84.callback.a(ordinary)==callback&&callback.selected==ordinary&&callback.l.lastChannel==ordinary.a&&callback.l.lastPackages.equals(List.of(OWNER)),"Leaving a catalog broke native channel selection");
        callback=picker(selected,new by4(mx0.RECOMMENDATIONS),true);
        check(b84.choices.size()==5&&b84.selected.equals(action),"Native channel-query failure hides base modes/catalogs");
        picker(new nx0("other.app"),new by4(mx0.RECOMMENDATIONS),true);
        check(b84.choices.isEmpty(),"Ordinary app loading/empty picker changed");
        int reads=s46.reads,revision=combined.writes;
        context.resolver.change();context.resolver.change();Handler.drain();
        check(s46.reads==reads+2&&combined.writes==revision,"Provider notifications not coalesced or equal snapshots churn");
        context.resolver.fail=true;int queries=context.resolver.queries;context.resolver.change();Handler.drain();
        check(items(action).size()==2&&context.resolver.queries-queries==4,"Failed reads not retained/bounded");context.resolver.fail=false;
        s46.fail=true;context.resolver.change();Handler.drain();check(items(action).size()==2,"Null program result erased snapshot");s46.fail=false;
        context.resolver.nullRead=true;context.resolver.change();Handler.drain();check(items(action).size()==2,"Null channel result erased snapshot");context.resolver.nullRead=false;
        // Recreated numeric channel ID, same stable owner/provider selection, new native metadata.
        context.resolver.rows.set(0,channel(11,"action","Renamed"));
        s46.channels.put(11L,List.of(new n46(OWNER,11,"new")));context.resolver.change();Handler.drain();
        picker(selected,new by4(mx0.RECOMMENDATIONS),false);
        check(catalog("Renamed").equals(action)&&b84.selected.equals(action),"Numeric recreation changed saved catalog identity");
        check(items(action).size()==1&&items(action).get(0).n.equals("new")&&items(action).get(0).k==11&&items(action).get(0).l.equals("Renamed"),"New channel contents/name not refreshed");
        check(combined.writes>revision&&model.A.writes==0,"Catalog-only revision not independent");
        s46.channels.put(11L,List.of());context.resolver.change();Handler.drain();picker(selected,new by4(mx0.RECOMMENDATIONS),false);
        check(catalog("Renamed").equals(action)&&items(action).isEmpty(),"Empty catalog no longer selectable");
        context.resolver.rows.set(0,channel(22,"action","Renamed"));s46.channels.put(22L,List.of());
        context.resolver.change();Handler.drain();picker(selected,new by4(mx0.RECOMMENDATIONS),false);
        check(b84.choices.size()==5&&catalog("Renamed").equals(action),"Empty-channel recreation retained stale native ID or duplicated a native choice");
        context.resolver.rows.remove(0);context.resolver.change();Handler.drain();picker(selected,new by4(mx0.RECOMMENDATIONS),false);
        check(b84.selected.equals(action)&&label(action).equals("Unavailable catalog")&&items(action).isEmpty(),"Unavailable selection discarded");
        context.resolver.change();CatalogRefresh.pause(context);Handler.drain();
        check(context.resolver.observers.isEmpty(),"Pause leaked observers");
        int late=context.resolver.queries;MonetCatalogChannels.reader(context,null,512,null);MonetCatalogChannels.programs(List.of());
        check(context.resolver.queries==late,"Late native scan replaced foreground snapshot");
        context.resolver.rows.add(channel(12,"action","Restored"));s46.channels.put(12L,List.of(new n46(OWNER,12,"restored")));
        CatalogRefresh.resume(context);Handler.drain();check(items(action).get(0).n.equals("restored"),"Resume did not recover");
        CatalogRefresh.pause(context);check(context.resolver.observers.isEmpty()&&Handler.pending.isEmpty(),"Observer/worker leak");
    }
}
