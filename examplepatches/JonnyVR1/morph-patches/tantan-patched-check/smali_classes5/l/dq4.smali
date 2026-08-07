.class public Ll/dq4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/dq4$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/rp4;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Lv/VText_NoTopPadding;

.field public B:Lv/AutoVDraweeView;

.field public C:Lv/VText_NoTopPadding;

.field public D:Lv/VText_NoTopPadding;

.field public E:Lv/VLinear;

.field public E0:Lv/VText_NoTopPadding;

.field public F:Lv/VText_NoTopPadding;

.field public F0:Lv/VLinear;

.field public G:Lv/VText_NoTopPadding;

.field public G0:Lv/VImage;

.field public H:Lv/VText_NoTopPadding;

.field public H0:Lv/VText_NoTopPadding;

.field public I:Lv/VText_NoTopPadding;

.field public I0:Lv/VImage;

.field public J:Lv/VLinear;

.field public J0:Lv/VText_NoTopPadding;

.field public K:Lv/VRelative;

.field public K0:Lcom/p1/mobile/putong/core/ui/verification/CertCenterV2Frag;

.field public L:Landroid/widget/ImageView;

.field public L0:Ll/rp4;

.field public M:Lv/VText_NoTopPadding;

.field public N:Landroid/widget/ImageView;

.field public O:Landroid/widget/ImageView;

.field public P:Lv/VText_NoTopPadding;

.field public Q:Landroid/widget/ImageView;

.field public R:Lv/VText_NoTopPadding;

.field public S:Lv/VText_NoTopPadding;

.field public T:Lv/VLinear;

.field public U:Lv/VImage;

.field public V:Lv/VText_NoTopPadding;

.field public W:Lv/VImage;

.field public X:Lv/VText_NoTopPadding;

.field public Y:Lv/VLinear;

.field public Z:Lv/VImage;

.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Lv/VImage;

.field public c:Lv/VText;

.field public d:Lv/VLinear;

.field public e:Lv/VImage;

.field public f:Lv/VText_NoTopPadding;

.field public g:Lv/VText_NoTopPadding;

.field public h:Lv/VImage;

.field public i:Lcom/facebook/drawee/view/SimpleDraweeView;

.field public j:Lv/VText_NoTopPadding;

.field public k:Lv/VLinear;

.field public k0:Lv/VText_NoTopPadding;

.field public l:Lv/VText;

.field public m:Lv/VLinear;

.field public n:Lv/VLinear;

.field public o:Lv/VText;

.field public p:Lv/VText;

.field public p0:Lv/VImage;

.field public q:Lv/VRecyclerView;

.field public r:Lv/VRecyclerView;

.field public s:Lv/VText;

.field public t:Lv/VText;

.field public u:Lv/VLinear;

.field public v:Lv/AutoVDraweeView;

.field public w:Lv/VText_NoTopPadding;

.field public x:Lv/AutoVDraweeView;

.field public y:Lv/VText_NoTopPadding;

.field public z:Lv/AutoVDraweeView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/verification/CertCenterV2Frag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/dq4;->K0:Lcom/p1/mobile/putong/core/ui/verification/CertCenterV2Frag;

    .line 5
    .line 6
    return-void
.end method

