.class public Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;
.super Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;
    }
.end annotation


# instance fields
.field public A:Lv/VText;

.field public B:Lv/VText_NoTopPadding;

.field public C:Lv/VText_NoTopPadding;

.field public D:Lv/VText_NoTopPadding;

.field public E:Lv/VFrame_Anim;

.field public F:Lv/VImage;

.field public G:Lv/VProgressBar;

.field public H:Lv/VImage;

.field public I:Lv/VText;

.field public J:Ll/xk1;

.field public K:J

.field public L:Ll/p0k0;

.field public M:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/p0k0$b;",
            ">;"
        }
    .end annotation
.end field

.field public N:Ll/p0k0$b;

.field public O:Z

.field public P:Landroid/animation/ObjectAnimator;

.field public r:Lv/VFrame;

.field public s:Lv/VLinear;

.field public t:Lv/VImage;

.field public u:Lv/VText;

.field public v:Lv/VText;

.field public w:Lv/VDraweeView;

.field public x:Landroid/view/View;

.field public y:Lv/VImage;

.field public z:Lv/VImage;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic D(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->w0(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->z0(Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;)V

    return-void
.end method

.method public static synthetic F(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "lowquality_reason"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    filled-new-array {p0}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "e_replace_photo_cancel"

    .line 12
    .line 13
    const-string v1, "p_lowqualityphoto__popup"

    .line 14
    .line 15
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Lcom/p1/mobile/putong/data/Media;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->u0(Lcom/p1/mobile/putong/data/Media;[I)V

    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->o0(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->A0(Ll/l4g0;Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic J(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->n0(Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method

.method public static synthetic K(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/l4g0;->i()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic L(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/l4g0;->i()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic M(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->B0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic N(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->s0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic O(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->t0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->mapping:Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, "lowquality_reason"

    .line 6
    .line 7
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    filled-new-array {p0}, [Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "e_replace_photo_cancel"

    .line 16
    .line 17
    const-string v1, "p_lowqualityphoto__popup"

    .line 18
    .line 19
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->p0()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->r0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Ll/p0k0$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->q0(Ll/p0k0$b;)V

    return-void
.end method

.method public static synthetic T(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->v0()V

    return-void
.end method

.method public static synthetic U(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->x0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method

.method public static synthetic V(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->C0(Ll/l4g0;Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic W(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Ll/d3m;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->y0(Ll/d3m;)V

    return-void
.end method


# virtual methods
.method public final synthetic A0(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/l4g0;->k()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ll/l4g0;->j()V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->O:Z

    .line 9
    .line 10
    return-void
.end method

.method public final synthetic B0(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;->CHOOSE_PICTURE:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->c0(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "lowquality_reason"

    .line 7
    .line 8
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    filled-new-array {p0}, [Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string p1, "e_replace_photo"

    .line 17
    .line 18
    const-string v0, "p_lowqualityphoto__popup"

    .line 19
    .line 20
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic C0(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/l4g0;->k()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ll/l4g0;->j()V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->O:Z

    .line 9
    .line 10
    return-void
.end method

.method public final D0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->P:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->u:Lv/VText;

    .line 9
    .line 10
    const-string v1, "#33000000"

    .line 11
    .line 12
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->v:Lv/VText;

    .line 20
    .line 21
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->t:Lv/VImage;

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    invoke-virtual {v0, v1}, Lv/VImage;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->r:Lv/VFrame;

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->r:Lv/VFrame;

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->clearColorFilter()V

    .line 49
    .line 50
    .line 51
    :cond_1
    return-void
.end method

.method public final E0(Ll/p0k0$b;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 2
    .line 3
    if-eqz v0, :cond_e

    .line 4
    .line 5
    iget-object v0, p1, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->CANCEL:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 8
    .line 9
    if-eq v0, v1, :cond_e

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->CROP:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 12
    .line 13
    if-eq v0, v1, :cond_e

    .line 14
    .line 15
    sget-object v1, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->PICK:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 16
    .line 17
    if-ne v0, v1, :cond_0

    .line 18
    .line 19
    goto/16 :goto_7

    .line 20
    .line 21
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->isLoading()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->f()V

    .line 28
    .line 29
    .line 30
    :cond_1
    iget-object v0, p1, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 31
    .line 32
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_2

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->w:Lv/VDraweeView;

    .line 49
    .line 50
    new-instance v2, Ll/tk1;

    .line 51
    .line 52
    invoke-direct {v2, p0, v0}, Ll/tk1;-><init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Lcom/p1/mobile/putong/data/Media;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v1, v2}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_2
    instance-of v1, v0, Lcom/p1/mobile/putong/data/Video;

    .line 60
    .line 61
    if-eqz v1, :cond_3

    .line 62
    .line 63
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 64
    .line 65
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->w:Lv/VDraweeView;

    .line 66
    .line 67
    iget-object v3, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v1, v2, v3}, Ll/fsb0;->m0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 74
    .line 75
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->w:Lv/VDraweeView;

    .line 76
    .line 77
    invoke-virtual {v1, v2}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 78
    .line 79
    .line 80
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->z:Lv/VImage;

    .line 81
    .line 82
    instance-of v2, v0, Lcom/p1/mobile/putong/data/Video;

    .line 83
    .line 84
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->G:Lv/VProgressBar;

    .line 88
    .line 89
    iget-object v2, p1, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 90
    .line 91
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->isLoading()Z

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 96
    .line 97
    .line 98
    iget-boolean v1, p1, Ll/p0k0$b;->e:Z

    .line 99
    .line 100
    const/4 v2, 0x1

    .line 101
    if-eqz v1, :cond_4

    .line 102
    .line 103
    iget-object v1, p1, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 104
    .line 105
    sget-object v3, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FINISH:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 106
    .line 107
    if-ne v1, v3, :cond_4

    .line 108
    .line 109
    if-eqz v0, :cond_4

    .line 110
    .line 111
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 112
    .line 113
    const-string v3, "normal"

    .line 114
    .line 115
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-eqz v1, :cond_4

    .line 120
    .line 121
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->H:Lv/VImage;

    .line 122
    .line 123
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    new-instance v3, Ll/uk1;

    .line 131
    .line 132
    invoke-direct {v3, p0}, Ll/uk1;-><init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;)V

    .line 133
    .line 134
    .line 135
    const-wide/16 v4, 0x3e8

    .line 136
    .line 137
    invoke-static {v1, v3, v4, v5}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 138
    .line 139
    .line 140
    :cond_4
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->f0(Ll/p0k0$b;Lcom/p1/mobile/putong/data/Media;)Z

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    const/4 v3, 0x0

    .line 145
    if-eqz v1, :cond_5

    .line 146
    .line 147
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->F:Lv/VImage;

    .line 148
    .line 149
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->K0(Z)V

    .line 153
    .line 154
    .line 155
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->x:Landroid/view/View;

    .line 156
    .line 157
    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    const/high16 v4, 0x3f800000    # 1.0f

    .line 162
    .line 163
    invoke-virtual {v1, v4}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 168
    .line 169
    .line 170
    goto :goto_2

    .line 171
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->x:Landroid/view/View;

    .line 172
    .line 173
    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    const/4 v4, 0x0

    .line 178
    invoke-virtual {v1, v4}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 183
    .line 184
    .line 185
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->F:Lv/VImage;

    .line 186
    .line 187
    invoke-static {v1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 188
    .line 189
    .line 190
    if-eqz v0, :cond_6

    .line 191
    .line 192
    move v1, v2

    .line 193
    goto :goto_1

    .line 194
    :cond_6
    move v1, v3

    .line 195
    :goto_1
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->K0(Z)V

    .line 196
    .line 197
    .line 198
    :goto_2
    if-eqz v0, :cond_9

    .line 199
    .line 200
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 201
    .line 202
    invoke-virtual {v1}, Ll/xk1;->r()Z

    .line 203
    .line 204
    .line 205
    move-result v1

    .line 206
    if-eqz v1, :cond_9

    .line 207
    .line 208
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 209
    .line 210
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 211
    .line 212
    .line 213
    move-result v1

    .line 214
    if-nez v1, :cond_7

    .line 215
    .line 216
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 217
    .line 218
    .line 219
    move-result-object v1

    .line 220
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 221
    .line 222
    .line 223
    move-result-object v1

    .line 224
    iget-object v4, v0, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 225
    .line 226
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 227
    .line 228
    .line 229
    move-result-object v4

    .line 230
    check-cast v4, Ljava/lang/String;

    .line 231
    .line 232
    invoke-interface {v1, v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Gh(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NewTags;

    .line 233
    .line 234
    .line 235
    move-result-object v1

    .line 236
    goto :goto_3

    .line 237
    :cond_7
    const/4 v1, 0x0

    .line 238
    :goto_3
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 239
    .line 240
    .line 241
    move-result v4

    .line 242
    if-eqz v4, :cond_8

    .line 243
    .line 244
    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 245
    .line 246
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 247
    .line 248
    .line 249
    move-result v4

    .line 250
    if-nez v4, :cond_8

    .line 251
    .line 252
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->C:Lv/VText_NoTopPadding;

    .line 253
    .line 254
    invoke-static {v4, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 255
    .line 256
    .line 257
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->C:Lv/VText_NoTopPadding;

    .line 258
    .line 259
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 260
    .line 261
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 262
    .line 263
    .line 264
    goto :goto_4

    .line 265
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->C:Lv/VText_NoTopPadding;

    .line 266
    .line 267
    invoke-static {v1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 268
    .line 269
    .line 270
    goto :goto_4

    .line 271
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->C:Lv/VText_NoTopPadding;

    .line 272
    .line 273
    invoke-static {v1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 274
    .line 275
    .line 276
    :goto_4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->D:Lv/VText_NoTopPadding;

    .line 277
    .line 278
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 279
    .line 280
    invoke-virtual {v4}, Ll/xk1;->q()Z

    .line 281
    .line 282
    .line 283
    move-result v4

    .line 284
    if-eqz v4, :cond_b

    .line 285
    .line 286
    if-eqz v0, :cond_b

    .line 287
    .line 288
    iget-object v4, p1, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 289
    .line 290
    sget-object v5, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FINISH:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 291
    .line 292
    if-eq v4, v5, :cond_a

    .line 293
    .line 294
    sget-object v5, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->IDLE:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 295
    .line 296
    if-ne v4, v5, :cond_b

    .line 297
    .line 298
    :cond_a
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->C:Lv/VText_NoTopPadding;

    .line 299
    .line 300
    invoke-static {v4}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 301
    .line 302
    .line 303
    move-result v4

    .line 304
    if-nez v4, :cond_b

    .line 305
    .line 306
    move v4, v2

    .line 307
    goto :goto_5

    .line 308
    :cond_b
    move v4, v3

    .line 309
    :goto_5
    invoke-static {v1, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 310
    .line 311
    .line 312
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->B:Lv/VText_NoTopPadding;

    .line 313
    .line 314
    if-eqz v0, :cond_c

    .line 315
    .line 316
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 317
    .line 318
    invoke-virtual {v4}, Ll/xk1;->m()Ljava/lang/String;

    .line 319
    .line 320
    .line 321
    move-result-object v4

    .line 322
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 323
    .line 324
    .line 325
    move-result v4

    .line 326
    if-nez v4, :cond_c

    .line 327
    .line 328
    iget-boolean v4, p1, Ll/p0k0$b;->i:Z

    .line 329
    .line 330
    if-nez v4, :cond_c

    .line 331
    .line 332
    goto :goto_6

    .line 333
    :cond_c
    move v2, v3

    .line 334
    :goto_6
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 335
    .line 336
    .line 337
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->A:Lv/VText;

    .line 338
    .line 339
    iget-boolean v2, p1, Ll/p0k0$b;->i:Z

    .line 340
    .line 341
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 342
    .line 343
    .line 344
    iget-object v1, p1, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 345
    .line 346
    sget-object v2, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FINISH:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 347
    .line 348
    if-ne v1, v2, :cond_d

    .line 349
    .line 350
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->O:Z

    .line 351
    .line 352
    if-nez v1, :cond_d

    .line 353
    .line 354
    iget-object v1, p1, Ll/p0k0$b;->g:Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;

    .line 355
    .line 356
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->h0(Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;)V

    .line 357
    .line 358
    .line 359
    :cond_d
    iget-object p1, p1, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 360
    .line 361
    sget-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->ADD_TAG_FINISH:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 362
    .line 363
    if-ne p1, v0, :cond_e

    .line 364
    .line 365
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->c:Ll/jzk0;

    .line 366
    .line 367
    iget-object p1, p1, Ll/jzk0;->f:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 368
    .line 369
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h:Ll/t4m;

    .line 370
    .line 371
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 372
    .line 373
    .line 374
    move-result p1

    .line 375
    if-eqz p1, :cond_e

    .line 376
    .line 377
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->c:Ll/jzk0;

    .line 378
    .line 379
    iget-object p0, p0, Ll/jzk0;->f:Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 380
    .line 381
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h:Ll/t4m;

    .line 382
    .line 383
    invoke-interface {p0}, Ll/t4m;->c()V

    .line 384
    .line 385
    .line 386
    :cond_e
    :goto_7
    return-void
.end method

.method public final F0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->L:Ll/p0k0;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {p0, v2, v2}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->g0(ZZ)Ll/p0k0$a;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->M:Lrx/subjects/a;

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2, p0}, Ll/p0k0;->I0(Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;Lrx/subjects/a;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final G0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->v:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/xra;->w()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/xra;->s()Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;->weight:Lcom/p1/mobile/putong/core/data/NewDatingPurpose;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->picture:Ljava/util/List;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-static {}, Ll/xra;->c()Lcom/p1/mobile/putong/core/data/ProfileCompletionConfig;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ProfileCompletionConfig;->weight:Lcom/p1/mobile/putong/core/data/DatingPurpose;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->picture:Ljava/util/List;

    .line 29
    .line 30
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-ltz v1, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-ge v1, v2, :cond_1

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    check-cast v1, Ljava/lang/Integer;

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-lez v1, :cond_1

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->v:Lv/VText;

    .line 63
    .line 64
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    const-string v0, "+%d%%"

    .line 81
    .line 82
    invoke-static {v2, v0, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    .line 88
    .line 89
    :cond_1
    return-void
.end method

.method public final H0(Lcom/p1/mobile/putong/data/Media;)V
    .locals 6

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
    new-instance v1, Ll/gp4;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    check-cast v2, Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    move-object v4, p1

    .line 22
    check-cast v4, Lcom/p1/mobile/putong/data/Picture;

    .line 23
    .line 24
    new-instance v5, Ll/lk1;

    .line 25
    .line 26
    invoke-direct {v5, p0, v0, p1}, Ll/lk1;-><init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Media;)V

    .line 27
    .line 28
    .line 29
    invoke-direct {v1, v2, v3, v4, v5}, Ll/gp4;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Picture;Lcom/p1/mobile/putong/data/Picture;Ljava/lang/Runnable;)V

    .line 30
    .line 31
    .line 32
    new-instance p1, Ll/mk1;

    .line 33
    .line 34
    invoke-direct {p1, p0}, Ll/mk1;-><init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, p1}, Ll/pej0;->i(Ll/z2m;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1}, Ll/q27;->show()V

    .line 41
    .line 42
    .line 43
    const/4 p1, 0x1

    .line 44
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->O:Z

    .line 45
    .line 46
    return-void
.end method

.method public final I0(Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->conclusion:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ll/l4g0;

    .line 14
    .line 15
    const-class v1, Lcom/p1/mobile/android/app/Dialog;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, "p_lowqualityphoto__popup"

    .line 22
    .line 23
    invoke-direct {v0, v2, v1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    new-instance v1, Ll/jl80$a;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-direct {v1, v2}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 33
    .line 34
    .line 35
    const-string v2, "\u6e29\u99a8\u63d0\u793a"

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 42
    .line 43
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->conclusion:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    new-instance v2, Ll/hk1;

    .line 50
    .line 51
    invoke-direct {v2, p0, p1}, Ll/hk1;-><init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;)V

    .line 52
    .line 53
    .line 54
    const-string v3, "\u66f4\u6362\u7167\u7247"

    .line 55
    .line 56
    invoke-virtual {v1, v3, v2}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    new-instance v2, Ll/ik1;

    .line 61
    .line 62
    invoke-direct {v2, p1}, Ll/ik1;-><init>(Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;)V

    .line 63
    .line 64
    .line 65
    const-string p1, "\u7a0d\u540e\u518d\u8bf4"

    .line 66
    .line 67
    invoke-virtual {v1, p1, v2}, Ll/jl80$a;->X(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    new-instance v1, Ll/jk1;

    .line 72
    .line 73
    invoke-direct {v1, v0}, Ll/jk1;-><init>(Ll/l4g0;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1, v1}, Ll/jl80$a;->o0(Landroid/content/DialogInterface$OnShowListener;)Ll/jl80$a;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    new-instance v1, Ll/kk1;

    .line 81
    .line 82
    invoke-direct {v1, p0, v0}, Ll/kk1;-><init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Ll/l4g0;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1, v1}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p1}, Ll/jl80$a;->r0()Ll/jl80;

    .line 90
    .line 91
    .line 92
    const/4 p1, 0x1

    .line 93
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->O:Z

    .line 94
    .line 95
    :cond_0
    return-void
.end method

.method public final J0(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;)V
    .locals 3

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance v0, Ll/l4g0;

    .line 5
    .line 6
    const-class v1, Lcom/p1/mobile/android/app/Dialog;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const-string v2, "p_lowqualityphoto__popup"

    .line 13
    .line 14
    invoke-direct {v0, v2, v1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->Q0:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->repeatPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 26
    .line 27
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->conclusion:Ljava/lang/String;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->mapping:Ljava/lang/String;

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->R0:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->netPictureResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 41
    .line 42
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->conclusion:Ljava/lang/String;

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->mapping:Ljava/lang/String;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    const-string p2, ""

    .line 48
    .line 49
    move-object p1, p2

    .line 50
    :goto_0
    const-string v1, "lowquality_reason"

    .line 51
    .line 52
    invoke-static {v1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    filled-new-array {v1}, [Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 61
    .line 62
    .line 63
    new-instance v1, Ll/jl80$a;

    .line 64
    .line 65
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-direct {v1, v2}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 70
    .line 71
    .line 72
    const-string v2, "\u6e29\u99a8\u63d0\u793a"

    .line 73
    .line 74
    invoke-virtual {v1, v2}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v1, p2}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    new-instance v1, Ll/dk1;

    .line 83
    .line 84
    invoke-direct {v1, p0, p1}, Ll/dk1;-><init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    const-string v2, "\u66f4\u6362\u7167\u7247"

    .line 88
    .line 89
    invoke-virtual {p2, v2, v1}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    new-instance v1, Ll/ek1;

    .line 94
    .line 95
    invoke-direct {v1, p1}, Ll/ek1;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    const-string p1, "\u7a0d\u540e\u518d\u8bf4"

    .line 99
    .line 100
    invoke-virtual {p2, p1, v1}, Ll/jl80$a;->X(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    new-instance p2, Ll/fk1;

    .line 105
    .line 106
    invoke-direct {p2, v0}, Ll/fk1;-><init>(Ll/l4g0;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p1, p2}, Ll/jl80$a;->o0(Landroid/content/DialogInterface$OnShowListener;)Ll/jl80$a;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    new-instance p2, Ll/gk1;

    .line 114
    .line 115
    invoke-direct {p2, p0, v0}, Ll/gk1;-><init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Ll/l4g0;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p1, p2}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-virtual {p1}, Ll/jl80$a;->r0()Ll/jl80;

    .line 123
    .line 124
    .line 125
    const/4 p1, 0x1

    .line 126
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->O:Z

    .line 127
    .line 128
    return-void
.end method

.method public final K0(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->h()Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->h()Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->e:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->y:Lv/VImage;

    .line 17
    .line 18
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final X(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/al1;->a(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final Y()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 2
    .line 3
    if-eqz v0, :cond_b

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/xk1;->b()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-static {v0}, Ll/a5d0;->a(I)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->r:Lv/VFrame;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/xk1;->b()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/xk1;->e()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    invoke-static {v0}, Ll/a5d0;->a(I)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->y:Lv/VImage;

    .line 37
    .line 38
    const/4 v2, 0x0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/xk1;->e()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 52
    .line 53
    .line 54
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 55
    .line 56
    invoke-virtual {v0}, Ll/xk1;->o()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    invoke-static {v0}, Ll/a5d0;->a(I)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_2

    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->z:Lv/VImage;

    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 69
    .line 70
    invoke-virtual {v1}, Ll/xk1;->o()I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 75
    .line 76
    .line 77
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 78
    .line 79
    invoke-virtual {v0}, Ll/xk1;->f()I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    invoke-static {v0}, Ll/a5d0;->a(I)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_3

    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->F:Lv/VImage;

    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 92
    .line 93
    invoke-virtual {v1}, Ll/xk1;->f()I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 98
    .line 99
    .line 100
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 101
    .line 102
    invoke-virtual {v0}, Ll/xk1;->i()I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    invoke-static {v0}, Ll/a5d0;->a(I)Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-eqz v0, :cond_4

    .line 111
    .line 112
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->G:Lv/VProgressBar;

    .line 113
    .line 114
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 115
    .line 116
    invoke-virtual {v1}, Ll/xk1;->i()I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    invoke-virtual {v0, v1}, Lv/VProgressBar;->setColor(I)V

    .line 121
    .line 122
    .line 123
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 124
    .line 125
    invoke-virtual {v0}, Ll/xk1;->j()I

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    invoke-static {v0}, Ll/a5d0;->a(I)Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-eqz v0, :cond_5

    .line 134
    .line 135
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->H:Lv/VImage;

    .line 136
    .line 137
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 138
    .line 139
    invoke-virtual {v1}, Ll/xk1;->j()I

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 144
    .line 145
    .line 146
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 147
    .line 148
    invoke-virtual {v0}, Ll/xk1;->k()I

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    invoke-static {v0}, Ll/a5d0;->a(I)Z

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->t:Lv/VImage;

    .line 157
    .line 158
    const/4 v3, 0x1

    .line 159
    if-eqz v0, :cond_6

    .line 160
    .line 161
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 162
    .line 163
    invoke-virtual {v0}, Ll/xk1;->k()I

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 168
    .line 169
    .line 170
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->t:Lv/VImage;

    .line 171
    .line 172
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 173
    .line 174
    .line 175
    goto :goto_1

    .line 176
    :cond_6
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 177
    .line 178
    .line 179
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->t:Lv/VImage;

    .line 180
    .line 181
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 182
    .line 183
    .line 184
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 185
    .line 186
    invoke-virtual {v0}, Ll/xk1;->l()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 191
    .line 192
    .line 193
    move-result v0

    .line 194
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->u:Lv/VText;

    .line 195
    .line 196
    const/4 v4, 0x0

    .line 197
    if-nez v0, :cond_7

    .line 198
    .line 199
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 200
    .line 201
    invoke-virtual {v0}, Ll/xk1;->l()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 206
    .line 207
    .line 208
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->u:Lv/VText;

    .line 209
    .line 210
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 211
    .line 212
    .line 213
    goto :goto_2

    .line 214
    :cond_7
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 215
    .line 216
    .line 217
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->u:Lv/VText;

    .line 218
    .line 219
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 220
    .line 221
    .line 222
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 223
    .line 224
    invoke-virtual {v0}, Ll/xk1;->m()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->B:Lv/VText_NoTopPadding;

    .line 233
    .line 234
    if-nez v0, :cond_8

    .line 235
    .line 236
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 237
    .line 238
    invoke-virtual {v0}, Ll/xk1;->m()Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 243
    .line 244
    .line 245
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->B:Lv/VText_NoTopPadding;

    .line 246
    .line 247
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 248
    .line 249
    .line 250
    goto :goto_3

    .line 251
    :cond_8
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 252
    .line 253
    .line 254
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->B:Lv/VText_NoTopPadding;

    .line 255
    .line 256
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 257
    .line 258
    .line 259
    :goto_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 260
    .line 261
    invoke-virtual {v0}, Ll/xk1;->s()Z

    .line 262
    .line 263
    .line 264
    move-result v0

    .line 265
    if-eqz v0, :cond_9

    .line 266
    .line 267
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->G0()V

    .line 268
    .line 269
    .line 270
    goto :goto_4

    .line 271
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->v:Lv/VText;

    .line 272
    .line 273
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 274
    .line 275
    .line 276
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->v:Lv/VText;

    .line 277
    .line 278
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 279
    .line 280
    .line 281
    :goto_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 282
    .line 283
    invoke-virtual {v0}, Ll/xk1;->a()Z

    .line 284
    .line 285
    .line 286
    move-result v0

    .line 287
    if-eqz v0, :cond_a

    .line 288
    .line 289
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->i0()V

    .line 290
    .line 291
    .line 292
    goto :goto_5

    .line 293
    :cond_a
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->D0()V

    .line 294
    .line 295
    .line 296
    :goto_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 297
    .line 298
    invoke-virtual {v0}, Ll/xk1;->c()Z

    .line 299
    .line 300
    .line 301
    move-result v0

    .line 302
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->n:Z

    .line 303
    .line 304
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 305
    .line 306
    invoke-virtual {v0}, Ll/xk1;->g()Z

    .line 307
    .line 308
    .line 309
    move-result v0

    .line 310
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->p:Z

    .line 311
    .line 312
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->I:Lv/VText;

    .line 313
    .line 314
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 315
    .line 316
    .line 317
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 318
    .line 319
    invoke-virtual {v0}, Ll/xk1;->t()Z

    .line 320
    .line 321
    .line 322
    move-result v0

    .line 323
    if-eqz v0, :cond_b

    .line 324
    .line 325
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->j0()V

    .line 326
    .line 327
    .line 328
    :cond_b
    return-void
.end method

.method public final Z(ZZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->L:Ll/p0k0;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->g0(ZZ)Ll/p0k0$a;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->M:Lrx/subjects/a;

    .line 14
    .line 15
    invoke-virtual {v0, v1, p1, p0}, Ll/p0k0;->J0(Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;Lrx/subjects/a;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final a0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->M:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/p0k0$b;

    .line 8
    .line 9
    if-eqz v0, :cond_4

    .line 10
    .line 11
    iget-object v1, v0, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 12
    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    iget-object v1, v0, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->isLoading()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/xk1;->d()Lcom/p1/mobile/putong/core/ui/profile/photo/a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-interface {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/photo/a;->a(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;I)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    iget-object v1, v0, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->isSuccess()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_3

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->getMedia()Lcom/p1/mobile/putong/data/Media;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->f0(Ll/p0k0$b;Lcom/p1/mobile/putong/data/Media;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/xk1;->d()Lcom/p1/mobile/putong/core/ui/profile/photo/a;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    invoke-interface {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/photo/a;->c(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;I)Z

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 72
    .line 73
    invoke-virtual {v0}, Ll/xk1;->d()Lcom/p1/mobile/putong/core/ui/profile/photo/a;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    invoke-interface {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/photo/a;->b(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;I)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_4
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 86
    .line 87
    invoke-virtual {v0}, Ll/xk1;->d()Lcom/p1/mobile/putong/core/ui/profile/photo/a;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    invoke-interface {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/photo/a;->d(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;I)Z

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public final b0()V
    .locals 2

    .line 1
    new-instance v0, Ll/p0k0$b;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/p0k0$b;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    iput-object v1, v0, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    iput-boolean v1, v0, Ll/p0k0$b;->f:Z

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->M:Lrx/subjects/a;

    .line 13
    .line 14
    invoke-virtual {v1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->l()V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->L:Ll/p0k0;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/p0k0;->H0()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public c0(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    const/4 v1, 0x0

    .line 11
    packed-switch p1, :pswitch_data_0

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :pswitch_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->e0()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :pswitch_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->b0()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :pswitch_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->F0()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :pswitch_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->d0()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :pswitch_4
    invoke-virtual {p0, v1, v1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->Z(ZZ)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :pswitch_5
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->Z(ZZ)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :pswitch_6
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->Z(ZZ)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final d0()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->getMedia()Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->L:Ll/p0k0;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    check-cast v2, Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    invoke-virtual {p0, v3, v3}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->g0(ZZ)Ll/p0k0$a;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    iget-object v4, v0, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 21
    .line 22
    invoke-virtual {v3, v4}, Ll/p0k0$a;->j(Ljava/util/List;)Ll/p0k0$a;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 27
    .line 28
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    xor-int/lit8 v0, v0, 0x1

    .line 33
    .line 34
    invoke-virtual {v3, v0}, Ll/p0k0$a;->i(Z)Ll/p0k0$a;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->M:Lrx/subjects/a;

    .line 39
    .line 40
    invoke-virtual {v1, v2, v0, p0}, Ll/p0k0;->a0(Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;Lrx/subjects/a;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public final e0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->M:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/p0k0$b;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, v0, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->clone()Lcom/p1/mobile/putong/data/Media;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    invoke-static {v0}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    new-instance v3, Ll/wk1;

    .line 30
    .line 31
    invoke-direct {v3, p0, v0}, Ll/wk1;-><init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Lcom/p1/mobile/putong/data/Media;)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    invoke-static {v1, v2, p0, v3, p0}, Lcom/p1/mobile/putong/core/newui/profile/TagChooseMkAct;->w2(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public final f0(Ll/p0k0$b;Lcom/p1/mobile/putong/data/Media;)Z
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_7

    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    goto/16 :goto_5

    .line 7
    .line 8
    :cond_0
    iget-object p1, p1, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->isSuccess()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    instance-of v1, p2, Lcom/p1/mobile/putong/data/Picture;

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 20
    .line 21
    invoke-virtual {v3}, Ll/xk1;->h()Ll/pp70;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-interface {v3}, Ll/pp70;->c()Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-eqz v3, :cond_1

    .line 30
    .line 31
    move-object v3, p2

    .line 32
    check-cast v3, Lcom/p1/mobile/putong/data/Picture;

    .line 33
    .line 34
    const-string v4, "WITH_AUDIT_AI_PICTURE"

    .line 35
    .line 36
    invoke-static {v4}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/data/Picture;->isLabelJudge(Lcom/p1/mobile/putong/data/MediaLabel;)Z

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    if-eqz v3, :cond_1

    .line 45
    .line 46
    move v3, v2

    .line 47
    goto :goto_0

    .line 48
    :cond_1
    move v3, v0

    .line 49
    :goto_0
    if-eqz v1, :cond_2

    .line 50
    .line 51
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 52
    .line 53
    invoke-virtual {v4}, Ll/xk1;->h()Ll/pp70;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    invoke-interface {v4}, Ll/pp70;->d()Z

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    if-eqz v4, :cond_2

    .line 62
    .line 63
    move-object v4, p2

    .line 64
    check-cast v4, Lcom/p1/mobile/putong/data/Picture;

    .line 65
    .line 66
    const-string v5, "WITH_REPEAT_MAIN_PICTURE"

    .line 67
    .line 68
    invoke-static {v5}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 69
    .line 70
    .line 71
    move-result-object v5

    .line 72
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/data/Picture;->isLabelJudge(Lcom/p1/mobile/putong/data/MediaLabel;)Z

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    if-eqz v4, :cond_2

    .line 77
    .line 78
    move v4, v2

    .line 79
    goto :goto_1

    .line 80
    :cond_2
    move v4, v0

    .line 81
    :goto_1
    if-eqz v1, :cond_3

    .line 82
    .line 83
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 84
    .line 85
    invoke-virtual {v5}, Ll/xk1;->h()Ll/pp70;

    .line 86
    .line 87
    .line 88
    move-result-object v5

    .line 89
    invoke-interface {v5}, Ll/pp70;->a()Z

    .line 90
    .line 91
    .line 92
    move-result v5

    .line 93
    if-eqz v5, :cond_3

    .line 94
    .line 95
    move-object v5, p2

    .line 96
    check-cast v5, Lcom/p1/mobile/putong/data/Picture;

    .line 97
    .line 98
    const-string v6, "WITH_NET_MAIN_PICTURE"

    .line 99
    .line 100
    invoke-static {v6}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 101
    .line 102
    .line 103
    move-result-object v6

    .line 104
    invoke-virtual {v5, v6}, Lcom/p1/mobile/putong/data/Picture;->isLabelJudge(Lcom/p1/mobile/putong/data/MediaLabel;)Z

    .line 105
    .line 106
    .line 107
    move-result v5

    .line 108
    if-eqz v5, :cond_3

    .line 109
    .line 110
    move v5, v2

    .line 111
    goto :goto_2

    .line 112
    :cond_3
    move v5, v0

    .line 113
    :goto_2
    if-eqz v1, :cond_4

    .line 114
    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 116
    .line 117
    invoke-virtual {p0}, Ll/xk1;->h()Ll/pp70;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-interface {p0}, Ll/pp70;->e()Z

    .line 122
    .line 123
    .line 124
    move-result p0

    .line 125
    if-eqz p0, :cond_4

    .line 126
    .line 127
    check-cast p2, Lcom/p1/mobile/putong/data/Picture;

    .line 128
    .line 129
    const-string p0, "WITH_LOW"

    .line 130
    .line 131
    invoke-static {p0}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/data/Picture;->isLabelJudge(Lcom/p1/mobile/putong/data/MediaLabel;)Z

    .line 136
    .line 137
    .line 138
    move-result p0

    .line 139
    if-eqz p0, :cond_4

    .line 140
    .line 141
    move p0, v2

    .line 142
    goto :goto_3

    .line 143
    :cond_4
    move p0, v0

    .line 144
    :goto_3
    if-eqz p1, :cond_6

    .line 145
    .line 146
    if-nez v3, :cond_6

    .line 147
    .line 148
    if-nez v4, :cond_6

    .line 149
    .line 150
    if-nez v5, :cond_6

    .line 151
    .line 152
    if-eqz p0, :cond_5

    .line 153
    .line 154
    goto :goto_4

    .line 155
    :cond_5
    return v0

    .line 156
    :cond_6
    :goto_4
    return v2

    .line 157
    :cond_7
    :goto_5
    return v0
.end method

.method public final g0(ZZ)Ll/p0k0$a;
    .locals 2

    .line 1
    new-instance v0, Ll/p0k0$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/p0k0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 7
    .line 8
    invoke-virtual {v1}, Ll/xk1;->n()Lcom/p1/mobile/putong/core/view/AvatarUpdateType;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ll/p0k0$a;->n(Lcom/p1/mobile/putong/core/view/AvatarUpdateType;)Ll/p0k0$a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0, p1}, Ll/p0k0$a;->k(Z)Ll/p0k0$a;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1, p2}, Ll/p0k0$a;->l(Z)Ll/p0k0$a;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 25
    .line 26
    invoke-virtual {p2}, Ll/xk1;->r()Z

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    invoke-virtual {p1, p2}, Ll/p0k0$a;->i(Z)Ll/p0k0$a;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 35
    .line 36
    invoke-virtual {p2}, Ll/xk1;->p()Z

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    if-eqz p2, :cond_0

    .line 41
    .line 42
    sget-object p2, Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;->LOCAL_CHECK:Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;

    .line 43
    .line 44
    invoke-virtual {p1, p2}, Ll/p0k0$a;->h(Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;)Ll/p0k0$a;

    .line 45
    .line 46
    .line 47
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/xk1;->h()Ll/pp70;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-interface {p0}, Ll/pp70;->d()Z

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    if-nez p2, :cond_2

    .line 58
    .line 59
    invoke-interface {p0}, Ll/pp70;->e()Z

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    if-nez p2, :cond_2

    .line 64
    .line 65
    invoke-interface {p0}, Ll/pp70;->a()Z

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    if-nez p2, :cond_2

    .line 70
    .line 71
    invoke-interface {p0}, Ll/pp70;->b()Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-eqz p0, :cond_1

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_1
    return-object p1

    .line 79
    :cond_2
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;->REMOTE_CHECK:Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;

    .line 80
    .line 81
    invoke-virtual {p1, p0}, Ll/p0k0$a;->h(Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;)Ll/p0k0$a;

    .line 82
    .line 83
    .line 84
    const-string p0, "editProfile"

    .line 85
    .line 86
    invoke-virtual {p1, p0}, Ll/p0k0$a;->m(Ljava/lang/String;)Ll/p0k0$a;

    .line 87
    .line 88
    .line 89
    return-object p1
.end method

.method public getConfig()Ll/xk1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMedia()Lcom/p1/mobile/putong/data/Media;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->M:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->M:Lrx/subjects/a;

    .line 10
    .line 11
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ll/p0k0$b;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method public getMediaStateResult()Ll/p0k0$b;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->M:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->M:Lrx/subjects/a;

    .line 10
    .line 11
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ll/p0k0$b;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return-object p0
.end method

.method public final h0(Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xk1;->n()Lcom/p1/mobile/putong/core/view/AvatarUpdateType;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/view/AvatarUpdateType;->AVATAR:Lcom/p1/mobile/putong/core/view/AvatarUpdateType;

    .line 8
    .line 9
    if-ne v0, v1, :cond_3

    .line 10
    .line 11
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 12
    .line 13
    if-eqz v0, :cond_3

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->v()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_3

    .line 20
    .line 21
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/xk1;->h()Ll/pp70;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-interface {v0}, Ll/pp70;->b()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    const-string v0, "NOT_VERIFICATION"

    .line 36
    .line 37
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Picture;->isLabelJudge(Lcom/p1/mobile/putong/data/MediaLabel;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_0

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->H0(Lcom/p1/mobile/putong/data/Media;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 66
    .line 67
    invoke-virtual {v0}, Ll/xk1;->h()Ll/pp70;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-interface {v0}, Ll/pp70;->d()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_1

    .line 76
    .line 77
    const-string v0, "WITH_REPEAT_MAIN_PICTURE"

    .line 78
    .line 79
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Picture;->isLabelJudge(Lcom/p1/mobile/putong/data/MediaLabel;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_1

    .line 88
    .line 89
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->Q0:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J0(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 96
    .line 97
    invoke-virtual {v0}, Ll/xk1;->h()Ll/pp70;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-interface {v0}, Ll/pp70;->e()Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-eqz v0, :cond_2

    .line 106
    .line 107
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->isLow()Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_2

    .line 112
    .line 113
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->I0(Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 118
    .line 119
    invoke-virtual {v0}, Ll/xk1;->h()Ll/pp70;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-interface {v0}, Ll/pp70;->a()Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    if-eqz v0, :cond_3

    .line 128
    .line 129
    const-string v0, "WITH_NET_MAIN_PICTURE"

    .line 130
    .line 131
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Picture;->isLabelJudge(Lcom/p1/mobile/putong/data/MediaLabel;)Z

    .line 136
    .line 137
    .line 138
    move-result p1

    .line 139
    if-eqz p1, :cond_3

    .line 140
    .line 141
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->R0:Ljava/lang/String;

    .line 142
    .line 143
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J0(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;)V

    .line 144
    .line 145
    .line 146
    :cond_3
    return-void
.end method

.method public final i0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->P:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->u:Lv/VText;

    .line 7
    .line 8
    new-instance v1, Landroid/animation/ArgbEvaluator;

    .line 9
    .line 10
    invoke-direct {v1}, Landroid/animation/ArgbEvaluator;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v2, "#e2e2e2"

    .line 14
    .line 15
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    const-string v3, "#FF7602"

    .line 24
    .line 25
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    filled-new-array {v2, v3}, [Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    const-string v3, "textColor"

    .line 38
    .line 39
    invoke-static {v0, v3, v1, v2}, Landroid/animation/ObjectAnimator;->ofObject(Ljava/lang/Object;Ljava/lang/String;Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/ObjectAnimator;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->P:Landroid/animation/ObjectAnimator;

    .line 44
    .line 45
    const-wide/16 v1, 0x320

    .line 46
    .line 47
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->P:Landroid/animation/ObjectAnimator;

    .line 51
    .line 52
    const/4 v1, 0x4

    .line 53
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->P:Landroid/animation/ObjectAnimator;

    .line 57
    .line 58
    const/4 v1, 0x0

    .line 59
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->P:Landroid/animation/ObjectAnimator;

    .line 63
    .line 64
    const/4 v1, 0x2

    .line 65
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->P:Landroid/animation/ObjectAnimator;

    .line 69
    .line 70
    new-instance v1, Ll/sk1;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Ll/sk1;-><init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->P:Landroid/animation/ObjectAnimator;

    .line 79
    .line 80
    invoke-virtual {v0}, Landroid/animation/Animator;->isStarted()Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-nez v0, :cond_1

    .line 85
    .line 86
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->P:Landroid/animation/ObjectAnimator;

    .line 87
    .line 88
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 89
    .line 90
    .line 91
    :cond_1
    :goto_0
    return-void
.end method

.method public final j0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->C:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    const/high16 v1, 0x41200000    # 10.0f

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->D:Lv/VText_NoTopPadding;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->B:Lv/VText_NoTopPadding;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->B:Lv/VText_NoTopPadding;

    .line 19
    .line 20
    sget v1, Ll/kbc0;->o:I

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->D:Lv/VText_NoTopPadding;

    .line 26
    .line 27
    const-string v1, "#FF700A"

    .line 28
    .line 29
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->D:Lv/VText_NoTopPadding;

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    invoke-virtual {v0, v1, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->C:Lv/VText_NoTopPadding;

    .line 43
    .line 44
    const/high16 v1, 0x41a00000    # 20.0f

    .line 45
    .line 46
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    invoke-static {v0, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->B:Lv/VText_NoTopPadding;

    .line 54
    .line 55
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    invoke-static {v0, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->D:Lv/VText_NoTopPadding;

    .line 63
    .line 64
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->z:Lv/VImage;

    .line 72
    .line 73
    sget v1, Ll/kbc0;->y:I

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->F:Lv/VImage;

    .line 79
    .line 80
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 85
    .line 86
    const/16 v1, 0x11

    .line 87
    .line 88
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 89
    .line 90
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->F:Lv/VImage;

    .line 91
    .line 92
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->F:Lv/VImage;

    .line 96
    .line 97
    const/4 v1, 0x0

    .line 98
    invoke-static {v0, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->F:Lv/VImage;

    .line 102
    .line 103
    invoke-static {p0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public final k0()V
    .locals 3

    .line 1
    new-instance v0, Ll/p0k0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/p0k0;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->L:Ll/p0k0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/p0k0;->c0()Lrx/subjects/a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->M:Lrx/subjects/a;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    new-instance v1, Ll/qk1;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/qk1;-><init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;)V

    .line 23
    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Ll/pcj;Z)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/rk1;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/rk1;-><init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final l0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->y:Lv/VImage;

    .line 2
    .line 3
    new-instance v1, Ll/ck1;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/ck1;-><init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->C:Lv/VText_NoTopPadding;

    .line 12
    .line 13
    new-instance v1, Ll/nk1;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/nk1;-><init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->D:Lv/VText_NoTopPadding;

    .line 22
    .line 23
    new-instance v1, Ll/pk1;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/pk1;-><init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public m0()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->M:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->M:Lrx/subjects/a;

    .line 11
    .line 12
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ll/p0k0$b;

    .line 17
    .line 18
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-boolean v0, p0, Ll/p0k0$b;->e:Z

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object p0, p0, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 29
    .line 30
    if-eqz p0, :cond_0

    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    return p0

    .line 34
    :cond_0
    return v1
.end method

.method public final synthetic n0(Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->setMedia(Lcom/p1/mobile/putong/data/Media;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic o0(Landroid/animation/ValueAnimator;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->u:Lv/VText;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->t:Lv/VImage;

    .line 17
    .line 18
    new-instance v2, Landroid/graphics/PorterDuffColorFilter;

    .line 19
    .line 20
    sget-object v3, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    .line 21
    .line 22
    invoke-direct {v2, v0, v3}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, v2}, Lv/VImage;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->v:Lv/VText;

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 31
    .line 32
    .line 33
    new-instance v0, Landroid/graphics/PorterDuffColorFilter;

    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    check-cast p1, Ljava/lang/Integer;

    .line 40
    .line 41
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    invoke-direct {v0, p1, v3}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->r:Lv/VFrame;

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->X(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->l0()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->k0()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public final synthetic p0()Lrx/c;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->M:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ll/vk1;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/vk1;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public final synthetic q0(Ll/p0k0$b;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->N:Ll/p0k0$b;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ll/p0k0$b;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p1}, Ll/p0k0$b;->a()Ll/p0k0$b;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->N:Ll/p0k0$b;

    .line 15
    .line 16
    iget-object v0, p1, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 17
    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/4 v0, 0x0

    .line 23
    :goto_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->k(Z)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->E0(Ll/p0k0$b;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic r0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->a0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic s0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->e0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setConfig(Ll/xk1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->Y()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setIllegalVisible(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->M:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/p0k0$b;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iput-boolean p1, v0, Ll/p0k0$b;->i:Z

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->M:Lrx/subjects/a;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public setMedia(Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->M:Lrx/subjects/a;

    .line 4
    .line 5
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->M:Lrx/subjects/a;

    .line 13
    .line 14
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ll/p0k0$b;

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_1
    :goto_0
    new-instance v0, Ll/p0k0$b;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/p0k0$b;-><init>()V

    .line 24
    .line 25
    .line 26
    :goto_1
    iput-object p1, v0, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->M:Lrx/subjects/a;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic t0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->e0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public u()V
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->K:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x12c

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-gez v0, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->K:J

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->a0()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic u0(Lcom/p1/mobile/putong/data/Media;[I)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->w:Lv/VDraweeView;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profile480()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-virtual {p2, p0, p1, v0}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final synthetic v0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->H:Lv/VImage;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public w(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->w(Z)V

    .line 2
    .line 3
    .line 4
    xor-int/lit8 p1, p1, 0x1

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->K0(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic w0(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->i()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;

    .line 10
    .line 11
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->setMedia(Lcom/p1/mobile/putong/data/Media;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->f()V

    .line 15
    .line 16
    .line 17
    const-string p0, "\u65b0\u4e0a\u4f20\u5934\u50cf\u5df2\u4fdd\u5b58\u4e3a\u751f\u6d3b\u7167"

    .line 18
    .line 19
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const-string p0, "e_new_avatar_save_toast"

    .line 23
    .line 24
    const-string p1, "p_edit_profile_view"

    .line 25
    .line 26
    invoke-static {p0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic x0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Media;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->setMedia(Lcom/p1/mobile/putong/data/Media;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 14
    .line 15
    if-eqz p1, :cond_3

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->i()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iget v1, p1, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->d:I

    .line 28
    .line 29
    if-lt v0, v1, :cond_1

    .line 30
    .line 31
    sget-object p1, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 32
    .line 33
    invoke-static {}, Ll/xra;->w()Z

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    if-eqz p2, :cond_0

    .line 38
    .line 39
    const-string p2, "\u751f\u6d3b\u7167"

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const-string p2, "\u6211\u7684\u7167\u7247"

    .line 43
    .line 44
    :goto_0
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    const-string v0, "%s\u5df2\u8fbe\u4e0a\u9650\uff0c\u4e0d\u4fdd\u5b58\u65b0\u4e0a\u4f20\u5934\u50cf"

    .line 49
    .line 50
    invoke-static {p1, v0, p2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->f()V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->i()I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;

    .line 70
    .line 71
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->J:Ll/xk1;

    .line 72
    .line 73
    invoke-virtual {v0}, Ll/xk1;->r()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_2

    .line 78
    .line 79
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 84
    .line 85
    invoke-static {p2}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    new-instance v2, Ll/ok1;

    .line 90
    .line 91
    invoke-direct {v2, p0, p1, p2}, Ll/ok1;-><init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCards;Lcom/p1/mobile/putong/data/Media;)V

    .line 92
    .line 93
    .line 94
    const/4 p0, 0x0

    .line 95
    invoke-static {v0, v1, p0, v2, p0}, Lcom/p1/mobile/putong/core/newui/profile/TagChooseMkAct;->w2(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->i()I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;

    .line 108
    .line 109
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->setMedia(Lcom/p1/mobile/putong/data/Media;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->f()V

    .line 113
    .line 114
    .line 115
    const-string p0, "\u65b0\u4e0a\u4f20\u5934\u50cf\u5df2\u4fdd\u5b58\u4e3a\u5176\u4ed6\u7167\u7247"

    .line 116
    .line 117
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    const-string p0, "e_new_avatar_save_toast"

    .line 121
    .line 122
    const-string p1, "p_edit_profile_view"

    .line 123
    .line 124
    invoke-static {p0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    :cond_3
    return-void
.end method

.method public final synthetic y0(Ll/d3m;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->O:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic z0(Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;->CHOOSE_PICTURE:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->c0(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard$ClickAction;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PictureServeCheckResult;->lowPhotoResult:Lcom/p1/mobile/putong/core/data/PhotoLowModelData;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PhotoLowModelData;->mapping:Ljava/lang/String;

    .line 9
    .line 10
    const-string p1, "lowquality_reason"

    .line 11
    .line 12
    invoke-static {p1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    filled-new-array {p0}, [Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string p1, "e_replace_photo"

    .line 21
    .line 22
    const-string v0, "p_lowqualityphoto__popup"

    .line 23
    .line 24
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
