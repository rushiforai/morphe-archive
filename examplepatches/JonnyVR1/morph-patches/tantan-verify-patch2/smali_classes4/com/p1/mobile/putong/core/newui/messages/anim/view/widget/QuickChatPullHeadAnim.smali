.class public Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# static fields
.field public static final k:F


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/ImageXfermodeView;

.field public f:Lv/VText;

.field public g:[I

.field public h:[I

.field public i:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatHeaderBaseView;

.field public final j:Ljava/util/Random;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Ll/qa00;->F:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    sput v0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->k:F

    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 6

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/dbc0;->Eo:I

    .line 5
    .line 6
    sget v1, Ll/dbc0;->Fo:I

    .line 7
    .line 8
    sget v2, Ll/dbc0;->Go:I

    .line 9
    .line 10
    sget v3, Ll/dbc0;->Ho:I

    .line 11
    .line 12
    sget v4, Ll/dbc0;->Io:I

    .line 13
    .line 14
    sget v5, Ll/dbc0;->Jo:I

    .line 15
    .line 16
    filled-new-array/range {v0 .. v5}, [I

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->g:[I

    .line 21
    .line 22
    sget v0, Ll/dbc0;->yo:I

    .line 23
    .line 24
    sget v1, Ll/dbc0;->zo:I

    .line 25
    .line 26
    sget v2, Ll/dbc0;->Ao:I

    .line 27
    .line 28
    sget v3, Ll/dbc0;->Bo:I

    .line 29
    .line 30
    sget v4, Ll/dbc0;->Co:I

    .line 31
    .line 32
    sget v5, Ll/dbc0;->Do:I

    .line 33
    .line 34
    filled-new-array/range {v0 .. v5}, [I

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->h:[I

    .line 39
    .line 40
    new-instance p1, Ljava/util/Random;

    .line 41
    .line 42
    invoke-direct {p1}, Ljava/util/Random;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->j:Ljava/util/Random;

    .line 46
    .line 47
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->r()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 6

    .line 51
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 52
    sget v0, Ll/dbc0;->Eo:I

    sget v1, Ll/dbc0;->Fo:I

    sget v2, Ll/dbc0;->Go:I

    sget v3, Ll/dbc0;->Ho:I

    sget v4, Ll/dbc0;->Io:I

    sget v5, Ll/dbc0;->Jo:I

    filled-new-array/range {v0 .. v5}, [I

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->g:[I

    .line 53
    sget v0, Ll/dbc0;->yo:I

    sget v1, Ll/dbc0;->zo:I

    sget v2, Ll/dbc0;->Ao:I

    sget v3, Ll/dbc0;->Bo:I

    sget v4, Ll/dbc0;->Co:I

    sget v5, Ll/dbc0;->Do:I

    filled-new-array/range {v0 .. v5}, [I

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->h:[I

    .line 54
    new-instance p1, Ljava/util/Random;

    invoke-direct {p1}, Ljava/util/Random;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->j:Ljava/util/Random;

    .line 55
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->r()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 6

    .line 56
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 57
    sget v0, Ll/dbc0;->Eo:I

    sget v1, Ll/dbc0;->Fo:I

    sget v2, Ll/dbc0;->Go:I

    sget v3, Ll/dbc0;->Ho:I

    sget v4, Ll/dbc0;->Io:I

    sget v5, Ll/dbc0;->Jo:I

    filled-new-array/range {v0 .. v5}, [I

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->g:[I

    .line 58
    sget v0, Ll/dbc0;->yo:I

    sget v1, Ll/dbc0;->zo:I

    sget v2, Ll/dbc0;->Ao:I

    sget v3, Ll/dbc0;->Bo:I

    sget v4, Ll/dbc0;->Co:I

    sget v5, Ll/dbc0;->Do:I

    filled-new-array/range {v0 .. v5}, [I

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->h:[I

    .line 59
    new-instance p1, Ljava/util/Random;

    invoke-direct {p1}, Ljava/util/Random;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->j:Ljava/util/Random;

    .line 60
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->r()V

    return-void
.end method

.method private getRandomAvatar()I
    .locals 2

    .line 1
    invoke-static {}, Ll/c17;->u0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->g:[I

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->h:[I

    .line 11
    .line 12
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->j:Ljava/util/Random;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->h:[I

    .line 15
    .line 16
    array-length p0, p0

    .line 17
    invoke-virtual {v1, p0}, Ljava/util/Random;->nextInt(I)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    aget p0, v0, p0

    .line 22
    .line 23
    return p0
.end method

.method private r()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0, p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->h0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->d:Lv/VDraweeView;

    .line 15
    .line 16
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 19
    .line 20
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->e:Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/ImageXfermodeView;

    .line 42
    .line 43
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->getRandomAvatar()I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    invoke-virtual {v0, v1, p0}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 48
    .line 49
    .line 50
    return-void
.end method


# virtual methods
.method public h0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/l5c0;->b(Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final i0()V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->e:Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/ImageXfermodeView;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->getRandomAvatar()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {v0, v1, p0}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public j0()V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->i0()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public k0(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->i:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatHeaderBaseView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatHeaderBaseView;->getMAX_PULL_VIEW_HEIGH()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float p1, p1

    .line 8
    int-to-float v0, v0

    .line 9
    const/high16 v1, 0x3f800000    # 1.0f

    .line 10
    .line 11
    mul-float/2addr v0, v1

    .line 12
    div-float/2addr p1, v0

    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->d:Lv/VDraweeView;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    int-to-float v0, v0

    .line 20
    const v1, 0x3ecccccd    # 0.4f

    .line 21
    .line 22
    .line 23
    mul-float/2addr v0, v1

    .line 24
    mul-float/2addr v0, p1

    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->d:Lv/VDraweeView;

    .line 26
    .line 27
    invoke-virtual {v1, p1}, Landroid/view/View;->setScaleX(F)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->d:Lv/VDraweeView;

    .line 31
    .line 32
    invoke-virtual {v1, p1}, Landroid/view/View;->setScaleY(F)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->e:Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/ImageXfermodeView;

    .line 36
    .line 37
    invoke-virtual {v1, p1}, Landroid/view/View;->setScaleX(F)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->e:Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/ImageXfermodeView;

    .line 41
    .line 42
    invoke-virtual {v1, p1}, Landroid/view/View;->setScaleY(F)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->d:Lv/VDraweeView;

    .line 46
    .line 47
    mul-float v2, v0, p1

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationX(F)V

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->e:Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/ImageXfermodeView;

    .line 53
    .line 54
    neg-float v2, v0

    .line 55
    mul-float/2addr v2, p1

    .line 56
    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationX(F)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->e:Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/ImageXfermodeView;

    .line 60
    .line 61
    const/high16 p1, 0x40000000    # 2.0f

    .line 62
    .line 63
    mul-float/2addr v0, p1

    .line 64
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/ImageXfermodeView;->setProgress(F)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final l0(I)V
    .locals 2

    .line 1
    int-to-float p1, p1

    .line 2
    sget v0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->k:F

    .line 3
    .line 4
    sub-float/2addr p1, v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->i:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatHeaderBaseView;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatHeaderBaseView;->getMAX_PULL_VIEW_HEIGH()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    int-to-float v1, v1

    .line 12
    sub-float/2addr v1, v0

    .line 13
    div-float/2addr p1, v1

    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->f:Lv/VText;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public setData(Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatHeaderBaseView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->i:Lcom/p1/mobile/putong/core/newui/messages/anim/view/QuickChatHeaderBaseView;

    .line 2
    .line 3
    return-void
.end method

.method public setPullHeight(I)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->j0()V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    const/4 v0, 0x1

    .line 8
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->k0(I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/anim/view/widget/QuickChatPullHeadAnim;->l0(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
