package app.morphe.extension.boost;

import android.view.View;
import java.util.HashMap;

/** Resource ids never change at runtime, so each name is only looked up once. */
final class Ids {
    private static final HashMap<String,Integer> VIEWS=new HashMap<>();
    private Ids() { }
    static int view(View root,String name) {
        synchronized(VIEWS) {
            Integer known=VIEWS.get(name);if(known!=null)return known;
            int id=root.getResources().getIdentifier(name,"id",root.getContext().getPackageName());
            VIEWS.put(name,id);return id;
        }
    }
}
