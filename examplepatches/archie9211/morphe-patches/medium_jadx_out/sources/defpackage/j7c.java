package defpackage;

import android.content.Context;
import android.content.Intent;
import com.medium.android.core.models.CatalogName;
import com.medium.android.core.share.PostShareData;
import com.medium.android.core.share.RepostShareData;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class j7c {
    public static void a(Context context, eg1 eg1Var) {
        String name;
        context.getClass();
        eg1Var.getClass();
        CatalogName catalogName = eg1Var.c;
        if (catalogName instanceof CatalogName.ReadingList) {
            name = context.getString(R.string.reading_list);
        } else {
            if (!(catalogName instanceof CatalogName.Name)) {
                ygf.a();
                return;
            }
            name = ((CatalogName.Name) catalogName).getName();
        }
        name.getClass();
        String string = context.getString(R.string.share_catalog_content, name, eg1Var.a.toString());
        string.getClass();
        String string2 = context.getString(R.string.share_catalog_email_subject, name);
        string2.getClass();
        String string3 = context.getString(R.string.share_catalog_prompt);
        string3.getClass();
        d(context, string3, string2, string);
    }

    public static void b(Context context, PostShareData postShareData) {
        postShareData.getClass();
        String str = (String) bu1.z0(postShareData.getHighlightedTexts());
        String string = (str == null || str.length() == 0) ? context.getString(R.string.share_post_content, postShareData.getPostTitle(), postShareData.getAuthorName(), postShareData.getShareUri().toString()) : context.getString(R.string.share_post_content_with_highlighted_text, str, postShareData.getPostTitle(), postShareData.getAuthorName(), postShareData.getShareUri().toString());
        string.getClass();
        String string2 = context.getString(R.string.share_post_email_subject, postShareData.getAuthorName());
        string2.getClass();
        String string3 = context.getString(R.string.share_post_prompt);
        string3.getClass();
        d(context, string3, string2, string);
    }

    public static void c(Context context, RepostShareData repostShareData) {
        String reposterUsername;
        context.getClass();
        repostShareData.getClass();
        PostShareData postShareData = repostShareData.getPostShareData();
        StringBuilder sb = new StringBuilder();
        if (!repostShareData.isReposterCurrentUser() && (reposterUsername = repostShareData.getReposterUsername()) != null && reposterUsername.length() != 0) {
            sb.append("@");
            sb.append(repostShareData.getReposterUsername());
            sb.append(" ");
        }
        String note = repostShareData.getNote();
        if (note != null && note.length() != 0) {
            sb.append(repostShareData.getNote());
            sb.append(" ");
        }
        sb.append(postShareData.getShareUri());
        String string = sb.toString();
        String string2 = context.getString(R.string.share_post_email_subject, postShareData.getAuthorName());
        string2.getClass();
        String string3 = context.getString(R.string.share_post_prompt);
        string3.getClass();
        d(context, string3, string2, string);
    }

    public static void d(Context context, String str, String str2, String str3) {
        o2b o2bVar = new o2b(context);
        o2bVar.d = str;
        Intent intent = (Intent) o2bVar.c;
        intent.setType("text/plain");
        intent.putExtra("android.intent.extra.SUBJECT", str2);
        intent.putExtra("android.intent.extra.TEXT", (CharSequence) str3);
        o2bVar.K();
    }
}
