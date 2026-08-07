.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Ll/eoj;


# instance fields
.field public d:Landroid/view/View;

.field public e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;

.field public f:Lv/VDraweeView;

.field public g:Lv/VDraweeView;

.field public h:Landroid/widget/Space;

.field public i:Landroid/widget/LinearLayout;

.field public j:Lcom/p1/mobile/putong/live/livingroom/increment/gift/receivegift/ReceiveGiftUsersView;

.field public k:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;

.field public l:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoOfficialView;

.field public m:Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;

.field public n:Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/progress/view/PacketProgressView;

.field public o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

.field public p:Landroid/view/ViewStub;

.field public q:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;

.field public r:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftDialogShadeLayer;

.field public s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftOperationView;

.field public t:Ll/bjs;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/bjs<",
            "*>;"
        }
    .end annotation
.end field

.field public u:Ll/vrj;

.field public v:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

.field public w:Ll/xxj;

.field public x:Z

.field public final y:Ll/vrj$c;


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
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->x:Z

    .line 6
    .line 7
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView$a;

    .line 8
    .line 9
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->y:Ll/vrj$c;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 15
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->x:Z

    .line 17
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->y:Ll/vrj$c;

    return-void
.end method

.method public static synthetic h0(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->u0()Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic j0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;)Ll/xxj;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->w:Ll/xxj;

    return-object p0
.end method

.method public static bridge synthetic k0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->x:Z

    return p0
.end method

.method public static bridge synthetic l0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->v:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    return-object p0
.end method

.method public static bridge synthetic m0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;)Ll/bjs;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->t:Ll/bjs;

    return-object p0
.end method

.method public static bridge synthetic n0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->x:Z

    return-void
.end method


