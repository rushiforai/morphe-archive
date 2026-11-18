package app.canada.walmart;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.*;

/** Pure price-history logic; never uses line totals or purchase limits. */
public final class PriceLedger {
    public static final int MAX_POINTS=30;
    public static final class Point {
        public final long time,cents;
        public Point(long time,long cents){this.time=time;this.cents=cents;}
    }
    public static Long cents(Double dollars) {
        if(dollars==null || dollars.isNaN() || dollars.isInfinite() || dollars<0 || dollars>1000000) return null;
        return BigDecimal.valueOf(dollars).movePointRight(2).setScale(0,RoundingMode.HALF_UP).longValue();
    }
    public static List<Point> decode(String stored) {
        List<Point> points=new ArrayList<>();
        if(stored!=null)for(String row:stored.split(";"))try{
            String[] parts=row.split(",");
            long t=Long.parseLong(parts[0]),c=Long.parseLong(parts[1]);
            if(parts.length==2 && t>0 && c>=0)points.add(new Point(t,c));
        }catch(RuntimeException ignored){}
        return points;
    }
    public static String encode(List<Point> points) {
        StringBuilder s=new StringBuilder();for(Point p:points)s.append(p.time).append(',').append(p.cents).append(';');return s.toString();
    }
    public static List<Point> observe(List<Point> prior,long now,long cents) {
        List<Point> next=new ArrayList<>(prior);
        if(!next.isEmpty()) {
            Point last=next.get(next.size()-1);
            // Clock rollback cannot manufacture a new earlier observation.
            if(now<last.time)return next;
            if(last.cents==cents && sameLocalDay(last.time,now))return next;
        }
        next.add(new Point(now,cents));
        while(next.size()>MAX_POINTS)next.remove(0);
        return next;
    }
    private static boolean sameLocalDay(long a,long b) {
        Calendar x=Calendar.getInstance(),y=Calendar.getInstance();x.setTimeInMillis(a);y.setTimeInMillis(b);
        return x.get(Calendar.ERA)==y.get(Calendar.ERA)&&x.get(Calendar.YEAR)==y.get(Calendar.YEAR)&&x.get(Calendar.DAY_OF_YEAR)==y.get(Calendar.DAY_OF_YEAR);
    }
    public static Long previousDifferent(List<Point> points) {
        if(points.size()<2)return null;
        long current=points.get(points.size()-1).cents;
        for(int i=points.size()-2;i>=0;i--)if(points.get(i).cents!=current)return points.get(i).cents;
        return null;
    }
}
