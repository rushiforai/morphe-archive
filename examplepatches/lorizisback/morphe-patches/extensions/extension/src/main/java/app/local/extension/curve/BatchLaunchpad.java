package app.local.extension.curve;

import android.app.Activity;
import android.content.Intent;
import java.util.*;

final class BatchLaunchpad {
    private static final String ID="morphe_batch_gbit";
    private static boolean matches(Object item) throws Exception {
        return item!=null && item.getClass().getName().equals("com.curve.launchpad.model.LaunchpadItem$Button") && ID.equals(BatchCurve.call(item,"getId"));
    }
    static List<?> add(List<?> items) {
        if(!BatchGbitActivity.isIncluded()) return items;
        try {
            List<Object> result=new ArrayList<>();
            for(Object item:items) if(!matches(item)) result.add(item);
            if(!PatchSettings.isBatchEnabled()) return result;
            Class<?> action=Class.forName("com.curve.launchpad.model.LaunchpadAction");
            Object button=Class.forName("com.curve.launchpad.model.LaunchpadItem$Button")
                .getConstructor(String.class,String.class,String.class,String.class,action)
                .newInstance("Batch GBIT","file:///android_asset/morphe_batch_gbit.png",null,ID,action.getField("NONE").get(null));
            int index=0;
            while(index<result.size() && !PatchSettings.isPatches(result.get(index))) index++;
            result.add(index,button); return result;
        } catch(Exception e) { throw new IllegalStateException("Curve Launchpad contract changed",e); }
    }
    static boolean open(Object fragment,Object item) {
        if(!BatchGbitActivity.isIncluded()) return false;
        try {
            if(!matches(item)) return false;
            if(!PatchSettings.isBatchEnabled()) return true;
            Activity activity=(Activity)BatchCurve.call(fragment,"requireActivity");
            activity.startActivity(new Intent(activity,BatchGbitActivity.class)); return true;
        } catch(Exception e) { throw new IllegalStateException("Could not open Batch GBIT",e); }
    }
}
