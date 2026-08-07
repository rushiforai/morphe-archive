.class public Ll/hnm0;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/jlm0;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public final j:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;",
            ">;"
        }
    .end annotation
.end field

.field public final k:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public final l:Ll/gio0;

.field public m:Ll/uqo0;

.field public n:Ll/kcg0;

.field public o:Z

.field public p:Ll/jl80;


# direct methods
.method public constructor <init>(Ll/gio0;Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    iput-object p2, p0, Ll/hnm0;->i:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    iput-object p2, p0, Ll/hnm0;->j:Lrx/subjects/a;

    .line 15
    .line 16
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    iput-object p2, p0, Ll/hnm0;->k:Lrx/subjects/a;

    .line 21
    .line 22
    new-instance p2, Ll/uqo0;

    .line 23
    .line 24
    invoke-direct {p2}, Ll/uqo0;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object p2, p0, Ll/hnm0;->m:Ll/uqo0;

    .line 28
    .line 29
    iput-object p1, p0, Ll/hnm0;->l:Ll/gio0;

    .line 30
    .line 31
    return-void
.end method

.method public static synthetic A4(Ll/qcj;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)Lrx/c;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lrx/c;

    .line 8
    .line 9
    return-object p0
.end method

.method public static synthetic B4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic C4(Ll/hnm0;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hnm0;->c5(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic D4(Ljava/lang/Throwable;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->EMPTY_ROOM:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 2
    .line 3
    return-object p0
.end method

.method private D5()V
    .locals 3

    .line 1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->vf:I

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->d7:I

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, ""

    .line 22
    .line 23
    invoke-virtual {p0, v2, v0, v1}, Ll/hnm0;->E5(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private E4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hnm0;->j:Lrx/subjects/a;

    .line 2
    .line 3
    iget-object v1, p0, Ll/hnm0;->i:Lrx/subjects/a;

    .line 4
    .line 5
    new-instance v2, Ll/gnm0;

    .line 6
    .line 7
    invoke-direct {v2}, Ll/gnm0;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1, v2}, Lrx/c;->zip(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Ll/hnm0;->k:Lrx/subjects/a;

    .line 15
    .line 16
    new-instance v2, Ll/nlm0;

    .line 17
    .line 18
    invoke-direct {v2}, Ll/nlm0;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/olm0;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/olm0;-><init>(Ll/hnm0;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/plm0;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/plm0;-><init>(Ll/hnm0;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ll/qlm0;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/qlm0;-><init>(Ll/hnm0;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/rlm0;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/rlm0;-><init>(Ll/hnm0;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v1, Ll/slm0;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Ll/slm0;-><init>(Ll/hnm0;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    new-instance v1, Ll/tlm0;

    .line 75
    .line 76
    invoke-direct {v1, p0}, Ll/tlm0;-><init>(Ll/hnm0;)V

    .line 77
    .line 78
    .line 79
    new-instance v2, Ll/xlm0;

    .line 80
    .line 81
    invoke-direct {v2, p0}, Ll/xlm0;-><init>(Ll/hnm0;)V

    .line 82
    .line 83
    .line 84
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method private H5()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hnm0;->m:Ll/uqo0;

    .line 2
    .line 3
    iget-object v1, v0, Ll/uqo0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 4
    .line 5
    if-eqz v1, :cond_1

    .line 6
    .line 7
    iget-object v2, v0, Ll/uqo0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 8
    .line 9
    if-eqz v2, :cond_1

    .line 10
    .line 11
    iget-object v0, v0, Ll/uqo0;->b:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->isMaskMode()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ll/jlm0;

    .line 26
    .line 27
    iget-object v1, p0, Ll/hnm0;->l:Ll/gio0;

    .line 28
    .line 29
    invoke-virtual {v1}, Ll/gio0;->g4()Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Ll/rwn0;->K2(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ll/jlm0;

    .line 41
    .line 42
    iget-object v1, p0, Ll/hnm0;->m:Ll/uqo0;

    .line 43
    .line 44
    iget-object v1, v1, Ll/uqo0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ll/rwn0;->i(Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Ll/jlm0;

    .line 54
    .line 55
    invoke-virtual {v0}, Ll/rwn0;->O2()Ll/szn0;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget-object v1, p0, Ll/hnm0;->m:Ll/uqo0;

    .line 60
    .line 61
    iget-object v1, v1, Ll/uqo0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Ll/szn0;->n(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Ll/jlm0;

    .line 71
    .line 72
    iget-object v1, p0, Ll/hnm0;->m:Ll/uqo0;

    .line 73
    .line 74
    iget-object v1, v1, Ll/uqo0;->b:Lcom/p1/mobile/putong/data/User;

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Ll/oo2;->R(Lcom/p1/mobile/putong/data/User;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    check-cast v0, Ll/jlm0;

    .line 84
    .line 85
    iget-object p0, p0, Ll/hnm0;->m:Ll/uqo0;

    .line 86
    .line 87
    iget-object p0, p0, Ll/uqo0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 88
    .line 89
    invoke-virtual {v0, p0}, Ll/oo2;->V(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 90
    .line 91
    .line 92
    :cond_1
    return-void
.end method

.method private I5(Z)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/amm0;

    .line 14
    .line 15
    invoke-direct {v1, p0, p1}, Ll/amm0;-><init>(Ll/hnm0;Z)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    new-instance v0, Ll/bmm0;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Ll/bmm0;-><init>(Ll/hnm0;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    new-instance v0, Ll/cmm0;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Ll/cmm0;-><init>(Ll/hnm0;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, v0}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    new-instance p1, Ll/dmm0;

    .line 41
    .line 42
    invoke-direct {p1}, Ll/dmm0;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, p1}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0
.end method

.method public static synthetic J3(Ll/hnm0;Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hnm0;->n5(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V

    return-void
.end method

.method public static synthetic K3(Ll/hnm0;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hnm0;->T4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic L3(Ll/hnm0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hnm0;->e5(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic M3(Ll/hnm0;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hnm0;->Z4(Landroid/util/Pair;)V

    return-void
.end method

.method private M4(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 9
    .line 10
    if-eqz v0, :cond_e

    .line 11
    .line 12
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 13
    .line 14
    iget v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 15
    .line 16
    const v1, 0xa035

    .line 17
    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    if-ne v0, v1, :cond_0

    .line 21
    .line 22
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->yd:I

    .line 23
    .line 24
    invoke-static {p1}, Ll/o1j0;->h(I)V

    .line 25
    .line 26
    .line 27
    goto/16 :goto_0

    .line 28
    .line 29
    :cond_0
    const v1, 0xa030

    .line 30
    .line 31
    .line 32
    if-eq v0, v1, :cond_c

    .line 33
    .line 34
    const v1, 0xa03c

    .line 35
    .line 36
    .line 37
    if-eq v0, v1, :cond_c

    .line 38
    .line 39
    const v1, 0xc745

    .line 40
    .line 41
    .line 42
    if-eq v0, v1, :cond_c

    .line 43
    .line 44
    const v1, 0xa801

    .line 45
    .line 46
    .line 47
    if-eq v0, v1, :cond_c

    .line 48
    .line 49
    const v1, 0xa811

    .line 50
    .line 51
    .line 52
    if-eq v0, v1, :cond_c

    .line 53
    .line 54
    const v1, 0xa836

    .line 55
    .line 56
    .line 57
    if-eq v0, v1, :cond_c

    .line 58
    .line 59
    const v1, 0xa806

    .line 60
    .line 61
    .line 62
    if-ne v0, v1, :cond_1

    .line 63
    .line 64
    goto/16 :goto_3

    .line 65
    .line 66
    :cond_1
    const p1, 0xa028

    .line 67
    .line 68
    .line 69
    if-eq v0, p1, :cond_b

    .line 70
    .line 71
    const p1, 0xa02a

    .line 72
    .line 73
    .line 74
    if-ne v0, p1, :cond_2

    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_2
    const p1, 0xa032

    .line 78
    .line 79
    .line 80
    if-ne v0, p1, :cond_3

    .line 81
    .line 82
    invoke-direct {p0}, Ll/hnm0;->x5()V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_3
    const p1, 0xa02d

    .line 87
    .line 88
    .line 89
    if-ne v0, p1, :cond_4

    .line 90
    .line 91
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->H2:I

    .line 92
    .line 93
    invoke-static {p1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    goto :goto_4

    .line 98
    :cond_4
    const p1, 0xa036

    .line 99
    .line 100
    .line 101
    if-eq v0, p1, :cond_a

    .line 102
    .line 103
    const p1, 0xa039

    .line 104
    .line 105
    .line 106
    if-eq v0, p1, :cond_a

    .line 107
    .line 108
    const p1, 0xa03a

    .line 109
    .line 110
    .line 111
    if-ne v0, p1, :cond_5

    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_5
    const p1, 0xa037

    .line 115
    .line 116
    .line 117
    if-ne v0, p1, :cond_6

    .line 118
    .line 119
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->cb:I

    .line 120
    .line 121
    invoke-static {p1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    goto :goto_4

    .line 126
    :cond_6
    const p1, 0xa031

    .line 127
    .line 128
    .line 129
    if-ne v0, p1, :cond_7

    .line 130
    .line 131
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->P:I

    .line 132
    .line 133
    invoke-static {p1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    goto :goto_4

    .line 138
    :cond_7
    const p1, 0xa052

    .line 139
    .line 140
    .line 141
    if-ne v0, p1, :cond_8

    .line 142
    .line 143
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->G2:I

    .line 148
    .line 149
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    new-instance v2, Ll/ylm0;

    .line 154
    .line 155
    invoke-direct {v2, p0}, Ll/ylm0;-><init>(Ll/hnm0;)V

    .line 156
    .line 157
    .line 158
    goto :goto_4

    .line 159
    :cond_8
    const p1, 0xa802

    .line 160
    .line 161
    .line 162
    if-ne v0, p1, :cond_9

    .line 163
    .line 164
    invoke-direct {p0}, Ll/hnm0;->x5()V

    .line 165
    .line 166
    .line 167
    return-void

    .line 168
    :cond_9
    :goto_0
    const-string p1, ""

    .line 169
    .line 170
    goto :goto_4

    .line 171
    :cond_a
    :goto_1
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->x:I

    .line 172
    .line 173
    invoke-static {p1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    goto :goto_4

    .line 178
    :cond_b
    :goto_2
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->f6:I

    .line 179
    .line 180
    invoke-static {p1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    goto :goto_4

    .line 185
    :cond_c
    :goto_3
    iget-object p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 186
    .line 187
    :goto_4
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 188
    .line 189
    .line 190
    move-result v0

    .line 191
    if-nez v0, :cond_d

    .line 192
    .line 193
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 202
    .line 203
    .line 204
    move-result-object p0

    .line 205
    const/4 p1, 0x0

    .line 206
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 207
    .line 208
    .line 209
    move-result-object p0

    .line 210
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->y5:I

    .line 211
    .line 212
    invoke-static {p1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    new-instance v0, Ll/zlm0;

    .line 217
    .line 218
    invoke-direct {v0, v2}, Ll/zlm0;-><init>(Ll/x20;)V

    .line 219
    .line 220
    .line 221
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 226
    .line 227
    .line 228
    :cond_d
    return-void

    .line 229
    :cond_e
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->E9:I

    .line 230
    .line 231
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 232
    .line 233
    .line 234
    return-void
.end method

.method public static synthetic N3(Ll/hnm0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hnm0;->q5(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V

    return-void
.end method

.method public static synthetic O3(Ll/x20;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method private O4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)Z
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->title:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Ll/hnm0;->l:Ll/gio0;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/gio0;->f4()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->topics:Ljava/util/List;

    .line 16
    .line 17
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Ll/hnm0;->l:Ll/gio0;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/gio0;->d4()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->topics:Ljava/util/List;

    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;

    .line 39
    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;->name:Ljava/lang/String;

    .line 41
    .line 42
    iget-object p0, p0, Ll/hnm0;->l:Ll/gio0;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/gio0;->d4()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;->name:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-nez p0, :cond_0

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    return v0

    .line 58
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 59
    return p0
.end method

.method public static synthetic P3(Ll/hnm0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hnm0;->l5()V

    return-void
.end method

.method public static synthetic R3(Ll/hnm0;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)Lrx/c;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hnm0;->v5(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic S3(Ljava/lang/Throwable;)Lcom/p1/mobile/putong/live/base/data/BLiveVoice;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->EMPTY:Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic T3(Ljava/lang/Throwable;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method private synthetic T4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hnm0;->I4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic U3(Ll/hnm0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hnm0;->M4(Ljava/lang/Throwable;)V

    return-void
.end method

.method private synthetic U4(Ll/jsv;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/jsv;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x4

    .line 6
    if-eq v0, v1, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    check-cast p1, Ll/v9s;

    .line 10
    .line 11
    invoke-direct {p0, p1}, Ll/hnm0;->s5(Ll/v9s;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic V3(Ll/hnm0;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hnm0;->b5(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic W3(Ll/hnm0;ZLjava/lang/Boolean;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hnm0;->p5(ZLjava/lang/Boolean;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic X3(Ll/hnm0;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hnm0;->Q4(Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Y3(Ll/hnm0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)Lrx/c;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hnm0;->t5(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Z3(Ll/hnm0;Z)Lrx/c;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hnm0;->I5(Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a4(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)Lrx/c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Ll/itv;->Q(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic b4(Ll/hnm0;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hnm0;->a5(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V

    return-void
.end method

.method public static synthetic c4(Ll/hnm0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hnm0;->g5(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic d4(Ll/hnm0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hnm0;->S4(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic e4(Ll/hnm0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hnm0;->h5()V

    return-void
.end method

.method public static synthetic f4(Ljava/lang/Boolean;Ll/uxj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic g4(Ll/hnm0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hnm0;->m5()V

    return-void
.end method

.method public static synthetic h4(Ll/hnm0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hnm0;->d5()V

    return-void
.end method

.method public static synthetic i4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    return-object p1
.end method

.method public static synthetic j4(Ll/hnm0;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hnm0;->Y4(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic k4()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic l4(Ll/hnm0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hnm0;->j5(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic m4(Ll/hnm0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hnm0;->R4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic n4(Ll/hnm0;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hnm0;->f5(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V

    return-void
.end method

.method public static synthetic o4(Landroid/util/Pair;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic p4(Ll/hnm0;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hnm0;->P4(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic q4(Ll/hnm0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hnm0;->r5(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic r4(Ll/hnm0;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hnm0;->V4(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V

    return-void
.end method

.method public static synthetic s4(Ll/hnm0;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hnm0;->i5(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V

    return-void
.end method

.method private s5(Ll/v9s;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Ll/v9s;->l()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->dismissDialog()Ll/v3f$c;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ll/v3f$c;->p()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ll/v9s;->m()Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 29
    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getToLiveId()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->E(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->getSource()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    const/4 v2, 0x1

    .line 51
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->Q(Z)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-static {v0, v1}, Ll/z91;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_0
    invoke-virtual {p1}, Ll/v9s;->n()Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-eqz p1, :cond_1

    .line 72
    .line 73
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    check-cast v2, Ll/jlm0;

    .line 86
    .line 87
    invoke-virtual {v2}, Ll/rwn0;->O2()Ll/szn0;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-virtual {v2}, Ll/szn0;->c()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    check-cast v3, Ll/jlm0;

    .line 100
    .line 101
    invoke-virtual {v3}, Ll/rwn0;->O2()Ll/szn0;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    invoke-virtual {v3}, Ll/szn0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    check-cast v4, Ll/jlm0;

    .line 114
    .line 115
    invoke-virtual {v4}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    invoke-static {v1, v2, v3, v4, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceLiveEndAct;->X1(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)Landroid/content/Intent;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 124
    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    const-string v1, ""

    .line 132
    .line 133
    invoke-static {p1, v1, v0}, Lcom/p1/mobile/putong/live/LiveDialogAct;->h2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 141
    .line 142
    .line 143
    return-void
.end method

.method public static synthetic t4(Ll/hnm0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hnm0;->k5()V

    return-void
.end method

.method private t5(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoice;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/smm0;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/smm0;-><init>(Ll/hnm0;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance v0, Ll/umm0;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/umm0;-><init>(Ll/hnm0;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance v0, Ll/vmm0;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Ll/vmm0;-><init>(Ll/hnm0;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v0}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    new-instance p1, Ll/wmm0;

    .line 37
    .line 38
    invoke-direct {p1}, Ll/wmm0;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, p1}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public static synthetic u4(Ll/hnm0;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hnm0;->W4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V

    return-void
.end method

.method private u5(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    sget-object v0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 2
    .line 3
    const-string v1, "create_voice_room"

    .line 4
    .line 5
    const-string v2, "voice_prepareUser"

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/lej0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 15
    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/hnm0;->m:Ll/uqo0;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ll/uqo0;->a(Lcom/p1/mobile/putong/data/User;)V

    .line 22
    .line 23
    .line 24
    invoke-direct {p0}, Ll/hnm0;->H5()V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public static synthetic v4(Ll/hnm0;Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hnm0;->o5(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;Ljava/lang/Throwable;)V

    return-void
.end method

.method private v5(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoice;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/emm0;

    .line 6
    .line 7
    invoke-direct {v1, p1}, Ll/emm0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance v0, Ll/xlm0;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/xlm0;-><init>(Ll/hnm0;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v0}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    new-instance p1, Ll/fmm0;

    .line 28
    .line 29
    invoke-direct {p1}, Ll/fmm0;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public static synthetic w4(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private w5(Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    new-instance p1, Ll/bri0;

    .line 29
    .line 30
    invoke-direct {p1, p3}, Ll/bri0;-><init>(Ll/x20;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/android/app/Dialog$e;->n0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic x4(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)Lrx/c;
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->EMPTY:Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 2
    .line 3
    if-ne p0, p1, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0}, Ll/itv;->Q(Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method private x5()V
    .locals 3

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->getAnchorInfo(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/qmm0;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/qmm0;-><init>(Ll/hnm0;)V

    .line 18
    .line 19
    .line 20
    new-instance v2, Ll/rmm0;

    .line 21
    .line 22
    invoke-direct {v2, p0}, Ll/rmm0;-><init>(Ll/hnm0;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static synthetic y4(Ll/hnm0;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hnm0;->U4(Ll/jsv;)V

    return-void
.end method

.method public static synthetic z4(Ll/hnm0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hnm0;->X4(Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public A5(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hnm0;->m:Ll/uqo0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/uqo0;->c(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public B5(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hnm0;->i:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final C5()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/hnm0;->p:Ll/jl80;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->newDialog()Ll/jl80$a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->ui:I

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    new-array v3, v2, [Ljava/lang/Object;

    .line 17
    .line 18
    invoke-virtual {v0, v1, v3}, Ll/jl80$a;->x0(I[Ljava/lang/Object;)Ll/jl80$a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->si:I

    .line 23
    .line 24
    new-array v2, v2, [Ljava/lang/Object;

    .line 25
    .line 26
    invoke-virtual {v0, v1, v2}, Ll/jl80$a;->s0(I[Ljava/lang/Object;)Ll/jl80$a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const v1, 0x800003

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ll/jl80$a;->q0(I)Ll/jl80$a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->ti:I

    .line 38
    .line 39
    new-instance v2, Ll/vlm0;

    .line 40
    .line 41
    invoke-direct {v2, p0}, Ll/vlm0;-><init>(Ll/hnm0;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1, v2}, Ll/jl80$a;->a0(ILjava/lang/Runnable;)Ll/jl80$a;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->ri:I

    .line 49
    .line 50
    new-instance v2, Ll/wlm0;

    .line 51
    .line 52
    invoke-direct {v2, p0}, Ll/wlm0;-><init>(Ll/hnm0;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1, v2}, Ll/jl80$a;->U(ILjava/lang/Runnable;)Ll/jl80$a;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Ll/jl80$a;->O()Ll/jl80;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iput-object v0, p0, Ll/hnm0;->p:Ll/jl80;

    .line 64
    .line 65
    :cond_0
    iget-object p0, p0, Ll/hnm0;->p:Ll/jl80;

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/jl80;->show()V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public E5(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance p2, Ll/fnm0;

    .line 18
    .line 19
    invoke-direct {p2, p0}, Ll/fnm0;-><init>(Ll/hnm0;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, p3, p2}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->z:I

    .line 31
    .line 32
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Dialog$e;->m0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final F4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/jlm0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->bossAnchorAway(Ljava/lang/String;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/zmm0;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/zmm0;-><init>(Ll/hnm0;)V

    .line 26
    .line 27
    .line 28
    new-instance p0, Ll/r5k;

    .line 29
    .line 30
    invoke-direct {p0}, Ll/r5k;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public F5(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/hnm0;->G5(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public G4()V
    .locals 3

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->getOnGoingLive(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/mlm0;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/mlm0;-><init>(Ll/hnm0;)V

    .line 18
    .line 19
    .line 20
    new-instance v2, Ll/xlm0;

    .line 21
    .line 22
    invoke-direct {v2, p0}, Ll/xlm0;-><init>(Ll/hnm0;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final G5(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/hnm0;->o:Z

    .line 3
    .line 4
    new-instance v0, Ll/z310;

    .line 5
    .line 6
    const/16 v1, 0xa28

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/z310;-><init>(I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/h0m;

    .line 16
    .line 17
    invoke-interface {v0}, Ll/h0m;->b()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->X2:I

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 27
    .line 28
    .line 29
    invoke-static {p1}, Ll/itv;->T(Ljava/lang/String;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    new-instance v0, Ll/xmm0;

    .line 38
    .line 39
    invoke-direct {v0, p0, p2}, Ll/xmm0;-><init>(Ll/hnm0;Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

    .line 40
    .line 41
    .line 42
    new-instance v1, Ll/ymm0;

    .line 43
    .line 44
    invoke-direct {v1, p0, p2}, Ll/ymm0;-><init>(Ll/hnm0;Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final H4(ZLjava/lang/String;ZLcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Ll/jlm0;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/vp20;->m()Ll/jsv;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Ll/jsv;->c()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-nez p1, :cond_4

    .line 25
    .line 26
    sget-object p1, Ll/v9s;->e:Ll/v9s;

    .line 27
    .line 28
    invoke-virtual {p1, p4}, Ll/v9s;->p(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Ll/jlm0;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ll/vp20;->h(Ll/jsv;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    new-instance p1, Ll/z310;

    .line 42
    .line 43
    const/16 v0, 0xa28

    .line 44
    .line 45
    invoke-direct {p1, v0}, Ll/z310;-><init>(I)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, Ll/h0m;

    .line 53
    .line 54
    if-eqz p1, :cond_1

    .line 55
    .line 56
    invoke-interface {p1}, Ll/h0m;->b()V

    .line 57
    .line 58
    .line 59
    :cond_1
    iget-boolean p1, p0, Ll/hnm0;->o:Z

    .line 60
    .line 61
    if-eqz p1, :cond_2

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    check-cast p1, Ll/jlm0;

    .line 69
    .line 70
    invoke-virtual {p1}, Ll/vp20;->m()Ll/jsv;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p1}, Ll/jsv;->c()Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-nez p1, :cond_4

    .line 79
    .line 80
    new-instance p1, Ll/v9s;

    .line 81
    .line 82
    invoke-direct {p1, p2, p3}, Ll/v9s;-><init>(Ljava/lang/String;Z)V

    .line 83
    .line 84
    .line 85
    if-eqz p4, :cond_3

    .line 86
    .line 87
    invoke-virtual {p1, p4}, Ll/v9s;->p(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

    .line 88
    .line 89
    .line 90
    :cond_3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    check-cast p0, Ll/jlm0;

    .line 95
    .line 96
    invoke-virtual {p0, p1}, Ll/vp20;->h(Ll/jsv;)V

    .line 97
    .line 98
    .line 99
    :cond_4
    :goto_0
    return-void
.end method

.method public I4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/jlm0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->m()Ll/jsv;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/jsv;->f()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->VOICE_LIVE_MODEL_BOSS:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Ll/jlm0;

    .line 32
    .line 33
    invoke-virtual {v1}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/hnm0;->C5()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    invoke-direct {p0}, Ll/hnm0;->D5()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public J4(Ll/qcj;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "Ljava/lang/String;",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoice;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->getRoomInfo(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->getUserMask(Ljava/lang/String;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    new-instance v2, Ll/gmm0;

    .line 22
    .line 23
    invoke-direct {v2}, Ll/gmm0;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-static {v0, v1, v2}, Lrx/c;->zip(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/hmm0;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/hmm0;-><init>(Ll/hnm0;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/jmm0;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/jmm0;-><init>(Ll/hnm0;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/kmm0;

    .line 49
    .line 50
    invoke-direct {v1}, Ll/kmm0;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/lmm0;

    .line 58
    .line 59
    invoke-direct {v1, p1}, Ll/lmm0;-><init>(Ll/qcj;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    new-instance v0, Ll/mmm0;

    .line 67
    .line 68
    invoke-direct {v0, p0}, Ll/mmm0;-><init>(Ll/hnm0;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    new-instance v0, Ll/nmm0;

    .line 76
    .line 77
    invoke-direct {v0}, Ll/nmm0;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    new-instance v0, Ll/omm0;

    .line 85
    .line 86
    invoke-direct {v0, p0}, Ll/omm0;-><init>(Ll/hnm0;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p1, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    new-instance v0, Ll/pmm0;

    .line 98
    .line 99
    invoke-direct {v0, p0}, Ll/pmm0;-><init>(Ll/hnm0;)V

    .line 100
    .line 101
    .line 102
    new-instance v1, Ll/xlm0;

    .line 103
    .line 104
    invoke-direct {v1, p0}, Ll/xlm0;-><init>(Ll/hnm0;)V

    .line 105
    .line 106
    .line 107
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public K4(Ll/x20;Ll/x20;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hnm0;->j:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-interface {p1}, Ll/x20;->call()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/hnm0;->i:Lrx/subjects/a;

    .line 13
    .line 14
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    if-nez p0, :cond_1

    .line 19
    .line 20
    invoke-interface {p2}, Ll/x20;->call()V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public L4()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/hnm0;->k:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final N4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->isMaskMode()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p0, p0, Ll/hnm0;->l:Ll/gio0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/gio0;->h4()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eq p1, p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final synthetic P4(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hnm0;->u5(Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic Q4(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/jlm0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/vp20;->m()Ll/jsv;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/jsv;->j()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    xor-int/lit8 p0, p0, 0x1

    .line 16
    .line 17
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public final synthetic R4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Za:I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic S4(Ll/uxj0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ll/jlm0;

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p1, v0}, Ll/rwn0;->J3(Z)V

    .line 9
    .line 10
    .line 11
    new-instance p1, Ll/z310;

    .line 12
    .line 13
    const/16 v0, 0xa28

    .line 14
    .line 15
    invoke-direct {p1, v0}, Ll/z310;-><init>(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Ll/h0m;

    .line 23
    .line 24
    invoke-interface {p1}, Ll/h0m;->b()V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ll/pvn;->b()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;->finish()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/hnm0;->E4()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->closeLive()Ll/v3f$c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lrx/c;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/imm0;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/imm0;-><init>(Ll/hnm0;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Ll/jlm0;

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Ll/tmm0;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/tmm0;-><init>(Ll/hnm0;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Ll/jlm0;

    .line 70
    .line 71
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ll/oo2;->o1(Lcom/p1/mobile/android/app/Act;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    new-instance v1, Ll/bnm0;

    .line 78
    .line 79
    invoke-direct {v1, p0}, Ll/bnm0;-><init>(Ll/hnm0;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iput-object v0, p0, Ll/hnm0;->n:Ll/kcg0;

    .line 91
    .line 92
    return-void
.end method

.method public final synthetic V4(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V
    .locals 3

    .line 1
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->R5:I

    .line 2
    .line 3
    invoke-static {p1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x0

    .line 8
    const/4 v1, 0x0

    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-virtual {p0, v2, p1, v0, v1}, Ll/hnm0;->H4(ZLjava/lang/String;ZLcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic W4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->type:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x0

    .line 11
    const/4 v3, 0x1

    .line 12
    const/4 v4, -0x1

    .line 13
    sparse-switch v1, :sswitch_data_0

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :sswitch_0
    const-string v1, "delete_manager"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 v4, 0x6

    .line 27
    goto :goto_0

    .line 28
    :sswitch_1
    const-string v1, "forbidden_multidevice"

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 v4, 0x5

    .line 38
    goto :goto_0

    .line 39
    :sswitch_2
    const-string v1, "force_stop"

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_2

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    const/4 v4, 0x4

    .line 49
    goto :goto_0

    .line 50
    :sswitch_3
    const-string v1, "stop"

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-nez v0, :cond_3

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_3
    const/4 v4, 0x3

    .line 60
    goto :goto_0

    .line 61
    :sswitch_4
    const-string v1, "re_request_room_gift_list"

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_4

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_4
    const/4 v4, 0x2

    .line 71
    goto :goto_0

    .line 72
    :sswitch_5
    const-string v1, "system"

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_5

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_5
    move v4, v3

    .line 82
    goto :goto_0

    .line 83
    :sswitch_6
    const-string v1, "add_manager"

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-nez v0, :cond_6

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_6
    move v4, v2

    .line 93
    :goto_0
    const/4 v0, 0x0

    .line 94
    packed-switch v4, :pswitch_data_0

    .line 95
    .line 96
    .line 97
    goto/16 :goto_1

    .line 98
    .line 99
    :pswitch_0
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->isAnchor:Z

    .line 100
    .line 101
    if-nez v1, :cond_7

    .line 102
    .line 103
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    check-cast v0, Ll/jlm0;

    .line 108
    .line 109
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-static {v0}, Ll/itv;->T(Ljava/lang/String;)Lrx/c;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    new-instance v1, Ll/dnm0;

    .line 118
    .line 119
    invoke-direct {v1, p0}, Ll/dnm0;-><init>(Ll/hnm0;)V

    .line 120
    .line 121
    .line 122
    new-instance p0, Ll/enm0;

    .line 123
    .line 124
    invoke-direct {p0}, Ll/enm0;-><init>()V

    .line 125
    .line 126
    .line 127
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 132
    .line 133
    .line 134
    goto :goto_1

    .line 135
    :cond_7
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->T5:I

    .line 136
    .line 137
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    invoke-virtual {p0, v3, v1, v2, v0}, Ll/hnm0;->H4(ZLjava/lang/String;ZLcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

    .line 142
    .line 143
    .line 144
    goto :goto_1

    .line 145
    :pswitch_1
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->content:Ljava/lang/String;

    .line 146
    .line 147
    invoke-virtual {p0, v3, v1, v3, v0}, Ll/hnm0;->H4(ZLjava/lang/String;ZLcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

    .line 148
    .line 149
    .line 150
    goto :goto_1

    .line 151
    :pswitch_2
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->f6:I

    .line 152
    .line 153
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    invoke-virtual {p0, v3, v1, v3, v0}, Ll/hnm0;->H4(ZLjava/lang/String;ZLcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

    .line 158
    .line 159
    .line 160
    goto :goto_1

    .line 161
    :pswitch_3
    invoke-static {v2}, Ll/muj;->w(Z)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    check-cast v1, Ll/jlm0;

    .line 169
    .line 170
    new-instance v2, Ll/uxj$a;

    .line 171
    .line 172
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 173
    .line 174
    .line 175
    move-result-object v3

    .line 176
    check-cast v3, Ll/jlm0;

    .line 177
    .line 178
    invoke-virtual {v3}, Ll/vp20;->o()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v3

    .line 182
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    check-cast p0, Ll/jlm0;

    .line 187
    .line 188
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 193
    .line 194
    const-string v4, "live"

    .line 195
    .line 196
    invoke-direct {v2, v3, p0, v4}, Ll/uxj$a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {v2}, Ll/uxj$a;->f()Ll/uxj;

    .line 200
    .line 201
    .line 202
    move-result-object p0

    .line 203
    invoke-virtual {v1, p0, v0}, Ll/oo2;->A1(Ll/uxj;Ll/y20;)V

    .line 204
    .line 205
    .line 206
    goto :goto_1

    .line 207
    :pswitch_4
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->content:Ljava/lang/String;

    .line 208
    .line 209
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->y5:I

    .line 210
    .line 211
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v1

    .line 215
    new-instance v2, Ll/cnm0;

    .line 216
    .line 217
    invoke-direct {v2}, Ll/cnm0;-><init>()V

    .line 218
    .line 219
    .line 220
    invoke-direct {p0, v0, v1, v2}, Ll/hnm0;->w5(Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 221
    .line 222
    .line 223
    goto :goto_1

    .line 224
    :pswitch_5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    check-cast v0, Ll/jlm0;

    .line 229
    .line 230
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 231
    .line 232
    .line 233
    move-result-object p0

    .line 234
    check-cast p0, Ll/jlm0;

    .line 235
    .line 236
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object p0

    .line 240
    invoke-virtual {v0, p0}, Ll/rwn0;->K1(Ljava/lang/String;)V

    .line 241
    .line 242
    .line 243
    :goto_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->toString()Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object p0

    .line 247
    const-string p1, "[live][voice]"

    .line 248
    .line 249
    const-string v0, "[passivity_exit]"

    .line 250
    .line 251
    filled-new-array {p1, v0}, [Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object p1

    .line 255
    invoke-static {p0, p1}, Ll/nsh0;->k(Ljava/lang/String;[Ljava/lang/String;)V

    .line 256
    .line 257
    .line 258
    return-void

    .line 259
    :sswitch_data_0
    .sparse-switch
        -0x7f9401f1 -> :sswitch_6
        -0x34e38dd1 -> :sswitch_5
        -0x33a7a8db -> :sswitch_4
        0x360802 -> :sswitch_3
        0x80850d6 -> :sswitch_2
        0x169d3189 -> :sswitch_1
        0x40206119 -> :sswitch_0
    .end sparse-switch

    .line 260
    .line 261
    .line 262
    .line 263
    .line 264
    .line 265
    .line 266
    .line 267
    .line 268
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_5
    .end packed-switch
.end method

.method public final synthetic X4(Ljava/util/List;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->f6:I

    .line 12
    .line 13
    invoke-static {p1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const-string v0, ""

    .line 18
    .line 19
    invoke-static {p0, v0, p1}, Lcom/p1/mobile/putong/live/LiveDialogAct;->h2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const/4 v0, 0x0

    .line 24
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 29
    .line 30
    iget-object v0, p0, Ll/hnm0;->m:Ll/uqo0;

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Ll/uqo0;->b(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V

    .line 33
    .line 34
    .line 35
    new-instance v0, Ll/ulm0;

    .line 36
    .line 37
    invoke-direct {v0, p1}, Ll/ulm0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v0}, Ll/hnm0;->J4(Ll/qcj;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic Y4(Landroid/util/Pair;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hnm0;->m:Ll/uqo0;

    .line 2
    .line 3
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/uqo0;->c(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic Z4(Landroid/util/Pair;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hnm0;->l:Ll/gio0;

    .line 2
    .line 3
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/gio0;->w4(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic a5(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hnm0;->m:Ll/uqo0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/uqo0;->b(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic b5(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hnm0;->m:Ll/uqo0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/uqo0;->a(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic c5(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/hnm0;->H5()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic d5()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic e5(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)Lrx/c;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->EMPTY_ROOM:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->EMPTY:Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 6
    .line 7
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/hnm0;->m:Ll/uqo0;

    .line 13
    .line 14
    iget-object v0, v0, Ll/uqo0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->id:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v0, p0, Ll/hnm0;->l:Ll/gio0;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/gio0;->x4()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Ll/jlm0;

    .line 36
    .line 37
    iget-object v1, v1, Ll/rwn0;->a0:Ljava/lang/String;

    .line 38
    .line 39
    iget-object p0, p0, Ll/hnm0;->l:Ll/gio0;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/gio0;->e4()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {p1, v0, v1, p0}, Ll/itv;->s(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0
.end method

.method public final synthetic f5(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/hnm0;->m:Ll/uqo0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/uqo0;->b(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 7
    .line 8
    const-string p1, "create_voice_room"

    .line 9
    .line 10
    const-string v0, "voice_prepareLive"

    .line 11
    .line 12
    invoke-virtual {p0, p1, v0}, Ll/lej0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic g5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hnm0;->M4(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic h5()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic i5(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->status:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorStatus;

    .line 2
    .line 3
    const-string v1, "jailed"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->eb:I

    .line 20
    .line 21
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->availableTime:D

    .line 22
    .line 23
    invoke-static {v2, v3}, Ll/pzi0;->p(D)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {v1, p1}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->y5:I

    .line 41
    .line 42
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/anm0;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/anm0;-><init>(Ll/hnm0;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 56
    .line 57
    .line 58
    :cond_0
    return-void
.end method

.method public final synthetic j5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hnm0;->M4(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic k5()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hnm0;->F4()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/hnm0;->p:Ll/jl80;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic l5()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/jlm0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/hnm0;->F5(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/hnm0;->p:Ll/jl80;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic m5()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/jlm0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/hnm0;->F5(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/hnm0;->n:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic n5(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V
    .locals 2

    .line 1
    const/4 p2, 0x0

    .line 2
    const/4 v0, 0x1

    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v1, p2, v0, p1}, Ll/hnm0;->H4(ZLjava/lang/String;ZLcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic o5(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    const/4 p2, 0x0

    .line 2
    const/4 v0, 0x1

    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v1, p2, v0, p1}, Ll/hnm0;->H4(ZLjava/lang/String;ZLcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic p5(ZLjava/lang/Boolean;)Lrx/c;
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/hnm0;->m:Ll/uqo0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/uqo0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 6
    .line 7
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object p1, p0, Ll/hnm0;->l:Ll/gio0;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/gio0;->f4()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object p2, p0, Ll/hnm0;->l:Ll/gio0;

    .line 23
    .line 24
    invoke-virtual {p2}, Ll/gio0;->d4()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    if-eqz p2, :cond_1

    .line 29
    .line 30
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTopic;->id:Ljava/lang/String;

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const-string v0, ""

    .line 34
    .line 35
    :goto_0
    iget-object v1, p0, Ll/hnm0;->m:Ll/uqo0;

    .line 36
    .line 37
    iget-object v1, v1, Ll/uqo0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 38
    .line 39
    if-eqz v1, :cond_3

    .line 40
    .line 41
    invoke-direct {p0, v1}, Ll/hnm0;->O4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-nez v1, :cond_3

    .line 46
    .line 47
    iget-object v1, p0, Ll/hnm0;->m:Ll/uqo0;

    .line 48
    .line 49
    iget-object v1, v1, Ll/uqo0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 50
    .line 51
    invoke-virtual {p0, v1}, Ll/hnm0;->N4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_2

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_2
    iget-object p0, p0, Ll/hnm0;->m:Ll/uqo0;

    .line 59
    .line 60
    iget-object p0, p0, Ll/uqo0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 61
    .line 62
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0

    .line 67
    :cond_3
    :goto_1
    new-instance v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 68
    .line 69
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;-><init>()V

    .line 70
    .line 71
    .line 72
    iput-object p1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->title:Ljava/lang/String;

    .line 73
    .line 74
    new-instance p1, Ljava/util/ArrayList;

    .line 75
    .line 76
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 77
    .line 78
    .line 79
    iput-object p1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->topicIds:Ljava/util/List;

    .line 80
    .line 81
    if-eqz p2, :cond_4

    .line 82
    .line 83
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    :cond_4
    iget-object p1, p0, Ll/hnm0;->l:Ll/gio0;

    .line 87
    .line 88
    invoke-virtual {p1}, Ll/gio0;->h4()Z

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    iput-boolean p1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->maskMode:Z

    .line 93
    .line 94
    iget-object p1, p0, Ll/hnm0;->m:Ll/uqo0;

    .line 95
    .line 96
    iget-object p1, p1, Ll/uqo0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 97
    .line 98
    if-nez p1, :cond_5

    .line 99
    .line 100
    invoke-static {v1}, Ll/itv;->u(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    return-object p0

    .line 105
    :cond_5
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->id:Ljava/lang/String;

    .line 106
    .line 107
    iput-object p2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->id:Ljava/lang/String;

    .line 108
    .line 109
    invoke-direct {p0, p1}, Ll/hnm0;->O4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-eqz p1, :cond_6

    .line 114
    .line 115
    const-string p1, "title,topic"

    .line 116
    .line 117
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->addField(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    :cond_6
    const-string p1, "maskMode"

    .line 121
    .line 122
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->addField(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    iget-object p0, p0, Ll/hnm0;->m:Ll/uqo0;

    .line 126
    .line 127
    iget-object p0, p0, Ll/uqo0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 128
    .line 129
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->id:Ljava/lang/String;

    .line 130
    .line 131
    invoke-static {p0, v1}, Ll/itv;->I(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)Lrx/c;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    return-object p0
.end method

.method public final synthetic q5(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/hnm0;->m:Ll/uqo0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/uqo0;->c(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 7
    .line 8
    const-string p1, "create_voice_room"

    .line 9
    .line 10
    const-string v0, "voice_updateRoom"

    .line 11
    .line 12
    invoke-virtual {p0, p1, v0}, Ll/lej0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic r5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hnm0;->M4(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public y5(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hnm0;->j:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public z5(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hnm0;->m:Ll/uqo0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/uqo0;->b(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
