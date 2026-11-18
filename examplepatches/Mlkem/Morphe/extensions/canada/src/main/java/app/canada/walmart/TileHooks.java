package app.canada.walmart;
import android.view.*;
public final class TileHooks {
    static View tile(View v){if(v==null)return null;if(v.getClass().getName().equals("com.walmart.glass.lists.view.lists.ListDetailTileView"))return v;if(v instanceof ViewGroup)for(int i=0;i<((ViewGroup)v).getChildCount();i++){View found=tile(((ViewGroup)v).getChildAt(i));if(found!=null)return found;}return null;}
    static View from(Object holder)throws Exception{return tile(ShoppingMode.itemView(holder));}
    public static void history(Object holder,Object detail){try{View v=from(holder);if(v!=null)ListEnhancements.bindHistory(v,detail);}catch(Exception e){RuntimeStats.error("List history bind",e);}}
    public static void stock(Object holder,Object detail){try{View v=from(holder);if(v!=null){CanadaHooks.stock(v,detail);RuntimeStats.hit("Stock cards bound");}}catch(Exception e){RuntimeStats.error("Stock bind",e);}}
    public static void expiry(Object holder,Object detail){try{View v=from(holder);if(v!=null){ChecklistTools.bindExpiry(v,detail);RuntimeStats.hit("Expiry cards bound");}}catch(Exception e){RuntimeStats.error("Expiry bind",e);}}
}
