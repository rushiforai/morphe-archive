package ay;

import android.content.ClipData;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.view.MenuItem;
import android.widget.EditText;
import android.widget.PopupMenu;

/* loaded from: classes4.dex */
public final class m implements PopupMenu.OnMenuItemClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ n f15760a;

    public m(n nVar) {
        this.f15760a = nVar;
    }

    @Override // android.widget.PopupMenu.OnMenuItemClickListener
    public final boolean onMenuItemClick(MenuItem menuItem) {
        n nVar = this.f15760a;
        r rVar = nVar.f15762b;
        Context context = nVar.f15761a;
        int itemId = menuItem.getItemId();
        if (itemId == 2131427846) {
            rVar.b();
            nVar.f15763c.a();
            return false;
        }
        if (itemId == 2131428694) {
            EditText editText = new EditText(context);
            editText.setText(rVar.a(context));
            d9.f fVar = new d9.f(context);
            fVar.r(2132019390);
            fVar.g(editText, true);
            fVar.i(2132017603);
            fVar.o(2132019022);
            fVar.f49050q = new l(0, this, editText);
            new d9.j(fVar).show();
            return false;
        }
        if (itemId != 2131428804) {
            return false;
        }
        Uri uriForFile = o4.d.getUriForFile(context, "com.teslacoilsw.launcher.fileprovider", ((q) rVar).f15765b);
        Intent intent = new Intent("android.intent.action.SEND");
        intent.setType("application/vnd.novalauncher.backup");
        intent.putExtra("android.intent.extra.STREAM", uriForFile);
        intent.putExtra("android.intent.extra.TITLE", rVar.a(context));
        intent.setClipData(ClipData.newRawUri(null, uriForFile));
        intent.addFlags(1);
        context.startActivity(Intent.createChooser(intent, "Send backup"));
        return false;
    }
}
