.class public Ll/r5r;
.super Ll/eas;
.source "SourceFile"

# interfaces
.implements Ll/xvl;


# instance fields
.field public final a:Ll/c0m;

.field public final b:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Ll/dn50;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ll/kcg0;

.field public d:I

.field public final e:Ll/uzl;

.field public f:Ljava/lang/String;

.field public g:Z

.field public h:I

.field public i:Z

.field public j:J

.field public k:J


# direct methods
.method public constructor <init>(Ll/c0m;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/eas;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Ll/r5r;->j:J

    .line 7
    .line 8
    iput-wide v0, p0, Ll/r5r;->k:J

    .line 9
    .line 10
    iput-object p1, p0, Ll/r5r;->a:Ll/c0m;

    .line 11
    .line 12
    invoke-interface {p1}, Ll/c0m;->a()Ll/uzl;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Ll/r5r;->e:Ll/uzl;

    .line 17
    .line 18
    new-instance p1, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 19
    .line 20
    invoke-direct {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Ll/r5r;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    iput-boolean p1, p0, Ll/r5r;->g:Z

    .line 27
    .line 28
    sget-object p1, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;->MMLiveAudioEffectPresetOff:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;->getValue()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iput p1, p0, Ll/r5r;->h:I

    .line 35
    .line 36
    return-void
.end method

.method public static synthetic S0(Ljava/lang/String;Ljava/lang/String;Ll/dn50;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/dn50;->m0(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic T0(Ll/r5r;Ll/dn50;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r5r;->i1(Ll/dn50;)V

    return-void
.end method

.method public static synthetic U0(Ljava/lang/String;Ljava/lang/String;Ll/dn50;)V
    .locals 0

    .line 1
    invoke-interface {p2, p0, p1}, Ll/dn50;->A0(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic V0(Ll/r5r;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r5r;->j1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic W0(Ll/r5r;Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r5r;->k1(Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic X0(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 4

    .line 1
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-ltz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static synthetic Y0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/dn50;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/vqn0;->g()Ll/vqn0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0, p1}, Ll/vqn0;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p3, p0, p1, p2}, Ll/dn50;->s(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic Z0(Ll/r5r;Ll/dn50;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r5r;->h1(Ll/dn50;)V

    return-void
.end method

.method public static synthetic a1(Ljava/lang/String;Ljava/lang/String;JJLl/dn50;)V
    .locals 2

    .line 1
    move-object v1, p1

    .line 2
    move-object p1, p0

    .line 3
    move-object p0, p6

    .line 4
    move-wide p5, p4

    .line 5
    move-wide p3, p2

    .line 6
    move-object p2, v1

    .line 7
    :try_start_0
    invoke-interface/range {p0 .. p6}, Ll/dn50;->U1(Ljava/lang/String;Ljava/lang/String;JJ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception v0

    .line 12
    move-object p0, v0

    .line 13
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic b1(ILl/dn50;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string p0, ""

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p1, p0}, Ll/dn50;->H0(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic c1(Ll/r5r;Ljava/lang/String;JLjava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/r5r;->m1(Ljava/lang/String;JLjava/lang/Long;)V

    return-void
.end method

.method public static synthetic d1(Ll/r5r;Ljava/lang/String;JLjava/lang/Long;)Ljava/lang/Long;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/r5r;->l1(Ljava/lang/String;JLjava/lang/Long;)Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic e1(Ll/r5r;)Ljava/util/concurrent/CopyOnWriteArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r5r;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    return-object p0
.end method


# virtual methods
.method public C0(Ljava/lang/String;ILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->C0(Ljava/lang/String;ILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "onLocalLeaveChannel"

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/r5r;->n1(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    invoke-virtual {p0, p1}, Ll/r5r;->q1(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public E0(F)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "adjustMusicVolume:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/r5r;->n1(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/r5r;->e:Ll/uzl;

    .line 19
    .line 20
    invoke-interface {p0, p1}, Ll/uzl;->a0(F)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public G0()I
    .locals 0

    .line 1
    iget p0, p0, Ll/r5r;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public H(Ljava/lang/Boolean;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput-boolean v0, p0, Ll/r5r;->g:Z

    .line 6
    .line 7
    iget-object v0, p0, Ll/r5r;->a:Ll/c0m;

    .line 8
    .line 9
    invoke-interface {v0}, Ll/c0m;->a()Ll/uzl;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Ll/uzl;->k()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Ll/r5r;->a:Ll/c0m;

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    if-le v0, v2, :cond_0

    .line 21
    .line 22
    invoke-interface {v1}, Ll/c0m;->a()Ll/uzl;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    xor-int/2addr v2, v3

    .line 31
    invoke-interface {v1, v2}, Ll/uzl;->Q0(I)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-interface {v1}, Ll/c0m;->a()Ll/uzl;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-interface {v1, p1}, Ll/uzl;->H(Ljava/lang/Boolean;)I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v3, "setOriginal result"

    .line 47
    .line 48
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v1, ",isCheck:"

    .line 55
    .line 56
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string p1, "\uff0ctrackCount"

    .line 63
    .line 64
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p0, p1}, Ll/r5r;->n1(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public H0(Z)V
    .locals 2

    .line 1
    const-string v0, "lifecycle destroy"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/r5r;->n0(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/r5r;->a:Ll/c0m;

    .line 7
    .line 8
    invoke-interface {v0}, Ll/c0m;->b()Ll/wsl;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0, p0}, Ll/wsl;->a(Ll/w6m;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/r5r;->O0()V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ll/vqn0;->g()Ll/vqn0;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Ll/vqn0;->c()V

    .line 23
    .line 24
    .line 25
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    invoke-virtual {p0, v0, v1}, Ll/r5r;->M0(Ljava/lang/Boolean;Z)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ll/r5r;->q1(Z)V

    .line 32
    .line 33
    .line 34
    const/4 p1, 0x0

    .line 35
    iput-boolean p1, p0, Ll/r5r;->g:Z

    .line 36
    .line 37
    sget-object p1, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;->MMLiveAudioEffectPresetOff:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;->getValue()I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    iput p1, p0, Ll/r5r;->h:I

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/r5r;->r1()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public J0(Ll/dn50;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r5r;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public M0(Ljava/lang/Boolean;Z)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    iput-boolean p2, p0, Ll/r5r;->i:Z

    .line 6
    .line 7
    iget-object p0, p0, Ll/r5r;->a:Ll/c0m;

    .line 8
    .line 9
    invoke-interface {p0}, Ll/c0m;->a()Ll/uzl;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0, p1}, Ll/uzl;->M(Ljava/lang/Boolean;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public O0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r5r;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public P0(F)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "adjustRecordingVolume:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/r5r;->n1(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/r5r;->e:Ll/uzl;

    .line 19
    .line 20
    invoke-interface {p0, p1}, Ll/uzl;->A(F)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public R(I[B)V
    .locals 13

    .line 1
    const-string v0, "onStreamMessage,uid"

    .line 2
    .line 3
    invoke-super {p0, p1, p2}, Ll/eas;->R(I[B)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    new-instance v1, Ljava/lang/String;

    .line 7
    .line 8
    invoke-direct {v1, p2}, Ljava/lang/String;-><init>([B)V

    .line 9
    .line 10
    .line 11
    new-instance p2, Lorg/json/JSONObject;

    .line 12
    .line 13
    invoke-direct {p2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    sget-object v1, Ll/qd80;->b:Ljava/lang/String;

    .line 17
    .line 18
    sget-object v2, Ll/qd80;->a:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p2, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_6

    .line 29
    .line 30
    sget-object v1, Ll/qd80;->c:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 33
    .line 34
    .line 35
    move-result-wide v1

    .line 36
    sget-object v3, Ll/qd80;->e:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p2, v3}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 39
    .line 40
    .line 41
    move-result-wide v7

    .line 42
    sget-object v3, Ll/qd80;->d:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {p2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v6

    .line 48
    sget-object v3, Ll/qd80;->f:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {p2, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result v3
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_2

    .line 54
    const-wide/16 v4, 0x0

    .line 55
    .line 56
    if-eqz v3, :cond_1

    .line 57
    .line 58
    :try_start_1
    sget-object v3, Ll/qd80;->f:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p2, v3}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 61
    .line 62
    .line 63
    move-result-wide v9

    .line 64
    invoke-static {}, Ll/pzi0;->o()J

    .line 65
    .line 66
    .line 67
    move-result-wide v11
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 68
    sub-long/2addr v11, v9

    .line 69
    const-wide/16 v9, 0x12c

    .line 70
    .line 71
    cmp-long p2, v11, v9

    .line 72
    .line 73
    if-lez p2, :cond_0

    .line 74
    .line 75
    sub-long v9, v1, v11

    .line 76
    .line 77
    cmp-long p2, v9, v4

    .line 78
    .line 79
    if-ltz p2, :cond_0

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_0
    move-wide v9, v1

    .line 83
    goto :goto_0

    .line 84
    :catch_0
    move-exception v0

    .line 85
    move-object p1, v0

    .line 86
    move-object v4, p0

    .line 87
    goto/16 :goto_2

    .line 88
    .line 89
    :cond_1
    move-wide v9, v1

    .line 90
    move-wide v11, v4

    .line 91
    :goto_0
    :try_start_2
    new-instance p2, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string v0, ",songCode:"

    .line 100
    .line 101
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {p2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    const-string v0, ",progress:"

    .line 108
    .line 109
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {p2, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const-string v0, ",duration:"

    .line 116
    .line 117
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {p2, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v0, "delay\uff1a"

    .line 124
    .line 125
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {p2, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p2

    .line 135
    invoke-virtual {p0, p2}, Ll/r5r;->n1(Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    .line 136
    .line 137
    .line 138
    cmp-long p2, v1, v4

    .line 139
    .line 140
    if-nez p2, :cond_2

    .line 141
    .line 142
    :try_start_3
    invoke-virtual {p0}, Ll/r5r;->s1()V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_2
    const-wide/16 v3, -0x1

    .line 147
    .line 148
    cmp-long p2, v1, v3

    .line 149
    .line 150
    iget v0, p0, Ll/r5r;->d:I

    .line 151
    .line 152
    if-nez p2, :cond_3

    .line 153
    .line 154
    const/4 p1, 0x4

    .line 155
    if-eq v0, p1, :cond_6

    .line 156
    .line 157
    :try_start_4
    invoke-virtual {p0, p1}, Ll/r5r;->setStatus(I)V

    .line 158
    .line 159
    .line 160
    iget-object p1, p0, Ll/r5r;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 161
    .line 162
    new-instance p2, Ll/b5r;

    .line 163
    .line 164
    invoke-direct {p2}, Ll/b5r;-><init>()V

    .line 165
    .line 166
    .line 167
    invoke-static {p1, p2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_0

    .line 168
    .line 169
    .line 170
    return-void

    .line 171
    :cond_3
    if-eqz v0, :cond_4

    .line 172
    .line 173
    const/4 p2, 0x5

    .line 174
    if-ne v0, p2, :cond_5

    .line 175
    .line 176
    :cond_4
    :try_start_5
    invoke-virtual {p0}, Ll/r5r;->s1()V

    .line 177
    .line 178
    .line 179
    :cond_5
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v5
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_2

    .line 183
    move-object v4, p0

    .line 184
    :try_start_6
    invoke-virtual/range {v4 .. v10}, Ll/r5r;->o1(Ljava/lang/String;Ljava/lang/String;JJ)J
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_1

    .line 185
    .line 186
    .line 187
    return-void

    .line 188
    :catch_1
    move-exception v0

    .line 189
    :goto_1
    move-object p1, v0

    .line 190
    goto :goto_2

    .line 191
    :catch_2
    move-exception v0

    .line 192
    move-object v4, p0

    .line 193
    goto :goto_1

    .line 194
    :cond_6
    return-void

    .line 195
    :goto_2
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 196
    .line 197
    .line 198
    new-instance p0, Ljava/lang/StringBuilder;

    .line 199
    .line 200
    const-string p2, "onStreamMessage:"

    .line 201
    .line 202
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object p0

    .line 216
    invoke-virtual {v4, p0}, Ll/r5r;->n1(Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    return-void
.end method

.method public U(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "prepare prepareMusicFile:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/r5r;->n1(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ll/vqn0;->g()Ll/vqn0;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-virtual {p0, p1, p2, v0}, Ll/vqn0;->m(Ljava/lang/String;Ljava/lang/String;Ll/w8e;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public W()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/eas;->W()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/r5r;->d:I

    .line 5
    .line 6
    const/4 v1, 0x5

    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    const-string v0, "onSurroundMusicStopped:"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/r5r;->n1(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v1}, Ll/r5r;->setStatus(I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/r5r;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 18
    .line 19
    new-instance v1, Ll/n5r;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/n5r;-><init>(Ll/r5r;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/r5r;->c:Ll/kcg0;

    .line 28
    .line 29
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 30
    .line 31
    .line 32
    const/4 v0, 0x1

    .line 33
    invoke-virtual {p0, v0}, Ll/r5r;->q1(Z)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/r5r;->r1()V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public X()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/eas;->X()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/r5r;->d:I

    .line 5
    .line 6
    const/4 v1, 0x5

    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    const-string v0, "onSurroundMusicStopped:"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/r5r;->n1(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v1}, Ll/r5r;->setStatus(I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/r5r;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 18
    .line 19
    new-instance v1, Ll/o5r;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/o5r;-><init>(Ll/r5r;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/r5r;->c:Ll/kcg0;

    .line 28
    .line 29
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 30
    .line 31
    .line 32
    const/4 v0, 0x1

    .line 33
    invoke-virtual {p0, v0}, Ll/r5r;->q1(Z)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/r5r;->r1()V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public Z()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/eas;->Z()V

    .line 2
    .line 3
    .line 4
    const-string v0, "onSurroundMusicStart:"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/r5r;->n1(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget v0, p0, Ll/r5r;->d:I

    .line 10
    .line 11
    const/4 v1, 0x3

    .line 12
    if-eq v0, v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/r5r;->g1()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/r5r;->s1()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public c()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/r5r;->e:Ll/uzl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/uzl;->c()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public d()F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r5r;->e:Ll/uzl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/uzl;->d()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public f0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p4, p0, Ll/r5r;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    new-instance v0, Ll/i5r;

    .line 4
    .line 5
    invoke-direct {v0, p2, p3}, Ll/i5r;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p4, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    new-instance p4, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v0, "playMusic:"

    .line 14
    .line 15
    invoke-direct {p4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v0, ",current status:"

    .line 22
    .line 23
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget v0, p0, Ll/r5r;->d:I

    .line 27
    .line 28
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p4

    .line 35
    invoke-virtual {p0, p4}, Ll/r5r;->n1(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Ll/r5r;->f:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {}, Ll/vqn0;->g()Ll/vqn0;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1, p2}, Ll/vqn0;->o(Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_0

    .line 49
    .line 50
    invoke-static {}, Ll/vqn0;->g()Ll/vqn0;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p1, p2}, Ll/vqn0;->l(Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p3

    .line 58
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    const-string p4, "playMusic path:"

    .line 61
    .line 62
    invoke-direct {p1, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p0, p1}, Ll/r5r;->n1(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, p2, p3}, Ll/r5r;->p1(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-static {}, Ll/vqn0;->g()Ll/vqn0;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-virtual {p1, p2, p5}, Ll/vqn0;->n(Ljava/lang/String;Ljava/lang/String;)Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-eqz p1, :cond_1

    .line 87
    .line 88
    iget-object p0, p0, Ll/r5r;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 89
    .line 90
    new-instance p1, Ll/j5r;

    .line 91
    .line 92
    invoke-direct {p1, p2, p5, p6}, Ll/j5r;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    invoke-static {p0, p1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_1
    const-string p1, "lrc download timeout"

    .line 100
    .line 101
    invoke-virtual {p0, p1}, Ll/r5r;->n1(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public final f1(Ljava/lang/Long;Ljava/lang/String;J)J
    .locals 10

    .line 1
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0xa

    .line 6
    .line 7
    rem-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long p1, v0, v2

    .line 11
    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Ll/r5r;->e:Ll/uzl;

    .line 15
    .line 16
    invoke-interface {p1}, Ll/uzl;->r()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    new-instance p1, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v4, "getSurroundMusicPos1:"

    .line 23
    .line 24
    invoke-direct {p1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p0, p1}, Ll/r5r;->n1(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :goto_0
    move-wide v8, v0

    .line 38
    goto :goto_1

    .line 39
    :cond_0
    iget-wide v0, p0, Ll/r5r;->j:J

    .line 40
    .line 41
    cmp-long p1, v0, v2

    .line 42
    .line 43
    if-gez p1, :cond_1

    .line 44
    .line 45
    iget-object p1, p0, Ll/r5r;->e:Ll/uzl;

    .line 46
    .line 47
    invoke-interface {p1}, Ll/uzl;->r()J

    .line 48
    .line 49
    .line 50
    move-result-wide v0

    .line 51
    goto :goto_0

    .line 52
    :cond_1
    invoke-static {}, Ll/pzi0;->o()J

    .line 53
    .line 54
    .line 55
    move-result-wide v0

    .line 56
    iget-wide v4, p0, Ll/r5r;->k:J

    .line 57
    .line 58
    sub-long/2addr v0, v4

    .line 59
    const-wide/16 v4, 0x64

    .line 60
    .line 61
    cmp-long p1, v0, v4

    .line 62
    .line 63
    if-lez p1, :cond_2

    .line 64
    .line 65
    iget-object p1, p0, Ll/r5r;->e:Ll/uzl;

    .line 66
    .line 67
    invoke-interface {p1}, Ll/uzl;->r()J

    .line 68
    .line 69
    .line 70
    move-result-wide v0

    .line 71
    new-instance p1, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    const-string v4, "getSurroundMusicPos2:"

    .line 74
    .line 75
    invoke-direct {p1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p0, p1}, Ll/r5r;->n1(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_2
    iget-wide v4, p0, Ll/r5r;->j:J

    .line 90
    .line 91
    add-long/2addr v0, v4

    .line 92
    goto :goto_0

    .line 93
    :goto_1
    invoke-static {}, Ll/pzi0;->o()J

    .line 94
    .line 95
    .line 96
    move-result-wide v0

    .line 97
    iput-wide v0, p0, Ll/r5r;->k:J

    .line 98
    .line 99
    iput-wide v8, p0, Ll/r5r;->j:J

    .line 100
    .line 101
    cmp-long p1, v8, v2

    .line 102
    .line 103
    if-gez p1, :cond_3

    .line 104
    .line 105
    const-string p1, "current position illegal"

    .line 106
    .line 107
    invoke-virtual {p0, p1}, Ll/r5r;->n0(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    invoke-static {}, Ll/vqn0;->g()Ll/vqn0;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-virtual {p0, p2}, Ll/vqn0;->d(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    return-wide v8

    .line 118
    :cond_3
    cmp-long p1, v8, p3

    .line 119
    .line 120
    if-ltz p1, :cond_4

    .line 121
    .line 122
    const-string p1, "check play complete"

    .line 123
    .line 124
    invoke-virtual {p0, p1}, Ll/r5r;->n0(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    return-wide v8

    .line 128
    :cond_4
    move-object v4, p0

    .line 129
    move-object v5, p2

    .line 130
    move-wide v6, p3

    .line 131
    invoke-virtual/range {v4 .. v9}, Ll/r5r;->t1(Ljava/lang/String;JJ)J

    .line 132
    .line 133
    .line 134
    return-wide v8
.end method

.method public final g1()V
    .locals 1

    .line 1
    const-string v0, "initMusicEffect:"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/r5r;->n1(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget v0, p0, Ll/r5r;->h:I

    .line 7
    .line 8
    if-lez v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/r5r;->h(I)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget-object v0, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;->MMLiveAudioEffectPresetRoomAcousticsKTV:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;->getValue()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p0, v0}, Ll/r5r;->h(I)V

    .line 21
    .line 22
    .line 23
    :goto_0
    iget-boolean v0, p0, Ll/r5r;->g:Z

    .line 24
    .line 25
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Ll/r5r;->H(Ljava/lang/Boolean;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public getStatus()I
    .locals 0

    .line 1
    iget p0, p0, Ll/r5r;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public h(I)V
    .locals 3

    .line 1
    iput p1, p0, Ll/r5r;->h:I

    .line 2
    .line 3
    iget-object v0, p0, Ll/r5r;->a:Ll/c0m;

    .line 4
    .line 5
    invoke-interface {v0}, Ll/c0m;->a()Ll/uzl;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0, p1}, Ll/uzl;->h(I)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    new-instance v1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v2, "setAudioEffectPreset result"

    .line 16
    .line 17
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v0, ",effectPreset:"

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0, p1}, Ll/r5r;->n1(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public h0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/r5r;->i:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic h1(Ll/dn50;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r5r;->f:Ljava/lang/String;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ll/dn50;->B(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i()F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r5r;->e:Ll/uzl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/uzl;->i()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic i1(Ll/dn50;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r5r;->f:Ljava/lang/String;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ll/dn50;->B(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public init()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/r5r;->a:Ll/c0m;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/c0m;->b()Ll/wsl;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0, p0}, Ll/wsl;->b(Ll/w6m;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public j0(Ll/dn50;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/r5r;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/r5r;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v1, "registerPlayListener:"

    .line 17
    .line 18
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Ll/r5r;->n1(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public final synthetic j1(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "throwable:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Ll/r5r;->n1(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public k0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/r5r;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic k1(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    const/4 p1, 0x3

    .line 2
    iget p0, p0, Ll/r5r;->d:I

    .line 3
    .line 4
    if-ne p1, p0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic l1(Ljava/lang/String;JLjava/lang/Long;)Ljava/lang/Long;
    .locals 0

    .line 1
    invoke-virtual {p0, p4, p1, p2, p3}, Ll/r5r;->f1(Ljava/lang/Long;Ljava/lang/String;J)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic m1(Ljava/lang/String;JLjava/lang/Long;)V
    .locals 8

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
    invoke-virtual {p4}, Ljava/lang/Long;->longValue()J

    .line 8
    .line 9
    .line 10
    move-result-wide v6

    .line 11
    move-object v1, p0

    .line 12
    move-object v3, p1

    .line 13
    move-wide v4, p2

    .line 14
    invoke-virtual/range {v1 .. v7}, Ll/r5r;->o1(Ljava/lang/String;Ljava/lang/String;JJ)J

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public n0(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "stopMusic "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/r5r;->n1(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/r5r;->c:Ll/kcg0;

    .line 19
    .line 20
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/r5r;->a:Ll/c0m;

    .line 24
    .line 25
    invoke-interface {p0}, Ll/c0m;->a()Ll/uzl;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-interface {p0}, Ll/uzl;->stopSurroundMusic()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final n1(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string p1, ",hashCode:"

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string p1, "[voice][ktv]"

    .line 26
    .line 27
    invoke-static {p1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final o1(Ljava/lang/String;Ljava/lang/String;JJ)J
    .locals 7

    .line 1
    iget-object p0, p0, Ll/r5r;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    new-instance v0, Ll/g5r;

    .line 4
    .line 5
    move-object v1, p1

    .line 6
    move-object v2, p2

    .line 7
    move-wide v3, p3

    .line 8
    move-wide v5, p5

    .line 9
    invoke-direct/range {v0 .. v6}, Ll/g5r;-><init>(Ljava/lang/String;Ljava/lang/String;JJ)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 13
    .line 14
    .line 15
    return-wide v5
.end method

.method public p0(Ljava/lang/String;)V
    .locals 7

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "sendMusicProgress:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/r5r;->n1(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/r5r;->c:Ll/kcg0;

    .line 19
    .line 20
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/r5r;->e:Ll/uzl;

    .line 24
    .line 25
    invoke-interface {v0}, Ll/uzl;->c()J

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    const-wide/16 v2, 0x32

    .line 30
    .line 31
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 32
    .line 33
    const-wide/16 v5, 0x0

    .line 34
    .line 35
    invoke-static {v5, v6, v2, v3, v4}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v2}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    new-instance v3, Ll/p5r;

    .line 44
    .line 45
    invoke-direct {v3, p0}, Ll/p5r;-><init>(Ll/r5r;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2, v3}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    new-instance v3, Ll/c5r;

    .line 53
    .line 54
    invoke-direct {v3, p0, p1, v0, v1}, Ll/c5r;-><init>(Ll/r5r;Ljava/lang/String;J)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v2, v3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    new-instance v3, Ll/d5r;

    .line 62
    .line 63
    invoke-direct {v3}, Ll/d5r;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v2, v3}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    invoke-virtual {v2, v3}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    new-instance v3, Ll/e5r;

    .line 79
    .line 80
    invoke-direct {v3, p0, p1, v0, v1}, Ll/e5r;-><init>(Ll/r5r;Ljava/lang/String;J)V

    .line 81
    .line 82
    .line 83
    new-instance p1, Ll/f5r;

    .line 84
    .line 85
    invoke-direct {p1, p0}, Ll/f5r;-><init>(Ll/r5r;)V

    .line 86
    .line 87
    .line 88
    invoke-static {v3, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {v2, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    iput-object p1, p0, Ll/r5r;->c:Ll/kcg0;

    .line 97
    .line 98
    return-void
.end method

.method public final p1(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onMusicResourceReady:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ",filePath:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Ll/r5r;->n1(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/r5r;->e:Ll/uzl;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-interface {v0, p2, v1}, Ll/uzl;->E(Ljava/lang/String;Z)V

    .line 30
    .line 31
    .line 32
    const/4 v0, 0x2

    .line 33
    invoke-virtual {p0, v0}, Ll/r5r;->setStatus(I)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/r5r;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 37
    .line 38
    new-instance v0, Ll/l5r;

    .line 39
    .line 40
    invoke-direct {v0, p1, p2}, Ll/l5r;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public pause()V
    .locals 2

    .line 1
    const-string v0, "pause"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/r5r;->n1(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/r5r;->a:Ll/c0m;

    .line 7
    .line 8
    invoke-interface {v0}, Ll/c0m;->a()Ll/uzl;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Ll/uzl;->j()V

    .line 13
    .line 14
    .line 15
    iget v0, p0, Ll/r5r;->d:I

    .line 16
    .line 17
    const/4 v1, 0x4

    .line 18
    if-eq v0, v1, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0, v1}, Ll/r5r;->setStatus(I)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/r5r;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 24
    .line 25
    new-instance v0, Ll/b5r;

    .line 26
    .line 27
    invoke-direct {v0}, Ll/b5r;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public q0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, " prepareLrcFile:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/r5r;->n1(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ll/vqn0;->g()Ll/vqn0;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    new-instance v6, Ll/r5r$a;

    .line 23
    .line 24
    invoke-direct {v6, p0, p1, p4}, Ll/r5r$a;-><init>(Ll/r5r;Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    move-object v2, p1

    .line 28
    move-object v3, p2

    .line 29
    move-object v4, p3

    .line 30
    move-object v5, p4

    .line 31
    invoke-virtual/range {v1 .. v6}, Ll/vqn0;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/w8e;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final q1(Z)V
    .locals 1

    .line 1
    const-string v0, "resetMusicEffect:"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/r5r;->n1(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Ll/r5r;->a:Ll/c0m;

    .line 9
    .line 10
    invoke-interface {p1}, Ll/c0m;->a()Ll/uzl;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    sget-object v0, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;->MMLiveAudioEffectPresetOff:Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/immomo/momomediaext/MomoMediaConstants$MMLiveAudioEffectPreset;->getValue()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-interface {p1, v0}, Ll/uzl;->h(I)I

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object p1, p0, Ll/r5r;->a:Ll/c0m;

    .line 24
    .line 25
    invoke-interface {p1}, Ll/c0m;->a()Ll/uzl;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 30
    .line 31
    invoke-interface {p1, v0}, Ll/uzl;->H(Ljava/lang/Boolean;)I

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/r5r;->a:Ll/c0m;

    .line 35
    .line 36
    invoke-interface {p0}, Ll/c0m;->a()Ll/uzl;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const/4 p1, 0x1

    .line 41
    invoke-interface {p0, p1}, Ll/uzl;->Q0(I)I

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public r0(I)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/eas;->r0(I)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "onSurroundMusicError:"

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/r5r;->n1(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/r5r;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 22
    .line 23
    new-instance v1, Ll/m5r;

    .line 24
    .line 25
    invoke-direct {v1, p1}, Ll/m5r;-><init>(I)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 29
    .line 30
    .line 31
    const/4 p1, 0x5

    .line 32
    invoke-virtual {p0, p1}, Ll/r5r;->setStatus(I)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final r1()V
    .locals 2

    .line 1
    const-wide/16 v0, -0x1

    .line 2
    .line 3
    iput-wide v0, p0, Ll/r5r;->j:J

    .line 4
    .line 5
    iput-wide v0, p0, Ll/r5r;->k:J

    .line 6
    .line 7
    return-void
.end method

.method public resume()V
    .locals 1

    .line 1
    const-string v0, "resume"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/r5r;->n1(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x3

    .line 7
    invoke-virtual {p0, v0}, Ll/r5r;->setStatus(I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/r5r;->a:Ll/c0m;

    .line 11
    .line 12
    invoke-interface {v0}, Ll/c0m;->a()Ll/uzl;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Ll/uzl;->q()V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/r5r;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 20
    .line 21
    new-instance v0, Ll/h5r;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/h5r;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final s1()V
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-virtual {p0, v0}, Ll/r5r;->setStatus(I)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Ll/r5r;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 6
    .line 7
    new-instance v0, Ll/k5r;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/k5r;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setStatus(I)V
    .locals 2

    .line 1
    iput p1, p0, Ll/r5r;->d:I

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "set status:"

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Ll/r5r;->n1(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final t1(Ljava/lang/String;JJ)J
    .locals 3

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    sget-object v1, Ll/qd80;->a:Ljava/lang/String;

    .line 7
    .line 8
    sget-object v2, Ll/qd80;->b:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    sget-object v1, Ll/qd80;->d:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 16
    .line 17
    .line 18
    sget-object p1, Ll/qd80;->e:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 21
    .line 22
    .line 23
    sget-object p1, Ll/qd80;->c:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, p1, p4, p5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 26
    .line 27
    .line 28
    sget-object p1, Ll/qd80;->f:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {}, Ll/pzi0;->o()J

    .line 31
    .line 32
    .line 33
    move-result-wide p2

    .line 34
    invoke-virtual {v0, p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catch_0
    move-exception p1

    .line 39
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 40
    .line 41
    .line 42
    :goto_0
    iget-object p0, p0, Ll/r5r;->a:Ll/c0m;

    .line 43
    .line 44
    invoke-interface {p0}, Ll/c0m;->a()Ll/uzl;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-interface {p0, p1}, Ll/uzl;->D([B)V

    .line 57
    .line 58
    .line 59
    return-wide p4
.end method

.method public w()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/r5r;->e:Ll/uzl;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/uzl;->r()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method
