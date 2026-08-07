.class public Ll/oho0;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/rwn0;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ll/l4g0;

.field public j:Z


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/oho0;->j:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic J3(Ll/oho0;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/oho0;->N3(Ll/jsv;)V

    return-void
.end method

.method public static synthetic K3(Ll/oho0;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oho0;->M3(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method private L3()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/oho0;->i:Ll/l4g0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/l4g0;

    .line 6
    .line 7
    const-class v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "p_start_audio_room"

    .line 14
    .line 15
    invoke-direct {v0, v2, v1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/oho0;->i:Ll/l4g0;

    .line 19
    .line 20
    new-instance v0, Lorg/json/JSONObject;

    .line 21
    .line 22
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 23
    .line 24
    .line 25
    :try_start_0
    const-string v1, "anchorId"

    .line 26
    .line 27
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 28
    .line 29
    invoke-virtual {v2}, Ll/wrv;->D0()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 34
    .line 35
    .line 36
    const-string v1, "entrance_type"

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    check-cast v2, Ll/rwn0;

    .line 43
    .line 44
    iget-object v2, v2, Ll/rwn0;->a0:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :catch_0
    move-exception v1

    .line 51
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 52
    .line 53
    .line 54
    :goto_0
    iget-object v1, p0, Ll/oho0;->i:Ll/l4g0;

    .line 55
    .line 56
    invoke-virtual {v1, v0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 57
    .line 58
    .line 59
    :cond_0
    iget-object p0, p0, Ll/oho0;->i:Ll/l4g0;

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/l4g0;->i()V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method private N3(Ll/jsv;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/jsv;->a()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eq p1, v0, :cond_1

    .line 7
    .line 8
    const/4 v0, 0x2

    .line 9
    if-eq p1, v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-direct {p0}, Ll/oho0;->O3()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    iget-object p0, p0, Ll/oho0;->i:Ll/l4g0;

    .line 17
    .line 18
    if-eqz p0, :cond_2

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 21
    .line 22
    .line 23
    :cond_2
    :goto_0
    return-void
.end method

.method private O3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/oho0;->i:Ll/l4g0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/oho0;->i:Ll/l4g0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/l4g0;->j()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Ll/oho0;->i:Ll/l4g0;

    .line 15
    .line 16
    :cond_0
    return-void
.end method


# virtual methods
.method public final M3(Lcom/p1/mobile/android/app/c;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/oho0;->i:Ll/l4g0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 7
    .line 8
    if-ne p1, v1, :cond_1

    .line 9
    .line 10
    iget-boolean v1, p0, Ll/oho0;->j:Z

    .line 11
    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, Ll/oho0;->j:Z

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/l4g0;->l()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    sget-object v1, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 22
    .line 23
    if-ne p1, v1, :cond_2

    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    iput-boolean p1, p0, Ll/oho0;->j:Z

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 29
    .line 30
    .line 31
    :cond_2
    :goto_0
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/rwn0;

    .line 9
    .line 10
    iget-boolean v0, v0, Ll/rwn0;->Q:Z

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-direct {p0}, Ll/oho0;->L3()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ll/rwn0;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/mbt;

    .line 33
    .line 34
    invoke-direct {v1}, Ll/mbt;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lrx/c;->takeUntil(Ll/qcj;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/mho0;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/mho0;-><init>(Ll/oho0;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ll/xzs;->H2()Lcom/p1/mobile/android/app/Frag;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v1, Ll/nho0;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/nho0;-><init>(Ll/oho0;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 71
    .line 72
    .line 73
    return-void
.end method
