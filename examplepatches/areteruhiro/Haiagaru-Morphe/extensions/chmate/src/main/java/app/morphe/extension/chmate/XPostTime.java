package app.morphe.extension.chmate;

import java.text.*;
import java.util.*;

/** X supplies UTC timestamps; render a fixed Japan timezone regardless of device timezone. */
final class XPostTime {
    static String japan(String value){
        if(value==null||value.isEmpty())return "";
        for(String pattern:new String[]{"yyyy-MM-dd'T'HH:mm:ss.SSSXXX","yyyy-MM-dd'T'HH:mm:ssXXX","EEE MMM dd HH:mm:ss Z yyyy"}){
            SimpleDateFormat input=new SimpleDateFormat(pattern,Locale.US);input.setLenient(false);input.setTimeZone(TimeZone.getTimeZone("UTC"));
            ParsePosition position=new ParsePosition(0);Date date=input.parse(value,position);
            if(date!=null&&position.getIndex()==value.length()){
                SimpleDateFormat output=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss 'JST'",Locale.JAPAN);
                output.setTimeZone(TimeZone.getTimeZone("Asia/Tokyo"));return output.format(date);
            }
        }
        return value;
    }
    private XPostTime(){}
}
