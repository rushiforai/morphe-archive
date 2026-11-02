package app.morphe.extension.chmate;

import java.lang.reflect.Method;

/** Resolve the exact supplied thread; never fall back to another tab or a cached board. */
final class NativeThreadContext {
    static Object board(Object fragment,String version) throws Exception {
        if(fragment==null)return null;
        if("0.8.10.191 dev".equals(version))return NativeFields.find(fragment.getClass(),"W").get(fragment);
        Object model=QuickFilterToolbar.findResponseViewModel(fragment);
        return "0.8.10.226 dev".equals(version)?flow(model,"d","c"):flow(model,"r","d");
    }
    static Object flow(Object model,String field,String getter) throws ReflectiveOperationException {
        if(model==null)return null;
        Object flow=NativeFields.find(model.getClass(),field).get(model);
        if(flow==null)return null;
        Method method=flow.getClass().getMethod(getter);method.setAccessible(true);
        return method.invoke(flow);
    }
    static String url(Object board,String version,int response) throws ReflectiveOperationException {
        if(board==null)return null;
        String accessor="0.8.10.191 dev".equals(version)?"d":"0.8.10.226 dev".equals(version)?"e":"c";
        Method method=board.getClass().getMethod(accessor,int.class);method.setAccessible(true);
        Object value=method.invoke(board,response);
        return value instanceof String?(String)value:null;
    }
    private NativeThreadContext(){}
}
