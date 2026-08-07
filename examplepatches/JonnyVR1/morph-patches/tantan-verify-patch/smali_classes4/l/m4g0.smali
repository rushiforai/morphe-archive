.class public Ll/m4g0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/m4g0$e;
    }
.end annotation


# instance fields
.field public volatile a:Z

.field public b:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

.field public c:Ll/k4g0;

.field public d:Ll/l4g0$b;

.field public e:Ljava/util/concurrent/atomic/AtomicLong;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/m4g0;->a:Z

    .line 6
    .line 7
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/m4g0;->e:Ljava/util/concurrent/atomic/AtomicLong;

    .line 13
    .line 14
    return-void
.end method

.method public synthetic constructor <init>(Ll/m4g0$a;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Ll/m4g0;-><init>()V

    return-void
.end method

.method public static f()Ll/m4g0;
    .locals 1

    .line 1
    invoke-static {}, Ll/m4g0$e;->a()Ll/m4g0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public final a(Ll/q4f;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->APPCRASH:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 2
    .line 3
    iget-object v1, p1, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/ve60;->d()Ll/ue60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/ue60;->c()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p1, Ll/q4f;->n:Ljava/lang/String;

    .line 22
    .line 23
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    iput-wide v0, p1, Ll/q4f;->f:J

    .line 28
    .line 29
    invoke-static {}, Ll/wse0;->b()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p1, Ll/q4f;->v:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {}, Ll/wse0;->f()J

    .line 36
    .line 37
    .line 38
    move-result-wide v0

    .line 39
    iput-wide v0, p1, Ll/q4f;->j:J

    .line 40
    .line 41
    iget-object v0, p0, Ll/m4g0;->e:Ljava/util/concurrent/atomic/AtomicLong;

    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->getAndIncrement()J

    .line 44
    .line 45
    .line 46
    move-result-wide v0

    .line 47
    iput-wide v0, p1, Ll/q4f;->k:J

    .line 48
    .line 49
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iput-object v0, p1, Ll/q4f;->m:Ljava/lang/String;

    .line 58
    .line 59
    sget-boolean v0, Ll/sw0;->b:Z

    .line 60
    .line 61
    if-eqz v0, :cond_1

    .line 62
    .line 63
    const/4 v0, 0x2

    .line 64
    goto :goto_0

    .line 65
    :cond_1
    const/4 v0, 0x0

    .line 66
    :goto_0
    iput v0, p1, Ll/q4f;->l:I

    .line 67
    .line 68
    invoke-static {}, Ll/c350;->a()J

    .line 69
    .line 70
    .line 71
    move-result-wide v0

    .line 72
    iput-wide v0, p1, Ll/q4f;->g:J

    .line 73
    .line 74
    invoke-static {}, Ll/c350;->c()Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    iput-boolean v0, p1, Ll/q4f;->h:Z

    .line 79
    .line 80
    const/4 v0, 0x1

    .line 81
    iput v0, p1, Ll/q4f;->a:I

    .line 82
    .line 83
    invoke-virtual {p0, p1}, Ll/m4g0;->b(Ll/q4f;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public final b(Ll/q4f;)V
    .locals 2

    .line 1
    sget-object p0, Ll/m4g0$d;->a:[I

    .line 2
    .line 3
    iget-object v0, p1, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    aget p0, p0, v0

    .line 10
    .line 11
    packed-switch p0, :pswitch_data_0

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :pswitch_0
    invoke-static {}, Ll/ve60;->d()Ll/ue60;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    iget-object v0, p1, Ll/q4f;->n:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/ue60;->c()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    iput-object p0, p1, Ll/q4f;->n:Ljava/lang/String;

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    iput-boolean p0, p1, Ll/q4f;->c:Z

    .line 37
    .line 38
    :cond_0
    iget-object p0, p1, Ll/q4f;->n:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {p0}, Ll/ve60;->c(Ljava/lang/String;)Ll/ue60;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    if-eqz p0, :cond_2

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/ue60;->a()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p1, Ll/q4f;->p:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/ue60;->f()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iput-object v0, p1, Ll/q4f;->q:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {p0}, Ll/ue60;->d()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iput-object v0, p1, Ll/q4f;->o:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/ue60;->e()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iput-object v0, p1, Ll/q4f;->r:Ljava/lang/String;

    .line 69
    .line 70
    :try_start_0
    invoke-virtual {p0}, Ll/ue60;->b()Lorg/json/JSONObject;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    if-eqz v0, :cond_2

    .line 75
    .line 76
    sget-object v0, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->SYS_CHECK:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 77
    .line 78
    iget-object v1, p1, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-nez v0, :cond_2

    .line 85
    .line 86
    iget-object v0, p1, Ll/q4f;->w:Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    .line 88
    const-string v1, "pageExtras"

    .line 89
    .line 90
    if-nez v0, :cond_1

    .line 91
    .line 92
    :try_start_1
    new-instance v0, Lorg/json/JSONObject;

    .line 93
    .line 94
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0}, Ll/ue60;->b()Lorg/json/JSONObject;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 102
    .line 103
    .line 104
    iput-object v0, p1, Ll/q4f;->w:Lorg/json/JSONObject;

    .line 105
    .line 106
    return-void

    .line 107
    :cond_1
    invoke-virtual {p0}, Ll/ue60;->b()Lorg/json/JSONObject;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :catch_0
    move-exception p0

    .line 116
    invoke-static {p0}, Ll/wu80;->b(Ljava/lang/Exception;)V

    .line 117
    .line 118
    .line 119
    :cond_2
    :goto_0
    return-void

    .line 120
    nop

    .line 121
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public c()V
    .locals 2

    .line 1
    invoke-static {}, Ll/r660;->e()Ll/r660;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/m4g0$b;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/m4g0$b;-><init>(Ll/m4g0;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/r660;->c(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/tsd0;->e()Ll/tsd0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/m4g0$c;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/m4g0$c;-><init>(Ll/m4g0;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ll/tsd0;->c(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public d()Lcom/tantanapp/foxstatistics/DefaultEnvironment;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m4g0;->b:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/util/concurrent/atomic/AtomicLong;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m4g0;->e:Ljava/util/concurrent/atomic/AtomicLong;

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Landroid/content/Context;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/m4g0;->a:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Ll/m4g0;->e:Ljava/util/concurrent/atomic/AtomicLong;

    .line 9
    .line 10
    invoke-static {}, Ll/n4f0;->a()J

    .line 11
    .line 12
    .line 13
    move-result-wide v1

    .line 14
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/r660;->e()Ll/r660;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ll/r660;->g(Landroid/os/Message;)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ll/tsd0;->e()Ll/tsd0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Ll/tsd0;->g(Landroid/os/Message;)V

    .line 37
    .line 38
    .line 39
    invoke-static {p1}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->c(Landroid/content/Context;)Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iput-object v0, p0, Ll/m4g0;->b:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 44
    .line 45
    const/4 v0, 0x1

    .line 46
    iput-boolean v0, p0, Ll/m4g0;->a:Z

    .line 47
    .line 48
    invoke-static {}, Ll/sw0;->c()Ll/sw0;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/m4g0$a;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Ll/m4g0$a;-><init>(Ll/m4g0;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ll/sw0;->b(Ll/sw0$c;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, p1}, Ll/m4g0;->i(Landroid/content/Context;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    :goto_0
    return-void
.end method

.method public final h(Ll/q4f;)Z
    .locals 1

    .line 1
    sget-object p0, Ll/m4g0$d;->a:[I

    .line 2
    .line 3
    iget-object v0, p1, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    aget p0, p0, v0

    .line 10
    .line 11
    packed-switch p0, :pswitch_data_0

    .line 12
    .line 13
    .line 14
    :pswitch_0
    invoke-virtual {p1}, Ll/q4f;->a()Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0

    .line 27
    :goto_0
    :pswitch_1
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :pswitch_data_0
    .packed-switch 0x5
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public final i(Landroid/content/Context;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance p0, Landroid/content/IntentFilter;

    .line 5
    .line 6
    invoke-direct {p0}, Landroid/content/IntentFilter;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v0, "android.net.conn.CONNECTIVITY_CHANGE"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Lcom/tantanapp/foxstatistics/utils/NetWorkConnectionChangedReceiver;

    .line 15
    .line 16
    invoke-direct {v0}, Lcom/tantanapp/foxstatistics/utils/NetWorkConnectionChangedReceiver;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {p1, v0, p0}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public j(Ll/q4f;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_4

    .line 2
    .line 3
    invoke-static {}, Ll/i4g0;->e()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0, p1}, Ll/m4g0;->a(Ll/q4f;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/m4g0;->c:Ll/k4g0;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-interface {v0, p1}, Ll/k4g0;->a(Ll/q4f;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    invoke-virtual {p0, p1}, Ll/m4g0;->h(Ll/q4f;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ll/m4g0;->k(Ll/q4f;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_2
    sget-object v0, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->SYS_CHECK:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 31
    .line 32
    iget-object v1, p1, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Ll/m4g0;->o(Ll/q4f;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_3
    invoke-virtual {p0, p1}, Ll/m4g0;->n(Ll/q4f;)V

    .line 45
    .line 46
    .line 47
    :cond_4
    :goto_0
    return-void
.end method

.method public final k(Ll/q4f;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/r1d0;->f(Ll/q4f;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l(Lcom/tantanapp/foxstatistics/entity/EventNameEnum;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    new-instance v0, Ll/q4f;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/q4f;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 7
    .line 8
    iput-object p2, v0, Ll/q4f;->s:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p3, v0, Ll/q4f;->n:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p4, v0, Ll/q4f;->w:Lorg/json/JSONObject;

    .line 13
    .line 14
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ll/q4f;->b(Ljava/lang/Boolean;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/m4g0;->j(Ll/q4f;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public m(Lcom/tantanapp/foxstatistics/entity/EventNameEnum;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    new-instance v0, Ll/q4f;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/q4f;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 7
    .line 8
    iput-object p2, v0, Ll/q4f;->s:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p3, v0, Ll/q4f;->n:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p4, v0, Ll/q4f;->w:Lorg/json/JSONObject;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/m4g0;->j(Ll/q4f;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final n(Ll/q4f;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/r1d0;->g(Ll/q4f;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final o(Ll/q4f;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/r1d0;->h(Ll/q4f;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public p(Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ll/q4f;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/q4f;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->SYS_CHECK:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 7
    .line 8
    iput-object v1, v0, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 9
    .line 10
    const-string v1, "e_foxstatistics_exception"

    .line 11
    .line 12
    iput-object v1, v0, Ll/q4f;->s:Ljava/lang/String;

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
    const-string v2, "ex"

    .line 20
    .line 21
    invoke-static {p1}, Ll/i6f;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 26
    .line 27
    .line 28
    iput-object v1, v0, Ll/q4f;->w:Lorg/json/JSONObject;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/m4g0;->j(Ll/q4f;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :catch_0
    move-exception p0

    .line 35
    invoke-static {p0}, Ll/wu80;->b(Ljava/lang/Exception;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public q(Ll/l4g0$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m4g0;->d:Ll/l4g0$b;

    .line 2
    .line 3
    return-void
.end method

.method public r(Ll/k4g0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m4g0;->c:Ll/k4g0;

    .line 2
    .line 3
    return-void
.end method

.method public s(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m4g0;->b:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->f(Ljava/lang/String;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public t(Ll/ek2;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m4g0;->b:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->h(Ll/ek2;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
