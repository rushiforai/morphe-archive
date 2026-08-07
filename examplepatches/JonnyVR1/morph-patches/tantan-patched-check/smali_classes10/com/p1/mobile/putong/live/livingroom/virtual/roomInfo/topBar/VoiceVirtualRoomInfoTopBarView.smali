.class public Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "Ll/iam<",
        "Ll/bfp0;",
        ">;"
    }
.end annotation


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;

.field public e:Landroid/widget/ImageView;

.field public f:Lv/VDraweeView;

.field public g:Lv/VDraweeView;

.field public h:Lv/VLinear;

.field public i:Lcom/p1/mobile/putong/live/livingroom/view/FocusTextView;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Ll/bfp0;

.field public m:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;

.field public n:Lcom/p1/mobile/android/app/Dialog;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->t0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->q0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->u0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->s0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->r0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m0(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic n0(Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->v0(Landroid/view/View;)V

    return-void
.end method

.method private synthetic q0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->l:Ll/bfp0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/bfp0;->q4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->e:Landroid/widget/ImageView;

    .line 2
    .line 3
    new-instance v1, Ll/vip0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/vip0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->d:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;

    .line 12
    .line 13
    new-instance v1, Ll/wip0;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/wip0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private synthetic r0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->l:Ll/bfp0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/bfp0;->r4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public B0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->m:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->coverUrl:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->w0(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->levelSmallIcon:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->y0(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->j:Lv/VText;

    .line 18
    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->publicRoomId:Ljava/lang/String;

    .line 20
    .line 21
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, "ID:%s"

    .line 26
    .line 27
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->title:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->E0(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
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

.method public final D0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->l:Ll/bfp0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/i9o0;->g(Ll/i6t;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/vwt;->J6()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->k:Lv/VText;

    .line 20
    .line 21
    const/4 p2, 0x1

    .line 22
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->k:Lv/VText;

    .line 26
    .line 27
    sget p2, Ll/obc0;->u0:I

    .line 28
    .line 29
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->k:Lv/VText;

    .line 33
    .line 34
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Gk:I

    .line 35
    .line 36
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->k:Lv/VText;

    .line 40
    .line 41
    new-instance p2, Ll/bjp0;

    .line 42
    .line 43
    invoke-direct {p2, p0}, Ll/bjp0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;)V

    .line 44
    .line 45
    .line 46
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->isCreated()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->z0()V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->isSettled()Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_2

    .line 65
    .line 66
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->k:Lv/VText;

    .line 67
    .line 68
    const/4 v0, 0x0

    .line 69
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 70
    .line 71
    .line 72
    if-eqz p2, :cond_3

    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->l:Ll/bfp0;

    .line 75
    .line 76
    invoke-virtual {p0}, Ll/bfp0;->y4()V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->isUnSettled()Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-eqz p1, :cond_3

    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->G0()V

    .line 87
    .line 88
    .line 89
    :cond_3
    return-void
.end method

.method public E0(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->m:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->title:Ljava/lang/String;

    .line 6
    .line 7
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->i:Lcom/p1/mobile/putong/live/livingroom/view/FocusTextView;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->l:Ll/bfp0;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/bfp0;->z4(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final G0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->l:Ll/bfp0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/rwn0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/rwn0;->p()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->k:Lv/VText;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    invoke-static {v1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    sget v0, Ll/obc0;->u0:I

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->k:Lv/VText;

    .line 28
    .line 29
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ik:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->k:Lv/VText;

    .line 35
    .line 36
    const/4 v1, 0x1

    .line 37
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->k:Lv/VText;

    .line 41
    .line 42
    new-instance v1, Ll/ajp0;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/ajp0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final H0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomLevelUp;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->n:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ynp0;->z(Landroid/app/Dialog;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->n:Lcom/p1/mobile/android/app/Dialog;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/g1e;->dismiss()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->l:Ll/bfp0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget v1, Ll/jgc0;->i:I

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->L(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sget v1, Ll/yec0;->S6:I

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->M(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const/4 v1, 0x1

    .line 37
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->n:Lcom/p1/mobile/android/app/Dialog;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomLevelUp;->getStartColor()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-static {v1}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomLevelUp;->getEndColor()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-static {v2}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    const/16 v3, 0x14

    .line 68
    .line 69
    sget-object v4, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 70
    .line 71
    invoke-static {v1, v2, v3, v4}, Ll/fc2;->k(IIILandroid/graphics/drawable/GradientDrawable$Orientation;)Landroid/graphics/drawable/GradientDrawable;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 76
    .line 77
    .line 78
    sget v1, Ll/mdc0;->v0:I

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    new-instance v2, Ll/xip0;

    .line 85
    .line 86
    invoke-direct {v2, p0}, Ll/xip0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 90
    .line 91
    .line 92
    sget v1, Ll/mdc0;->k3:I

    .line 93
    .line 94
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    check-cast v1, Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 99
    .line 100
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomLevelUp;->getLevelIcon()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    const-string v3, "context_livingAct"

    .line 105
    .line 106
    invoke-static {v3, v1, v2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    sget v1, Ll/mdc0;->p3:I

    .line 110
    .line 111
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    check-cast v1, Landroid/widget/TextView;

    .line 116
    .line 117
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomLevelUp;->getLevel()I

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    const-string v2, "\u672c\u7fa4\u5df2\u5347\u7ea7\u81f3LV.%d"

    .line 130
    .line 131
    invoke-static {v2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 136
    .line 137
    .line 138
    sget p1, Ll/mdc0;->z0:I

    .line 139
    .line 140
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    new-instance v0, Ll/yip0;

    .line 145
    .line 146
    invoke-direct {v0, p0}, Ll/yip0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;)V

    .line 147
    .line 148
    .line 149
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 150
    .line 151
    .line 152
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->n:Lcom/p1/mobile/android/app/Dialog;

    .line 153
    .line 154
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 155
    .line 156
    .line 157
    return-void
.end method

.method public I0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomLevelUp;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->m:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomLevelUp;->getLevelIcon()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->levelIcon:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->m:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomLevelUp;->getLevel()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->level:I

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->m:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomLevelUp;->getLevelSmallIcon()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->levelSmallIcon:Ljava/lang/String;

    .line 26
    .line 27
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->m:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSummary;->levelSmallIcon:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->y0(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->H0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomLevelUp;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public J0(Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;Z)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceSettles:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

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
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceSettles:Ljava/util/List;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;

    .line 18
    .line 19
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->D0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public K0(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleMessage;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleMessage;->getMsgType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleMessage$MsgType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleMessage;->getUserId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {v1, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleMessage$MsgType;->apply:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleMessage$MsgType;

    .line 20
    .line 21
    if-ne v0, v1, :cond_0

    .line 22
    .line 23
    if-eqz p1, :cond_3

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->z0()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleMessage$MsgType;->approve:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleMessage$MsgType;

    .line 30
    .line 31
    if-ne v0, v1, :cond_1

    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->k:Lv/VText;

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->l:Ll/bfp0;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/bfp0;->u4()V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleMessage$MsgType;->reject:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleMessage$MsgType;

    .line 46
    .line 47
    if-eq v0, v1, :cond_4

    .line 48
    .line 49
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleMessage$MsgType;->quit:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleMessage$MsgType;

    .line 50
    .line 51
    if-ne v0, v1, :cond_2

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleMessage$MsgType;->updateSettledCount:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceSettleMessage$MsgType;

    .line 55
    .line 56
    if-ne v0, p1, :cond_3

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->l:Ll/bfp0;

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/bfp0;->u4()V

    .line 61
    .line 62
    .line 63
    :cond_3
    return-void

    .line 64
    :cond_4
    :goto_0
    if-eqz p1, :cond_5

    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->G0()V

    .line 67
    .line 68
    .line 69
    :cond_5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->l:Ll/bfp0;

    .line 70
    .line 71
    invoke-virtual {p0}, Ll/bfp0;->u4()V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->l:Ll/bfp0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->i:Lcom/p1/mobile/putong/live/livingroom/view/FocusTextView;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/bfp0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->p0(Ll/bfp0;)V

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

.method public final o0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/cjp0;->a(Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->o0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->r()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public p0(Ll/bfp0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->l:Ll/bfp0;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic s0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->l:Ll/bfp0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/bfp0;->p4()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->l:Ll/bfp0;

    .line 7
    .line 8
    invoke-static {p0}, Ll/t3m0;->e(Ll/i6t;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic t0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->l:Ll/bfp0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/bfp0;->v4()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->l:Ll/bfp0;

    .line 7
    .line 8
    invoke-static {p0}, Ll/t3m0;->w(Ll/i6t;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic u0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->n:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic v0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->l:Ll/bfp0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/bfp0;->b4()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->n:Lcom/p1/mobile/android/app/Dialog;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-static {p0}, Ll/ynp0;->n(Landroid/app/Dialog;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public w0(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "context_livingAct"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->f:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final y0(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "context_livingAct"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->g:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final z0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->l:Ll/bfp0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/rwn0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/rwn0;->p()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->k:Lv/VText;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    invoke-static {v1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    sget v0, Ll/obc0;->h1:I

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->k:Lv/VText;

    .line 28
    .line 29
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->m3:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->k:Lv/VText;

    .line 35
    .line 36
    const/4 v1, 0x1

    .line 37
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/topBar/VoiceVirtualRoomInfoTopBarView;->k:Lv/VText;

    .line 41
    .line 42
    new-instance v0, Ll/zip0;

    .line 43
    .line 44
    invoke-direct {v0}, Ll/zip0;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method
