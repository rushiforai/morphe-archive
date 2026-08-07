.class public Ll/uel0;
.super Ll/bjs;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ll/oo2;",
        ">",
        "Ll/bjs<",
        "TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bjs;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n6(Ll/uel0;Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uel0;->r6(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V

    return-void
.end method

.method public static synthetic o6(Ll/uel0;Ll/fik0;)Ll/fik0$a;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uel0;->q6(Ll/fik0;)Ll/fik0$a;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public F4()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/coj;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/uel0;->t6()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/uel0;->s6()Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    return-object v0
.end method

.method public G4(Ljava/lang/String;)Landroid/util/Pair;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ll/cqj;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/bf10;->N(Ll/i6t;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-static {p0, p1}, Ll/bf10;->E(Ll/i6t;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/bjs;->l:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v0}, Ll/ve10;->d(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Ll/cqj;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-static {p0, p1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_0
    invoke-super {p0, p1}, Ll/bjs;->G4(Ljava/lang/String;)Landroid/util/Pair;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :cond_1
    invoke-super {p0, p1}, Ll/bjs;->G4(Ljava/lang/String;)Landroid/util/Pair;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public J4()Ll/cqj;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/uel0;->p6()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {v0}, Ll/ve10;->d(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Ll/cqj;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-super {p0}, Ll/bjs;->J4()Ll/cqj;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public K4()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {p0}, Ll/bf10;->N(Ll/i6t;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/uel0;->p6()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {v0}, Ll/ve10;->g(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_2

    .line 24
    .line 25
    new-instance v0, Ll/ml50;

    .line 26
    .line 27
    const/16 v1, 0x2bc

    .line 28
    .line 29
    invoke-direct {v0, v1}, Ll/ml50;-><init>(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Ljava/lang/Boolean;

    .line 37
    .line 38
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-eqz p0, :cond_1

    .line 43
    .line 44
    const-string p0, "call-main"

    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_1
    const-string p0, "live"

    .line 48
    .line 49
    return-object p0

    .line 50
    :cond_2
    return-object v0
.end method

.method public P5(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/bjs;->P5(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ke60;

    .line 5
    .line 6
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->n:Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/progress/view/PacketProgressView;

    .line 9
    .line 10
    invoke-direct {v0, v1, p1}, Ll/ke60;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/progress/view/PacketProgressView;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/bjs;->T()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/sel0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/sel0;-><init>(Ll/uel0;)V

    .line 7
    .line 8
    .line 9
    const-class v1, Ll/fik0;

    .line 10
    .line 11
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v0, v0, Ll/aj1;->T:Lrx/subjects/b;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/tel0;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/tel0;-><init>(Ll/uel0;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public j3()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0
.end method

.method public p6()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0, v0}, Ll/bf10;->E(Ll/i6t;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic q6(Ll/fik0;)Ll/fik0$a;
    .locals 7

    .line 1
    new-instance v0, Ll/fik0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Ll/vp20;->o()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iget-object v4, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Ll/oo2;->A0()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    iget-object v6, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 56
    .line 57
    invoke-direct/range {v0 .. v6}, Ll/fik0$a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-object v0
.end method

.method public final synthetic r6(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/nhs;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/nhs;->Z(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final s6()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ll/coj;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/smj;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/smj;-><init>(I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/util/List;

    .line 12
    .line 13
    invoke-static {p0}, Ll/ve10;->a(Ljava/util/List;)Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final t6()Ljava/util/ArrayList;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ll/coj;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/rmj;

    .line 7
    .line 8
    const/16 v2, 0x2bc

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ll/rmj;-><init>(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ljava/util/List;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    move v3, v2

    .line 21
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    if-ge v3, v4, :cond_1

    .line 26
    .line 27
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 32
    .line 33
    new-instance v5, Ll/h64;

    .line 34
    .line 35
    iget-object v6, v4, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v7, v4, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userName:Ljava/lang/String;

    .line 38
    .line 39
    iget-object v8, v4, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userPicture:Ljava/lang/String;

    .line 40
    .line 41
    invoke-direct {v5, v6, v7, v8}, Ll/h64;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-object v6, v4, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 45
    .line 46
    const-string v7, "gift-audience-none-callaudience"

    .line 47
    .line 48
    iget v8, v4, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->position:I

    .line 49
    .line 50
    invoke-static {v6, v7, v8}, Ll/p54;->b(Ljava/lang/String;Ljava/lang/String;I)Ll/p54;

    .line 51
    .line 52
    .line 53
    move-result-object v6

    .line 54
    invoke-static {v5, v6}, Ll/coj;->c(Ll/h64;Ll/p54;)Ll/coj;

    .line 55
    .line 56
    .line 57
    move-result-object v5

    .line 58
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    invoke-virtual {v6}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 65
    .line 66
    .line 67
    move-result-object v6

    .line 68
    iget-object v6, v6, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {v4, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    if-eqz v4, :cond_0

    .line 75
    .line 76
    const-string v4, "call-main"

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_0
    const-string v4, "callVoiceVice"

    .line 80
    .line 81
    :goto_1
    iput-object v4, v5, Ll/coj;->g:Ljava/lang/String;

    .line 82
    .line 83
    iput-boolean v2, v5, Ll/coj;->c:Z

    .line 84
    .line 85
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    add-int/lit8 v3, v3, 0x1

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_1
    return-object v0
.end method
