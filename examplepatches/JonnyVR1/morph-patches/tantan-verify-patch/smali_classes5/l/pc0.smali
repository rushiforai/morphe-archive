.class public Ll/pc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/pc0$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/zb0;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/l4g0;",
            ">;"
        }
    .end annotation
.end field

.field public B:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public C:Landroid/view/View$OnClickListener;

.field public D:Landroid/view/View$OnClickListener;

.field public E:Landroid/view/View$OnClickListener;

.field public F:Landroid/view/View$OnClickListener;

.field public a:Lv/VLinear;

.field public b:Lv/VLinear;

.field public c:Lv/VFrame;

.field public d:Lv/VFrame;

.field public e:Lv/VFrame;

.field public f:Lv/VLinear;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VDraweeView;

.field public j:Lv/VImage;

.field public k:Lv/VText;

.field public l:Lv/VButton;

.field public m:Lv/VText;

.field public n:Landroid/view/ViewStub;

.field public o:Lv/VText;

.field public p:Lv/VText;

.field public q:Lv/VText;

.field public r:Lv/VLinear;

.field public s:Lv/VFrame;

.field public t:Lv/VButton;

.field public u:Ll/zb0;

.field public v:Lcom/p1/mobile/putong/core/ui/verification/age/AgeVerificationAct;

.field public w:Ll/l4g0;

.field public x:Ll/l4g0;

.field public y:Ll/l4g0;

