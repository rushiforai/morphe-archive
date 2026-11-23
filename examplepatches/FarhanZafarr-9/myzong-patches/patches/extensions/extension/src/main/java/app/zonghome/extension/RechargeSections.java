package app.zonghome.extension;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.WeakHashMap;

/** Filters the recharge pager's pages and titles together, without touching payment services. */
public final class RechargeSections {
    private RechargeSections() {}
    private static final WeakHashMap<Object,int[]> PAGE_MAPS=new WeakHashMap<>();
    public static boolean hideOnline() { return false; }
    public static boolean hideScratch() { return false; }

    public static void configureAdapter(Object adapter) {
        if(adapter==null || (!hideOnline() && !hideScratch()))return;
        Field pagesField=null,titlesField=null;
        try {
            for(Field f:adapter.getClass().getDeclaredFields()) {
                if(List.class.isAssignableFrom(f.getType()))pagesField=f;
                if(f.getType()==String[].class)titlesField=f;
            }
            if(pagesField==null || titlesField==null)return;
            pagesField.setAccessible(true);titlesField.setAccessible(true);
            List<?> original=(List<?>)pagesField.get(adapter);
            String[] titles=(String[])titlesField.get(adapter);
            if(original==null || titles==null || original.size()!=titles.length)return;
            ArrayList<Object> pages=new ArrayList<>();ArrayList<String> labels=new ArrayList<>();
            int[] map=new int[original.size()];java.util.Arrays.fill(map,-1);
            for(int i=0;i<original.size();i++) {
                Object page=original.get(i);if(page==null)return;
                String name=page.getClass().getName();
                if((hideOnline() && name.equals("com.zong.customercare.view.ui.FragOrPaymentMethods")) ||
                   (hideScratch() && name.equals("com.zong.customercare.view.ui.FragRecharge")))continue;
                map[i]=pages.size();pages.add(page);labels.add(titles[i]);
            }
            if(pages.size()==original.size())return;
            String[] filtered=labels.toArray(new String[0]);
            titlesField.set(adapter,filtered);
            try {pagesField.set(adapter,pages);}
            catch(IllegalAccessException | IllegalArgumentException failure){titlesField.set(adapter,titles);return;}
            PAGE_MAPS.put(adapter,map);
        } catch(ReflectiveOperationException | SecurityException | ClassCastException ignored) {
            // Preserve the original pager if the supported .112 shape no longer matches.
        }
    }

    public static int mapRequestedPage(Object pager,int requested) {
        try {
            Object adapter=pager.getClass().getMethod("getAdapter").invoke(pager);
            int[] map=PAGE_MAPS.get(adapter);
            if(map==null)return requested;
            if(requested>=0 && requested<map.length && map[requested]>=0)return map[requested];
            return 0; // ViewPager also safely accepts an empty adapter (e.g. postpaid, both hidden).
        }catch(ReflectiveOperationException | SecurityException ignored){return requested;}
    }
}
