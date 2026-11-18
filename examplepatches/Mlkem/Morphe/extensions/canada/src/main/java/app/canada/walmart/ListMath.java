package app.canada.walmart;

import java.math.*;
import java.util.*;

/** Pure calculations shared by production hooks and JVM tests. */
public final class ListMath {
    private ListMath(){}
    public static Long line(Double serverLine,Double unit,Integer quantity,boolean range,boolean soldByEach) {
        if(range)return null;
        Long provided=PriceLedger.cents(serverLine);if(provided!=null)return provided;
        if(!soldByEach||unit==null||PriceLedger.cents(unit)==null||quantity==null||quantity<=0||quantity>100000)return null;
        try {return BigDecimal.valueOf(unit).multiply(BigDecimal.valueOf(quantity)).movePointRight(2).setScale(0,RoundingMode.HALF_UP).longValueExact();}
        catch(ArithmeticException e){return null;}
    }
    /** Natural aisle ordering: A2 before A10; arbitrarily large numeric components. */
    public static int natural(String a,String b) {
        a=a.trim().toUpperCase(Locale.ROOT);b=b.trim().toUpperCase(Locale.ROOT);
        int i=0,j=0;
        while(i<a.length()&&j<b.length()) {
            char x=a.charAt(i),y=b.charAt(j);
            if(x>='0'&&x<='9'&&y>='0'&&y<='9') {
                int ei=i,ej=j;while(ei<a.length()&&Character.isDigit(a.charAt(ei)))ei++;while(ej<b.length()&&Character.isDigit(b.charAt(ej)))ej++;
                int c=new BigInteger(a.substring(i,ei)).compareTo(new BigInteger(b.substring(j,ej)));if(c!=0)return c;i=ei;j=ej;
            }else {if(x!=y)return Character.compare(x,y);i++;j++;}
        }
        return Integer.compare(a.length()-i,b.length()-j);
    }
    public static final class Total {
        public long remaining,collected;public int known,unknown;
        public void add(Long cents,boolean checked) {
            if(cents==null||cents<0){unknown++;return;}
            if(checked)collected+=cents;else remaining+=cents;known++;
        }
    }
}
