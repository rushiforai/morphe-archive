.class public Ll/uqx;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static u:Ll/uqx; = null

.field public static v:J = 0xcL

.field public static w:J


# instance fields
.field public a:Lcom/immomo/momomediaext/MMLiveEngine;

.field public b:Z

.field public c:Lcom/google/gson/Gson;

.field public d:Lcom/p1/mobile/putong/core/mediacall/EventData;

.field public e:Ll/kcg0;

.field public f:Ll/kcg0;

.field public g:Ll/kcg0;

.field public h:Ll/kcg0;

.field public i:Ll/kcg0;

.field public j:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/t54;",
            ">;"
        }
    .end annotation
.end field

.field public k:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public l:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public m:J

.field public n:Z

.field public o:Landroid/media/AudioManager;

.field public p:J

.field public q:J

.field public r:Z

.field public s:Ll/enw;

.field public t:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/uqx;->b:Z

    .line 6
    .line 7
    sget-object v1, Ll/t54;->c:Ll/t54;

    .line 8
    .line 9
    invoke-static {v1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iput-object v1, p0, Ll/uqx;->j:Lrx/subjects/a;

    .line 14
    .line 15
    const/4 v1, -0x1

    .line 16
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, p0, Ll/uqx;->k:Lrx/subjects/a;

    .line 25
    .line 26
    const-wide/16 v1, -0x1

    .line 27
    .line 28
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-static {v1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iput-object v1, p0, Ll/uqx;->l:Lrx/subjects/a;

    .line 37
    .line 38
    const-wide/16 v1, 0x3c

    .line 39
    .line 40
    iput-wide v1, p0, Ll/uqx;->m:J

    .line 41
    .line 42
    iput-boolean v0, p0, Ll/uqx;->n:Z

    .line 43
    .line 44
    const-wide/16 v1, 0x0

    .line 45
    .line 46
    iput-wide v1, p0, Ll/uqx;->p:J

    .line 47
    .line 48
    iput-wide v1, p0, Ll/uqx;->q:J

    .line 49
    .line 50
    const/4 v1, 0x1

    .line 51
    iput-boolean v1, p0, Ll/uqx;->r:Z

    .line 52
    .line 53
    new-instance v1, Ll/uqx$a;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/uqx$a;-><init>(Ll/uqx;)V

    .line 56
    .line 57
    .line 58
    iput-object v1, p0, Ll/uqx;->s:Ll/enw;

    .line 59
    .line 60
    iput-boolean v0, p0, Ll/uqx;->t:Z

    .line 61
    .line 62
    new-instance v0, Lcom/google/gson/Gson;

    .line 63
    .line 64
    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    .line 65
    .line 66
    .line 67
    iput-object v0, p0, Ll/uqx;->c:Lcom/google/gson/Gson;

    .line 68
    .line 69
    new-instance v0, Lcom/p1/mobile/putong/core/mediacall/EventData;

    .line 70
    .line 71
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/mediacall/EventData;-><init>()V

    .line 72
    .line 73
    .line 74
    iput-object v0, p0, Ll/uqx;->d:Lcom/p1/mobile/putong/core/mediacall/EventData;

    .line 75
    .line 76
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 77
    .line 78
    const-string v1, "audio"

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    check-cast v0, Landroid/media/AudioManager;

    .line 85
    .line 86
    iput-object v0, p0, Ll/uqx;->o:Landroid/media/AudioManager;

    .line 87
    .line 88
    return-void
.end method

.method public static C()Ll/uqx;
    .locals 2

    .line 1
    sget-object v0, Ll/uqx;->u:Ll/uqx;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/uqx;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/uqx;->u:Ll/uqx;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/uqx;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/uqx;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/uqx;->u:Ll/uqx;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/uqx;->u:Ll/uqx;

    .line 27
    .line 28
    return-object v0
.end method

.method public static T(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "MediaCallManager"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/uqx;Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uqx;->N(Ljava/lang/Integer;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c(Ll/uqx;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uqx;->O(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic d(Ll/uqx;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uqx;->L(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f(Ll/uqx;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uqx;->R()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g(Ll/uqx;Ll/t54;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uqx;->M(Ll/t54;)V

    return-void
.end method

.method public static synthetic h(Ll/t54;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "media callState== "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Ll/uqx;->T(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic i(Ll/t54;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Ll/t54;->i:Ll/t54;

    .line 2
    .line 3
    if-eq p0, v0, :cond_1

    .line 4
    .line 5
    sget-object v0, Ll/t54;->h:Ll/t54;

    .line 6
    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    goto :goto_1

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic j(Ll/uqx;)Ll/x1d0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uqx;->Q()Ll/x1d0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k(Ll/uqx;Ljava/lang/String;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/uqx;->P(Ljava/lang/String;Ljava/lang/Long;)V

    return-void
.end method

.method public static bridge synthetic l(Ll/uqx;)Landroid/media/AudioManager;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uqx;->o:Landroid/media/AudioManager;

    return-object p0
.end method

.method public static bridge synthetic m(Ll/uqx;)Lrx/subjects/a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uqx;->j:Lrx/subjects/a;

    return-object p0
.end method

.method public static bridge synthetic n(Ll/uqx;)Lrx/subjects/a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uqx;->k:Lrx/subjects/a;

    return-object p0
.end method

.method public static bridge synthetic o(Ll/uqx;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/uqx;->q:J

    return-wide v0
.end method

.method public static bridge synthetic p(Ll/uqx;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/uqx;->r:Z

    return p0
.end method

.method public static bridge synthetic q(Ll/uqx;J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/uqx;->q:J

    return-void
.end method

.method public static bridge synthetic r(Ll/uqx;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/uqx;->r:Z

    return-void
.end method

.method public static bridge synthetic s(Ll/uqx;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/uqx;->a0(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public static bridge synthetic t()J
    .locals 2

    .line 1
    sget-wide v0, Ll/uqx;->v:J

    return-wide v0
.end method

.method public static bridge synthetic u()J
    .locals 2

    .line 1
    sget-wide v0, Ll/uqx;->w:J

    return-wide v0
.end method

.method public static y()V
    .locals 1

    .line 1
    sget-object v0, Ll/uqx;->u:Ll/uqx;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Ll/uqx;->u:Ll/uqx;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/uqx;->V()V

    .line 12
    .line 13
    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    sput-object v0, Ll/uqx;->u:Ll/uqx;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public A(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    :try_start_0
    invoke-static {}, Ll/jpd0;->c()Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return p0

    .line 9
    :cond_0
    invoke-static {}, Ll/uqx;->C()Ll/uqx;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/uqx;->G()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v0, p1, p2}, Ll/uqx;->E(Ljava/lang/String;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    if-nez p1, :cond_1

    .line 30
    .line 31
    return p0

    .line 32
    :catch_0
    move-exception p1

    .line 33
    goto :goto_0

    .line 34
    :cond_1
    const/4 p0, 0x1

    .line 35
    return p0

    .line 36
    :goto_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 37
    .line 38
    .line 39
    return p0
.end method

.method public B()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/uqx;->l:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    return-wide v0
.end method

.method public D(Ljava/lang/String;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;
    .locals 0

    .line 1
    const-string p0, "momo"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfMM:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string p0, "agora"

    .line 13
    .line 14
    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    sget-object p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfAG:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    const-string p0, "tencent"

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    sget-object p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfTX:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_2
    const-string p0, "volcengine"

    .line 35
    .line 36
    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-eqz p0, :cond_3

    .line 41
    .line 42
    sget-object p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfVolc:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_3
    sget-object p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfAG:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 46
    .line 47
    return-object p0
.end method

.method public E(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 10
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    iget-boolean p2, p0, Ll/uqx;->b:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    new-instance p0, Ljava/lang/Exception;

    .line 7
    .line 8
    const-string p1, "mRtcEngine already init"

    .line 9
    .line 10
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 14
    .line 15
    .line 16
    const-string p0, "already init"

    .line 17
    .line 18
    invoke-static {p0}, Ll/uqx;->T(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return v1

    .line 22
    :cond_0
    new-instance v2, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-interface {p2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->ih()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-interface {p2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Hh()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 43
    .line 44
    invoke-virtual {p2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    iget-object v5, p2, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 49
    .line 50
    sget-object p2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 51
    .line 52
    invoke-static {p2}, Ll/wx0;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v7

    .line 56
    sget-object p2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 57
    .line 58
    invoke-static {p2}, Ll/wx0;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v8

    .line 62
    const/4 v9, 0x1

    .line 63
    move-object v6, p1

    .line 64
    invoke-direct/range {v2 .. v9}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 65
    .line 66
    .line 67
    new-instance p1, Lcom/immomo/momomediaext/MMLiveEngine;

    .line 68
    .line 69
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 70
    .line 71
    invoke-direct {p1, v2, p2}, Lcom/immomo/momomediaext/MMLiveEngine;-><init>(Lcom/immomo/momomediaext/utils/MMLiveUserConfig;Landroid/content/Context;)V

    .line 72
    .line 73
    .line 74
    iput-object p1, p0, Ll/uqx;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 75
    .line 76
    const/4 p2, 0x1

    .line 77
    invoke-virtual {p1, p2}, Lcom/immomo/momomediaext/MMLiveEngine;->p0(Z)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Ll/uqx;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 81
    .line 82
    invoke-virtual {p1, v1}, Lcom/immomo/momomediaext/MMLiveEngine;->l0(Z)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Ll/uqx;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 86
    .line 87
    sget-object v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;->MMLiveRTCClientRoleBroadcaster:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;

    .line 88
    .line 89
    invoke-virtual {p1, v0}, Lcom/immomo/momomediaext/MMLiveEngine;->f0(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;)I

    .line 90
    .line 91
    .line 92
    new-instance p1, Lcom/immomo/momomediaext/utils/MMLiveAudioVolumeConfig;

    .line 93
    .line 94
    invoke-direct {p1}, Lcom/immomo/momomediaext/utils/MMLiveAudioVolumeConfig;-><init>()V

    .line 95
    .line 96
    .line 97
    const/16 v0, 0xbb8

    .line 98
    .line 99
    iput v0, p1, Lcom/immomo/momomediaext/utils/MMLiveAudioVolumeConfig;->interval:I

    .line 100
    .line 101
    const/4 v0, 0x3

    .line 102
    iput v0, p1, Lcom/immomo/momomediaext/utils/MMLiveAudioVolumeConfig;->smooth:I

    .line 103
    .line 104
    iget-object v0, p0, Ll/uqx;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 105
    .line 106
    invoke-virtual {v0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->h0(Lcom/immomo/momomediaext/utils/MMLiveAudioVolumeConfig;)V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Ll/uqx;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 110
    .line 111
    invoke-virtual {p1, p2}, Lcom/immomo/momomediaext/MMLiveEngine;->g0(Z)V

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Ll/uqx;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 115
    .line 116
    iget-object v0, p0, Ll/uqx;->s:Ll/enw;

    .line 117
    .line 118
    invoke-virtual {p1, v0}, Lcom/immomo/momomediaext/MMLiveEngine;->t0(Ll/enw;)V

    .line 119
    .line 120
    .line 121
    :try_start_0
    iget-object p1, p0, Ll/uqx;->o:Landroid/media/AudioManager;

    .line 122
    .line 123
    invoke-virtual {p1, v1}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p0}, Ll/uqx;->v()Lrx/c;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    new-instance v0, Ll/mqx;

    .line 131
    .line 132
    invoke-direct {v0}, Ll/mqx;-><init>()V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    new-instance v0, Ll/nqx;

    .line 140
    .line 141
    invoke-direct {v0, p0}, Ll/nqx;-><init>(Ll/uqx;)V

    .line 142
    .line 143
    .line 144
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    iput-object p1, p0, Ll/uqx;->g:Ll/kcg0;

    .line 153
    .line 154
    iget-object p1, p0, Ll/uqx;->k:Lrx/subjects/a;

    .line 155
    .line 156
    new-instance v0, Ll/oqx;

    .line 157
    .line 158
    invoke-direct {v0, p0}, Ll/oqx;-><init>(Ll/uqx;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    new-instance v0, Ll/pqx;

    .line 166
    .line 167
    invoke-direct {v0, p0}, Ll/pqx;-><init>(Ll/uqx;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    iput-object p1, p0, Ll/uqx;->h:Ll/kcg0;

    .line 175
    .line 176
    iput-boolean p2, p0, Ll/uqx;->b:Z

    .line 177
    .line 178
    invoke-virtual {p0}, Ll/uqx;->v()Lrx/c;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    new-instance v0, Ll/qqx;

    .line 183
    .line 184
    invoke-direct {v0}, Ll/qqx;-><init>()V

    .line 185
    .line 186
    .line 187
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    iput-object p1, p0, Ll/uqx;->i:Ll/kcg0;

    .line 196
    .line 197
    iget-object p0, p0, Ll/uqx;->j:Lrx/subjects/a;

    .line 198
    .line 199
    sget-object p1, Ll/t54;->d:Ll/t54;

    .line 200
    .line 201
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 202
    .line 203
    .line 204
    return p2

    .line 205
    :catch_0
    move-exception v0

    .line 206
    move-object p0, v0

    .line 207
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 208
    .line 209
    .line 210
    new-instance p1, Ljava/lang/StringBuilder;

    .line 211
    .line 212
    const-string p2, "init "

    .line 213
    .line 214
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 215
    .line 216
    .line 217
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object p0

    .line 224
    invoke-static {p0}, Ll/uqx;->T(Ljava/lang/String;)V

    .line 225
    .line 226
    .line 227
    return v1
.end method

.method public F()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/uqx;->w()Ll/t54;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/t54;->f:Ll/t54;

    .line 6
    .line 7
    if-eq v0, v1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/uqx;->w()Ll/t54;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget-object v0, Ll/t54;->g:Ll/t54;

    .line 14
    .line 15
    if-ne p0, v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public G()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/uqx;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public H()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/uqx;->j:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/t54;

    .line 8
    .line 9
    sget-object v0, Ll/t54;->i:Ll/t54;

    .line 10
    .line 11
    if-eq p0, v0, :cond_1

    .line 12
    .line 13
    sget-object v0, Ll/t54;->h:Ll/t54;

    .line 14
    .line 15
    if-ne p0, v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public I()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/uqx;->n:Z

    .line 2
    .line 3
    return p0
.end method

.method public J()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/uqx;->t:Z

    .line 2
    .line 3
    return p0
.end method

.method public K(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-virtual {p0, p2, p3}, Ll/uqx;->A(Ljava/lang/String;Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Ll/uqx;->j:Lrx/subjects/a;

    .line 5
    .line 6
    sget-object v0, Ll/t54;->e:Ll/t54;

    .line 7
    .line 8
    invoke-virtual {p2, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    new-instance p2, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 12
    .line 13
    invoke-direct {p2}, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;-><init>()V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x2

    .line 17
    iput v0, p2, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioChannels:I

    .line 18
    .line 19
    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result p3

    .line 23
    iput p3, p2, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->businessType:I

    .line 24
    .line 25
    const/16 p3, 0x19

    .line 26
    .line 27
    iput p3, p2, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->cdnType:I

    .line 28
    .line 29
    new-instance p3, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 30
    .line 31
    invoke-direct {p3}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p4}, Ll/uqx;->D(Ljava/lang/String;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 35
    .line 36
    .line 37
    move-result-object p4

    .line 38
    iput-object p4, p3, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 41
    .line 42
    .line 43
    move-result-object p4

    .line 44
    invoke-interface {p4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p4

    .line 48
    iput-object p4, p3, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->userId:Ljava/lang/String;

    .line 49
    .line 50
    iput-object p5, p3, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->channel:Ljava/lang/String;

    .line 51
    .line 52
    iput-object p1, p3, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->confId:Ljava/lang/String;

    .line 53
    .line 54
    iput-object p6, p3, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->channelKey:Ljava/lang/String;

    .line 55
    .line 56
    const/4 p1, 0x0

    .line 57
    iput-boolean p1, p3, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->isHost:Z

    .line 58
    .line 59
    iget-object p4, p0, Ll/uqx;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 60
    .line 61
    const/4 p6, 0x1

    .line 62
    if-eqz p4, :cond_1

    .line 63
    .line 64
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 65
    .line 66
    invoke-direct {v0}, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p4, p2, p3, v0}, Lcom/immomo/momomediaext/MMLiveEngine;->w(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;Lcom/immomo/momomediaext/utils/MMLiveRoomParams;Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)I

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    if-nez p2, :cond_0

    .line 74
    .line 75
    move p1, p6

    .line 76
    :cond_0
    move p6, p1

    .line 77
    :cond_1
    if-eqz p6, :cond_2

    .line 78
    .line 79
    iget-wide p1, p0, Ll/uqx;->m:J

    .line 80
    .line 81
    sget-object p3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 82
    .line 83
    invoke-static {p1, p2, p3}, Lrx/c;->timer(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    new-instance p2, Ll/kqx;

    .line 88
    .line 89
    invoke-direct {p2, p0, p5}, Ll/kqx;-><init>(Ll/uqx;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    iput-object p1, p0, Ll/uqx;->e:Ll/kcg0;

    .line 101
    .line 102
    iget-object p0, p0, Ll/uqx;->d:Lcom/p1/mobile/putong/core/mediacall/EventData;

    .line 103
    .line 104
    invoke-virtual {p0, p5}, Lcom/p1/mobile/putong/core/mediacall/EventData;->setChannelID(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 108
    .line 109
    const-string p1, "joinChannel resule : "

    .line 110
    .line 111
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0, p6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-static {p0}, Ll/uqx;->T(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    return p6
.end method

.method public final synthetic L(Ljava/lang/Long;)V
    .locals 4

    .line 1
    iget-object p0, p0, Ll/uqx;->l:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide/16 v2, 0x1

    .line 8
    .line 9
    add-long/2addr v0, v2

    .line 10
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic M(Ll/t54;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uqx;->Y()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic N(Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x2

    .line 6
    if-ne p1, v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/uqx;->w()Ll/t54;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    sget-object p1, Ll/t54;->f:Ll/t54;

    .line 13
    .line 14
    if-ne p0, p1, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public final synthetic O(Ljava/lang/Integer;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/uqx;->e:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-object p1, p0, Ll/uqx;->e:Ll/kcg0;

    .line 8
    .line 9
    iget-object p1, p0, Ll/uqx;->j:Lrx/subjects/a;

    .line 10
    .line 11
    sget-object v0, Ll/t54;->g:Ll/t54;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/uqx;->x()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic P(Ljava/lang/String;Ljava/lang/Long;)V
    .locals 1

    .line 1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "jointimeout   "

    .line 4
    .line 5
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p1}, Ll/uqx;->T(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/uqx;->j:Lrx/subjects/a;

    .line 19
    .line 20
    sget-object p1, Ll/t54;->h:Ll/t54;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic Q()Ll/x1d0;
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->Y1(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 28
    .line 29
    iget-object v2, p0, Ll/uqx;->c:Lcom/google/gson/Gson;

    .line 30
    .line 31
    iget-object p0, p0, Ll/uqx;->d:Lcom/p1/mobile/putong/core/mediacall/EventData;

    .line 32
    .line 33
    invoke-virtual {v2, p0}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {v1, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v0, p0}, Ll/x1d0$a;->k(Ll/z1d0;)Ll/x1d0$a;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0
.end method

.method public final synthetic R()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/ti20;

    .line 2
    .line 3
    new-instance v1, Ll/lqx;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/lqx;-><init>(Ll/uqx;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/ti20;-><init>(Ll/pcj;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {v0, p0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public S(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/uqx;->W()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/uqx;->e:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/uqx;->H()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/uqx;->w()Ll/t54;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget-object v1, Ll/t54;->g:Ll/t54;

    .line 21
    .line 22
    if-ne v0, v1, :cond_1

    .line 23
    .line 24
    sget-object v0, Ll/t54;->i:Ll/t54;

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ll/t54;->b(I)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/uqx;->j:Lrx/subjects/a;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Ll/r7y;->a()V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    sget-object v0, Ll/t54;->h:Ll/t54;

    .line 39
    .line 40
    invoke-virtual {v0, p1}, Ll/t54;->b(I)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/uqx;->j:Lrx/subjects/a;

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    :goto_0
    iget-object p1, p0, Ll/uqx;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 49
    .line 50
    if-eqz p1, :cond_2

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/immomo/momomediaext/MMLiveEngine;->L()V

    .line 53
    .line 54
    .line 55
    :cond_2
    const-string p1, "leaveChannel"

    .line 56
    .line 57
    invoke-static {p1}, Ll/uqx;->T(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    const-string v0, "leavedChannel"

    .line 61
    .line 62
    invoke-virtual {p0, v0}, Ll/uqx;->Z(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Ll/uqx;->k:Lrx/subjects/a;

    .line 66
    .line 67
    const/4 v0, -0x1

    .line 68
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    invoke-static {}, Ll/qzm0;->h()Ll/qzm0;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    const-string v0, "rctLevel"

    .line 80
    .line 81
    invoke-virtual {p0, p1, v0}, Ll/qzm0;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public U(Z)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uqx;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->o0(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iput-boolean p1, p0, Ll/uqx;->n:Z

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0
.end method

.method public V()V
    .locals 4

    .line 1
    const-string v0, "releasrtc"

    .line 2
    .line 3
    invoke-static {v0}, Ll/uqx;->T(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/uqx;->W()V

    .line 7
    .line 8
    .line 9
    iget-boolean v0, p0, Ll/uqx;->b:Z

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, v1}, Ll/uqx;->S(I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/uqx;->j:Lrx/subjects/a;

    .line 18
    .line 19
    sget-object v2, Ll/t54;->c:Ll/t54;

    .line 20
    .line 21
    invoke-virtual {v0, v2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/uqx;->o:Landroid/media/AudioManager;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setMode(I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/uqx;->l:Lrx/subjects/a;

    .line 30
    .line 31
    const-wide/16 v2, -0x1

    .line 32
    .line 33
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v0, v2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/uqx;->o:Landroid/media/AudioManager;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 43
    .line 44
    .line 45
    iput-boolean v1, p0, Ll/uqx;->n:Z

    .line 46
    .line 47
    iget-object v0, p0, Ll/uqx;->g:Ll/kcg0;

    .line 48
    .line 49
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/uqx;->h:Ll/kcg0;

    .line 53
    .line 54
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/uqx;->i:Ll/kcg0;

    .line 58
    .line 59
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 60
    .line 61
    .line 62
    const-wide/16 v2, 0x0

    .line 63
    .line 64
    iput-wide v2, p0, Ll/uqx;->p:J

    .line 65
    .line 66
    :cond_0
    iput-boolean v1, p0, Ll/uqx;->b:Z

    .line 67
    .line 68
    iget-object p0, p0, Ll/uqx;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 69
    .line 70
    if-eqz p0, :cond_1

    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/immomo/momomediaext/MMLiveEngine;->S()V

    .line 73
    .line 74
    .line 75
    :cond_1
    return-void
.end method

.method public final W()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/uqx;->r:Z

    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/uqx;->q:J

    .line 7
    .line 8
    return-void
.end method

.method public X(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/uqx;->m:J

    .line 2
    .line 3
    return-void
.end method

.method public final Y()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/uqx;->W()V

    .line 2
    .line 3
    .line 4
    const-string v0, "stopCountDuration"

    .line 5
    .line 6
    invoke-static {v0}, Ll/uqx;->T(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/uqx;->l:Lrx/subjects/a;

    .line 10
    .line 11
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/Long;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    iput-wide v0, p0, Ll/uqx;->p:J

    .line 22
    .line 23
    iget-object v0, p0, Ll/uqx;->f:Ll/kcg0;

    .line 24
    .line 25
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    iput-object v0, p0, Ll/uqx;->f:Ll/kcg0;

    .line 30
    .line 31
    iget-object p0, p0, Ll/uqx;->l:Lrx/subjects/a;

    .line 32
    .line 33
    const-wide/16 v0, -0x1

    .line 34
    .line 35
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final Z(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/uqx;->a0(Ljava/lang/String;Ljava/lang/Object;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final a0(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uqx;->d:Lcom/p1/mobile/putong/core/mediacall/EventData;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/mediacall/EventData;->setEventName(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/uqx;->d:Lcom/p1/mobile/putong/core/mediacall/EventData;

    .line 7
    .line 8
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/mediacall/EventData;->setEventProperties(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v1, "patch_rtc_"

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance v0, Ll/gqx;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Ll/gqx;-><init>(Ll/uqx;)V

    .line 30
    .line 31
    .line 32
    const/4 p0, -0x1

    .line 33
    invoke-virtual {p2, p1, p0, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    new-instance p1, Ll/iqx;

    .line 38
    .line 39
    invoke-direct {p1}, Ll/iqx;-><init>()V

    .line 40
    .line 41
    .line 42
    new-instance p2, Ll/jqx;

    .line 43
    .line 44
    invoke-direct {p2}, Ll/jqx;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public v()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/t54;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/uqx;->j:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public w()Ll/t54;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uqx;->j:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/t54;

    .line 8
    .line 9
    return-object p0
.end method

.method public final x()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/uqx;->f:Ll/kcg0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/r7y;->b()V

    .line 6
    .line 7
    .line 8
    const-string v0, "start countDuration"

    .line 9
    .line 10
    invoke-static {v0}, Ll/uqx;->T(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 14
    .line 15
    const-wide/16 v1, 0x1

    .line 16
    .line 17
    invoke-static {v1, v2, v1, v2, v0}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/hqx;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/hqx;-><init>(Ll/uqx;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, p0, Ll/uqx;->f:Ll/kcg0;

    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method public z(Z)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uqx;->o:Landroid/media/AudioManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/media/AudioManager;->getMode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x3

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/uqx;->o:Landroid/media/AudioManager;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setMode(I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Ll/uqx;->o:Landroid/media/AudioManager;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/uqx;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Lcom/immomo/momomediaext/MMLiveEngine;->j0(Z)V

    .line 25
    .line 26
    .line 27
    :cond_1
    iput-boolean p1, p0, Ll/uqx;->t:Z

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0
.end method
