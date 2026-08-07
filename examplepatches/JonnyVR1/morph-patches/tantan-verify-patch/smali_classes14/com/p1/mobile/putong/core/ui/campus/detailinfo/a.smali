.class public Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VFrame;

.field public b:Lv/VMaterialEdit_FakeSpinner;

.field public c:Lv/VText;

.field public d:Lv/VFrame;

.field public e:Lv/VMaterialEdit_FakeSpinner;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Landroid/widget/LinearLayout;

.field public i:Lv/VFrame;

.field public j:Landroid/widget/LinearLayout;

.field public k:Lv/VDraweeView;

.field public l:Lv/VFrame;

.field public m:Landroid/widget/LinearLayout;

.field public n:Lv/VDraweeView;

.field public o:Lv/VText;

.field public p:Lv/VText;

.field public q:Lv/VText;

.field public r:Lv/VButton_FakeShadow;

.field public s:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

.field public t:Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;

.field public u:Landroid/app/Dialog;

.field public v:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->t:Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;

    .line 5
    .line 6
    return-void
.end method

.method private synthetic K(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->t:Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->d:Ll/yy6;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/jf00;->g()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->graduateActivity:Lcom/p1/mobile/putong/core/data/GraduateActivity;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GraduateActivity;->entranceUrl:Ljava/lang/String;

    .line 14
    .line 15
    const-string v0, ""

    .line 16
    .line 17
    invoke-static {p0, v0, p1}, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private synthetic L(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->s:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->u0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->t:Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;

    .line 14
    .line 15
    sget p1, Lcom/p1/mobile/putong/core/R$string;->D0:I

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->Y()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private synthetic M(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->s:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;->FRONT:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;

    .line 4
    .line 5
    iput-object v0, p1, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->b:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;

    .line 6
    .line 7
    const-string p1, "http://auto.tancdn.com/v1/images/eyJpZCI6IlVMWlNaMkZGNUhIT1UyR09INU43RlVSU0pGSDdONSIsInciOjcyNiwiaCI6NDI5LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MTQ4NTIxODA4NDcwOTI0NjkzOTB9"

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->B(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic N(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->s:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;->BACK:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;

    .line 4
    .line 5
    iput-object v0, p1, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->b:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;

    .line 6
    .line 7
    const-string p1, "http://auto.tancdn.com/v1/images/eyJpZCI6Ik1PQTNVTlFQWE1aUVVEQjdJWVM1TUZKU0ZJV003USIsInciOjcyNiwiaCI6NDI4LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MTE1MDIzNjEyNjY3Nzk1MzY5MjV9"

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->B(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic O(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->s:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;->FRONT:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;

    .line 4
    .line 5
    iput-object v0, p1, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->b:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;

    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->t:Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->s:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->t0()Lcom/p1/mobile/putong/data/Media;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-static {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;->d2(Landroid/content/Context;Lcom/p1/mobile/putong/data/Media;Z)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance v0, Ll/s9g0;

    .line 25
    .line 26
    invoke-direct {v0}, Ll/s9g0;-><init>()V

    .line 27
    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    invoke-virtual {p1, p0, v1, v0}, Lcom/p1/mobile/android/app/Act;->startActivityForResultWithCustomTransition(Landroid/content/Intent;ILcom/p1/mobile/android/app/Act$w;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private synthetic P(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->s:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;->BACK:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;

    .line 4
    .line 5
    iput-object v0, p1, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->b:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$PicType;

    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->t:Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->s:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->s0()Lcom/p1/mobile/putong/data/Media;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-static {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/campus/StudentCardPreviewAct;->d2(Landroid/content/Context;Lcom/p1/mobile/putong/data/Media;Z)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance v0, Ll/s9g0;

    .line 25
    .line 26
    invoke-direct {v0}, Ll/s9g0;-><init>()V

    .line 27
    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    invoke-virtual {p1, p0, v1, v0}, Lcom/p1/mobile/android/app/Act;->startActivityForResultWithCustomTransition(Landroid/content/Intent;ILcom/p1/mobile/android/app/Act$w;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private synthetic Q(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->s:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->V0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic R(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->t:Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->s:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->D0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->s:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->u0()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-static {p1, v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;->X1(Landroid/content/Context;ZLjava/lang/String;Z)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p1, p0, v1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;Landroid/util/Pair;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->S(Landroid/util/Pair;Landroid/util/Pair;)V

    return-void
.end method

.method private a0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->s:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->y0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->r:Lv/VButton_FakeShadow;

    .line 8
    .line 9
    xor-int/lit8 v2, v0, 0x1

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Landroid/view/View;->setActivated(Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->r:Lv/VButton_FakeShadow;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->setClickable(Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->K(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->I(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;Ll/q1e;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->W(Ll/q1e;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->O(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->L(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;Ll/q1e;)Lcom/p1/mobile/android/app/Dialog;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->V(Ll/q1e;)Lcom/p1/mobile/android/app/Dialog;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->H(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->M(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->N(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->J(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/android/app/Dialog;Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->P(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;Lrx/c;Lv/VDraweeView;Landroid/view/animation/AccelerateDecelerateInterpolator;ILv/VText;Ll/q1e;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p7}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->U(Lrx/c;Lv/VDraweeView;Landroid/view/animation/AccelerateDecelerateInterpolator;ILv/VText;Ll/q1e;Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->Q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;Ll/q1e;)Lcom/p1/mobile/android/app/Dialog;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->X(Ll/q1e;)Lcom/p1/mobile/android/app/Dialog;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;Lv/VDraweeView;Landroid/view/animation/AccelerateDecelerateInterpolator;ILv/VText;Ll/q1e;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->T(Lv/VDraweeView;Landroid/view/animation/AccelerateDecelerateInterpolator;ILv/VText;Ll/q1e;Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->R(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A(Ljava/lang/String;Lcom/p1/mobile/putong/data/StudentVerification;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->b:Lv/VMaterialEdit_FakeSpinner;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p2, Lcom/p1/mobile/putong/data/StudentVerification;->startTime:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    const-string v0, "-01"

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    const/16 v2, 0xa

    .line 27
    .line 28
    if-lt v1, v2, :cond_0

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->e:Lv/VMaterialEdit_FakeSpinner;

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    new-instance v0, Ljava/lang/Throwable;

    .line 46
    .line 47
    new-instance v1, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    const-string v2, "IllegalStateException startTime:"

    .line 50
    .line 51
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string p1, "user id"

    .line 58
    .line 59
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-direct {v0, p1}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    const/16 p1, 0x64

    .line 81
    .line 82
    invoke-static {v0, p1}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->e:Lv/VMaterialEdit_FakeSpinner;

    .line 86
    .line 87
    iget-object v0, p2, Lcom/p1/mobile/putong/data/StudentVerification;->startTime:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->e:Lv/VMaterialEdit_FakeSpinner;

    .line 94
    .line 95
    const-string v0, ""

    .line 96
    .line 97
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    .line 99
    .line 100
    :goto_0
    iget-object p1, p2, Lcom/p1/mobile/putong/data/StudentVerification;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 101
    .line 102
    const-string v0, "preVerified"

    .line 103
    .line 104
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    if-eqz p1, :cond_2

    .line 109
    .line 110
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->G()Z

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    if-nez p1, :cond_2

    .line 115
    .line 116
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->s:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 117
    .line 118
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->z0()Z

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->r:Lv/VButton_FakeShadow;

    .line 123
    .line 124
    xor-int/lit8 v0, p1, 0x1

    .line 125
    .line 126
    invoke-virtual {p2, v0}, Landroid/view/View;->setActivated(Z)V

    .line 127
    .line 128
    .line 129
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->r:Lv/VButton_FakeShadow;

    .line 130
    .line 131
    invoke-virtual {p0, p1}, Landroid/view/View;->setClickable(Z)V

    .line 132
    .line 133
    .line 134
    return-void

    .line 135
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->c0()I

    .line 136
    .line 137
    .line 138
    move-result p1

    .line 139
    if-nez p1, :cond_3

    .line 140
    .line 141
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->s:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 142
    .line 143
    iget-object v0, p2, Lcom/p1/mobile/putong/data/StudentVerification;->pictures:Ljava/util/List;

    .line 144
    .line 145
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->U0(Ljava/util/List;)V

    .line 146
    .line 147
    .line 148
    :cond_3
    iget-object p1, p2, Lcom/p1/mobile/putong/data/StudentVerification;->rejectionReasons:Ljava/util/List;

    .line 149
    .line 150
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result p1

    .line 154
    if-eqz p1, :cond_5

    .line 155
    .line 156
    iget-object p1, p2, Lcom/p1/mobile/putong/data/StudentVerification;->rejectionReasons:Ljava/util/List;

    .line 157
    .line 158
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 159
    .line 160
    .line 161
    move-result p1

    .line 162
    if-lez p1, :cond_5

    .line 163
    .line 164
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->s:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 165
    .line 166
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->e:Z

    .line 167
    .line 168
    if-eqz v0, :cond_4

    .line 169
    .line 170
    iget-object p2, p2, Lcom/p1/mobile/putong/data/StudentVerification;->rejectionReasons:Ljava/util/List;

    .line 171
    .line 172
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->A0(Ljava/util/List;)V

    .line 173
    .line 174
    .line 175
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->d0()V

    .line 176
    .line 177
    .line 178
    :cond_5
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->a0()V

    .line 179
    .line 180
    .line 181
    return-void
.end method

.method public final B(Ljava/lang/String;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->v:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->t:Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget v3, Ll/kec0;->ye:I

    .line 14
    .line 15
    invoke-virtual {v0, v3, v2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->v:Landroid/view/View;

    .line 20
    .line 21
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->F()V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->u:Landroid/app/Dialog;

    .line 25
    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    new-instance v0, Landroid/app/Dialog;

    .line 29
    .line 30
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->t:Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;

    .line 31
    .line 32
    invoke-direct {v0, v3, v1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->u:Landroid/app/Dialog;

    .line 36
    .line 37
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->v:Landroid/view/View;

    .line 38
    .line 39
    sget v1, Ll/adc0;->R5:I

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lv/VDraweeView;

    .line 46
    .line 47
    const/high16 v1, 0x41400000    # 12.0f

    .line 48
    .line 49
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    int-to-float v1, v1

    .line 54
    invoke-static {v1}, Lcom/facebook/drawee/generic/RoundingParams;->c(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 59
    .line 60
    invoke-virtual {v3}, Ll/am2;->l()Ll/xlj;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-virtual {v3, v1}, Ll/xlj;->K(Lcom/facebook/drawee/generic/RoundingParams;)Ll/xlj;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v1}, Ll/xlj;->a()Ll/wlj;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageURI(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->u:Landroid/app/Dialog;

    .line 79
    .line 80
    invoke-virtual {p1, v2}, Landroid/app/Dialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->u:Landroid/app/Dialog;

    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->v:Landroid/view/View;

    .line 86
    .line 87
    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->u:Landroid/app/Dialog;

    .line 91
    .line 92
    const/4 v0, 0x1

    .line 93
    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->u:Landroid/app/Dialog;

    .line 97
    .line 98
    invoke-virtual {p1}, Landroid/app/Dialog;->show()V

    .line 99
    .line 100
    .line 101
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->u:Landroid/app/Dialog;

    .line 102
    .line 103
    const/4 v3, 0x1

    .line 104
    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    .line 105
    .line 106
    const/16 v2, 0x50

    .line 107
    .line 108
    move-object v0, p0

    .line 109
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->z(Landroid/app/Dialog;IZD)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public final C(Landroid/view/View;)Landroid/util/Pair;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            ")",
            "Landroid/util/Pair<",
            "Lcn/qqtheme/framework/wheelview/WheelView;",
            "Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;",
            ">;"
        }
    .end annotation

    .line 1
    sget v0, Ll/adc0;->Sf:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcn/qqtheme/framework/wheelview/WheelView;

    .line 8
    .line 9
    new-instance v0, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->t:Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;

    .line 12
    .line 13
    const/16 v1, 0xc

    .line 14
    .line 15
    const-string v2, "%02d"

    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    invoke-direct {v0, p0, v3, v1, v2}, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;-><init>(Landroid/content/Context;IILjava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v0}, Lcn/qqtheme/framework/wheelview/WheelView;->setViewAdapter(Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;)V

    .line 22
    .line 23
    .line 24
    sget p0, Ll/c9c0;->b:I

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Lcn/qqtheme/framework/wheelview/adapter/AbstractWheelTextAdapter;->setTextColor(I)V

    .line 27
    .line 28
    .line 29
    const/16 p0, 0x14

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Lcn/qqtheme/framework/wheelview/adapter/AbstractWheelTextAdapter;->setTextSize(I)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    invoke-virtual {p1, p0}, Lcn/qqtheme/framework/wheelview/WheelView;->setCyclic(Z)V

    .line 36
    .line 37
    .line 38
    const/16 p0, 0x8

    .line 39
    .line 40
    invoke-virtual {p1, p0}, Lcn/qqtheme/framework/wheelview/WheelView;->setCurrentItem(I)V

    .line 41
    .line 42
    .line 43
    new-instance p0, Landroid/util/Pair;

    .line 44
    .line 45
    invoke-direct {p0, p1, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    return-object p0
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->t:Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public final E(Landroid/view/View;)Landroid/util/Pair;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            ")",
            "Landroid/util/Pair<",
            "Lcn/qqtheme/framework/wheelview/WheelView;",
            "Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/sql/Date;

    .line 6
    .line 7
    sget-object v2, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 8
    .line 9
    invoke-virtual {v2}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 10
    .line 11
    .line 12
    move-result-wide v2

    .line 13
    invoke-direct {v1, v2, v3}, Ljava/sql/Date;-><init>(J)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    sget v1, Ll/adc0;->Tf:I

    .line 25
    .line 26
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Lcn/qqtheme/framework/wheelview/WheelView;

    .line 31
    .line 32
    new-instance v1, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->t:Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;

    .line 35
    .line 36
    add-int/lit8 v2, v0, -0xa

    .line 37
    .line 38
    add-int/lit8 v0, v0, 0x3

    .line 39
    .line 40
    invoke-direct {v1, p0, v2, v0}, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;-><init>(Landroid/content/Context;II)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, v1}, Lcn/qqtheme/framework/wheelview/WheelView;->setViewAdapter(Lcn/qqtheme/framework/wheelview/adapter/WheelViewAdapter;)V

    .line 44
    .line 45
    .line 46
    sget p0, Ll/c9c0;->b:I

    .line 47
    .line 48
    invoke-virtual {v1, p0}, Lcn/qqtheme/framework/wheelview/adapter/AbstractWheelTextAdapter;->setTextColor(I)V

    .line 49
    .line 50
    .line 51
    const/16 p0, 0x14

    .line 52
    .line 53
    invoke-virtual {v1, p0}, Lcn/qqtheme/framework/wheelview/adapter/AbstractWheelTextAdapter;->setTextSize(I)V

    .line 54
    .line 55
    .line 56
    const/4 p0, 0x0

    .line 57
    invoke-virtual {p1, p0}, Lcn/qqtheme/framework/wheelview/WheelView;->setCyclic(Z)V

    .line 58
    .line 59
    .line 60
    const/16 p0, 0xa

    .line 61
    .line 62
    invoke-virtual {p1, p0}, Lcn/qqtheme/framework/wheelview/WheelView;->setCurrentItem(I)V

    .line 63
    .line 64
    .line 65
    new-instance p0, Landroid/util/Pair;

    .line 66
    .line 67
    invoke-direct {p0, p1, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    return-object p0
.end method

.method public final F()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->v:Landroid/view/View;

    .line 2
    .line 3
    sget v1, Ll/adc0;->F4:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lv/VText;

    .line 10
    .line 11
    new-instance v1, Ll/kag0;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/kag0;-><init>(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->v:Landroid/view/View;

    .line 20
    .line 21
    sget v1, Ll/adc0;->E4:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lv/VText;

    .line 28
    .line 29
    new-instance v1, Ll/u9g0;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/u9g0;-><init>(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->v:Landroid/view/View;

    .line 38
    .line 39
    sget v1, Ll/adc0;->Q0:I

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lv/VText;

    .line 46
    .line 47
    new-instance v1, Ll/v9g0;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/v9g0;-><init>(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public G()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->h:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public final synthetic H(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->t:Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;

    .line 2
    .line 3
    const/4 v4, 0x0

    .line 4
    sget-object v5, Ll/fph0;->e:Ljava/lang/String;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x0

    .line 9
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/app/PutongAct;->pickImagesWithPicker(IZZZLjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->u:Landroid/app/Dialog;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->u:Landroid/app/Dialog;

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->u:Landroid/app/Dialog;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public final synthetic I(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->u:Landroid/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic J(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->t:Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;

    .line 2
    .line 3
    invoke-static {p1}, Ll/l7y;->l(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->u:Landroid/app/Dialog;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->u:Landroid/app/Dialog;

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->u:Landroid/app/Dialog;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final synthetic S(Landroid/util/Pair;Landroid/util/Pair;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v1, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;

    .line 9
    .line 10
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast p1, Lcn/qqtheme/framework/wheelview/WheelView;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcn/qqtheme/framework/wheelview/WheelView;->getCurrentItem()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-virtual {v1, p1}, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;->getItemText(I)Ljava/lang/CharSequence;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string p1, "-"

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget-object p1, p2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast p1, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;

    .line 33
    .line 34
    iget-object p2, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast p2, Lcn/qqtheme/framework/wheelview/WheelView;

    .line 37
    .line 38
    invoke-virtual {p2}, Lcn/qqtheme/framework/wheelview/WheelView;->getCurrentItem()I

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    invoke-virtual {p1, p2}, Lcn/qqtheme/framework/wheelview/adapter/NumericWheelAdapter;->getItemText(I)Ljava/lang/CharSequence;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string p1, "-01"

    .line 50
    .line 51
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->s:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->r0(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->s:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->f:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;

    .line 66
    .line 67
    const/4 p1, 0x0

    .line 68
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;->b:Z

    .line 69
    .line 70
    return-void
.end method

.method public final synthetic T(Lv/VDraweeView;Landroid/view/animation/AccelerateDecelerateInterpolator;ILv/VText;Ll/q1e;Ljava/lang/Long;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Landroid/graphics/drawable/AnimationDrawable;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p6}, Ljava/lang/Long;->longValue()J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    long-to-float v0, v0

    .line 15
    int-to-float v1, p3

    .line 16
    const/high16 v2, 0x3f800000    # 1.0f

    .line 17
    .line 18
    sub-float/2addr v1, v2

    .line 19
    div-float/2addr v0, v1

    .line 20
    invoke-virtual {p2, v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;->getInterpolation(F)F

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    invoke-static {}, Ljava/text/NumberFormat;->getPercentInstance()Ljava/text/NumberFormat;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget-object v1, Ljava/math/RoundingMode;->FLOOR:Ljava/math/RoundingMode;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/text/NumberFormat;->setRoundingMode(Ljava/math/RoundingMode;)V

    .line 31
    .line 32
    .line 33
    new-instance v1, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->act()Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    sget v2, Lcom/p1/mobile/putong/core/R$string;->y0:I

    .line 43
    .line 44
    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string p0, "("

    .line 52
    .line 53
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    float-to-double v2, p2

    .line 57
    invoke-virtual {v0, v2, v3}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string p0, ")"

    .line 65
    .line 66
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p4, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p6}, Ljava/lang/Long;->longValue()J

    .line 77
    .line 78
    .line 79
    move-result-wide v0

    .line 80
    const/4 p0, 0x1

    .line 81
    sub-int/2addr p3, p0

    .line 82
    int-to-long p2, p3

    .line 83
    cmp-long p2, v0, p2

    .line 84
    .line 85
    if-nez p2, :cond_0

    .line 86
    .line 87
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    check-cast p1, Landroid/graphics/drawable/AnimationDrawable;

    .line 92
    .line 93
    invoke-virtual {p1}, Landroid/graphics/drawable/AnimationDrawable;->stop()V

    .line 94
    .line 95
    .line 96
    const/4 p1, 0x0

    .line 97
    new-array p1, p1, [Ljava/lang/Object;

    .line 98
    .line 99
    invoke-virtual {p5, p0, p1}, Ll/q1e;->k(I[Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    :cond_0
    return-void
.end method

.method public final synthetic U(Lrx/c;Lv/VDraweeView;Landroid/view/animation/AccelerateDecelerateInterpolator;ILv/VText;Ll/q1e;Landroid/content/DialogInterface;)V
    .locals 7

    .line 1
    new-instance v0, Ll/bag0;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p2

    .line 5
    move-object v3, p3

    .line 6
    move v4, p4

    .line 7
    move-object v5, p5

    .line 8
    move-object v6, p6

    .line 9
    invoke-direct/range {v0 .. v6}, Ll/bag0;-><init>(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;Lv/VDraweeView;Landroid/view/animation/AccelerateDecelerateInterpolator;ILv/VText;Ll/q1e;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic V(Ll/q1e;)Lcom/p1/mobile/android/app/Dialog;
    .locals 11

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/kec0;->cf:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->M(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    sget v2, Ll/adc0;->Xa:I

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    move-object v9, v2

    .line 35
    check-cast v9, Lv/VText;

    .line 36
    .line 37
    sget v2, Ll/adc0;->Ya:I

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    move-object v6, v1

    .line 44
    check-cast v6, Lv/VDraweeView;

    .line 45
    .line 46
    const-wide/16 v1, 0xc8

    .line 47
    .line 48
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 49
    .line 50
    invoke-static {v1, v2, v3}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    const/16 v8, 0xf

    .line 59
    .line 60
    invoke-virtual {v1, v8}, Lrx/c;->take(I)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    new-instance v2, Ll/y9g0;

    .line 65
    .line 66
    invoke-direct {v2, v0}, Ll/y9g0;-><init>(Lcom/p1/mobile/android/app/Dialog;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v1, v2}, Lrx/c;->takeWhile(Ll/qcj;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    new-instance v7, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 82
    .line 83
    invoke-direct {v7}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 84
    .line 85
    .line 86
    new-instance v3, Ll/z9g0;

    .line 87
    .line 88
    move-object v4, p0

    .line 89
    move-object v10, p1

    .line 90
    invoke-direct/range {v3 .. v10}, Ll/z9g0;-><init>(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;Lrx/c;Lv/VDraweeView;Landroid/view/animation/AccelerateDecelerateInterpolator;ILv/VText;Ll/q1e;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0, v3}, Ll/g1e;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 94
    .line 95
    .line 96
    return-object v0
.end method

.method public final synthetic W(Ll/q1e;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/q1e;->g()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic X(Ll/q1e;)Lcom/p1/mobile/android/app/Dialog;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->v()Lcom/p1/mobile/android/app/Dialog$e;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget v1, Lcom/p1/mobile/putong/core/R$string;->L0:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget v1, Ll/dbc0;->qv:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->c0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->act()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    sget v2, Ll/dbc0;->mp:I

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->x0(Landroid/graphics/drawable/Drawable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sget v1, Lcom/p1/mobile/putong/core/R$string;->B0:I

    .line 44
    .line 45
    new-instance v2, Ll/aag0;

    .line 46
    .line 47
    invoke-direct {v2, p0, p1}, Ll/aag0;-><init>(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;Ll/q1e;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const/4 p1, 0x0

    .line 55
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0
.end method

.method public final Y()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->t:Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/kec0;->ze:I

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->E(Landroid/view/View;)Landroid/util/Pair;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->C(Landroid/view/View;)Landroid/util/Pair;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->t:Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;

    .line 23
    .line 24
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    sget v4, Lcom/p1/mobile/putong/core/R$string;->A0:I

    .line 29
    .line 30
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-virtual {v3, v0}, Lcom/p1/mobile/android/app/Dialog$e;->O(Landroid/view/View;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->v()Lcom/p1/mobile/android/app/Dialog$e;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    sget v3, Lcom/p1/mobile/putong/core/R$string;->k:I

    .line 43
    .line 44
    new-instance v4, Ll/jag0;

    .line 45
    .line 46
    invoke-direct {v4, p0, v1, v2}, Ll/jag0;-><init>(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;Landroid/util/Pair;Landroid/util/Pair;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v3, v4}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->t:Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;

    .line 54
    .line 55
    sget v1, Ll/dbc0;->mp:I

    .line 56
    .line 57
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Dialog$e;->x0(Landroid/graphics/drawable/Drawable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public Z(Lcom/p1/mobile/putong/data/Media;)V
    .locals 4

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->m:Landroid/widget/LinearLayout;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x4

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->n:Lv/VDraweeView;

    .line 13
    .line 14
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->n:Lv/VDraweeView;

    .line 20
    .line 21
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v1}, Lcom/p1/mobile/putong/data/Media;->URL_TO_CACHEKEY(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->n:Lv/VDraweeView;

    .line 33
    .line 34
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 35
    .line 36
    iget v1, v1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 37
    .line 38
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/data/Picture;->calculatedWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_0
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->n:Lv/VDraweeView;

    .line 50
    .line 51
    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->t:Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public b0(Lcom/p1/mobile/putong/data/Media;)V
    .locals 4

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->j:Landroid/widget/LinearLayout;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x4

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->k:Lv/VDraweeView;

    .line 13
    .line 14
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->k:Lv/VDraweeView;

    .line 20
    .line 21
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v1}, Lcom/p1/mobile/putong/data/Media;->URL_TO_CACHEKEY(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->k:Lv/VDraweeView;

    .line 33
    .line 34
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 35
    .line 36
    iget v1, v1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 37
    .line 38
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/data/Picture;->calculatedWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_0
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->k:Lv/VDraweeView;

    .line 50
    .line 51
    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final c0()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->s:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->z0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v0, 0x4

    .line 12
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->h:Landroid/widget/LinearLayout;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    return v0
.end method

.method public final d0()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->s:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->f:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;

    .line 4
    .line 5
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;->a:Z

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->c:Lv/VText;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    const/4 v3, 0x4

    .line 11
    const/4 v4, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->b:Lv/VMaterialEdit_FakeSpinner;

    .line 18
    .line 19
    invoke-virtual {v0, v2}, Lcom/rengwuxian/materialedittext/MaterialEditText;->setForcePrimaryColor(Z)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->b:Lv/VMaterialEdit_FakeSpinner;

    .line 27
    .line 28
    invoke-virtual {v0, v4}, Lcom/rengwuxian/materialedittext/MaterialEditText;->setForcePrimaryColor(Z)V

    .line 29
    .line 30
    .line 31
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->s:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->f:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;

    .line 34
    .line 35
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;->b:Z

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->f:Lv/VText;

    .line 38
    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->e:Lv/VMaterialEdit_FakeSpinner;

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Lcom/rengwuxian/materialedittext/MaterialEditText;->setForcePrimaryColor(Z)V

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_1
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->e:Lv/VMaterialEdit_FakeSpinner;

    .line 54
    .line 55
    invoke-virtual {v0, v4}, Lcom/rengwuxian/materialedittext/MaterialEditText;->setForcePrimaryColor(Z)V

    .line 56
    .line 57
    .line 58
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->s:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->f:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;

    .line 61
    .line 62
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;->c:Z

    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->o:Lv/VText;

    .line 65
    .line 66
    if-eqz v0, :cond_2

    .line 67
    .line 68
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->i:Lv/VFrame;

    .line 72
    .line 73
    sget v1, Ll/dbc0;->Wu:I

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 76
    .line 77
    .line 78
    goto :goto_2

    .line 79
    :cond_2
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->i:Lv/VFrame;

    .line 83
    .line 84
    sget v1, Ll/dbc0;->Vu:I

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 87
    .line 88
    .line 89
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->s:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 90
    .line 91
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;->f:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;

    .line 92
    .line 93
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter$a;->d:Z

    .line 94
    .line 95
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->p:Lv/VText;

    .line 96
    .line 97
    if-eqz v0, :cond_3

    .line 98
    .line 99
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 100
    .line 101
    .line 102
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->l:Lv/VFrame;

    .line 103
    .line 104
    sget v0, Ll/dbc0;->Wu:I

    .line 105
    .line 106
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_3
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 111
    .line 112
    .line 113
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->l:Lv/VFrame;

    .line 114
    .line 115
    sget v0, Ll/dbc0;->Vu:I

    .line 116
    .line 117
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public e0(Z)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    sget v0, Lcom/p1/mobile/putong/core/R$string;->I0:I

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->flow()Ll/q1e;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    new-instance v0, Ll/w9g0;

    .line 40
    .line 41
    invoke-direct {v0, p0}, Ll/w9g0;-><init>(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;)V

    .line 42
    .line 43
    .line 44
    new-instance v1, Ll/x9g0;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/x9g0;-><init>(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;)V

    .line 47
    .line 48
    .line 49
    const/4 p0, 0x2

    .line 50
    new-array p0, p0, [Ll/qcj;

    .line 51
    .line 52
    const/4 v2, 0x0

    .line 53
    aput-object v0, p0, v2

    .line 54
    .line 55
    const/4 v0, 0x1

    .line 56
    aput-object v1, p0, v0

    .line 57
    .line 58
    invoke-virtual {p1, p0}, Ll/q1e;->o([Ll/qcj;)Ll/q1e;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0}, Ll/q1e;->q()V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->y(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->x(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->t:Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/R$string;->E0:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->d:Ll/yy6;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/yy6;->O()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->g:Lv/VText;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->g:Lv/VText;

    .line 27
    .line 28
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->d:Ll/yy6;

    .line 29
    .line 30
    invoke-virtual {v1}, Ll/jf00;->g()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    .line 35
    .line 36
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->graduateActivity:Lcom/p1/mobile/putong/core/data/GraduateActivity;

    .line 37
    .line 38
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GraduateActivity;->name:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->g:Lv/VText;

    .line 44
    .line 45
    new-instance v1, Ll/t9g0;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/t9g0;-><init>(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->e:Lv/VMaterialEdit_FakeSpinner;

    .line 54
    .line 55
    new-instance v1, Ll/cag0;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Ll/cag0;-><init>(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->j:Landroid/widget/LinearLayout;

    .line 64
    .line 65
    new-instance v1, Ll/dag0;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Ll/dag0;-><init>(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->m:Landroid/widget/LinearLayout;

    .line 74
    .line 75
    new-instance v1, Ll/eag0;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Ll/eag0;-><init>(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->k:Lv/VDraweeView;

    .line 84
    .line 85
    new-instance v1, Ll/fag0;

    .line 86
    .line 87
    invoke-direct {v1, p0}, Ll/fag0;-><init>(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->n:Lv/VDraweeView;

    .line 94
    .line 95
    new-instance v1, Ll/gag0;

    .line 96
    .line 97
    invoke-direct {v1, p0}, Ll/gag0;-><init>(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->r:Lv/VButton_FakeShadow;

    .line 104
    .line 105
    new-instance v1, Ll/hag0;

    .line 106
    .line 107
    invoke-direct {v1, p0}, Ll/hag0;-><init>(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->b:Lv/VMaterialEdit_FakeSpinner;

    .line 114
    .line 115
    new-instance v1, Ll/iag0;

    .line 116
    .line 117
    invoke-direct {v1, p0}, Ll/iag0;-><init>(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public x(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/lag0;->b(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public y(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->s:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/StudentInfoPresenter;

    .line 2
    .line 3
    return-void
.end method

.method public final z(Landroid/app/Dialog;IZD)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p2}, Landroid/view/Window;->setGravity(I)V

    .line 6
    .line 7
    .line 8
    sget p2, Ll/c9c0;->w1:I

    .line 9
    .line 10
    invoke-virtual {v0, p2}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    new-instance v1, Landroid/graphics/Rect;

    .line 26
    .line 27
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->t:Lcom/p1/mobile/putong/core/ui/campus/StudentInfoAct;

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0, v1}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 41
    .line 42
    .line 43
    if-eqz p3, :cond_1

    .line 44
    .line 45
    iget p0, v1, Landroid/graphics/Rect;->bottom:I

    .line 46
    .line 47
    iget p3, p2, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 48
    .line 49
    if-eq p0, p3, :cond_0

    .line 50
    .line 51
    iget p3, v1, Landroid/graphics/Rect;->top:I

    .line 52
    .line 53
    sub-int/2addr p0, p3

    .line 54
    iput p0, p1, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    const/16 p0, 0x50

    .line 58
    .line 59
    invoke-virtual {v0, p0}, Landroid/view/Window;->setGravity(I)V

    .line 60
    .line 61
    .line 62
    iget p0, p2, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 63
    .line 64
    iget p3, v1, Landroid/graphics/Rect;->top:I

    .line 65
    .line 66
    sub-int/2addr p0, p3

    .line 67
    iput p0, p1, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 68
    .line 69
    :cond_1
    :goto_0
    iget p0, p2, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 70
    .line 71
    int-to-double p2, p0

    .line 72
    mul-double/2addr p2, p4

    .line 73
    double-to-int p0, p2

    .line 74
    iput p0, p1, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 75
    .line 76
    invoke-virtual {v0, p1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method
