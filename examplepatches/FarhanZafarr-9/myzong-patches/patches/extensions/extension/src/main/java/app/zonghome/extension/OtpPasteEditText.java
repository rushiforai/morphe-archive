package app.zonghome.extension;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import android.view.inputmethod.InputConnectionWrapper;
import android.widget.EditText;
import android.widget.Toast;
import java.util.ArrayList;

/** Handles explicit paste/IME multi-digit commits before native per-cell processing. */
public final class OtpPasteEditText extends EditText {
    private static final ThreadLocal<Boolean> DISTRIBUTING=new ThreadLocal<>();
    public OtpPasteEditText(Context context,AttributeSet attributes){super(context,attributes,android.R.attr.editTextStyle);}

    public static LayoutInflater wrap(LayoutInflater original) {
        LayoutInflater copy=original.cloneInContext(original.getContext());
        try {
            copy.setFactory2(new LayoutInflater.Factory2() {
                @Override public View onCreateView(View parent,String name,Context context,AttributeSet attrs) {
                    if(!name.equals("EditText") && !name.equals("android.widget.EditText"))return null;
                    int id=View.NO_ID;
                    for(int i=0;i<attrs.getAttributeCount();i++)if(attrs.getAttributeNameResource(i)==android.R.attr.id) {
                        id=attrs.getAttributeResourceValue(i,View.NO_ID);break;
                    }
                    if(id==View.NO_ID)return null;
                    try {
                        if(FormStyleSpec.digit(context.getResources().getResourceEntryName(id)))return new OtpPasteEditText(context,attrs);
                    } catch(android.content.res.Resources.NotFoundException ignored) { }
                    return null; // LayoutInflater's merged original factory handles every other view.
                }
                @Override public View onCreateView(String name,Context context,AttributeSet attrs){return onCreateView(null,name,context,attrs);}
            });
            return copy;
        } catch(IllegalStateException factoryAlreadySet) { return original; }
    }
    @Override public boolean onTextContextMenuItem(int action) {
        if(action==android.R.id.paste || action==android.R.id.pasteAsPlainText) {
            ClipboardManager clipboard=(ClipboardManager)getContext().getSystemService(Context.CLIPBOARD_SERVICE);
            ClipData clip=clipboard==null?null:clipboard.getPrimaryClip();
            if(clip!=null && clip.getItemCount()>0 && distribute(clip.getItemAt(0).getText()))return true;
        }
        return super.onTextContextMenuItem(action);
    }
    @Override public InputConnection onCreateInputConnection(EditorInfo info) {
        InputConnection original=super.onCreateInputConnection(info);
        if(original==null)return null;
        return new InputConnectionWrapper(original,false) {
            @Override public boolean commitText(CharSequence text,int cursor) {
                if(distribute(text))return true;
                return super.commitText(text,cursor);
            }
        };
    }
    private boolean distribute(CharSequence source) {
        if(Boolean.TRUE.equals(DISTRIBUTING.get()) || !isEnabled())return false;
        String prefix=OtpPastePlan.prefix(ViewNames.name(this));
        if(prefix==null)return false;
        for(View parent=getParent() instanceof View?(View)getParent():null;parent!=null;
            parent=parent.getParent() instanceof View?(View)parent.getParent():null) {
            ArrayList<EditText> cells=new ArrayList<>();
            for(int i=1;i<=6;i++) {
                View peer=ViewNames.find(parent,prefix+i);
                if(!(peer instanceof EditText) || !peer.isShown())break;
                cells.add((EditText)peer);
            }
            int current=cells.indexOf(this);
            if(current>=0 && cells.size()>=4) {
                for(EditText cell:cells)if(!cell.isEnabled())return false;
                OtpPastePlan plan=OtpPastePlan.create(source,cells.size(),current);
                if(plan==null)return false;
                if(plan.rejected) {
                    Toast.makeText(getContext(),"Paste a full "+cells.size()+"-digit code, or fewer digits that fit from this box.",Toast.LENGTH_SHORT).show();
                    return true; // Do not truncate a code or overwrite another PIN row.
                }
                DISTRIBUTING.set(true);
                try {
                    // Clear the affected suffix first: no old/new mixed complete code is exposed to native validators.
                    for(int i=plan.start;i<cells.size();i++)cells.get(i).setText("");
                    for(int i=0;i<plan.digits.length();i++)cells.get(plan.start+i).setText(String.valueOf(plan.digits.charAt(i)));
                    int next=Math.min(cells.size()-1,plan.start+plan.digits.length());
                    EditText target=cells.get(next);
                    if(target.isAttachedToWindow() && target.isShown()) {target.requestFocus();target.setSelection(target.length());}
                } finally {DISTRIBUTING.remove();}
                return true;
            }
            if(OnboardingStyling.isRoot(parent))break;
        }
        return false;
    }
}
