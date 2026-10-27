import java.util.*; import a.*; import android.content.*;
import android.os.Handler;
import software.santodan.extension.monetchannels.MonetCatalogChannels;
import software.santodan.extension.monetchannels.CatalogRefresh;
public class Fixture extends Context {
    public final mx3 model=new mx3();
    public mx3 V(){return model;}
    static void check(boolean value,String message){if(!value)throw new AssertionError(message);}
    static String[] channel(long id,String owner,String provider,String title){return new String[]{""+id,owner,provider,title,"TYPE_PREVIEW"};}
    static List<sj4> sources(List<zo0> items,Set<String> disabled){return MonetCatalogChannels.sources(items,new LinkedHashMap<>(),disabled,Locale.ENGLISH);}
    static void picker(cs0 row,q03 callback){
        MonetCatalogChannels.preparePicker(row);
        MonetCatalogChannels.contentPicker("Content","",List.of(bs0.values()),bs0.RECOMMENDATIONS,
            (zq1)(a,b,c)->a.toString(),true,null,null,null,callback,(iq1)()->null,new yr1(),0,0,0);
    }
    public static void run()throws Exception {
        Fixture c=new Fixture();
        ie6 combined=(ie6)MonetCatalogChannels.wrap(c.model.A);
        Object initialProjection=combined.getValue();
        c.resolver.rows.add(channel(1,"com.nuvio.santodan","santodan-launcher/catalog-a","Action"));
        c.resolver.rows.add(channel(2,"com.nuvio.santodan","santodan-launcher/catalog-b","Drama"));
        c.resolver.rows.add(channel(3,"other","native","Unrelated"));
        fi5.channels.put(1L,List.of(new ai5("com.nuvio.santodan",1,"shared"),new ai5("com.nuvio.santodan",1,"action")));
        fi5.channels.put(2L,List.of(new ai5("com.nuvio.santodan",2,"shared"),new ai5("com.nuvio.santodan",2,"drama")));
        CatalogRefresh.resume(c);Handler.drain();
        check(!initialProjection.equals(combined.getValue()),"catalog revision invalidates native equal-item projection");
        check(((List<?>)combined.getValue()).isEmpty()&&((List<?>)c.model.A.getValue()).isEmpty(),"Recommendations contents remain unchanged");
        check(c.resolver.observers.size()==2,"independent channel/program observers registered");
        check(fi5.reads==2,"each catalog loaded without aggregate Recommendations refresh");
        q03 callback=new q03();picker(new cs0("com.nuvio.santodan"),callback);
        check(zs3.choices.size()==5,"catalogs nested after native three content choices");
        String action=(String)zs3.choices.get(3),drama=(String)zs3.choices.get(4);
        check(zs3.label.e(action,null,0).equals("Action"),"catalog name rendered by native picker");
        zs3.callback.a(action);
        check(callback.selected==bs0.RECOMMENDATIONS&&callback.k.lastPackages.equals(List.of(action)),"native persisted source identity with catalog selection");
        check(MonetCatalogChannels.owner(action).equals("com.nuvio.santodan"),"real installed package supplies Nuvio icon");
        check(MonetCatalogChannels.owner("com.nuvio.tv").equals("com.nuvio.tv"),"normal source ownership unchanged");
        picker(new cs0(action),callback);check(zs3.selected.equals(action),"saved catalog selection restored in content picker");
        zs3.callback.a(bs0.CONTINUE_WATCHING);
        check(callback.k.lastPackages.equals(List.of("com.nuvio.santodan")),"switching back restores original app selection");
        picker(new cs0("other"),callback);check(zs3.choices.size()==3,"catalogs isolated to owning app");
        ArrayList<zo0> empty=new ArrayList<>();
        check(MonetCatalogChannels.rowItems(empty,action).size()==2,"catalog row independent of empty Recommendations");
        check(MonetCatalogChannels.rowItems(empty,"other")==empty,"native rows use original data");
        zo0 shared=new zo0("com.nuvio.santodan","shared"),exclusive=new zo0("com.nuvio.santodan","action");
        check(MonetCatalogChannels.matches(shared,action)&&MonetCatalogChannels.matches(shared,drama),"shared title in both catalogs");
        check(MonetCatalogChannels.matches(exclusive,action)&&!MonetCatalogChannels.matches(exclusive,drama),"catalog isolation");
        check(!MonetCatalogChannels.matches(new zo0("other","shared"),action),"foreign owner cannot match");
        check(sources(List.of(shared),Set.of()).size()==1,"one real app source; no synthetic catalog apps");
        check(sources(List.of(),Set.of("com.nuvio.santodan")).size()==1,"Nuvio discoverable even when aggregate empty/disabled");
        check(MonetCatalogChannels.rowItems(empty,action).size()==2,"disabled Recommendations cannot empty catalog row");
        cs0 selectedRow=new cs0(action);selectedRow.A=List.of("own-hidden");
        check(MonetCatalogChannels.hidden(Set.of("recommendation-hidden"),selectedRow).equals(Set.of("own-hidden")),"catalog keeps only its own hidden titles");
        check(MonetCatalogChannels.hidden(Set.of("recommendation-hidden"),new cs0("other")).contains("recommendation-hidden"),"native hidden-title settings preserved");
        // Native 512-entry scan, empty refresh and provider failures must never erase independent data.
        MonetCatalogChannels.reader(c,null,512,null);MonetCatalogChannels.programs(List.of());
        check(MonetCatalogChannels.rowItems(empty,action).size()==2,"native empty refresh cannot erase independent snapshot");
        c.resolver.fail=true;c.resolver.change();Handler.drain();
        check(MonetCatalogChannels.rowItems(empty,action).size()==2,"metadata failure retains last good rows");
        c.resolver.fail=false;fi5.fail=true;c.resolver.change();Handler.drain();
        check(MonetCatalogChannels.rowItems(empty,action).size()==2,"program read failure retains last good catalog");
        fi5.fail=false;
        Object beforeRename=combined.getValue();
        c.resolver.rows.set(0,channel(99,"com.nuvio.santodan","santodan-launcher/catalog-a","Action renamed"));
        fi5.channels.put(99L,List.of(new ai5("com.nuvio.santodan",99,"new")));
        c.resolver.change();c.resolver.change();Handler.drain();
        check(MonetCatalogChannels.rowItems(empty,action).size()==1,"channel recreation keeps saved selection and replaces contents");
        check(!MonetCatalogChannels.matches(exclusive,action),"removed title no longer in row");
        check(MonetCatalogChannels.contentLabel("Recommendations",new cs0(action)).equals("Action renamed"),"row content label updated");
        check(!beforeRename.equals(combined.getValue()),"catalog changes emit without changing native recommendations");
        c.resolver.rows.remove(1);c.resolver.change();Handler.drain();
        check(MonetCatalogChannels.rowItems(empty,drama).isEmpty(),"authoritative channel deletion removes stale membership");
        int queries=c.resolver.queries;
        c.resolver.change();CatalogRefresh.pause(c);Handler.drain();
        check(c.resolver.observers.isEmpty()&&queries==c.resolver.queries,"pause unregisters observers and cancels pending work");
        c.resolver.rows.clear();CatalogRefresh.resume(c);Handler.drain();
        check(MonetCatalogChannels.rowItems(empty,action).isEmpty(),"successful empty provider clears removed catalogs");
        CatalogRefresh.pause(c);
        check(!MonetCatalogChannels.matches(shared,null),"null selection rejected");
    }
}
