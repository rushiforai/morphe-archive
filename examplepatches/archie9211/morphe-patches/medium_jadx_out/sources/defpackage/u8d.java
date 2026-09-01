package defpackage;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import androidx.compose.ui.platform.ComposeView;
import com.medium.android.core.navigation.PublicationReference;
import com.medium.android.core.navigation.PublicationTab;
import com.medium.android.tag.tagpage.TagFragment;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class u8d implements d9d {
    public final /* synthetic */ TagFragment a;
    public final /* synthetic */ ComposeView b;

    public u8d(TagFragment tagFragment, ComposeView composeView) {
        this.a = tagFragment;
        this.b = composeView;
    }

    @Override // defpackage.d9d
    public final void a() {
        this.a.Q().getOnBackPressedDispatcher().d();
    }

    @Override // defpackage.d9d
    public final void b(String str, String str2) {
        str.getClass();
        TagFragment tagFragment = this.a;
        ((p13) tagFragment.Z()).c(tagFragment.S(), str, str2);
    }

    @Override // defpackage.d9d
    public final void c(String str, String str2) throws PendingIntent.CanceledException {
        TagFragment tagFragment = this.a;
        ((p13) tagFragment.Z()).M(tagFragment.S(), str, str2);
    }

    @Override // defpackage.d9d
    public final void d(String str, String str2) throws PendingIntent.CanceledException {
        TagFragment tagFragment = this.a;
        ((p13) tagFragment.Z()).L(tagFragment.S(), str, str2, false);
    }

    @Override // defpackage.d9d
    public final void e(String str, String str2) {
        str.getClass();
        TagFragment tagFragment = this.a;
        ((p13) tagFragment.Z()).Q(tagFragment.S(), str, str2);
    }

    @Override // defpackage.d9d
    public final void f(sbd sbdVar) {
        Context contextS = this.a.S();
        String str = sbdVar.c;
        String string = contextS.getString(R.string.share_topic_content, str, sbdVar.a.toString());
        string.getClass();
        String string2 = contextS.getString(R.string.share_topic_email_subject, str);
        string2.getClass();
        String string3 = contextS.getString(R.string.share_topic_prompt);
        string3.getClass();
        o2b o2bVar = new o2b(contextS);
        o2bVar.d = string3;
        Intent intent = (Intent) o2bVar.c;
        intent.setType("text/plain");
        intent.putExtra("android.intent.extra.SUBJECT", string2);
        intent.putExtra("android.intent.extra.TEXT", (CharSequence) string);
        o2bVar.K();
    }

    public final void g(String str, String str2) {
        str.getClass();
        TagFragment tagFragment = this.a;
        ((p13) tagFragment.Z()).y(tagFragment.S(), new PublicationReference.Id(str), str2, PublicationTab.Home.INSTANCE);
    }

    public final void h(String str, String str2, String str3) throws PendingIntent.CanceledException {
        TagFragment tagFragment = this.a;
        ((p13) tagFragment.Z()).j0(tagFragment.S(), str, str2, str3);
    }
}
