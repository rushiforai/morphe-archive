package com.walmart.glass.lists.domain;
/** Minimal test doubles for the observed Canada 26.31 model contract. */
public class ListItem {
  public static class AisleHeader {public final String name;public final int count;public AisleHeader(String name,int count){this.name=name;this.count=count;}}
  public static class ListDetailItem {
    private final ListItemProduct product;
    public ListDetailItem(ListItemProduct p){product=p;}
    public ListItemProduct t(){return product;}
    public Integer x(){return 2;}
    public String n(){return product==null?"manual":product.n;}
    public String k(){return "Manual item";}
  }
  public static class ChecklistItem {
    private final ListDetailItem detail;public boolean checked;
    public ChecklistItem(String aisle){detail=new ListDetailItem(new ListItemProduct(aisle));}
    public ChecklistItem(ListDetailItem d){detail=d;}
    public ListDetailItem e(){return detail;}
    public boolean f(){return checked;}
  }
}
