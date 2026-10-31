package q60;

import android.view.View;
import androidx.recyclerview.widget.s2;

/* loaded from: classes4.dex */
public abstract class b extends s2 {
    public final View a(int i5) {
        String strValueOf;
        View viewFindViewById = this.itemView.findViewById(i5);
        if (viewFindViewById != null) {
            return viewFindViewById;
        }
        if (i5 == 0 || i5 == -1) {
            strValueOf = String.valueOf(i5);
        } else {
            strValueOf = "R.id." + this.itemView.getResources().getResourceName(i5);
        }
        throw new NullPointerException(String.format("No view with id(R.id.%s) is found in layout: %s", strValueOf, this.itemView));
    }
}
