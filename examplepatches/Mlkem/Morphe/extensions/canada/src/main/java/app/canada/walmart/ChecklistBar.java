package app.canada.walmart;

import android.view.*;
import android.widget.*;

/** A single shared container, independent of patch execution order. UI thread only. */
final class ChecklistBar {
    private static final int BAR=0x7e010030;
    static LinearLayout get(View root)throws Exception {
        Object saved=root.getTag(BAR);if(saved instanceof LinearLayout)return (LinearLayout)saved;
        View list=ListEnhancements.id(root,"list_detail_recycler_view");
        View title=ListEnhancements.id(root,"list_title");
        if(list==null||title==null||!(list.getParent() instanceof ViewGroup))return null;
        LinearLayout bar=new LinearLayout(root.getContext());bar.setId(View.generateViewId());
        bar.setOrientation(LinearLayout.VERTICAL);int pad=ListEnhancements.dp(root,12);bar.setPadding(pad,0,pad,0);
        ViewGroup.LayoutParams lp=(ViewGroup.LayoutParams)list.getLayoutParams().getClass().getConstructor(int.class,int.class).newInstance(0,-2);
        lp.getClass().getField("e").setInt(lp,0);lp.getClass().getField("h").setInt(lp,0);lp.getClass().getField("j").setInt(lp,title.getId());
        ViewGroup.LayoutParams listParams=list.getLayoutParams();listParams.getClass().getField("j").setInt(listParams,bar.getId());
        ((ViewGroup)list.getParent()).addView(bar,lp);list.setLayoutParams(listParams);root.setTag(BAR,bar);
        return bar;
    }
}
