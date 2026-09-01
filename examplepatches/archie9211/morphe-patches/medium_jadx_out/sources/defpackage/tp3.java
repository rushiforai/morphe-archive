package defpackage;

import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.Parcelable;
import android.provider.MediaStore;
import android.view.inputmethod.InputMethodManager;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.core.content.FileProvider;
import com.medium.android.common.post.body.EditPostBodyView;
import com.medium.android.donkey.write.EditPostFragment;
import com.medium.proto.event.EditorImagePicker;
import com.medium.proto.event.EditorUnsplashPicker;
import com.medium.proto.model.ParagraphPb;
import com.medium.proto.model.SelectionPb;
import com.medium.proto.obv.post.ParagraphType;
import com.medium.reader.R;
import java.io.File;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class tp3 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ EditPostFragment b;

    public /* synthetic */ tp3(EditPostFragment editPostFragment, int i) {
        this.a = i;
        this.b = editPostFragment;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        Uri uriC;
        int i = this.a;
        int i2 = 1;
        n92 n92Var = null;
        c1e c1eVar = c1e.a;
        EditPostFragment editPostFragment = this.b;
        switch (i) {
            case 0:
                int i3 = EditPostFragment.Q0;
                Parcelable parcelable = (Parcelable) ht2.r0(dm2.F(editPostFragment), "bundle_info", EditPostFragment.BundleInfo.class);
                if (parcelable != null) {
                    return (EditPostFragment.BundleInfo) parcelable;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            case 1:
                int i4 = EditPostFragment.Q0;
                editPostFragment.j1().h();
                editPostFragment.k1();
                return c1eVar;
            case 2:
                int i5 = EditPostFragment.Q0;
                editPostFragment.j1().h();
                editPostFragment.o1(aq3.EDITING);
                return c1eVar;
            case 3:
                InputMethodManager inputMethodManager = editPostFragment.L0;
                if (inputMethodManager != null) {
                    iv2 iv2Var = editPostFragment.F0;
                    if (iv2Var == null) {
                        g76.g0("binding");
                        throw null;
                    }
                    inputMethodManager.hideSoftInputFromWindow(((CoordinatorLayout) iv2Var.a).getWindowToken(), 0);
                }
                editPostFragment.j1().h();
                Context contextS = editPostFragment.S();
                String strX = b09.x("JPEG_", "_", System.currentTimeMillis());
                if (Build.VERSION.SDK_INT >= 29) {
                    Uri contentUri = MediaStore.Images.Media.getContentUri("external_primary");
                    ContentValues contentValues = new ContentValues();
                    contentValues.put("relative_path", "Pictures/Medium/");
                    contentValues.put("_display_name", strX);
                    contentValues.put("mime_type", "image/jpeg");
                    uriC = contextS.getContentResolver().insert(contentUri, contentValues);
                } else {
                    File externalFilesDir = contextS.getApplicationContext().getExternalFilesDir(Environment.DIRECTORY_PICTURES);
                    uriC = externalFilesDir == null ? null : FileProvider.c(contextS, "com.medium.reader.fileprovider", new File(b09.y(externalFilesDir.getAbsolutePath(), File.separator, strX)));
                }
                editPostFragment.K0 = uriC;
                if (uriC != null) {
                    k7 k7Var = editPostFragment.G0;
                    if (k7Var == null) {
                        g76.g0("takePhotoActivityResultLauncher");
                        throw null;
                    }
                    k7Var.a(uriC, null);
                } else {
                    String strO = editPostFragment.o(R.string.edit_post_cant_acquire_image);
                    strO.getClass();
                    ahc.h(editPostFragment.T(), strO, 0).j();
                }
                return c1eVar;
            case 4:
                InputMethodManager inputMethodManager2 = editPostFragment.L0;
                if (inputMethodManager2 != null) {
                    iv2 iv2Var2 = editPostFragment.F0;
                    if (iv2Var2 == null) {
                        g76.g0("binding");
                        throw null;
                    }
                    inputMethodManager2.hideSoftInputFromWindow(((CoordinatorLayout) iv2Var2.a).getWindowToken(), 0);
                }
                editPostFragment.j1().h();
                ht3 ht3VarJ1 = editPostFragment.j1();
                ty2 ty2Var = ht3VarJ1.g;
                String str = ht3VarJ1.b;
                String strU = gp7.u(ht3VarJ1.v);
                String str2 = ht3VarJ1.u;
                ty2Var.getClass();
                str.getClass();
                str2.getClass();
                rqd.a(ty2Var.a, new EditorImagePicker(null, null, 3, null), str, strU, false, null, str2, 24);
                k7 k7Var2 = editPostFragment.H0;
                if (k7Var2 != null) {
                    k7Var2.a(vp7.d(), null);
                    return c1eVar;
                }
                g76.g0("choosePictureActivityResultLauncher");
                throw null;
            case 5:
                InputMethodManager inputMethodManager3 = editPostFragment.L0;
                if (inputMethodManager3 != null) {
                    iv2 iv2Var3 = editPostFragment.F0;
                    if (iv2Var3 == null) {
                        g76.g0("binding");
                        throw null;
                    }
                    inputMethodManager3.hideSoftInputFromWindow(((CoordinatorLayout) iv2Var3.a).getWindowToken(), 0);
                }
                editPostFragment.j1().h();
                ht3 ht3VarJ12 = editPostFragment.j1();
                ty2 ty2Var2 = ht3VarJ12.g;
                String str3 = ht3VarJ12.b;
                String strU2 = gp7.u(ht3VarJ12.v);
                String str4 = ht3VarJ12.u;
                ty2Var2.getClass();
                str3.getClass();
                str4.getClass();
                rqd.a(ty2Var2.a, new EditorUnsplashPicker(null, null, 3, null), str3, strU2, false, null, str4, 24);
                xq3 xq3Var = editPostFragment.j1().x;
                if (xq3Var != null) {
                    editPostFragment.o1(aq3.LOADING);
                    enc encVar = editPostFragment.J0;
                    if (encVar != null) {
                        encVar.m(null);
                    }
                    xq3Var.a();
                    editPostFragment.J0 = vx0.c0(o7f.x(editPostFragment), null, null, new eq3(xq3Var, editPostFragment, n92Var, i2), 3);
                }
                return c1eVar;
            default:
                iv2 iv2Var4 = editPostFragment.F0;
                if (iv2Var4 == null) {
                    g76.g0("binding");
                    throw null;
                }
                if (((EditPostBodyView) iv2Var4.h).getChildCount() != 0) {
                    iv2 iv2Var5 = editPostFragment.F0;
                    if (iv2Var5 == null) {
                        g76.g0("binding");
                        throw null;
                    }
                    ParagraphPb lastParagraphPb = ((EditPostBodyView) iv2Var5.h).getLastParagraphPb();
                    if (lastParagraphPb == null || n19.c(lastParagraphPb)) {
                        iv2 iv2Var6 = editPostFragment.F0;
                        if (iv2Var6 == null) {
                            g76.g0("binding");
                            throw null;
                        }
                        EditPostBodyView editPostBodyView = (EditPostBodyView) iv2Var6.h;
                        int grafCount = editPostBodyView.getGrafCount() - 1;
                        if (grafCount < 0) {
                            grafCount = 0;
                        }
                        int i6 = grafCount + 1;
                        n29 n29Var = new n29();
                        n29Var.b = ParagraphType.P;
                        editPostBodyView.g(i6, n29Var.build());
                        SelectionPb selectionPb = rxb.a;
                        editPostBodyView.setSelection(rxb.a(i6, 0));
                    } else {
                        iv2 iv2Var7 = editPostFragment.F0;
                        if (iv2Var7 == null) {
                            g76.g0("binding");
                            throw null;
                        }
                        EditPostBodyView editPostBodyView2 = (EditPostBodyView) iv2Var7.h;
                        int grafCount2 = editPostBodyView2.getGrafCount() - 1;
                        if (grafCount2 < 0) {
                            grafCount2 = 0;
                        }
                        SelectionPb selectionPb2 = rxb.a;
                        editPostBodyView2.setSelection(rxb.a(grafCount2, 0));
                    }
                }
                return c1eVar;
        }
    }
}
