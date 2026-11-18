package app.canada.walmart;

import android.content.*;
import android.graphics.Typeface;
import android.view.*;
import android.widget.*;
import java.lang.reflect.*;
import java.util.*;

public final class ChecklistTools {
    private static final int TOTAL=0x7e010031,SCANNER=0x7e010032,EXPIRY=0x7e010033;
    private static Object invoke(Object o,String name)throws Exception{return o.getClass().getMethod(name).invoke(o);}
    public static void installScanner(final View root) {
        root.post(()->{try {
            if(root.getTag(SCANNER)!=null)return;LinearLayout bar=ChecklistBar.get(root);if(bar==null)return;
            Button scan=new Button(root.getContext());boolean fr=ListEnhancements.french(root);
            scan.setText(fr?"Scanner un code-barres":"Scan barcode");scan.setMinimumHeight(ListEnhancements.dp(root,48));
            scan.setOnClickListener(v->{try {
                Intent intent=new Intent().setClassName(root.getContext().getPackageName(),"com.walmart.glass.globalscanner.views.GlobalScannerActivity");
                intent.putExtra("extraIncludeAllHandlers",true);intent.putExtra("extraClient","lists");
                root.getContext().startActivity(intent);
            }catch(RuntimeException e){Toast.makeText(root.getContext(),fr?"Scanner indisponible":"Scanner unavailable",Toast.LENGTH_SHORT).show();android.util.Log.w("WalmartCanadaMorphe","Scanner launch failed",e);}});
            bar.addView(scan,new LinearLayout.LayoutParams(-1,-2));root.setTag(SCANNER,scan);RuntimeStats.hit("Scanner buttons shown");
        }catch(Exception e){android.util.Log.w("WalmartCanadaMorphe","Scanner shortcut unavailable",e);}});
    }
    static void rows(Object adapter,List<Object> out)throws Exception {
        if(adapter==null)return;String name=adapter.getClass().getName();
        if(name.equals("androidx.recyclerview.widget.h")) {
            for(Object child:(List<?>)invoke(adapter,"u"))rows(child,out);
        }else if(name.equals("com.walmart.glass.lists.view.lists.a")||name.equals("e40.e0")) {
            int n=(Integer)invoke(adapter,"getItemCount");Method get=adapter.getClass().getMethod("u",int.class);
            for(int i=0;i<n;i++) {Object row=get.invoke(adapter,i);if(row.getClass().getName().equals("com.walmart.glass.lists.domain.ListItem$ChecklistItem"))out.add(row);}
        }else throw new IllegalStateException("Unrecognized checklist adapter "+name);
    }
    private static final class Totals implements Runnable,View.OnAttachStateChangeListener {
        final View root,list;final TextView text;final boolean fr;
        Totals(View root,View list,TextView text){this.root=root;this.list=list;this.text=text;fr=ListEnhancements.french(root);}
        public void run() {
            root.removeCallbacks(this);if(!root.isAttachedToWindow())return;
            if(root.isShown()&&root.getWindowVisibility()==View.VISIBLE)refresh();
            root.postDelayed(this,1000);
        }
        void refresh() {
            try {
                Object adapter=invoke(list,"getAdapter");
                if(adapter==null){set(fr?"Total : chargement…":"Total: loading…");return;}
                List<Object> items=new ArrayList<>();rows(adapter,items);Set<String> seen=new HashSet<>();ListMath.Total sum=new ListMath.Total();
                for(Object item:items) {
                    Object detail=invoke(item,"e");String id=String.valueOf(invoke(detail,"n"));
                    if(!id.equals("null")&&!id.isEmpty()&&!seen.add(id))continue;
                    Long cents;try{cents=ModelAccess.price(detail);}catch(Exception e){cents=null;}
                    sum.add(cents,Boolean.TRUE.equals(invoke(item,"f")));
                }
                String value=(fr?"Sous-total estimé : ":"Estimated subtotal: ")+ListEnhancements.money(sum.remaining+sum.collected,fr);
                value+="\n"+(fr?"À prendre : ":"Remaining: ")+ListEnhancements.money(sum.remaining,fr)+(fr?"  ·  Cochés : ":"  ·  Collected: ")+ListEnhancements.money(sum.collected,fr);
                value+="\n"+(fr?"Avant taxes/frais. ":"Before tax/fees. ")+sum.known+(fr?" articles chiffrés; ":" priced items; ")+sum.unknown+(fr?" sans prix, exclus.":" unpriced, excluded.");
                set(value);
            }catch(Exception e){set(fr?"Total indisponible":"Total unavailable");}
        }
        void set(String value){if(value.contains("unavailable")||value.contains("indisponible"))RuntimeStats.hit("Total unavailable");else RuntimeStats.hit("Total refreshed");if(!text.getText().toString().equals(value))text.setText(value);}
        public void onViewAttachedToWindow(View v){run();}
        public void onViewDetachedFromWindow(View v){root.removeCallbacks(this);}
    }
    public static void installTotal(final View root) {
        root.post(()->{try {
            if(root.getTag(TOTAL)!=null)return;LinearLayout bar=ChecklistBar.get(root);View list=ListEnhancements.id(root,"list_detail_recycler_view");if(bar==null||list==null)return;
            TextView text=new TextView(root.getContext());text.setTextSize(15);text.setTextColor(0xff183e60);text.setPadding(0,ListEnhancements.dp(root,8),0,ListEnhancements.dp(root,8));
            bar.addView(text,0,new LinearLayout.LayoutParams(-1,-2));Totals total=new Totals(root,list,text);root.setTag(TOTAL,total);RuntimeStats.hit("Total panels shown");root.addOnAttachStateChangeListener(total);total.run();
        }catch(Exception e){android.util.Log.w("WalmartCanadaMorphe","List total unavailable",e);}});
    }
    public static void bindExpiry(final View tile,Object detail) {
        final Object token=new Object();tile.setTag(EXPIRY,token);
        String supplied;try{supplied=ModelAccess.expiry(detail);}catch(Exception e){supplied="";}
        final String expiry=supplied;
        tile.post(()->{try {
            if(tile.getTag(EXPIRY)!=token)return;
            View view=ListEnhancements.id(tile,"lists_item_promotion_expiration_message");if(!(view instanceof TextView))return;
            TextView text=(TextView)view;
            text.setText(android.text.Html.fromHtml(expiry,android.text.Html.FROM_HTML_MODE_LEGACY));
            text.setVisibility(expiry.isEmpty()?View.GONE:View.VISIBLE);
            if(expiry.isEmpty()){View icon=ListEnhancements.id(tile,"lists_item_promotion_expiration_icon");if(icon!=null)icon.setVisibility(View.GONE);text.setContentDescription(null);return;}
            text.setMaxLines(4);text.setTextSize(16);text.setTypeface(text.getTypeface(),Typeface.BOLD);text.setTextColor(0xff8a3600);
            text.setContentDescription((ListEnhancements.french(tile)?"Fin de promotion : ":"Promotion expiry: ")+text.getText());
        }catch(Exception e){android.util.Log.w("WalmartCanadaMorphe","Promotion expiry unavailable",e);}});
    }
    public static void hidePromotionBanner(final View banner) {
        RuntimeStats.hit("List promo banners hidden");banner.setVisibility(View.GONE);banner.setMinimumHeight(0);
        ViewGroup.LayoutParams lp=banner.getLayoutParams();if(lp!=null){lp.height=0;banner.setLayoutParams(lp);}
    }
    public static void hidePromotionHolder(Object holder) {
        try {View row=ShoppingMode.itemView(holder);if(row!=null)hidePromotionBanner(row);}
        catch(Exception e){android.util.Log.w("WalmartCanadaMorphe","Promotion banner unavailable",e);}
    }
}
