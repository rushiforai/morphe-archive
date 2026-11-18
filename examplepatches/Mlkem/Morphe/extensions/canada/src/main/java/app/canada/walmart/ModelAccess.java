package app.canada.walmart;

import java.lang.reflect.Field;

/** Version-specific data access, with no Android UI dependency. */
public final class ModelAccess {
    public static String expiry(Object detail)throws Exception {
        Object product=detail.getClass().getMethod("t").invoke(detail);
        Object messages=field(product,"Q");
        if(!(messages instanceof java.util.List)||((java.util.List<?>)messages).isEmpty())messages=field(product,"P");
        if(!(messages instanceof java.util.List)||((java.util.List<?>)messages).isEmpty())return "";
        Object first=((java.util.List<?>)messages).get(0);if(first==null)return "";
        Object value=field(first,"h");return value instanceof String?((String)value).trim():"";
    }
    public static Object field(Object object,String name)throws Exception {
        Field f=object.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(object);
    }
    public static Long price(Object detail)throws Exception {
        Object product=detail.getClass().getMethod("t").invoke(detail),info=field(product,"A");
        if(info==null||Boolean.TRUE.equals(field(product,"h")))return null;
        Object unit=field(product,"v");
        return ListMath.line((Double)field(info,"i"),(Double)field(info,"f"),(Integer)detail.getClass().getMethod("x").invoke(detail),Boolean.TRUE.equals(field(product,"i")),unit instanceof Enum && ((Enum<?>)unit).name().equals("EACH"));
    }
}
