package com.walmart.glass.lists.domain;
public class ListItemProduct {
  public String n="item-1",o="Test product",p="offer-1",t="seller-1";
  public final Location z;
  public Info A=new Info();public boolean h;public Boolean i=false;public Unit v=Unit.EACH;
  public java.util.List<Promo> P=java.util.Collections.emptyList(),Q=java.util.Collections.emptyList();
  public static class Promo {public String h;public Promo(String text){h=text;}}
  public ListItemProduct(String aisle){z=aisle==null?null:new Location(aisle);}
  public enum Unit {EACH,WEIGHT}
  public static class Location {public String d;public Object e;public Location(String display){d=display;}}
  public static class Info {public Double f=5.0,i=8.0;}
}
