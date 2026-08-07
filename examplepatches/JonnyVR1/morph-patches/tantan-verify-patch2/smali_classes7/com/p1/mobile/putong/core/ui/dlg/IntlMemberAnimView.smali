.class public Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public A:Lv/VImage;

.field public B:Landroid/widget/TextView;

.field public C:Lv/VFrame;

.field public D:Landroid/widget/TextView;

.field public E:Ll/xmy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/xmy<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public F:Landroid/animation/ObjectAnimator;

.field public a:Landroid/widget/RelativeLayout;

.field public b:Lv/VDraweeView;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lcom/tantan/library/svga/SVGAnimationView;

.field public e:Lcom/tantan/library/svga/SVGAnimationView;

.field public f:Landroid/widget/ImageView;

.field public g:Landroid/widget/ImageView;

.field public h:Lv/VText;

.field public i:Lv/VLinear;

.field public j:Lv/VText;

.field public k:Lv/VLinear;

.field public l:Lv/VText;

.field public m:Lv/VText;

.field public n:Landroid/widget/TextView;

.field public o:Lv/VRelative;

.field public p:Lv/VLinear;

.field public q:Lv/VRelative;

.field public r:Lv/VText;

.field public s:Landroid/widget/TextView;

.field public t:Lv/VRelative;

.field public u:Lv/VText;

.field public v:Landroid/widget/ImageView;

.field public w:Lv/VText;

.field public x:Landroid/widget/TextView;

.field public y:Landroid/view/View;

