.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public A:Ll/ozj;

.field public B:Ll/qjs;

.field public C:Ll/guj;

.field public D:Ll/bjs;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/bjs<",
            "*>;"
        }
    .end annotation
.end field

.field public E:I

.field public F:Ll/qxj;

.field public G:Ll/gjs;

.field public H:Ll/jjs;

.field public I:Z

.field public J:Z

.field public K:I

.field public d:Lv/VDraweeView;

.field public e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public f:Lv/VImage;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Landroid/widget/FrameLayout;

.field public j:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public k:Landroid/view/View;

.field public l:Landroid/widget/TextView;

.field public m:Landroid/view/View;

.field public n:Landroid/widget/ProgressBar;

.field public o:Landroidx/constraintlayout/widget/Group;

.field public p:Lv/VText;

.field public q:Lv/VText;

.field public r:Landroid/view/View;

.field public s:Landroid/view/View;

.field public t:Lv/VText;

.field public u:Lv/VText;

.field public v:Landroid/view/View;

.field public w:Lv/VText;

.field public x:Lv/VText;

.field public y:Landroid/animation/Animator;

.field public z:Landroid/animation/AnimatorSet;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 14
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 13
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->I:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->J:Z

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->K:I

    .line 11
    .line 12
    return-void
.end method

.method private H0(Ll/jjs;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->G0()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    xor-int/lit8 p0, p0, 0x1

    .line 14
    .line 15
    invoke-static {p1, p0}, Ll/lre;->a(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Z)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method private I0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localRightTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/LangModel;->getLocalName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressText:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_2

    .line 22
    .line 23
    :cond_1
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_2
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method private J0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/LangModel;->getLocalName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->longPressText:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    :cond_0
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method private synthetic K0(ZJLjava/lang/Integer;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->H:Ll/jjs;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    .line 7
    .line 8
    .line 9
    move-result p4

    .line 10
    iput p4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->K:I

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    const/4 v1, 0x4

    .line 14
    if-ne p4, v1, :cond_1

    .line 15
    .line 16
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->H:Ll/jjs;

    .line 17
    .line 18
    invoke-virtual {p4, v0}, Ll/jjs;->A(Z)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->X0()V

    .line 22
    .line 23
    .line 24
    iget-boolean p4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->I:Z

    .line 25
    .line 26
    if-eqz p4, :cond_1

    .line 27
    .line 28
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->T0()V

    .line 29
    .line 30
    .line 31
    :cond_1
    if-eqz p1, :cond_3

    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->H:Ll/jjs;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 40
    .line 41
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->K:I

    .line 42
    .line 43
    const/4 p4, 0x0

    .line 44
    if-eq p0, v1, :cond_2

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    move v0, p4

    .line 48
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 49
    .line 50
    .line 51
    move-result-wide v1

    .line 52
    sub-long/2addr v1, p2

    .line 53
    invoke-static {p1, p4, v0, v1, v2}, Ll/rre;->G(Ljava/lang/String;ZZJ)V

    .line 54
    .line 55
    .line 56
    :cond_3
    :goto_1
    return-void
.end method

.method private synthetic N0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->z:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private synthetic O0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->q:Lv/VText;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private T0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->H:Ll/jjs;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->k1(Ll/jjs;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->H:Ll/jjs;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->j1(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->H:Ll/jjs;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->S0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->H:Ll/jjs;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->h1(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private V0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->url:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->dynamicUrl:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Ll/vwt;->R6()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->dynamicUrl:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->dynamicUrl:Ljava/lang/String;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->url:Ljava/lang/String;

    .line 40
    .line 41
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 42
    .line 43
    invoke-static {p1}, Ll/xau;->z(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->d:Lv/VDraweeView;

    .line 51
    .line 52
    invoke-static {p1}, Ll/xau;->z(Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    xor-int/lit8 v1, v1, 0x1

    .line 57
    .line 58
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    invoke-static {p1}, Ll/xau;->z(Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_2

    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 68
    .line 69
    const/4 v0, -0x1

    .line 70
    const/4 v1, 0x0

    .line 71
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->d:Lv/VDraweeView;

    .line 76
    .line 77
    sget v0, Ll/qa00;->F:I

    .line 78
    .line 79
    const-string v1, "context_livingAct"

    .line 80
    .line 81
    invoke-static {v1, p0, p1, v0, v0}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method private X0()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->o:Landroidx/constraintlayout/widget/Group;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->J:Z

    .line 9
    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->H:Ll/jjs;

    .line 11
    .line 12
    invoke-virtual {v2}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->i:Landroid/widget/FrameLayout;

    .line 17
    .line 18
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isCountTimeGift()Z

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    invoke-static {v3, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isJumpGift()Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-eqz v3, :cond_0

    .line 30
    .line 31
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->w:Lv/VText;

    .line 32
    .line 33
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->h:Lv/VText;

    .line 37
    .line 38
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getJumpGiftName()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->h:Lv/VText;

    .line 46
    .line 47
    const/4 v4, -0x1

    .line 48
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 49
    .line 50
    .line 51
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->p:Lv/VText;

    .line 52
    .line 53
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getLocalSubtitle()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->p:Lv/VText;

    .line 61
    .line 62
    sget v4, Ll/n9c0;->E0:I

    .line 63
    .line 64
    invoke-static {v4}, Ll/n3d0;->a(I)I

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 69
    .line 70
    .line 71
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->p:Lv/VText;

    .line 72
    .line 73
    invoke-static {v3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->q:Lv/VText;

    .line 77
    .line 78
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTimeText:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->q:Lv/VText;

    .line 84
    .line 85
    sget v2, Ll/n9c0;->r0:I

    .line 86
    .line 87
    invoke-static {v2}, Ll/n3d0;->a(I)I

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 92
    .line 93
    .line 94
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->q:Lv/VText;

    .line 95
    .line 96
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_0
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->h:Lv/VText;

    .line 101
    .line 102
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getLocalName()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 107
    .line 108
    .line 109
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->h:Lv/VText;

    .line 110
    .line 111
    sget v4, Ll/n9c0;->w1:I

    .line 112
    .line 113
    invoke-static {v4}, Ll/n3d0;->a(I)I

    .line 114
    .line 115
    .line 116
    move-result v4

    .line 117
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 118
    .line 119
    .line 120
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->p:Lv/VText;

    .line 121
    .line 122
    sget v4, Ll/n9c0;->n1:I

    .line 123
    .line 124
    invoke-static {v4}, Ll/n3d0;->a(I)I

    .line 125
    .line 126
    .line 127
    move-result v4

    .line 128
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 129
    .line 130
    .line 131
    const/high16 v3, 0x3f800000    # 1.0f

    .line 132
    .line 133
    invoke-virtual {p0, v3}, Landroid/view/View;->setAlpha(F)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isPaidGift()Z

    .line 137
    .line 138
    .line 139
    move-result v3

    .line 140
    if-eqz v3, :cond_1

    .line 141
    .line 142
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->w:Lv/VText;

    .line 143
    .line 144
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->q:Lv/VText;

    .line 148
    .line 149
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 150
    .line 151
    .line 152
    invoke-direct {p0, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->setGiftPrice(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 153
    .line 154
    .line 155
    return-void

    .line 156
    :cond_1
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isPacketGift()Z

    .line 157
    .line 158
    .line 159
    move-result v3

    .line 160
    if-eqz v3, :cond_3

    .line 161
    .line 162
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->w:Lv/VText;

    .line 163
    .line 164
    invoke-static {v3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 165
    .line 166
    .line 167
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->q:Lv/VText;

    .line 168
    .line 169
    sget v4, Ll/n9c0;->r0:I

    .line 170
    .line 171
    invoke-static {v4}, Ll/n3d0;->a(I)I

    .line 172
    .line 173
    .line 174
    move-result v4

    .line 175
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 176
    .line 177
    .line 178
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->H:Ll/jjs;

    .line 179
    .line 180
    invoke-virtual {v3}, Ll/jjs;->o()Z

    .line 181
    .line 182
    .line 183
    move-result v3

    .line 184
    if-nez v3, :cond_2

    .line 185
    .line 186
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTimeText:Ljava/lang/String;

    .line 187
    .line 188
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 189
    .line 190
    .line 191
    move-result v3

    .line 192
    if-nez v3, :cond_2

    .line 193
    .line 194
    move v1, v0

    .line 195
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->q:Lv/VText;

    .line 196
    .line 197
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 198
    .line 199
    .line 200
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->p:Lv/VText;

    .line 201
    .line 202
    xor-int/lit8 v3, v1, 0x1

    .line 203
    .line 204
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 205
    .line 206
    .line 207
    invoke-direct {p0, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->setGiftPrice(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 208
    .line 209
    .line 210
    iget v0, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->remain:I

    .line 211
    .line 212
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTimeText:Ljava/lang/String;

    .line 213
    .line 214
    invoke-direct {p0, v0, v2, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->r1(ILjava/lang/String;Z)V

    .line 215
    .line 216
    .line 217
    return-void

    .line 218
    :cond_3
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isScrapGift()Z

    .line 219
    .line 220
    .line 221
    move-result v1

    .line 222
    if-eqz v1, :cond_4

    .line 223
    .line 224
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->w:Lv/VText;

    .line 225
    .line 226
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 227
    .line 228
    .line 229
    iget v0, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->remain:I

    .line 230
    .line 231
    iget-object v1, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTimeText:Ljava/lang/String;

    .line 232
    .line 233
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->q1(ILjava/lang/String;)V

    .line 234
    .line 235
    .line 236
    :cond_4
    return-void
.end method

.method private Y0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->nameStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;->status:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->f:Lv/VImage;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->g:Lv/VText;

    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->g:Lv/VText;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->nameStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;->userName:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->f:Lv/VImage;

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->g:Lv/VText;

    .line 37
    .line 38
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method private Z0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/n0k;->a(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->u:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->I0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->u:Lv/VText;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getLocalRightTagName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->f1()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->v0()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private a1(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/n0k;->c(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->t:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->J0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->t:Lv/VText;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getLocalTagName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->t:Lv/VText;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->tagTextColor:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p1}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 36
    .line 37
    .line 38
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->g1()V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->w0()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method private f1()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->u:Lv/VText;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private g1()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->t:Lv/VText;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->L0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    return-void
.end method

.method private h1(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->hasRotationAnim()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->B:Ll/qjs;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/qjs;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->D:Ll/bjs;

    .line 14
    .line 15
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->showAnimRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

    .line 16
    .line 17
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;->showAction:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRuleAction;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRuleAction;->frequency:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ll/bjs;->O4(Ljava/lang/String;)Ll/qul;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-direct {v0, p0, v1}, Ll/qjs;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/qul;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->B:Ll/qjs;

    .line 29
    .line 30
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->B:Ll/qjs;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ll/qjs;->q(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->O0()V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->N0()V

    return-void
.end method

.method private j1(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->H:Ll/jjs;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-boolean v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->hidePrice:Z

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    const/4 v3, 0x1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->H:Ll/jjs;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTimeText:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_3

    .line 28
    .line 29
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->q:Lv/VText;

    .line 30
    .line 31
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->p:Lv/VText;

    .line 35
    .line 36
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isJumpGift()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_3

    .line 45
    .line 46
    move-object/from16 v1, p1

    .line 47
    .line 48
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTimeText:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_1

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :cond_1
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->r0()V

    .line 59
    .line 60
    .line 61
    const/high16 v1, 0x41500000    # 13.0f

    .line 62
    .line 63
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    iget-object v4, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->q:Lv/VText;

    .line 68
    .line 69
    int-to-float v5, v1

    .line 70
    invoke-virtual {v4, v5}, Landroid/view/View;->setTranslationY(F)V

    .line 71
    .line 72
    .line 73
    iget-object v4, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->q:Lv/VText;

    .line 74
    .line 75
    invoke-static {v4, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    iget-object v4, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->z:Landroid/animation/AnimatorSet;

    .line 79
    .line 80
    if-nez v4, :cond_2

    .line 81
    .line 82
    iget-object v6, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->p:Lv/VText;

    .line 83
    .line 84
    neg-int v1, v1

    .line 85
    int-to-float v1, v1

    .line 86
    const/4 v4, 0x2

    .line 87
    new-array v13, v4, [F

    .line 88
    .line 89
    const/4 v14, 0x0

    .line 90
    aput v14, v13, v2

    .line 91
    .line 92
    aput v1, v13, v3

    .line 93
    .line 94
    sget-object v16, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 95
    .line 96
    const-wide/16 v8, 0xbb8

    .line 97
    .line 98
    const-wide/16 v10, 0x12c

    .line 99
    .line 100
    const/4 v12, 0x0

    .line 101
    move-object/from16 v7, v16

    .line 102
    .line 103
    invoke-static/range {v6 .. v13}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 104
    .line 105
    .line 106
    move-result-object v6

    .line 107
    check-cast v6, Landroid/animation/ObjectAnimator;

    .line 108
    .line 109
    iget-object v15, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->q:Lv/VText;

    .line 110
    .line 111
    new-array v7, v4, [F

    .line 112
    .line 113
    aput v5, v7, v2

    .line 114
    .line 115
    aput v14, v7, v3

    .line 116
    .line 117
    const-wide/16 v17, 0xbb8

    .line 118
    .line 119
    const-wide/16 v19, 0x12c

    .line 120
    .line 121
    const/16 v21, 0x0

    .line 122
    .line 123
    move-object/from16 v22, v7

    .line 124
    .line 125
    invoke-static/range {v15 .. v22}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 126
    .line 127
    .line 128
    move-result-object v7

    .line 129
    check-cast v7, Landroid/animation/ObjectAnimator;

    .line 130
    .line 131
    new-instance v8, Landroid/animation/AnimatorSet;

    .line 132
    .line 133
    invoke-direct {v8}, Landroid/animation/AnimatorSet;-><init>()V

    .line 134
    .line 135
    .line 136
    new-array v9, v4, [Landroid/animation/Animator;

    .line 137
    .line 138
    aput-object v6, v9, v2

    .line 139
    .line 140
    aput-object v7, v9, v3

    .line 141
    .line 142
    invoke-virtual {v8, v9}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 143
    .line 144
    .line 145
    const/16 v6, 0xbb8

    .line 146
    .line 147
    invoke-static {v6}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 148
    .line 149
    .line 150
    move-result-object v6

    .line 151
    iget-object v15, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->p:Lv/VText;

    .line 152
    .line 153
    new-array v7, v4, [F

    .line 154
    .line 155
    aput v5, v7, v2

    .line 156
    .line 157
    aput v14, v7, v3

    .line 158
    .line 159
    move-object/from16 v22, v7

    .line 160
    .line 161
    invoke-static/range {v15 .. v22}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 162
    .line 163
    .line 164
    move-result-object v5

    .line 165
    check-cast v5, Landroid/animation/ObjectAnimator;

    .line 166
    .line 167
    iget-object v15, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->q:Lv/VText;

    .line 168
    .line 169
    new-array v7, v4, [F

    .line 170
    .line 171
    aput v14, v7, v2

    .line 172
    .line 173
    aput v1, v7, v3

    .line 174
    .line 175
    move-object/from16 v22, v7

    .line 176
    .line 177
    invoke-static/range {v15 .. v22}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    check-cast v1, Landroid/animation/ObjectAnimator;

    .line 182
    .line 183
    new-instance v7, Landroid/animation/AnimatorSet;

    .line 184
    .line 185
    invoke-direct {v7}, Landroid/animation/AnimatorSet;-><init>()V

    .line 186
    .line 187
    .line 188
    new-array v9, v4, [Landroid/animation/Animator;

    .line 189
    .line 190
    aput-object v5, v9, v2

    .line 191
    .line 192
    aput-object v1, v9, v3

    .line 193
    .line 194
    invoke-virtual {v7, v9}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 195
    .line 196
    .line 197
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 198
    .line 199
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 200
    .line 201
    .line 202
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->z:Landroid/animation/AnimatorSet;

    .line 203
    .line 204
    const/4 v5, 0x3

    .line 205
    new-array v5, v5, [Landroid/animation/Animator;

    .line 206
    .line 207
    aput-object v8, v5, v2

    .line 208
    .line 209
    aput-object v6, v5, v3

    .line 210
    .line 211
    aput-object v7, v5, v4

    .line 212
    .line 213
    invoke-virtual {v1, v5}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 214
    .line 215
    .line 216
    :cond_2
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->z:Landroid/animation/AnimatorSet;

    .line 217
    .line 218
    new-instance v2, Ll/tjs;

    .line 219
    .line 220
    invoke-direct {v2, v0}, Ll/tjs;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;)V

    .line 221
    .line 222
    .line 223
    invoke-static {v1, v2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 224
    .line 225
    .line 226
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->z:Landroid/animation/AnimatorSet;

    .line 227
    .line 228
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 229
    .line 230
    .line 231
    :cond_3
    :goto_0
    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ZJLjava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->K0(ZJLjava/lang/Integer;)V

    return-void
.end method

.method private k1(Ll/jjs;)V
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual/range {p1 .. p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-boolean v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->hidePrice:Z

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    invoke-virtual/range {p1 .. p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTimeText:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->q:Lv/VText;

    .line 25
    .line 26
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void

    .line 30
    :cond_1
    invoke-virtual/range {p1 .. p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isPacketGift()Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-eqz v3, :cond_6

    .line 39
    .line 40
    iget v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->remain:I

    .line 41
    .line 42
    if-gtz v3, :cond_2

    .line 43
    .line 44
    goto/16 :goto_1

    .line 45
    .line 46
    :cond_2
    invoke-virtual/range {p1 .. p1}, Ll/jjs;->o()Z

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    if-eqz v3, :cond_4

    .line 51
    .line 52
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTimeText:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    if-eqz v3, :cond_3

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->s0()V

    .line 62
    .line 63
    .line 64
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->setGiftPrice(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 65
    .line 66
    .line 67
    const/high16 v1, 0x41800000    # 16.0f

    .line 68
    .line 69
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    iget-object v3, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->q:Lv/VText;

    .line 74
    .line 75
    int-to-float v4, v1

    .line 76
    invoke-virtual {v3, v4}, Landroid/view/View;->setTranslationY(F)V

    .line 77
    .line 78
    .line 79
    iget-object v5, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->p:Lv/VText;

    .line 80
    .line 81
    neg-int v1, v1

    .line 82
    int-to-float v1, v1

    .line 83
    const/4 v3, 0x2

    .line 84
    new-array v12, v3, [F

    .line 85
    .line 86
    const/4 v13, 0x0

    .line 87
    const/4 v14, 0x0

    .line 88
    aput v14, v12, v13

    .line 89
    .line 90
    aput v1, v12, v2

    .line 91
    .line 92
    sget-object v16, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 93
    .line 94
    const-wide/16 v7, 0xbb8

    .line 95
    .line 96
    const-wide/16 v9, 0x12c

    .line 97
    .line 98
    const/4 v11, 0x0

    .line 99
    move-object/from16 v6, v16

    .line 100
    .line 101
    invoke-static/range {v5 .. v12}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    iget-object v15, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->q:Lv/VText;

    .line 106
    .line 107
    new-array v3, v3, [F

    .line 108
    .line 109
    aput v4, v3, v13

    .line 110
    .line 111
    aput v14, v3, v2

    .line 112
    .line 113
    const-wide/16 v17, 0xbb8

    .line 114
    .line 115
    const-wide/16 v19, 0x12c

    .line 116
    .line 117
    const/16 v21, 0x0

    .line 118
    .line 119
    move-object/from16 v22, v3

    .line 120
    .line 121
    invoke-static/range {v15 .. v22}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    filled-new-array {v1, v2}, [Landroid/animation/Animator;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->y:Landroid/animation/Animator;

    .line 134
    .line 135
    new-instance v2, Ll/vjs;

    .line 136
    .line 137
    invoke-direct {v2, v0}, Ll/vjs;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;)V

    .line 138
    .line 139
    .line 140
    new-instance v3, Ll/wjs;

    .line 141
    .line 142
    move-object/from16 v4, p1

    .line 143
    .line 144
    invoke-direct {v3, v4}, Ll/wjs;-><init>(Ll/jjs;)V

    .line 145
    .line 146
    .line 147
    invoke-static {v1, v2, v3}, Ll/gt0;->w(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 148
    .line 149
    .line 150
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->y:Landroid/animation/Animator;

    .line 151
    .line 152
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 153
    .line 154
    .line 155
    return-void

    .line 156
    :cond_4
    :goto_0
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTimeText:Ljava/lang/String;

    .line 157
    .line 158
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 159
    .line 160
    .line 161
    move-result v3

    .line 162
    if-nez v3, :cond_5

    .line 163
    .line 164
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->q:Lv/VText;

    .line 165
    .line 166
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 167
    .line 168
    .line 169
    return-void

    .line 170
    :cond_5
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->setGiftPrice(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 171
    .line 172
    .line 173
    return-void

    .line 174
    :cond_6
    :goto_1
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->s0()V

    .line 175
    .line 176
    .line 177
    return-void
.end method

.method public static synthetic l0(Ll/jjs;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/jjs;->x(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private n0(Ll/jjs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 2
    .param p2    # Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->C:Ll/guj;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/guj;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->D:Ll/bjs;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ll/guj;-><init>(Ll/bjs;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->C:Ll/guj;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->C:Ll/guj;

    .line 15
    .line 16
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->E:I

    .line 17
    .line 18
    invoke-virtual {v0, p1, p0, v1, p2}, Ll/guj;->u(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ILcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private n1()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->H:Ll/jjs;

    .line 2
    .line 3
    invoke-static {v0}, Ll/gyj;->a(Ll/jjs;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->K:I

    .line 8
    .line 9
    return-void
.end method

.method private o0(IZ)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->G:Ll/gjs;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->G:Ll/gjs;

    .line 10
    .line 11
    new-instance v3, Ll/ujs;

    .line 12
    .line 13
    invoke-direct {v3, p0, p2, v0, v1}, Ll/ujs;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ZJ)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v2, p1, p2, v3}, Ll/gjs;->f(IZLl/y20;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method private p0(Ll/jjs;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->H0(Ll/jjs;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isCountTimeGift()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 21
    :goto_1
    invoke-virtual {p1, v0}, Ll/jjs;->A(Z)V

    .line 22
    .line 23
    .line 24
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->t1(Ll/jjs;)V

    .line 25
    .line 26
    .line 27
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->n1()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private q0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->B:Ll/qjs;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/qjs;->l()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private r0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->z:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->z:Landroid/animation/AnimatorSet;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method private r1(ILjava/lang/String;Z)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->s1(I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->q:Lv/VText;

    .line 5
    .line 6
    if-lez p1, :cond_0

    .line 7
    .line 8
    invoke-static {p2}, Ll/cpj;->D(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 17
    .line 18
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->g3:I

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->y:Landroid/animation/Animator;

    .line 28
    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/animation/Animator;->isRunning()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    const/4 p1, 0x1

    .line 39
    if-eqz p3, :cond_2

    .line 40
    .line 41
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->q:Lv/VText;

    .line 42
    .line 43
    invoke-static {p2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->p:Lv/VText;

    .line 47
    .line 48
    const/4 p1, 0x0

    .line 49
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->p:Lv/VText;

    .line 54
    .line 55
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method private s0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->y:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->y:Landroid/animation/Animator;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->q:Lv/VText;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private s1(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->w:Lv/VText;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private setGiftDialogAnchorId(Ll/jjs;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->D:Ll/bjs;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 10
    .line 11
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/bjs;->Y5(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method private setGiftPrice(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 3

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->hidePrice:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->p:Lv/VText;

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->q:Lv/VText;

    .line 13
    .line 14
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->p:Lv/VText;

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->p:Lv/VText;

    .line 27
    .line 28
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 29
    .line 30
    invoke-static {}, Ll/u8n;->a()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_2

    .line 35
    .line 36
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->re:I

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->me:I

    .line 40
    .line 41
    :goto_0
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getPrice()J

    .line 46
    .line 47
    .line 48
    move-result-wide v1

    .line 49
    long-to-double v1, v1

    .line 50
    invoke-static {v1, v2}, Ll/a9g0;->d(D)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method private t0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->A:Ll/ozj;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ozj;->e()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private t1(Ll/jjs;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactStatus:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "SetToGray"

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    const/high16 p1, 0x3f000000    # 0.5f

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/high16 p1, 0x3f800000    # 1.0f

    .line 19
    .line 20
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private u1(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 1

    .line 1
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->updateTagColorFromBrief(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->tag:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->tag:Ljava/lang/String;

    .line 13
    .line 14
    iput-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->tag:Ljava/lang/String;

    .line 15
    .line 16
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/data/LangModel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lcom/p1/mobile/putong/data/LangModel;

    .line 23
    .line 24
    iput-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localTag:Lcom/p1/mobile/putong/data/LangModel;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    .line 26
    :catch_0
    :cond_0
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->a1(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private v0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->u:Lv/VText;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private w0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->t:Lv/VText;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private y0()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->G0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->G:Ll/gjs;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->H:Ll/jjs;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/jjs;->p()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    new-instance v0, Ll/gjs;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->H:Ll/jjs;

    .line 22
    .line 23
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->E:I

    .line 24
    .line 25
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->D:Ll/bjs;

    .line 26
    .line 27
    invoke-direct {v0, v1, p0, v2, v3}, Ll/gjs;-><init>(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ILl/bjs;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->G:Ll/gjs;

    .line 31
    .line 32
    :cond_0
    return-void
.end method


# virtual methods
.method public B0()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->K:I

    .line 2
    .line 3
    const/4 v0, 0x4

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public D0()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->G:Ll/gjs;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->K:I

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    if-ne p0, v0, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public E0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->C:Ll/guj;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/guj;->n()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public G0()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/vwt;->c7()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    return p0
.end method

.method public final synthetic L0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->H:Ll/jjs;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/jjs;->t(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->H:Ll/jjs;

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->D:Ll/bjs;

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->E:I

    .line 11
    .line 12
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->U0(Ll/jjs;Ll/bjs;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public P0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->B:Ll/qjs;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/qjs;->l()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public Q0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->I:Z

    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->r0()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->s0()V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->t0()V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->q0()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->G:Ll/gjs;

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/gjs;->s()V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public R0(Ll/jjs;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->I:Z

    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->p0(Ll/jjs;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->setGiftDialogAnchorId(Ll/jjs;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Ll/jjs;->n()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->o1()V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->t1(Ll/jjs;)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->n0(Ll/jjs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, v1}, Ll/jjs;->v(Z)V

    .line 28
    .line 29
    .line 30
    :cond_0
    invoke-virtual {p1}, Ll/jjs;->p()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->G0()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->K:I

    .line 43
    .line 44
    invoke-direct {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->o0(IZ)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->J:Z

    .line 49
    .line 50
    if-nez v0, :cond_2

    .line 51
    .line 52
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->X0()V

    .line 53
    .line 54
    .line 55
    :cond_2
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->T0()V

    .line 56
    .line 57
    .line 58
    :goto_0
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->E:I

    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->D:Ll/bjs;

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-static {p1, v0, p0}, Ll/juj;->b(Ll/jjs;ILjava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public S0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->A:Ll/ozj;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/ozj;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->t:Lv/VText;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ll/ozj;-><init>(Lv/VText;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->A:Ll/ozj;

    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->A:Ll/ozj;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/ozj;->j(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public U0(Ll/jjs;Ll/bjs;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/jjs;",
            "Ll/bjs<",
            "*>;I)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->e1()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->H:Ll/jjs;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->D:Ll/bjs;

    .line 7
    .line 8
    iput p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->E:I

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->V0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 15
    .line 16
    .line 17
    const/4 p3, 0x0

    .line 18
    invoke-direct {p0, p1, p3}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->n0(Ll/jjs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->a1(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 22
    .line 23
    .line 24
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->Z0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 25
    .line 26
    .line 27
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->p0(Ll/jjs;)V

    .line 28
    .line 29
    .line 30
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->y0()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Ll/jjs;->p()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-nez p1, :cond_0

    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->X0()V

    .line 41
    .line 42
    .line 43
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->Y0(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public d1()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->K:I

    .line 3
    .line 4
    invoke-direct {p0, v0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->o0(IZ)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public e1()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->d:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->h:Lv/VText;

    .line 8
    .line 9
    const-string v2, ""

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->p:Lv/VText;

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->q:Lv/VText;

    .line 20
    .line 21
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->p:Lv/VText;

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    invoke-virtual {v0, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->q:Lv/VText;

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->h:Lv/VText;

    .line 36
    .line 37
    const/4 v2, -0x1

    .line 38
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->p:Lv/VText;

    .line 42
    .line 43
    sget v2, Ll/n9c0;->n1:I

    .line 44
    .line 45
    invoke-static {v2}, Ll/n3d0;->a(I)I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->j:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 53
    .line 54
    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->t:Lv/VText;

    .line 58
    .line 59
    const/4 v2, 0x0

    .line 60
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->u:Lv/VText;

    .line 64
    .line 65
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->i:Landroid/widget/FrameLayout;

    .line 69
    .line 70
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->o:Landroidx/constraintlayout/widget/Group;

    .line 74
    .line 75
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->w:Lv/VText;

    .line 79
    .line 80
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->x:Lv/VText;

    .line 84
    .line 85
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->f:Lv/VImage;

    .line 89
    .line 90
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->g:Lv/VText;

    .line 94
    .line 95
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->h:Lv/VText;

    .line 99
    .line 100
    const/4 v3, 0x1

    .line 101
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->p:Lv/VText;

    .line 105
    .line 106
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 116
    .line 117
    .line 118
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->y:Landroid/animation/Animator;

    .line 119
    .line 120
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->z:Landroid/animation/AnimatorSet;

    .line 121
    .line 122
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->A:Ll/ozj;

    .line 123
    .line 124
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->B:Ll/qjs;

    .line 125
    .line 126
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->C:Ll/guj;

    .line 127
    .line 128
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->D:Ll/bjs;

    .line 129
    .line 130
    iput v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->E:I

    .line 131
    .line 132
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->F:Ll/qxj;

    .line 133
    .line 134
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->G:Ll/gjs;

    .line 135
    .line 136
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->H:Ll/jjs;

    .line 137
    .line 138
    iput-boolean v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->I:Z

    .line 139
    .line 140
    iput-boolean v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->J:Z

    .line 141
    .line 142
    return-void
.end method

.method public getReplaceListener()Ll/qxj;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->F:Ll/qxj;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/sjs;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/sjs;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->F:Ll/qxj;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->F:Ll/qxj;

    .line 13
    .line 14
    return-object p0
.end method

.method public isShowing()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->I:Z

    .line 2
    .line 3
    return p0
.end method

.method public l1(Ll/jjs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isPacketGift()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isScrapGift()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    :cond_0
    iget v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->remain:I

    .line 18
    .line 19
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->remain:I

    .line 20
    .line 21
    iget-wide v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->expiredTime:J

    .line 22
    .line 23
    iput-wide v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTime:J

    .line 24
    .line 25
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 26
    .line 27
    iput-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 28
    .line 29
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->expiredTimeText:Ljava/lang/String;

    .line 30
    .line 31
    iput-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTimeText:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->q1(ILjava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->interactStatus:Ljava/lang/String;

    .line 37
    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactStatus:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v0, p2}, Ll/f3e;->f(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 41
    .line 42
    .line 43
    invoke-direct {p0, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->u1(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 44
    .line 45
    .line 46
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->t1(Ll/jjs;)V

    .line 47
    .line 48
    .line 49
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->n0(Ll/jjs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 50
    .line 51
    .line 52
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->setGiftPrice(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final m0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/xjs;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public o1()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->H:Ll/jjs;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {v0}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isPacketGift()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_2

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isScrapGift()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_1
    :goto_0
    return-void

    .line 24
    :cond_2
    :goto_1
    iget v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->remain:I

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTimeText:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->q1(ILjava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->o()V

    .line 13
    .line 14
    .line 15
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->s0()V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->r0()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->m0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public p1(I)V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->q1(ILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q1(ILjava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->s1(I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->q:Lv/VText;

    .line 5
    .line 6
    if-lez p1, :cond_0

    .line 7
    .line 8
    invoke-static {p2}, Ll/cpj;->D(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 17
    .line 18
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->g3:I

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->y:Landroid/animation/Animator;

    .line 28
    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/animation/Animator;->isRunning()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->q:Lv/VText;

    .line 39
    .line 40
    const/4 p2, 0x1

    .line 41
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->p:Lv/VText;

    .line 45
    .line 46
    const/4 p1, 0x0

    .line 47
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public u0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->G:Ll/gjs;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/gjs;->g()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public z0()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->G:Ll/gjs;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->K:I

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    if-ne p0, v0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method
