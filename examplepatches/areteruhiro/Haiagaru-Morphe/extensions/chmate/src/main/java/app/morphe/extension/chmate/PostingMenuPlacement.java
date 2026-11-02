package app.morphe.extension.chmate;
import android.widget.PopupWindow;
/** Keep the native posting menu above the IME without hiding the keyboard or replacing its actions. */
public final class PostingMenuPlacement {
    public static void prepare(PopupWindow popup){if(popup!=null)popup.setInputMethodMode(PopupWindow.INPUT_METHOD_NEEDED);}
    private PostingMenuPlacement(){}
}