# virtual methods
.method public B0(Ll/xxj;)V
    .locals 5

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->w:Ll/xxj;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->x:Z

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/xxj;->c()Ll/xxj$a;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->q:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;

    .line 11
    .line 12
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->t:Ll/bjs;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/xxj;->h()Z

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    invoke-virtual {v2, v3, v4}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;->p0(Ll/bjs;Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ll/xxj$a;->c()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_2

    .line 26
    .line 27
    invoke-virtual {p1}, Ll/xxj;->a()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    const/4 v2, 0x0

    .line 32
    if-nez v1, :cond_1

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->v:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 35
    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    invoke-static {v1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_0

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->y0(Z)V

    .line 46
    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_1
    :goto_0
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->q0(Z)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->y0(Z)V

    .line 53
    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->t:Ll/bjs;

    .line 56
    .line 57
    invoke-virtual {v1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 62
    .line 63
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->onGiftDialogPanelSwitchChange()Ll/v3f$d;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    new-instance v2, Ll/cwj;

    .line 68
    .line 69
    invoke-direct {v2, v0}, Ll/cwj;-><init>(Z)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v1, v2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 76
    .line 77
    invoke-virtual {p1}, Ll/xxj;->d()Ll/zxj;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->R0(Ll/zxj;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->v:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 85
    .line 86
    if-eqz v0, :cond_3

    .line 87
    .line 88
    invoke-virtual {p1}, Ll/xxj;->e()Ll/zxj;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->R0(Ll/zxj;)V

    .line 93
    .line 94
    .line 95
    goto :goto_2

    .line 96
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->N0()V

    .line 97
    .line 98
    .line 99
    :goto_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->p0()V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public D0(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->m:Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->t1(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public E0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->S0()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->v:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->S0()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public G0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->j:Lcom/p1/mobile/putong/live/livingroom/increment/gift/receivegift/ReceiveGiftUsersView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->k:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->m:Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->n:Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/progress/view/PacketProgressView;

    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->l:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoOfficialView;

    .line 24
    .line 25
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public H0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->V0(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public I0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->K0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public J0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->u:Ll/vrj;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/vrj;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ll/vrj;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->u:Ll/vrj;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->u:Ll/vrj;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->v:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/vrj;->c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->u:Ll/vrj;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->y:Ll/vrj$c;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ll/vrj;->f(Ll/vrj$c;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->m:Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->s1()V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->t:Ll/bjs;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isOfficialShowRoom()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_1

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->n:Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/progress/view/PacketProgressView;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/progress/view/PacketProgressView;->E0()V

    .line 52
    .line 53
    .line 54
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;->O()V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public K0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->v:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->q0(Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->u:Ll/vrj;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    new-instance v0, Ll/vrj;

    .line 14
    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 16
    .line 17
    invoke-direct {v0, v2}, Ll/vrj;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->u:Ll/vrj;

    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->u:Ll/vrj;

    .line 23
    .line 24
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->v:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Ll/vrj;->c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->u:Ll/vrj;

    .line 30
    .line 31
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->y:Ll/vrj$c;

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Ll/vrj;->g(Ll/vrj$c;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->v:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->L0()V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->t:Ll/bjs;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isOfficialShowRoom()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_2

    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->n:Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/progress/view/PacketProgressView;

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/progress/view/PacketProgressView;->G0()V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->l:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoOfficialView;

    .line 64
    .line 65
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 66
    .line 67
    .line 68
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->m:Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;

    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->r1()V

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;

    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;->N()V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public L0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->t:Ll/bjs;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/qzj;->p(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->t:Ll/bjs;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/bjs;->X4()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->t:Ll/bjs;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Ll/qzj;->m(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final N0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->v:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Landroid/os/Looper;->getQueue()Landroid/os/MessageQueue;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/zpj;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/zpj;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/os/MessageQueue;->addIdleHandler(Landroid/os/MessageQueue$IdleHandler;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public O0(Ll/jjs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->v:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->a1(Ll/jjs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->a1(Ll/jjs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->b()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->v:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->v:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->b()V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->u:Ll/vrj;

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    new-instance v0, Ll/vrj;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 26
    .line 27
    invoke-direct {v0, v1}, Ll/vrj;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->u:Ll/vrj;

    .line 31
    .line 32
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->u:Ll/vrj;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/vrj;->e()V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->m:Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->b()V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->n:Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/progress/view/PacketProgressView;

    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/progress/view/PacketProgressView;->b()V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;->F()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public e0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->J0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getCurrentShowGiftPanel()Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->v:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->v:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 15
    .line 16
    return-object p0
.end method

.method public getFlyDestination()Ll/e060;
    .locals 5

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v1, v0, [I

    .line 3
    .line 4
    new-array v2, v0, [I

    .line 5
    .line 6
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->f:Lv/VDraweeView;

    .line 7
    .line 8
    const/4 v4, 0x0

    .line 9
    if-eqz v3, :cond_0

    .line 10
    .line 11
    invoke-virtual {v3, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/bnl0;->y0()I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    div-int/2addr v3, v0

    .line 19
    aput v3, v1, v4

    .line 20
    .line 21
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0, v2}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ll/bnl0;->y0()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    div-int/2addr p0, v0

    .line 33
    aput p0, v2, v4

    .line 34
    .line 35
    :cond_1
    new-instance p0, Ll/e060;

    .line 36
    .line 37
    invoke-direct {p0, v1, v2}, Ll/e060;-><init>([I[I)V

    .line 38
    .line 39
    .line 40
    return-object p0
.end method

.method public final o0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bqj;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;Landroid/view/View;)V

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
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->o0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onWindowFocusChanged(Z)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->t:Ll/bjs;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/bjs;->l6()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final p0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->v:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->t:Ll/bjs;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->giftDialogShowWithPacketPanel()Ll/v3f$c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->m:Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;

    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->setPacketPanelShowingFlag(Z)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->m:Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->setPacketPanelShowingFlag(Z)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public q0(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->v:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->p:Landroid/view/ViewStub;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->v:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->t:Ll/bjs;

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    invoke-virtual {v0, v1, p0, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->z0(Ll/bjs;Ll/eoj;Z)V

    .line 19
    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->v:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->v:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->w:Ll/xxj;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/xxj;->e()Ll/zxj;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->R0(Ll/zxj;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public r0(Ll/bjs;Ll/x20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bjs<",
            "*>;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->t:Ll/bjs;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->d:Landroid/view/View;

    .line 4
    .line 5
    new-instance v1, Ll/aqj;

    .line 6
    .line 7
    invoke-direct {v1, p2}, Ll/aqj;-><init>(Ll/x20;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 11
    .line 12
    .line 13
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->q:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;

    .line 14
    .line 15
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;->n0(Ll/bjs;)V

    .line 16
    .line 17
    .line 18
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-virtual {p2, p1, p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->z0(Ll/bjs;Ll/eoj;Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public s0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->v:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

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

.method public final t0()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->t:Ll/bjs;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    const/4 v0, 0x3

    .line 8
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->t:Ll/bjs;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Ll/oo2;->Z0()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    return v1

    .line 27
    :cond_1
    const/4 p0, 0x1

    .line 28
    return p0
.end method

.method public final synthetic u0()Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->q0(Z)V

    .line 3
    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method public v0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->getCurrentShowGiftPanel()Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;->J0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public w0(Ll/kpj;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/kpj;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->t0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->m:Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->m:Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->t:Ll/bjs;

    .line 22
    .line 23
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;->l1(Ll/bjs;Ll/kpj;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->m:Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;

    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public y0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->v:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->v:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 15
    .line 16
    xor-int/lit8 p1, p1, 0x1

    .line 17
    .line 18
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 22
    .line 23
    invoke-virtual {p0, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public z0(Ll/cqj;I)V
    .locals 2
    .param p1    # Ll/cqj;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/cqj;->g()Ll/coj;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Ll/coj;->e:Ll/h64;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/cqj;->g()Ll/coj;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->t:Ll/bjs;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/xzs;->E2()Ll/oo2;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isVoiceLive()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    iput-boolean v1, v0, Ll/coj;->c:Z

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->t:Ll/bjs;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isVoiceLive()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    const/4 v1, 0x1

    .line 54
    if-eqz v0, :cond_0

    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->j:Lcom/p1/mobile/putong/live/livingroom/increment/gift/receivegift/ReceiveGiftUsersView;

    .line 57
    .line 58
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->j:Lcom/p1/mobile/putong/live/livingroom/increment/gift/receivegift/ReceiveGiftUsersView;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->t:Ll/bjs;

    .line 64
    .line 65
    invoke-virtual {p0}, Ll/bjs;->F4()Ljava/util/List;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {v0, p1, p0, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/receivegift/ReceiveGiftUsersView;->Z(Ll/cqj;Ljava/util/List;I)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->k:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;

    .line 74
    .line 75
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->k:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;

    .line 79
    .line 80
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->t:Ll/bjs;

    .line 81
    .line 82
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    new-instance v0, Ll/ypj;

    .line 86
    .line 87
    invoke-direct {v0, p0}, Ll/ypj;-><init>(Ll/bjs;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p2, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;->t0(Ll/cqj;Ll/pcj;)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->k:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;

    .line 95
    .line 96
    const/4 p2, 0x0

    .line 97
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 98
    .line 99
    .line 100
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->j:Lcom/p1/mobile/putong/live/livingroom/increment/gift/receivegift/ReceiveGiftUsersView;

    .line 101
    .line 102
    invoke-static {p0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 103
    .line 104
    .line 105
    return-void
.end method
