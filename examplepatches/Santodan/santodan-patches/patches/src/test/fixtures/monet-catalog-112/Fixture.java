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
    static List<iv0> items(String selected) { return (List<iv0>)(List<?>)MonetCatalogChannels.rowItems112(Collections.emptyList(),selected); }
    static String label(Object choice) { return (String)ea4.label.e(choice,new ty1(),0); }
    static jf3 picker(sx0 row,Object selected,boolean nativeEmpty) {
        List<Object> options=new ArrayList<>();
        if(!nativeEmpty) {
            for(rx0 mode:rx0.values())options.add(new r15(mode));
            for(String[] entry:context.resolver.rows)options.add(new q15(new zy4(entry[2],entry[3],Long.parseLong(entry[0]))));
        }
        wx1 names=(value,composer,flags)->{
            if(!(value instanceof s15))throw new AssertionError("Native primary received synthetic ID");
            return value instanceof r15?((r15)value).a.name():((q15)value).a.b;
        };
        wx1 secondary=(value,composer,flags)->{check(value instanceof s15,"Native secondary received synthetic ID");return "native details";};
        hx1 action=value->{check(value instanceof s15,"Native auxiliary callback received synthetic ID");return Boolean.TRUE;};
        hx1 key=value->{check(value instanceof s15,"Native key extractor received synthetic ID");return ((s15)value).a();};
        jf3 callback=new jf3();
        int queries=context.resolver.queries;
        MonetCatalogChannels.preparePicker(row);
        MonetCatalogChannels.contentPicker112("Content","",options,selected,names,true,secondary,key,action,
            Set.of(),Set.of(),callback,(fx1)()->null,new ty1(),11,22,3872);
        check(context.resolver.queries==queries,"Composition queried TvProvider");
        check(ea4.defaults==3872,"Native default mask changed");
        return callback;
    }
    static String catalog(String name) {
        for(Object choice:ea4.choices)if(choice instanceof String&&label(choice).equals(name))return (String)choice;
        throw new AssertionError("Missing catalog "+name);
    }
    public static void run() {
        NativeLayout.modern=true;NativeLayout.v112=true;
        context.resolver.rows.add(channel(1,"action","Action"));context.resolver.rows.add(channel(2,"drama","Drama"));
        n86.channels.put(1L,List.of(new i86(OWNER,1,"shared"),new i86(OWNER,1,"exclusive")));
        n86.channels.put(2L,List.of(new i86(OWNER,2,"shared")));
        bf4 model=new bf4();jl7 combined=(jl7)MonetCatalogChannels.wrap(model.A);
        CatalogRefresh.resume(context);Handler.drain();
        check(context.resolver.observers.size()==2,"Missing foreground subscription");
        check(n86.lastLimit==101,"Native channel-read bound changed");
        check(((List)model.A.value).isEmpty()&&model.A.writes==0&&combined.writes>0,"Independent revision wrote Recommendations or did not refresh");
        sx0 normal=new sx0(OWNER);jf3 callback=picker(normal,new r15(rx0.RECOMMENDATIONS),false);
        String action=catalog("Action"),drama=catalog("Drama");
        check(ea4.choices.size()==6,"Native channel choices duplicated instead of replaced");
        check(ea4.choices.stream().filter(v->v instanceof String).count()==2,"Wrong catalog choices");
        Set<Object> keys=new HashSet<>();for(Object choice:ea4.choices)check(keys.add(ea4.first.a(choice)),"Duplicate native/catalog picker key");
        check(MonetCatalogChannels.owner(action).equals(OWNER)&&MonetCatalogChannels.owner(OWNER).equals(OWNER),"Real app icon owner");
        check(ea4.secondary.e(action,null,0).equals(""),"Catalog section label must be non-null and empty");
        // Native B1 compares adjacent section labels and dereferences a changed label.
        String previousSection=null;
        for(Object choice:ea4.choices) {
            String section=(String)ea4.secondary.e(choice,new ty1(),0);
            if(!Objects.equals(section,previousSection))check(section.length()>=0,"Section renderer failed");
            previousSection=section;
        }
        check(ea4.first.a(action).equals(action)&&ea4.first.a(drama).equals(drama)&&!ea4.first.a(action).equals(ea4.first.a(drama)),"Catalog picker keys collide");
        check(ea4.second.a(action).equals(Boolean.TRUE),"Auxiliary callback not mapped");
        check(ea4.callback.a(action)==callback,"Native callback result lost");
        check(((r15)callback.selected).a==rx0.RECOMMENDATIONS,"Native mode changed");
        check(callback.l.lastPackages.equals(List.of(action))&&callback.l.lastChannel==null,"Stable selection/channel-clear persistence");
        sx0 selected=new sx0(action);selected.D=List.of("own-hidden");
        callback=picker(selected,new r15(rx0.RECOMMENDATIONS),false);
        check(ea4.selected.equals(action)&&label(ea4.selected).equals("Action"),"Saved catalog not selected");
        check(MonetCatalogChannels.contentLabel("Recommendations",selected).equals("Action"),"Catalog label missing");
        List<iv0> actionItems=items(action),dramaItems=items(drama);
        check(actionItems.size()==2&&dramaItems.size()==1,"Catalogs depend on empty Recommendations");
        check(actionItems.get(0).o.equals("shared")&&actionItems.get(0).l.equals("Action"),"Native key/channel-name conversion");
        check(MonetCatalogChannels.matches(actionItems.get(0),action)&&MonetCatalogChannels.matches(actionItems.get(0),drama),"Shared title membership");
        check(!MonetCatalogChannels.matches(actionItems.get(1),drama),"Catalog isolation");
        check(!MonetCatalogChannels.matches(new iv0("other","shared",1,"Action"),action),"Foreign app membership");
        check(MonetCatalogChannels.hidden(Set.of("global-hidden"),selected).equals(new LinkedHashSet<>(List.of("own-hidden"))),"Catalog hidden-title isolation");
        check(MonetCatalogChannels.hidden(Set.of("global-hidden"),normal).contains("global-hidden"),"Native hidden-title semantics changed");
        // Native 1.1.2 may pass Kotlin's shared empty list; ordinary rows must get that same object back.
        List<?> shared=Collections.emptyList();
        check(MonetCatalogChannels.rowItems112(shared,OWNER)==shared&&MonetCatalogChannels.rowItems112(shared,null)==shared,"Native list replaced for ordinary row");
        // 1.1.2 Seerr media rows have no native selected app; even a stale catalog package must stay unselected.
        sx0 seerr=new sx0(action);seerr.v=rx0.SEERR;seerr.D=List.of("seerr-hidden");
        check(MonetCatalogChannels.selection(seerr)==null,"Seerr row gained a selection");
        check(MonetCatalogChannels.contentLabel("Requests",seerr).equals("Requests"),"Seerr label replaced");
        check(MonetCatalogChannels.hidden(Set.of("global-hidden"),seerr).equals(new LinkedHashSet<>(List.of("global-hidden","seerr-hidden"))),"Seerr hidden semantics changed");
        zy4 filter=new zy4("channel","Action",1);
        check(MonetCatalogChannels.matches110(actionItems.get(0),action,filter)&&ke3.owner.equals(OWNER)&&ke3.filter==filter,"Native channel filter lost");
        check(!MonetCatalogChannels.matches110(actionItems.get(0),action,new zy4("other","Other",2)),"Native filter bypassed");
        check(MonetCatalogChannels.matches110(actionItems.get(0),OWNER,filter),"Normal native filter changed");
        List<h35> sources=(List<h35>)MonetCatalogChannels.sources(List.of(),new LinkedHashMap<>(),Set.of(OWNER),Locale.ENGLISH);
        check(sources.size()==1&&sources.get(0).a.equals(OWNER)&&!sources.get(0).d,"Real app source lost with Recommendations disabled");
        check(items(action).size()==2,"Disabled aggregate emptied independent catalog");
        check(!MonetCatalogChannels.disabled(Set.of(action),actionItems.get(0))&&MonetCatalogChannels.disabled(Set.of(action,drama),actionItems.get(0)),"Shared-source disabled semantics");
        check(MonetCatalogChannels.disabled(Set.of(OWNER),actionItems.get(0)),"Disabled real owner ignored");
        // Ordinary choices, including native channel filters, preserve their native objects/actions.
        q15 ordinary=new q15(new zy4("native-other","Other",99));
        check(ea4.callback.a(ordinary)==callback&&callback.selected==ordinary&&callback.l.lastChannel==ordinary.a&&callback.l.lastPackages.equals(List.of(OWNER)),"Leaving a catalog broke native channel selection");
        callback=picker(selected,new r15(rx0.RECOMMENDATIONS),true);
        check(ea4.choices.size()==5&&ea4.selected.equals(action),"Native channel-query failure hides base modes/catalogs");
        picker(new sx0("other.app"),new r15(rx0.RECOMMENDATIONS),true);
        check(ea4.choices.isEmpty(),"Ordinary app loading/empty picker changed");
        int reads=n86.reads,revision=combined.writes;
        context.resolver.change();context.resolver.change();Handler.drain();
        check(n86.reads==reads+2&&combined.writes==revision,"Provider notifications not coalesced or equal snapshots churn");
        context.resolver.fail=true;int queries=context.resolver.queries;context.resolver.change();Handler.drain();
        check(items(action).size()==2&&context.resolver.queries-queries==4,"Failed reads not retained/bounded");context.resolver.fail=false;
        n86.fail=true;context.resolver.change();Handler.drain();check(items(action).size()==2,"Null program result erased snapshot");n86.fail=false;
        context.resolver.nullRead=true;context.resolver.change();Handler.drain();check(items(action).size()==2,"Null channel result erased snapshot");context.resolver.nullRead=false;
        // Recreated numeric channel ID, same stable owner/provider selection, new native metadata.
        context.resolver.rows.set(0,channel(11,"action","Renamed"));
        n86.channels.put(11L,List.of(new i86(OWNER,11,"new")));context.resolver.change();Handler.drain();
        picker(selected,new r15(rx0.RECOMMENDATIONS),false);
        check(catalog("Renamed").equals(action)&&ea4.selected.equals(action),"Numeric recreation changed saved catalog identity");
        check(items(action).size()==1&&items(action).get(0).o.equals("new")&&items(action).get(0).k==11&&items(action).get(0).l.equals("Renamed"),"New channel contents/name not refreshed");
        check(combined.writes>revision&&model.A.writes==0,"Catalog-only revision not independent");
        n86.channels.put(11L,List.of());context.resolver.change();Handler.drain();picker(selected,new r15(rx0.RECOMMENDATIONS),false);
        check(catalog("Renamed").equals(action)&&items(action).isEmpty(),"Empty catalog no longer selectable");
        context.resolver.rows.set(0,channel(22,"action","Renamed"));n86.channels.put(22L,List.of());
        context.resolver.change();Handler.drain();picker(selected,new r15(rx0.RECOMMENDATIONS),false);
        check(ea4.choices.size()==6&&catalog("Renamed").equals(action),"Empty-channel recreation retained stale native ID or duplicated a native choice");
        context.resolver.rows.remove(0);context.resolver.change();Handler.drain();picker(selected,new r15(rx0.RECOMMENDATIONS),false);
        check(ea4.selected.equals(action)&&label(action).equals("Unavailable catalog")&&items(action).isEmpty(),"Unavailable selection discarded");
        context.resolver.change();CatalogRefresh.pause(context);Handler.drain();
        check(context.resolver.observers.isEmpty(),"Pause leaked observers");
        int late=context.resolver.queries;MonetCatalogChannels.reader(context,null,512,null);MonetCatalogChannels.programs(List.of());
        check(context.resolver.queries==late,"Late native scan replaced foreground snapshot");
        context.resolver.rows.add(channel(12,"action","Restored"));n86.channels.put(12L,List.of(new i86(OWNER,12,"restored")));
        CatalogRefresh.resume(context);Handler.drain();check(items(action).get(0).o.equals("restored"),"Resume did not recover");
        CatalogRefresh.pause(context);check(context.resolver.observers.isEmpty()&&Handler.pending.isEmpty(),"Observer/worker leak");
    }
}
