.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;
.super Ll/p4;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;


# direct methods
.method public constructor <init>(Ll/las;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ll/oo2;",
            ">(",
            "Ll/las;",
            "Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ll/p4;-><init>(Ll/las;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;->i()V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;->j(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;->h(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public a()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;->d:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->j()Z

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

.method public b(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/p4;->b(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;->g()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;->d:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;

    .line 8
    .line 9
    new-instance v1, Ll/mas;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/mas;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;->k(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/p4;->c()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;->d:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->f()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;->d:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {v0, v1}, Ll/ynp0;->E(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;->d:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-static {p0, v0}, Ll/ynp0;->v(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final g()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;->d:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/p4;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Ll/yec0;->a:I

    .line 16
    .line 17
    iget-object v2, p0, Ll/p4;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;->d:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;

    .line 27
    .line 28
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;->d:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    iget-object v0, p0, Ll/p4;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;->d:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;

    .line 39
    .line 40
    sget v1, Ll/bnl0;->f:I

    .line 41
    .line 42
    sget v2, Ll/bnl0;->e:I

    .line 43
    .line 44
    invoke-virtual {v0, p0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public final synthetic h(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/p4;->a:Ll/las;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;->d:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->getUid()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Ll/las;->Y3(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic i()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;->d:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->o()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/p4;->a:Ll/las;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/las;->R3()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final j(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/p4;->b:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    .line 2
    .line 3
    iget-object v0, p0, Ll/p4;->a:Ll/las;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/oo2;->A0()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->g(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/a$a;

    .line 18
    .line 19
    const/16 v1, 0x5dc

    .line 20
    .line 21
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/a$a;-><init>(I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/a$a;->f(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/a$a;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/a$a;->e()Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/a;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object p0, p0, Ll/p4;->a:Ll/las;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftTraysEvent:Lcom/tantan/live/eventbus/LiveEventBus$GiftTraysEvent;

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftTraysEvent;->addGiftTrayDataToList()Ll/v3f$d;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final k(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/p4;->a:Ll/las;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;->d:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/las;->Z3(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->isWealthHierarchy:Z

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;->d:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->v(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 16
    .line 17
    .line 18
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userGrade:J

    .line 19
    .line 20
    const-wide/16 v3, 0x14

    .line 21
    .line 22
    cmp-long v0, v0, v3

    .line 23
    .line 24
    if-gez v0, :cond_0

    .line 25
    .line 26
    const-wide/16 v0, 0x9c4

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/4 v2, 0x1

    .line 30
    const-wide/16 v0, 0xbb8

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->t(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 34
    .line 35
    .line 36
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->showDuration:J

    .line 37
    .line 38
    const-wide/16 v3, 0x384

    .line 39
    .line 40
    cmp-long v0, v0, v3

    .line 41
    .line 42
    if-gez v0, :cond_2

    .line 43
    .line 44
    const-wide/16 v0, 0x3e8

    .line 45
    .line 46
    iput-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->showDuration:J

    .line 47
    .line 48
    :cond_2
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->showDuration:J

    .line 49
    .line 50
    sub-long/2addr v0, v3

    .line 51
    :goto_0
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;->d:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;

    .line 52
    .line 53
    new-instance v4, Ll/nas;

    .line 54
    .line 55
    invoke-direct {v4, p0}, Ll/nas;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v3, v2, v0, v1, v4}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;->f(Landroid/view/View;ZJLl/x20;)Landroid/animation/AnimatorSet;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;->d:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;

    .line 63
    .line 64
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->setAnim(Landroid/animation/AnimatorSet;)V

    .line 65
    .line 66
    .line 67
    invoke-static {p1}, Ll/muj;->n(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->getMixResId()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    new-instance v0, Ll/oas;

    .line 75
    .line 76
    invoke-direct {v0, p0}, Ll/oas;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;)V

    .line 77
    .line 78
    .line 79
    invoke-static {p1, v0}, Ll/wqe;->b(Ljava/lang/String;Ll/y20;)Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    if-nez p1, :cond_3

    .line 84
    .line 85
    return-void

    .line 86
    :cond_3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/b;->j(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method