.field public z:Ll/l4g0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/verification/age/AgeVerificationAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/pc0;->A:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ll/ec0;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/ec0;-><init>(Ll/pc0;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/pc0;->B:Ll/y20;

    .line 17
    .line 18
    new-instance v0, Ll/gc0;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/gc0;-><init>(Ll/pc0;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/pc0;->C:Landroid/view/View$OnClickListener;

    .line 24
    .line 25
    new-instance v0, Ll/hc0;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Ll/hc0;-><init>(Ll/pc0;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/pc0;->D:Landroid/view/View$OnClickListener;

    .line 31
    .line 32
    new-instance v0, Ll/ic0;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Ll/ic0;-><init>(Ll/pc0;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Ll/pc0;->E:Landroid/view/View$OnClickListener;

    .line 38
    .line 39
    new-instance v0, Ll/jc0;

    .line 40
    .line 41
    invoke-direct {v0, p0}, Ll/jc0;-><init>(Ll/pc0;)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Ll/pc0;->F:Landroid/view/View$OnClickListener;

    .line 45
    .line 46
    iput-object p1, p0, Ll/pc0;->v:Lcom/p1/mobile/putong/core/ui/verification/age/AgeVerificationAct;

    .line 47
    .line 48
    return-void
.end method

.method public static bridge synthetic A(Ll/pc0;Lv/VButton;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pc0;->l:Lv/VButton;

    return-void
.end method

.method public static bridge synthetic B(Ll/pc0;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pc0;->m:Lv/VText;

    return-void
.end method

.method public static bridge synthetic C(Ll/pc0;Lv/VImage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pc0;->j:Lv/VImage;

    return-void
.end method

.method public static bridge synthetic E(Ll/pc0;Landroid/view/ViewStub;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pc0;->n:Landroid/view/ViewStub;

    return-void
.end method

.method public static bridge synthetic F(Ll/pc0;Lv/VButton;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pc0;->t:Lv/VButton;

    return-void
.end method

.method public static bridge synthetic G(Ll/pc0;Lv/VFrame;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pc0;->s:Lv/VFrame;

    return-void
.end method

.method public static bridge synthetic H(Ll/pc0;Lv/VLinear;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pc0;->r:Lv/VLinear;

    return-void
.end method

.method public static bridge synthetic I(Ll/pc0;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pc0;->k:Lv/VText;

    return-void
.end method

.method public static bridge synthetic J(Ll/pc0;Lv/VLinear;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pc0;->f:Lv/VLinear;

    return-void
.end method

.method public static bridge synthetic K(Ll/pc0;Lv/VDraweeView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pc0;->i:Lv/VDraweeView;

    return-void
.end method

.method private synthetic P(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pc0;->B:Ll/y20;

    .line 2
    .line 3
    const-string p1, "insuranceCard"

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic Q(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pc0;->B:Ll/y20;

    .line 2
    .line 3
    const-string p1, "drivingLicense"

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic R(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pc0;->B:Ll/y20;

    .line 2
    .line 3
    const-string p1, "passport"

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic T(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pc0;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/ui/verification/age/AgeVerificationAct;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->b2(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic X(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_age_verify_submit_button"

    .line 2
    .line 3
    const-string v0, "p_age_verify"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/pc0;->u:Ll/zb0;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/zb0;->q0()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a(Ll/pc0;Ljava/lang/Double;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pc0;->V(Ljava/lang/Double;)V

    return-void
.end method

.method public static synthetic b(Ll/pc0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pc0;->S(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic c(Ll/pc0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pc0;->T(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/pc0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pc0;->P(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/pc0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pc0;->Y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/pc0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pc0;->X(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic j(Ll/pc0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pc0;->Q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Ll/pc0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pc0;->W(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Ll/pc0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pc0;->R(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Ll/pc0;)Ljava/lang/Double;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pc0;->U()Ljava/lang/Double;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic n(Ll/pc0;Lv/VLinear;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pc0;->a:Lv/VLinear;

    return-void
.end method

.method public static bridge synthetic p(Ll/pc0;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pc0;->h:Lv/VText;

    return-void
.end method

.method public static bridge synthetic q(Ll/pc0;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pc0;->g:Lv/VText;

    return-void
.end method

.method public static bridge synthetic s(Ll/pc0;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pc0;->p:Lv/VText;

    return-void
.end method

.method public static bridge synthetic u(Ll/pc0;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pc0;->q:Lv/VText;

    return-void
.end method

.method public static bridge synthetic v(Ll/pc0;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pc0;->o:Lv/VText;

    return-void
.end method

.method public static bridge synthetic w(Ll/pc0;Lv/VLinear;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pc0;->b:Lv/VLinear;

    return-void
.end method

.method public static bridge synthetic x(Ll/pc0;Lv/VFrame;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pc0;->c:Lv/VFrame;

    return-void
.end method

.method public static bridge synthetic y(Ll/pc0;Lv/VFrame;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pc0;->e:Lv/VFrame;

    return-void
.end method

.method public static bridge synthetic z(Ll/pc0;Lv/VFrame;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pc0;->d:Lv/VFrame;

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/pc0;->v:Lcom/p1/mobile/putong/core/ui/verification/age/AgeVerificationAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public L(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/pc0$a;->a(Ll/pc0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public M(Ll/zb0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pc0;->u:Ll/zb0;

    .line 2
    .line 3
    return-void
.end method

.method public final N()V
    .locals 2

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/ui/verification/age/AgeVerificationAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_age_verify_type"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/pc0;->w:Ll/l4g0;

    .line 14
    .line 15
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/pc0;->A:Ljava/util/List;

    .line 19
    .line 20
    iget-object p0, p0, Ll/pc0;->w:Ll/l4g0;

    .line 21
    .line 22
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public O()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/pc0;->A:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/l4g0;

    .line 18
    .line 19
    invoke-static {v0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public final synthetic S(Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "drivingLicense"

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string v0, "driver_license"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "passport"

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    const-string v0, "health_card"

    .line 22
    .line 23
    :goto_0
    const-string v1, "certificate_type"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    filled-new-array {v0}, [Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "e_age_verify_type"

    .line 34
    .line 35
    const-string v2, "p_age_verify_type"

    .line 36
    .line 37
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ll/pc0;->Z()V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/pc0;->b:Lv/VLinear;

    .line 44
    .line 45
    const/4 v1, 0x0

    .line 46
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/pc0;->f:Lv/VLinear;

    .line 50
    .line 51
    const/4 v2, 0x1

    .line 52
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/pc0;->r:Lv/VLinear;

    .line 56
    .line 57
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/pc0;->n:Landroid/view/ViewStub;

    .line 61
    .line 62
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    if-eqz v0, :cond_3

    .line 67
    .line 68
    const-string v0, "insuranceCard"

    .line 69
    .line 70
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    iget-object v1, p0, Ll/pc0;->n:Landroid/view/ViewStub;

    .line 75
    .line 76
    if-eqz v0, :cond_2

    .line 77
    .line 78
    sget v0, Ll/kec0;->uf:I

    .line 79
    .line 80
    invoke-virtual {v1, v0}, Landroid/view/ViewStub;->setLayoutResource(I)V

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_2
    sget v0, Ll/kec0;->tf:I

    .line 85
    .line 86
    invoke-virtual {v1, v0}, Landroid/view/ViewStub;->setLayoutResource(I)V

    .line 87
    .line 88
    .line 89
    :goto_1
    iget-object v0, p0, Ll/pc0;->n:Landroid/view/ViewStub;

    .line 90
    .line 91
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 92
    .line 93
    .line 94
    :cond_3
    iget-object v0, p0, Ll/pc0;->s:Lv/VFrame;

    .line 95
    .line 96
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Ll/pc0;->t:Lv/VButton;

    .line 100
    .line 101
    sget v1, Lcom/p1/mobile/putong/core/R$string;->B:I

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 104
    .line 105
    .line 106
    iget-object p0, p0, Ll/pc0;->u:Ll/zb0;

    .line 107
    .line 108
    invoke-virtual {p0, p1}, Ll/zb0;->p0(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public final synthetic U()Ljava/lang/Double;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/pc0;->u:Ll/zb0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/zb0;->h0()D

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic V(Ljava/lang/Double;)V
    .locals 2

    .line 1
    const-string v0, "e_age_verify_age_check"

    .line 2
    .line 3
    const-string v1, "p_age_verify"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/pc0;->u:Ll/zb0;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    invoke-virtual {p0, v0, v1}, Ll/zb0;->o0(D)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic W(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/pc0;->v:Lcom/p1/mobile/putong/core/ui/verification/age/AgeVerificationAct;

    .line 2
    .line 3
    new-instance v0, Ll/kc0;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/kc0;-><init>(Ll/pc0;)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ll/lc0;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/lc0;-><init>(Ll/pc0;)V

    .line 11
    .line 12
    .line 13
    new-instance p0, Ll/mc0;

    .line 14
    .line 15
    invoke-direct {p0}, Ll/mc0;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {p1, v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->I1(Lcom/p1/mobile/android/app/Act;Ll/pcj;Ll/y20;Ll/y20;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic Y(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_age_verify_submit_succeed_button"

    .line 2
    .line 3
    const-string v0, "p_age_verify_submit_succeed"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/pc0;->z:Ll/l4g0;

    .line 9
    .line 10
    invoke-static {p1}, Ll/w1e;->e(Ll/l4g0;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/pc0;->v:Lcom/p1/mobile/putong/core/ui/verification/age/AgeVerificationAct;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/verification/age/AgeVerificationAct;->finish()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final Z()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pc0;->w:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/pc0;->A:Ljava/util/List;

    .line 7
    .line 8
    iget-object v1, p0, Ll/pc0;->w:Ll/l4g0;

    .line 9
    .line 10
    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    const-class v0, Lcom/p1/mobile/putong/core/ui/verification/age/AgeVerificationAct;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "p_age_verify_photo_upload"

    .line 20
    .line 21
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Ll/pc0;->x:Ll/l4g0;

    .line 26
    .line 27
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/pc0;->A:Ljava/util/List;

    .line 31
    .line 32
    iget-object p0, p0, Ll/pc0;->x:Ll/l4g0;

    .line 33
    .line 34
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final a0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pc0;->x:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/pc0;->A:Ljava/util/List;

    .line 7
    .line 8
    iget-object v1, p0, Ll/pc0;->x:Ll/l4g0;

    .line 9
    .line 10
    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    const-class v0, Lcom/p1/mobile/putong/core/ui/verification/age/AgeVerificationAct;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "p_age_verify"

    .line 20
    .line 21
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Ll/pc0;->y:Ll/l4g0;

    .line 26
    .line 27
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/pc0;->A:Ljava/util/List;

    .line 31
    .line 32
    iget-object p0, p0, Ll/pc0;->y:Ll/l4g0;

    .line 33
    .line 34
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/pc0;->v:Lcom/p1/mobile/putong/core/ui/verification/age/AgeVerificationAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public b0(D)V
    .locals 3

    .line 1
    iget-object p0, p0, Ll/pc0;->p:Lv/VText;

    .line 2
    .line 3
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 4
    .line 5
    const-string v1, "yyyy-MM-dd"

    .line 6
    .line 7
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 8
    .line 9
    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {v0, p1}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public c0(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/pc0;->a0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/pc0;->g:Lv/VText;

    .line 5
    .line 6
    sget v1, Lcom/p1/mobile/putong/core/R$string;->H:I

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/pc0;->h:Lv/VText;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/pc0;->j:Lv/VImage;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/pc0;->k:Lv/VText;

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 28
    .line 29
    iget-object v1, p0, Ll/pc0;->i:Lv/VDraweeView;

    .line 30
    .line 31
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->i0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/pc0;->l:Lv/VButton;

    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/pc0;->m:Lv/VText;

    .line 41
    .line 42
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Ll/pc0;->o:Lv/VText;

    .line 46
    .line 47
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/pc0;->p:Lv/VText;

    .line 51
    .line 52
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Ll/pc0;->q:Lv/VText;

    .line 56
    .line 57
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Ll/pc0;->t:Lv/VButton;

    .line 61
    .line 62
    sget v0, Lcom/p1/mobile/putong/core/R$string;->G:I

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Ll/pc0;->t:Lv/VButton;

    .line 68
    .line 69
    iget-object p0, p0, Ll/pc0;->E:Landroid/view/View$OnClickListener;

    .line 70
    .line 71
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public d0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/pc0;->e0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/pc0;->b:Lv/VLinear;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/pc0;->f:Lv/VLinear;

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/pc0;->r:Lv/VLinear;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/pc0;->t:Lv/VButton;

    .line 22
    .line 23
    sget v1, Lcom/p1/mobile/putong/core/R$string;->k:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/pc0;->t:Lv/VButton;

    .line 29
    .line 30
    iget-object p0, p0, Ll/pc0;->F:Landroid/view/View$OnClickListener;

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final e0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pc0;->y:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/pc0;->A:Ljava/util/List;

    .line 7
    .line 8
    iget-object v1, p0, Ll/pc0;->y:Ll/l4g0;

    .line 9
    .line 10
    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    const-class v0, Lcom/p1/mobile/putong/core/ui/verification/age/AgeVerificationAct;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "p_age_verify_submit_succeed"

    .line 20
    .line 21
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Ll/pc0;->z:Ll/l4g0;

    .line 26
    .line 27
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/pc0;->A:Ljava/util/List;

    .line 31
    .line 32
    iget-object p0, p0, Ll/pc0;->z:Ll/l4g0;

    .line 33
    .line 34
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/zb0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/pc0;->M(Ll/zb0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/pc0;->L(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    invoke-virtual {p0}, Ll/pc0;->N()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/pc0;->b:Lv/VLinear;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/pc0;->f:Lv/VLinear;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/pc0;->r:Lv/VLinear;

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/pc0;->c:Lv/VFrame;

    .line 22
    .line 23
    new-instance v1, Ll/nc0;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/nc0;-><init>(Ll/pc0;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/pc0;->d:Lv/VFrame;

    .line 32
    .line 33
    new-instance v1, Ll/oc0;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/oc0;-><init>(Ll/pc0;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/pc0;->e:Lv/VFrame;

    .line 42
    .line 43
    new-instance v1, Ll/fc0;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/fc0;-><init>(Ll/pc0;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/pc0;->t:Lv/VButton;

    .line 52
    .line 53
    iget-object v1, p0, Ll/pc0;->C:Landroid/view/View$OnClickListener;

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/pc0;->i:Lv/VDraweeView;

    .line 59
    .line 60
    iget-object v1, p0, Ll/pc0;->C:Landroid/view/View$OnClickListener;

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/pc0;->l:Lv/VButton;

    .line 66
    .line 67
    iget-object v1, p0, Ll/pc0;->C:Landroid/view/View$OnClickListener;

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/pc0;->p:Lv/VText;

    .line 73
    .line 74
    iget-object v1, p0, Ll/pc0;->D:Landroid/view/View$OnClickListener;

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Ll/pc0;->u:Ll/zb0;

    .line 80
    .line 81
    invoke-virtual {v0}, Ll/zb0;->h0()D

    .line 82
    .line 83
    .line 84
    move-result-wide v0

    .line 85
    invoke-virtual {p0, v0, v1}, Ll/pc0;->b0(D)V

    .line 86
    .line 87
    .line 88
    return-void
.end method
