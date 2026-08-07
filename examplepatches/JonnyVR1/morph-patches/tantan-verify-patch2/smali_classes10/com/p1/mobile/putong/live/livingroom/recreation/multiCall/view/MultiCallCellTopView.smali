.class public Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public A:I

.field public B:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

.field public C:Z

.field public d:Lv/VFrame;

.field public e:Lv/VDraweeView;

.field public f:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;

.field public g:Lv/VLinear;

.field public h:Lv/VImage;

.field public i:Lv/VText;

.field public j:Lv/VLinear;

.field public k:Lv/VImage;

.field public l:Lv/VText;

.field public m:Lv/VText;

.field public n:Lv/VText;

.field public o:Lv/VImage;

.field public p:Landroid/view/View;

.field public q:Lv/VText;

.field public r:Lv/VImage;

.field public s:Lv/VText;

.field public t:Lv/VText;

.field public u:Landroid/widget/Space;

.field public v:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public w:Lv/VDraweeView;

.field public x:Lv/VText;

.field public y:Ll/i6t;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/i6t<",
            "**>;"
        }
    .end annotation
.end field

.field public z:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->z:I

    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->A:I

    .line 8
    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->C:Z

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->z:I

    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->A:I

    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->C:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 16
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->z:I

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->A:I

    .line 19
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->C:Z

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->s0(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;Ll/ar10;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->q0(Ll/ar10;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->r0(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public B0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->C:Z

    .line 3
    .line 4
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->I0(Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->v:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 8
    .line 9
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final D0(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->v:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->G0(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final E0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;)V
    .locals 3

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;->getId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->G0(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;)V

    .line 6
    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->v:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;->getRole()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "player"

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;->getRole()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "spectator"

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    :goto_0
    return-void

    .line 39
    :cond_1
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;->getWinnerUserId()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    const/4 v1, 0x1

    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->v:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 51
    .line 52
    const-string p1, "https://auto.tancdn.com/v1/raw/3f5a1f2d-0489-4bd0-8ec7-0666a02f3c8b12.so"

    .line 53
    .line 54
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_2
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;->getWinnerUserId()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;->getUserId()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->v:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 71
    .line 72
    if-eqz p1, :cond_3

    .line 73
    .line 74
    const-string p1, "https://auto.tancdn.com/v1/raw/c7eec371-945d-47e1-9ea5-ba707903eae812.so"

    .line 75
    .line 76
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_3
    const-string p1, "https://auto.tancdn.com/v1/raw/e17699e3-c1ad-4db4-9329-0e69c893f56b13.so"

    .line 81
    .line 82
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public G0(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->C:Z

    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->I0(Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;->getRole()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "spectator"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->t:Lv/VText;

    .line 23
    .line 24
    const-string p2, "\u65c1\u89c2\u8005"

    .line 25
    .line 26
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->t:Lv/VText;

    .line 30
    .line 31
    const/4 p2, 0x0

    .line 32
    invoke-virtual {p1, p2, p2, p2, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->t:Lv/VText;

    .line 36
    .line 37
    sget v0, Ll/obc0;->b0:I

    .line 38
    .line 39
    invoke-static {v0}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->t:Lv/VText;

    .line 47
    .line 48
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;->getRole()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const-string v1, "player"

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_2

    .line 63
    .line 64
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->J0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->t:Lv/VText;

    .line 68
    .line 69
    new-instance v1, Ll/kc10;

    .line 70
    .line 71
    invoke-direct {v1, p0, p1, p2}, Ll/kc10;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;)V

    .line 72
    .line 73
    .line 74
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 75
    .line 76
    .line 77
    :cond_2
    :goto_0
    return-void
.end method

.method public H0(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->s:Lv/VText;

    .line 2
    .line 3
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ll/p6s;->u0()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x0

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->C:Z

    .line 15
    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move v1, v2

    .line 21
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x2

    .line 25
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->s:Lv/VText;

    .line 30
    .line 31
    const/4 v3, 0x0

    .line 32
    if-nez v0, :cond_2

    .line 33
    .line 34
    iget-wide v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->receivedRewardPoint:J

    .line 35
    .line 36
    long-to-double v4, v4

    .line 37
    invoke-static {v4, v5}, Ll/yau;->c(D)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    sget-object p1, Ll/htd0;->f:Ll/htd0;

    .line 45
    .line 46
    invoke-static {p1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    check-cast p1, Ll/civ;

    .line 51
    .line 52
    invoke-virtual {p1}, Ll/civ;->n()Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_1

    .line 57
    .line 58
    sget p1, Ll/obc0;->X3:I

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_1
    sget p1, Ll/obc0;->V3:I

    .line 62
    .line 63
    :goto_1
    invoke-static {p1}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    const/high16 v0, 0x41200000    # 10.0f

    .line 68
    .line 69
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    invoke-virtual {p1, v2, v2, v1, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->s:Lv/VText;

    .line 81
    .line 82
    const/high16 v1, 0x40000000    # 2.0f

    .line 83
    .line 84
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->s:Lv/VText;

    .line 92
    .line 93
    invoke-virtual {p0, p1, v3, v3, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_2
    invoke-virtual {v1, v3, v3, v3, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 98
    .line 99
    .line 100
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->s:Lv/VText;

    .line 101
    .line 102
    new-instance v0, Ljava/lang/StringBuilder;

    .line 103
    .line 104
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 105
    .line 106
    .line 107
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->receivedRewardPoint:J

    .line 108
    .line 109
    long-to-double v1, v1

    .line 110
    invoke-static {v1, v2}, Ll/yau;->c(D)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    invoke-virtual {p1}, Ll/p6s;->s0()Z

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    if-eqz p1, :cond_3

    .line 126
    .line 127
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->C7:I

    .line 128
    .line 129
    goto :goto_2

    .line 130
    :cond_3
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->V5:I

    .line 131
    .line 132
    :goto_2
    invoke-static {p1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method public I0(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->t:Lv/VText;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->s:Lv/VText;

    .line 7
    .line 8
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ll/p6s;->u0()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/4 v2, 0x0

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    xor-int/2addr p1, v1

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->B:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    move v3, v1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move v3, v2

    .line 28
    :goto_0
    and-int/2addr p1, v3

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userId:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-nez p0, :cond_1

    .line 38
    .line 39
    move v2, v1

    .line 40
    :cond_1
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public J0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;)V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto/16 :goto_1

    .line 4
    .line 5
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;->getRole()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "player"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_6

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->t:Lv/VText;

    .line 18
    .line 19
    new-instance v1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;->getPoint()J

    .line 25
    .line 26
    .line 27
    move-result-wide v2

    .line 28
    long-to-double v2, v2

    .line 29
    invoke-static {v2, v3}, Ll/yau;->c(D)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v2, ""

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->t:Lv/VText;

    .line 49
    .line 50
    sget v1, Ll/obc0;->b0:I

    .line 51
    .line 52
    invoke-static {v1}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;->getPoint()J

    .line 60
    .line 61
    .line 62
    move-result-wide v0

    .line 63
    const-wide/16 v2, 0x0

    .line 64
    .line 65
    cmp-long v0, v0, v2

    .line 66
    .line 67
    if-nez v0, :cond_1

    .line 68
    .line 69
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    sget v0, Ll/obc0;->b4:I

    .line 74
    .line 75
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    goto :goto_0

    .line 80
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;->getRank()J

    .line 81
    .line 82
    .line 83
    move-result-wide v0

    .line 84
    const-wide/16 v2, 0x1

    .line 85
    .line 86
    cmp-long v0, v0, v2

    .line 87
    .line 88
    if-nez v0, :cond_2

    .line 89
    .line 90
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    sget v0, Ll/obc0;->Z3:I

    .line 95
    .line 96
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->t:Lv/VText;

    .line 101
    .line 102
    sget v1, Ll/obc0;->a4:I

    .line 103
    .line 104
    invoke-static {v1}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;->getRank()J

    .line 113
    .line 114
    .line 115
    move-result-wide v0

    .line 116
    const-wide/16 v2, 0x2

    .line 117
    .line 118
    cmp-long v0, v0, v2

    .line 119
    .line 120
    if-nez v0, :cond_3

    .line 121
    .line 122
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    sget v0, Ll/obc0;->c4:I

    .line 127
    .line 128
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    goto :goto_0

    .line 133
    :cond_3
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;->getRank()J

    .line 134
    .line 135
    .line 136
    move-result-wide v0

    .line 137
    const-wide/16 v2, 0x3

    .line 138
    .line 139
    cmp-long v0, v0, v2

    .line 140
    .line 141
    if-nez v0, :cond_4

    .line 142
    .line 143
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    sget v0, Ll/obc0;->d4:I

    .line 148
    .line 149
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    goto :goto_0

    .line 154
    :cond_4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;->getRank()J

    .line 155
    .line 156
    .line 157
    move-result-wide v0

    .line 158
    const-wide/16 v2, 0x4

    .line 159
    .line 160
    cmp-long p1, v0, v2

    .line 161
    .line 162
    if-nez p1, :cond_5

    .line 163
    .line 164
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    sget v0, Ll/obc0;->Y3:I

    .line 169
    .line 170
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    goto :goto_0

    .line 175
    :cond_5
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    sget v0, Ll/obc0;->b4:I

    .line 180
    .line 181
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    :goto_0
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    const/4 v2, 0x0

    .line 194
    invoke-virtual {p1, v2, v2, v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 195
    .line 196
    .line 197
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->t:Lv/VText;

    .line 198
    .line 199
    const/4 v0, 0x0

    .line 200
    invoke-virtual {p0, p1, v0, v0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 201
    .line 202
    .line 203
    :cond_6
    :goto_1
    return-void
.end method

.method public K0(Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "2x2"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->A:I

    .line 11
    .line 12
    if-eq p1, v1, :cond_1

    .line 13
    .line 14
    const/4 v0, 0x4

    .line 15
    if-ne p1, v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget p1, Ll/n9c0;->J:I

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_1
    :goto_0
    sget p1, Ll/n9c0;->g1:I

    .line 22
    .line 23
    :goto_1
    invoke-static {p1}, Ll/n3d0;->a(I)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_2
    const-string v0, "1plus8"

    .line 32
    .line 33
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->A:I

    .line 38
    .line 39
    const/4 v2, 0x2

    .line 40
    if-eqz p1, :cond_5

    .line 41
    .line 42
    if-eq v0, v2, :cond_4

    .line 43
    .line 44
    const/4 p1, 0x5

    .line 45
    if-eq v0, p1, :cond_4

    .line 46
    .line 47
    const/4 p1, 0x6

    .line 48
    if-eq v0, p1, :cond_4

    .line 49
    .line 50
    const/16 p1, 0x9

    .line 51
    .line 52
    if-ne v0, p1, :cond_3

    .line 53
    .line 54
    goto :goto_2

    .line 55
    :cond_3
    sget p1, Ll/n9c0;->J:I

    .line 56
    .line 57
    goto :goto_3

    .line 58
    :cond_4
    :goto_2
    sget p1, Ll/n9c0;->g1:I

    .line 59
    .line 60
    :goto_3
    invoke-static {p1}, Ll/n3d0;->a(I)I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_5
    if-ne v0, v1, :cond_6

    .line 69
    .line 70
    sget p1, Ll/n9c0;->f1:I

    .line 71
    .line 72
    invoke-static {p1}, Ll/n3d0;->a(I)I

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_6
    rem-int/2addr v0, v2

    .line 81
    if-nez v0, :cond_7

    .line 82
    .line 83
    sget p1, Ll/n9c0;->g1:I

    .line 84
    .line 85
    goto :goto_4

    .line 86
    :cond_7
    sget p1, Ll/n9c0;->J:I

    .line 87
    .line 88
    :goto_4
    invoke-static {p1}, Ll/n3d0;->a(I)I

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public final k0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/nc10;->a(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final l0(IIIIIIZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->w:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 10
    .line 11
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 12
    .line 13
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->x:Lv/VText;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 24
    .line 25
    iput p2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->x:Lv/VText;

    .line 28
    .line 29
    int-to-float p2, p3

    .line 30
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->x:Lv/VText;

    .line 34
    .line 35
    invoke-virtual {p1, p5, p4, p5, p4}, Landroid/view/View;->setPadding(IIII)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->x:Lv/VText;

    .line 39
    .line 40
    const/4 p1, 0x0

    .line 41
    if-eqz p7, :cond_2

    .line 42
    .line 43
    const/high16 p2, -0x1000000

    .line 44
    .line 45
    int-to-float p3, p6

    .line 46
    invoke-static {p2, p3, p1}, Ll/fc2;->a(IFZ)Landroid/graphics/drawable/Drawable;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    goto :goto_0

    .line 51
    :cond_2
    const p2, -0x181e3

    .line 52
    .line 53
    .line 54
    int-to-float p3, p6

    .line 55
    invoke-static {p2, p3, p1}, Ll/fc2;->a(IFZ)Landroid/graphics/drawable/Drawable;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final m0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->q:Lv/VText;

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
    const/4 v1, -0x1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->r:I

    .line 13
    .line 14
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->k:I

    .line 15
    .line 16
    sget p1, Ll/mdc0;->y2:I

    .line 17
    .line 18
    iput p1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->j:I

    .line 19
    .line 20
    iput p1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->q:I

    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->q:Lv/VText;

    .line 23
    .line 24
    const/high16 v1, 0x41200000    # 10.0f

    .line 25
    .line 26
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->s:Lv/VText;

    .line 30
    .line 31
    const/high16 v1, 0x41000000    # 8.0f

    .line 32
    .line 33
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->q:Lv/VText;

    .line 37
    .line 38
    const v1, 0x800003

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    sget p1, Ll/mdc0;->M1:I

    .line 46
    .line 47
    iput p1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->r:I

    .line 48
    .line 49
    iput p1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->k:I

    .line 50
    .line 51
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->j:I

    .line 52
    .line 53
    iput v1, v0, Landroidx/constraintlayout/widget/ConstraintLayout$a;->q:I

    .line 54
    .line 55
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->q:Lv/VText;

    .line 56
    .line 57
    const/high16 v1, 0x41400000    # 12.0f

    .line 58
    .line 59
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->s:Lv/VText;

    .line 63
    .line 64
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->q:Lv/VText;

    .line 68
    .line 69
    const v1, 0x800005

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 73
    .line 74
    .line 75
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->q:Lv/VText;

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public final n0(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/bf10;->S(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    invoke-static {p1}, Ll/fn10;->f(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userId:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p0}, Ll/bf10;->W(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->I8:I

    .line 22
    .line 23
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->c8:I

    .line 29
    .line 30
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    invoke-static {p1}, Ll/bf10;->T(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_2

    .line 40
    .line 41
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->J8:I

    .line 42
    .line 43
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    goto :goto_0

    .line 48
    :cond_2
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->e8:I

    .line 49
    .line 50
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    :goto_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-nez p1, :cond_3

    .line 59
    .line 60
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    :cond_3
    return-void
.end method

.method public o0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->w:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->x:Lv/VText;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->g:Lv/VLinear;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->B:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 15
    .line 16
    invoke-static {p0}, Ll/fp10;->d(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    xor-int/lit8 p0, p0, 0x1

    .line 21
    .line 22
    invoke-static {v0, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->k0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->r:Lv/VImage;

    .line 8
    .line 9
    sget v1, Ll/qa00;->f:I

    .line 10
    .line 11
    int-to-float v1, v1

    .line 12
    const v2, -0x181e3

    .line 13
    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    invoke-static {v2, v1, v3}, Ll/fc2;->a(IFZ)Landroid/graphics/drawable/Drawable;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->n:Lv/VText;

    .line 24
    .line 25
    sget v0, Ll/qa00;->h:I

    .line 26
    .line 27
    int-to-float v0, v0

    .line 28
    invoke-static {v2, v0, v3}, Ll/fc2;->a(IFZ)Landroid/graphics/drawable/Drawable;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public p0()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final synthetic q0(Ll/ar10;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/ar10;->k4()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-static {p2}, Ll/jr10;->b(Z)V

    .line 6
    .line 7
    .line 8
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->A:I

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Ll/ar10;->e4(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic r0(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->n0(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic s0(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->y:Ll/i6t;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->clickPkBoard()Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance p3, Landroid/util/Pair;

    .line 14
    .line 15
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;->getUserId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-direct {p3, p1, p2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p3}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public setFollowView(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->r:Lv/VImage;

    .line 2
    .line 3
    xor-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setViewPosition(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->A:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->m:Lv/VText;

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public t0(ZLjava/lang/Float;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->f:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->z:I

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->f:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;

    .line 12
    .line 13
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->h(F)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->z:I

    .line 22
    .line 23
    add-int/lit8 p1, p1, 0x1

    .line 24
    .line 25
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->z:I

    .line 26
    .line 27
    const/4 p2, 0x5

    .line 28
    if-le p1, p2, :cond_1

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->f:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/LiveWaveVoiceView;->i()V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public u0(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Ll/i6t;Ljava/lang/String;)V
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;",
            "Ll/i6t<",
            "**>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->B:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 7
    .line 8
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->y:Ll/i6t;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->w:Lv/VDraweeView;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->x:Lv/VText;

    .line 17
    .line 18
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->K0(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->isLeadRole:Z

    .line 28
    .line 29
    if-eqz v3, :cond_0

    .line 30
    .line 31
    move v3, v1

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    move v3, v2

    .line 34
    :goto_0
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->m:Lv/VText;

    .line 35
    .line 36
    xor-int/lit8 v5, v3, 0x1

    .line 37
    .line 38
    invoke-static {v4, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->n:Lv/VText;

    .line 42
    .line 43
    invoke-static {v4, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    invoke-static {p1}, Ll/fp10;->d(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    if-eqz v3, :cond_2

    .line 51
    .line 52
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->g:Lv/VLinear;

    .line 53
    .line 54
    invoke-static {v3, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->q:Lv/VText;

    .line 58
    .line 59
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->p:Landroid/view/View;

    .line 63
    .line 64
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->q:Lv/VText;

    .line 68
    .line 69
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userName:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->H0(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 75
    .line 76
    .line 77
    sget-object v3, Ll/cd10;->i:Ljava/lang/String;

    .line 78
    .line 79
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->category:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->d:Lv/VFrame;

    .line 86
    .line 87
    if-eqz v3, :cond_1

    .line 88
    .line 89
    invoke-static {v4, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0, v2, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->t0(ZLjava/lang/Float;)V

    .line 93
    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_1
    invoke-static {v4, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->e:Lv/VDraweeView;

    .line 100
    .line 101
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userAvatar:Ljava/lang/String;

    .line 102
    .line 103
    const/high16 v4, 0x40c00000    # 6.0f

    .line 104
    .line 105
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 106
    .line 107
    .line 108
    move-result v4

    .line 109
    invoke-static {v0, v3, v1, v4}, Ll/izs;->q(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 110
    .line 111
    .line 112
    :goto_1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->y0(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Ll/i6t;)V

    .line 113
    .line 114
    .line 115
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->j:Lv/VLinear;

    .line 116
    .line 117
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->isAway:Z

    .line 118
    .line 119
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 120
    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_2
    if-eqz p1, :cond_3

    .line 124
    .line 125
    sget-object v3, Ll/cd10;->J:Ljava/lang/String;

    .line 126
    .line 127
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->state:Ljava/lang/String;

    .line 128
    .line 129
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v3

    .line 133
    if-eqz v3, :cond_4

    .line 134
    .line 135
    :cond_3
    invoke-static {p2}, Ll/bf10;->D(Ll/i6t;)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p2

    .line 139
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->d:Lv/VFrame;

    .line 140
    .line 141
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {p0, v2, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->t0(ZLjava/lang/Float;)V

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->q:Lv/VText;

    .line 148
    .line 149
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 150
    .line 151
    .line 152
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->s:Lv/VText;

    .line 153
    .line 154
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 155
    .line 156
    .line 157
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->p:Landroid/view/View;

    .line 158
    .line 159
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 160
    .line 161
    .line 162
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->j:Lv/VLinear;

    .line 163
    .line 164
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 165
    .line 166
    .line 167
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->o:Lv/VImage;

    .line 168
    .line 169
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 170
    .line 171
    .line 172
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->g:Lv/VLinear;

    .line 173
    .line 174
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 175
    .line 176
    .line 177
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->t:Lv/VText;

    .line 178
    .line 179
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 180
    .line 181
    .line 182
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->g:Lv/VLinear;

    .line 183
    .line 184
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->setFollowView(Z)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->v0(Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    :cond_4
    :goto_2
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->B:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 194
    .line 195
    if-nez p2, :cond_5

    .line 196
    .line 197
    goto :goto_6

    .line 198
    :cond_5
    const-string p2, "1plus8"

    .line 199
    .line 200
    invoke-static {p3, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 201
    .line 202
    .line 203
    move-result v0

    .line 204
    const/4 v3, 0x6

    .line 205
    if-eqz v0, :cond_7

    .line 206
    .line 207
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->q:Lv/VText;

    .line 208
    .line 209
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->B:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 210
    .line 211
    iget v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->position:I

    .line 212
    .line 213
    if-ne v4, v1, :cond_6

    .line 214
    .line 215
    goto :goto_3

    .line 216
    :cond_6
    const/4 v3, 0x5

    .line 217
    :goto_3
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setMaxEms(I)V

    .line 218
    .line 219
    .line 220
    goto :goto_5

    .line 221
    :cond_7
    const-string v0, "1plus5"

    .line 222
    .line 223
    invoke-static {p3, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 224
    .line 225
    .line 226
    move-result v0

    .line 227
    const/4 v4, 0x3

    .line 228
    if-eqz v0, :cond_9

    .line 229
    .line 230
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->q:Lv/VText;

    .line 231
    .line 232
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->B:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 233
    .line 234
    iget v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->position:I

    .line 235
    .line 236
    if-ne v5, v1, :cond_8

    .line 237
    .line 238
    goto :goto_4

    .line 239
    :cond_8
    move v3, v4

    .line 240
    :goto_4
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setMaxEms(I)V

    .line 241
    .line 242
    .line 243
    goto :goto_5

    .line 244
    :cond_9
    const-string v0, "2x2"

    .line 245
    .line 246
    invoke-static {p3, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 247
    .line 248
    .line 249
    move-result v0

    .line 250
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->q:Lv/VText;

    .line 251
    .line 252
    if-eqz v0, :cond_a

    .line 253
    .line 254
    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setMaxEms(I)V

    .line 255
    .line 256
    .line 257
    goto :goto_5

    .line 258
    :cond_a
    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setMaxEms(I)V

    .line 259
    .line 260
    .line 261
    :goto_5
    if-eqz p1, :cond_c

    .line 262
    .line 263
    invoke-static {p3, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 264
    .line 265
    .line 266
    move-result p2

    .line 267
    if-eqz p2, :cond_b

    .line 268
    .line 269
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->position:I

    .line 270
    .line 271
    if-eq p1, v1, :cond_b

    .line 272
    .line 273
    move v2, v1

    .line 274
    :cond_b
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->m0(Z)V

    .line 275
    .line 276
    .line 277
    :cond_c
    :goto_6
    return-void
.end method

.method public final v0(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/fn10;->k(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->h:Lv/VImage;

    .line 8
    .line 9
    sget v0, Ll/obc0;->O3:I

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->i:Lv/VText;

    .line 15
    .line 16
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->z8:I

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-static {p1}, Ll/fn10;->g(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_3

    .line 27
    .line 28
    invoke-static {p1}, Ll/fn10;->c(Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_3

    .line 33
    .line 34
    invoke-static {p1}, Ll/fn10;->p(Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    invoke-static {p1}, Ll/fn10;->o(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_2

    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->h:Lv/VImage;

    .line 48
    .line 49
    sget v0, Ll/obc0;->O3:I

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->i:Lv/VText;

    .line 55
    .line 56
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->E8:I

    .line 57
    .line 58
    invoke-static {p1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    :cond_2
    return-void

    .line 66
    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->h:Lv/VImage;

    .line 67
    .line 68
    sget v0, Ll/obc0;->d2:I

    .line 69
    .line 70
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->i:Lv/VText;

    .line 74
    .line 75
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->E8:I

    .line 76
    .line 77
    invoke-static {p1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public w0(Ll/ar10;ZLjava/lang/String;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ar10<",
            "*>;Z",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->w:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v3, 0x1

    .line 4
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->x:Lv/VText;

    .line 8
    .line 9
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->g:Lv/VLinear;

    .line 13
    .line 14
    const/4 v4, 0x0

    .line 15
    invoke-static {v2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    const-string v2, "2x2"

    .line 19
    .line 20
    invoke-static {p3, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    sget v1, Ll/qa00;->G:I

    .line 27
    .line 28
    const/high16 v2, 0x42480000    # 50.0f

    .line 29
    .line 30
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    sget v4, Ll/qa00;->g:I

    .line 35
    .line 36
    sget v5, Ll/qa00;->h:I

    .line 37
    .line 38
    const/16 v3, 0xc

    .line 39
    .line 40
    move v6, v4

    .line 41
    move-object v0, p0

    .line 42
    move v7, p2

    .line 43
    invoke-virtual/range {v0 .. v7}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->l0(IIIIIIZ)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    const-string v2, "1plus8"

    .line 48
    .line 49
    invoke-static {p3, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    const/high16 v2, 0x42180000    # 38.0f

    .line 54
    .line 55
    if-eqz v1, :cond_1

    .line 56
    .line 57
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->A:I

    .line 58
    .line 59
    if-le v1, v3, :cond_1

    .line 60
    .line 61
    sget v1, Ll/qa00;->v:I

    .line 62
    .line 63
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    sget v4, Ll/qa00;->e:I

    .line 68
    .line 69
    sget v5, Ll/qa00;->g:I

    .line 70
    .line 71
    const/16 v3, 0x9

    .line 72
    .line 73
    move v6, v5

    .line 74
    move-object v0, p0

    .line 75
    move v7, p2

    .line 76
    invoke-virtual/range {v0 .. v7}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->l0(IIIIIIZ)V

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_1
    sget v1, Ll/qa00;->A:I

    .line 81
    .line 82
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    const/high16 v0, 0x40e00000    # 7.0f

    .line 87
    .line 88
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 89
    .line 90
    .line 91
    move-result v4

    .line 92
    sget v5, Ll/qa00;->i:I

    .line 93
    .line 94
    const v0, 0x410b3333    # 8.7f

    .line 95
    .line 96
    .line 97
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 98
    .line 99
    .line 100
    move-result v6

    .line 101
    const/16 v3, 0xa

    .line 102
    .line 103
    move-object v0, p0

    .line 104
    move v7, p2

    .line 105
    invoke-virtual/range {v0 .. v7}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->l0(IIIIIIZ)V

    .line 106
    .line 107
    .line 108
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->w:Lv/VDraweeView;

    .line 109
    .line 110
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 111
    .line 112
    invoke-virtual {v2}, Ll/wrv;->V()Lcom/p1/mobile/putong/data/User;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    const-string v3, "context_livingAct"

    .line 117
    .line 118
    invoke-static {v3, v1, v2}, Ll/izs;->n(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/User;)V

    .line 119
    .line 120
    .line 121
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->x:Lv/VText;

    .line 122
    .line 123
    xor-int/lit8 v2, p2, 0x1

    .line 124
    .line 125
    invoke-static {v1, v2}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 126
    .line 127
    .line 128
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->x:Lv/VText;

    .line 129
    .line 130
    if-eqz p2, :cond_2

    .line 131
    .line 132
    sget v2, Ll/n9c0;->j1:I

    .line 133
    .line 134
    goto :goto_1

    .line 135
    :cond_2
    sget v2, Ll/n9c0;->e1:I

    .line 136
    .line 137
    :goto_1
    invoke-static {v2}, Ll/n3d0;->a(I)I

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 142
    .line 143
    .line 144
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->x:Lv/VText;

    .line 145
    .line 146
    if-eqz p2, :cond_3

    .line 147
    .line 148
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->K7:I

    .line 149
    .line 150
    goto :goto_2

    .line 151
    :cond_3
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->N6:I

    .line 152
    .line 153
    :goto_2
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 154
    .line 155
    .line 156
    if-nez p2, :cond_4

    .line 157
    .line 158
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->x:Lv/VText;

    .line 159
    .line 160
    new-instance v2, Ll/lc10;

    .line 161
    .line 162
    invoke-direct {v2, p0, p1}, Ll/lc10;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;Ll/ar10;)V

    .line 163
    .line 164
    .line 165
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 166
    .line 167
    .line 168
    :cond_4
    return-void
.end method

.method public final y0(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Ll/i6t;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;",
            "Ll/i6t<",
            "**>;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2}, Ll/bf10;->R(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Ll/i6t;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->o:Lv/VImage;

    .line 6
    .line 7
    invoke-static {v0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->o:Lv/VImage;

    .line 11
    .line 12
    new-instance v0, Ll/mc10;

    .line 13
    .line 14
    invoke-direct {v0, p0, p1}, Ll/mc10;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public z0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;->getStage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    const-string v1, "punishing"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    const-string v1, "playing"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->B0()V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;->getId()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->D0(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->E0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPk;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method
