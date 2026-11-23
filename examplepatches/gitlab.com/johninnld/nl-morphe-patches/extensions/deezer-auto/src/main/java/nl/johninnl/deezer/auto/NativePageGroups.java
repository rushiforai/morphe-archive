package nl.johninnl.deezer.auto;

import java.util.*;
import java.util.function.Function;

/** Preserve native order, including repeated section names; never regroup the catalogue globally. */
final class NativePageGroups {
    static final class Part<T>{final String title;final List<T> items;Part(String title,List<T> items){this.title=title;this.items=Collections.unmodifiableList(new ArrayList<>(items));}}
    static <T> List<Part<T>> split(List<T> items,Function<T,String> name){
        List<Part<T>> result=new ArrayList<>();List<T> current=new ArrayList<>();String title=null;
        for(T item:items){String next=name.apply(item);if(next==null)next="";
            if(title!=null&&!title.equals(next)){result.add(new Part<>(title,current));current=new ArrayList<>();}
            title=next;current.add(item);
        }
        if(!current.isEmpty())result.add(new Part<>(title,current));return result;
    }
}
