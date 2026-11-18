package nl.johninnl.wuplaycar;
import java.util.Collections;
import java.util.List;
/** Decode the native Result payload: MetaResponse wraps Meta, it is not Meta itself. */
public final class NativeMetadata {
    public static final class Value {
        public final Object meta;public final List<?> videos;public final String description;
        Value(Object meta,List<?> videos,String description){this.meta=meta;this.videos=videos;this.description=description;}
    }
    public static Value decode(Object response) throws ReflectiveOperationException {
        if(response==null)throw new IllegalStateException("WuPlay returned no metadata response");
        Object meta=response.getClass().getField("meta").get(response);
        if(meta==null)throw new IllegalStateException("WuPlay returned no metadata");
        Object videos=meta.getClass().getField("videos").get(meta);
        if(videos!=null&&!(videos instanceof List))throw new IllegalStateException("WuPlay episode metadata schema changed");
        Object description=meta.getClass().getField("description").get(meta);
        return new Value(meta,videos==null?Collections.emptyList():(List<?>)videos,description==null?"":description.toString());
    }
    private NativeMetadata(){}
}
