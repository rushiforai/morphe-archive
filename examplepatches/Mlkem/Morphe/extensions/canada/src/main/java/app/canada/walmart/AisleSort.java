package app.canada.walmart;

import java.util.*;
import java.lang.reflect.*;

public final class AisleSort {
    private static final String CHECK="com.walmart.glass.lists.domain.ListItem$ChecklistItem",HEADER="com.walmart.glass.lists.domain.ListItem$AisleHeader";
    public static List<?> sortAisles(Object adapter,List<?> input) {
        if(adapter==null||!adapter.getClass().getName().equals("com.walmart.glass.lists.view.lists.a")||input==null||input.isEmpty())return input;
        try {
            Map<String,List<Object>> groups=new TreeMap<>(ListMath::natural);
            List<Object> unknown=new ArrayList<>();
            for(Object item:input) {
                if(item==null)return input;
                if(item.getClass().getName().equals(HEADER))continue;
                if(!item.getClass().getName().equals(CHECK))return input;
                Object detail=item.getClass().getMethod("e").invoke(item);
                Object product=detail.getClass().getMethod("t").invoke(detail);
                Object location=ModelAccess.field(product,"z");String key="";
                if(location!=null) {
                    Object aisle=ModelAccess.field(location,"e");
                    if(aisle!=null) {
                        Object number=ModelAccess.field(aisle,"e"),zone=ModelAccess.field(aisle,"d");
                        if(number instanceof Integer && (Integer)number>=0)key=(zone==null?"":zone.toString().trim())+number;
                    }
                    if(key.isEmpty()) {Object display=ModelAccess.field(location,"d");if(display instanceof String)key=((String)display).trim();}
                }
                if(key.isEmpty())unknown.add(item);else groups.computeIfAbsent(key,k->new ArrayList<>()).add(item);
            }
            if(groups.isEmpty())return input;
            Constructor<?> header=Class.forName(HEADER,false,adapter.getClass().getClassLoader()).getConstructor(String.class,int.class);
            List<Object> output=new ArrayList<>();
            for(Map.Entry<String,List<Object>> entry:groups.entrySet()) {output.add(header.newInstance(entry.getKey(),entry.getValue().size()));output.addAll(entry.getValue());}
            if(!unknown.isEmpty()){output.add(header.newInstance("fr".equals(Locale.getDefault().getLanguage())?"Allée inconnue":"Aisle unknown",unknown.size()));output.addAll(unknown);}
            RuntimeStats.hit("Checklist lists sorted");return output;
        }catch(Exception e){android.util.Log.w("WalmartCanadaMorphe","Aisle sorting unavailable",e);return input;}
    }
}
