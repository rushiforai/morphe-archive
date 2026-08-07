.class public Ll/k5m0;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/rwn0;",
        ">",
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/w6m0<",
        "TD;>;>;"
    }
.end annotation


# instance fields
.field public A:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

.field public B:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public C:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;

.field public D:Lcom/p1/mobile/putong/data/User;

.field public E:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

.field public F:Ll/vak0;

.field public G:Ll/nsv;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public k:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public l:Landroid/view/View;

.field public m:Landroid/widget/FrameLayout;

.field public n:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public o:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

.field public p:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;

.field public q:Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/cp/VirtualVoiceSpFriendHeadView;

.field public r:Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/middle/VoiceVirtualUserCardMiddleView;

.field public s:Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/friend/VirtualUserCardMatchView;

.field public t:Landroid/view/View;

.field public u:Lv/VLinear;

.field public v:Lv/VImage;

.field public w:Landroid/widget/TextView;

.field public x:Lv/VText;

.field public y:Landroid/view/View;

.field public z:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;


# direct methods
.method public constructor <init>(Ll/w6m0;)V
    .locals 3

    .line 1
    sget v0, Ll/yec0;->kb:I

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const v2, 0x3e99999a    # 0.3f

    .line 8
    .line 9
    .line 10
    invoke-static {v2}, Ll/qag0;->c(F)Ll/rq2;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-direct {p0, v0, v1, p1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;Ll/rq2;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private synthetic A0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/w6m0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/atm0;->Z3()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic B0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/k5m0;->D:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 6
    .line 7
    check-cast p0, Ll/w6m0;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/w6m0;->f5(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private E0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/k5m0;->D:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "@"

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Ll/k5m0;->D:Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v1, " "

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    sget v2, Ll/ix4;->E:I

    .line 34
    .line 35
    if-le v1, v2, :cond_1

    .line 36
    .line 37
    add-int/lit8 v2, v2, -0x4

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const-string v1, "... "

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 51
    .line 52
    check-cast p0, Ll/w6m0;

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Ll/w6m0;->e5(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public static synthetic F(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic G(Ll/k5m0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/k5m0;->B0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic H(Ll/k5m0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/k5m0;->m0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Ll/k5m0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k5m0;->t0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic J(Ll/k5m0;Ll/vak0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/k5m0;->z0(Ll/vak0;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic K(Ll/k5m0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/k5m0;->l0(Landroid/view/View;)V

    return-void
.end method

.method private K0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/k5m0;->n:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 2
    .line 3
    const/high16 v1, 0x42c80000    # 100.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, p0, Ll/k5m0;->G:Ll/nsv;

    .line 10
    .line 11
    new-instance v3, Ll/a5m0;

    .line 12
    .line 13
    invoke-direct {v3}, Ll/a5m0;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v1, v2, v3}, Ll/biv;->b(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILl/nsv;Ll/qcj;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/k5m0;->m:Landroid/widget/FrameLayout;

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/k5m0;->n:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->k0()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iget-object v1, p0, Ll/k5m0;->m:Landroid/widget/FrameLayout;

    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    const/high16 v0, 0x40000000    # 2.0f

    .line 37
    .line 38
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    invoke-static {v1, v0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Ll/k5m0;->m:Landroid/widget/FrameLayout;

    .line 46
    .line 47
    invoke-virtual {p0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    const/high16 v0, -0x3f400000    # -6.0f

    .line 52
    .line 53
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    invoke-static {v1, v0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/k5m0;->G:Ll/nsv;

    .line 61
    .line 62
    invoke-static {v0}, Ll/e3t;->a(Ll/nsv;)Ll/e3t;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Ll/e3t;->d()Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    iget-object p0, p0, Ll/k5m0;->m:Landroid/widget/FrameLayout;

    .line 71
    .line 72
    if-nez v0, :cond_1

    .line 73
    .line 74
    sget v0, Ll/obc0;->C8:I

    .line 75
    .line 76
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_1
    invoke-virtual {p0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public static synthetic L(Ll/k5m0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/k5m0;->p0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic M(Ll/k5m0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k5m0;->s0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic N(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManager;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManager;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic O(Ll/k5m0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k5m0;->v0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic P(Ll/k5m0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k5m0;->r0(Landroid/view/View;)V

    return-void
.end method

.method private P0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/k5m0;->l:Landroid/view/View;

    .line 2
    .line 3
    new-instance v1, Ll/h5m0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/h5m0;-><init>(Ll/k5m0;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/k5m0;->y:Landroid/view/View;

    .line 12
    .line 13
    new-instance v1, Ll/i5m0;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/i5m0;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/k5m0;->m:Landroid/widget/FrameLayout;

    .line 22
    .line 23
    new-instance v1, Ll/j5m0;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/j5m0;-><init>(Ll/k5m0;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic Q(Ll/k5m0;Lv/VText;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/k5m0;->u0(Lv/VText;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic S(Ll/k5m0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/k5m0;->k0()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic T(Ll/k5m0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k5m0;->w0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic U(Ll/k5m0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/k5m0;->M0()V

    return-void
.end method

.method public static synthetic V(Ll/k5m0;Ll/vak0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/k5m0;->y0(Ll/vak0;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic W(Ll/k5m0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k5m0;->o0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic X(Ll/k5m0;ZLjava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/k5m0;->x0(ZLjava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Y(Ll/k5m0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k5m0;->j0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Z(Ll/k5m0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k5m0;->i0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic a0(Ll/k5m0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/k5m0;->n0()V

    return-void
.end method

.method public static synthetic b0(Ll/k5m0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/k5m0;->A0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c0(Ll/k5m0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k5m0;->q0(Landroid/view/View;)V

    return-void
.end method

.method private g0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/k5m0;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Ll/k5m0;->u:Lv/VLinear;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/k5m0;->u:Lv/VLinear;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/k5m0;->x:Lv/VText;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/k5m0;->n:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->i0()V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/k5m0;->o:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->b()V

    .line 30
    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    iput-object v0, p0, Ll/k5m0;->D:Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    iput-object v0, p0, Ll/k5m0;->E:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 36
    .line 37
    iget-object v0, p0, Ll/k5m0;->C:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->n0()V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Ll/k5m0;->p:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;->e()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method private synthetic l0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/k5m0;->h0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic m0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/k5m0;->D:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/w7p0;->f()V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 13
    .line 14
    check-cast p1, Ll/w6m0;

    .line 15
    .line 16
    iget-object p0, p0, Ll/k5m0;->D:Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Ll/w6m0;->k5(Lcom/p1/mobile/putong/data/User;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method private synthetic p0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p1, Ll/w6m0;

    .line 4
    .line 5
    iget-object p1, p1, Ll/w6m0;->m:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "profile"

    .line 8
    .line 9
    invoke-static {p1, v0}, Ll/bco0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/bco0;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 14
    .line 15
    check-cast p0, Ll/w6m0;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceNewGiftWallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceNewGiftWallEvent;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceNewGiftWallEvent;->showMainPage()Ll/v3f$d;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/w6m0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public D0(Lv/VText;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/k5m0;->D:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Ll/k5m0;->F:Ll/vak0;

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    :cond_0
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 14
    .line 15
    check-cast v0, Ll/w6m0;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ll/rwn0;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v2, p0, Ll/k5m0;->D:Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v2}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const/4 v2, 0x1

    .line 36
    if-nez v0, :cond_4

    .line 37
    .line 38
    iget-object v0, p0, Ll/k5m0;->F:Ll/vak0;

    .line 39
    .line 40
    iget-object v3, p0, Ll/k5m0;->D:Lcom/p1/mobile/putong/data/User;

    .line 41
    .line 42
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v0, v3}, Ll/vak0;->c(Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_3

    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 51
    .line 52
    check-cast v0, Ll/w6m0;

    .line 53
    .line 54
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Ll/rwn0;

    .line 59
    .line 60
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {v0}, Ll/y6s;->c(Ljava/lang/String;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_2

    .line 71
    .line 72
    const-string v0, "\u9080\u4e3a\u5609\u5bbe"

    .line 73
    .line 74
    :goto_0
    move v1, v2

    .line 75
    goto :goto_1

    .line 76
    :cond_2
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->D8:I

    .line 77
    .line 78
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    goto :goto_0

    .line 83
    :cond_3
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Gh:I

    .line 84
    .line 85
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    goto :goto_1

    .line 90
    :cond_4
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->qi:I

    .line 91
    .line 92
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    goto :goto_0

    .line 97
    :goto_1
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p1, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 101
    .line 102
    .line 103
    new-instance v0, Ll/n4m0;

    .line 104
    .line 105
    invoke-direct {v0, p0}, Ll/n4m0;-><init>(Ll/k5m0;)V

    .line 106
    .line 107
    .line 108
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public final G0(Ljava/lang/String;Ll/x20;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/k5m0;->A:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer$RenderMode;->TEXTURE_VIEW:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer$RenderMode;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->setRenderMode(Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer$RenderMode;)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/hre;

    .line 13
    .line 14
    invoke-direct {v0, p1}, Ll/hre;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    new-instance p1, Ll/b5m0;

    .line 18
    .line 19
    invoke-direct {p1, p0}, Ll/b5m0;-><init>(Ll/k5m0;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p1}, Ll/hre;->m(Ll/pcj;)Ll/hre;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1, p2}, Ll/hre;->i(Ll/x20;)Ll/hre;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object p0, p0, Ll/k5m0;->A:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 31
    .line 32
    invoke-static {p0, p1}, Ll/jfl0;->n(Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;Ll/hre;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final H0(Ll/vak0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ll/k5m0;->F:Ll/vak0;

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    move-object v0, p2

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p1, Ll/vak0;->c:Ll/nsv;

    .line 9
    .line 10
    iget-object v0, v0, Ll/nsv;->a:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    :goto_0
    iput-object v0, p0, Ll/k5m0;->D:Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    if-nez p1, :cond_1

    .line 17
    .line 18
    move-object v0, p2

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    iget-object v0, p1, Ll/vak0;->c:Ll/nsv;

    .line 21
    .line 22
    :goto_1
    iput-object v0, p0, Ll/k5m0;->G:Ll/nsv;

    .line 23
    .line 24
    if-nez p1, :cond_2

    .line 25
    .line 26
    goto :goto_2

    .line 27
    :cond_2
    invoke-virtual {p1}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    :goto_2
    iput-object p2, p0, Ll/k5m0;->E:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 32
    .line 33
    iget-object v0, p0, Ll/k5m0;->D:Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    const/4 v1, 0x1

    .line 36
    if-eqz v0, :cond_7

    .line 37
    .line 38
    if-nez p2, :cond_3

    .line 39
    .line 40
    goto/16 :goto_5

    .line 41
    .line 42
    :cond_3
    invoke-virtual {p0}, Ll/k5m0;->I0()V

    .line 43
    .line 44
    .line 45
    invoke-direct {p0}, Ll/k5m0;->K0()V

    .line 46
    .line 47
    .line 48
    new-instance p2, Ll/q4m0;

    .line 49
    .line 50
    invoke-direct {p2, p0}, Ll/q4m0;-><init>(Ll/k5m0;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, p1, p2}, Ll/k5m0;->J0(Ll/vak0;Ll/x20;)V

    .line 54
    .line 55
    .line 56
    iget-object p2, p0, Ll/k5m0;->w:Landroid/widget/TextView;

    .line 57
    .line 58
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    iget-object p2, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 62
    .line 63
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 64
    .line 65
    invoke-virtual {v2}, Ll/wrv;->D0()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-static {p2, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    if-eqz p2, :cond_4

    .line 74
    .line 75
    iget-object p2, p0, Ll/k5m0;->w:Landroid/widget/TextView;

    .line 76
    .line 77
    const-string v0, "\u6211\u7684\u88c5\u626e"

    .line 78
    .line 79
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    .line 81
    .line 82
    iget-object p2, p0, Ll/k5m0;->w:Landroid/widget/TextView;

    .line 83
    .line 84
    new-instance v0, Ll/r4m0;

    .line 85
    .line 86
    invoke-direct {v0, p0}, Ll/r4m0;-><init>(Ll/k5m0;)V

    .line 87
    .line 88
    .line 89
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 90
    .line 91
    .line 92
    goto :goto_4

    .line 93
    :cond_4
    invoke-static {}, Ll/w7p0;->g()V

    .line 94
    .line 95
    .line 96
    iget-object p2, p0, Ll/k5m0;->w:Landroid/widget/TextView;

    .line 97
    .line 98
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-eqz v0, :cond_5

    .line 103
    .line 104
    const-string v0, "\u5979"

    .line 105
    .line 106
    goto :goto_3

    .line 107
    :cond_5
    const-string v0, "\u4ed6"

    .line 108
    .line 109
    :goto_3
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    const-string v2, "%s\u7684\u88c5\u626e"

    .line 114
    .line 115
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 120
    .line 121
    .line 122
    iget-object p2, p0, Ll/k5m0;->w:Landroid/widget/TextView;

    .line 123
    .line 124
    new-instance v0, Ll/s4m0;

    .line 125
    .line 126
    invoke-direct {v0, p0}, Ll/s4m0;-><init>(Ll/k5m0;)V

    .line 127
    .line 128
    .line 129
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 130
    .line 131
    .line 132
    :goto_4
    invoke-virtual {p0, p1}, Ll/k5m0;->N0(Ll/vak0;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p1}, Ll/vak0;->i()Ljava/util/List;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 140
    .line 141
    .line 142
    move-result p2

    .line 143
    iget-object v0, p0, Ll/k5m0;->p:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;

    .line 144
    .line 145
    if-nez p2, :cond_6

    .line 146
    .line 147
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 148
    .line 149
    .line 150
    iget-object p2, p0, Ll/k5m0;->p:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;

    .line 151
    .line 152
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 153
    .line 154
    check-cast v0, Ll/w6m0;

    .line 155
    .line 156
    invoke-virtual {v0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    new-instance v1, Ll/t4m0;

    .line 161
    .line 162
    invoke-direct {v1, p0}, Ll/t4m0;-><init>(Ll/k5m0;)V

    .line 163
    .line 164
    .line 165
    new-instance v2, Ll/u4m0;

    .line 166
    .line 167
    invoke-direct {v2, p0}, Ll/u4m0;-><init>(Ll/k5m0;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {p2, v0, p1, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;->h(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ll/x20;Lcom/tantanapp/media/ttmediautils/download/Action1;)V

    .line 171
    .line 172
    .line 173
    iget-object p1, p0, Ll/k5m0;->p:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;

    .line 174
    .line 175
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;->b:Lv/VDraweeView;

    .line 176
    .line 177
    new-instance p2, Ll/v4m0;

    .line 178
    .line 179
    invoke-direct {p2, p0}, Ll/v4m0;-><init>(Ll/k5m0;)V

    .line 180
    .line 181
    .line 182
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 183
    .line 184
    .line 185
    return-void

    .line 186
    :cond_6
    const/4 p0, 0x0

    .line 187
    invoke-static {v0, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 188
    .line 189
    .line 190
    return-void

    .line 191
    :cond_7
    :goto_5
    iget-object p1, p0, Ll/k5m0;->x:Lv/VText;

    .line 192
    .line 193
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 194
    .line 195
    .line 196
    iget-object p0, p0, Ll/k5m0;->m:Landroid/widget/FrameLayout;

    .line 197
    .line 198
    const/16 p1, 0x8

    .line 199
    .line 200
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 201
    .line 202
    .line 203
    return-void
.end method

.method public I0()V
    .locals 12

    .line 1
    iget-object v0, p0, Ll/k5m0;->E:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    const-string v1, "voiceUserCard"

    if-nez v0, :cond_0

    .line 2
    const-string p0, "config is null"

    invoke-static {v1, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 3
    :cond_0
    iget-object v0, p0, Ll/k5m0;->u:Lv/VLinear;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 4
    iget-object v0, p0, Ll/k5m0;->E:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->bottomButtons:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/16 v2, 0x8

    if-nez v0, :cond_1

    .line 5
    const-string v0, "config.bottomButtons is empty"

    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    iget-object p0, p0, Ll/k5m0;->u:Lv/VLinear;

    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    return-void

    .line 7
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "bottom button:"

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Ll/k5m0;->E:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->userId:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    iget-object v0, p0, Ll/k5m0;->u:Lv/VLinear;

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    move v0, v3

    .line 9
    :goto_0
    iget-object v4, p0, Ll/k5m0;->E:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->bottomButtons:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v0, v4, :cond_e

    .line 10
    iget-object v4, p0, Ll/k5m0;->E:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->bottomButtons:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 11
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "render bottom button:"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    new-instance v5, Lv/VText;

    iget-object v6, p0, Ll/k5m0;->u:Lv/VLinear;

    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v5, v6}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 13
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    sget v7, Ll/bnl0;->e:I

    invoke-direct {v6, v3, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v7, 0x41700000    # 15.0f

    .line 14
    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setTextSize(F)V

    const/16 v7, 0x11

    .line 15
    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setGravity(I)V

    const/high16 v7, 0x3f800000    # 1.0f

    .line 16
    iput v7, v6, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 17
    const-string v7, "#ccffffff"

    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 18
    invoke-virtual {v5, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 19
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v6

    const/4 v7, 0x1

    const/4 v8, -0x1

    sparse-switch v6, :sswitch_data_0

    goto/16 :goto_1

    :sswitch_0
    const-string v6, "privateChat"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    goto/16 :goto_1

    :cond_2
    move v8, v2

    goto/16 :goto_1

    :sswitch_1
    const-string v6, "sendGift"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    goto :goto_1

    :cond_3
    const/4 v8, 0x7

    goto :goto_1

    :sswitch_2
    const-string v6, "realNamePrivateChat"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    goto :goto_1

    :cond_4
    const/4 v8, 0x6

    goto :goto_1

    :sswitch_3
    const-string v6, "more"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5

    goto :goto_1

    :cond_5
    const/4 v8, 0x5

    goto :goto_1

    :sswitch_4
    const-string v6, "like"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6

    goto :goto_1

    :cond_6
    const/4 v8, 0x4

    goto :goto_1

    :sswitch_5
    const-string v6, "call"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_7

    goto :goto_1

    :cond_7
    const/4 v8, 0x3

    goto :goto_1

    :sswitch_6
    const-string v6, "at"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_8

    goto :goto_1

    :cond_8
    const/4 v8, 0x2

    goto :goto_1

    :sswitch_7
    const-string v6, "managerInvite"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_9

    goto :goto_1

    :cond_9
    move v8, v7

    goto :goto_1

    :sswitch_8
    const-string v6, "sayHello"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_a

    goto :goto_1

    :cond_a
    move v8, v3

    :goto_1
    const-string v4, "liveId"

    const-string v6, "anchorId"

    const-string v9, "\u79c1\u804a"

    const-string v10, "receiver_user_id"

    const-string v11, "p_audio_profile"

    packed-switch v8, :pswitch_data_0

    goto/16 :goto_4

    .line 20
    :pswitch_0
    iget-object v4, p0, Ll/k5m0;->D:Lcom/p1/mobile/putong/data/User;

    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    invoke-static {v10, v4}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object v4

    const-string v6, "message_from"

    const-string v8, "AudioProfileCard"

    .line 22
    invoke-static {v6, v8}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object v6

    filled-new-array {v4, v6}, [Ll/pf60;

    move-result-object v4

    .line 23
    const-string v6, "e_anonymous_chat_button"

    invoke-static {v6, v11, v4}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    invoke-virtual {v5, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    new-instance v4, Ll/c5m0;

    invoke-direct {v4, p0}, Ll/c5m0;-><init>(Ll/k5m0;)V

    invoke-static {v5, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    goto/16 :goto_4

    .line 26
    :pswitch_1
    iget-object v4, p0, Ll/k5m0;->D:Lcom/p1/mobile/putong/data/User;

    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    sget-object v6, Ll/zrv;->a:Ll/wrv;

    invoke-virtual {v6}, Ll/wrv;->D0()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 27
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->td:I

    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(I)V

    goto :goto_2

    .line 28
    :cond_b
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->md:I

    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(I)V

    .line 29
    :goto_2
    new-instance v4, Ll/m4m0;

    invoke-direct {v4, p0}, Ll/m4m0;-><init>(Ll/k5m0;)V

    invoke-static {v5, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    goto/16 :goto_4

    .line 30
    :pswitch_2
    invoke-virtual {v5, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    new-instance v4, Ll/f5m0;

    invoke-direct {v4, p0}, Ll/f5m0;-><init>(Ll/k5m0;)V

    invoke-static {v5, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    goto/16 :goto_4

    .line 32
    :pswitch_3
    const-string v4, "\u66f4\u591a"

    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    new-instance v4, Ll/g5m0;

    invoke-direct {v4, p0}, Ll/g5m0;-><init>(Ll/k5m0;)V

    invoke-static {v5, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    goto/16 :goto_4

    .line 34
    :pswitch_4
    iget-object v8, p0, Ll/k5m0;->E:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    iget-object v8, v8, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->relationState:Ljava/lang/String;

    invoke-virtual {p0, v5, v8}, Ll/k5m0;->O0(Lv/VText;Ljava/lang/String;)V

    .line 35
    iget-object v8, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    check-cast v8, Ll/w6m0;

    .line 36
    invoke-virtual {v8}, Ll/xzs;->E2()Ll/oo2;

    move-result-object v8

    check-cast v8, Ll/rwn0;

    invoke-virtual {v8}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    move-result-object v8

    iget-object v8, v8, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-static {v6, v8}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object v6

    iget-object v8, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    check-cast v8, Ll/w6m0;

    .line 37
    invoke-virtual {v8}, Ll/xzs;->E2()Ll/oo2;

    move-result-object v8

    check-cast v8, Ll/rwn0;

    invoke-virtual {v8}, Ll/vp20;->k()Ljava/lang/String;

    move-result-object v8

    invoke-static {v4, v8}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object v4

    iget-object v8, p0, Ll/k5m0;->D:Lcom/p1/mobile/putong/data/User;

    iget-object v8, v8, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 38
    invoke-static {v10, v8}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object v8

    filled-new-array {v6, v4, v8}, [Ll/pf60;

    move-result-object v4

    .line 39
    const-string v6, "e_audio_like"

    invoke-static {v6, v11, v4}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 40
    new-instance v4, Ll/e5m0;

    invoke-direct {v4, p0, v5}, Ll/e5m0;-><init>(Ll/k5m0;Lv/VText;)V

    invoke-static {v5, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    goto/16 :goto_4

    .line 41
    :pswitch_5
    invoke-virtual {p0, v5}, Ll/k5m0;->D0(Lv/VText;)V

    goto :goto_4

    .line 42
    :pswitch_6
    iget-object v4, p0, Ll/k5m0;->D:Lcom/p1/mobile/putong/data/User;

    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    move-result v4

    if-eqz v4, :cond_c

    .line 43
    sget-object v4, Ll/zrv;->e:Landroid/app/Application;

    sget v6, Lcom/p1/mobile/putong/live/livingroom/R$string;->Se:I

    invoke-virtual {v4, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_3

    .line 44
    :cond_c
    sget-object v4, Ll/zrv;->e:Landroid/app/Application;

    sget v6, Lcom/p1/mobile/putong/live/livingroom/R$string;->Qe:I

    invoke-virtual {v4, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    :goto_3
    new-instance v4, Ll/x4m0;

    invoke-direct {v4, p0}, Ll/x4m0;-><init>(Ll/k5m0;)V

    invoke-static {v5, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    goto :goto_4

    .line 46
    :pswitch_7
    invoke-virtual {p0, v5}, Ll/k5m0;->L0(Lv/VText;)V

    goto :goto_4

    .line 47
    :pswitch_8
    const-string v8, "\u6253\u62db\u547c"

    invoke-virtual {v5, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    iget-object v8, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    check-cast v8, Ll/w6m0;

    .line 49
    invoke-virtual {v8}, Ll/xzs;->E2()Ll/oo2;

    move-result-object v8

    check-cast v8, Ll/rwn0;

    invoke-virtual {v8}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    move-result-object v8

    iget-object v8, v8, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-static {v6, v8}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object v6

    iget-object v8, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    check-cast v8, Ll/w6m0;

    .line 50
    invoke-virtual {v8}, Ll/xzs;->E2()Ll/oo2;

    move-result-object v8

    check-cast v8, Ll/rwn0;

    invoke-virtual {v8}, Ll/vp20;->k()Ljava/lang/String;

    move-result-object v8

    invoke-static {v4, v8}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object v4

    iget-object v8, p0, Ll/k5m0;->D:Lcom/p1/mobile/putong/data/User;

    iget-object v8, v8, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 51
    invoke-static {v10, v8}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object v8

    filled-new-array {v6, v4, v8}, [Ll/pf60;

    move-result-object v4

    .line 52
    const-string v6, "e_audio_greeting"

    invoke-static {v6, v11, v4}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 53
    new-instance v4, Ll/d5m0;

    invoke-direct {v4, p0}, Ll/d5m0;-><init>(Ll/k5m0;)V

    invoke-static {v5, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 54
    :goto_4
    iget-object v4, p0, Ll/k5m0;->u:Lv/VLinear;

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 55
    iget-object v4, p0, Ll/k5m0;->E:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->bottomButtons:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-le v4, v7, :cond_d

    iget-object v4, p0, Ll/k5m0;->E:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->bottomButtons:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    sub-int/2addr v4, v7

    if-eq v0, v4, :cond_d

    .line 56
    new-instance v4, Landroid/view/View;

    iget-object v5, p0, Ll/k5m0;->u:Lv/VLinear;

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 57
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    sget v6, Ll/qa00;->a:I

    sget v7, Ll/qa00;->m:I

    invoke-direct {v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v6, 0x10

    .line 58
    iput v6, v5, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 59
    invoke-virtual {v4, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 60
    const-string v5, "#0cffffff"

    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/view/View;->setBackgroundColor(I)V

    .line 61
    iget-object v5, p0, Ll/k5m0;->u:Lv/VLinear;

    invoke-virtual {v5, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :cond_d
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    :cond_e
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        -0x77fbd859 -> :sswitch_8
        -0x49110aea -> :sswitch_7
        0xc33 -> :sswitch_6
        0x2e7a5e -> :sswitch_5
        0x32af97 -> :sswitch_4
        0x333b55 -> :sswitch_3
        0x42fe9a72 -> :sswitch_2
        0x4a54a8d8 -> :sswitch_1
        0x757cb37b -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final J0(Ll/vak0;Ll/x20;)V
    .locals 10

    .line 1
    invoke-virtual {p1}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->sweetCpCard:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceSweetCpCard;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceSweetCpCard;->sweetCp:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->currentHouse:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpHouseInfo;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpHouseInfo;->profileEffect:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->currentHouse:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpHouseInfo;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpHouseInfo;->profileVideoEffect:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_3

    .line 29
    .line 30
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->currentHouse:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpHouseInfo;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpHouseInfo;->profileAvatarEffect:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_3

    .line 39
    .line 40
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->currentHouse:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpHouseInfo;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpHouseInfo;->profileVideoEffect:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->currentHouse:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpHouseInfo;

    .line 49
    .line 50
    const/4 v3, 0x1

    .line 51
    if-nez v0, :cond_1

    .line 52
    .line 53
    iget-object v0, v2, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpHouseInfo;->profileVideoEffect:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {p0, v0, p2}, Ll/k5m0;->G0(Ljava/lang/String;Ll/x20;)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    iget-object v0, v2, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpHouseInfo;->profileEffect:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-nez v0, :cond_2

    .line 66
    .line 67
    iget-object v0, p0, Ll/k5m0;->z:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 68
    .line 69
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 70
    .line 71
    .line 72
    iget-object v4, p0, Ll/k5m0;->z:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 73
    .line 74
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->currentHouse:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpHouseInfo;

    .line 75
    .line 76
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpHouseInfo;->profileEffect:Ljava/lang/String;

    .line 77
    .line 78
    new-instance v7, Ll/k5m0$a;

    .line 79
    .line 80
    invoke-direct {v7, p0, p2}, Ll/k5m0$a;-><init>(Ll/k5m0;Ll/x20;)V

    .line 81
    .line 82
    .line 83
    const/4 v8, 0x1

    .line 84
    const/4 v9, 0x0

    .line 85
    const/4 v6, 0x1

    .line 86
    invoke-virtual/range {v4 .. v9}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->h(Ljava/lang/String;ILl/wo0;ZZ)V

    .line 87
    .line 88
    .line 89
    :cond_2
    :goto_0
    iget-object p2, p0, Ll/k5m0;->B:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 90
    .line 91
    invoke-static {p2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 92
    .line 93
    .line 94
    new-instance p2, Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 95
    .line 96
    invoke-direct {p2}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;-><init>()V

    .line 97
    .line 98
    .line 99
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->meUser:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpUserInfo;

    .line 100
    .line 101
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpUserInfo;->avatar:Ljava/lang/String;

    .line 102
    .line 103
    const-string v2, "head01"

    .line 104
    .line 105
    invoke-virtual {p2, v0, v2}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setDynamicImage(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->otherUser:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpUserInfo;

    .line 109
    .line 110
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpUserInfo;->avatar:Ljava/lang/String;

    .line 111
    .line 112
    const-string v2, "head02"

    .line 113
    .line 114
    invoke-virtual {p2, v0, v2}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setDynamicImage(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 118
    .line 119
    check-cast v0, Ll/w6m0;

    .line 120
    .line 121
    invoke-virtual {v0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->currentHouse:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpHouseInfo;

    .line 130
    .line 131
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpHouseInfo;->profileAvatarEffect:Ljava/lang/String;

    .line 132
    .line 133
    invoke-virtual {v0, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    sget-object v0, Lcom/tantan/library/svga/SVGAnimationView$FrameMode;->AFTER:Lcom/tantan/library/svga/SVGAnimationView$FrameMode;

    .line 138
    .line 139
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->frameMode(Lcom/tantan/library/svga/SVGAnimationView$FrameMode;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-virtual {p1, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->isCacheable(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    invoke-virtual {p1, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->dynamic(Lcom/tantan/library/svga/compose/SVGADynamicEntity;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    new-instance p2, Ll/k5m0$b;

    .line 156
    .line 157
    invoke-direct {p2, p0}, Ll/k5m0$b;-><init>(Ll/k5m0;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    invoke-virtual {p1, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    iget-object p0, p0, Ll/k5m0;->B:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 169
    .line 170
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 171
    .line 172
    .line 173
    return-void

    .line 174
    :cond_3
    iget-object p1, p0, Ll/k5m0;->z:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 175
    .line 176
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 177
    .line 178
    .line 179
    iget-object p1, p0, Ll/k5m0;->B:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 180
    .line 181
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 182
    .line 183
    .line 184
    iget-object p0, p0, Ll/k5m0;->A:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 185
    .line 186
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 187
    .line 188
    .line 189
    invoke-interface {p2}, Ll/x20;->call()V

    .line 190
    .line 191
    .line 192
    return-void
.end method

.method public final L0(Lv/VText;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast v0, Ll/w6m0;

    .line 4
    .line 5
    new-instance v1, Ll/x5o0;

    .line 6
    .line 7
    const/16 v2, 0xed8

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ll/x5o0;-><init>(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/util/List;

    .line 17
    .line 18
    iget-object v1, p0, Ll/k5m0;->F:Ll/vak0;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/vak0;->o()Ll/nsv;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget-object v1, v1, Ll/nsv;->a:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 29
    .line 30
    new-instance v2, Ll/o4m0;

    .line 31
    .line 32
    invoke-direct {v2, v1}, Ll/o4m0;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0, v2}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->df:I

    .line 42
    .line 43
    invoke-static {v2}, Ll/xau;->t(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    goto :goto_0

    .line 48
    :cond_0
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->lf:I

    .line 49
    .line 50
    invoke-static {v2}, Ll/xau;->t(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    :goto_0
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    new-instance v2, Ll/p4m0;

    .line 58
    .line 59
    invoke-direct {v2, p0, v0, v1}, Ll/p4m0;-><init>(Ll/k5m0;ZLjava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-static {p1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final M0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/k5m0;->C:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;

    .line 2
    .line 3
    iget-object v1, p0, Ll/k5m0;->G:Ll/nsv;

    .line 4
    .line 5
    iget-object v2, p0, Ll/k5m0;->l:Landroid/view/View;

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->y0(Ll/nsv;Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/k5m0;->C:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;

    .line 11
    .line 12
    iget-object v1, p0, Ll/k5m0;->m:Landroid/widget/FrameLayout;

    .line 13
    .line 14
    iget-object p0, p0, Ll/k5m0;->E:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->enableNewPrivilege:Z

    .line 19
    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    :goto_0
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->D0(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final N0(Ll/vak0;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v1, p0, Ll/k5m0;->t:Landroid/view/View;

    .line 9
    .line 10
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->payGuideConfig:Lcom/p1/mobile/putong/live/base/data/BLivePayGuideConfig;

    .line 11
    .line 12
    if-nez v2, :cond_1

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->payGuideInfo:Lcom/p1/mobile/putong/live/base/data/BLivePayGuideInfo;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const/4 v0, 0x0

    .line 21
    :goto_0
    invoke-static {v1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/k5m0;->s:Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/friend/VirtualUserCardMatchView;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 27
    .line 28
    iget-object v2, p1, Ll/vak0;->c:Ll/nsv;

    .line 29
    .line 30
    iget-object v2, v2, Ll/nsv;->a:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v0, p1, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/friend/VirtualUserCardMatchView;->s(Ll/vak0;Ll/i6t;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/k5m0;->s:Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/friend/VirtualUserCardMatchView;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/friend/VirtualUserCardMatchView;->a:Lv/VFrame;

    .line 42
    .line 43
    new-instance v1, Ll/y4m0;

    .line 44
    .line 45
    invoke-direct {v1, p0, p1}, Ll/y4m0;-><init>(Ll/k5m0;Ll/vak0;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/k5m0;->s:Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/friend/VirtualUserCardMatchView;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/friend/VirtualUserCardMatchView;->i:Lv/VButton;

    .line 54
    .line 55
    new-instance v1, Ll/z4m0;

    .line 56
    .line 57
    invoke-direct {v1, p0, p1}, Ll/z4m0;-><init>(Ll/k5m0;Ll/vak0;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public O0(Lv/VText;Ljava/lang/String;)V
    .locals 0

    .line 1
    const-string p0, "liking"

    .line 2
    .line 3
    invoke-static {p2, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const-string p0, "\u5df2\u559c\u6b22"

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    const-string p0, "#66ffffff"

    .line 19
    .line 20
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    const-string p0, "\u559c\u6b22"

    .line 29
    .line 30
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    const-string p0, "#ff8817"

    .line 34
    .line 35
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 40
    .line 41
    .line 42
    const-string p0, "likeMatched"

    .line 43
    .line 44
    invoke-static {p2, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-eqz p0, :cond_1

    .line 49
    .line 50
    const/4 p0, 0x0

    .line 51
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    :cond_1
    return-void
.end method

.method public Q0(ZLl/vak0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/k5m0;->g0()V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->B(Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p2, p3}, Ll/k5m0;->H0(Ll/vak0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/w6m0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final d0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/l5m0;->a(Ll/k5m0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 8
    .line 9
    check-cast p0, Ll/w6m0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/w6m0;->J4()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public e0(Ll/w6m0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public f0()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/k5m0;->F:Ll/vak0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/vak0;->o()Ll/nsv;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Ll/nsv;->a:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v1, 0x5

    .line 14
    invoke-static {v0, v1}, Ll/bf10;->w(Ljava/lang/String;I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->af:I

    .line 19
    .line 20
    invoke-static {v1, v0}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    new-instance v2, Landroid/text/SpannableStringBuilder;

    .line 25
    .line 26
    invoke-direct {v2, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-ltz v1, :cond_0

    .line 34
    .line 35
    new-instance v3, Landroid/text/style/StyleSpan;

    .line 36
    .line 37
    const/4 v4, 0x1

    .line 38
    invoke-direct {v3, v4}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr v0, v1

    .line 46
    const/16 v4, 0x21

    .line 47
    .line 48
    invoke-virtual {v2, v3, v1, v0, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 49
    .line 50
    .line 51
    :cond_0
    new-instance v0, Ll/th0$a;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/k5m0;->C0()Landroid/content/Context;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v2}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->cf:I

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Ll/w4m0;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Ll/w4m0;-><init>(Ll/k5m0;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->bf:I

    .line 80
    .line 81
    invoke-virtual {p0, v0}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public h0()V
    .locals 2

    .line 1
    new-instance v0, Ll/bae0$a;

    .line 2
    .line 3
    const/16 v1, 0xc8

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/bae0$a;-><init>(I)V

    .line 6
    .line 7
    .line 8
    const-string v1, "tantanapp://voice-live/room/showUserVoiceRightsPage"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/bae0$a;->e(Ljava/lang/String;)Ll/bae0$a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/bae0$a;->c()Ll/bae0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 19
    .line 20
    check-cast p0, Ll/w6m0;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic i0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p1, Ll/w6m0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/k5m0;->F:Ll/vak0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/vak0;->o()Ll/nsv;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Ll/w6m0;->H4(Lcom/p1/mobile/putong/data/User;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/w6m0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/k5m0;->e0(Ll/w6m0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final synthetic j0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p1, Ll/w6m0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/k5m0;->D:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/w6m0;->I4(Lcom/p1/mobile/putong/data/User;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic k0()Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->c:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public m(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/k5m0;->d0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->USER_CARD:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->z(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)V

    .line 7
    .line 8
    .line 9
    const/16 v0, 0x50

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->A(I)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0}, Ll/k5m0;->P0()V

    .line 15
    .line 16
    .line 17
    sget v0, Ll/mdc0;->M7:I

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;

    .line 24
    .line 25
    iput-object p1, p0, Ll/k5m0;->C:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;

    .line 26
    .line 27
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->setDialogHost(Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public bridge synthetic n(Ll/y8s;)V
    .locals 0

    .line 1
    check-cast p1, Ll/w6m0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/k5m0;->e0(Ll/w6m0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic n0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast v0, Ll/w6m0;

    .line 4
    .line 5
    iget-object v0, v0, Ll/w6m0;->m:Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "profile"

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bco0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/bco0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 14
    .line 15
    check-cast v1, Ll/w6m0;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceNewGiftWallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceNewGiftWallEvent;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceNewGiftWallEvent;->showMainPage()Ll/v3f$d;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic o0(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast v0, Ll/w6m0;

    .line 4
    .line 5
    iget-object v0, v0, Ll/w6m0;->m:Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "profile"

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bco0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/bco0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 14
    .line 15
    check-cast v1, Ll/w6m0;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceNewGiftWallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceNewGiftWallEvent;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceNewGiftWallEvent;->showMainPage()Ll/v3f$d;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    new-instance v0, Ll/aco0;

    .line 31
    .line 32
    invoke-direct {v0}, Ll/aco0;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object p1, v0, Ll/aco0;->b:Ljava/lang/String;

    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 38
    .line 39
    move-object v1, p1

    .line 40
    check-cast v1, Ll/w6m0;

    .line 41
    .line 42
    iget-object v1, v1, Ll/w6m0;->m:Ljava/lang/String;

    .line 43
    .line 44
    iput-object v1, v0, Ll/aco0;->a:Ljava/lang/String;

    .line 45
    .line 46
    check-cast p1, Ll/w6m0;

    .line 47
    .line 48
    invoke-virtual {p1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceNewGiftWallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceNewGiftWallEvent;

    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceNewGiftWallEvent;->showGiftDetail()Ll/v3f$d;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final synthetic q0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/k5m0;->D:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/w7p0;->c()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 9
    .line 10
    check-cast p1, Ll/w6m0;

    .line 11
    .line 12
    iget-object p0, p0, Ll/k5m0;->F:Ll/vak0;

    .line 13
    .line 14
    iget-object p0, p0, Ll/vak0;->c:Ll/nsv;

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Ll/w6m0;->n5(Ll/nsv;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final synthetic r0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/k5m0;->E0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic s0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/k5m0;->D:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 6
    .line 7
    check-cast p0, Ll/w6m0;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/w6m0;->h5(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic t0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/k5m0;->D:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 6
    .line 7
    check-cast p0, Ll/w6m0;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/w6m0;->j5(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic u0(Lv/VText;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/k5m0;->D:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 6
    .line 7
    check-cast v0, Ll/w6m0;

    .line 8
    .line 9
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    iget-object p0, p0, Ll/k5m0;->E:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->relationState:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, p1, p2, p0}, Ll/w6m0;->g5(Lv/VText;Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final synthetic v0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/k5m0;->D:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 6
    .line 7
    check-cast p0, Ll/w6m0;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/w6m0;->i5(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const-string p0, "voiceUserCard"

    .line 16
    .line 17
    const-string p1, "currentUser is null"

    .line 18
    .line 19
    invoke-static {p0, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public w()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->w()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/k5m0;->z:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/k5m0;->z:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->o()V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/k5m0;->z:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/k5m0;->s:Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/friend/VirtualUserCardMatchView;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/friend/VirtualUserCardMatchView;->u()V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/k5m0;->A:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->stop()V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/k5m0;->A:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 34
    .line 35
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic w0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/k5m0;->D:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 6
    .line 7
    check-cast p0, Ll/w6m0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/w6m0;->q5()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final synthetic x0(ZLjava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/k5m0;->f0()V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 8
    .line 9
    check-cast p0, Ll/w6m0;

    .line 10
    .line 11
    invoke-virtual {p0, p2}, Ll/w6m0;->O4(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic y0(Ll/vak0;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/w6m0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->payGuideInfo:Lcom/p1/mobile/putong/live/base/data/BLivePayGuideInfo;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/w6m0;->F4(Lcom/p1/mobile/putong/live/base/data/BLivePayGuideInfo;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic z0(Ll/vak0;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/w6m0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->payGuideConfig:Lcom/p1/mobile/putong/live/base/data/BLivePayGuideConfig;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/w6m0;->G4(Lcom/p1/mobile/putong/live/base/data/BLivePayGuideConfig;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
