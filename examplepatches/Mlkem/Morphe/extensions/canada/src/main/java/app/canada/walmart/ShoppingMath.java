package app.canada.walmart;
import java.math.*;import java.util.*;
/** Local estimates only. No tax-rate, coupon or checkout assumptions. */
public final class ShoppingMath {
 static BigDecimal value(String text){BigDecimal n=new BigDecimal(text.trim().replace(',','.'));if(n.signum()<0||n.compareTo(new BigDecimal("1000000"))>0)throw new IllegalArgumentException("Use values from 0 to 1,000,000");return n;}
 public static BigDecimal perUnit(String price,String size,String packs){BigDecimal amount=value(size).multiply(value(packs));if(amount.signum()==0)throw new IllegalArgumentException("Size and pack count must be greater than zero");return value(price).divide(amount,8,RoundingMode.HALF_UP);}
 public static BigDecimal total(String price,String quantity,String discount,String tax){BigDecimal d=value(discount),t=value(tax);if(d.compareTo(new BigDecimal(100))>0||t.compareTo(new BigDecimal(100))>0)throw new IllegalArgumentException("Percentages must be between 0 and 100");return value(price).multiply(value(quantity)).multiply(BigDecimal.ONE.subtract(d.movePointLeft(2))).multiply(BigDecimal.ONE.add(t.movePointLeft(2))).setScale(2,RoundingMode.HALF_UP);}
 static String csv(String s){if(s==null)s="";if(s.matches("(?s)^[\\s]*[=+@-].*")||s.startsWith("\t")||s.startsWith("\r"))s="'"+s;return "\""+s.replace("\"","\"\"")+"\"";}
}