.field public z:Lv/VButton;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static F(IILjava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/math/BigDecimal;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ljava/math/BigDecimal;-><init>(I)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->G(Ljava/math/BigDecimal;ILjava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static G(Ljava/math/BigDecimal;ILjava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/math/BigDecimal;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/math/BigDecimal;-><init>(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ljava/math/BigDecimal;->divide(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance p1, Ljava/text/DecimalFormat;

    .line 11
    .line 12
    invoke-direct {p1, p2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    sget-object p2, Ljava/math/RoundingMode;->DOWN:Ljava/math/RoundingMode;

    .line 16
    .line 17
    invoke-virtual {p1, p2}, Ljava/text/DecimalFormat;->setRoundingMode(Ljava/math/RoundingMode;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, p0}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public static K(I)Ljava/lang/String;
    .locals 4
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    const/16 v0, 0x2710

    .line 2
    .line 3
    if-ge p0, v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/text/DecimalFormat;

    .line 6
    .line 7
    const-string v1, ",###"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    int-to-long v1, p0

    .line 13
    invoke-virtual {v0, v1, v2}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    const-string v0, "###.#"

    .line 19
    .line 20
    const v1, 0xf4240

    .line 21
    .line 22
    .line 23
    if-ge p0, v1, :cond_1

    .line 24
    .line 25
    new-instance v1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    const/16 v2, 0x3e8

    .line 31
    .line 32
    invoke-static {p0, v2, v0}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->F(IILjava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string p0, "K"

    .line 40
    .line 41
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0

    .line 49
    :cond_1
    const v2, 0x5f5e100

    .line 50
    .line 51
    .line 52
    const-string v3, "M"

    .line 53
    .line 54
    if-ge p0, v2, :cond_2

    .line 55
    .line 56
    new-instance v2, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-static {p0, v1, v0}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->F(IILjava/lang/String;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0

    .line 76
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 79
    .line 80
    .line 81
    const v2, 0x5f5e0ff

    .line 82
    .line 83
    .line 84
    invoke-static {v2, v1, v0}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->F(IILjava/lang/String;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    return-object p0
.end method

.method public static synthetic p(Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic s(Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic u(Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public B(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->b:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->D(Landroid/view/View;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method public C(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->C:Lv/VFrame;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->D:Landroid/widget/TextView;

    .line 8
    .line 9
    invoke-static {v0, p1}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public E(Ljava/lang/Runnable;)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->g:Landroid/widget/ImageView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->g:Landroid/widget/ImageView;

    .line 8
    .line 9
    new-instance v1, Ll/kmo;

    .line 10
    .line 11
    invoke-direct {v1, p1}, Ll/kmo;-><init>(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    return-object p0
.end method

.method public L()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->C:Lv/VFrame;

    .line 2
    .line 3
    const/high16 v1, 0x40e00000    # 7.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    int-to-float v1, v1

    .line 10
    const/4 v2, 0x3

    .line 11
    new-array v2, v2, [F

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    const/4 v4, 0x0

    .line 15
    aput v4, v2, v3

    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    aput v1, v2, v3

    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    aput v4, v2, v1

    .line 22
    .line 23
    const-string v1, "translationY"

    .line 24
    .line 25
    invoke-static {v0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->F:Landroid/animation/ObjectAnimator;

    .line 30
    .line 31
    const-wide/16 v1, 0x5dc

    .line 32
    .line 33
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->F:Landroid/animation/ObjectAnimator;

    .line 37
    .line 38
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 39
    .line 40
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->F:Landroid/animation/ObjectAnimator;

    .line 47
    .line 48
    const/4 v0, -0x1

    .line 49
    invoke-virtual {p0, v0}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public M(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->B:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->B:Landroid/widget/TextView;

    .line 13
    .line 14
    new-instance v0, Ll/jmo;

    .line 15
    .line 16
    invoke-direct {v0, p2}, Ll/jmo;-><init>(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-object p0
.end method

.method public N(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->z:Lv/VButton;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->z:Lv/VButton;

    .line 7
    .line 8
    new-instance v0, Ll/lmo;

    .line 9
    .line 10
    invoke-direct {v0, p2}, Ll/lmo;-><init>(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 14
    .line 15
    .line 16
    return-object p0
.end method

.method public O(I)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;
    .locals 2

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 v0, 0x0

    .line 6
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->y:Landroid/view/View;

    .line 7
    .line 8
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->q:Lv/VRelative;

    .line 12
    .line 13
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->s:Landroid/widget/TextView;

    .line 17
    .line 18
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {v0, p1}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    return-object p0
.end method

.method public P(I)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->o:Lv/VRelative;

    .line 2
    .line 3
    const/16 v1, 0x64

    .line 4
    .line 5
    if-lt p1, v1, :cond_0

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v1, 0x0

    .line 10
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Vd()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->K(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->x:Landroid/widget/TextView;

    .line 35
    .line 36
    invoke-static {v0, p1}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    return-object p0
.end method

.method public Q(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->n:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public R(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->j:Lv/VText;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public S(I)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->f:Landroid/widget/ImageView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->f:Landroid/widget/ImageView;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public T(Z)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->A:Lv/VImage;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public V()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->F:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->E:Ll/xmy;

    .line 7
    .line 8
    invoke-interface {p0}, Ll/xmy;->e()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public W()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->F:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->E:Ll/xmy;

    .line 7
    .line 8
    invoke-interface {p0}, Ll/xmy;->a()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public X(I)V
    .locals 3

    .line 1
    const/16 v0, 0x64

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-lt p1, v0, :cond_0

    .line 5
    .line 6
    invoke-static {}, Ll/joa;->D3()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    move v0, v1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->k:Lv/VLinear;

    .line 16
    .line 17
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->j:Lv/VText;

    .line 21
    .line 22
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/joa;->D3()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_2

    .line 30
    .line 31
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->j:Lv/VText;

    .line 32
    .line 33
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 43
    .line 44
    sget v2, Lcom/p1/mobile/putong/core/member/R$string;->z0:I

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->R(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 51
    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 55
    .line 56
    sget v2, Lcom/p1/mobile/putong/core/member/R$string;->y0:I

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->R(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 63
    .line 64
    .line 65
    :cond_2
    :goto_1
    if-eqz v0, :cond_4

    .line 66
    .line 67
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 68
    .line 69
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->l:I

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->R(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 76
    .line 77
    .line 78
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 79
    .line 80
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->m:I

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->Q(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 87
    .line 88
    .line 89
    invoke-static {}, Ll/joa;->D3()Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-eqz v0, :cond_3

    .line 94
    .line 95
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->K(I)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    goto :goto_2

    .line 100
    :cond_3
    new-instance v0, Ljava/text/DecimalFormat;

    .line 101
    .line 102
    const-string v1, ",###"

    .line 103
    .line 104
    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    int-to-long v1, p1

    .line 108
    invoke-virtual {v0, v1, v2}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    :goto_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->l:Lv/VText;

    .line 113
    .line 114
    invoke-static {p0, p1}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 115
    .line 116
    .line 117
    :cond_4
    return-void
.end method

.method public Y(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->h:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->h:Lv/VText;

    .line 8
    .line 9
    invoke-static {v0, p1}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->W()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->v(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/jny;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 12
    .line 13
    invoke-direct {v0, v1, v2}, Ll/jny;-><init>(Lcom/tantan/library/svga/SVGAnimationView;Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->E:Ll/xmy;

    .line 17
    .line 18
    const-string v1, "https://auto.tancdn.com/v1/raw/48b01864-e871-498a-9151-f761e3d3188708.so"

    .line 19
    .line 20
    const/4 v2, -0x1

    .line 21
    invoke-interface {v0, v1, v2}, Ll/xmy;->c(Ljava/lang/Object;I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->L()V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->z:Lv/VButton;

    .line 28
    .line 29
    sget v0, Ll/gbc0;->c:I

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final v(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/mmo;->a(Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public w(Ljava/lang/String;I)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->E:Ll/xmy;

    .line 2
    .line 3
    invoke-interface {v0, p1, p2}, Ll/xmy;->b(Ljava/lang/Object;I)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public z(I)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->b:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setActualImageResource(I)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
