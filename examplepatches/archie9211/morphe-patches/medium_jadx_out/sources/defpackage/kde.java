package defpackage;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Filter;
import android.widget.ImageView;
import android.widget.TextView;
import com.medium.reader.R;
import gen.model.User;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kde extends ArrayAdapter {
    public final Context a;
    public final xi1 b;

    public kde(Context context, xi1 xi1Var) {
        super(context, R.layout.common_user_mention_item);
        this.a = context;
        this.b = xi1Var;
    }

    @Override // android.widget.ArrayAdapter, android.widget.Filterable
    public final Filter getFilter() {
        return new jde(this);
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public final View getView(int i, View view, ViewGroup viewGroup) {
        viewGroup.getClass();
        Object item = getItem(i);
        if (item == null) {
            ay0.e("User is null");
            return null;
        }
        User user = (User) item;
        boolean zL = g76.L(user.user_id, "tutorialSentinel");
        if (view == null) {
            view = LayoutInflater.from(this.a).inflate(R.layout.common_user_mention_item, viewGroup, false);
        }
        if (view == null) {
            ygf.f("Result could not be null");
            return null;
        }
        View viewFindViewById = view.findViewById(R.id.tutorial_group);
        viewFindViewById.getClass();
        viewFindViewById.setVisibility(zL ? 0 : 8);
        View viewFindViewById2 = view.findViewById(R.id.result_group);
        viewFindViewById2.getClass();
        viewFindViewById2.setVisibility(zL ? 8 : 0);
        if (zL) {
            return view;
        }
        TextView textView = (TextView) view.findViewById(R.id.common_user_mention_item_name);
        TextView textView2 = (TextView) view.findViewById(R.id.common_user_mention_item_username);
        ImageView imageView = (ImageView) view.findViewById(R.id.common_user_mention_item_avatar);
        textView.setText(user.name);
        textView2.setText("@" + user.username);
        imageView.getClass();
        String str = user.image_id;
        if (str == null) {
            str = null;
        }
        ax5 ax5Var = str != null ? new ax5(str) : null;
        gx5 gx5VarA = yec.a(imageView.getContext());
        nx5 nx5Var = new nx5(imageView.getContext());
        nx5Var.c = ax5Var;
        q84 q84Var = wx5.a;
        nx5Var.d = new fy5(imageView);
        hlg.W(nx5Var);
        ((kva) gx5VarA).a(nx5Var.a());
        return view;
    }
}
