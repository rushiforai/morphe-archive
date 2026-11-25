package patches.maps.gearslip;

import android.os.Bundle;
import java.util.ArrayList;
import java.util.List;

/** Public screen metadata follows observed native screens and their original Back callbacks. */
final class NativeScreenStack {
    private static final class Entry {
        final String id,type;
        Entry(String id,String type){this.id=id;this.type=type;}
    }
    private final List<Entry> entries=new ArrayList<>();
    void apply(Bundle wrapper){
        String id=CarProtocol.member(wrapper,"mId").getString("tag_value");
        String type=CarProtocol.member(wrapper,"mTemplate").getString("tag_class_name");
        int previous=-1;for(int i=0;i<entries.size();i++)if(entries.get(i).id.equals(id)){previous=i;break;}
        // Maps' own map screen is the root; the keyboard (or an error) sits on top of it.
        if("morphe-maps-native".equals(id)&&previous<0)entries.clear();
        else if(previous>=0)entries.subList(0,previous+1).clear();
        entries.add(0,new Entry(id,type));
        List<Bundle> stack=new ArrayList<>();
        for(Entry entry:entries)stack.add(CarProtocol.templateInfo(entry.type,entry.id));
        CarProtocol.field(wrapper,"mTemplateInfoForScreenStack",CarProtocol.list(stack));
        // As in the pinned ScreenManager, send the actual screen ledger and
        // leave current task step/refresh classification at client defaults.
    }
}
