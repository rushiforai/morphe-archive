package defpackage;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.graphics.Path;
import android.graphics.RectF;
import android.net.Uri;
import android.os.Bundle;
import android.widget.Toast;
import androidx.compose.runtime.tooling.Dp.CspinKvYN;
import com.medium.android.core.models.ReadingContext;
import com.medium.android.core.navigation.EditPostReference;
import com.medium.android.core.navigation.NotificationFilterType;
import com.medium.android.core.navigation.PublicationReference;
import com.medium.android.core.navigation.s;
import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.SusiOperation;
import com.medium.android.data.post.TargetPost;
import com.medium.android.donkey.post.PostFragment;
import com.medium.android.donkey.post.PostPageFragment2;
import com.medium.android.donkey.write.EditPostFragment;
import com.medium.android.graphql.type.PageParams;
import com.medium.android.notifications.NotificationsFragment;
import com.medium.android.publication.ui.main.PublicationFragment;
import com.medium.android.susi.ui.loginCode.LoginCodeBottomSheetDialogFragment;
import com.medium.android.susi.ui.signUp.SignUpFragment;
import com.medium.proto.event.AnalyticsEventCommonFields;
import com.medium.proto.event.PostClientVisibilityState;
import com.medium.proto.event.PostDensity;
import com.medium.proto.event.PostPresented;
import com.medium.proto.event.SignUpSignInError;
import com.medium.proto.event.SignUpSignInLoginCodeError;
import com.medium.reader.R;
import com.squareup.wire.ProtoReader;
import gen.model.SourceParameter;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class b09 {
    public static String A(StringBuilder sb, int i, String str) {
        sb.append(str);
        sb.append(i);
        return sb.toString();
    }

    public static String B(StringBuilder sb, List list, String str) {
        sb.append(list);
        sb.append(str);
        return sb.toString();
    }

    public static String C(StringBuilder sb, boolean z, String str, boolean z2, String str2) {
        sb.append(z);
        sb.append(str);
        sb.append(z2);
        sb.append(str2);
        return sb.toString();
    }

    public static StringBuilder D(String str, String str2, long j) {
        StringBuilder sb = new StringBuilder(str);
        sb.append(j);
        sb.append(str2);
        return sb;
    }

    public static StringBuilder E(String str, String str2, String str3, String str4, List list) {
        StringBuilder sb = new StringBuilder(str);
        sb.append(str2);
        sb.append(str3);
        sb.append(list);
        sb.append(str4);
        return sb;
    }

    public static ArrayList F(ProtoReader protoReader) {
        protoReader.getClass();
        return new ArrayList();
    }

    public static void G(h52 h52Var, vj3 vj3Var, String str) {
        h52Var.getClass();
        h52Var.f(new ze3(vj3Var, str));
    }

    public static void H(p65 p65Var, boolean z, boolean z2, boolean z3) {
        p65Var.p(z);
        p65Var.p(z2);
        p65Var.p(z3);
    }

    public static void I(String str, String str2, String str3) {
        str.getClass();
        str2.getClass();
        str3.getClass();
    }

    public static void J(String str, List list, ArrayList arrayList) {
        arrayList.add(str + list);
    }

    public static void K(s sVar, Context context, EditPostReference editPostReference, String str) throws PendingIntent.CanceledException {
        context.getClass();
        editPostReference.getClass();
        str.getClass();
        int i = EditPostFragment.Q0;
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new EditPostFragment.BundleInfo(str, editPostReference));
        m4.w(context, R.id.editPostFragment, bundle, new ob8(false, false, -1, false, false, R.anim.common_slide_in_bottom, R.anim.nav_default_exit_anim, R.anim.nav_default_pop_enter_anim, R.anim.common_slide_out_bottom), 8);
    }

    public static void M(lig ligVar, String str, SusiOperation susiOperation, String str2, String str3, SusiDestination susiDestination, boolean z, int i) {
        if ((i & 8) != 0) {
            str3 = null;
        }
        String str4 = str3;
        boolean z2 = (i & 64) == 0;
        str.getClass();
        susiOperation.getClass();
        str2.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new LoginCodeBottomSheetDialogFragment.BundleInfo(str, susiOperation, susiDestination, str2, str4, z, z2));
        ligVar.W(R.id.loginCodeBottomSheetDialogFragment, bundle);
    }

    public static void N(s sVar, Context context, String str) throws PendingIntent.CanceledException {
        NotificationFilterType notificationFilterType = NotificationFilterType.ALL;
        context.getClass();
        str.getClass();
        notificationFilterType.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new NotificationsFragment.BundleInfo(str, notificationFilterType));
        m4.w(context, R.id.notificationsFragment, bundle, null, 12);
    }

    public static void O(s sVar, Context context, String str, String str2, String str3, String str4, ReadingContext readingContext, int i) throws PendingIntent.CanceledException {
        Bundle bundle;
        if ((i & 8) != 0) {
            str3 = null;
        }
        if ((i & 16) != 0) {
            str4 = null;
        }
        if ((i & 32) != 0) {
            readingContext = ReadingContext.Default.INSTANCE;
        }
        p13 p13Var = (p13) sVar;
        context.getClass();
        str.getClass();
        str2.getClass();
        readingContext.getClass();
        int i2 = p13Var.a() ? R.id.postPageFragment2 : R.id.postFragment;
        if (p13Var.a()) {
            TargetPost targetPost = new TargetPost(str, str3, str4);
            bundle = new Bundle();
            bundle.putParcelable("bundle_info", new PostPageFragment2.BundleInfo(targetPost, readingContext, str2));
        } else {
            TargetPost targetPost2 = new TargetPost(str, str3, str4);
            bundle = new Bundle();
            bundle.putParcelable("bundle_info", new PostFragment.BundleInfo(targetPost2, readingContext, str2));
        }
        m4.w(context, i2, bundle, qb8.V(), 8);
    }

    public static void P(pkf pkfVar, String str, Integer num, String str2, SourceParameter sourceParameter, int i) {
        Integer num2 = (i & 2) != 0 ? null : num;
        String str3 = (i & 4) != 0 ? null : str2;
        str.getClass();
        sourceParameter.getClass();
        PublicationFragment publicationFragment = ((kia) ((sja) pkfVar.a)).a;
        ((p13) publicationFragment.Z()).w(publicationFragment.S(), new PublicationReference.Id(str), num2, str3, null, gp7.u(sourceParameter));
    }

    public static void V(p13 p13Var, Context context, String str) {
        context.getClass();
        Intent intent = new Intent("android.intent.action.SENDTO");
        intent.setData(Uri.parse("mailto:"));
        intent.putExtra("android.intent.extra.EMAIL", new String[]{str});
        if (intent.resolveActivity(context.getPackageManager()) != null) {
            context.startActivity(intent);
        } else {
            Toast.makeText(context, R.string.error_no_email_app, 1).show();
        }
    }

    public static /* synthetic */ void W(s sVar, Context context, String str, g08 g08Var, String str2, int i) {
        if ((i & 8) != 0) {
            str2 = null;
        }
        ((p13) sVar).s0(context, str, g08Var, str2, (i & 16) == 0);
    }

    public static void X(a13 a13Var, SusiOperation susiOperation, String str, String str2, String str3, String str4, String str5) {
        susiOperation.getClass();
        str.getClass();
        str3.getClass();
        str4.getClass();
        str5.getClass();
        AnalyticsEventCommonFields analyticsEventCommonFields = null;
        String str6 = "app";
        String str7 = null;
        rqd.a(a13Var.a, new SignUpSignInLoginCodeError(analyticsEventCommonFields, str6, str2, str7, susiOperation.getValue(), a13Var.b.p(), str, null, 129, null), str5, str4, false, null, str3, 24);
    }

    public static void Y(nq9 nq9Var, String str, PostClientVisibilityState postClientVisibilityState, PostDensity postDensity, String str2, String str3, String str4, boolean z, int i) {
        boolean z2 = (i & 128) != 0 ? false : z;
        ty2 ty2Var = (ty2) nq9Var;
        ty2Var.getClass();
        str.getClass();
        postClientVisibilityState.getClass();
        postDensity.getClass();
        str2.getClass();
        str4.getClass();
        rqd.a(ty2Var.a, new PostPresented(null, str, str3, null, null, str2, postClientVisibilityState, postDensity, Boolean.valueOf(z2), null, 529, null), str2, str3, false, null, str4, 16);
    }

    public static void Z(a13 a13Var, String str, l3d l3dVar, SusiOperation susiOperation, String str2, String str3, String str4, String str5) {
        a13Var.getClass();
        str2.getClass();
        str3.getClass();
        str4.getClass();
        str5.getClass();
        rqd.a(a13Var.a, new SignUpSignInError(null, "app", susiOperation != null ? susiOperation.getValue() : null, l3dVar != null ? l3dVar.getValue() : null, str, null, a13Var.b.p(), str5, null, 257, null), str4, str3, true, null, str2, 16);
    }

    public static void a(SourceParameter sourceParameter, String str, String str2) {
        str.getClass();
        str2.getClass();
        sourceParameter.getClass();
        throw new ei8("deletePost is not implemented");
    }

    public static void b(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        throw new ei8("editPost is not implemented");
    }

    public static void c(SourceParameter sourceParameter, String str, String str2, String str3) {
        str.getClass();
        str2.getClass();
        str3.getClass();
        sourceParameter.getClass();
        throw new ei8("onAddNoteSelected is not implemented");
    }

    public static void d(SourceParameter sourceParameter) {
        sourceParameter.getClass();
        throw new ei8("onDownload is not implemented");
    }

    public static void e(SourceParameter sourceParameter, String str, String str2, String str3, String str4) {
        str.getClass();
        str2.getClass();
        str3.getClass();
        str4.getClass();
        sourceParameter.getClass();
        throw new ei8("onEditNoteSelected is not implemented");
    }

    public static void f(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        throw new ei8("onRemoveFromListSelected is not implemented");
    }

    public static void g(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        throw new ei8("onTagSelected is not implemented");
    }

    public static void h(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        throw new ei8("submitToPublication is not implemented");
    }

    public static void j(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        throw new ei8("viewPostStats is not implemented");
    }

    public static void k(SourceParameter sourceParameter, String str, String str2) {
        str.getClass();
        str2.getClass();
        sourceParameter.getClass();
        throw new ei8("withdrawSubmission is not implemented");
    }

    public static void l(br brVar, br brVar2) {
        Path path = brVar.a;
        if (brVar2 instanceof br) {
            path.addPath(brVar2.a, Float.intBitsToFloat(0), Float.intBitsToFloat(0));
        } else {
            ik4.k("Unable to obtain android.graphics.Path");
        }
    }

    public static void m(br brVar, zwa zwaVar) {
        Path.Direction direction;
        f59 f59Var = f59.CounterClockwise;
        float f = zwaVar.a;
        float f2 = zwaVar.d;
        float f3 = zwaVar.c;
        float f4 = zwaVar.b;
        if (Float.isNaN(f) || Float.isNaN(f4) || Float.isNaN(f3) || Float.isNaN(f2)) {
            er.b("Invalid rectangle, make sure no value is NaN");
        }
        RectF rectF = brVar.b;
        if (rectF == null) {
            rectF = new RectF();
            brVar.b = rectF;
        }
        rectF.set(f, f4, f3, f2);
        Path path = brVar.a;
        RectF rectF2 = brVar.b;
        rectF2.getClass();
        int i = dr.a[f59Var.ordinal()];
        if (i == 1) {
            direction = Path.Direction.CCW;
        } else {
            if (i != 2) {
                ygf.a();
                return;
            }
            direction = Path.Direction.CW;
        }
        path.addRect(rectF2, direction);
    }

    public static void n(br brVar, wlb wlbVar) {
        Path.Direction direction;
        f59 f59Var = f59.CounterClockwise;
        RectF rectF = brVar.b;
        if (rectF == null) {
            rectF = new RectF();
            brVar.b = rectF;
        }
        float f = wlbVar.a;
        long j = wlbVar.h;
        long j2 = wlbVar.g;
        long j3 = wlbVar.f;
        long j4 = wlbVar.e;
        rectF.set(f, wlbVar.b, wlbVar.c, wlbVar.d);
        float[] fArr = brVar.c;
        if (fArr == null) {
            fArr = new float[8];
            brVar.c = fArr;
        }
        fArr[0] = Float.intBitsToFloat((int) (j4 >> 32));
        fArr[1] = Float.intBitsToFloat((int) (j4 & 4294967295L));
        fArr[2] = Float.intBitsToFloat((int) (j3 >> 32));
        fArr[3] = Float.intBitsToFloat((int) (j3 & 4294967295L));
        fArr[4] = Float.intBitsToFloat((int) (j2 >> 32));
        fArr[5] = Float.intBitsToFloat((int) (j2 & 4294967295L));
        fArr[6] = Float.intBitsToFloat((int) (j >> 32));
        fArr[7] = Float.intBitsToFloat((int) (j & 4294967295L));
        Path path = brVar.a;
        RectF rectF2 = brVar.b;
        rectF2.getClass();
        float[] fArr2 = brVar.c;
        fArr2.getClass();
        int i = dr.a[f59Var.ordinal()];
        if (i == 1) {
            direction = Path.Direction.CCW;
        } else {
            if (i != 2) {
                ygf.a();
                return;
            }
            direction = Path.Direction.CW;
        }
        path.addRoundRect(rectF2, fArr2, direction);
    }

    public static int o(mkd mkdVar, int i, int i2) {
        return (mkdVar.hashCode() + i) * i2;
    }

    public static int p(ArrayList arrayList, int i, int i2) {
        return (arrayList.hashCode() + i) * i2;
    }

    public static o10 q(long j, sn3 sn3Var) {
        return sn3Var.a(new uu1(j));
    }

    public static z52 r(p65 p65Var) {
        z52 z52Var = new z52();
        p65Var.j0(z52Var);
        return z52Var;
    }

    public static m62 s(z52 z52Var, p65 p65Var) {
        m62 m62Var = new m62(z52Var);
        p65Var.j0(m62Var);
        return m62Var;
    }

    public static hl7 t(m73 m73Var, p65 p65Var) {
        hl7 hl7Var = new hl7(m73Var);
        p65Var.j0(hl7Var);
        return hl7Var;
    }

    public static sm8 u(PageParams.Companion companion) {
        companion.getClass();
        sm8 sm8Var = PageParams.type;
        sm8Var.getClass();
        return sm8Var;
    }

    public static k49 v(c1e c1eVar, y3b y3bVar, p65 p65Var) {
        k49 k49Var = new k49(c1eVar, y3bVar);
        p65Var.j0(k49Var);
        return k49Var;
    }

    public static String w(int i, String str) {
        return str + i;
    }

    public static String x(String str, String str2, long j) {
        return str + j + str2;
    }

    public static String y(String str, String str2, String str3) {
        return str + str2 + str3;
    }

    public static String z(String str, String str2, boolean z) {
        return str + z + str2;
    }

    public static void T(lig ligVar, String str, String str2, String str3, SusiDestination susiDestination, boolean z, int i) {
        if ((i & 2) != 0) {
            str2 = "";
        }
        if ((i & 4) != 0) {
            str3 = "";
        }
        if ((i & 16) != 0) {
            z = false;
        }
        ligVar.getClass();
        str.getClass();
        Bundle bundle = new Bundle();
        bundle.putParcelable(CspinKvYN.sXBuMgPw, new SignUpFragment.BundleInfo(str, str3, str2, susiDestination, z));
        ligVar.W(R.id.signUpFragment, bundle);
    }

    public static String i(SusiDestination susiDestination) {
        if (susiDestination.equals(SusiDestination.Search.INSTANCE)) {
            return "/search";
        }
        if (susiDestination.equals(SusiDestination.NewStory.INSTANCE)) {
            return "/new-story";
        }
        if (susiDestination instanceof SusiDestination.Deeplink) {
            return ((SusiDestination.Deeplink) susiDestination).getUrl();
        }
        if (susiDestination instanceof SusiDestination.Post) {
            return ka1.r(CspinKvYN.QhVeBGVzDCz, ((SusiDestination.Post) susiDestination).getId());
        }
        ygf.a();
        return null;
    }
}
