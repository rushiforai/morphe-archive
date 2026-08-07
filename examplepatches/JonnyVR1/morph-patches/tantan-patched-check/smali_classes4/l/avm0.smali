.class public Ll/avm0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/api/c;->w3(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method

.method public static synthetic e(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static f(ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    :try_start_0
    new-instance p1, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "status"

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    const-string p0, "rejected"

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catch_0
    move-exception p0

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    const-string p0, "accepted"

    .line 16
    .line 17
    :goto_0
    invoke-virtual {p1, v0, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    goto :goto_2

    .line 25
    :goto_1
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    const-string p0, ""

    .line 29
    .line 30
    :goto_2
    iput-object p0, p2, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 31
    .line 32
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->R0:Ll/rnb;

    .line 35
    .line 36
    invoke-virtual {p0, p2}, Ll/rnb;->q3(Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static g(Lcom/p1/mobile/putong/data/PushMessageCustom;Ljava/lang/String;Ljava/lang/String;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v2, v1, Lcom/p1/mobile/putong/core/api/c;->R0:Ll/rnb;

    .line 6
    .line 7
    iget-object v3, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->id:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v4, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->caller:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v5, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callee:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v6, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerToken:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v7, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeToken:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v8, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelName:Ljava/lang/String;

    .line 18
    .line 19
    iget-object v12, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerDeviceId:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object v13, v1, Lcom/p1/mobile/putong/data/Device;->identifier:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v15, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcProvider:Ljava/lang/String;

    .line 28
    .line 29
    const/16 v16, 0x0

    .line 30
    .line 31
    const-wide/16 v9, -0x1

    .line 32
    .line 33
    move-object/from16 v11, p1

    .line 34
    .line 35
    move-object/from16 v14, p2

    .line 36
    .line 37
    invoke-virtual/range {v2 .. v16}, Ll/rnb;->p3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/yum0;

    .line 42
    .line 43
    invoke-direct {v1}, Ll/yum0;-><init>()V

    .line 44
    .line 45
    .line 46
    new-instance v2, Ll/zum0;

    .line 47
    .line 48
    invoke-direct {v2}, Ll/zum0;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public static h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->R0:Ll/rnb;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1, p2}, Ll/rnb;->m3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance p1, Ll/xum0;

    .line 10
    .line 11
    invoke-direct {p1}, Ll/xum0;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public static i(Ll/azm0;Ljava/lang/String;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v2, v1, Lcom/p1/mobile/putong/core/api/c;->R0:Ll/rnb;

    .line 6
    .line 7
    iget-object v3, v0, Ll/azm0;->e:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v4, v0, Ll/azm0;->a:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v5, v0, Ll/azm0;->b:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v6, v0, Ll/azm0;->g:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v7, v0, Ll/azm0;->f:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v8, v0, Ll/azm0;->h:Ljava/lang/String;

    .line 18
    .line 19
    iget-wide v9, v0, Ll/azm0;->q:J

    .line 20
    .line 21
    iget-object v12, v0, Ll/azm0;->d:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v13, v0, Ll/azm0;->c:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v14, v0, Ll/azm0;->m:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v15, v0, Ll/azm0;->j:Ljava/lang/String;

    .line 28
    .line 29
    iget v0, v0, Ll/azm0;->t:I

    .line 30
    .line 31
    move-object/from16 v11, p1

    .line 32
    .line 33
    move/from16 v16, v0

    .line 34
    .line 35
    invoke-virtual/range {v2 .. v16}, Ll/rnb;->p3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/vum0;

    .line 40
    .line 41
    invoke-direct {v1}, Ll/vum0;-><init>()V

    .line 42
    .line 43
    .line 44
    new-instance v2, Ll/wum0;

    .line 45
    .line 46
    invoke-direct {v2}, Ll/wum0;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    return-void
.end method
