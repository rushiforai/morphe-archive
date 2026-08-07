.class public Ll/qbt;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/oo2;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Ljava/lang/String;

.field public j:Ll/l4g0;

.field public k:Z

.field public l:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/dum;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/qbt;->k:Z

    .line 6
    .line 7
    iput-object p2, p0, Ll/qbt;->i:Ljava/lang/String;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic J3(Ll/qbt;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qbt;->N3(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic K3(Ll/qbt;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qbt;->O3(Ll/jsv;)V

    return-void
.end method

.method public static synthetic L3(Ll/qbt;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qbt;->P3(Ll/jsv;)V

    return-void
.end method


# virtual methods
.method public final M3()V
    .locals 3

    .line 1
    new-instance v0, Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-class v2, Ll/xct;

    .line 8
    .line 9
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-direct {v0, v1, v2}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/qbt;->j:Ll/l4g0;

    .line 17
    .line 18
    new-instance v0, Lorg/json/JSONObject;

    .line 19
    .line 20
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 21
    .line 22
    .line 23
    :try_start_0
    const-string v1, "liveId"

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2}, Ll/vp20;->k()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 34
    .line 35
    .line 36
    const-string v1, "anchorId"

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v2}, Ll/oo2;->j0()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 47
    .line 48
    .line 49
    const-string v1, "live_entrance_source"

    .line 50
    .line 51
    iget-object v2, p0, Ll/qbt;->i:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :catch_0
    move-exception v1

    .line 58
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 59
    .line 60
    .line 61
    :goto_0
    iget-object p0, p0, Ll/qbt;->j:Ll/l4g0;

    .line 62
    .line 63
    invoke-virtual {p0, v0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final synthetic N3(Lcom/p1/mobile/android/app/c;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qbt;->j:Ll/l4g0;

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
    iget-boolean v1, p0, Ll/qbt;->k:Z

    .line 11
    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, Ll/qbt;->k:Z

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/l4g0;->l()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    sget-object v1, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 22
    .line 23
    if-ne p1, v1, :cond_2

    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    iput-boolean p1, p0, Ll/qbt;->k:Z

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

.method public final synthetic O3(Ll/jsv;)V
    .locals 1

    .line 1
    new-instance p1, Ll/hx2;

    .line 2
    .line 3
    const/16 v0, 0x1194

    .line 4
    .line 5
    invoke-direct {p1, v0}, Ll/hx2;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Ljava/util/Map;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string v0, "live_id"

    .line 23
    .line 24
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    const-string p0, "e_beauty_live_start"

    .line 28
    .line 29
    const-string v0, "p_anchor_live_ready"

    .line 30
    .line 31
    invoke-static {p0, v0, p1}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic P3(Ll/jsv;)V
    .locals 2

    .line 1
    new-instance p1, Ll/hx2;

    .line 2
    .line 3
    const/16 v0, 0x1194

    .line 4
    .line 5
    invoke-direct {p1, v0}, Ll/hx2;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Ljava/util/Map;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "live_id"

    .line 23
    .line 24
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    const-string v0, "e_beauty_live_end"

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {v0, p0, p1}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/xzs;->e:Ll/dum;

    .line 5
    .line 6
    iget-object v0, v0, Ll/dum;->f:Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/lbt;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/lbt;-><init>(Ll/qbt;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Ll/qbt;->l:Ll/kcg0;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/mbt;

    .line 40
    .line 41
    invoke-direct {v1}, Ll/mbt;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Lrx/c;->takeFirst(Ll/qcj;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/nbt;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/nbt;-><init>(Ll/qbt;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v1, Ll/obt;

    .line 73
    .line 74
    invoke-direct {v1}, Ll/obt;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v1}, Lrx/c;->takeFirst(Ll/qcj;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    new-instance v1, Ll/pbt;

    .line 82
    .line 83
    invoke-direct {v1, p0}, Ll/pbt;-><init>(Ll/qbt;)V

    .line 84
    .line 85
    .line 86
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/qbt;->j:Ll/l4g0;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/l4g0;->j()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Ll/qbt;->l:Ll/kcg0;

    .line 12
    .line 13
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public t()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/qbt;->M3()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/qbt;->j:Ll/l4g0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/l4g0;->i()V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/qbt;->j:Ll/l4g0;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 15
    .line 16
    .line 17
    return-void
.end method
