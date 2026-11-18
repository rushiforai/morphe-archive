package com.walmart.glass.lists.view.lists;
import android.content.*;
import android.content.res.Resources;
import android.view.*;
import android.widget.*;

/** Test view exposing the verified resource names and obfuscated ConstraintLayout fields. */
public class ListDetailTileView extends FrameLayout {
 public static final int UNIT=0x7f010001,PRICE=0x7f010002;
 private Resources testResources;
 public static class Params extends FrameLayout.LayoutParams {
  public int e=-1,h=-1,j=-1,k=-1,l=-1;
  public Params(int w,int height){super(w,height);}
 }
 public ListDetailTileView(Context c){super(c);Resources r=super.getResources();testResources=new Resources(r.getAssets(),r.getDisplayMetrics(),r.getConfiguration()){
  @Override public int getIdentifier(String n,String type,String pkg){if(n.equals("unit_of_measure_selector"))return UNIT;if(n.equals("lists_item_detail_price"))return PRICE;return super.getIdentifier(n,type,pkg);}
 };View unit=new View(c);unit.setId(UNIT);Params lp=new Params(120,32);lp.l=0;addView(unit,lp);TextView price=new TextView(c);price.setId(PRICE);price.setText("$5.00");price.setVisibility(View.GONE);addView(price,new Params(90,30));}
 @Override public Resources getResources(){return testResources==null?super.getResources():testResources;}
}
