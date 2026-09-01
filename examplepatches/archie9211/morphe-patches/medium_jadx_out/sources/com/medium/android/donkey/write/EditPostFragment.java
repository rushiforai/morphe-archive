package com.medium.android.donkey.write;

import android.content.Context;
import android.content.res.Configuration;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.FrameLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;
import androidx.compose.ui.platform.ComposeView;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import com.medium.android.common.post.body.EditPostBodyView;
import com.medium.android.core.fragments.AbstractMediumFragment;
import com.medium.android.core.navigation.EditPostReference;
import com.medium.android.donkey.main.MainActivity;
import com.medium.android.donkey.write.EditPostFragment;
import com.medium.android.donkey.write.publicationflow.b;
import com.medium.android.unsplash.data.UnsplashPhoto;
import com.medium.proto.event.EditorDismiss;
import com.medium.proto.event.EditorOpen;
import com.medium.proto.model.SelectionPb;
import com.medium.proto.model.SelectionPoint;
import com.medium.proto.obv.post.SelectionPointType;
import com.medium.reader.R;
import defpackage.a3;
import defpackage.ahc;
import defpackage.aq3;
import defpackage.at3;
import defpackage.bq3;
import defpackage.bt3;
import defpackage.bu1;
import defpackage.cn;
import defpackage.cq3;
import defpackage.cr3;
import defpackage.cxd;
import defpackage.d39;
import defpackage.d46;
import defpackage.d7;
import defpackage.dq3;
import defpackage.dr3;
import defpackage.e99;
import defpackage.eh3;
import defpackage.enc;
import defpackage.eq3;
import defpackage.er3;
import defpackage.ex2;
import defpackage.f70;
import defpackage.f76;
import defpackage.fr3;
import defpackage.g7;
import defpackage.g76;
import defpackage.gp7;
import defpackage.gr3;
import defpackage.hlg;
import defpackage.ht2;
import defpackage.ht3;
import defpackage.huc;
import defpackage.i03;
import defpackage.in3;
import defpackage.iq1;
import defpackage.ir;
import defpackage.iv2;
import defpackage.k40;
import defpackage.k7;
import defpackage.km5;
import defpackage.kq3;
import defpackage.m40;
import defpackage.mn3;
import defpackage.muc;
import defpackage.mz1;
import defpackage.n1b;
import defpackage.n92;
import defpackage.nld;
import defpackage.np3;
import defpackage.o7f;
import defpackage.pj3;
import defpackage.qd0;
import defpackage.rqd;
import defpackage.rz2;
import defpackage.sp3;
import defpackage.sr3;
import defpackage.tg1;
import defpackage.tp3;
import defpackage.tuc;
import defpackage.ty2;
import defpackage.up3;
import defpackage.va6;
import defpackage.vn7;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.wg8;
import defpackage.x2b;
import defpackage.xq3;
import defpackage.ygf;
import defpackage.yo7;
import defpackage.yp3;
import defpackage.yw6;
import defpackage.z72;
import defpackage.zi5;
import defpackage.zk2;
import defpackage.zs3;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.CancellationException;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002:\u0002\u0005\u0006B\u0007¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0011²\u0006\f\u0010\b\u001a\u00020\u00078\nX\u008a\u0084\u0002²\u0006\u000e\u0010\n\u001a\u0004\u0018\u00010\t8\nX\u008a\u0084\u0002²\u0006\f\u0010\f\u001a\u00020\u000b8\nX\u008a\u0084\u0002²\u0006\f\u0010\b\u001a\u00020\u00078\nX\u008a\u0084\u0002²\u0006\u000e\u0010\u000e\u001a\u0004\u0018\u00010\r8\nX\u008a\u0084\u0002²\u0006\f\u0010\b\u001a\u00020\u00078\nX\u008a\u0084\u0002²\u0006\u000e\u0010\u0010\u001a\u0004\u0018\u00010\u000f8\nX\u008a\u0084\u0002"}, d2 = {"Lcom/medium/android/donkey/write/EditPostFragment;", "Lcom/medium/android/core/fragments/AbstractMediumFragment;", "Lnp3;", "<init>", "()V", "aq3", "BundleInfo", "Lps3;", "viewState", "Lrr3;", "uiModel", "", "source", "Lrp3;", "editPostBottomBarUiModel", "Las3;", "dialogState", "app_externalRelease"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class EditPostFragment extends km5 implements np3 {
    public static final long O0;
    public static final long P0;
    public static final /* synthetic */ int Q0 = 0;
    public eh3 A0;
    public i03 B0;
    public ex2 C0;
    public tg1 D0;
    public d39 E0;
    public iv2 F0;
    public k7 G0;
    public k7 H0;
    public k7 I0;
    public enc J0;
    public Uri K0;
    public InputMethodManager L0;
    public boolean M0;
    public SelectionPb N0;
    public final vq6 u0;
    public final iq1 v0;
    public final nld w0;
    public final rz2 x0;
    public cxd y0;
    public zk2 z0;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\b\b\u0081\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007J\u001d\u0010\r\u001a\u00020\f2\u0006\u0010\t\u001a\u00020\b2\u0006\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u000f\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u0011\u0010\u0012J\u001a\u0010\u0016\u001a\u00020\u00152\b\u0010\u0014\u001a\u0004\u0018\u00010\u0013HÖ\u0003¢\u0006\u0004\b\u0016\u0010\u0017R\u001a\u0010\u0003\u001a\u00020\u00028\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0003\u0010\u0018\u001a\u0004\b\u0019\u0010\u0010R\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001a\u001a\u0004\b\u001b\u0010\u001c¨\u0006\u001d"}, d2 = {"Lcom/medium/android/donkey/write/EditPostFragment$BundleInfo;", "Lcom/medium/android/core/fragments/AbstractMediumFragment$BundleInfo;", "", "referrerSource", "Lcom/medium/android/core/navigation/EditPostReference;", "editPostReference", "<init>", "(Ljava/lang/String;Lcom/medium/android/core/navigation/EditPostReference;)V", "Landroid/os/Parcel;", "dest", "", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "toString", "()Ljava/lang/String;", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getReferrerSource", "Lcom/medium/android/core/navigation/EditPostReference;", "getEditPostReference", "()Lcom/medium/android/core/navigation/EditPostReference;", "app_externalRelease"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class BundleInfo extends AbstractMediumFragment.BundleInfo {
        public static final Parcelable.Creator<BundleInfo> CREATOR = new Creator();
        private final EditPostReference editPostReference;
        private final String referrerSource;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public final class Creator implements Parcelable.Creator<BundleInfo> {
            @Override // android.os.Parcelable.Creator
            public final BundleInfo createFromParcel(Parcel parcel) {
                parcel.getClass();
                return new BundleInfo(parcel.readString(), (EditPostReference) parcel.readParcelable(BundleInfo.class.getClassLoader()));
            }

            @Override // android.os.Parcelable.Creator
            public final BundleInfo[] newArray(int i) {
                return new BundleInfo[i];
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public BundleInfo(String str, EditPostReference editPostReference) {
            super(str);
            str.getClass();
            editPostReference.getClass();
            this.referrerSource = str;
            this.editPostReference = editPostReference;
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof BundleInfo)) {
                return false;
            }
            BundleInfo bundleInfo = (BundleInfo) other;
            return g76.L(this.referrerSource, bundleInfo.referrerSource) && g76.L(this.editPostReference, bundleInfo.editPostReference);
        }

        public final EditPostReference getEditPostReference() {
            return this.editPostReference;
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo
        public String getReferrerSource() {
            return this.referrerSource;
        }

        public int hashCode() {
            return this.editPostReference.hashCode() + (this.referrerSource.hashCode() * 31);
        }

        public String toString() {
            return "BundleInfo(referrerSource=" + this.referrerSource + ", editPostReference=" + this.editPostReference + ")";
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo, android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeString(this.referrerSource);
            dest.writeParcelable(this.editPostReference, flags);
        }
    }

    static {
        int i = in3.d;
        O0 = hlg.T(10, mn3.SECONDS);
        P0 = hlg.T(3, mn3.MINUTES);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public EditPostFragment() {
        super(18);
        yw6 yw6Var = yw6.NONE;
        this.u0 = vx0.d0(yw6Var, new tp3(this, 0));
        a3 a3Var = new a3(this, new sp3(this, 1), 0 == true ? 1 : 0, 7);
        vq6 vq6VarD0 = vx0.d0(yw6Var, new ir(14, new ir(13, this)));
        this.v0 = m40.I(this, n1b.a.b(ht3.class), new pj3(vq6VarD0, 2), new ir(a3Var, vq6VarD0), new cn(this, 11, vq6VarD0));
        this.w0 = new nld(O0, P0, new cq3(this, null, 0 == true ? 1 : 0), 12);
        this.x0 = new rz2(4, this);
        SelectionPointType selectionPointType = SelectionPointType.TEXT;
        int i = 0;
        this.N0 = new SelectionPb(new SelectionPoint(selectionPointType, 0, i, null, 8, null), new SelectionPoint(selectionPointType, i, 0, null, 8, null), null, null, null, 28, null);
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment, defpackage.j15
    public final void A(Bundle bundle) {
        SelectionPb selectionPb;
        super.A(bundle);
        if (bundle != null && (selectionPb = (SelectionPb) ((Parcelable) ht2.r0(bundle, "selection_pb_key", SelectionPb.class))) != null) {
            this.N0 = selectionPb;
        }
        final int i = 0;
        yo7.n(Q().getOnBackPressedDispatcher(), this, new sp3(this, i));
        Context contextS = S();
        cxd cxdVar = this.y0;
        n92 n92Var = null;
        if (cxdVar == null) {
            g76.g0("typeSource");
            throw null;
        }
        zk2 zk2Var = this.z0;
        if (zk2Var == null) {
            g76.g0("currentUserRepo");
            throw null;
        }
        String strM = zk2Var.m();
        eh3 eh3Var = this.A0;
        if (eh3Var == null) {
            g76.g0("displaySettingsRepo");
            throw null;
        }
        this.E0 = new d39(contextS, cxdVar, strM, eh3Var, wg8.a);
        this.L0 = (InputMethodManager) S().getSystemService(InputMethodManager.class);
        ht3 ht3VarJ1 = j1();
        if (ht3VarJ1.x != null) {
            ty2 ty2Var = ht3VarJ1.g;
            String str = ht3VarJ1.b;
            String strU = gp7.u(ht3VarJ1.v);
            String str2 = ht3VarJ1.u;
            ty2Var.getClass();
            str.getClass();
            str2.getClass();
            rqd.a(ty2Var.a, new EditorOpen(null, null, null, 7, null), str, strU, false, null, str2, 24);
        }
        this.G0 = P(new g7(6), new d7(this) { // from class: xp3
            public final /* synthetic */ EditPostFragment b;

            {
                this.b = this;
            }

            @Override // defpackage.d7
            public final void onActivityResult(Object obj) {
                int i2 = i;
                EditPostFragment editPostFragment = this.b;
                switch (i2) {
                    case 0:
                        Boolean bool = (Boolean) obj;
                        int i3 = EditPostFragment.Q0;
                        bool.getClass();
                        if (bool.booleanValue()) {
                            Uri uri = editPostFragment.K0;
                            if (uri == null) {
                                ay0.e("Cannot acquire image");
                            } else {
                                editPostFragment.j1().l(uri);
                            }
                        }
                        break;
                    case 1:
                        Uri uri2 = (Uri) obj;
                        int i4 = EditPostFragment.Q0;
                        if (uri2 != null) {
                            editPostFragment.j1().l(uri2);
                        }
                        break;
                    default:
                        Boolean bool2 = (Boolean) obj;
                        int i5 = EditPostFragment.Q0;
                        bool2.getClass();
                        if (!bool2.booleanValue()) {
                            ht3 ht3VarJ12 = editPostFragment.j1();
                            String strG = ht3VarJ12.g();
                            if (strG != null) {
                                vx0.c0(f76.F(ht3VarJ12), null, null, new rs3(ht3VarJ12, strG, null, 1), 3);
                            }
                        } else {
                            editPostFragment.k1();
                        }
                        break;
                }
            }
        });
        final int i2 = 1;
        this.H0 = P(new e99(S()), new d7(this) { // from class: xp3
            public final /* synthetic */ EditPostFragment b;

            {
                this.b = this;
            }

            @Override // defpackage.d7
            public final void onActivityResult(Object obj) {
                int i22 = i2;
                EditPostFragment editPostFragment = this.b;
                switch (i22) {
                    case 0:
                        Boolean bool = (Boolean) obj;
                        int i3 = EditPostFragment.Q0;
                        bool.getClass();
                        if (bool.booleanValue()) {
                            Uri uri = editPostFragment.K0;
                            if (uri == null) {
                                ay0.e("Cannot acquire image");
                            } else {
                                editPostFragment.j1().l(uri);
                            }
                        }
                        break;
                    case 1:
                        Uri uri2 = (Uri) obj;
                        int i4 = EditPostFragment.Q0;
                        if (uri2 != null) {
                            editPostFragment.j1().l(uri2);
                        }
                        break;
                    default:
                        Boolean bool2 = (Boolean) obj;
                        int i5 = EditPostFragment.Q0;
                        bool2.getClass();
                        if (!bool2.booleanValue()) {
                            ht3 ht3VarJ12 = editPostFragment.j1();
                            String strG = ht3VarJ12.g();
                            if (strG != null) {
                                vx0.c0(f76.F(ht3VarJ12), null, null, new rs3(ht3VarJ12, strG, null, 1), 3);
                            }
                        } else {
                            editPostFragment.k1();
                        }
                        break;
                }
            }
        });
        m().a0("EXTRA_PHOTO", this, new f70(19, this));
        final int i3 = 2;
        this.I0 = P(new b(), new d7(this) { // from class: xp3
            public final /* synthetic */ EditPostFragment b;

            {
                this.b = this;
            }

            @Override // defpackage.d7
            public final void onActivityResult(Object obj) {
                int i22 = i3;
                EditPostFragment editPostFragment = this.b;
                switch (i22) {
                    case 0:
                        Boolean bool = (Boolean) obj;
                        int i32 = EditPostFragment.Q0;
                        bool.getClass();
                        if (bool.booleanValue()) {
                            Uri uri = editPostFragment.K0;
                            if (uri == null) {
                                ay0.e("Cannot acquire image");
                            } else {
                                editPostFragment.j1().l(uri);
                            }
                        }
                        break;
                    case 1:
                        Uri uri2 = (Uri) obj;
                        int i4 = EditPostFragment.Q0;
                        if (uri2 != null) {
                            editPostFragment.j1().l(uri2);
                        }
                        break;
                    default:
                        Boolean bool2 = (Boolean) obj;
                        int i5 = EditPostFragment.Q0;
                        bool2.getClass();
                        if (!bool2.booleanValue()) {
                            ht3 ht3VarJ12 = editPostFragment.j1();
                            String strG = ht3VarJ12.g();
                            if (strG != null) {
                                vx0.c0(f76.F(ht3VarJ12), null, null, new rs3(ht3VarJ12, strG, null, 1), 3);
                            }
                        } else {
                            editPostFragment.k1();
                        }
                        break;
                }
            }
        });
        vx0.c0(o7f.x(this), null, null, new dq3(this, n92Var, i), 3);
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment, defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        super.B(layoutInflater, viewGroup, bundle);
        View viewInflate = layoutInflater.inflate(R.layout.fragment_edit_post, viewGroup, false);
        int i = R.id.common_edit_post_autocomplete_spacer;
        if (vn7.x(viewInflate, R.id.common_edit_post_autocomplete_spacer) != null) {
            i = R.id.compose;
            ComposeView composeView = (ComposeView) vn7.x(viewInflate, R.id.compose);
            if (composeView != null) {
                i = R.id.edit_post_bottom_bar;
                ComposeView composeView2 = (ComposeView) vn7.x(viewInflate, R.id.edit_post_bottom_bar);
                if (composeView2 != null) {
                    i = R.id.edit_post_top_bar;
                    ComposeView composeView3 = (ComposeView) vn7.x(viewInflate, R.id.edit_post_top_bar);
                    if (composeView3 != null) {
                        i = R.id.in_response;
                        ComposeView composeView4 = (ComposeView) vn7.x(viewInflate, R.id.in_response);
                        if (composeView4 != null) {
                            i = R.id.loading;
                            FrameLayout frameLayout = (FrameLayout) vn7.x(viewInflate, R.id.loading);
                            if (frameLayout != null) {
                                i = R.id.paragraph_container;
                                ParagraphContainer paragraphContainer = (ParagraphContainer) vn7.x(viewInflate, R.id.paragraph_container);
                                if (paragraphContainer != null) {
                                    i = R.id.paragraph_list;
                                    EditPostBodyView editPostBodyView = (EditPostBodyView) vn7.x(viewInflate, R.id.paragraph_list);
                                    if (editPostBodyView != null) {
                                        i = R.id.paragraph_scroll_view;
                                        if (((ScrollView) vn7.x(viewInflate, R.id.paragraph_scroll_view)) != null) {
                                            CoordinatorLayout coordinatorLayout = (CoordinatorLayout) viewInflate;
                                            iv2 iv2Var = new iv2();
                                            iv2Var.a = coordinatorLayout;
                                            iv2Var.b = composeView;
                                            iv2Var.c = composeView2;
                                            iv2Var.d = composeView3;
                                            iv2Var.e = composeView4;
                                            iv2Var.f = frameLayout;
                                            iv2Var.g = paragraphContainer;
                                            iv2Var.h = editPostBodyView;
                                            this.F0 = iv2Var;
                                            coordinatorLayout.getClass();
                                            return coordinatorLayout;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        z72.c("Missing required view with ID: ".concat(viewInflate.getResources().getResourceName(i)));
        return null;
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment, defpackage.j15
    public final void D() {
        this.M0 = false;
        super.D();
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment, defpackage.j15
    public final void H() {
        MainActivity mainActivity = (MainActivity) Q();
        mainActivity.x(true);
        mainActivity.y(true);
        super.H();
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment, defpackage.j15
    public final void I() {
        super.I();
        MainActivity mainActivity = (MainActivity) Q();
        mainActivity.x(false);
        mainActivity.y(false);
    }

    @Override // defpackage.j15
    public final void J(Bundle bundle) {
        SelectionPb selection;
        iv2 iv2Var = this.F0;
        if (iv2Var == null || (selection = ((EditPostBodyView) iv2Var.h).getSelection()) == null) {
            return;
        }
        bundle.putParcelable("selection_pb_key", selection);
    }

    @Override // defpackage.j15
    public final void M(View view) {
        view.getClass();
        n92 n92Var = null;
        int i = 3;
        vx0.c0(o7f.x(q()), null, null, new dq3(this, n92Var, 1), 3);
        iv2 iv2Var = this.F0;
        if (iv2Var == null) {
            g76.g0("binding");
            throw null;
        }
        ComposeView composeView = (ComposeView) iv2Var.d;
        zi5 zi5Var = zi5.h;
        composeView.setViewCompositionStrategy(zi5Var);
        iv2 iv2Var2 = this.F0;
        if (iv2Var2 == null) {
            g76.g0("binding");
            throw null;
        }
        ((ComposeView) iv2Var2.d).setContent(new mz1(new up3(this, i), true, -803382553));
        iv2 iv2Var3 = this.F0;
        if (iv2Var3 == null) {
            g76.g0("binding");
            throw null;
        }
        ComposeView composeView2 = (ComposeView) iv2Var3.c;
        composeView2.setViewCompositionStrategy(zi5Var);
        composeView2.setContent(new mz1(new up3(this, 4), true, -1040323851));
        iv2 iv2Var4 = this.F0;
        if (iv2Var4 == null) {
            g76.g0("binding");
            throw null;
        }
        ComposeView composeView3 = (ComposeView) iv2Var4.b;
        composeView3.setViewCompositionStrategy(zi5Var);
        int i2 = 5;
        composeView3.setContent(new mz1(new up3(this, i2), true, 877352734));
        iv2 iv2Var5 = this.F0;
        if (iv2Var5 == null) {
            g76.g0("binding");
            throw null;
        }
        ((ParagraphContainer) iv2Var5.g).setOnTouchEmptyArea(new tp3(this, 6));
        iv2 iv2Var6 = this.F0;
        if (iv2Var6 == null) {
            g76.g0("binding");
            throw null;
        }
        ((EditPostBodyView) iv2Var6.h).setOnClickListener(new yp3(this, i2));
        i1();
        iv2 iv2Var7 = this.F0;
        if (iv2Var7 == null) {
            g76.g0("binding");
            throw null;
        }
        ((ComposeView) iv2Var7.e).setVisibility(8);
        vx0.c0(o7f.x(q()), null, null, new dq3(this, n92Var, 2), 3);
        vx0.c0(o7f.x(q()), null, null, new dq3(this, n92Var, i), 3);
    }

    @Override // defpackage.np3
    public final void a(int i, String str) {
        ht3 ht3VarJ1 = j1();
        String strA = ht3VarJ1.o.a();
        x2b x2bVar = huc.a;
        String lowerCase = str.toLowerCase(Locale.ROOT);
        lowerCase.getClass();
        List listR = d46.R(".jpg", ".jpeg", ".png", ".gif", ".webp", ".bmp", ".svg");
        String str2 = (String) bu1.x0(muc.p0((CharSequence) bu1.x0(muc.p0(lowerCase, new String[]{"?"}, 0, 6)), new String[]{"#"}, 0, 6));
        if (!listR.isEmpty()) {
            Iterator it2 = listR.iterator();
            while (it2.hasNext()) {
                if (tuc.F(str2, (String) it2.next(), false)) {
                    LinkedHashMap linkedHashMap = ht3VarJ1.t;
                    enc encVarC0 = vx0.c0(f76.F(ht3VarJ1), null, null, new qd0(i, null, ht3VarJ1, strA, str), 3);
                    encVarC0.R(new sr3(ht3VarJ1, strA, 2));
                    linkedHashMap.put(strA, encVarC0);
                    return;
                }
            }
        }
        vx0.c0(f76.F(ht3VarJ1), null, null, new zs3(i, null, ht3VarJ1, strA, str), 3);
    }

    @Override // defpackage.np3
    public final void e(Uri uri, String str) {
        uri.getClass();
        str.getClass();
        ht3 ht3VarJ1 = j1();
        LinkedHashMap linkedHashMap = ht3VarJ1.t;
        enc encVarC0 = vx0.c0(f76.F(ht3VarJ1), null, null, new at3(ht3VarJ1, uri, str, null, 0), 3);
        encVarC0.R(new sr3(ht3VarJ1, str, 4));
        linkedHashMap.put(str, encVarC0);
    }

    public final void i1() {
        iv2 iv2Var = this.F0;
        if (iv2Var == null) {
            g76.g0("binding");
            throw null;
        }
        ParagraphContainer paragraphContainer = (ParagraphContainer) iv2Var.g;
        ViewGroup.LayoutParams layoutParams = paragraphContainer.getLayoutParams();
        if (layoutParams == null) {
            z72.c("null cannot be cast to non-null type android.view.ViewGroup.LayoutParams");
        } else {
            layoutParams.width = Math.min(n().getDimensionPixelOffset(R.dimen.common_max_line_width_paragraph_content), n().getDisplayMetrics().widthPixels);
            paragraphContainer.setLayoutParams(layoutParams);
        }
    }

    @Override // defpackage.np3
    public final void j(String str) {
        va6 va6Var = (va6) j1().t.remove(str);
        if (va6Var != null) {
            va6Var.m(null);
        }
    }

    public final ht3 j1() {
        return (ht3) this.v0.getValue();
    }

    public final void k1() {
        ht3 ht3VarJ1 = j1();
        ty2 ty2Var = ht3VarJ1.g;
        String str = ht3VarJ1.b;
        String strU = gp7.u(ht3VarJ1.v);
        String str2 = ht3VarJ1.u;
        ty2Var.getClass();
        str.getClass();
        str2.getClass();
        rqd.a(ty2Var.a, new EditorDismiss(null, null, 3, null), str, strU, false, null, str2, 24);
        if (t()) {
            k40.X(this).f();
        }
    }

    @Override // defpackage.np3
    public final void l(UnsplashPhoto unsplashPhoto, String str) {
        unsplashPhoto.getClass();
        str.getClass();
        ht3 ht3VarJ1 = j1();
        LinkedHashMap linkedHashMap = ht3VarJ1.t;
        enc encVarC0 = vx0.c0(f76.F(ht3VarJ1), null, null, new bt3(ht3VarJ1, unsplashPhoto, str, null, 0), 3);
        encVarC0.R(new sr3(ht3VarJ1, str, 3));
        linkedHashMap.put(str, encVarC0);
    }

    public final void l1(Throwable th) {
        this.J0 = null;
        int i = 0;
        if (!(th instanceof EditPostSaveError)) {
            View viewT = T();
            int[] iArr = ahc.C;
            ahc ahcVarH = ahc.h(viewT, viewT.getResources().getText(R.string.edit_post_cant_save_draft), 0);
            ahcVarH.i(R.string.common_retry, new yp3(this, 4));
            ahcVarH.j();
            return;
        }
        switch (bq3.b[((EditPostSaveError) th).a.ordinal()]) {
            case 1:
                View viewT2 = T();
                int[] iArr2 = ahc.C;
                ahc.h(viewT2, viewT2.getResources().getText(R.string.edit_post_cant_save_merge), 0).j();
                break;
            case 2:
                View viewT3 = T();
                int[] iArr3 = ahc.C;
                ahc.h(viewT3, viewT3.getResources().getText(R.string.edit_post_cant_save_max_size), 0).j();
                break;
            case 3:
                View viewT4 = T();
                int[] iArr4 = ahc.C;
                ahc.h(viewT4, viewT4.getResources().getText(R.string.edit_post_cant_save_deleted), 0).j();
                break;
            case 4:
                View viewT5 = T();
                int[] iArr5 = ahc.C;
                ahc.h(viewT5, viewT5.getResources().getText(R.string.edit_post_cant_save_not_logged_in), 0).j();
                break;
            case 5:
                View viewT6 = T();
                int[] iArr6 = ahc.C;
                ahc ahcVarH2 = ahc.h(viewT6, viewT6.getResources().getText(R.string.edit_post_cant_publish_rate_limit), 0);
                ahcVarH2.i(R.string.common_retry, new yp3(this, i));
                ahcVarH2.j();
                break;
            case 6:
                View viewT7 = T();
                int[] iArr7 = ahc.C;
                ahc ahcVarH3 = ahc.h(viewT7, viewT7.getResources().getText(R.string.edit_post_unverified_email), 0);
                ahcVarH3.i(R.string.edit_post_save_draft_error_settings, new yp3(this, 1));
                ahcVarH3.j();
                break;
            case 7:
                View viewT8 = T();
                int[] iArr8 = ahc.C;
                ahc ahcVarH4 = ahc.h(viewT8, viewT8.getResources().getText(R.string.edit_post_user_suspended), 0);
                TextView textView = (TextView) ahcVarH4.i.findViewById(R.id.snackbar_text);
                if (textView != null) {
                    textView.setMaxLines(10);
                }
                ahcVarH4.i(R.string.common_retry, new yp3(this, 2));
                ahcVarH4.j();
                break;
            case 8:
                if (!(th.getCause() instanceof InterruptedException) && !(th.getCause() instanceof CancellationException)) {
                    View viewT9 = T();
                    int[] iArr9 = ahc.C;
                    ahc ahcVarH5 = ahc.h(viewT9, viewT9.getResources().getText(R.string.edit_post_cant_save_draft), 0);
                    ahcVarH5.i(R.string.common_retry, new yp3(this, 3));
                    ahcVarH5.j();
                    break;
                }
                break;
            default:
                ygf.a();
                break;
        }
    }

    public final void m1(String str, String str2) {
        xq3 xq3Var = j1().x;
        if (xq3Var == null) {
            return;
        }
        o1(aq3.LOADING);
        enc encVar = this.J0;
        if (encVar != null) {
            encVar.m(null);
        }
        xq3Var.a();
        this.J0 = vx0.c0(o7f.x(this), null, null, new kq3(xq3Var, this, str, str2, null), 3);
    }

    public final void n1() {
        this.J0 = vx0.c0(o7f.x(this), null, null, new dq3(this, null, 4), 3);
    }

    public final void o1(aq3 aq3Var) {
        int i = bq3.a[aq3Var.ordinal()];
        if (i != 1) {
            if (i != 2) {
                ygf.a();
                return;
            }
            iv2 iv2Var = this.F0;
            if (iv2Var != null) {
                ((FrameLayout) iv2Var.f).setVisibility(8);
                return;
            } else {
                g76.g0("binding");
                throw null;
            }
        }
        iv2 iv2Var2 = this.F0;
        if (iv2Var2 == null) {
            g76.g0("binding");
            throw null;
        }
        ((FrameLayout) iv2Var2.f).setVisibility(0);
        iv2 iv2Var3 = this.F0;
        if (iv2Var3 != null) {
            ((FrameLayout) iv2Var3.f).requestFocus();
        } else {
            g76.g0("binding");
            throw null;
        }
    }

    @Override // defpackage.j15, android.content.ComponentCallbacks
    public final void onConfigurationChanged(Configuration configuration) {
        configuration.getClass();
        this.E = true;
        i1();
    }

    public final void p1(gr3 gr3Var) {
        if ((gr3Var instanceof cr3) || (gr3Var instanceof fr3)) {
            Toast.makeText(S(), R.string.edit_post_saved_to_drafts, 0).show();
        } else {
            if ((gr3Var instanceof er3) || (gr3Var instanceof dr3)) {
                return;
            }
            ygf.a();
        }
    }

    public final void q1() {
        xq3 xq3Var = j1().x;
        if (xq3Var == null) {
            k1();
            return;
        }
        o1(aq3.LOADING);
        InputMethodManager inputMethodManager = this.L0;
        n92 n92Var = null;
        if (inputMethodManager != null) {
            iv2 iv2Var = this.F0;
            if (iv2Var == null) {
                g76.g0("binding");
                throw null;
            }
            inputMethodManager.hideSoftInputFromWindow(((CoordinatorLayout) iv2Var.a).getWindowToken(), 0);
        }
        enc encVar = this.J0;
        if (encVar != null) {
            encVar.m(null);
        }
        xq3Var.a();
        this.J0 = vx0.c0(o7f.x(this), null, null, new eq3(xq3Var, this, n92Var, 3), 3);
    }
}
