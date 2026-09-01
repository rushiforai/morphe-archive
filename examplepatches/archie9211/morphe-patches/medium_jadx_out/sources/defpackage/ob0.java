package defpackage;

import android.animation.ValueAnimator;
import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.net.Uri;
import android.os.Bundle;
import android.text.SpannableString;
import android.text.method.LinkMovementMethod;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;
import androidx.compose.ui.platform.ComposeView;
import androidx.constraintlayout.widget.ConstraintLayout;
import com.medium.android.catalogs.listscatalogselector.ListsCatalogSelectorDialogFragment;
import com.medium.android.common.api.Medium2Error;
import com.medium.android.common.post.body.EditPostBodyView;
import com.medium.android.common.ui.ReadPostBottomAppBarBehavior;
import com.medium.android.core.navigation.EditPostReference;
import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.SusiOperation;
import com.medium.android.data.catalog.KnyB.uvlZTF;
import com.medium.android.donkey.audio.AudioService;
import com.medium.android.donkey.launcher.LauncherActivity;
import com.medium.android.donkey.main.MainActivity;
import com.medium.android.donkey.post.PostFragment;
import com.medium.android.donkey.susi.SusiActivity;
import com.medium.android.donkey.write.EditPostFragment;
import com.medium.reader.R;
import gen.model.SourceParameter;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicReference;
import pushnotifications.SY.eoLmc;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class ob0 implements do4, k55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public ob0(b55 b55Var) {
        this.a = 9;
        b55Var.getClass();
        this.b = b55Var;
    }

    public final boolean equals(Object obj) {
        switch (this.a) {
            case 0:
                if ((obj instanceof do4) && (obj instanceof k55)) {
                    return getFunctionDelegate().equals(((k55) obj).getFunctionDelegate());
                }
                return false;
            case 1:
                if ((obj instanceof do4) && (obj instanceof k55)) {
                    return getFunctionDelegate().equals(((k55) obj).getFunctionDelegate());
                }
                return false;
            case 2:
                if ((obj instanceof do4) && (obj instanceof k55)) {
                    return getFunctionDelegate().equals(((k55) obj).getFunctionDelegate());
                }
                return false;
            case 3:
                if ((obj instanceof do4) && (obj instanceof k55)) {
                    return getFunctionDelegate().equals(((k55) obj).getFunctionDelegate());
                }
                return false;
            case 4:
                if ((obj instanceof do4) && (obj instanceof k55)) {
                    return getFunctionDelegate().equals(((k55) obj).getFunctionDelegate());
                }
                return false;
            case 5:
                if ((obj instanceof do4) && (obj instanceof k55)) {
                    return getFunctionDelegate().equals(((k55) obj).getFunctionDelegate());
                }
                return false;
            case 6:
                if ((obj instanceof do4) && (obj instanceof k55)) {
                    return getFunctionDelegate().equals(((k55) obj).getFunctionDelegate());
                }
                return false;
            case 7:
                if ((obj instanceof do4) && (obj instanceof k55)) {
                    return getFunctionDelegate().equals(((k55) obj).getFunctionDelegate());
                }
                return false;
            case 8:
                if ((obj instanceof do4) && (obj instanceof k55)) {
                    return getFunctionDelegate().equals(((k55) obj).getFunctionDelegate());
                }
                return false;
            default:
                if ((obj instanceof do4) && (obj instanceof k55)) {
                    return g76.L((b55) this.b, ((k55) obj).getFunctionDelegate());
                }
                return false;
        }
    }

    @Override // defpackage.k55
    public final j55 getFunctionDelegate() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                return new x55(2, 0, AudioService.class, (AudioService) obj, "onStateChanged", "onStateChanged(Lcom/medium/android/core/tts/TtsController$State;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;");
            case 1:
                return new x55(2, 0, l2a.class, (l2a) obj, "send", "send(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;");
            case 2:
                return new b8(2, 4, EditPostFragment.class, (EditPostFragment) obj, "handleEvent", "handleEvent(Lcom/medium/android/donkey/write/EditPostViewModel$Event;)V");
            case 3:
                return new b8(2, 4, LauncherActivity.class, (LauncherActivity) obj, "handleEvent", "handleEvent(Lcom/medium/android/donkey/launcher/LauncherViewModel$Event;)V");
            case 4:
                return new b8(2, 4, x47.class, (x47) obj, "onCatalogCreated", "onCatalogCreated(Ljava/lang/String;)V");
            case 5:
                return new b8(2, 4, ListsCatalogSelectorDialogFragment.class, (ListsCatalogSelectorDialogFragment) obj, "handleEvent", "handleEvent(Lcom/medium/android/catalogs/listscatalogselector/ListsCatalogSelectorViewModel$Event;)V");
            case 6:
                return new b8(2, 4, MainActivity.class, (MainActivity) obj, "handleEvent", "handleEvent(Lcom/medium/android/donkey/main/MainViewModel$Event;)V");
            case 7:
                return new b8(2, 4, PostFragment.class, (PostFragment) obj, "bindViewState", "bindViewState(Lcom/medium/android/donkey/post/PostViewModel$ViewState;)V");
            case 8:
                return new b8(2, 4, AtomicReference.class, (AtomicReference) obj, "set", "set(Ljava/lang/Object;)V");
            default:
                return (b55) obj;
        }
    }

    public final int hashCode() {
        switch (this.a) {
            case 0:
                return getFunctionDelegate().hashCode();
            case 1:
                return getFunctionDelegate().hashCode();
            case 2:
                return getFunctionDelegate().hashCode();
            case 3:
                return getFunctionDelegate().hashCode();
            case 4:
                return getFunctionDelegate().hashCode();
            case 5:
                return getFunctionDelegate().hashCode();
            case 6:
                return getFunctionDelegate().hashCode();
            case 7:
                return getFunctionDelegate().hashCode();
            case 8:
                return getFunctionDelegate().hashCode();
            default:
                return ((b55) this.b).hashCode();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.do4
    public final Object a(Object obj, n92 n92Var) throws Throwable {
        String strO;
        SpannableString spannableString;
        jz1 jz1Var;
        Throwable th;
        iv0 iv0Var;
        int iNextIndex;
        b36 b36VarI;
        jz1 jz1Var2;
        int i = this.a;
        final int i2 = 2;
        final int i3 = 1;
        c1e c1eVar = c1e.a;
        Object obj2 = this.b;
        final int i4 = 0;
        switch (i) {
            case 0:
                int i5 = AudioService.j;
                Object objE = ((AudioService) obj2).e((ztd) obj, n92Var);
                return objE == tb2.COROUTINE_SUSPENDED ? objE : c1eVar;
            case 1:
                Object objB = ((l2a) obj2).d.b(n92Var, (jc1) obj);
                return objB == tb2.COROUTINE_SUSPENDED ? objB : c1eVar;
            case 2:
                is3 is3Var = (is3) obj;
                EditPostFragment editPostFragment = (EditPostFragment) obj2;
                int i6 = EditPostFragment.Q0;
                if (is3Var instanceof fs3) {
                    fs3 fs3Var = (fs3) is3Var;
                    iv2 iv2Var = editPostFragment.F0;
                    if (iv2Var != null) {
                        ((EditPostBodyView) iv2Var.h).c(new nw1(fs3Var.a));
                        return c1eVar;
                    }
                    g76.g0("binding");
                    throw null;
                }
                if (is3Var instanceof gs3) {
                    gs3 gs3Var = (gs3) is3Var;
                    Exception exc = gs3Var.b;
                    wld.a.e(exc, "Image upload failure", new Object[0]);
                    iv2 iv2Var2 = editPostFragment.F0;
                    if (iv2Var2 == null) {
                        g76.g0("binding");
                        throw null;
                    }
                    ((EditPostBodyView) iv2Var2.h).c(new nw1(gs3Var.a));
                    Medium2Error medium2Error = exc instanceof Medium2Error ? (Medium2Error) exc : null;
                    if (medium2Error == null || (strO = medium2Error.b) == null) {
                        strO = editPostFragment.o(R.string.upload_image_failed);
                        strO.getClass();
                    }
                    ahc.h(editPostFragment.T(), strO, 0).j();
                    return c1eVar;
                }
                if (is3Var instanceof hs3) {
                    hs3 hs3Var = (hs3) is3Var;
                    iv2 iv2Var3 = editPostFragment.F0;
                    if (iv2Var3 != null) {
                        ((EditPostBodyView) iv2Var3.h).c(new nw1(hs3Var.a));
                        return c1eVar;
                    }
                    g76.g0("binding");
                    throw null;
                }
                if (is3Var instanceof es3) {
                    wld.a.e(((es3) is3Var).a, "Image acquire failure", new Object[0]);
                    String strO2 = editPostFragment.o(R.string.acquire_image_failed);
                    strO2.getClass();
                    ahc.h(editPostFragment.T(), strO2, 0).j();
                    return c1eVar;
                }
                if (!(is3Var instanceof ds3)) {
                    if ((is3Var instanceof bs3) || (is3Var instanceof cs3)) {
                        return c1eVar;
                    }
                    ygf.a();
                    return null;
                }
                iv2 iv2Var4 = editPostFragment.F0;
                if (iv2Var4 == null) {
                    g76.g0("binding");
                    throw null;
                }
                ((EditPostBodyView) iv2Var4.h).c(((ds3) is3Var).a);
                ht3 ht3VarJ1 = editPostFragment.j1();
                iv2 iv2Var5 = editPostFragment.F0;
                if (iv2Var5 != null) {
                    vx0.c0(f76.F(ht3VarJ1), null, null, new xs3(ht3VarJ1, ((EditPostBodyView) iv2Var5.h).getCurrentFocusType(), null, i4), 3);
                    return c1eVar;
                }
                g76.g0("binding");
                throw null;
            case 3:
                qo6 qo6Var = (qo6) obj;
                LauncherActivity launcherActivity = (LauncherActivity) obj2;
                int i7 = LauncherActivity.t;
                if (qo6Var instanceof po6) {
                    po6 po6Var = (po6) qo6Var;
                    ((p13) launcherActivity.w()).K(launcherActivity, po6Var.b, po6Var.a);
                    launcherActivity.v();
                    return c1eVar;
                }
                if (qo6Var instanceof lo6) {
                    ((p13) launcherActivity.w()).m(launcherActivity, ((lo6) qo6Var).a, false);
                    launcherActivity.v();
                    return c1eVar;
                }
                if (qo6Var instanceof oo6) {
                    ((p13) launcherActivity.w()).F(launcherActivity, ((oo6) qo6Var).a, true);
                    launcherActivity.v();
                    return c1eVar;
                }
                if (qo6Var instanceof mo6) {
                    b09.K(launcherActivity.w(), launcherActivity, EditPostReference.NewPost.INSTANCE, ((mo6) qo6Var).a);
                    launcherActivity.v();
                    return c1eVar;
                }
                if (qo6Var instanceof no6) {
                    no6 no6Var = (no6) qo6Var;
                    b09.O(launcherActivity.w(), launcherActivity, no6Var.a, no6Var.b, null, null, null, 120);
                    launcherActivity.v();
                    return c1eVar;
                }
                if (qo6Var instanceof jo6) {
                    py2 py2Var = launcherActivity.r;
                    if (py2Var == null) {
                        g76.g0("deepLinkHandler");
                        throw null;
                    }
                    jo6 jo6Var = (jo6) qo6Var;
                    py2Var.a(launcherActivity, Uri.parse(jo6Var.a), jo6Var.b, null);
                    launcherActivity.v();
                    return c1eVar;
                }
                if (!(qo6Var instanceof ko6)) {
                    ygf.a();
                    return null;
                }
                launcherActivity.w();
                ko6 ko6Var = (ko6) qo6Var;
                String str = ko6Var.a;
                String str2 = ko6Var.b;
                SusiDestination susiDestination = ko6Var.c;
                SusiOperation susiOperation = ko6Var.d;
                SusiActivity.RouteTo.MagicLinkConfirmation magicLinkConfirmation = new SusiActivity.RouteTo.MagicLinkConfirmation(str);
                Intent intent = new Intent(launcherActivity, (Class<?>) SusiActivity.class);
                Bundle bundle = new Bundle();
                bundle.putString(eoLmc.TkyYAQUkqIy, str2);
                bundle.putParcelable(uvlZTF.FacTT, susiDestination);
                bundle.putSerializable("susi_operation", susiOperation);
                bundle.putParcelable("route_to", magicLinkConfirmation);
                intent.putExtras(bundle);
                intent.addFlags(268468224);
                launcherActivity.startActivity(intent);
                launcherActivity.v();
                return c1eVar;
            case 4:
                String str3 = (String) obj;
                x47 x47Var = (x47) obj2;
                x47Var.getClass();
                str3.getClass();
                vx0.c0(f76.F(x47Var), null, null, new rc0(x47Var, str3, null, 23), 3);
                return c1eVar;
            case 5:
                g47 g47Var = (g47) obj;
                ListsCatalogSelectorDialogFragment listsCatalogSelectorDialogFragment = (ListsCatalogSelectorDialogFragment) obj2;
                if (g76.L(g47Var, g47.b)) {
                    listsCatalogSelectorDialogFragment.Y();
                    return c1eVar;
                }
                if (g76.L(g47Var, g47.a)) {
                    Toast.makeText(listsCatalogSelectorDialogFragment.i(), R.string.common_oops, 0).show();
                    return c1eVar;
                }
                if (!g76.L(g47Var, g47.c)) {
                    ygf.a();
                    return null;
                }
                p13 p13Var = listsCatalogSelectorDialogFragment.H0;
                if (p13Var != null) {
                    p13Var.g0(listsCatalogSelectorDialogFragment.S(), "my_lists");
                    return c1eVar;
                }
                g76.g0("router");
                throw null;
            case 6:
                bg7 bg7Var = (bg7) obj;
                MainActivity mainActivity = (MainActivity) obj2;
                int i8 = MainActivity.H;
                if (bg7Var instanceof tf7) {
                    Context applicationContext = mainActivity.getApplicationContext();
                    if (applicationContext == null) {
                        applicationContext = mainActivity;
                    }
                    vx0.c0(o7f.x(mainActivity), null, null, new cf7(mainActivity, new d2f(new k8g(applicationContext)), null), 3);
                    return c1eVar;
                }
                if (g76.L(bg7Var, xf7.a)) {
                    iq1 iq1Var = mainActivity.z;
                    if (iq1Var != null) {
                        ahc.g((ConstraintLayout) iq1Var.b, R.string.common_mute_author_failure, -1).j();
                        return c1eVar;
                    }
                    g76.g0("binding");
                    throw null;
                }
                if (g76.L(bg7Var, yf7.a)) {
                    iq1 iq1Var2 = mainActivity.z;
                    if (iq1Var2 != null) {
                        ahc.g((ConstraintLayout) iq1Var2.b, R.string.common_mute_author_success, -1).j();
                        return c1eVar;
                    }
                    g76.g0("binding");
                    throw null;
                }
                if (g76.L(bg7Var, zf7.a)) {
                    iq1 iq1Var3 = mainActivity.z;
                    if (iq1Var3 != null) {
                        ahc.g((ConstraintLayout) iq1Var3.b, R.string.common_unmute_author_failure, -1).j();
                        return c1eVar;
                    }
                    g76.g0("binding");
                    throw null;
                }
                if (g76.L(bg7Var, ag7.a)) {
                    iq1 iq1Var4 = mainActivity.z;
                    if (iq1Var4 != null) {
                        ahc.g((ConstraintLayout) iq1Var4.b, R.string.common_unmute_author_success, -1).j();
                        return c1eVar;
                    }
                    g76.g0("binding");
                    throw null;
                }
                if (g76.L(bg7Var, pf7.a)) {
                    iq1 iq1Var5 = mainActivity.z;
                    if (iq1Var5 != null) {
                        ahc.g((ConstraintLayout) iq1Var5.b, R.string.common_mute_publication_failure, -1).j();
                        return c1eVar;
                    }
                    g76.g0("binding");
                    throw null;
                }
                if (g76.L(bg7Var, qf7.a)) {
                    iq1 iq1Var6 = mainActivity.z;
                    if (iq1Var6 != null) {
                        ahc.g((ConstraintLayout) iq1Var6.b, R.string.common_mute_publication_success, -1).j();
                        return c1eVar;
                    }
                    g76.g0("binding");
                    throw null;
                }
                if (g76.L(bg7Var, rf7.a)) {
                    iq1 iq1Var7 = mainActivity.z;
                    if (iq1Var7 != null) {
                        ahc.g((ConstraintLayout) iq1Var7.b, R.string.common_unmute_publication_failure, -1).j();
                        return c1eVar;
                    }
                    g76.g0("binding");
                    throw null;
                }
                if (g76.L(bg7Var, sf7.a)) {
                    iq1 iq1Var8 = mainActivity.z;
                    if (iq1Var8 != null) {
                        ahc.g((ConstraintLayout) iq1Var8.b, R.string.common_unmute_publication_success, -1).j();
                        return c1eVar;
                    }
                    g76.g0("binding");
                    throw null;
                }
                if (g76.L(bg7Var, of7.a)) {
                    iq1 iq1Var9 = mainActivity.z;
                    if (iq1Var9 == null) {
                        g76.g0("binding");
                        throw null;
                    }
                    ahc ahcVarG = ahc.g((ConstraintLayout) iq1Var9.b, R.string.audio_is_playing_over_battery_restriction, 0);
                    ahcVarG.i(R.string.audio_is_playing_over_battery_restriction_action, new na3(mainActivity, i2));
                    ahcVarG.j();
                    return c1eVar;
                }
                if (!(bg7Var instanceof wf7)) {
                    if (bg7Var instanceof vf7) {
                        vf7 vf7Var = (vf7) bg7Var;
                        ((p13) mainActivity.t()).J(mainActivity, vf7Var.a, vf7Var.b, null);
                        return c1eVar;
                    }
                    if (!(bg7Var instanceof uf7)) {
                        ygf.a();
                        return null;
                    }
                    py2 py2Var2 = mainActivity.v;
                    if (py2Var2 == null) {
                        g76.g0("deepLinkHandler");
                        throw null;
                    }
                    if (mainActivity.j != null) {
                        py2Var2.a(mainActivity, Uri.parse(i03.i), ((uf7) bg7Var).a, null);
                        return c1eVar;
                    }
                    g76.g0("mediumUris");
                    throw null;
                }
                SourceParameter sourceParameter = ((wf7) bg7Var).a;
                iq1 iq1Var10 = mainActivity.z;
                if (iq1Var10 == null) {
                    g76.g0("binding");
                    throw null;
                }
                ConstraintLayout constraintLayout = (ConstraintLayout) iq1Var10.b;
                String string = mainActivity.getString(R.string.main_account_suspended_snackbar);
                string.getClass();
                String string2 = mainActivity.getString(R.string.main_account_suspended_snackbar_link);
                string2.getClass();
                String strY = b09.y(mainActivity.getString(R.string.main_account_suspended_snackbar), " ", string2);
                int iZ = muc.Z(strY, string2, 0, false, 6);
                if (iZ == -1) {
                    spannableString = new SpannableString(string);
                } else {
                    SpannableString spannableString2 = new SpannableString(strY);
                    spannableString2.setSpan(new we7(mainActivity, sourceParameter), iZ, string2.length() + iZ, 33);
                    spannableString = spannableString2;
                }
                ahc ahcVarH = ahc.h(constraintLayout, spannableString, -2);
                io0 io0Var = ahcVarH.i;
                io0Var.setBackgroundTintList(ColorStateList.valueOf(op8.n0(xo7.x)));
                TextView textView = (TextView) io0Var.findViewById(R.id.snackbar_text);
                if (textView != null) {
                    textView.setTextColor(-1);
                    textView.setMovementMethod(LinkMovementMethod.getInstance());
                    textView.setHighlightColor(0);
                    textView.setMaxLines(4);
                }
                ahcVarH.j();
                return c1eVar;
            case 7:
                tu9 tu9Var = (tu9) obj;
                final PostFragment postFragment = (PostFragment) obj2;
                k49 k49Var = postFragment.x0;
                gy6 gy6Var = postFragment.F0;
                if (gy6Var == null || (jz1Var = postFragment.E0) == null) {
                    return c1eVar;
                }
                ComposeView composeView = (ComposeView) jz1Var.d;
                ((ComposeView) jz1Var.h).setContent(new mz1(new ng9(tu9Var, postFragment, i4), true, 1838878414));
                jz1 jz1Var3 = postFragment.E0;
                if (jz1Var3 != null) {
                    ((ComposeView) jz1Var3.h).post(new Runnable() { // from class: og9
                        @Override // java.lang.Runnable
                        public final void run() {
                            int i9 = i4;
                            PostFragment postFragment2 = postFragment;
                            switch (i9) {
                                case 0:
                                    postFragment2.r1();
                                    break;
                                case 1:
                                    jz1 jz1Var4 = postFragment2.E0;
                                    if (jz1Var4 != null) {
                                        ComposeView composeView2 = (ComposeView) jz1Var4.c;
                                        if (composeView2.getHeight() > 0) {
                                            ViewGroup.LayoutParams layoutParams = composeView2.getLayoutParams();
                                            layoutParams.getClass();
                                            da2 da2Var = ((ga2) layoutParams).a;
                                            da2Var.getClass();
                                            ReadPostBottomAppBarBehavior readPostBottomAppBarBehavior = (ReadPostBottomAppBarBehavior) da2Var;
                                            if (readPostBottomAppBarBehavior.b > 0.0f) {
                                                float fI1 = postFragment2.i1(composeView2.getHeight());
                                                float f = readPostBottomAppBarBehavior.b;
                                                if (f > 0.0f) {
                                                    float f2 = fI1 >= 0.0f ? fI1 : 0.0f;
                                                    if (f != f2) {
                                                        readPostBottomAppBarBehavior.b = f2;
                                                        kg9 kg9Var = readPostBottomAppBarBehavior.c;
                                                        if (kg9Var != null) {
                                                            kg9Var.invoke(Float.valueOf(f2));
                                                        }
                                                    }
                                                }
                                                postFragment2.H0.h(readPostBottomAppBarBehavior.b);
                                                postFragment2.q1();
                                                break;
                                            }
                                        }
                                    }
                                    break;
                                default:
                                    postFragment2.q1();
                                    break;
                            }
                        }
                    });
                }
                boolean z = tu9Var instanceof qu9;
                if (z) {
                    iv0Var = ((qu9) tu9Var).b;
                } else if (tu9Var instanceof ru9) {
                    iv0Var = ((ru9) tu9Var).a;
                } else {
                    if (!(tu9Var instanceof su9)) {
                        th = null;
                        ygf.a();
                        return th;
                    }
                    iv0Var = ((su9) tu9Var).g;
                }
                jz1 jz1Var4 = postFragment.E0;
                if (jz1Var4 != null) {
                    th = null;
                    ((ComposeView) jz1Var4.c).setContent(new mz1(new pg9(iv0Var, postFragment, i4), true, -649393499));
                } else {
                    th = null;
                }
                boolean z2 = iv0Var.g;
                if (postFragment.G0 && !z2 && (jz1Var2 = postFragment.E0) != null) {
                    ((ComposeView) jz1Var2.c).post(new Runnable() { // from class: og9
                        @Override // java.lang.Runnable
                        public final void run() {
                            int i9 = i3;
                            PostFragment postFragment2 = postFragment;
                            switch (i9) {
                                case 0:
                                    postFragment2.r1();
                                    break;
                                case 1:
                                    jz1 jz1Var42 = postFragment2.E0;
                                    if (jz1Var42 != null) {
                                        ComposeView composeView2 = (ComposeView) jz1Var42.c;
                                        if (composeView2.getHeight() > 0) {
                                            ViewGroup.LayoutParams layoutParams = composeView2.getLayoutParams();
                                            layoutParams.getClass();
                                            da2 da2Var = ((ga2) layoutParams).a;
                                            da2Var.getClass();
                                            ReadPostBottomAppBarBehavior readPostBottomAppBarBehavior = (ReadPostBottomAppBarBehavior) da2Var;
                                            if (readPostBottomAppBarBehavior.b > 0.0f) {
                                                float fI1 = postFragment2.i1(composeView2.getHeight());
                                                float f = readPostBottomAppBarBehavior.b;
                                                if (f > 0.0f) {
                                                    float f2 = fI1 >= 0.0f ? fI1 : 0.0f;
                                                    if (f != f2) {
                                                        readPostBottomAppBarBehavior.b = f2;
                                                        kg9 kg9Var = readPostBottomAppBarBehavior.c;
                                                        if (kg9Var != null) {
                                                            kg9Var.invoke(Float.valueOf(f2));
                                                        }
                                                    }
                                                }
                                                postFragment2.H0.h(readPostBottomAppBarBehavior.b);
                                                postFragment2.q1();
                                                break;
                                            }
                                        }
                                    }
                                    break;
                                default:
                                    postFragment2.q1();
                                    break;
                            }
                        }
                    });
                }
                postFragment.G0 = z2;
                jz1 jz1Var5 = postFragment.E0;
                if (jz1Var5 != null) {
                    final ComposeView composeView2 = (ComposeView) jz1Var5.c;
                    WeakHashMap weakHashMap = ute.a;
                    z4f z4fVarA = nte.a(composeView2);
                    int dimensionPixelSize = z2 ? postFragment.n().getDimensionPixelSize(R.dimen.mini_player_height) + ((z4fVarA == null || (b36VarI = z4fVarA.a.i(2)) == null) ? 0 : b36VarI.d) : 0;
                    ViewGroup.LayoutParams layoutParams = composeView2.getLayoutParams();
                    layoutParams.getClass();
                    final ga2 ga2Var = (ga2) layoutParams;
                    int i9 = ((ViewGroup.MarginLayoutParams) ga2Var).bottomMargin;
                    if (i9 != dimensionPixelSize) {
                        ValueAnimator valueAnimator = postFragment.I0;
                        if (valueAnimator != null) {
                            valueAnimator.cancel();
                        }
                        ValueAnimator valueAnimatorOfInt = ValueAnimator.ofInt(i9, dimensionPixelSize);
                        valueAnimatorOfInt.setDuration(300L);
                        valueAnimatorOfInt.setInterpolator(new u94(1));
                        valueAnimatorOfInt.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: tg9
                            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                            public final void onAnimationUpdate(ValueAnimator valueAnimator2) {
                                valueAnimator2.getClass();
                                Object animatedValue = valueAnimator2.getAnimatedValue();
                                animatedValue.getClass();
                                int iIntValue = ((Integer) animatedValue).intValue();
                                ga2 ga2Var2 = ga2Var;
                                ((ViewGroup.MarginLayoutParams) ga2Var2).bottomMargin = iIntValue;
                                composeView2.setLayoutParams(ga2Var2);
                                postFragment.q1();
                            }
                        });
                        valueAnimatorOfInt.start();
                        postFragment.I0 = valueAnimatorOfInt;
                    }
                }
                jz1 jz1Var6 = postFragment.E0;
                if (jz1Var6 != null) {
                    ((ComposeView) jz1Var6.c).post(new Runnable() { // from class: og9
                        @Override // java.lang.Runnable
                        public final void run() {
                            int i92 = i2;
                            PostFragment postFragment2 = postFragment;
                            switch (i92) {
                                case 0:
                                    postFragment2.r1();
                                    break;
                                case 1:
                                    jz1 jz1Var42 = postFragment2.E0;
                                    if (jz1Var42 != null) {
                                        ComposeView composeView22 = (ComposeView) jz1Var42.c;
                                        if (composeView22.getHeight() > 0) {
                                            ViewGroup.LayoutParams layoutParams2 = composeView22.getLayoutParams();
                                            layoutParams2.getClass();
                                            da2 da2Var = ((ga2) layoutParams2).a;
                                            da2Var.getClass();
                                            ReadPostBottomAppBarBehavior readPostBottomAppBarBehavior = (ReadPostBottomAppBarBehavior) da2Var;
                                            if (readPostBottomAppBarBehavior.b > 0.0f) {
                                                float fI1 = postFragment2.i1(composeView22.getHeight());
                                                float f = readPostBottomAppBarBehavior.b;
                                                if (f > 0.0f) {
                                                    float f2 = fI1 >= 0.0f ? fI1 : 0.0f;
                                                    if (f != f2) {
                                                        readPostBottomAppBarBehavior.b = f2;
                                                        kg9 kg9Var = readPostBottomAppBarBehavior.c;
                                                        if (kg9Var != null) {
                                                            kg9Var.invoke(Float.valueOf(f2));
                                                        }
                                                    }
                                                }
                                                postFragment2.H0.h(readPostBottomAppBarBehavior.b);
                                                postFragment2.q1();
                                                break;
                                            }
                                        }
                                    }
                                    break;
                                default:
                                    postFragment2.q1();
                                    break;
                            }
                        }
                    });
                }
                boolean z3 = tu9Var instanceof ru9;
                ((ComposeView) jz1Var.e).setVisibility(z3 ? 0 : 8);
                if (z) {
                    my6 my6Var = postFragment.u0;
                    if (my6Var == null) {
                        g76.g0("groupCreator");
                        throw th;
                    }
                    gy6Var.c(my6Var.z(d46.Q(new h24(d24.POST, ((qu9) tu9Var).a, new lg9(0))), postFragment.q()));
                    gy6Var.a.a();
                    return c1eVar;
                }
                if (z3) {
                    return c1eVar;
                }
                if (!(tu9Var instanceof su9)) {
                    ygf.a();
                    return th;
                }
                su9 su9Var = (su9) tu9Var;
                List list = su9Var.c;
                if (su9Var.a.getPostMetaData().getPostVisibilityData().isLimitedState() && !su9Var.h) {
                    if (((Boolean) k49Var.getValue()).booleanValue()) {
                        return c1eVar;
                    }
                    k49Var.setValue(Boolean.TRUE);
                    composeView.setVisibility(0);
                    composeView.setContent(new mz1(new mg9(postFragment, jz1Var, i4), true, -1237016204));
                    return c1eVar;
                }
                ListIterator listIterator = list.listIterator(list.size());
                while (true) {
                    if (!listIterator.hasPrevious()) {
                        iNextIndex = -1;
                    } else if (((que) listIterator.previous()) instanceof n39) {
                        iNextIndex = listIterator.nextIndex();
                    }
                }
                Integer numValueOf = Integer.valueOf(iNextIndex);
                if (iNextIndex < 0) {
                    numValueOf = th;
                }
                postFragment.M0 = numValueOf;
                composeView.setVisibility(8);
                my6 my6Var2 = postFragment.u0;
                if (my6Var2 == null) {
                    g76.g0("groupCreator");
                    throw th;
                }
                ArrayList arrayListZ = my6Var2.z(list, postFragment.q());
                ug9 ug9Var = postFragment.z0;
                ArrayList arrayList = gy6Var.c;
                if (arrayList.isEmpty()) {
                    ac3 ac3VarN = g76.N(new h30(new ArrayList(arrayList), arrayListZ));
                    gy6Var.c(arrayListZ);
                    ac3VarN.a(gy6Var.e);
                    if (ug9Var == null) {
                        return c1eVar;
                    }
                    ug9Var.a();
                    return c1eVar;
                }
                h30 h30Var = new h30(new ArrayList(arrayList), arrayListZ);
                u80 u80Var = gy6Var.f;
                u80Var.c = arrayListZ;
                int i10 = u80Var.b + 1;
                u80Var.b = i10;
                new yb3(u80Var, h30Var, i10, ug9Var).execute(new Void[0]);
                return c1eVar;
            case 8:
                ((AtomicReference) obj2).set((q0c) obj);
                return c1eVar;
            default:
                return ((b55) obj2).invoke(obj, n92Var);
        }
    }

    public /* synthetic */ ob0(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }
}
