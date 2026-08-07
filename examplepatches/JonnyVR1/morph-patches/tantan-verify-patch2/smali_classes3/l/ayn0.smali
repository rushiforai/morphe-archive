.class public Ll/ayn0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/qo2;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

.field public b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

.field public c:Lcom/p1/mobile/putong/data/User;

.field public d:Ljava/lang/String;

.field public final e:Lcom/p1/mobile/android/app/Act;

.field public final f:Ll/itm0;

.field public final g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/jxn0;",
            ">;"
        }
    .end annotation
.end field

.field public final h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserRecord;",
            ">;"
        }
    .end annotation
.end field

.field public i:Lcom/p1/mobile/putong/data/Links;

.field public j:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ayn0;->g:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/ayn0;->h:Ljava/util/List;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput v0, p0, Ll/ayn0;->j:I

    .line 20
    .line 21
    iput-object p1, p0, Ll/ayn0;->e:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    new-instance v0, Ll/itm0;

    .line 24
    .line 25
    invoke-direct {v0, p1, p1}, Ll/itm0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/ner;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Ll/ayn0;->f:Ll/itm0;

    .line 29
    .line 30
    return-void
.end method

.method private synthetic D0(Ljava/lang/Throwable;)V
    .locals 8

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveSummary;

    .line 2
    .line 3
    .line 4
    move-result-object v6

    .line 5
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    move-object v0, p1

    .line 8
    check-cast v0, Ll/qo2;

    .line 9
    .line 10
    iget-object v1, p0, Ll/ayn0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 11
    .line 12
    iget-object v2, p0, Ll/ayn0;->c:Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    iget-object v3, p0, Ll/ayn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 15
    .line 16
    new-instance v7, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 17
    .line 18
    invoke-direct {v7}, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;-><init>()V

    .line 19
    .line 20
    .line 21
    const/4 v4, 0x0

    .line 22
    const/4 v5, 0x0

    .line 23
    invoke-virtual/range {v0 .. v7}, Ll/qo2;->e(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveSummary;Lcom/p1/mobile/putong/live/base/bean/LivingUsers;)V

    .line 24
    .line 25
    .line 26
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->H9:I

    .line 27
    .line 28
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic e0(Ll/ayn0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ayn0;->D0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic f0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->H9:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic g0(Ll/ayn0;Ljava/util/HashMap;Lcom/p1/mobile/putong/data/User;)Ll/nsv;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ayn0;->A0(Ljava/util/HashMap;Lcom/p1/mobile/putong/data/User;)Ll/nsv;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->H9:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic i0(Ll/y20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic j0(Ll/ayn0;Ll/jxn0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ayn0;->F0(Ll/jxn0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic k0(Ll/y20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic l0(Ll/ayn0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ayn0;->s0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic m0(Ll/y20;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic n0(Ll/ayn0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ayn0;->H0()V

    return-void
.end method

.method public static synthetic o0(Ll/y20;Lcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic p0(Ll/ayn0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ayn0;->C0(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic q0(Ll/ayn0;Ljava/util/HashMap;Lcom/p1/mobile/putong/data/User;)Ll/nsv;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ayn0;->G0(Ljava/util/HashMap;Lcom/p1/mobile/putong/data/User;)Ll/nsv;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic r0(Ll/ayn0;Ll/jxn0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ayn0;->E0(Ll/jxn0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method private s0(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/qo2;

    .line 4
    .line 5
    iget-object v0, p0, Ll/ayn0;->e:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    iget-object v1, p0, Ll/ayn0;->d:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1, v0, v1}, Ll/qo2;->i(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Ll/vwt;->o7()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast p1, Ll/qo2;

    .line 25
    .line 26
    invoke-virtual {p1}, Ll/qo2;->c()V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object p1, p0, Ll/ayn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v0, p0, Ll/ayn0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->isMaskMode()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->getVoiceLiveSummaries(Ljava/lang/String;Z)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    new-instance v0, Ll/vxn0;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Ll/vxn0;-><init>(Ll/ayn0;)V

    .line 50
    .line 51
    .line 52
    new-instance v1, Ll/wxn0;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Ll/wxn0;-><init>(Ll/ayn0;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 62
    .line 63
    .line 64
    return-void
.end method


# virtual methods
.method public final synthetic A0(Ljava/util/HashMap;Lcom/p1/mobile/putong/data/User;)Ll/nsv;
    .locals 1

    .line 1
    invoke-static {p2}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 12
    .line 13
    iget-object p0, p0, Ll/ayn0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 14
    .line 15
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->maskMode:Z

    .line 16
    .line 17
    invoke-virtual {v0, p2, p1, p0}, Ll/nsv;->c(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;Z)Ll/nsv;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public final synthetic C0(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 9

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveSummaries:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveSummary;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :goto_0
    move-object v7, v0

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveSummaries:Ljava/util/List;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :goto_1
    invoke-static {p1}, Ll/w6o0;->k(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ljava/util/HashMap;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 34
    .line 35
    check-cast v1, Ll/qo2;

    .line 36
    .line 37
    iget-object v2, p0, Ll/ayn0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 38
    .line 39
    iget-object v3, p0, Ll/ayn0;->c:Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    iget-object v4, p0, Ll/ayn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 44
    .line 45
    iget-object v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->sparkletProgress:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;

    .line 46
    .line 47
    iget-object v6, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->accompanyUserRanking:Ljava/util/List;

    .line 48
    .line 49
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->users:Ljava/util/List;

    .line 50
    .line 51
    new-instance v8, Ll/xxn0;

    .line 52
    .line 53
    invoke-direct {v8, p0, v0}, Ll/xxn0;-><init>(Ll/ayn0;Ljava/util/HashMap;)V

    .line 54
    .line 55
    .line 56
    invoke-static {p1, v8}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;->create(Ljava/util/List;)Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 61
    .line 62
    .line 63
    move-result-object v8

    .line 64
    invoke-virtual/range {v1 .. v8}, Ll/qo2;->e(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkProgress;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveSummary;Lcom/p1/mobile/putong/live/base/bean/LivingUsers;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final synthetic E0(Ll/jxn0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p2, v0, p1}, Ll/ayn0;->x0(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;ZLl/jxn0;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic F0(Ll/jxn0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p2, v0, p1}, Ll/ayn0;->x0(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;ZLl/jxn0;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic G0(Ljava/util/HashMap;Lcom/p1/mobile/putong/data/User;)Ll/nsv;
    .locals 1

    .line 1
    invoke-static {p2}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 12
    .line 13
    iget-object p0, p0, Ll/ayn0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 14
    .line 15
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->maskMode:Z

    .line 16
    .line 17
    invoke-virtual {v0, p2, p1, p0}, Ll/nsv;->c(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;Z)Ll/nsv;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public final synthetic H0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/qo2;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/qo2;->f()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public I0(Ll/nsv;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ayn0;->z0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 8
    .line 9
    iget-object v2, p0, Ll/ayn0;->e:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    iget-object p0, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 12
    .line 13
    move-object v3, p0

    .line 14
    check-cast v3, Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    iget-object v4, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 19
    .line 20
    const-string v5, "live_user_card"

    .line 21
    .line 22
    const/4 v6, 0x0

    .line 23
    invoke-virtual/range {v1 .. v6}, Ll/wrv;->A0(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-virtual {p1}, Ll/nsv;->g()Ll/pyl;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ll/l6o0;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/ayn0;->act()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    iget-boolean v0, v0, Ll/l6o0;->c:Z

    .line 38
    .line 39
    invoke-static {p0, p1, v0}, Ll/g7k0;->a(Landroid/content/Context;Ll/nsv;Z)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public J0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ayn0;->e:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public L0(Ll/nsv;Ljava/lang/String;ZLl/y20;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Ljava/lang/String;",
            "Z",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
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
    move-result-object v2

    .line 7
    invoke-virtual {p0}, Ll/ayn0;->z0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    if-eqz p3, :cond_0

    .line 14
    .line 15
    iget-object v3, p0, Ll/ayn0;->e:Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    iget-object p1, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 18
    .line 19
    move-object v4, p1

    .line 20
    check-cast v4, Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    iget-object p1, p0, Ll/ayn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 23
    .line 24
    iget-object v8, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 27
    .line 28
    iget-object v9, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 29
    .line 30
    const-string v6, "endLivePage"

    .line 31
    .line 32
    const-string v7, "p_anchor_live_end"

    .line 33
    .line 34
    move v5, p3

    .line 35
    invoke-static/range {v3 .. v9}, Lcom/p1/mobile/putong/live/livingroom/virtual/api/VoiceVirtualApi;->like(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    new-instance p1, Ll/rxn0;

    .line 44
    .line 45
    invoke-direct {p1, p4}, Ll/rxn0;-><init>(Ll/y20;)V

    .line 46
    .line 47
    .line 48
    new-instance p2, Ll/sxn0;

    .line 49
    .line 50
    invoke-direct {p2, p4}, Ll/sxn0;-><init>(Ll/y20;)V

    .line 51
    .line 52
    .line 53
    invoke-static {p1, p2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void

    .line 61
    :cond_1
    move v4, p3

    .line 62
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 63
    .line 64
    iget-object p1, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 65
    .line 66
    move-object v3, p1

    .line 67
    check-cast v3, Lcom/p1/mobile/putong/data/User;

    .line 68
    .line 69
    iget-object p1, p0, Ll/ayn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 70
    .line 71
    iget-object v6, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 72
    .line 73
    move-object v5, p2

    .line 74
    invoke-virtual/range {v1 .. v6}, Ll/wrv;->c(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    new-instance p1, Ll/txn0;

    .line 83
    .line 84
    invoke-direct {p1, p4}, Ll/txn0;-><init>(Ll/y20;)V

    .line 85
    .line 86
    .line 87
    new-instance p2, Ll/uxn0;

    .line 88
    .line 89
    invoke-direct {p2, p4}, Ll/uxn0;-><init>(Ll/y20;)V

    .line 90
    .line 91
    .line 92
    invoke-static {p1, p2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public N0(Landroid/view/ViewGroup;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ayn0;->f:Ll/itm0;

    .line 2
    .line 3
    new-instance v1, Ll/pxn0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/pxn0;-><init>(Ll/ayn0;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1, p2, p3, v1}, Ll/itm0;->n0(Landroid/view/ViewGroup;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;Ll/x20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public O0()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/jxn0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/jxn0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/jxn0;-><init>(Ll/ayn0;I)V

    .line 5
    .line 6
    .line 7
    new-instance v1, Ll/jxn0;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-direct {v1, p0, v2}, Ll/jxn0;-><init>(Ll/ayn0;I)V

    .line 11
    .line 12
    .line 13
    iget-object v2, p0, Ll/ayn0;->g:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/ayn0;->g:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/ayn0;->g:Ljava/util/List;

    .line 24
    .line 25
    return-object p0
.end method

.method public P0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ayn0;->c:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ayn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 4
    .line 5
    iput-object p3, p0, Ll/ayn0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 6
    .line 7
    iput-object p4, p0, Ll/ayn0;->d:Ljava/lang/String;

    .line 8
    .line 9
    return-void
.end method

.method public Q0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ayn0;->e:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p0, p1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    new-instance v0, Ll/mxn0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/mxn0;-><init>(Ll/ayn0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ayn0;->e:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public t0(ZLl/jxn0;)V
    .locals 2

    .line 1
    const-string v0, "20"

    .line 2
    .line 3
    if-eqz p1, :cond_2

    .line 4
    .line 5
    iget-object p1, p0, Ll/ayn0;->i:Lcom/p1/mobile/putong/data/Links;

    .line 6
    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object p1, p0, Ll/ayn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 21
    .line 22
    iget v1, p0, Ll/ayn0;->j:I

    .line 23
    .line 24
    add-int/lit8 v1, v1, 0x1

    .line 25
    .line 26
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-static {p1, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->getLiveVoiceHeartBeatReward(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    new-instance v0, Ll/yxn0;

    .line 39
    .line 40
    invoke-direct {v0, p0, p2}, Ll/yxn0;-><init>(Ll/ayn0;Ll/jxn0;)V

    .line 41
    .line 42
    .line 43
    new-instance p0, Ll/zxn0;

    .line 44
    .line 45
    invoke-direct {p0}, Ll/zxn0;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    :goto_0
    invoke-virtual {p2}, Ll/jxn0;->j()V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_2
    iget-object p1, p0, Ll/ayn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 61
    .line 62
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 63
    .line 64
    const/4 v1, 0x0

    .line 65
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-static {p1, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->getLiveVoiceHeartBeatReward(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    new-instance v0, Ll/nxn0;

    .line 78
    .line 79
    invoke-direct {v0, p0, p2}, Ll/nxn0;-><init>(Ll/ayn0;Ll/jxn0;)V

    .line 80
    .line 81
    .line 82
    new-instance p0, Ll/oxn0;

    .line 83
    .line 84
    invoke-direct {p0}, Ll/oxn0;-><init>()V

    .line 85
    .line 86
    .line 87
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public u0()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/jxn0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ayn0;->g:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public final x0(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;ZLl/jxn0;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveUserHeartbeatRewardList:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserHeartbeatRewardList;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserHeartbeatRewardList;->userRecordList:Ljava/util/List;

    .line 6
    .line 7
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 10
    .line 11
    iput-object v1, p0, Ll/ayn0;->i:Lcom/p1/mobile/putong/data/Links;

    .line 12
    .line 13
    invoke-static {p1}, Ll/w6o0;->k(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ljava/util/HashMap;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    iget p2, p0, Ll/ayn0;->j:I

    .line 20
    .line 21
    add-int/lit8 p2, p2, 0x1

    .line 22
    .line 23
    iput p2, p0, Ll/ayn0;->j:I

    .line 24
    .line 25
    iget-object p2, p0, Ll/ayn0;->h:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {p2, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    invoke-virtual {p3}, Ll/jxn0;->j()V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 p2, 0x0

    .line 35
    iput p2, p0, Ll/ayn0;->j:I

    .line 36
    .line 37
    iget-object p2, p0, Ll/ayn0;->h:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 40
    .line 41
    .line 42
    iget-object p2, p0, Ll/ayn0;->h:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {p2, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 45
    .line 46
    .line 47
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 48
    .line 49
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceLiveUserHeartbeatRewardList:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserHeartbeatRewardList;

    .line 50
    .line 51
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserHeartbeatRewardList;->heartbeatRewardPointsTotal:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p3, p2}, Ll/jxn0;->t(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p3}, Ll/jxn0;->k()V

    .line 57
    .line 58
    .line 59
    :goto_0
    iget-object p2, p0, Ll/ayn0;->h:Ljava/util/List;

    .line 60
    .line 61
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 62
    .line 63
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->users:Ljava/util/List;

    .line 64
    .line 65
    new-instance v0, Ll/qxn0;

    .line 66
    .line 67
    invoke-direct {v0, p0, v1}, Ll/qxn0;-><init>(Ll/ayn0;Ljava/util/HashMap;)V

    .line 68
    .line 69
    .line 70
    invoke-static {p1, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;->create(Ljava/util/List;)Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p3, p2, p0}, Ll/jxn0;->s(Ljava/util/List;Lcom/p1/mobile/putong/live/base/bean/LivingUsers;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public y0()Ll/l4g0;
    .locals 4

    .line 1
    new-instance v0, Ll/l4g0;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceLiveEndAct;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "p_anchor_live_end"

    .line 10
    .line 11
    invoke-direct {v0, v2, v1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    new-instance v1, Lorg/json/JSONObject;

    .line 15
    .line 16
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 17
    .line 18
    .line 19
    :try_start_0
    const-string v2, "liveId"

    .line 20
    .line 21
    iget-object v3, p0, Ll/ayn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 22
    .line 23
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 26
    .line 27
    .line 28
    const-string v2, "anchorId"

    .line 29
    .line 30
    iget-object p0, p0, Ll/ayn0;->c:Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catch_0
    move-exception p0

    .line 39
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 40
    .line 41
    .line 42
    :goto_0
    invoke-virtual {v0, v1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 43
    .line 44
    .line 45
    return-object v0
.end method

.method public z0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ayn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0}, Ll/y6s;->b(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
