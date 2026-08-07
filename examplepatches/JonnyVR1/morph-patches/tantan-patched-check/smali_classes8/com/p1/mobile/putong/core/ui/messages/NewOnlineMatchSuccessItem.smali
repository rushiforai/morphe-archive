.class public Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# static fields
.field public static final j:Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess$a;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;

.field public b:Lv/VFrame;

.field public c:Lv/VDraweeView;

.field public d:Lv/VFrame;

.field public e:Lv/VDraweeView;

.field public f:Landroid/widget/TextView;

.field public g:Landroid/widget/TextView;

.field public h:Ll/qzz;

.field public i:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess$a;

    .line 2
    .line 3
    const v1, 0x3e19999a    # 0.15f

    .line 4
    .line 5
    .line 6
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess$a;-><init>(F)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;->j:Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess$a;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/16 p1, 0x5dc

    .line 5
    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;->i:I

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 9
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/16 p1, 0x5dc

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;->i:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 11
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/16 p1, 0x5dc

    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;->i:I

    return-void
.end method

.method public static synthetic a()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;->e()V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;->f()V

    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/a840;->a(Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic e()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;->c:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;->e:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final f()V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;->b:Lv/VFrame;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    div-int/lit8 v2, v2, 0x3

    .line 10
    .line 11
    const/4 v3, 0x2

    .line 12
    mul-int/2addr v2, v3

    .line 13
    int-to-float v2, v2

    .line 14
    invoke-virtual {v1, v2}, Landroid/view/View;->setPivotX(F)V

    .line 15
    .line 16
    .line 17
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;->b:Lv/VFrame;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    mul-int/2addr v2, v3

    .line 24
    int-to-float v2, v2

    .line 25
    invoke-virtual {v1, v2}, Landroid/view/View;->setPivotY(F)V

    .line 26
    .line 27
    .line 28
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;->d:Lv/VFrame;

    .line 29
    .line 30
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    div-int/lit8 v2, v2, 0x3

    .line 35
    .line 36
    int-to-float v2, v2

    .line 37
    invoke-virtual {v1, v2}, Landroid/view/View;->setPivotX(F)V

    .line 38
    .line 39
    .line 40
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;->d:Lv/VFrame;

    .line 41
    .line 42
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    mul-int/2addr v2, v3

    .line 47
    int-to-float v2, v2

    .line 48
    invoke-virtual {v1, v2}, Landroid/view/View;->setPivotY(F)V

    .line 49
    .line 50
    .line 51
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;->b:Lv/VFrame;

    .line 52
    .line 53
    iget v1, v0, Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;->i:I

    .line 54
    .line 55
    int-to-long v8, v1

    .line 56
    sget-object v16, Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;->j:Lcom/p1/mobile/putong/core/ui/messages/ItemCountdownLikeSuccess$a;

    .line 57
    .line 58
    new-array v11, v3, [F

    .line 59
    .line 60
    fill-array-data v11, :array_0

    .line 61
    .line 62
    .line 63
    sget-object v5, Landroid/view/View;->ROTATION:Landroid/util/Property;

    .line 64
    .line 65
    const-wide/16 v6, 0x0

    .line 66
    .line 67
    move-object/from16 v10, v16

    .line 68
    .line 69
    invoke-static/range {v4 .. v11}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    iget-object v10, v0, Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;->d:Lv/VFrame;

    .line 74
    .line 75
    iget v2, v0, Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;->i:I

    .line 76
    .line 77
    int-to-long v14, v2

    .line 78
    new-array v2, v3, [F

    .line 79
    .line 80
    fill-array-data v2, :array_1

    .line 81
    .line 82
    .line 83
    const-wide/16 v12, 0x0

    .line 84
    .line 85
    move-object/from16 v17, v2

    .line 86
    .line 87
    move-object v11, v5

    .line 88
    invoke-static/range {v10 .. v17}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    filled-new-array {v1, v2}, [Landroid/animation/Animator;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    new-instance v2, Ll/y740;

    .line 101
    .line 102
    invoke-direct {v2, v0}, Ll/y740;-><init>(Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;)V

    .line 103
    .line 104
    .line 105
    invoke-static {v1, v2}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v1}, Landroid/animation/Animator;->start()V

    .line 109
    .line 110
    .line 111
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;->h:Ll/qzz;

    .line 112
    .line 113
    new-instance v1, Ll/z740;

    .line 114
    .line 115
    invoke-direct {v1}, Ll/z740;-><init>()V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v0, v1}, Ll/qzz;->J1(Ll/x20;)V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    nop

    .line 123
    :array_0
    .array-data 4
        -0x3f400000    # -6.0f
        0x0
    .end array-data

    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    :array_1
    .array-data 4
        0x40c00000    # 6.0f
        0x0
    .end array-data
.end method

.method public g(Ll/qzz;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;->h:Ll/qzz;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isBannedNew()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isAccountCancellation()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;->c:Lv/VDraweeView;

    .line 19
    .line 20
    invoke-static {p2}, Ll/ux6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {v0, v1, p2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_1
    :goto_0
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;->c:Lv/VDraweeView;

    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-interface {v1}, Ll/r97;->T0()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-virtual {p2, v0, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 53
    .line 54
    .line 55
    :goto_1
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;->e:Lv/VDraweeView;

    .line 58
    .line 59
    invoke-static {p3}, Ll/ux6;->b(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 60
    .line 61
    .line 62
    move-result-object p3

    .line 63
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p3

    .line 71
    invoke-virtual {p2, v0, p3}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1}, Ll/qzz;->L0()Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-eqz p1, :cond_2

    .line 79
    .line 80
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;->c:Lv/VDraweeView;

    .line 81
    .line 82
    const/4 p2, 0x0

    .line 83
    invoke-static {p1, p2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;->e:Lv/VDraweeView;

    .line 87
    .line 88
    invoke-static {p1, p2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 89
    .line 90
    .line 91
    new-instance p1, Ll/x740;

    .line 92
    .line 93
    invoke-direct {p1, p0}, Ll/x740;-><init>(Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 97
    .line 98
    .line 99
    :cond_2
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;->f:Landroid/widget/TextView;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget v2, Ll/g9c0;->g:I

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/NewOnlineMatchSuccessItem;->g:Landroid/widget/TextView;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    sget v1, Ll/g9c0;->i:I

    .line 43
    .line 44
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method
