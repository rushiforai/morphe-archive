package app.canada.walmart;

import android.app.AlertDialog;
import android.content.*;
import android.graphics.Typeface;
import android.text.*;
import android.text.style.*;
import android.util.TypedValue;
import android.view.*;
import android.widget.*;
import java.lang.reflect.*;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.util.*;

public final class ListEnhancements {
    private static final int HISTORY_BIND=0x7e010010;
    private static final String HISTORY_MARK="\n↕ ";
    static Object field(Object object,String name)throws Exception {
        return ModelAccess.field(object,name);
    }
    static View id(View root,String name) {
        int n=root.getResources().getIdentifier(name,"id",root.getContext().getPackageName());return n==0?null:root.findViewById(n);
    }
    static boolean french(View view){return "fr".equals(view.getResources().getConfiguration().getLocales().get(0).getLanguage());}
    static int dp(View view,int value){return (int)(view.getResources().getDisplayMetrics().density*value+.5f);}
    static SharedPreferences history(Context c){return c.getSharedPreferences("morphe_canada_price_history_v1",Context.MODE_PRIVATE);}
    static String text(View v){return v instanceof TextView?((TextView)v).getText().toString().trim():"";}
    static String money(long cents,boolean fr){NumberFormat f=NumberFormat.getCurrencyInstance(fr?Locale.CANADA_FRENCH:Locale.CANADA);return f.format(cents/100.0);}
    static String scope(View tile) {
        for(View v=tile;v!=null;) {
            int id=v.getId();
            if(id!=View.NO_ID)try {
                if("checklist_scroll_view".equals(v.getResources().getResourceEntryName(id))) {
                    String name=text(id(v,"store_name")),address=text(id(v,"store_address"));
                    if(!address.isEmpty())return name+" · "+address;
                }
            }catch(Exception ignored){}
            v=v.getParent() instanceof View?(View)v.getParent():null;
        }
        return french(tile)?"Liste — magasin non identifié":"Shopping list — store not identified";
    }
    static String digest(String value)throws Exception {
        byte[] bytes=MessageDigest.getInstance("SHA-256").digest(value.getBytes(StandardCharsets.UTF_8));
        StringBuilder s=new StringBuilder("p_");for(byte b:bytes)s.append(String.format(Locale.ROOT,"%02x",b&255));return s.toString();
    }
    private static final int HISTORY_BUTTON=0x7e010011;
    static Button historyButton(View tile)throws Exception {
        Object old=tile.getTag(HISTORY_BUTTON);if(old instanceof Button)return (Button)old;
        if(!(tile instanceof ViewGroup))return null;
        View anchor=id(tile,"unit_of_measure_selector");if(anchor==null)return null;
        ViewGroup parent=(ViewGroup)tile;
        Button button=new Button(tile.getContext());button.setId(View.generateViewId());button.setAllCaps(false);button.setTextSize(14);button.setMinHeight(dp(tile,48));button.setMinimumHeight(dp(tile,48));
        ViewGroup.LayoutParams lp=(ViewGroup.LayoutParams)anchor.getLayoutParams().getClass().getConstructor(int.class,int.class).newInstance(0,-2);
        lp.getClass().getField("e").setInt(lp,0);lp.getClass().getField("h").setInt(lp,0);lp.getClass().getField("l").setInt(lp,0);
        // Move the existing bottom-to-parent anchors above our footer, preserving native controls.
        for(int i=0;i<parent.getChildCount();i++){View child=parent.getChildAt(i);ViewGroup.LayoutParams c=child.getLayoutParams();try{if(c.getClass().getField("l").getInt(c)==0){c.getClass().getField("l").setInt(c,-1);c.getClass().getField("k").setInt(c,button.getId());child.setLayoutParams(c);}}catch(NoSuchFieldException ignored){}}
        parent.addView(button,lp);tile.setTag(HISTORY_BUTTON,button);return button;
    }
    public static void bindHistory(final View tile,Object detail) {
        RuntimeStats.hit("List history cards bound");
        final Object token=new Object();tile.setTag(HISTORY_BIND,token);
        HistoryValue value=null;try{value=HistoryValue.list(detail);}catch(Exception e){RuntimeStats.error("List price extraction",e);}
        final HistoryValue price=value;
        tile.post(()->{if(tile.getTag(HISTORY_BIND)!=token)return;try{
            Button button=historyButton(tile);if(button==null){RuntimeStats.hit("History footer unavailable");return;}
            boolean fr=french(tile);
            if(price==null){button.setText(fr?"Historique : prix exact indisponible":"History: exact price unavailable");button.setOnClickListener(v->HistoryStore.showAll(tile.getContext()));RuntimeStats.hit("Prices skipped: missing/range/suppressed");return;}
            String context=scope(tile),key=digest(price.id+"\n"+price.offer+"\n"+price.seller+"\n"+price.unit+"\n"+context);
            boolean recording=ToolSettings.record(tile.getContext(),false);
            List<PriceLedger.Point> points=recording?HistoryStore.record(tile.getContext(),key,price.name,context,price.seller,price.cents):HistoryTransfer.points(tile.getContext(),key);
            Long previous=PriceLedger.previousDifferent(points);
            String label=(fr?"Historique · ":"History · ")+money(price.cents,fr)+" · "+points.size()+(fr?" relevé(s)":" saved");
            if(!recording)label+=" · paused";
            if(previous!=null)label+=" · "+(price.cents<previous?"↓ ":"↑ ")+money(Math.abs(price.cents-previous),fr);
            button.setText(label);button.setOnClickListener(v->HistoryStore.show(tile.getContext(),key,()->button.setText(fr?"Historique effacé":"History cleared")));
            RuntimeStats.hit("History buttons shown");
        }catch(Exception e){RuntimeStats.error("History footer",e);}});
    }
    public static void bindBrowse(final View tile,Object model) {
        RuntimeStats.hit("Browse history cards bound");final Object token=new Object();tile.setTag(HISTORY_BIND,token);
        HistoryValue extracted=null;try{extracted=HistoryValue.browse(model);}catch(Exception e){RuntimeStats.error("Browse price extraction",e);}
        final HistoryValue price=extracted;
        tile.post(()->{if(tile.getTag(HISTORY_BIND)!=token)return;try{
            if(price==null){RuntimeStats.hit("Browse prices skipped: no exact displayed price");return;}
            if(!tile.isShown()||!ToolSettings.record(tile.getContext(),true))return;
            String name=text(id(tile,"product_tile_title"));if(name.isEmpty())name=price.name;
            String key=digest("browse\n"+price.id+"\n"+price.offer+"\n"+price.seller+"\n"+price.unit+"\n"+price.scope);
            HistoryStore.record(tile.getContext(),key,name,price.scope,price.seller,price.cents);
        }catch(Exception e){RuntimeStats.error("Browse price history",e);}});
    }
    public static void unitPrice(final View tile) {
        tile.post(() -> {
            try {
                Object raw=tile.getClass().getMethod("getListDetailPerEachPrice").invoke(tile);
                View view=id(tile,"lists_item_detail_per_each_price");
                if(!(view instanceof TextView)||!(raw instanceof String)||((String)raw).trim().isEmpty())return;
                TextView text=(TextView)view;text.setText((String)raw);text.setVisibility(View.VISIBLE);
                float sp=text.getTextSize()/text.getResources().getDisplayMetrics().scaledDensity;
                text.setTextSize(TypedValue.COMPLEX_UNIT_SP,Math.max(16,sp));text.setTypeface(text.getTypeface(),Typeface.BOLD);
                text.setTextColor(0xff004b76);text.setMaxLines(3);RuntimeStats.hit("Unit prices displayed");
            }catch(Exception e){android.util.Log.w("WalmartCanadaMorphe","Unit price unavailable",e);}
        });
    }
}
