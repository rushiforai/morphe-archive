package defpackage;

import android.content.Context;
import android.text.SpannableStringBuilder;
import android.widget.Filter;
import com.medium.proto.obv.post.AnchorType;
import com.medium.proto.obv.post.MarkupType;
import gen.model.User;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jde extends Filter {
    public final Filter.FilterResults a;
    public final Filter.FilterResults b;
    public final /* synthetic */ kde c;

    public jde(kde kdeVar) {
        this.c = kdeVar;
        User user = new User("tutorialSentinel", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -2, 268435455, null);
        Filter.FilterResults filterResults = new Filter.FilterResults();
        filterResults.count = 0;
        filterResults.values = ey3.a;
        this.a = filterResults;
        Filter.FilterResults filterResults2 = new Filter.FilterResults();
        filterResults2.count = 1;
        filterResults2.values = d46.Q(user);
        this.b = filterResults2;
    }

    @Override // android.widget.Filter
    public final CharSequence convertResultToString(Object obj) {
        String str;
        obj.getClass();
        User user = (User) obj;
        if (g76.L(user.user_id, "tutorialSentinel") || (str = user.name) == null) {
            return "";
        }
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder(str);
        Context context = this.c.a;
        Map map = si7.a;
        int length = str.length();
        String str2 = user.user_id;
        li7 li7Var = new li7();
        li7Var.a = MarkupType.A;
        li7Var.b = 0;
        li7Var.c = Integer.valueOf(length);
        li7Var.k = str2;
        li7Var.g = AnchorType.USER;
        spannableStringBuilder.setSpan(new lde(context, li7Var.build(), new tkc(15)), 0, str.length(), 0);
        return spannableStringBuilder;
    }

    @Override // android.widget.Filter
    public final Filter.FilterResults performFiltering(CharSequence charSequence) {
        rya ryaVar = new rya();
        String strValueOf = String.valueOf(charSequence);
        ryaVar.a = strValueOf;
        if (strValueOf.length() == 0 || !muc.q0((CharSequence) ryaVar.a, '@')) {
            return this.a;
        }
        String strSubstring = ((String) ryaVar.a).substring(1);
        ryaVar.a = strSubstring;
        if (strSubstring.length() == 0) {
            return this.b;
        }
        return (Filter.FilterResults) g01.U(zx3.a, new j5d(this.c, ryaVar, this, null, 13));
    }

    @Override // android.widget.Filter
    public final void publishResults(CharSequence charSequence, Filter.FilterResults filterResults) {
        Object obj = filterResults != null ? filterResults.values : null;
        List list = obj instanceof List ? (List) obj : null;
        if (list == null) {
            list = ey3.a;
        }
        boolean zIsEmpty = list.isEmpty();
        kde kdeVar = this.c;
        if (zIsEmpty && kdeVar.isEmpty()) {
            return;
        }
        kdeVar.setNotifyOnChange(false);
        if (!kdeVar.isEmpty()) {
            kdeVar.clear();
        }
        if (!list.isEmpty()) {
            kdeVar.addAll(list);
        }
        kdeVar.notifyDataSetChanged();
    }
}
