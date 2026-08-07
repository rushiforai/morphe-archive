.class public Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;
.super Lv/VFrame;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lv/VFrame;",
        "Ll/iam<",
        "Ll/jjo0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VFrame;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Landroid/view/View;

.field public e:Lv/VLinear;

.field public f:Lv/VDraweeView;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Ll/jjo0;

.field public j:Ljava/lang/String;

.field public k:Landroid/animation/Animator;

.field public l:Ll/kcg0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->K()V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->G()V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->P(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->M()V

    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->O(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->L()V

    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->N(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public C(Ll/jjo0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->i:Ll/jjo0;

    .line 2
    .line 3
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public E()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->T(Z)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->l:Ll/kcg0;

    .line 6
    .line 7
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->k:Landroid/animation/Animator;

    .line 11
    .line 12
    invoke-static {p0}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final F(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->i:Ll/jjo0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance v0, Ll/bae0$a;

    .line 14
    .line 15
    const/16 v1, 0x1b64

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ll/bae0$a;-><init>(I)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->textDrawer:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;->jumpScheme:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ll/bae0$a;->e(Ljava/lang/String;)Ll/bae0$a;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p1}, Ll/bae0$a;->c()Ll/bae0;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final synthetic G()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->i:Ll/jjo0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/jjo0;->T3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic K()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->e:Lv/VLinear;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->a:Lv/VFrame;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->e:Lv/VLinear;

    .line 14
    .line 15
    const/high16 v1, 0x3f800000    # 1.0f

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->e:Lv/VLinear;

    .line 21
    .line 22
    const/high16 v1, 0x42a00000    # 80.0f

    .line 23
    .line 24
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    int-to-float v1, v1

    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotX(F)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->e:Lv/VLinear;

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    invoke-virtual {p0, v0}, Landroid/view/View;->setPivotY(F)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic L()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->a:Lv/VFrame;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->a:Lv/VFrame;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic M()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->e:Lv/VLinear;

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

.method public final synthetic N(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->F(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic O(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->F(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic P(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;Ljava/lang/Long;)V
    .locals 4

    .line 1
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x1

    .line 6
    .line 7
    add-long/2addr v0, v2

    .line 8
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->Q(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;Ljava/lang/Long;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final Q(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;Ljava/lang/Long;)V
    .locals 6

    .line 1
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->endTime:J

    .line 2
    .line 3
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->currentTime:J

    .line 4
    .line 5
    sub-long/2addr v0, v2

    .line 6
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 7
    .line 8
    .line 9
    move-result-wide v2

    .line 10
    const-wide/16 v4, 0x3e8

    .line 11
    .line 12
    mul-long/2addr v2, v4

    .line 13
    sub-long/2addr v0, v2

    .line 14
    const-wide/16 v2, 0x0

    .line 15
    .line 16
    cmp-long p2, v0, v2

    .line 17
    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->b:Lv/VText;

    .line 19
    .line 20
    if-lez p2, :cond_0

    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/kdu;->Q(J)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->endText:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    const-string p2, "refresh"

    .line 36
    .line 37
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->actionType:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    if-eqz p2, :cond_1

    .line 44
    .line 45
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->i:Ll/jjo0;

    .line 46
    .line 47
    invoke-virtual {p2}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    new-instance v0, Ll/qjo0;

    .line 52
    .line 53
    invoke-direct {v0, p0}, Ll/qjo0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;)V

    .line 54
    .line 55
    .line 56
    iget-wide p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->randomDelaySeconds:J

    .line 57
    .line 58
    mul-long/2addr p0, v4

    .line 59
    invoke-static {p2, v0, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 60
    .line 61
    .line 62
    :cond_1
    return-void
.end method

.method public R()V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->e:Lv/VLinear;

    .line 4
    .line 5
    sget-object v2, Ll/gt0;->i:Landroid/util/Property;

    .line 6
    .line 7
    sget-object v7, Ll/gt0;->d:Landroid/view/animation/Interpolator;

    .line 8
    .line 9
    const/4 v9, 0x2

    .line 10
    new-array v8, v9, [F

    .line 11
    .line 12
    fill-array-data v8, :array_0

    .line 13
    .line 14
    .line 15
    const-wide/16 v3, 0x0

    .line 16
    .line 17
    const-wide/16 v5, 0x1f4

    .line 18
    .line 19
    invoke-static/range {v1 .. v8}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    new-instance v2, Ll/mjo0;

    .line 24
    .line 25
    invoke-direct {v2, v0}, Ll/mjo0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1, v2}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 29
    .line 30
    .line 31
    iget-object v2, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->e:Lv/VLinear;

    .line 32
    .line 33
    sget-object v3, Ll/gt0;->i:Landroid/util/Property;

    .line 34
    .line 35
    new-array v4, v9, [F

    .line 36
    .line 37
    fill-array-data v4, :array_1

    .line 38
    .line 39
    .line 40
    invoke-static {v2, v3, v4}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    const-wide/16 v3, 0x12c

    .line 45
    .line 46
    invoke-virtual {v2, v3, v4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    iget-object v10, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->e:Lv/VLinear;

    .line 51
    .line 52
    new-array v3, v9, [F

    .line 53
    .line 54
    fill-array-data v3, :array_2

    .line 55
    .line 56
    .line 57
    sget-object v11, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 58
    .line 59
    const-wide/16 v12, 0x96

    .line 60
    .line 61
    const-wide/16 v14, 0x96

    .line 62
    .line 63
    const/16 v16, 0x0

    .line 64
    .line 65
    move-object/from16 v17, v3

    .line 66
    .line 67
    invoke-static/range {v10 .. v17}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    filled-new-array {v2, v3}, [Landroid/animation/Animator;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-static {v2}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    sget-object v3, Ll/gt0;->f:Landroid/view/animation/Interpolator;

    .line 80
    .line 81
    invoke-virtual {v2, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 82
    .line 83
    .line 84
    new-instance v3, Ll/njo0;

    .line 85
    .line 86
    invoke-direct {v3, v0}, Ll/njo0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v2, v3}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 90
    .line 91
    .line 92
    new-instance v3, Ll/ojo0;

    .line 93
    .line 94
    invoke-direct {v3, v0}, Ll/ojo0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;)V

    .line 95
    .line 96
    .line 97
    invoke-static {v2, v3}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 98
    .line 99
    .line 100
    iget-object v3, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->d:Landroid/view/View;

    .line 101
    .line 102
    const/high16 v4, 0x41200000    # 10.0f

    .line 103
    .line 104
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 105
    .line 106
    .line 107
    move-result v4

    .line 108
    int-to-float v4, v4

    .line 109
    new-array v5, v9, [F

    .line 110
    .line 111
    const/4 v6, 0x0

    .line 112
    aput v4, v5, v6

    .line 113
    .line 114
    const/4 v4, 0x1

    .line 115
    const/4 v6, 0x0

    .line 116
    aput v6, v5, v4

    .line 117
    .line 118
    sget-object v4, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 119
    .line 120
    invoke-static {v3, v4, v5}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    iget-object v4, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->a:Lv/VFrame;

    .line 125
    .line 126
    new-array v5, v9, [F

    .line 127
    .line 128
    fill-array-data v5, :array_3

    .line 129
    .line 130
    .line 131
    invoke-static {v4, v11, v5}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 132
    .line 133
    .line 134
    move-result-object v4

    .line 135
    filled-new-array {v3, v4}, [Landroid/animation/Animator;

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    invoke-static {v3}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    const-wide/16 v4, 0x64

    .line 144
    .line 145
    invoke-virtual {v3, v4, v5}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 146
    .line 147
    .line 148
    move-result-object v3

    .line 149
    const/16 v4, 0x7d0

    .line 150
    .line 151
    invoke-static {v4}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 152
    .line 153
    .line 154
    move-result-object v4

    .line 155
    filled-new-array {v1, v4, v2, v3}, [Landroid/animation/Animator;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    invoke-static {v1}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->k:Landroid/animation/Animator;

    .line 164
    .line 165
    invoke-virtual {v1}, Landroid/animation/Animator;->start()V

    .line 166
    .line 167
    .line 168
    return-void

    .line 169
    :array_0
    .array-data 4
        0x3e99999a    # 0.3f
        0x3f800000    # 1.0f
    .end array-data

    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3e99999a    # 0.3f
    .end array-data

    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    :array_3
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public S(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->T(Z)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->l:Ll/kcg0;

    .line 6
    .line 7
    invoke-static {v1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->f:Lv/VDraweeView;

    .line 11
    .line 12
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

    .line 13
    .line 14
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->textDrawer:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;

    .line 15
    .line 16
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;->iconUrl:Ljava/lang/String;

    .line 17
    .line 18
    const-string v3, "context_livingAct"

    .line 19
    .line 20
    invoke-static {v3, v1, v2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->g:Lv/VText;

    .line 24
    .line 25
    new-instance v2, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

    .line 31
    .line 32
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->textDrawer:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;

    .line 33
    .line 34
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;->content:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawerContent;

    .line 35
    .line 36
    iget v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawerContent;->amount:I

    .line 37
    .line 38
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v3, ""

    .line 42
    .line 43
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->e:Lv/VLinear;

    .line 54
    .line 55
    new-instance v2, Ll/kjo0;

    .line 56
    .line 57
    invoke-direct {v2, p0, p1}, Ll/kjo0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 61
    .line 62
    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->a:Lv/VFrame;

    .line 64
    .line 65
    new-instance v2, Ll/ljo0;

    .line 66
    .line 67
    invoke-direct {v2, p0, p1}, Ll/ljo0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 71
    .line 72
    .line 73
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->title:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemTitle;

    .line 74
    .line 75
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemTitle;->countdown:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;

    .line 76
    .line 77
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemTitle;->titleType:Lcom/p1/mobile/putong/live/base/data/BLiveOperationTitleType;

    .line 78
    .line 79
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    const-string v3, "countdown"

    .line 84
    .line 85
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-eqz v1, :cond_0

    .line 90
    .line 91
    if-eqz v2, :cond_0

    .line 92
    .line 93
    iget-wide v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->endTime:J

    .line 94
    .line 95
    iget-wide v5, v2, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->currentTime:J

    .line 96
    .line 97
    sub-long/2addr v3, v5

    .line 98
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->b:Lv/VText;

    .line 99
    .line 100
    invoke-static {v3, v4}, Ll/kdu;->Q(J)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 105
    .line 106
    .line 107
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->b:Lv/VText;

    .line 108
    .line 109
    sget v3, Ll/obc0;->Y:I

    .line 110
    .line 111
    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 112
    .line 113
    .line 114
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->b:Lv/VText;

    .line 115
    .line 116
    const-string v3, "#FFE8BB"

    .line 117
    .line 118
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 119
    .line 120
    .line 121
    move-result v3

    .line 122
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->V(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;)V

    .line 126
    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->b:Lv/VText;

    .line 130
    .line 131
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->title:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemTitle;

    .line 132
    .line 133
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemTitle;->text:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemTitleText;

    .line 134
    .line 135
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemTitleText;->content:Ljava/lang/String;

    .line 136
    .line 137
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 138
    .line 139
    .line 140
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->b:Lv/VText;

    .line 141
    .line 142
    sget v2, Ll/obc0;->t0:I

    .line 143
    .line 144
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 145
    .line 146
    .line 147
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->b:Lv/VText;

    .line 148
    .line 149
    const-string v2, "#ffffff"

    .line 150
    .line 151
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 152
    .line 153
    .line 154
    move-result v2

    .line 155
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 156
    .line 157
    .line 158
    :goto_0
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->icon:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemIcon;

    .line 159
    .line 160
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemIcon;->label:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemLabel;

    .line 161
    .line 162
    const/4 v2, 0x0

    .line 163
    if-eqz v1, :cond_1

    .line 164
    .line 165
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemLabel;->content:Ljava/lang/String;

    .line 166
    .line 167
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->c:Lv/VText;

    .line 168
    .line 169
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 170
    .line 171
    .line 172
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->c:Lv/VText;

    .line 173
    .line 174
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    xor-int/2addr v1, v0

    .line 179
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 180
    .line 181
    .line 182
    goto :goto_1

    .line 183
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->c:Lv/VText;

    .line 184
    .line 185
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 186
    .line 187
    .line 188
    :goto_1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

    .line 189
    .line 190
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->textDrawer:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;

    .line 191
    .line 192
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;->content:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawerContent;

    .line 193
    .line 194
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawerContent;->id:Ljava/lang/String;

    .line 195
    .line 196
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->j:Ljava/lang/String;

    .line 197
    .line 198
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 199
    .line 200
    .line 201
    move-result v1

    .line 202
    if-eqz v1, :cond_3

    .line 203
    .line 204
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->k:Landroid/animation/Animator;

    .line 205
    .line 206
    invoke-virtual {p1}, Landroid/animation/Animator;->isRunning()Z

    .line 207
    .line 208
    .line 209
    move-result p1

    .line 210
    if-nez p1, :cond_2

    .line 211
    .line 212
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->a:Lv/VFrame;

    .line 213
    .line 214
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 215
    .line 216
    .line 217
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->e:Lv/VLinear;

    .line 218
    .line 219
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 220
    .line 221
    .line 222
    :cond_2
    return-void

    .line 223
    :cond_3
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->j:Ljava/lang/String;

    .line 224
    .line 225
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->i:Ll/jjo0;

    .line 226
    .line 227
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    check-cast v0, Ll/rwn0;

    .line 232
    .line 233
    iput-object p1, v0, Ll/rwn0;->Z:Ljava/lang/String;

    .line 234
    .line 235
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->R()V

    .line 236
    .line 237
    .line 238
    return-void
.end method

.method public T(Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final V(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->i:Ll/jjo0;

    .line 2
    .line 3
    const-wide/16 v1, 0x1

    .line 4
    .line 5
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 6
    .line 7
    invoke-static {v1, v2, v3}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/pjo0;

    .line 29
    .line 30
    invoke-direct {v1, p0, p1}, Ll/pjo0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->l:Ll/kcg0;

    .line 42
    .line 43
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->E()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/jjo0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->C(Ll/jjo0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->V5:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VFrame;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->a:Lv/VFrame;

    .line 13
    .line 14
    sget v0, Ll/mdc0;->U5:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->d:Landroid/view/View;

    .line 21
    .line 22
    sget v0, Ll/mdc0;->K6:I

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lv/VText;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->b:Lv/VText;

    .line 31
    .line 32
    sget v0, Ll/mdc0;->L:I

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lv/VLinear;

    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->e:Lv/VLinear;

    .line 41
    .line 42
    sget v0, Ll/mdc0;->t:I

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Lv/VDraweeView;

    .line 49
    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->f:Lv/VDraweeView;

    .line 51
    .line 52
    sget v0, Ll/mdc0;->i:I

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Lv/VText;

    .line 59
    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->g:Lv/VText;

    .line 61
    .line 62
    sget v0, Ll/mdc0;->L0:I

    .line 63
    .line 64
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Lv/VText;

    .line 69
    .line 70
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->c:Lv/VText;

    .line 71
    .line 72
    sget v0, Ll/mdc0;->N6:I

    .line 73
    .line 74
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    check-cast v0, Lv/VText;

    .line 79
    .line 80
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->h:Lv/VText;

    .line 81
    .line 82
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 85
    .line 86
    .line 87
    const/4 v0, 0x0

    .line 88
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->T(Z)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public setCurrentPackId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/redpacket/VoiceRedPacketView;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