.method private A()V
    .locals 2

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 8
    .line 9
    .line 10
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/16 v1, 0x400

    .line 19
    .line 20
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(Landroid/view/Window;I)V

    .line 21
    .line 22
    .line 23
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const/high16 v0, -0x80000000

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/view/Window;->addFlags(I)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private synthetic F(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dq4;->L0:Ll/rp4;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rp4;->q0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic J(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dq4;->L0:Ll/rp4;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rp4;->o0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic K(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/dq4;->I:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/dq4;->J:Lv/VLinear;

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic L(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/dq4;->I:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/dq4;->J:Lv/VLinear;

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/MyTabTask;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "verification"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->type:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic b(Ll/dq4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dq4;->N(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/dq4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dq4;->F(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/dq4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dq4;->G(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/dq4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dq4;->L(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/dq4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dq4;->I(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/data/MyTabTask;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "verification"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->type:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic j(Ll/dq4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dq4;->K(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Ll/dq4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dq4;->J(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Ll/dq4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dq4;->M(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Ll/dq4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dq4;->H(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic n(Ll/dq4;)Ll/rp4;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dq4;->L0:Ll/rp4;

    return-object p0
.end method

.method private w()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dq4;->D:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    new-instance v1, Ll/vp4;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/vp4;-><init>(Ll/dq4;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/dq4;->T:Lv/VLinear;

    .line 12
    .line 13
    new-instance v1, Ll/wp4;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/wp4;-><init>(Ll/dq4;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/dq4;->F0:Lv/VLinear;

    .line 22
    .line 23
    new-instance v1, Ll/xp4;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/xp4;-><init>(Ll/dq4;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/dq4;->Y:Lv/VLinear;

    .line 32
    .line 33
    new-instance v1, Ll/yp4;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/yp4;-><init>(Ll/dq4;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/dq4;->I:Lv/VText_NoTopPadding;

    .line 42
    .line 43
    new-instance v1, Ll/zp4;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/zp4;-><init>(Ll/dq4;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/dq4;->S:Lv/VText_NoTopPadding;

    .line 52
    .line 53
    new-instance v1, Ll/aq4;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/aq4;-><init>(Ll/dq4;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/dq4;->K:Lv/VRelative;

    .line 62
    .line 63
    new-instance v1, Ll/bq4;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/bq4;-><init>(Ll/dq4;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method private y()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dq4;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/dq4;->a:Lv/navigationbar/VNavigationBar;

    .line 11
    .line 12
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Lr:I

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/dq4;->a:Lv/navigationbar/VNavigationBar;

    .line 26
    .line 27
    const-string v1, "#F8F8F8"

    .line 28
    .line 29
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/dq4;->a:Lv/navigationbar/VNavigationBar;

    .line 37
    .line 38
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-static {p0}, Ll/vnb;->n1(Lcom/p1/mobile/android/app/Act;)I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    const/high16 v1, 0x40c00000    # 6.0f

    .line 47
    .line 48
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    add-int/2addr p0, v1

    .line 53
    invoke-static {v0, p0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 54
    .line 55
    .line 56
    return-void
.end method


# virtual methods
.method public final B()V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "res://"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/dq4;->C0()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, "/"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    sget v1, Ll/dbc0;->h5:I

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    filled-new-array {v0}, [Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const/high16 v1, 0x42280000    # 42.0f

    .line 42
    .line 43
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    const/4 v2, 0x0

    .line 48
    invoke-virtual {p0, v0, v1, v2, v2}, Ll/dq4;->u(Ljava/util/List;III)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/dq4;->o:Lv/VText;

    .line 52
    .line 53
    const-string v1, "\u5b8c\u6210\u8ba4\u8bc1\uff0c\u63d0\u5347\u6bcf\u65e5\u53f3\u6ed1\u4e0a\u9650"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Ll/dq4;->p:Lv/VText;

    .line 59
    .line 60
    const-string v0, "\u6bcf\u5929\u53ef\u989d\u5916\u53d1\u51fa10\u6b21\u559c\u6b22"

    .line 61
    .line 62
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final C()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->i7:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/util/Collection;

    .line 12
    .line 13
    new-instance v1, Ll/cq4;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/cq4;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/p1/mobile/putong/core/data/MyTabTask;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MyTabTask;->avatarGroups:Ljava/util/List;

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lcom/p1/mobile/putong/core/data/TaskAvatarDesc;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/TaskAvatarDesc;->avatars:Ljava/util/List;

    .line 40
    .line 41
    const/4 v1, 0x2

    .line 42
    invoke-static {v0, v1}, Ll/jyb;->k0(Ljava/util/List;I)Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-nez v1, :cond_1

    .line 51
    .line 52
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    const/4 v2, 0x1

    .line 57
    if-le v1, v2, :cond_0

    .line 58
    .line 59
    const/high16 v1, 0x42280000    # 42.0f

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    const/high16 v1, 0x42100000    # 36.0f

    .line 63
    .line 64
    :goto_0
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    const/high16 v2, 0x40000000    # 2.0f

    .line 69
    .line 70
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    const-string v3, "#F7F7F7"

    .line 75
    .line 76
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    invoke-virtual {p0, v0, v1, v2, v3}, Ll/dq4;->u(Ljava/util/List;III)V

    .line 81
    .line 82
    .line 83
    :cond_1
    iget-object v0, p0, Ll/dq4;->o:Lv/VText;

    .line 84
    .line 85
    sget-object v1, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 86
    .line 87
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 88
    .line 89
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 90
    .line 91
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 96
    .line 97
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    if-eqz v2, :cond_2

    .line 102
    .line 103
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 104
    .line 105
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 106
    .line 107
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 112
    .line 113
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getLookingFor()Lcom/p1/mobile/putong/data/LookingFor;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    const-string v3, "female"

    .line 118
    .line 119
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    if-eqz v2, :cond_2

    .line 124
    .line 125
    const-string v2, "\u5979\u4eec"

    .line 126
    .line 127
    goto :goto_1

    .line 128
    :cond_2
    const-string v2, "\u4ed6\u4eec"

    .line 129
    .line 130
    :goto_1
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    const-string v3, "\u5b8c\u6210\u8ba4\u8bc1\uff0c\u7acb\u5373\u6536\u5230%s\u7684\u559c\u6b22"

    .line 135
    .line 136
    invoke-static {v1, v3, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 141
    .line 142
    .line 143
    iget-object p0, p0, Ll/dq4;->p:Lv/VText;

    .line 144
    .line 145
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 146
    .line 147
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 148
    .line 149
    iget-object v0, v0, Ll/dkb;->m7:Ll/vxd0;

    .line 150
    .line 151
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    const-string v2, "%d\u4eba\u9080\u8bf7\u4f60\u8ba4\u8bc1\uff0c\u901a\u8fc7\u540e\u81ea\u52a8\u559c\u6b22\u4f60"

    .line 160
    .line 161
    invoke-static {v1, v2, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 166
    .line 167
    .line 168
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dq4;->K0:Lcom/p1/mobile/putong/core/ui/verification/CertCenterV2Frag;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final E()V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->i7:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/util/Collection;

    .line 12
    .line 13
    new-instance v1, Ll/tp4;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/tp4;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/p1/mobile/putong/core/data/MyTabTask;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/MyTabTask;->extraInfos:Lcom/p1/mobile/putong/core/data/ExtraInfos;

    .line 31
    .line 32
    iget v2, v1, Lcom/p1/mobile/putong/core/data/ExtraInfos;->trialLikedCount:I

    .line 33
    .line 34
    if-lez v2, :cond_1

    .line 35
    .line 36
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ExtraInfos;->trialLikedAvatars:Ljava/util/List;

    .line 37
    .line 38
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-nez v1, :cond_1

    .line 43
    .line 44
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/MyTabTask;->extraInfos:Lcom/p1/mobile/putong/core/data/ExtraInfos;

    .line 45
    .line 46
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ExtraInfos;->trialLikedAvatars:Ljava/util/List;

    .line 47
    .line 48
    const/4 v2, 0x2

    .line 49
    invoke-static {v1, v2}, Ll/jyb;->k0(Ljava/util/List;I)Ljava/util/List;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    const/4 v3, 0x1

    .line 58
    if-le v2, v3, :cond_0

    .line 59
    .line 60
    const/high16 v2, 0x42280000    # 42.0f

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    const/high16 v2, 0x42100000    # 36.0f

    .line 64
    .line 65
    :goto_0
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    const/high16 v3, 0x40000000    # 2.0f

    .line 70
    .line 71
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    const-string v4, "#F7F7F7"

    .line 76
    .line 77
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    invoke-virtual {p0, v1, v2, v3, v4}, Ll/dq4;->u(Ljava/util/List;III)V

    .line 82
    .line 83
    .line 84
    iget-object v1, p0, Ll/dq4;->o:Lv/VText;

    .line 85
    .line 86
    const-string v2, "\u5b8c\u6210\u8ba4\u8bc1\uff0c\u89e3\u9501\u201c\u53ea\u770b\u8ba4\u8bc1\u201d\u529f\u80fd"

    .line 87
    .line 88
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Ll/dq4;->p:Lv/VText;

    .line 92
    .line 93
    sget-object v1, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 94
    .line 95
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MyTabTask;->extraInfos:Lcom/p1/mobile/putong/core/data/ExtraInfos;

    .line 96
    .line 97
    iget v0, v0, Lcom/p1/mobile/putong/core/data/ExtraInfos;->trialLikedCount:I

    .line 98
    .line 99
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    const-string v2, "\u8bd5\u7528\u65f6\u559c\u6b22\u7684%d\u4eba\u624d\u80fd\u770b\u5230\u4f60"

    .line 108
    .line 109
    invoke-static {v1, v2, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    .line 115
    .line 116
    :cond_1
    return-void
.end method

.method public final synthetic G(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dq4;->L0:Ll/rp4;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rp4;->n0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic H(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dq4;->L0:Ll/rp4;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rp4;->p0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic I(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dq4;->L0:Ll/rp4;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rp4;->s0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic M(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/dq4;->s:Lv/VText;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/dq4;->t:Lv/VText;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/dq4;->r:Lv/VRecyclerView;

    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic N(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/dq4;->s:Lv/VText;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/dq4;->t:Lv/VText;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/dq4;->r:Lv/VRecyclerView;

    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final O()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/dq4;->d:Lv/VLinear;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gra;->z()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const-string v2, "\u53ea\u770b\u8ba4\u8bc1"

    .line 12
    .line 13
    const-string v3, "\u9ad8\u9636\u9690\u79c1\u8bbe\u7f6e"

    .line 14
    .line 15
    const-string v4, "\u8ba4\u8bc1\u6807\u8bc6"

    .line 16
    .line 17
    const-string v5, "\u4f18\u5148\u63a8\u8350"

    .line 18
    .line 19
    const-string v6, "\u66f4\u591a\u53f3\u6ed1"

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    sget v0, Ll/dbc0;->F4:I

    .line 24
    .line 25
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0, v6}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sget v6, Ll/dbc0;->H4:I

    .line 34
    .line 35
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v6

    .line 39
    invoke-static {v6, v5}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    sget v6, Ll/dbc0;->J4:I

    .line 44
    .line 45
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    invoke-static {v6, v4}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    sget v6, Ll/dbc0;->L4:I

    .line 54
    .line 55
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object v6

    .line 59
    invoke-static {v6, v3}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    sget v6, Ll/dbc0;->N4:I

    .line 64
    .line 65
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 66
    .line 67
    .line 68
    move-result-object v6

    .line 69
    invoke-static {v6, v2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    filled-new-array {v0, v5, v4, v3, v2}, [Landroid/util/Pair;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    goto :goto_0

    .line 82
    :cond_0
    sget v0, Ll/dbc0;->E4:I

    .line 83
    .line 84
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-static {v0, v6}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    sget v6, Ll/dbc0;->G4:I

    .line 93
    .line 94
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 95
    .line 96
    .line 97
    move-result-object v6

    .line 98
    invoke-static {v6, v5}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 99
    .line 100
    .line 101
    move-result-object v5

    .line 102
    sget v6, Ll/dbc0;->I4:I

    .line 103
    .line 104
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 105
    .line 106
    .line 107
    move-result-object v6

    .line 108
    invoke-static {v6, v4}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 109
    .line 110
    .line 111
    move-result-object v4

    .line 112
    sget v6, Ll/dbc0;->K4:I

    .line 113
    .line 114
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 115
    .line 116
    .line 117
    move-result-object v6

    .line 118
    invoke-static {v6, v3}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    sget v6, Ll/dbc0;->M4:I

    .line 123
    .line 124
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 125
    .line 126
    .line 127
    move-result-object v6

    .line 128
    invoke-static {v6, v2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    filled-new-array {v0, v5, v4, v3, v2}, [Landroid/util/Pair;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    :goto_0
    iget-object v2, p0, Ll/dq4;->q:Lv/VRecyclerView;

    .line 141
    .line 142
    new-instance v3, Ll/dq4$b;

    .line 143
    .line 144
    invoke-direct {v3, p0, v0}, Ll/dq4$b;-><init>(Ll/dq4;Ljava/util/List;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v2, v3}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 148
    .line 149
    .line 150
    iget-object v0, p0, Ll/dq4;->v:Lv/AutoVDraweeView;

    .line 151
    .line 152
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 153
    .line 154
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 155
    .line 156
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 161
    .line 162
    .line 163
    move-result v2

    .line 164
    if-eqz v2, :cond_1

    .line 165
    .line 166
    const-string v2, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IkRHUjRCT0UyT0NOTUVDV0lRS0xBTjRURVJYSlc1VDE0IiwidyI6MjM0LCJoIjoyODgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo2NjE5NTM4MTc4NjM3NzE0NTE1fQ.webp"

    .line 167
    .line 168
    goto :goto_1

    .line 169
    :cond_1
    const-string v2, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IkkzMlpRRFRUUklWSE5WMkhSSlZCS0FIR0FTVzQyWjE0IiwidyI6MjM0LCJoIjoyODgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozOTAyMDQ4Nzk1MzA1ODIyNzM5fQ.webp"

    .line 170
    .line 171
    :goto_1
    invoke-virtual {v0, v2}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    iget-object v0, p0, Ll/dq4;->x:Lv/AutoVDraweeView;

    .line 175
    .line 176
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 177
    .line 178
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 179
    .line 180
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 181
    .line 182
    .line 183
    move-result-object v2

    .line 184
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 185
    .line 186
    .line 187
    move-result v2

    .line 188
    if-eqz v2, :cond_2

    .line 189
    .line 190
    const-string v2, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IllYNVBBM0pFVUtaSEZBUUVaRVdGV0FVUUtEUzJHUzE0IiwidyI6MjM0LCJoIjoyODgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo1MDA1MTY2NTUzNjYzOTQ5MzU4fQ.webp"

    .line 191
    .line 192
    goto :goto_2

    .line 193
    :cond_2
    const-string v2, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IklUUEREUTJUUUhWWVVBT0JZUTY1M0pBNUFLWVRXUjE0IiwidyI6MjM0LCJoIjoyODgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNjYzMzcxNzc5ODA2NDg0MjAzOX0.webp"

    .line 194
    .line 195
    :goto_2
    invoke-virtual {v0, v2}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    iget-object v0, p0, Ll/dq4;->z:Lv/AutoVDraweeView;

    .line 199
    .line 200
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 201
    .line 202
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 203
    .line 204
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 205
    .line 206
    .line 207
    move-result-object v2

    .line 208
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 209
    .line 210
    .line 211
    move-result v2

    .line 212
    if-eqz v2, :cond_3

    .line 213
    .line 214
    const-string v2, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IkJURlY0QTNJUFNPVVQ2TFZRWFE3V05ZRkhaWURINDE0IiwidyI6MjM0LCJoIjoyODgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo1NjYxOTQyOTE1NjQ1NzcyMzAxfQ.webp"

    .line 215
    .line 216
    goto :goto_3

    .line 217
    :cond_3
    const-string v2, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IklNN1VLRlhMQTdLRlBWU0VJSjNBVks0NUVFSkFHVzE0IiwidyI6MjM0LCJoIjoyODgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo3MzY2MjQ4NDM4NTI0MTg3NDQ3fQ.webp"

    .line 218
    .line 219
    :goto_3
    invoke-virtual {v0, v2}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    iget-object v0, p0, Ll/dq4;->B:Lv/AutoVDraweeView;

    .line 223
    .line 224
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 225
    .line 226
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 227
    .line 228
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 229
    .line 230
    .line 231
    move-result-object v2

    .line 232
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 233
    .line 234
    .line 235
    move-result v2

    .line 236
    if-eqz v2, :cond_4

    .line 237
    .line 238
    const-string v2, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IldOTUVDMldXTExFWFBKS0FHTE5FTjVDNE81SU1DSTE0IiwidyI6MjM0LCJoIjoyODgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMjU1NzQ3MTA1ODE3OTMyNzM5OH0.webp"

    .line 239
    .line 240
    goto :goto_4

    .line 241
    :cond_4
    const-string v2, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IjZWSFpJQUIzV0dVUExBRExRRUE1RjJKQkFFRzdLVDE0IiwidyI6MjM0LCJoIjoyODgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMjYwMTU4NDMzMTk4MzY4MTA4fQ.webp"

    .line 242
    .line 243
    :goto_4
    invoke-virtual {v0, v2}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    invoke-static {}, Ll/bnl0;->y0()I

    .line 247
    .line 248
    .line 249
    move-result v0

    .line 250
    const/high16 v2, 0x42800000    # 64.0f

    .line 251
    .line 252
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 253
    .line 254
    .line 255
    move-result v2

    .line 256
    sub-int/2addr v0, v2

    .line 257
    mul-int/lit8 v0, v0, 0x60

    .line 258
    .line 259
    div-int/lit8 v0, v0, 0x4e

    .line 260
    .line 261
    div-int/lit8 v0, v0, 0x4

    .line 262
    .line 263
    iget-object v2, p0, Ll/dq4;->v:Lv/AutoVDraweeView;

    .line 264
    .line 265
    invoke-static {v2, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 266
    .line 267
    .line 268
    iget-object v2, p0, Ll/dq4;->x:Lv/AutoVDraweeView;

    .line 269
    .line 270
    invoke-static {v2, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 271
    .line 272
    .line 273
    iget-object v2, p0, Ll/dq4;->z:Lv/AutoVDraweeView;

    .line 274
    .line 275
    invoke-static {v2, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 276
    .line 277
    .line 278
    iget-object v2, p0, Ll/dq4;->B:Lv/AutoVDraweeView;

    .line 279
    .line 280
    invoke-static {v2, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 281
    .line 282
    .line 283
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 288
    .line 289
    .line 290
    move-result-object v0

    .line 291
    const-string v2, "action"

    .line 292
    .line 293
    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object v0

    .line 297
    const-string v2, "expand_privilege"

    .line 298
    .line 299
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 300
    .line 301
    .line 302
    move-result v0

    .line 303
    if-eqz v0, :cond_5

    .line 304
    .line 305
    iget-object v0, p0, Ll/dq4;->I:Lv/VText_NoTopPadding;

    .line 306
    .line 307
    const/4 v2, 0x0

    .line 308
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 309
    .line 310
    .line 311
    iget-object p0, p0, Ll/dq4;->J:Lv/VLinear;

    .line 312
    .line 313
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 314
    .line 315
    .line 316
    :cond_5
    return-void
.end method

.method public P(Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V
    .locals 7

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/dkb;->ma()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-eqz v0, :cond_6

    .line 18
    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    goto/16 :goto_4

    .line 22
    .line 23
    :cond_0
    const-string v2, "verified"

    .line 24
    .line 25
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    iget-object v3, p0, Ll/dq4;->f:Lv/VText_NoTopPadding;

    .line 30
    .line 31
    const/4 v4, 0x1

    .line 32
    const/4 v5, 0x0

    .line 33
    if-eqz v2, :cond_2

    .line 34
    .line 35
    const-string p1, "\u5934\u50cf\u672c\u4eba\u8ba4\u8bc1\u901a\u8fc7"

    .line 36
    .line 37
    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/dq4;->g:Lv/VText_NoTopPadding;

    .line 41
    .line 42
    const-string v1, "\u8ba4\u8bc1\u901a\u8fc7\uff0c\u6743\u76ca\u751f\u6548\u4e2d"

    .line 43
    .line 44
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/dq4;->d:Lv/VLinear;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/dq4;->C0()Landroid/content/Context;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    sget v2, Ll/dbc0;->P4:I

    .line 54
    .line 55
    invoke-static {v1, v2}, Ll/tu0;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Ll/dq4;->h:Lv/VImage;

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/dq4;->C0()Landroid/content/Context;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    sget v2, Ll/dbc0;->U4:I

    .line 69
    .line 70
    invoke-static {v1, v2}, Ll/tu0;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {p1, v1}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Ll/dq4;->j:Lv/VText_NoTopPadding;

    .line 78
    .line 79
    const-string v1, "\u5934\u50cf\u672c\u4eba"

    .line 80
    .line 81
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Ll/dq4;->j:Lv/VText_NoTopPadding;

    .line 85
    .line 86
    invoke-virtual {p0}, Ll/dq4;->C0()Landroid/content/Context;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    sget v2, Ll/dbc0;->B4:I

    .line 91
    .line 92
    invoke-static {v1, v2}, Ll/tu0;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {p1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Ll/dq4;->j:Lv/VText_NoTopPadding;

    .line 100
    .line 101
    invoke-static {}, Ll/gra;->z()Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-eqz v1, :cond_1

    .line 106
    .line 107
    sget v1, Ll/dbc0;->D4:I

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_1
    sget v1, Ll/dbc0;->C4:I

    .line 111
    .line 112
    :goto_0
    invoke-virtual {p1, v1, v5, v5, v5}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 113
    .line 114
    .line 115
    iget-object p1, p0, Ll/dq4;->j:Lv/VText_NoTopPadding;

    .line 116
    .line 117
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 118
    .line 119
    .line 120
    iget-object p1, p0, Ll/dq4;->k:Lv/VLinear;

    .line 121
    .line 122
    invoke-static {p1, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 123
    .line 124
    .line 125
    iget-object p1, p0, Ll/dq4;->E:Lv/VLinear;

    .line 126
    .line 127
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 128
    .line 129
    .line 130
    iget-object p0, p0, Ll/dq4;->i:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 131
    .line 132
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profile480()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageURI(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    return-void

    .line 148
    :cond_2
    const-string v2, "\u5934\u50cf\u672c\u4eba\u8ba4\u8bc1"

    .line 149
    .line 150
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 151
    .line 152
    .line 153
    iget-object v2, p0, Ll/dq4;->g:Lv/VText_NoTopPadding;

    .line 154
    .line 155
    const-string v3, "\u4f7f\u7528\u4e94\u5b98\u6e05\u6670\u6b63\u9762\u7167\u5b8c\u6210\u8ba4\u8bc1"

    .line 156
    .line 157
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 158
    .line 159
    .line 160
    iget-object v2, p0, Ll/dq4;->d:Lv/VLinear;

    .line 161
    .line 162
    invoke-virtual {p0}, Ll/dq4;->C0()Landroid/content/Context;

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    sget v6, Ll/dbc0;->i5:I

    .line 167
    .line 168
    invoke-static {v3, v6}, Ll/tu0;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 169
    .line 170
    .line 171
    move-result-object v3

    .line 172
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 173
    .line 174
    .line 175
    iget-object v2, p0, Ll/dq4;->h:Lv/VImage;

    .line 176
    .line 177
    invoke-virtual {p0}, Ll/dq4;->C0()Landroid/content/Context;

    .line 178
    .line 179
    .line 180
    move-result-object v3

    .line 181
    sget v6, Ll/dbc0;->T4:I

    .line 182
    .line 183
    invoke-static {v3, v6}, Ll/tu0;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 184
    .line 185
    .line 186
    move-result-object v3

    .line 187
    invoke-virtual {v2, v3}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFakeUser()Z

    .line 191
    .line 192
    .line 193
    move-result v2

    .line 194
    if-nez v2, :cond_4

    .line 195
    .line 196
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    const-string v2, "LOW_FACE_MARK"

    .line 201
    .line 202
    invoke-static {v2}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 203
    .line 204
    .line 205
    move-result-object v2

    .line 206
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/data/Picture;->isLabelJudge(Lcom/p1/mobile/putong/data/MediaLabel;)Z

    .line 207
    .line 208
    .line 209
    move-result v0

    .line 210
    if-eqz v0, :cond_3

    .line 211
    .line 212
    goto :goto_1

    .line 213
    :cond_3
    iget-object v0, p0, Ll/dq4;->j:Lv/VText_NoTopPadding;

    .line 214
    .line 215
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 216
    .line 217
    .line 218
    goto :goto_3

    .line 219
    :cond_4
    :goto_1
    iget-object v0, p0, Ll/dq4;->j:Lv/VText_NoTopPadding;

    .line 220
    .line 221
    const-string v2, "\u8ba4\u8bc1\u6210\u529f\u7387\u4f4e"

    .line 222
    .line 223
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 224
    .line 225
    .line 226
    iget-object v0, p0, Ll/dq4;->j:Lv/VText_NoTopPadding;

    .line 227
    .line 228
    invoke-virtual {p0}, Ll/dq4;->C0()Landroid/content/Context;

    .line 229
    .line 230
    .line 231
    move-result-object v2

    .line 232
    sget v3, Ll/dbc0;->A4:I

    .line 233
    .line 234
    invoke-static {v2, v3}, Ll/tu0;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 235
    .line 236
    .line 237
    move-result-object v2

    .line 238
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 239
    .line 240
    .line 241
    iget-object v0, p0, Ll/dq4;->j:Lv/VText_NoTopPadding;

    .line 242
    .line 243
    invoke-static {}, Ll/gra;->z()Z

    .line 244
    .line 245
    .line 246
    move-result v2

    .line 247
    if-eqz v2, :cond_5

    .line 248
    .line 249
    sget v2, Ll/dbc0;->B0:I

    .line 250
    .line 251
    goto :goto_2

    .line 252
    :cond_5
    sget v2, Ll/dbc0;->A0:I

    .line 253
    .line 254
    :goto_2
    invoke-virtual {v0, v2, v5, v5, v5}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 255
    .line 256
    .line 257
    iget-object v0, p0, Ll/dq4;->j:Lv/VText_NoTopPadding;

    .line 258
    .line 259
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 260
    .line 261
    .line 262
    :goto_3
    iget-object v0, p0, Ll/dq4;->k:Lv/VLinear;

    .line 263
    .line 264
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 265
    .line 266
    .line 267
    iget-object v0, p0, Ll/dq4;->E:Lv/VLinear;

    .line 268
    .line 269
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 270
    .line 271
    .line 272
    iget-object v0, p0, Ll/dq4;->i:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 273
    .line 274
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 275
    .line 276
    .line 277
    move-result-object v1

    .line 278
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 279
    .line 280
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageURI(Ljava/lang/String;)V

    .line 281
    .line 282
    .line 283
    invoke-virtual {p0, p1}, Ll/dq4;->Q(Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 284
    .line 285
    .line 286
    :cond_6
    :goto_4
    return-void
.end method

.method public final Q(Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->ma()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "rejected"

    .line 10
    .line 11
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Ll/dq4;->D:Lv/VText_NoTopPadding;

    .line 18
    .line 19
    const-string v0, "\u8ba4\u8bc1\u5931\u8d25\uff0c\u91cd\u65b0\u5c1d\u8bd5"

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/dq4;->D:Lv/VText_NoTopPadding;

    .line 25
    .line 26
    const-string p1, "#FFFFFF"

    .line 27
    .line 28
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    const-string v1, "pending"

    .line 37
    .line 38
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    iget-object p1, p0, Ll/dq4;->D:Lv/VText_NoTopPadding;

    .line 45
    .line 46
    const-string v0, "\u5ba1\u6838\u4e2d..."

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Ll/dq4;->D:Lv/VText_NoTopPadding;

    .line 52
    .line 53
    const-string p1, "#66FFFFFF"

    .line 54
    .line 55
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFakeUser()Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    const-string v1, "#FFFFFFFF"

    .line 68
    .line 69
    if-nez p1, :cond_3

    .line 70
    .line 71
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    const-string v0, "LOW_FACE_MARK"

    .line 76
    .line 77
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Picture;->isLabelJudge(Lcom/p1/mobile/putong/data/MediaLabel;)Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-eqz p1, :cond_2

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_2
    iget-object p1, p0, Ll/dq4;->D:Lv/VText_NoTopPadding;

    .line 89
    .line 90
    const-string v0, "\u7acb\u5373\u8ba4\u8bc1\uff0c\u83b7\u5f97\u7279\u6743"

    .line 91
    .line 92
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    .line 94
    .line 95
    iget-object p0, p0, Ll/dq4;->D:Lv/VText_NoTopPadding;

    .line 96
    .line 97
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_3
    :goto_0
    iget-object p1, p0, Ll/dq4;->D:Lv/VText_NoTopPadding;

    .line 106
    .line 107
    const-string v0, "\u66f4\u6362\u7167\u7247\uff0c\u5b8c\u6210\u8ba4\u8bc1"

    .line 108
    .line 109
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 110
    .line 111
    .line 112
    iget-object p0, p0, Ll/dq4;->D:Lv/VText_NoTopPadding;

    .line 113
    .line 114
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public R(III)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dq4;->F:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    const-string v1, "\u6b21"

    .line 4
    .line 5
    invoke-virtual {p0, p1, v1}, Ll/dq4;->s(ILjava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/dq4;->G:Lv/VText_NoTopPadding;

    .line 13
    .line 14
    const-string v0, "\u4eba"

    .line 15
    .line 16
    invoke-virtual {p0, p2, v0}, Ll/dq4;->s(ILjava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/dq4;->H:Lv/VText_NoTopPadding;

    .line 24
    .line 25
    invoke-virtual {p0, p3, v0}, Ll/dq4;->s(ILjava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public S(Lcom/p1/mobile/putong/data/StudentVerificationStatus;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V
    .locals 7

    .line 1
    const-string v0, "verified"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const-string v2, "\u5ba1\u6838\u4e2d"

    .line 8
    .line 9
    const-string v3, "pending"

    .line 10
    .line 11
    const-string v4, "#66000000"

    .line 12
    .line 13
    const/4 v5, 0x1

    .line 14
    const/4 v6, 0x0

    .line 15
    if-eqz v1, :cond_2

    .line 16
    .line 17
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object p1, p0, Ll/dq4;->E0:Lv/VText_NoTopPadding;

    .line 24
    .line 25
    const-string p2, "\u5df2\u8ba4\u8bc1"

    .line 26
    .line 27
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/dq4;->E0:Lv/VText_NoTopPadding;

    .line 31
    .line 32
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ll/dq4;->p0:Lv/VImage;

    .line 40
    .line 41
    invoke-static {p1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/dq4;->E0:Lv/VText_NoTopPadding;

    .line 45
    .line 46
    invoke-static {p0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    invoke-static {p2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    iget-object p2, p0, Ll/dq4;->E0:Lv/VText_NoTopPadding;

    .line 55
    .line 56
    if-eqz p1, :cond_1

    .line 57
    .line 58
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Ll/dq4;->E0:Lv/VText_NoTopPadding;

    .line 62
    .line 63
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Ll/dq4;->p0:Lv/VImage;

    .line 71
    .line 72
    invoke-static {p1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Ll/dq4;->E0:Lv/VText_NoTopPadding;

    .line 76
    .line 77
    invoke-static {p0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_1
    const-string p1, "\u5f85\u6fc0\u6d3b"

    .line 82
    .line 83
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Ll/dq4;->E0:Lv/VText_NoTopPadding;

    .line 87
    .line 88
    const-string p2, "#FE7E1D"

    .line 89
    .line 90
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    move-result p2

    .line 94
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Ll/dq4;->p0:Lv/VImage;

    .line 98
    .line 99
    invoke-static {p1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 100
    .line 101
    .line 102
    iget-object p0, p0, Ll/dq4;->E0:Lv/VText_NoTopPadding;

    .line 103
    .line 104
    invoke-static {p0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_2
    invoke-static {p1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 109
    .line 110
    .line 111
    move-result p2

    .line 112
    if-eqz p2, :cond_3

    .line 113
    .line 114
    iget-object p1, p0, Ll/dq4;->E0:Lv/VText_NoTopPadding;

    .line 115
    .line 116
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 117
    .line 118
    .line 119
    iget-object p1, p0, Ll/dq4;->E0:Lv/VText_NoTopPadding;

    .line 120
    .line 121
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 122
    .line 123
    .line 124
    move-result p2

    .line 125
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 126
    .line 127
    .line 128
    iget-object p1, p0, Ll/dq4;->p0:Lv/VImage;

    .line 129
    .line 130
    invoke-static {p1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 131
    .line 132
    .line 133
    iget-object p0, p0, Ll/dq4;->E0:Lv/VText_NoTopPadding;

    .line 134
    .line 135
    invoke-static {p0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :cond_3
    const-string p2, "rejected"

    .line 140
    .line 141
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 142
    .line 143
    .line 144
    move-result p2

    .line 145
    if-eqz p2, :cond_4

    .line 146
    .line 147
    iget-object p1, p0, Ll/dq4;->E0:Lv/VText_NoTopPadding;

    .line 148
    .line 149
    const-string p2, "\u8ba4\u8bc1\u5931\u8d25"

    .line 150
    .line 151
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 152
    .line 153
    .line 154
    iget-object p1, p0, Ll/dq4;->E0:Lv/VText_NoTopPadding;

    .line 155
    .line 156
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    move-result p2

    .line 160
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 161
    .line 162
    .line 163
    iget-object p1, p0, Ll/dq4;->p0:Lv/VImage;

    .line 164
    .line 165
    invoke-static {p1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 166
    .line 167
    .line 168
    iget-object p0, p0, Ll/dq4;->E0:Lv/VText_NoTopPadding;

    .line 169
    .line 170
    invoke-static {p0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 171
    .line 172
    .line 173
    return-void

    .line 174
    :cond_4
    const-string p2, "invalid"

    .line 175
    .line 176
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 177
    .line 178
    .line 179
    move-result p1

    .line 180
    if-eqz p1, :cond_5

    .line 181
    .line 182
    iget-object p1, p0, Ll/dq4;->E0:Lv/VText_NoTopPadding;

    .line 183
    .line 184
    const-string p2, "\u5df2\u5931\u6548"

    .line 185
    .line 186
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 187
    .line 188
    .line 189
    iget-object p1, p0, Ll/dq4;->E0:Lv/VText_NoTopPadding;

    .line 190
    .line 191
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 192
    .line 193
    .line 194
    move-result p2

    .line 195
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 196
    .line 197
    .line 198
    iget-object p1, p0, Ll/dq4;->p0:Lv/VImage;

    .line 199
    .line 200
    invoke-static {p1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 201
    .line 202
    .line 203
    iget-object p0, p0, Ll/dq4;->E0:Lv/VText_NoTopPadding;

    .line 204
    .line 205
    invoke-static {p0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 206
    .line 207
    .line 208
    return-void

    .line 209
    :cond_5
    iget-object p1, p0, Ll/dq4;->p0:Lv/VImage;

    .line 210
    .line 211
    invoke-static {p1, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 212
    .line 213
    .line 214
    iget-object p0, p0, Ll/dq4;->E0:Lv/VText_NoTopPadding;

    .line 215
    .line 216
    invoke-static {p0, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 217
    .line 218
    .line 219
    return-void
.end method

.method public T(Lcom/p1/mobile/putong/data/StudentVerificationStatus;Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V
    .locals 7

    .line 1
    const-string v0, "verified"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const-string v2, "\u5ba1\u6838\u4e2d"

    .line 8
    .line 9
    const-string v3, "pending"

    .line 10
    .line 11
    const-string v4, "#66000000"

    .line 12
    .line 13
    const/4 v5, 0x1

    .line 14
    const/4 v6, 0x0

    .line 15
    if-eqz v1, :cond_2

    .line 16
    .line 17
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object p1, p0, Ll/dq4;->X:Lv/VText_NoTopPadding;

    .line 24
    .line 25
    const-string p2, "\u5df2\u8ba4\u8bc1"

    .line 26
    .line 27
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/dq4;->X:Lv/VText_NoTopPadding;

    .line 31
    .line 32
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ll/dq4;->W:Lv/VImage;

    .line 40
    .line 41
    invoke-static {p1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/dq4;->X:Lv/VText_NoTopPadding;

    .line 45
    .line 46
    invoke-static {p0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    invoke-static {p2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    iget-object p2, p0, Ll/dq4;->X:Lv/VText_NoTopPadding;

    .line 55
    .line 56
    if-eqz p1, :cond_1

    .line 57
    .line 58
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Ll/dq4;->X:Lv/VText_NoTopPadding;

    .line 62
    .line 63
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Ll/dq4;->W:Lv/VImage;

    .line 71
    .line 72
    invoke-static {p1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Ll/dq4;->X:Lv/VText_NoTopPadding;

    .line 76
    .line 77
    invoke-static {p0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_1
    const-string p1, "\u5f85\u6fc0\u6d3b"

    .line 82
    .line 83
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Ll/dq4;->X:Lv/VText_NoTopPadding;

    .line 87
    .line 88
    const-string p2, "#FF700A"

    .line 89
    .line 90
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    move-result p2

    .line 94
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Ll/dq4;->W:Lv/VImage;

    .line 98
    .line 99
    invoke-static {p1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 100
    .line 101
    .line 102
    iget-object p0, p0, Ll/dq4;->X:Lv/VText_NoTopPadding;

    .line 103
    .line 104
    invoke-static {p0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_2
    const-string p2, "rejected"

    .line 109
    .line 110
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 111
    .line 112
    .line 113
    move-result p2

    .line 114
    if-eqz p2, :cond_3

    .line 115
    .line 116
    iget-object p1, p0, Ll/dq4;->X:Lv/VText_NoTopPadding;

    .line 117
    .line 118
    const-string p2, "\u8ba4\u8bc1\u5931\u8d25"

    .line 119
    .line 120
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 121
    .line 122
    .line 123
    iget-object p1, p0, Ll/dq4;->X:Lv/VText_NoTopPadding;

    .line 124
    .line 125
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 126
    .line 127
    .line 128
    move-result p2

    .line 129
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 130
    .line 131
    .line 132
    iget-object p1, p0, Ll/dq4;->W:Lv/VImage;

    .line 133
    .line 134
    invoke-static {p1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 135
    .line 136
    .line 137
    iget-object p0, p0, Ll/dq4;->X:Lv/VText_NoTopPadding;

    .line 138
    .line 139
    invoke-static {p0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 140
    .line 141
    .line 142
    return-void

    .line 143
    :cond_3
    invoke-static {p1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 144
    .line 145
    .line 146
    move-result p2

    .line 147
    if-eqz p2, :cond_4

    .line 148
    .line 149
    iget-object p1, p0, Ll/dq4;->X:Lv/VText_NoTopPadding;

    .line 150
    .line 151
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 152
    .line 153
    .line 154
    iget-object p1, p0, Ll/dq4;->X:Lv/VText_NoTopPadding;

    .line 155
    .line 156
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    move-result p2

    .line 160
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 161
    .line 162
    .line 163
    iget-object p1, p0, Ll/dq4;->W:Lv/VImage;

    .line 164
    .line 165
    invoke-static {p1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 166
    .line 167
    .line 168
    iget-object p0, p0, Ll/dq4;->X:Lv/VText_NoTopPadding;

    .line 169
    .line 170
    invoke-static {p0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 171
    .line 172
    .line 173
    return-void

    .line 174
    :cond_4
    const-string p2, "invalid"

    .line 175
    .line 176
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 177
    .line 178
    .line 179
    move-result p1

    .line 180
    if-eqz p1, :cond_5

    .line 181
    .line 182
    iget-object p1, p0, Ll/dq4;->X:Lv/VText_NoTopPadding;

    .line 183
    .line 184
    const-string p2, "\u5df2\u5931\u6548"

    .line 185
    .line 186
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 187
    .line 188
    .line 189
    iget-object p1, p0, Ll/dq4;->X:Lv/VText_NoTopPadding;

    .line 190
    .line 191
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 192
    .line 193
    .line 194
    move-result p2

    .line 195
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 196
    .line 197
    .line 198
    iget-object p1, p0, Ll/dq4;->W:Lv/VImage;

    .line 199
    .line 200
    invoke-static {p1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 201
    .line 202
    .line 203
    iget-object p0, p0, Ll/dq4;->X:Lv/VText_NoTopPadding;

    .line 204
    .line 205
    invoke-static {p0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 206
    .line 207
    .line 208
    return-void

    .line 209
    :cond_5
    iget-object p1, p0, Ll/dq4;->W:Lv/VImage;

    .line 210
    .line 211
    invoke-static {p1, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 212
    .line 213
    .line 214
    iget-object p0, p0, Ll/dq4;->X:Lv/VText_NoTopPadding;

    .line 215
    .line 216
    invoke-static {p0, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 217
    .line 218
    .line 219
    return-void
.end method

.method public U(Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V
    .locals 3

    .line 1
    const-string v0, "verified"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/dq4;->J0:Lv/VText_NoTopPadding;

    .line 12
    .line 13
    const-string v0, "\u5df2\u8ba4\u8bc1"

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/dq4;->I0:Lv/VImage;

    .line 19
    .line 20
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/dq4;->J0:Lv/VText_NoTopPadding;

    .line 24
    .line 25
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    const-string v0, "rejected"

    .line 30
    .line 31
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    iget-object p1, p0, Ll/dq4;->J0:Lv/VText_NoTopPadding;

    .line 38
    .line 39
    const-string v0, "\u8ba4\u8bc1\u5931\u8d25"

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Ll/dq4;->I0:Lv/VImage;

    .line 45
    .line 46
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Ll/dq4;->J0:Lv/VText_NoTopPadding;

    .line 50
    .line 51
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    const-string v0, "pending"

    .line 56
    .line 57
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    iget-object p1, p0, Ll/dq4;->J0:Lv/VText_NoTopPadding;

    .line 64
    .line 65
    const-string v0, "\u5ba1\u6838\u4e2d"

    .line 66
    .line 67
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Ll/dq4;->I0:Lv/VImage;

    .line 71
    .line 72
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Ll/dq4;->J0:Lv/VText_NoTopPadding;

    .line 76
    .line 77
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_2
    const-string v0, "invalid"

    .line 82
    .line 83
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    if-eqz p1, :cond_3

    .line 88
    .line 89
    iget-object p1, p0, Ll/dq4;->J0:Lv/VText_NoTopPadding;

    .line 90
    .line 91
    const-string v0, "\u5df2\u5931\u6548"

    .line 92
    .line 93
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Ll/dq4;->I0:Lv/VImage;

    .line 97
    .line 98
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Ll/dq4;->J0:Lv/VText_NoTopPadding;

    .line 102
    .line 103
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_3
    iget-object p1, p0, Ll/dq4;->I0:Lv/VImage;

    .line 108
    .line 109
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 110
    .line 111
    .line 112
    iget-object p0, p0, Ll/dq4;->J0:Lv/VText_NoTopPadding;

    .line 113
    .line 114
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public V(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dq4;->F0:Lv/VLinear;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/rp4;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dq4;->q(Ll/rp4;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/dq4;->p(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public p(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/fq4;->b(Ll/dq4;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public q(Ll/rp4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dq4;->L0:Ll/rp4;

    .line 2
    .line 3
    return-void
.end method

.method public r()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/dq4;->A()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/dq4;->y()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/dq4;->O()V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Ll/dq4;->w()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/dq4;->x()V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/gra;->z()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/dq4;->z()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public final s(ILjava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    const/16 p0, 0x2710

    .line 2
    .line 3
    if-lt p1, p0, :cond_0

    .line 4
    .line 5
    int-to-double p0, p1

    .line 6
    const-wide v0, 0x408f400000000000L    # 1000.0

    .line 7
    .line 8
    .line 9
    .line 10
    .line 11
    div-double/2addr p0, v0

    .line 12
    invoke-static {p0, p1}, Ljava/lang/Math;->round(D)J

    .line 13
    .line 14
    .line 15
    move-result-wide p0

    .line 16
    long-to-double p0, p0

    .line 17
    const-wide/high16 v0, 0x4024000000000000L    # 10.0

    .line 18
    .line 19
    div-double/2addr p0, v0

    .line 20
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    filled-new-array {p0, p2}, [Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string p1, "%.1fw%s"

    .line 29
    .line 30
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    filled-new-array {p0, p2}, [Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string p1, "%d%s"

    .line 44
    .line 45
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0
.end method

.method public final u(Ljava/util/List;III)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;III)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dq4;->n:Lv/VLinear;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x1

    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Ljava/lang/String;

    .line 19
    .line 20
    const-string v2, "res"

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    move v8, v0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    move v8, p4

    .line 31
    :goto_0
    iget-object v4, p0, Ll/dq4;->n:Lv/VLinear;

    .line 32
    .line 33
    sget v6, Ll/qa00;->j:I

    .line 34
    .line 35
    move-object v2, p0

    .line 36
    move-object v3, p1

    .line 37
    move v5, p2

    .line 38
    move v7, p3

    .line 39
    invoke-virtual/range {v2 .. v8}, Ll/dq4;->v(Ljava/util/List;Landroid/view/ViewGroup;IIII)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final v(Ljava/util/List;Landroid/view/ViewGroup;IIII)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/view/ViewGroup;",
            "IIII)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/String;

    .line 16
    .line 17
    new-instance v1, Lv/VDraweeView;

    .line 18
    .line 19
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-direct {v1, v2}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 24
    .line 25
    .line 26
    new-instance v2, Lcom/facebook/drawee/generic/RoundingParams;

    .line 27
    .line 28
    invoke-direct {v2}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 29
    .line 30
    .line 31
    const/4 v3, 0x1

    .line 32
    invoke-virtual {v2, v3}, Lcom/facebook/drawee/generic/RoundingParams;->v(Z)Lcom/facebook/drawee/generic/RoundingParams;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    check-cast v3, Ll/wlj;

    .line 40
    .line 41
    invoke-virtual {v3, v2}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 42
    .line 43
    .line 44
    if-eqz p6, :cond_0

    .line 45
    .line 46
    new-instance v2, Landroid/graphics/drawable/ShapeDrawable;

    .line 47
    .line 48
    new-instance v3, Landroid/graphics/drawable/shapes/OvalShape;

    .line 49
    .line 50
    invoke-direct {v3}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-direct {v2, v3}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-virtual {v3, p6}, Landroid/graphics/Paint;->setColor(I)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1, p5, p5, p5, p5}, Landroid/view/View;->setPadding(IIII)V

    .line 67
    .line 68
    .line 69
    :cond_0
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 70
    .line 71
    invoke-direct {v2, p3, p3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    if-lez v3, :cond_1

    .line 79
    .line 80
    neg-int v3, p4

    .line 81
    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 82
    .line 83
    :cond_1
    invoke-virtual {p2, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 84
    .line 85
    .line 86
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 87
    .line 88
    invoke-virtual {v2, v1, v0, p3, p3}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_2
    return-void
.end method

.method public final x()V
    .locals 8

    .line 1
    invoke-static {}, Ll/gra;->p2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_0

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Ll/dq4;->r:Lv/VRecyclerView;

    .line 10
    .line 11
    new-instance v1, Ll/dq4$b;

    .line 12
    .line 13
    sget v2, Ll/dbc0;->E4:I

    .line 14
    .line 15
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const-string v3, "\u66f4\u591a\u53f3\u6ed1"

    .line 20
    .line 21
    invoke-static {v2, v3}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    sget v3, Ll/dbc0;->G4:I

    .line 26
    .line 27
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    const-string v4, "\u4f18\u5148\u63a8\u8350"

    .line 32
    .line 33
    invoke-static {v3, v4}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    sget v4, Ll/dbc0;->I4:I

    .line 38
    .line 39
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    const-string v5, "\u8ba4\u8bc1\u6807\u8bc6"

    .line 44
    .line 45
    invoke-static {v4, v5}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    sget v5, Ll/dbc0;->K4:I

    .line 50
    .line 51
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    const-string v6, "\u9ad8\u9636\u9690\u79c1\u8bbe\u7f6e"

    .line 56
    .line 57
    invoke-static {v5, v6}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    sget v6, Ll/dbc0;->M4:I

    .line 62
    .line 63
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object v6

    .line 67
    const-string v7, "\u53ea\u770b\u8ba4\u8bc1"

    .line 68
    .line 69
    invoke-static {v6, v7}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 70
    .line 71
    .line 72
    move-result-object v6

    .line 73
    filled-new-array {v2, v3, v4, v5, v6}, [Landroid/util/Pair;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-direct {v1, p0, v2}, Ll/dq4$b;-><init>(Ll/dq4;Ljava/util/List;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Ll/dq4;->s:Lv/VText;

    .line 88
    .line 89
    new-instance v1, Ll/sp4;

    .line 90
    .line 91
    invoke-direct {v1, p0}, Ll/sp4;-><init>(Ll/dq4;)V

    .line 92
    .line 93
    .line 94
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Ll/dq4;->t:Lv/VText;

    .line 98
    .line 99
    new-instance v1, Ll/up4;

    .line 100
    .line 101
    invoke-direct {v1, p0}, Ll/up4;-><init>(Ll/dq4;)V

    .line 102
    .line 103
    .line 104
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 105
    .line 106
    .line 107
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    const-string v1, "tip_type"

    .line 116
    .line 117
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    if-nez v1, :cond_4

    .line 126
    .line 127
    iget-object v1, p0, Ll/dq4;->u:Lv/VLinear;

    .line 128
    .line 129
    const/high16 v2, 0x41d00000    # 26.0f

    .line 130
    .line 131
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 132
    .line 133
    .line 134
    move-result v2

    .line 135
    invoke-static {v1, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 136
    .line 137
    .line 138
    iget-object v1, p0, Ll/dq4;->m:Lv/VLinear;

    .line 139
    .line 140
    const/4 v2, 0x1

    .line 141
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 142
    .line 143
    .line 144
    iget-object v1, p0, Ll/dq4;->s:Lv/VText;

    .line 145
    .line 146
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 147
    .line 148
    .line 149
    iget-object v1, p0, Ll/dq4;->q:Lv/VRecyclerView;

    .line 150
    .line 151
    const/4 v3, 0x0

    .line 152
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 153
    .line 154
    .line 155
    iget-object v1, p0, Ll/dq4;->l:Lv/VText;

    .line 156
    .line 157
    const-string v3, "\u5b8c\u6210\u8ba4\u8bc1\u540e\uff0c\u89e3\u9501\u591a\u9879\u6743\u76ca"

    .line 158
    .line 159
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 160
    .line 161
    .line 162
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;->valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/IdentifyView$TipType;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    sget-object v1, Ll/dq4$a;->a:[I

    .line 167
    .line 168
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    aget v0, v1, v0

    .line 173
    .line 174
    if-eq v0, v2, :cond_3

    .line 175
    .line 176
    const/4 v1, 0x2

    .line 177
    if-eq v0, v1, :cond_2

    .line 178
    .line 179
    const/4 v1, 0x3

    .line 180
    if-eq v0, v1, :cond_1

    .line 181
    .line 182
    goto :goto_0

    .line 183
    :cond_1
    invoke-virtual {p0}, Ll/dq4;->B()V

    .line 184
    .line 185
    .line 186
    return-void

    .line 187
    :cond_2
    invoke-virtual {p0}, Ll/dq4;->E()V

    .line 188
    .line 189
    .line 190
    return-void

    .line 191
    :cond_3
    invoke-virtual {p0}, Ll/dq4;->C()V

    .line 192
    .line 193
    .line 194
    :cond_4
    :goto_0
    return-void
.end method

.method public final z()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dq4;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    sget v1, Ll/dbc0;->Jh:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/dq4;->c:Lv/VText;

    .line 9
    .line 10
    const-string v1, "#66000000"

    .line 11
    .line 12
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/dq4;->e:Lv/VImage;

    .line 20
    .line 21
    sget v1, Ll/dbc0;->z4:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/dq4;->w:Lv/VText_NoTopPadding;

    .line 27
    .line 28
    sget v1, Ll/dbc0;->mi:I

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    invoke-virtual {v0, v1, v2, v2, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/dq4;->y:Lv/VText_NoTopPadding;

    .line 35
    .line 36
    sget v1, Ll/dbc0;->mi:I

    .line 37
    .line 38
    invoke-virtual {v0, v1, v2, v2, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/dq4;->A:Lv/VText_NoTopPadding;

    .line 42
    .line 43
    sget v1, Ll/dbc0;->C0:I

    .line 44
    .line 45
    invoke-virtual {v0, v1, v2, v2, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/dq4;->C:Lv/VText_NoTopPadding;

    .line 49
    .line 50
    sget v1, Ll/dbc0;->C0:I

    .line 51
    .line 52
    invoke-virtual {v0, v1, v2, v2, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/dq4;->D:Lv/VText_NoTopPadding;

    .line 56
    .line 57
    sget v1, Ll/dbc0;->Kh:I

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/dq4;->L:Landroid/widget/ImageView;

    .line 63
    .line 64
    sget v1, Ll/dbc0;->W4:I

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ll/dq4;->O:Landroid/widget/ImageView;

    .line 70
    .line 71
    sget v1, Ll/dbc0;->X4:I

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Ll/dq4;->Q:Landroid/widget/ImageView;

    .line 77
    .line 78
    sget v1, Ll/dbc0;->Y4:I

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Ll/dq4;->N:Landroid/widget/ImageView;

    .line 84
    .line 85
    sget v1, Ll/dbc0;->y4:I

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Ll/dq4;->S:Lv/VText_NoTopPadding;

    .line 91
    .line 92
    sget v1, Ll/dbc0;->V4:I

    .line 93
    .line 94
    invoke-virtual {v0, v2, v2, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Ll/dq4;->I:Lv/VText_NoTopPadding;

    .line 98
    .line 99
    sget v1, Ll/dbc0;->Z4:I

    .line 100
    .line 101
    invoke-virtual {v0, v2, v2, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Ll/dq4;->V:Lv/VText_NoTopPadding;

    .line 105
    .line 106
    const-string v1, "#000000"

    .line 107
    .line 108
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Ll/dq4;->W:Lv/VImage;

    .line 116
    .line 117
    sget v2, Ll/dbc0;->y4:I

    .line 118
    .line 119
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Ll/dq4;->k0:Lv/VText_NoTopPadding;

    .line 123
    .line 124
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Ll/dq4;->p0:Lv/VImage;

    .line 132
    .line 133
    sget v2, Ll/dbc0;->y4:I

    .line 134
    .line 135
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Ll/dq4;->H0:Lv/VText_NoTopPadding;

    .line 139
    .line 140
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Ll/dq4;->I0:Lv/VImage;

    .line 148
    .line 149
    sget v1, Ll/dbc0;->y4:I

    .line 150
    .line 151
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 152
    .line 153
    .line 154
    iget-object v0, p0, Ll/dq4;->U:Lv/VImage;

    .line 155
    .line 156
    sget v1, Ll/dbc0;->b5:I

    .line 157
    .line 158
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 159
    .line 160
    .line 161
    iget-object v0, p0, Ll/dq4;->G0:Lv/VImage;

    .line 162
    .line 163
    sget v1, Ll/dbc0;->f5:I

    .line 164
    .line 165
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 166
    .line 167
    .line 168
    iget-object v0, p0, Ll/dq4;->Z:Lv/VImage;

    .line 169
    .line 170
    sget v1, Ll/dbc0;->a5:I

    .line 171
    .line 172
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 173
    .line 174
    .line 175
    iget-object p0, p0, Ll/dq4;->b:Lv/VImage;

    .line 176
    .line 177
    sget v0, Ll/dbc0;->g5:I

    .line 178
    .line 179
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 180
    .line 181
    .line 182
    return-void
.end method
