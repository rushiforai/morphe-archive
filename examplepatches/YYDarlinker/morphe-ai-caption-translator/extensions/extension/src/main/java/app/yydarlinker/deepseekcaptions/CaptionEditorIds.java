package app.yydarlinker.deepseekcaptions;

import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;

/**
 * Stable per-field inline-editor identity.
 *
 * <p>All four inline editors used to share {@code android.R.id.edit}. Android restores a recycled
 * row's focus/selection state by view id, so identical ids let a recycled row hand one field's
 * cursor state to a different field. Each key now owns a distinct, deterministic id that survives
 * every later resource change because it is not a compiled resource id.</p>
 */
final class CaptionEditorIds {
    /** Deterministic app-private id space; never collides with a compiled resource id. */
    private static final int SPACE=0x7E000000;
    private static final int MASK=0x00FFFFFF;

    private CaptionEditorIds(){}

    static int forKey(String key){
        if(key==null||key.isEmpty())return View.NO_ID;
        int id=SPACE|(key.hashCode()&MASK);
        return id==View.NO_ID?View.generateViewId():id;
    }

    /** The inline editor of a bound preference row, addressed by the field it edits. */
    static EditText editorIn(View row,String key){
        if(row==null)return null;
        int id=forKey(key);
        if(id!=View.NO_ID){
            View found=row.findViewById(id);
            if(found instanceof EditText)return (EditText)found;
        }
        View legacy=row.findViewById(android.R.id.edit);
        if(legacy instanceof EditText)return (EditText)legacy;
        return firstEditor(row);
    }

    /** The inline editor of a row whose exact field is not known to the caller. */
    static EditText editorIn(View row){
        if(row==null)return null;
        View legacy=row.findViewById(android.R.id.edit);
        if(legacy instanceof EditText)return (EditText)legacy;
        return firstEditor(row);
    }

    private static EditText firstEditor(View view){
        if(view instanceof EditText)return (EditText)view;
        if(!(view instanceof ViewGroup))return null;
        ViewGroup group=(ViewGroup)view;
        for(int i=0;i<group.getChildCount();i++){
            EditText found=firstEditor(group.getChildAt(i));
            if(found!=null)return found;
        }
        return null;
    }
}
