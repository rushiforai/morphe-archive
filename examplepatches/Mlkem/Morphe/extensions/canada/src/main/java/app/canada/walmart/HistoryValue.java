package app.canada.walmart;

/** Price extraction without Android dependencies. */
public final class HistoryValue {
    public final String id,offer,seller,unit,name,scope;public final long cents;
    HistoryValue(String id,String offer,String seller,String unit,String name,String scope,long cents){this.id=id;this.offer=offer;this.seller=seller;this.unit=unit;this.name=name;this.scope=scope;this.cents=cents;}
    static String string(Object o){return o==null?"":o.toString();}
    public static HistoryValue list(Object detail)throws Exception {
        Object p=detail.getClass().getMethod("t").invoke(detail),info=ModelAccess.field(p,"A");
        if(info==null||Boolean.TRUE.equals(ModelAccess.field(p,"h"))||Boolean.TRUE.equals(ModelAccess.field(p,"i")))return null;
        Long cents=PriceLedger.cents((Double)ModelAccess.field(info,"f"));String id=string(ModelAccess.field(p,"n"));
        if(cents==null||id.isEmpty())return null;
        return new HistoryValue(id,string(ModelAccess.field(p,"p")),string(ModelAccess.field(p,"t")),string(ModelAccess.field(p,"v")),string(ModelAccess.field(p,"o")),"",cents);
    }
    static Object call(Object o,String name)throws Exception {java.lang.reflect.Method m=o.getClass().getMethod(name);m.setAccessible(true);return m.invoke(o);}
    public static HistoryValue browse(Object model)throws Exception {
        Object p=call(model,"getData"),price=call(model,"U");if(p==null||price==null)return null;
        if(Boolean.TRUE.equals(ModelAccess.field(price,"o")))return null; // Native see-price-in-cart flag.
        Long cents=PriceLedger.cents((Double)ModelAccess.field(price,"b"));if(cents==null||!exactDisplay(string(ModelAccess.field(price,"a")),cents))return null;
        String id=string(ModelAccess.field(p,"j"));if(id.isEmpty())id=string(ModelAccess.field(p,"i"));if(id.isEmpty())return null;
        String scope="Browse — store not identified · "+string(ModelAccess.field(p,"t"))+" · "+(Boolean.TRUE.equals(ModelAccess.field(price,"B"))?"store price":"displayed offer");
        return new HistoryValue(id,string(ModelAccess.field(p,"g")),string(ModelAccess.field(p,"k")),string(ModelAccess.field(p,"z")),id,scope,cents);
    }
    public static boolean exactDisplay(String display,long raw){
        String s=display.replace("CAD","").replace("CA$","").replace("$","").replace(" ","").replace("\u00a0","").replace("\u202f","");
        if(!s.matches("[0-9]+(?:[.,][0-9]+)*"))return false;
        int comma=s.lastIndexOf(','),dot=s.lastIndexOf('.');
        if(comma>=0&&dot>=0)s=comma>dot?s.replace(".","").replace(',','.'):s.replace(",","");else if(comma>=0)s=s.replace(',','.');
        try{Long c=PriceLedger.cents(Double.valueOf(s));return c!=null&&c.longValue()==raw;}catch(RuntimeException e){return false;}
    }
}
