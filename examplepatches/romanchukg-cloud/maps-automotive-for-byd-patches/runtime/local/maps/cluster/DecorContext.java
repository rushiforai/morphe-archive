package local.maps.cluster;
import android.content.*;
import android.content.res.Resources;
import android.graphics.drawable.*;
import android.util.TypedValue;
import java.util.*;
/** Defaults for the optional Android Auto chrome omitted from the cluster view. */
final class DecorContext extends ContextWrapper {
    private final Resources resources;
    DecorContext(Context base) { super(base); resources=new DecorResources(base.getResources()); }
    public Resources getResources() { return resources; }
    private static final class DecorResources extends Resources {
        private final Map<String,Integer> ids=new HashMap<>();
        DecorResources(Resources original) { super(original.getAssets(),original.getDisplayMetrics(),original.getConfiguration()); }
        private boolean local(int id){return (id&0xffff0000)==0x00f20000;}
        public int getIdentifier(String name,String type,String pkg) {
            int existing=super.getIdentifier(name,type,pkg);
            if(existing!=0 || !name.startsWith("gearhead_sdk_")) return existing;
            String key=type+"/"+name;
            Integer id=ids.get(key);
            if(id==null){id=0x00f20000+ids.size()+1;ids.put(key,id);android.util.Log.i("MapsClusterTest","local decor resource "+key);}
            return id;
        }
        public int getDimensionPixelSize(int id){return local(id)?0:super.getDimensionPixelSize(id);}
        public int getDimensionPixelOffset(int id){return local(id)?0:super.getDimensionPixelOffset(id);}
        public float getDimension(int id){return local(id)?0:super.getDimension(id);}
        public boolean getBoolean(int id){return !local(id)&&super.getBoolean(id);}
        public int getInteger(int id){return local(id)?0:super.getInteger(id);}
        public int getColor(int id,Theme theme){return local(id)?0:super.getColor(id,theme);}
        public String getString(int id){return local(id)?"":super.getString(id);}
        public Drawable getDrawable(int id,Theme theme){return local(id)?new ColorDrawable(0):super.getDrawable(id,theme);}
        public void getValue(int id,TypedValue out,boolean resolve){if(local(id)){out.type=TypedValue.TYPE_DIMENSION;out.data=0;out.resourceId=id;}else super.getValue(id,out,resolve);}
    }
}
