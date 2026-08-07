.class public Ll/tqf0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

.field public b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public c:Ll/ogd0;

.field public d:Ll/l4g0;

.field public e:Ll/bas;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;Ll/ogd0;Ll/bas;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/tqf0;->a:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 5
    .line 6
    iput-object p2, p0, Ll/tqf0;->c:Ll/ogd0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/tqf0;->e:Ll/bas;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Ll/tqf0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tqf0;->h(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic b(Ll/tqf0;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tqf0;->i(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic c(Ll/tqf0;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tqf0;->k(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic d(Ll/tqf0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tqf0;->j()V

    return-void
.end method


# virtual methods
.method public e()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/tqf0;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/tqf0;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Ll/tqf0;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final f(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)Ll/kfd0;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-static {}, Ll/kfd0;->x()Ll/kfd0$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "e_anchor_recommend"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/kfd0$a;->w(Ljava/lang/String;)Ll/kfd0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p0, v0}, Ll/kfd0$a;->l(I)Ll/kfd0$a;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1}, Ll/kfd0$a;->c(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)Ll/kfd0$a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Ll/kfd0$a;->a()Ll/kfd0;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tqf0;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

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

.method public final synthetic h(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/tqf0;->d:Ll/l4g0;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/l4g0;->k()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/tqf0;->d:Ll/l4g0;

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/l4g0;->j()V

    .line 11
    .line 12
    .line 13
    :cond_0
    const/4 p1, 0x0

    .line 14
    iput-object p1, p0, Ll/tqf0;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 15
    .line 16
    return-void
.end method

.method public final synthetic i(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    new-instance p2, Ll/l4g0;

    .line 2
    .line 3
    const-class v0, Ll/bas;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "p_user_live_end"

    .line 10
    .line 11
    invoke-direct {p2, v1, v0}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iput-object p2, p0, Ll/tqf0;->d:Ll/l4g0;

    .line 15
    .line 16
    invoke-virtual {p2}, Ll/l4g0;->i()V

    .line 17
    .line 18
    .line 19
    iget-object p2, p0, Ll/tqf0;->d:Ll/l4g0;

    .line 20
    .line 21
    invoke-virtual {p2}, Ll/l4g0;->l()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/tqf0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)Ll/kfd0;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0, v1}, Ll/afu;->j(Ll/kfd0;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic j()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tqf0;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic k(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    iget-object p2, p0, Ll/tqf0;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLive;->new_()Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    const-string v0, "live"

    .line 13
    .line 14
    iput-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->type:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->id:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 25
    .line 26
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 27
    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->id:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 37
    .line 38
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 39
    .line 40
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->id:Ljava/lang/String;

    .line 41
    .line 42
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 43
    .line 44
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 45
    .line 46
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->o(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;->END_SUGGEST:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;

    .line 54
    .line 55
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->n(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/tqf0;->c:Ll/ogd0;

    .line 59
    .line 60
    invoke-virtual {v0}, Ll/ogd0;->E0()Ll/agd0;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Ll/agd0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    if-eqz v0, :cond_1

    .line 69
    .line 70
    iget-object v0, p0, Ll/tqf0;->c:Ll/ogd0;

    .line 71
    .line 72
    invoke-virtual {v0}, Ll/ogd0;->E0()Ll/agd0;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v0}, Ll/agd0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 81
    .line 82
    filled-new-array {v0}, [Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->l([Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 87
    .line 88
    .line 89
    :cond_1
    iget-object v0, p0, Ll/tqf0;->c:Ll/ogd0;

    .line 90
    .line 91
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->m()Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    invoke-virtual {v0, p2}, Ll/ogd0;->V0(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0, p1}, Ll/tqf0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)Ll/kfd0;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    const-string p1, "p_user_live_end"

    .line 103
    .line 104
    invoke-static {p0, p1}, Ll/afu;->h(Ll/kfd0;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public final l(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/tqf0;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/tqf0;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void

    .line 17
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sget v1, Ll/yec0;->R1:I

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-static {v0, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;

    .line 29
    .line 30
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->coverUrl:Ljava/lang/String;

    .line 33
    .line 34
    if-eqz v1, :cond_2

    .line 35
    .line 36
    const-string v2, "context_single_room"

    .line 37
    .line 38
    iget-object v3, v0, Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;->b:Lv/VDraweeView;

    .line 39
    .line 40
    invoke-static {v2, v3, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :cond_2
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;->e:Lv/VText;

    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->a3:I

    .line 50
    .line 51
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    iget-object v3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 56
    .line 57
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->name:Ljava/lang/String;

    .line 58
    .line 59
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    .line 69
    .line 70
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 71
    .line 72
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-direct {v1, v2, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    .line 77
    .line 78
    .line 79
    iput-object v1, p0, Ll/tqf0;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 80
    .line 81
    new-instance v2, Ll/pqf0;

    .line 82
    .line 83
    invoke-direct {v2, p0}, Ll/pqf0;-><init>(Ll/tqf0;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 87
    .line 88
    .line 89
    iget-object v1, p0, Ll/tqf0;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 90
    .line 91
    new-instance v2, Ll/qqf0;

    .line 92
    .line 93
    invoke-direct {v2, p0, p2}, Ll/qqf0;-><init>(Ll/tqf0;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 97
    .line 98
    .line 99
    iget-object v1, p0, Ll/tqf0;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 100
    .line 101
    const/4 v2, 0x1

    .line 102
    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 103
    .line 104
    .line 105
    iget-object v1, p0, Ll/tqf0;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 106
    .line 107
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 108
    .line 109
    .line 110
    new-instance v1, Ll/rqf0;

    .line 111
    .line 112
    invoke-direct {v1, p0}, Ll/rqf0;-><init>(Ll/tqf0;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;->setCloseAction(Ll/x20;)V

    .line 116
    .line 117
    .line 118
    new-instance v1, Ll/sqf0;

    .line 119
    .line 120
    invoke-direct {v1, p0, p2}, Ll/sqf0;-><init>(Ll/tqf0;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;->setJumpAction(Ll/y20;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;->r(Lcom/p1/mobile/android/app/Frag;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;->q()V

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tqf0;->a:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Ll/tqf0;->l(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
