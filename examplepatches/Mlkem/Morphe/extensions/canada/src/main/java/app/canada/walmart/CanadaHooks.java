package app.canada.walmart;

import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.ForegroundColorSpan;
import android.text.style.RelativeSizeSpan;
import android.util.Log;
import java.lang.reflect.*;
import java.util.*;

/** Walmart Canada 26.31. No network calls or fabricated inventory counts. */
public final class CanadaHooks {
    private static final String TAG = "WalmartCanadaMorphe";
    private static final String SEPARATOR = "\n• ";
    public static Object defaultTab(Object current) {
        if (!(current instanceof Enum) || !"TAB_1".equals(((Enum) current).name())) return current;
        for (Object value : current.getClass().getEnumConstants())
            if ("TAB_2".equals(((Enum) value).name())) return value;
        return current;
    }
    public static Map filterNav(Map original) {
        if (original == null) return null;
        Map result = new LinkedHashMap(original);
        boolean hasMyItems = false;
        for (Object key : result.keySet())
            if (key instanceof Enum && "TAB_2".equals(((Enum)key).name())) hasMyItems = true;
        if (hasMyItems) result.keySet().removeIf(key -> key instanceof Enum && "TAB_1".equals(((Enum)key).name()));
        return result;
    }
    public static void selectLists(final View root) {
        if (root == null) return;
        root.post(() -> {
            try {
                View pager = findClass(root, "androidx.viewpager2.widget.ViewPager2");
                if (pager == null) return;
                if (((Integer)pager.getClass().getMethod("getCurrentItem").invoke(pager)) != 0) return;
                Object adapter = pager.getClass().getMethod("getAdapter").invoke(pager);
                if (adapter == null) return;
                Method count = adapter.getClass().getMethod("getItemCount"); count.setAccessible(true);
                if (((Integer)count.invoke(adapter)) > 1)
                    {pager.getClass().getMethod("setCurrentItem", int.class).invoke(pager, 1);RuntimeStats.hit("Lists tab selected");}
            } catch (Exception e) { Log.w(TAG, "Lists tab unavailable", e); }
        });
    }
    private static View findClass(View view, String name) {
        if (view.getClass().getName().equals(name)) return view;
        if (view instanceof ViewGroup) for(int i=0;i<((ViewGroup)view).getChildCount();i++) {
            View match=findClass(((ViewGroup)view).getChildAt(i),name); if(match!=null)return match;
        }
        return null;
    }
    public static String statusLabel(String status, String message, boolean french) {
        String label;
        if ("OUT_OF_STOCK".equals(status)) label=french?"Rupture de stock":"Out of stock";
        else if ("NOT_AVAILABLE".equals(status)) label=french?"Indisponible":"Unavailable";
        else if ("IN_STOCK".equals(status)) label=french?"En stock":"In stock";
        else label=french?"Disponibilité inconnue":"Availability unknown";
        if(message!=null && !message.trim().isEmpty() && !message.trim().equalsIgnoreCase(label))
            label += " — " + message.trim();
        return label;
    }
    public static void stock(final View tile, Object detail) {
        try {
            Object product=detail.getClass().getMethod("t").invoke(detail);
            Field sf=product.getClass().getDeclaredField("e"); sf.setAccessible(true);
            Object status=sf.get(product);
            Field mf=product.getClass().getDeclaredField("f"); mf.setAccessible(true);
            String message=(String)mf.get(product);
            String name=status instanceof Enum?((Enum)status).name():"UNKNOWN__";
            boolean french="fr".equals(tile.getResources().getConfiguration().getLocales().get(0).getLanguage());
            String label=statusLabel(name,message,french);
            int id=tile.getResources().getIdentifier("lists_item_detail_name","id",tile.getContext().getPackageName());
            View target=id==0?null:tile.findViewById(id);
            if(!(target instanceof TextView) || target.getVisibility()!=View.VISIBLE) return;
            TextView text=(TextView)target;
            text.setMaxLines(Math.max(4,text.getMaxLines()));
            CharSequence current=text.getText();
            int prior=current.toString().indexOf(SEPARATOR);
            SpannableStringBuilder b=new SpannableStringBuilder(prior<0?current:current.subSequence(0,prior));
            int start=b.length();b.append(SEPARATOR).append(label);
            int colour="IN_STOCK".equals(name)?0xff176338:"OUT_OF_STOCK".equals(name)?0xffa62622:0xff62676b;
            b.setSpan(new ForegroundColorSpan(colour),start,b.length(),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            b.setSpan(new RelativeSizeSpan(.82f),start,b.length(),Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            text.setText(b);
        } catch (Exception e) { Log.w(TAG,"Availability unavailable",e); }
    }
}
