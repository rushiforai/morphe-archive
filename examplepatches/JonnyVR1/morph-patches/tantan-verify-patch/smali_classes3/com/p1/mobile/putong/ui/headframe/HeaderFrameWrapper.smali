.class public Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Lv/VDraweeView;

.field public f:I

.field public g:I

.field public h:I

.field public i:Z

.field public j:Z

.field public k:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x1

    .line 17
    iput-boolean p1, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->j:Z

    .line 18
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->k:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->j:Z

    .line 6
    .line 7
    const-string p1, ""

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->k:Ljava/lang/String;

    .line 10
    .line 11
    const/4 p1, -0x1

    .line 12
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->l0(Landroid/util/AttributeSet;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 19
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    .line 20
    iput-boolean p1, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->j:Z

    .line 21
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->k:Ljava/lang/String;

    .line 22
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->l0(Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public B0(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->d:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->e:Lv/VDraweeView;

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final D0(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->k:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->k:Ljava/lang/String;

    .line 13
    .line 14
    const-string v0, "other_user_id"

    .line 15
    .line 16
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const-string v1, "is_oneself"

    .line 31
    .line 32
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    filled-new-array {v0, p1}, [Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const-string v0, "e_audio_avatar_frame"

    .line 41
    .line 42
    invoke-static {v0, p0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    :goto_0
    return-void
.end method

.method public E0(ZLjava/lang/String;)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->i:Z

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->k:Ljava/lang/String;

    .line 4
    .line 5
    return-void
.end method

.method public G0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->e:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public get_frame()Lv/VDraweeView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->e:Lv/VDraweeView;

    .line 2
    .line 3
    return-object p0
.end method

.method public get_pic()Lv/VDraweeView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->d:Lv/VDraweeView;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/a0l;->a(Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i0(Ljava/lang/String;II)V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->d:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-virtual {v0, v1, p1, p2, p3}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->e:Lv/VDraweeView;

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final j0(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->needShowLiveFrame()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->i:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final k0(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->needShowFrame()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final l0(Landroid/util/AttributeSet;I)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/jhc0;->h0:[I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, p1, v1, p2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget p2, Ll/jhc0;->j0:I

    .line 13
    .line 14
    const/4 v0, -0x1

    .line 15
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    iput p2, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->h:I

    .line 20
    .line 21
    sget p2, Ll/jhc0;->i0:I

    .line 22
    .line 23
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    iput p2, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->g:I

    .line 28
    .line 29
    sget p2, Ll/jhc0;->k0:I

    .line 30
    .line 31
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    iput p2, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->f:I

    .line 36
    .line 37
    sget p2, Ll/jhc0;->l0:I

    .line 38
    .line 39
    invoke-virtual {p1, p2, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    iput-boolean p2, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->i:Z

    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public m0(Lcom/p1/mobile/putong/data/User;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->k0(Lcom/p1/mobile/putong/data/User;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-boolean v0, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->j:Z

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->j0(Lcom/p1/mobile/putong/data/User;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->e:Lv/VDraweeView;

    .line 24
    .line 25
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_1
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public n0(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->o0(Lcom/p1/mobile/putong/data/User;I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public o0(Lcom/p1/mobile/putong/data/User;I)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->k0(Lcom/p1/mobile/putong/data/User;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    iget-boolean p2, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->j:Z

    .line 9
    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->e:Lv/VDraweeView;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->headFrameUrl()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p2, v1, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->G0(Z)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->j0(Lcom/p1/mobile/putong/data/User;)Z

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    if-eqz p2, :cond_1

    .line 32
    .line 33
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->e:Lv/VDraweeView;

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->liveHeadFrameConfig()Lcom/p1/mobile/putong/data/LiveRight;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/LiveRight;->getMediumUrl()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {p2, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->D0(Lcom/p1/mobile/putong/data/User;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->G0(Z)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    const/4 p1, 0x0

    .line 56
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->G0(Z)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget v1, Ll/jec0;->b:I

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->h0(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    iget v0, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->h:I

    .line 22
    .line 23
    const/4 v1, -0x1

    .line 24
    if-eq v0, v1, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->d:Lv/VDraweeView;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    iget v3, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->h:I

    .line 33
    .line 34
    invoke-virtual {v2, v3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v0, v2}, Lv/VDraweeView;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->f:I

    .line 42
    .line 43
    if-eq v0, v1, :cond_1

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->setPicPlace(I)V

    .line 46
    .line 47
    .line 48
    :cond_1
    iget v0, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->g:I

    .line 49
    .line 50
    if-eq v0, v1, :cond_2

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->setPicFailed(I)V

    .line 53
    .line 54
    .line 55
    :cond_2
    return-void
.end method

.method public p0(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->q0(Lcom/p1/mobile/putong/data/User;I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public q0(Lcom/p1/mobile/putong/data/User;I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->r0(Lcom/p1/mobile/putong/data/User;IZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final r0(Lcom/p1/mobile/putong/data/User;IZ)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p2, v0, :cond_1

    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    if-eq p2, v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileBig()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    goto :goto_0

    .line 25
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->s0(Ljava/lang/String;Z)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final s0(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->d:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->e:Lv/VDraweeView;

    .line 9
    .line 10
    invoke-static {p0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setPicFailed(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->d:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/wlj;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/wlj;->z(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setPicPercent(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->d:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 8
    .line 9
    iput p1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->P:F

    .line 10
    .line 11
    iput p1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->O:F

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->d:Lv/VDraweeView;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setPicPlace(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->d:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/wlj;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/wlj;->D(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setShowSVipFrame(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->j:Z

    .line 2
    .line 3
    return-void
.end method

.method public t0(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->u0(Lcom/p1/mobile/putong/data/User;I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public u0(Lcom/p1/mobile/putong/data/User;I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->r0(Lcom/p1/mobile/putong/data/User;IZ)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->o0(Lcom/p1/mobile/putong/data/User;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public v0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->y0(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public w0(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->y0(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public y0(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->s0(Ljava/lang/String;Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->o0(Lcom/p1/mobile/putong/data/User;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public z0(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->d:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->e:Lv/VDraweeView;

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
