package app.canada.walmart;
import android.app.*;import android.content.*;import android.graphics.*;import android.text.*;import android.view.*;import android.widget.*;import java.util.*;import java.text.DateFormat;

final class HistoryTools {
 static String name(Context c,String k){return HistoryStore.meta(c).getString(k+"_name","Previously saved item");}
 static long current(Context c,String k){List<PriceLedger.Point> p=HistoryTransfer.points(c,k);return p.isEmpty()?0:p.get(p.size()-1).cents;}
 static long drop(Context c,String k){List<PriceLedger.Point> p=HistoryTransfer.points(c,k);Long old=PriceLedger.previousDifferent(p);return old==null?0:old-current(c,k);}
 static boolean targetMet(Context c,String k){long t=HistoryStore.meta(c).getLong(k+"_target",-1);return t>=0&&current(c,k)<=t;}
 static String money(long n){return ListEnhancements.money(n,false);}
 static List<String> filtered(Context c,String query,int sort,boolean favorites,boolean targets,boolean drops){
  List<String> keys=HistoryStore.keys(c);String q=query.trim().toLowerCase(Locale.ROOT);SharedPreferences m=HistoryStore.meta(c);
  keys.removeIf(k->(!q.isEmpty()&&!(name(c,k)+" "+m.getString(k+"_scope","")+" "+m.getString(k+"_seller","")).toLowerCase(Locale.ROOT).contains(q))||(favorites&&!m.getBoolean(k+"_favorite",false))||(targets&&!targetMet(c,k))||(drops&&drop(c,k)<=0));
  if(sort==1)keys.sort((a,b)->name(c,a).compareToIgnoreCase(name(c,b)));if(sort==2)keys.sort((a,b)->Long.compare(drop(c,b),drop(c,a)));if(sort==3)keys.sort((a,b)->Long.compare(current(c,a),current(c,b)));return keys;
 }
 static void browse(Context c,boolean favoritesOnly){
  LinearLayout box=ToolUi.column(c);ToolUi.text(box,"Saved observations only. Revisit products to update prices and check targets.",14);
  EditText search=ToolUi.input(box,"Search product, store or seller",false);Spinner sort=new Spinner(c);sort.setAdapter(new ArrayAdapter<String>(c,android.R.layout.simple_spinner_dropdown_item,new String[]{"Recently observed","Name A–Z","Largest price drop","Lowest current price"}));box.addView(sort);
  CheckBox favorites=new CheckBox(c),targets=new CheckBox(c),drops=new CheckBox(c);favorites.setText("Favourites only");favorites.setChecked(favoritesOnly);targets.setText("Targets met");drops.setText("Price drops only");box.addView(favorites);box.addView(targets);box.addView(drops);
  TextView count=ToolUi.text(box,"",14);ListView list=new ListView(c);box.addView(list,new LinearLayout.LayoutParams(-1,ToolUi.dp(c,300)));
  final List<String> shown=new ArrayList<>();Runnable refresh=()->{shown.clear();shown.addAll(filtered(c,search.getText().toString(),sort.getSelectedItemPosition(),favorites.isChecked(),targets.isChecked(),drops.isChecked()));List<String> labels=new ArrayList<>();for(String k:shown){String label=(HistoryStore.meta(c).getBoolean(k+"_favorite",false)?"★ ":"")+name(c,k)+"\n"+money(current(c,k));long delta=drop(c,k);if(delta!=0)label+=(delta>0?"  ↓ ":"  ↑ ")+money(Math.abs(delta));if(targetMet(c,k))label+="  · target met";label+="\n"+HistoryStore.meta(c).getString(k+"_scope","Store not identified");labels.add(label);}list.setAdapter(new ArrayAdapter<String>(c,android.R.layout.simple_list_item_1,labels));count.setText(shown.isEmpty()?"No matching saved prices.":shown.size()+" histories");};
  search.addTextChangedListener(new TextWatcher(){public void beforeTextChanged(CharSequence s,int st,int n,int after){}public void onTextChanged(CharSequence s,int st,int before,int n){refresh.run();}public void afterTextChanged(Editable e){}});
  for(CheckBox cb:new CheckBox[]{favorites,targets,drops})cb.setOnCheckedChangeListener((b,on)->refresh.run());sort.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){public void onItemSelected(AdapterView<?> p,View v,int pos,long id){refresh.run();}public void onNothingSelected(AdapterView<?> p){}});
  list.setOnItemClickListener((p,v,pos,id)->detail(c,shown.get(pos),refresh));refresh.run();ToolUi.dialog(c,"Price history",box);
 }
 static String summary(Context c,String key){List<PriceLedger.Point> rows=HistoryTransfer.points(c,key);if(rows.isEmpty())return "No saved observations.";long min=Long.MAX_VALUE,max=0;for(PriceLedger.Point p:rows){min=Math.min(min,p.cents);max=Math.max(max,p.cents);}long now=rows.get(rows.size()-1).cents;String s="Latest "+money(now)+" CAD\nLowest "+money(min)+"  ·  Highest "+money(max)+"\n"+rows.size()+" observations";Long prior=PriceLedger.previousDifferent(rows);if(prior!=null)s+="\nChange from previous different price: "+(now<prior?"−":"+")+money(Math.abs(now-prior));long target=HistoryStore.meta(c).getLong(key+"_target",-1);if(target>=0)s+="\nTarget "+money(target)+(now<=target?" · met at last observation":" · not met at last observation");return s;}
 static void detail(Context c,String key,Runnable changed){
  LinearLayout box=ToolUi.column(c);SharedPreferences m=HistoryStore.meta(c);List<PriceLedger.Point> rows=HistoryTransfer.points(c,key);
  if(rows.isEmpty()){ToolUi.message(c,"No saved history","Resume price recording and revisit this product to save an observation.");return;}
  TextView summary=ToolUi.text(box,summary(c,key),17);ToolUi.text(box,m.getString(key+"_scope","Store not identified")+"\n"+m.getString(key+"_seller",""),14);
  if(rows.size()>1)box.addView(new Chart(c,rows),new LinearLayout.LayoutParams(-1,ToolUi.dp(c,150)));
  StringBuilder observations=new StringBuilder();DateFormat date=DateFormat.getDateTimeInstance(DateFormat.MEDIUM,DateFormat.SHORT);for(int i=rows.size()-1;i>=0;i--)observations.append(date.format(new Date(rows.get(i).time))).append("  ").append(money(rows.get(i).cents)).append('\n');
  if(rows.size()==1)observations.append("\nFirst price recorded. Revisit after a price change to compare.");ToolUi.text(box,observations.toString(),14).setTextIsSelectable(true);
  CheckBox favorite=new CheckBox(c);favorite.setText("Favourite / watchlist");favorite.setChecked(m.getBoolean(key+"_favorite",false));box.addView(favorite);favorite.setOnCheckedChangeListener((b,on)->{m.edit().putBoolean(key+"_favorite",on).apply();if(changed!=null)changed.run();});
  ToolUi.button(box,"Set target price",()->target(c,key,()->{summary.setText(summary(c,key));favorite.setChecked(m.getBoolean(key+"_favorite",false));if(changed!=null)changed.run();}));ToolUi.button(box,"Copy item history",()->ToolUi.copy(c,"item history",name(c,key)+"\n"+summary(c,key)+"\n"+observations));
  AlertDialog dialog=ToolUi.dialog(c,name(c,key),box);
  ToolUi.button(box,"Delete this history",()->ToolUi.confirm(c,"Delete history?","This removes this item's local observations, favourite and target.",()->{HistoryTransfer.remove(c,key);dialog.dismiss();if(changed!=null)changed.run();}));
 }
 static void target(Context c,String key,Runnable changed){LinearLayout box=ToolUi.column(c);ToolUi.text(box,"Checks the latest saved price when you open this tool. No background monitoring or push alerts.",14);EditText input=ToolUi.input(box,"Target price in CAD",true);long old=HistoryStore.meta(c).getLong(key+"_target",-1);if(old>=0)input.setText(String.format(Locale.ROOT,"%.2f",old/100.0));AlertDialog d=ToolUi.dialog(c,"Target price",box);
  ToolUi.button(box,"Save target",()->{try{long cents=ShoppingMath.value(input.getText().toString()).movePointRight(2).setScale(0,java.math.RoundingMode.HALF_UP).longValueExact();HistoryStore.meta(c).edit().putLong(key+"_target",cents).putBoolean(key+"_favorite",true).apply();d.dismiss();if(changed!=null)changed.run();ToolUi.message(c,"Target saved",targetMet(c,key)?"The latest observed price meets this target.":"Revisit the product to record a new price.");}catch(Exception e){input.setError("Enter a valid CAD amount");}});
  ToolUi.button(box,"Remove target",()->{HistoryStore.meta(c).edit().remove(key+"_target").apply();d.dismiss();if(changed!=null)changed.run();});
 }
 static final class Chart extends View {
  final List<PriceLedger.Point> points;final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
  Chart(Context c,List<PriceLedger.Point> p){super(c);points=p;setContentDescription("Observed price trend; exact dated prices are listed below");}
  protected void onDraw(Canvas c){super.onDraw(c);float pad=ToolUi.dp(getContext(),8),bottom=getHeight()-ToolUi.dp(getContext(),26),top=ToolUi.dp(getContext(),24);long lo=Long.MAX_VALUE,hi=0;for(PriceLedger.Point p:points){lo=Math.min(lo,p.cents);hi=Math.max(hi,p.cents);}long first=points.get(0).time,last=points.get(points.size()-1).time;double range=Math.max(1,hi-lo);paint.setColor(0xff0071ce);paint.setStrokeWidth(ToolUi.dp(getContext(),2));float px=0,py=0;for(int i=0;i<points.size();i++){PriceLedger.Point p=points.get(i);float x=pad+(getWidth()-2*pad)*(float)((p.time-first)/(double)Math.max(1,last-first));float y=hi==lo?(top+bottom)/2:bottom-(bottom-top)*(float)((p.cents-lo)/range);if(i>0)c.drawLine(px,py,x,y,paint);c.drawCircle(x,y,ToolUi.dp(getContext(),3),paint);px=x;py=y;}paint.setTextSize(ToolUi.dp(getContext(),12));c.drawText(money(lo)+" — "+money(hi)+" CAD",pad,top-6,paint);DateFormat f=DateFormat.getDateInstance(DateFormat.SHORT);c.drawText(f.format(new Date(first))+" → "+f.format(new Date(last)),pad,getHeight()-pad,paint);}
 }
}
