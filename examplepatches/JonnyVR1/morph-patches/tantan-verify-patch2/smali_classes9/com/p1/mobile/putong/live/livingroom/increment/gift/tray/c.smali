.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/c;
.super Ll/p4;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;


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

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/c;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/c;->g(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/c;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/c;->h(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V

    return-void
.end method

.method private f()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/c;->d:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;

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
    sget v1, Ll/yec0;->b:I

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
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/c;->d:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;

    .line 27
    .line 28
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/c;->d:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/c;->d:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;

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

.method private synthetic g(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/p4;->a:Ll/las;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/c;->d:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->getUid()Ljava/lang/String;

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

.method private h(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/p4;->b:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    .line 2
    .line 3
    iget-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->animationSizeType:J

    .line 4
    .line 5
    const-wide/16 v3, 0x1

    .line 6
    .line 7
    cmp-long v3, v1, v3

    .line 8
    .line 9
    if-nez v3, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/c;->d:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;

    .line 12
    .line 13
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->g(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const-wide/16 v3, 0x2

    .line 18
    .line 19
    cmp-long p1, v1, v3

    .line 20
    .line 21
    if-nez p1, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->getMixResId()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-nez p1, :cond_1

    .line 32
    .line 33
    iget-object p1, p0, Ll/p4;->b:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    .line 34
    .line 35
    iget-object v0, p0, Ll/p4;->a:Ll/las;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Ll/oo2;->A0()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->g(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/a$a;

    .line 50
    .line 51
    const/16 v1, 0x5dc

    .line 52
    .line 53
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/a$a;-><init>(I)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/a$a;->f(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/a$a;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/a$a;->e()Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/a;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iget-object p0, p0, Ll/p4;->a:Ll/las;

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftTraysEvent:Lcom/tantan/live/eventbus/LiveEventBus$GiftTraysEvent;

    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftTraysEvent;->addGiftTrayDataToList()Ll/v3f$d;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    :cond_1
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/c;->d:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->e()Z

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
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/c;->f()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/c;->d:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;

    .line 8
    .line 9
    new-instance v1, Ll/pas;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/pas;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/c;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/c;->i(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/c;->d:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->d()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/c;->d:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {v0, v1}, Ll/ynp0;->E(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/c;->d:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;

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

.method public final i(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/p4;->a:Ll/las;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/c;->d:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/las;->Z3(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/c;->d:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->l(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 11
    .line 12
    .line 13
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->showDuration:J

    .line 14
    .line 15
    const-wide/16 v2, 0x384

    .line 16
    .line 17
    cmp-long v0, v0, v2

    .line 18
    .line 19
    if-gez v0, :cond_0

    .line 20
    .line 21
    const-wide/16 v0, 0x3e8

    .line 22
    .line 23
    iput-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->showDuration:J

    .line 24
    .line 25
    :cond_0
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->showDuration:J

    .line 26
    .line 27
    sub-long/2addr v0, v2

    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/c;->d:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;

    .line 29
    .line 30
    iget-object v3, p0, Ll/p4;->a:Ll/las;

    .line 31
    .line 32
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    new-instance v4, Ll/qas;

    .line 36
    .line 37
    invoke-direct {v4, v3}, Ll/qas;-><init>(Ll/las;)V

    .line 38
    .line 39
    .line 40
    const/4 v3, 0x0

    .line 41
    invoke-static {v2, v3, v0, v1, v4}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;->f(Landroid/view/View;ZJLl/x20;)Landroid/animation/AnimatorSet;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/c;->d:Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;

    .line 46
    .line 47
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionNewMessageView;->setAnim(Landroid/animation/AnimatorSet;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->getMixResId()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    new-instance v0, Ll/ras;

    .line 55
    .line 56
    invoke-direct {v0, p0}, Ll/ras;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/c;)V

    .line 57
    .line 58
    .line 59
    invoke-static {p1, v0}, Ll/wqe;->b(Ljava/lang/String;Ll/y20;)Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    if-nez p1, :cond_1

    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/c;->h(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method
