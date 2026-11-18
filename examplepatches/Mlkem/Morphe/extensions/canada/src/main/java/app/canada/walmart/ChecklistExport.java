package app.canada.walmart;
import java.util.*;
/** Snapshot of loaded rows; missing/unlinked prices remain explicitly unknown. */
final class ChecklistExport {
 static String render(List<Object> items,boolean csv)throws Exception {
  Set<String> ids=new HashSet<>();StringBuilder b=new StringBuilder(csv?"name,quantity,collected,line_price_cad\r\n":"Loaded Walmart checklist\nEstimated CAD before tax/fees\n\n");ListMath.Total total=new ListMath.Total();
  for(Object item:items){Object d=item.getClass().getMethod("e").invoke(item);Object rawId=d.getClass().getMethod("n").invoke(d);if(rawId!=null&&!rawId.toString().isEmpty()&&!ids.add(rawId.toString()))continue;
   boolean checked=Boolean.TRUE.equals(item.getClass().getMethod("f").invoke(item));Object product=d.getClass().getMethod("t").invoke(d);String name="";
   if(product!=null){Object supplied=ModelAccess.field(product,"o");if(supplied instanceof String)name=(String)supplied;}
   if(name.trim().isEmpty()){Object supplied=d.getClass().getMethod("k").invoke(d);name=supplied instanceof String?(String)supplied:"Unnamed list item";}
   Object q=d.getClass().getMethod("x").invoke(d);String qty=q==null?"unknown":q.toString();Long cents;try{cents=ModelAccess.price(d);}catch(Exception missing){cents=null;}total.add(cents,checked);
   if(csv)b.append(ShoppingMath.csv(name)).append(',').append(ShoppingMath.csv(qty)).append(',').append(checked).append(',').append(cents==null?"":String.format(Locale.ROOT,"%.2f",cents/100.0)).append("\r\n");
   else b.append(checked?"✓ ":"☐ ").append(name).append(" × ").append(qty).append(" · ").append(cents==null?"price unavailable":HistoryTools.money(cents)).append('\n');
  }
  if(!csv)b.append("\nSubtotal: ").append(HistoryTools.money(total.remaining+total.collected)).append("\nRemaining: ").append(HistoryTools.money(total.remaining)).append("\nCollected: ").append(HistoryTools.money(total.collected)).append("\nUnpriced, excluded: ").append(total.unknown);return b.toString();
 }
}
