.class public Ll/q5k0;
.super Ll/t4k0;
.source "SourceFile"


# static fields
.field public static b:Ll/q5k0;


# instance fields
.field public a:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/t4k0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic A(Ll/q5k0;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/q5k0;->q0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic B(Ll/q5k0;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q5k0;->p0(Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method

.method public static synthetic C(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/util/List;)V
    .locals 2

    .line 1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 13
    .line 14
    sget-object v0, Ll/tbs;->f:Ll/j6t;

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v1, p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->E(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const/4 p2, 0x1

    .line 31
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->Q(Z)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {v0, p0, p1}, Ll/j6t;->f(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public static synthetic D(Ll/q5k0;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/q5k0;->h0(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public static H(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 10

    .line 1
    const-string v0, "manager-recall-invite-card"

    .line 2
    .line 3
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "audio_card_type"

    .line 8
    .line 9
    const-string v2, "p_chat_view"

    .line 10
    .line 11
    const-string v3, "e_live_audio_room_enter"

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const-string p0, "user_invite_room_admin"

    .line 16
    .line 17
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    filled-new-array {p0}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {v3, v2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    const-string v0, "live-chat-tab-report"

    .line 30
    .line 31
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    const-string v0, "anchorId"

    .line 38
    .line 39
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    const-string p0, "liveId"

    .line 44
    .line 45
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    const-string p0, "audio_tab_id"

    .line 50
    .line 51
    const-string p1, "NA"

    .line 52
    .line 53
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v6

    .line 57
    const-string p0, "profile_user_id"

    .line 58
    .line 59
    invoke-static {p0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object v7

    .line 63
    const-string p0, "audio_room_type"

    .line 64
    .line 65
    const-string p1, "normal_audio"

    .line 66
    .line 67
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object v8

    .line 71
    invoke-static {v1, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object v9

    .line 75
    filled-new-array/range {v4 .. v9}, [Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-static {v3, v2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 80
    .line 81
    .line 82
    :cond_1
    return-void
.end method

.method public static I()Ll/t4k0;
    .locals 2

    .line 1
    sget-object v0, Ll/q5k0;->b:Ll/q5k0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/q5k0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/q5k0;->b:Ll/q5k0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/q5k0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/q5k0;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/q5k0;->b:Ll/q5k0;

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
    sget-object v0, Ll/q5k0;->b:Ll/q5k0;

    .line 27
    .line 28
    return-object v0
.end method

.method public static O(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    :try_start_0
    new-instance v0, Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {p0, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-direct {v0, p0}, Ljava/lang/String;-><init>([B)V

    .line 9
    .line 10
    .line 11
    const-string p0, "UTF-8"

    .line 12
    .line 13
    invoke-static {v0, p0}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    goto :goto_0

    .line 18
    :catch_0
    move-exception p0

    .line 19
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    const-string p0, ""

    .line 23
    .line 24
    :goto_0
    return-object p0
.end method

.method public static synthetic i(Lcom/p1/mobile/android/app/Act$r;)V
    .locals 0

    .line 1
    const-string p0, "\u6b63\u5728\u9ea6\u4e0a\uff0c\u65e0\u6cd5\u8fdb\u5165\u5176\u4ed6\u7fa4\u804a"

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic j(Ll/q5k0;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p11}, Ll/q5k0;->l0(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic k(Ll/q5k0;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q5k0;->i0(Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method

.method public static synthetic l(ZI)V
    .locals 1

    .line 1
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0, p1}, Ll/ppi0;->p(ZI)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, p1, p2, v0}, Ll/mbs;->k0(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic n(Ll/q5k0;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/q5k0;->k0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic o(Ll/q5k0;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLjava/lang/String;Ll/kfn0;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/q5k0;->n0(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLjava/lang/String;Ll/kfn0;)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/android/app/Act$r;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Ll/tbs;->f:Ll/j6t;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Landroid/app/Activity;

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Ll/j6t;->m(Landroid/app/Activity;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public static synthetic q(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "error:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v0, "[live]dynamic_schema"

    .line 20
    .line 21
    invoke-static {v0, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic r(Z)V
    .locals 1

    .line 1
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/ppi0;->r(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/android/app/Act$r;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Ll/tbs;->f:Ll/j6t;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Landroid/app/Activity;

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Ll/j6t;->m(Landroid/app/Activity;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public static synthetic t(Ll/q5k0;Ljava/lang/String;Ll/kfn0;)Ll/kfn0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/q5k0;->m0(Ljava/lang/String;Ll/kfn0;)Ll/kfn0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic u(Lcom/p1/mobile/android/app/Act$r;)V
    .locals 0

    .line 1
    const-string p0, "\u5df2\u5728\u81ea\u5df1\u7684\u7fa4\u804a\u4e2d"

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/live/base/data/BLiveSchema;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/mbs;->e()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Landroid/app/Activity;

    .line 31
    .line 32
    :goto_0
    if-nez v0, :cond_2

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSchema;->schema:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-nez v1, :cond_3

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSchema;->schema:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-static {v0, v1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSchema;->tip:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_3

    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSchema;->tip:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_3
    :goto_1
    return-void
.end method

.method public static synthetic w(Ll/q5k0;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/q5k0;->j0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    return-void
.end method

.method public static synthetic x(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/iqn0;->e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveVerificationApi;->requestLiveVerification()V

    .line 2
    .line 3
    .line 4
    instance-of v0, p0, Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static synthetic z(Ll/q5k0;Lcom/p1/mobile/android/app/Act;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/q5k0;->o0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Boolean;)V

    return-void
.end method


# virtual methods
.method public A0(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 11

    .line 1
    const-string v9, ""

    .line 2
    .line 3
    const-string v10, ""

    .line 4
    .line 5
    const/4 v6, 0x0

    .line 6
    move-object v0, p0

    .line 7
    move-object v1, p1

    .line 8
    move-object v2, p2

    .line 9
    move-object v3, p3

    .line 10
    move-object v4, p4

    .line 11
    move-object/from16 v5, p5

    .line 12
    .line 13
    move-object/from16 v7, p6

    .line 14
    .line 15
    move-object/from16 v8, p7

    .line 16
    .line 17
    invoke-virtual/range {v0 .. v10}, Ll/q5k0;->B0(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public B0(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 14

    .line 1
    invoke-static/range {p4 .. p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "default"

    .line 8
    .line 9
    move-object v8, v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move-object/from16 v8, p4

    .line 12
    .line 13
    :goto_0
    new-instance v1, Ll/c5k0;

    .line 14
    .line 15
    move-object v2, p0

    .line 16
    move-object v3, p1

    .line 17
    move-object/from16 v6, p2

    .line 18
    .line 19
    move-object/from16 v4, p3

    .line 20
    .line 21
    move-object/from16 v5, p4

    .line 22
    .line 23
    move-object/from16 v13, p5

    .line 24
    .line 25
    move-object/from16 v11, p6

    .line 26
    .line 27
    move-object/from16 v7, p7

    .line 28
    .line 29
    move-object/from16 v12, p8

    .line 30
    .line 31
    move-object/from16 v9, p9

    .line 32
    .line 33
    move-object/from16 v10, p10

    .line 34
    .line 35
    invoke-direct/range {v1 .. v13}, Ll/c5k0;-><init>(Ll/q5k0;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public C0(Lcom/p1/mobile/android/app/Act;ZLl/abe0;)V
    .locals 8

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p3}, Ll/abe0;->f()Ljava/util/Map;

    .line 5
    .line 6
    .line 7
    move-result-object p3

    .line 8
    const-string v0, "liveSchema"

    .line 9
    .line 10
    invoke-static {p3, v0}, Ll/o5e0;->b(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Ll/q5k0;->O(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v7

    .line 18
    const-string v0, "source"

    .line 19
    .line 20
    invoke-static {p3, v0}, Ll/o5e0;->b(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v5

    .line 24
    const-string v0, "action"

    .line 25
    .line 26
    invoke-static {p3, v0}, Ll/o5e0;->b(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "gender"

    .line 31
    .line 32
    invoke-static {p3, v1}, Ll/o5e0;->b(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const-string v2, "anchor"

    .line 37
    .line 38
    invoke-static {p3, v2}, Ll/o5e0;->b(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result p3

    .line 46
    if-nez p3, :cond_1

    .line 47
    .line 48
    move-object p3, v3

    .line 49
    goto :goto_0

    .line 50
    :cond_1
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result p3

    .line 54
    if-eqz p3, :cond_2

    .line 55
    .line 56
    const-string p3, "voice-chat-admin"

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_2
    move-object p3, v5

    .line 60
    :goto_0
    invoke-static {p3, v0}, Lcom/p1/mobile/putong/live/external/internal/api/LiveVoiceApi;->getVoiceDataByChatAssistant(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p3

    .line 64
    invoke-virtual {p1, p3}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object p3

    .line 68
    new-instance v0, Ll/w4k0;

    .line 69
    .line 70
    invoke-direct {v0, p0, v1}, Ll/w4k0;-><init>(Ll/q5k0;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p3, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object p3

    .line 77
    new-instance v1, Ll/x4k0;

    .line 78
    .line 79
    move-object v2, p0

    .line 80
    move-object v4, p1

    .line 81
    move v6, p2

    .line 82
    invoke-direct/range {v1 .. v7}, Ll/x4k0;-><init>(Ll/q5k0;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLjava/lang/String;)V

    .line 83
    .line 84
    .line 85
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {p3, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public final D0(Lcom/p1/mobile/android/app/Act;Ll/abe0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p3}, Ll/h3g0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final E(Lcom/p1/mobile/putong/data/SchemeKey;Ll/abe0;)Z
    .locals 1

    .line 1
    invoke-virtual {p2}, Ll/abe0;->g()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p2, "/"

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    invoke-virtual {p0, p2, v0}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string p2, "live"

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    const-string p1, "room"

    .line 26
    .line 27
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-nez p1, :cond_0

    .line 32
    .line 33
    const-string p1, "room/jumpRoom"

    .line 34
    .line 35
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-nez p1, :cond_0

    .line 40
    .line 41
    const-string p1, "openLiveRoom"

    .line 42
    .line 43
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_1

    .line 48
    .line 49
    :cond_0
    const/4 p0, 0x1

    .line 50
    return p0

    .line 51
    :cond_1
    const/4 p0, 0x0

    .line 52
    return p0
.end method

.method public final E0(Lcom/p1/mobile/android/app/Act;Ll/abe0;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Ll/abe0;->c()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "tantanapp://"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2}, Ll/abe0;->d()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2}, Ll/abe0;->g()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    const-string v0, "voiceRoom"

    .line 31
    .line 32
    invoke-virtual {p0, p2, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {p1, p0}, Ll/fss;->n(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public F(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/mbs;->e()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-static {p1}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->getLiveSchema(Ljava/lang/String;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance p1, Ll/n5k0;

    .line 17
    .line 18
    invoke-direct {p1}, Ll/n5k0;-><init>()V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ll/o5k0;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/o5k0;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-static {p1, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public F0(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    new-instance p0, Ll/z4k0;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/z4k0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final G(Lcom/p1/mobile/android/app/Act;Ll/abe0;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p0, "roomId"

    .line 4
    .line 5
    invoke-static {p2, p0}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "source"

    .line 10
    .line 11
    invoke-static {p2, v0}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/api/VirtualVoiceRoomApiProvider;->getNewestLiveByRoomId(Ljava/lang/String;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    new-instance v0, Ll/a5k0;

    .line 24
    .line 25
    invoke-direct {v0, p1, p2}, Ll/a5k0;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    new-instance p1, Ll/wnt;

    .line 29
    .line 30
    invoke-direct {p1}, Ll/wnt;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {v0, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public G0(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    new-instance v0, Ll/m5k0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/m5k0;-><init>(Ll/q5k0;Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public H0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/l5k0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/l5k0;-><init>(Ll/q5k0;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public I0(Z)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->updateCanUserStartLive(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public J(Landroid/content/Context;)Landroid/content/Intent;
    .locals 1

    .line 1
    const-string p0, "privacy_setting"

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, p0, v0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveIndependentSettingAct;->Z1(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public J0()V
    .locals 4

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    sget-object p0, Ll/itd0;->b:Ll/itd0;

    .line 9
    .line 10
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Ll/fk3;

    .line 15
    .line 16
    const-string v0, "live_schema"

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/fk3;->I(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 23
    .line 24
    .line 25
    move-result-wide v0

    .line 26
    iget-wide v2, p0, Ll/q5k0;->a:J

    .line 27
    .line 28
    sub-long/2addr v0, v2

    .line 29
    const-wide/16 v2, 0x1388

    .line 30
    .line 31
    cmp-long v0, v0, v2

    .line 32
    .line 33
    if-lez v0, :cond_1

    .line 34
    .line 35
    invoke-static {}, Ll/pzi0;->o()J

    .line 36
    .line 37
    .line 38
    move-result-wide v0

    .line 39
    iput-wide v0, p0, Ll/q5k0;->a:J

    .line 40
    .line 41
    sget-object p0, Ll/t4u;->e:Lrx/subjects/b;

    .line 42
    .line 43
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void
.end method

.method public final K()Lcom/p1/mobile/android/app/Act;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->globalLifeCycle_()Ljava/util/HashMap;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/util/HashMap;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->globalLifeCycle_()Ljava/util/HashMap;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->globalLifeCycle_()Ljava/util/HashMap;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Ljava/util/List;

    .line 42
    .line 43
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_0

    .line 48
    .line 49
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/lit8 v0, v0, -0x1

    .line 54
    .line 55
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    check-cast p0, Lcom/p1/mobile/android/app/Act$r;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    check-cast p0, Landroid/app/Activity;

    .line 68
    .line 69
    sget-object v0, Ll/tbs;->f:Ll/j6t;

    .line 70
    .line 71
    invoke-virtual {v0, p0}, Ll/j6t;->m(Landroid/app/Activity;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_0

    .line 76
    .line 77
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 78
    .line 79
    return-object p0

    .line 80
    :cond_0
    const/4 p0, 0x0

    .line 81
    return-object p0
.end method

.method public K0()V
    .locals 0

    .line 1
    sget-object p0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Lh()Ll/qam;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ll/qam;->h()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public L(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    :try_start_0
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    new-instance p2, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveSettingArgs;

    .line 12
    .line 13
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveSettingArgs;-><init>(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catch_0
    move-exception p0

    .line 18
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    const/4 p2, 0x0

    .line 22
    :goto_0
    invoke-static {}, Ll/mbs;->G()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-interface {p0, p1, p2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Gr(Landroid/content/Context;Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveSettingArgs;)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public L0()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/internal/api/LiveVoiceApi;->notifyRefreshVoiceActivitiesNum()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public M(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;->d(Ljava/lang/String;)Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0, p3}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;->i(Ljava/lang/String;)Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;

    .line 11
    .line 12
    .line 13
    move-result-object p3

    .line 14
    invoke-virtual {p3, p4}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;->b(Ljava/lang/String;)Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    invoke-virtual {p3, p5}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;->f(Ljava/lang/String;)Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;

    .line 19
    .line 20
    .line 21
    move-result-object p3

    .line 22
    invoke-virtual {p3, p6}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;->e(Ljava/lang/String;)Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    invoke-virtual {p3, p7}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;->g(Ljava/lang/String;)Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;

    .line 27
    .line 28
    .line 29
    move-result-object p3

    .line 30
    invoke-virtual {p3}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;->a()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    invoke-static {p3}, Ll/v5k0;->d(Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;)V

    .line 35
    .line 36
    .line 37
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    if-eqz p2, :cond_0

    .line 42
    .line 43
    new-instance p2, Ljava/lang/Exception;

    .line 44
    .line 45
    const-string p3, "SchemeDoLive live id is null"

    .line 46
    .line 47
    invoke-direct {p2, p3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-static {p2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, p1}, Ll/q5k0;->P(Landroid/content/Context;)Landroid/content/Intent;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0

    .line 58
    :cond_0
    invoke-static {p1, p3}, Ll/mbs;->o(Landroid/content/Context;Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;)Landroid/content/Intent;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method

.method public M0(ZI)V
    .locals 0

    .line 1
    new-instance p0, Ll/k5k0;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Ll/k5k0;-><init>(ZI)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public N(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;
    .locals 0

    .line 1
    sget-object p0, Ll/tbs;->f:Ll/j6t;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 4
    .line 5
    .line 6
    move-result-object p6

    .line 7
    invoke-virtual {p6, p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->E(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p2, p4}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->y(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p2, p5}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->J(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-virtual {p2, p7}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->K(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p2, p8}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->Q(Z)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-virtual {p0, p1, p2}, Ll/j6t;->f(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public P(Landroid/content/Context;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/mbs;->p(Landroid/content/Context;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Q(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 1

    .line 1
    const-string v0, "vipCooperation"

    .line 2
    .line 3
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p3, 0x0

    .line 10
    invoke-static {p2, p3}, Ll/r4u;->f(Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-string v0, "from_push"

    .line 16
    .line 17
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p3

    .line 21
    if-eqz p3, :cond_1

    .line 22
    .line 23
    invoke-static {p2, p4}, Ll/r4u;->e(Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    goto :goto_0

    .line 28
    :cond_1
    invoke-static {p2, p4}, Ll/r4u;->e(Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    :goto_0
    const-string p3, "action"

    .line 33
    .line 34
    invoke-virtual {p2, p3, p5}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    const-string p3, "userId"

    .line 38
    .line 39
    invoke-virtual {p2, p3, p6}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    const-string p3, "[live][square]"

    .line 43
    .line 44
    const-string p4, "Invoked from SchemeDoLiveSquare#getSchemeIntent"

    .line 45
    .line 46
    invoke-static {p3, p4}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, p1, p2}, Ll/q5k0;->c(Landroid/content/Context;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0
.end method

.method public final R(Ll/abe0;)Landroid/content/Intent;
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "source"

    .line 6
    .line 7
    invoke-static {p0, v0}, Ll/o5e0;->b(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const-string p0, "default"

    .line 18
    .line 19
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "voice-live"

    .line 24
    .line 25
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->type:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v0, p0}, Ll/r4u;->g(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/lang/String;)Landroid/os/Bundle;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string v0, "live_push_voice"

    .line 32
    .line 33
    const-string v1, "live.schema.push.all"

    .line 34
    .line 35
    invoke-virtual {p0, v0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    const-string v0, "voice-push-big-anchor"

    .line 39
    .line 40
    const/4 v1, 0x1

    .line 41
    invoke-virtual {p0, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 42
    .line 43
    .line 44
    const-string v0, "voice-suggest-scheme"

    .line 45
    .line 46
    invoke-virtual {p1}, Ll/abe0;->c()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {p0, v0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-static {p1, p0}, Ll/bjo0;->c(Landroid/content/Context;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    return-object p0
.end method

.method public S(Landroid/content/Context;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance p0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v0, Lcom/p1/mobile/putong/live/external/page/rights/list/LiveUserRightListAct;

    .line 4
    .line 5
    invoke-direct {p0, p1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    new-instance p1, Landroid/os/Bundle;

    .line 9
    .line 10
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 11
    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->USER_MEDAL_MANAGE:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "right_type"

    .line 20
    .line 21
    invoke-virtual {p1, v1, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    return-object p0
.end method

.method public T(Landroid/content/Context;)Landroid/content/Intent;
    .locals 0

    .line 1
    new-instance p0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, p0}, Ll/bjo0;->c(Landroid/content/Context;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public U(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p3, "default"

    .line 8
    .line 9
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string p6, "voice-live"

    .line 14
    .line 15
    iput-object p6, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->type:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 20
    .line 21
    .line 22
    move-result-object p6

    .line 23
    iput-object p6, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 24
    .line 25
    const-string p6, "virtualAvatar"

    .line 26
    .line 27
    invoke-static {p5, p6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p5

    .line 31
    if-eqz p5, :cond_2

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const/4 p5, 0x1

    .line 38
    invoke-virtual {p0, p5}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->Q(Z)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->E(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    if-eqz p2, :cond_1

    .line 55
    .line 56
    const-string p4, ""

    .line 57
    .line 58
    :cond_1
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->z(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    sget-object p2, Ll/tbs;->f:Ll/j6t;

    .line 67
    .line 68
    invoke-virtual {p2, p1, p0}, Ll/j6t;->f(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0

    .line 73
    :cond_2
    invoke-static {p0, p3}, Ll/r4u;->g(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/lang/String;)Landroid/os/Bundle;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 78
    .line 79
    .line 80
    move-result p2

    .line 81
    if-nez p2, :cond_3

    .line 82
    .line 83
    const-string p2, "live_push_voice_focus_user_id"

    .line 84
    .line 85
    invoke-virtual {p0, p2, p4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    const-string p2, "live_push_voice"

    .line 89
    .line 90
    const-string p3, "live.schema.push.all"

    .line 91
    .line 92
    invoke-virtual {p0, p2, p3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    :cond_3
    invoke-static {p1, p0}, Ll/bjo0;->c(Landroid/content/Context;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    return-object p0
.end method

.method public final V(Lcom/p1/mobile/android/app/Act;Ll/abe0;Ll/z20;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/abe0;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ll/abe0;->g()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    const-string v0, "/"

    .line 6
    .line 7
    const-string v1, ""

    .line 8
    .line 9
    invoke-virtual {p3, v0, v1}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p2}, Ll/abe0;->d()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p3

    .line 24
    :goto_0
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p3}, Ljava/lang/String;->hashCode()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    const/4 v1, 0x0

    .line 32
    const/4 v2, 0x1

    .line 33
    const/4 v3, -0x1

    .line 34
    sparse-switch v0, :sswitch_data_0

    .line 35
    .line 36
    .line 37
    goto/16 :goto_1

    .line 38
    .line 39
    :sswitch_0
    const-string v0, "onTeenModeEnable"

    .line 40
    .line 41
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p3

    .line 45
    if-nez p3, :cond_1

    .line 46
    .line 47
    goto/16 :goto_1

    .line 48
    .line 49
    :cond_1
    const/16 v3, 0x1c

    .line 50
    .line 51
    goto/16 :goto_1

    .line 52
    .line 53
    :sswitch_1
    const-string v0, "refreshGuildAuth"

    .line 54
    .line 55
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p3

    .line 59
    if-nez p3, :cond_2

    .line 60
    .line 61
    goto/16 :goto_1

    .line 62
    .line 63
    :cond_2
    const/16 v3, 0x1b

    .line 64
    .line 65
    goto/16 :goto_1

    .line 66
    .line 67
    :sswitch_2
    const-string v0, "updateVoiceActivitiesNum"

    .line 68
    .line 69
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p3

    .line 73
    if-nez p3, :cond_3

    .line 74
    .line 75
    goto/16 :goto_1

    .line 76
    .line 77
    :cond_3
    const/16 v3, 0x1a

    .line 78
    .line 79
    goto/16 :goto_1

    .line 80
    .line 81
    :sswitch_3
    const-string v0, "room/jumpRoom"

    .line 82
    .line 83
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result p3

    .line 87
    if-nez p3, :cond_4

    .line 88
    .line 89
    goto/16 :goto_1

    .line 90
    .line 91
    :cond_4
    const/16 v3, 0x19

    .line 92
    .line 93
    goto/16 :goto_1

    .line 94
    .line 95
    :sswitch_4
    const-string v0, "fanBaseGroupManage"

    .line 96
    .line 97
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p3

    .line 101
    if-nez p3, :cond_5

    .line 102
    .line 103
    goto/16 :goto_1

    .line 104
    .line 105
    :cond_5
    const/16 v3, 0x18

    .line 106
    .line 107
    goto/16 :goto_1

    .line 108
    .line 109
    :sswitch_5
    const-string v0, "liveRight"

    .line 110
    .line 111
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result p3

    .line 115
    if-nez p3, :cond_6

    .line 116
    .line 117
    goto/16 :goto_1

    .line 118
    .line 119
    :cond_6
    const/16 v3, 0x17

    .line 120
    .line 121
    goto/16 :goto_1

    .line 122
    .line 123
    :sswitch_6
    const-string v0, "liveCover"

    .line 124
    .line 125
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result p3

    .line 129
    if-nez p3, :cond_7

    .line 130
    .line 131
    goto/16 :goto_1

    .line 132
    .line 133
    :cond_7
    const/16 v3, 0x16

    .line 134
    .line 135
    goto/16 :goto_1

    .line 136
    .line 137
    :sswitch_7
    const-string v0, "audience/suggest"

    .line 138
    .line 139
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result p3

    .line 143
    if-nez p3, :cond_8

    .line 144
    .line 145
    goto/16 :goto_1

    .line 146
    .line 147
    :cond_8
    const/16 v3, 0x15

    .line 148
    .line 149
    goto/16 :goto_1

    .line 150
    .line 151
    :sswitch_8
    const-string v0, "liveSquare"

    .line 152
    .line 153
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    move-result p3

    .line 157
    if-nez p3, :cond_9

    .line 158
    .line 159
    goto/16 :goto_1

    .line 160
    .line 161
    :cond_9
    const/16 v3, 0x14

    .line 162
    .line 163
    goto/16 :goto_1

    .line 164
    .line 165
    :sswitch_9
    const-string v0, "liveSetting"

    .line 166
    .line 167
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result p3

    .line 171
    if-nez p3, :cond_a

    .line 172
    .line 173
    goto/16 :goto_1

    .line 174
    .line 175
    :cond_a
    const/16 v3, 0x13

    .line 176
    .line 177
    goto/16 :goto_1

    .line 178
    .line 179
    :sswitch_a
    const-string v0, "jumpToVoiceFrame"

    .line 180
    .line 181
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result p3

    .line 185
    if-nez p3, :cond_b

    .line 186
    .line 187
    goto/16 :goto_1

    .line 188
    .line 189
    :cond_b
    const/16 v3, 0x12

    .line 190
    .line 191
    goto/16 :goto_1

    .line 192
    .line 193
    :sswitch_b
    const-string v0, "jumpToStartLive"

    .line 194
    .line 195
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 196
    .line 197
    .line 198
    move-result p3

    .line 199
    if-nez p3, :cond_c

    .line 200
    .line 201
    goto/16 :goto_1

    .line 202
    .line 203
    :cond_c
    const/16 v3, 0x11

    .line 204
    .line 205
    goto/16 :goto_1

    .line 206
    .line 207
    :sswitch_c
    const-string v0, "verifyTeenModePassword"

    .line 208
    .line 209
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 210
    .line 211
    .line 212
    move-result p3

    .line 213
    if-nez p3, :cond_d

    .line 214
    .line 215
    goto/16 :goto_1

    .line 216
    .line 217
    :cond_d
    const/16 v3, 0x10

    .line 218
    .line 219
    goto/16 :goto_1

    .line 220
    .line 221
    :sswitch_d
    const-string v0, "liveAnchor"

    .line 222
    .line 223
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 224
    .line 225
    .line 226
    move-result p3

    .line 227
    if-nez p3, :cond_e

    .line 228
    .line 229
    goto/16 :goto_1

    .line 230
    .line 231
    :cond_e
    const/16 v3, 0xf

    .line 232
    .line 233
    goto/16 :goto_1

    .line 234
    .line 235
    :sswitch_e
    const-string v0, "showTTCoinDialog"

    .line 236
    .line 237
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 238
    .line 239
    .line 240
    move-result p3

    .line 241
    if-nez p3, :cond_f

    .line 242
    .line 243
    goto/16 :goto_1

    .line 244
    .line 245
    :cond_f
    const/16 v3, 0xe

    .line 246
    .line 247
    goto/16 :goto_1

    .line 248
    .line 249
    :sswitch_f
    const-string v0, "enterSuggestVoiceRoom"

    .line 250
    .line 251
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 252
    .line 253
    .line 254
    move-result p3

    .line 255
    if-nez p3, :cond_10

    .line 256
    .line 257
    goto/16 :goto_1

    .line 258
    .line 259
    :cond_10
    const/16 v3, 0xd

    .line 260
    .line 261
    goto/16 :goto_1

    .line 262
    .line 263
    :sswitch_10
    const-string v0, "updateLiveSummary"

    .line 264
    .line 265
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 266
    .line 267
    .line 268
    move-result p3

    .line 269
    if-nez p3, :cond_11

    .line 270
    .line 271
    goto/16 :goto_1

    .line 272
    .line 273
    :cond_11
    const/16 v3, 0xc

    .line 274
    .line 275
    goto/16 :goto_1

    .line 276
    .line 277
    :sswitch_11
    const-string v0, "room"

    .line 278
    .line 279
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 280
    .line 281
    .line 282
    move-result p3

    .line 283
    if-nez p3, :cond_12

    .line 284
    .line 285
    goto/16 :goto_1

    .line 286
    .line 287
    :cond_12
    const/16 v3, 0xb

    .line 288
    .line 289
    goto/16 :goto_1

    .line 290
    .line 291
    :sswitch_12
    const-string v0, "room/showUserMedal"

    .line 292
    .line 293
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 294
    .line 295
    .line 296
    move-result p3

    .line 297
    if-nez p3, :cond_13

    .line 298
    .line 299
    goto/16 :goto_1

    .line 300
    .line 301
    :cond_13
    const/16 v3, 0xa

    .line 302
    .line 303
    goto/16 :goto_1

    .line 304
    .line 305
    :sswitch_13
    const-string v0, "openLiveRoom"

    .line 306
    .line 307
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 308
    .line 309
    .line 310
    move-result p3

    .line 311
    if-nez p3, :cond_14

    .line 312
    .line 313
    goto/16 :goto_1

    .line 314
    .line 315
    :cond_14
    const/16 v3, 0x9

    .line 316
    .line 317
    goto/16 :goto_1

    .line 318
    .line 319
    :sswitch_14
    const-string v0, "updateNewVoiceActivitiesNum"

    .line 320
    .line 321
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 322
    .line 323
    .line 324
    move-result p3

    .line 325
    if-nez p3, :cond_15

    .line 326
    .line 327
    goto/16 :goto_1

    .line 328
    .line 329
    :cond_15
    const/16 v3, 0x8

    .line 330
    .line 331
    goto/16 :goto_1

    .line 332
    .line 333
    :sswitch_15
    const-string v0, "enterVoiceRoom"

    .line 334
    .line 335
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 336
    .line 337
    .line 338
    move-result p3

    .line 339
    if-nez p3, :cond_16

    .line 340
    .line 341
    goto :goto_1

    .line 342
    :cond_16
    const/4 v3, 0x7

    .line 343
    goto :goto_1

    .line 344
    :sswitch_16
    const-string v0, "fanBaseGroupNotification"

    .line 345
    .line 346
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 347
    .line 348
    .line 349
    move-result p3

    .line 350
    if-nez p3, :cond_17

    .line 351
    .line 352
    goto :goto_1

    .line 353
    :cond_17
    const/4 v3, 0x6

    .line 354
    goto :goto_1

    .line 355
    :sswitch_17
    const-string v0, "enterVoiceRoomPackageGiftRecall"

    .line 356
    .line 357
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 358
    .line 359
    .line 360
    move-result p3

    .line 361
    if-nez p3, :cond_18

    .line 362
    .line 363
    goto :goto_1

    .line 364
    :cond_18
    const/4 v3, 0x5

    .line 365
    goto :goto_1

    .line 366
    :sswitch_18
    const-string v0, "startVoiceLive"

    .line 367
    .line 368
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 369
    .line 370
    .line 371
    move-result p3

    .line 372
    if-nez p3, :cond_19

    .line 373
    .line 374
    goto :goto_1

    .line 375
    :cond_19
    const/4 v3, 0x4

    .line 376
    goto :goto_1

    .line 377
    :sswitch_19
    const-string v0, "livePrivacy"

    .line 378
    .line 379
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 380
    .line 381
    .line 382
    move-result p3

    .line 383
    if-nez p3, :cond_1a

    .line 384
    .line 385
    goto :goto_1

    .line 386
    :cond_1a
    const/4 v3, 0x3

    .line 387
    goto :goto_1

    .line 388
    :sswitch_1a
    const-string v0, "refreshLiveAuth"

    .line 389
    .line 390
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 391
    .line 392
    .line 393
    move-result p3

    .line 394
    if-nez p3, :cond_1b

    .line 395
    .line 396
    goto :goto_1

    .line 397
    :cond_1b
    const/4 v3, 0x2

    .line 398
    goto :goto_1

    .line 399
    :sswitch_1b
    const-string v0, "updateCanUserStartLive"

    .line 400
    .line 401
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 402
    .line 403
    .line 404
    move-result p3

    .line 405
    if-nez p3, :cond_1c

    .line 406
    .line 407
    goto :goto_1

    .line 408
    :cond_1c
    move v3, v2

    .line 409
    goto :goto_1

    .line 410
    :sswitch_1c
    const-string v0, "jumpToProfile"

    .line 411
    .line 412
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 413
    .line 414
    .line 415
    move-result p3

    .line 416
    if-nez p3, :cond_1d

    .line 417
    .line 418
    goto :goto_1

    .line 419
    :cond_1d
    move v3, v1

    .line 420
    :goto_1
    const-string p3, "from"

    .line 421
    .line 422
    const-string v0, "anchorSource"

    .line 423
    .line 424
    const-string v4, "source"

    .line 425
    .line 426
    packed-switch v3, :pswitch_data_0

    .line 427
    .line 428
    .line 429
    return-void

    .line 430
    :pswitch_0
    const-string p1, "enable"

    .line 431
    .line 432
    invoke-static {p2, p1}, Ll/v5k0;->e(Ll/abe0;Ljava/lang/String;)Z

    .line 433
    .line 434
    .line 435
    move-result p1

    .line 436
    invoke-virtual {p0, p1}, Ll/q5k0;->s0(Z)V

    .line 437
    .line 438
    .line 439
    return-void

    .line 440
    :pswitch_1
    invoke-virtual {p0, p1}, Ll/t4k0;->g(Lcom/p1/mobile/android/app/Act;)Z

    .line 441
    .line 442
    .line 443
    move-result p2

    .line 444
    if-nez p2, :cond_1f

    .line 445
    .line 446
    invoke-virtual {p0, p1}, Ll/q5k0;->F0(Lcom/p1/mobile/android/app/Act;)V

    .line 447
    .line 448
    .line 449
    return-void

    .line 450
    :pswitch_2
    invoke-virtual {p0}, Ll/q5k0;->L0()V

    .line 451
    .line 452
    .line 453
    return-void

    .line 454
    :pswitch_3
    invoke-static {p1}, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupActivity;->X1(Landroid/content/Context;)Landroid/content/Intent;

    .line 455
    .line 456
    .line 457
    move-result-object p0

    .line 458
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 459
    .line 460
    .line 461
    return-void

    .line 462
    :pswitch_4
    invoke-virtual {p0, p1}, Ll/q5k0;->b0(Landroid/content/Context;)V

    .line 463
    .line 464
    .line 465
    return-void

    .line 466
    :pswitch_5
    const-string p2, "from_message"

    .line 467
    .line 468
    invoke-virtual {p0, p1, p2}, Ll/q5k0;->d0(Landroid/content/Context;Ljava/lang/String;)V

    .line 469
    .line 470
    .line 471
    return-void

    .line 472
    :pswitch_6
    invoke-static {p2, v4}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 473
    .line 474
    .line 475
    move-result-object v3

    .line 476
    const-string p3, "category"

    .line 477
    .line 478
    invoke-static {p2, p3}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 479
    .line 480
    .line 481
    move-result-object v4

    .line 482
    const-string p3, "open"

    .line 483
    .line 484
    invoke-static {p2, p3}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 485
    .line 486
    .line 487
    move-result-object v5

    .line 488
    const-string p3, "schema"

    .line 489
    .line 490
    invoke-static {p2, p3}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 491
    .line 492
    .line 493
    move-result-object v6

    .line 494
    invoke-static {p2}, Ll/v5k0;->h(Ll/abe0;)Ljava/lang/String;

    .line 495
    .line 496
    .line 497
    move-result-object v7

    .line 498
    const-string v2, "-1"

    .line 499
    .line 500
    move-object v0, p0

    .line 501
    move-object v1, p1

    .line 502
    invoke-virtual/range {v0 .. v7}, Ll/q5k0;->M(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 503
    .line 504
    .line 505
    move-result-object p0

    .line 506
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 507
    .line 508
    .line 509
    return-void

    .line 510
    :pswitch_7
    invoke-virtual {p0, p1}, Ll/q5k0;->P(Landroid/content/Context;)Landroid/content/Intent;

    .line 511
    .line 512
    .line 513
    move-result-object p0

    .line 514
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 515
    .line 516
    .line 517
    return-void

    .line 518
    :pswitch_8
    const-string p3, "subCode"

    .line 519
    .line 520
    invoke-static {p2, p3}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 521
    .line 522
    .line 523
    move-result-object p2

    .line 524
    invoke-virtual {p0, p1, p2}, Ll/q5k0;->v0(Landroid/content/Context;Ljava/lang/String;)V

    .line 525
    .line 526
    .line 527
    return-void

    .line 528
    :pswitch_9
    invoke-virtual {p0, p1}, Ll/q5k0;->y0(Landroid/content/Context;)V

    .line 529
    .line 530
    .line 531
    return-void

    .line 532
    :pswitch_a
    invoke-virtual {p0, p1}, Ll/q5k0;->f0(Lcom/p1/mobile/android/app/Act;)V

    .line 533
    .line 534
    .line 535
    return-void

    .line 536
    :pswitch_b
    const-string p1, "verified"

    .line 537
    .line 538
    invoke-static {p2, p1}, Ll/v5k0;->e(Ll/abe0;Ljava/lang/String;)Z

    .line 539
    .line 540
    .line 541
    move-result p1

    .line 542
    const-string p3, "scenes"

    .line 543
    .line 544
    invoke-static {p2, p3}, Ll/v5k0;->f(Ll/abe0;Ljava/lang/String;)I

    .line 545
    .line 546
    .line 547
    move-result p2

    .line 548
    invoke-virtual {p0, p1, p2}, Ll/q5k0;->M0(ZI)V

    .line 549
    .line 550
    .line 551
    return-void

    .line 552
    :pswitch_c
    invoke-static {p2, v0}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 553
    .line 554
    .line 555
    move-result-object p2

    .line 556
    invoke-virtual {p0, p1, p2, v2}, Ll/q5k0;->w0(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 557
    .line 558
    .line 559
    return-void

    .line 560
    :pswitch_d
    if-eqz p1, :cond_1f

    .line 561
    .line 562
    invoke-virtual {p2}, Ll/abe0;->f()Ljava/util/Map;

    .line 563
    .line 564
    .line 565
    move-result-object p2

    .line 566
    invoke-interface {p2, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 567
    .line 568
    .line 569
    move-result-object p2

    .line 570
    check-cast p2, Ljava/lang/String;

    .line 571
    .line 572
    invoke-virtual {p0, p1, p2}, Ll/q5k0;->H0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 573
    .line 574
    .line 575
    return-void

    .line 576
    :pswitch_e
    invoke-virtual {p0, p1, v1, p2}, Ll/q5k0;->C0(Lcom/p1/mobile/android/app/Act;ZLl/abe0;)V

    .line 577
    .line 578
    .line 579
    return-void

    .line 580
    :pswitch_f
    invoke-virtual {p0}, Ll/q5k0;->J0()V

    .line 581
    .line 582
    .line 583
    return-void

    .line 584
    :pswitch_10
    invoke-virtual {p0, p1}, Ll/q5k0;->x0(Landroid/content/Context;)V

    .line 585
    .line 586
    .line 587
    return-void

    .line 588
    :pswitch_11
    invoke-virtual {p2}, Ll/abe0;->f()Ljava/util/Map;

    .line 589
    .line 590
    .line 591
    move-result-object p3

    .line 592
    const-string v0, "liveId"

    .line 593
    .line 594
    invoke-interface {p3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 595
    .line 596
    .line 597
    move-result-object p3

    .line 598
    check-cast p3, Ljava/lang/CharSequence;

    .line 599
    .line 600
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 601
    .line 602
    .line 603
    move-result p3

    .line 604
    if-eqz p3, :cond_1e

    .line 605
    .line 606
    new-instance p2, Ljava/lang/Exception;

    .line 607
    .line 608
    const-string p3, "SchemeDoLive live id is null"

    .line 609
    .line 610
    invoke-direct {p2, p3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 611
    .line 612
    .line 613
    invoke-static {p2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 614
    .line 615
    .line 616
    invoke-virtual {p0, p1}, Ll/q5k0;->P(Landroid/content/Context;)Landroid/content/Intent;

    .line 617
    .line 618
    .line 619
    move-result-object p0

    .line 620
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 621
    .line 622
    .line 623
    return-void

    .line 624
    :cond_1e
    if-eqz p1, :cond_1f

    .line 625
    .line 626
    invoke-static {p2, v0}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 627
    .line 628
    .line 629
    move-result-object v2

    .line 630
    const-string p3, "roomId"

    .line 631
    .line 632
    invoke-static {p2, p3}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 633
    .line 634
    .line 635
    move-result-object v3

    .line 636
    invoke-static {p2, v4}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 637
    .line 638
    .line 639
    move-result-object v4

    .line 640
    const-string p3, "liveMode"

    .line 641
    .line 642
    invoke-static {p2, p3}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 643
    .line 644
    .line 645
    move-result-object v5

    .line 646
    const-string p3, "liveSchema"

    .line 647
    .line 648
    invoke-static {p2, p3}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 649
    .line 650
    .line 651
    move-result-object p2

    .line 652
    invoke-static {p2}, Ll/q5k0;->O(Ljava/lang/String;)Ljava/lang/String;

    .line 653
    .line 654
    .line 655
    move-result-object v6

    .line 656
    move-object v0, p0

    .line 657
    move-object v1, p1

    .line 658
    invoke-virtual/range {v0 .. v6}, Ll/q5k0;->u0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 659
    .line 660
    .line 661
    return-void

    .line 662
    :pswitch_12
    invoke-virtual {p0}, Ll/q5k0;->K0()V

    .line 663
    .line 664
    .line 665
    return-void

    .line 666
    :pswitch_13
    invoke-virtual {p0, p1, p2}, Ll/q5k0;->E0(Lcom/p1/mobile/android/app/Act;Ll/abe0;)V

    .line 667
    .line 668
    .line 669
    return-void

    .line 670
    :pswitch_14
    invoke-static {p1}, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupNoticeActivity;->X1(Landroid/content/Context;)Landroid/content/Intent;

    .line 671
    .line 672
    .line 673
    move-result-object p0

    .line 674
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 675
    .line 676
    .line 677
    return-void

    .line 678
    :pswitch_15
    invoke-virtual {p0, p1, v2, p2}, Ll/q5k0;->C0(Lcom/p1/mobile/android/app/Act;ZLl/abe0;)V

    .line 679
    .line 680
    .line 681
    return-void

    .line 682
    :pswitch_16
    invoke-static {p2, v0}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 683
    .line 684
    .line 685
    move-result-object p2

    .line 686
    invoke-virtual {p0, p1, p2, v1}, Ll/q5k0;->w0(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 687
    .line 688
    .line 689
    return-void

    .line 690
    :pswitch_17
    invoke-virtual {p0, p1}, Ll/q5k0;->c0(Landroid/content/Context;)V

    .line 691
    .line 692
    .line 693
    return-void

    .line 694
    :pswitch_18
    invoke-virtual {p0, p1}, Ll/t4k0;->g(Lcom/p1/mobile/android/app/Act;)Z

    .line 695
    .line 696
    .line 697
    move-result p2

    .line 698
    if-nez p2, :cond_1f

    .line 699
    .line 700
    invoke-virtual {p0, p1}, Ll/q5k0;->G0(Lcom/p1/mobile/android/app/Act;)V

    .line 701
    .line 702
    .line 703
    :cond_1f
    return-void

    .line 704
    :pswitch_19
    const-string p1, "hasPermission"

    .line 705
    .line 706
    invoke-static {p2, p1}, Ll/v5k0;->e(Ll/abe0;Ljava/lang/String;)Z

    .line 707
    .line 708
    .line 709
    move-result p1

    .line 710
    invoke-virtual {p0, p1}, Ll/q5k0;->I0(Z)V

    .line 711
    .line 712
    .line 713
    return-void

    .line 714
    :pswitch_1a
    const-string v0, "userId"

    .line 715
    .line 716
    invoke-static {p2, v0}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 717
    .line 718
    .line 719
    move-result-object v0

    .line 720
    invoke-static {p2, p3}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 721
    .line 722
    .line 723
    move-result-object p2

    .line 724
    invoke-virtual {p0, p1, v0, p2}, Ll/q5k0;->e0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 725
    .line 726
    .line 727
    return-void

    .line 728
    nop

    .line 729
    :sswitch_data_0
    .sparse-switch
        -0x722f1de0 -> :sswitch_1c
        -0x6bb22224 -> :sswitch_1b
        -0x5b226751 -> :sswitch_1a
        -0x59899704 -> :sswitch_19
        -0x51dfb904 -> :sswitch_18
        -0x441b2f6e -> :sswitch_17
        -0x2f1bdf1a -> :sswitch_16
        -0x2910c6cb -> :sswitch_15
        -0x1fcaff42 -> :sswitch_14
        -0x17300faf -> :sswitch_13
        -0x8000ac5 -> :sswitch_12
        0x3580db -> :sswitch_11
        0x68d3491 -> :sswitch_10
        0xc9e6d01 -> :sswitch_f
        0xe3db556 -> :sswitch_e
        0x14d4fec1 -> :sswitch_d
        0x1541dff1 -> :sswitch_c
        0x1a1fff25 -> :sswitch_b
        0x2d088784 -> :sswitch_a
        0x2f9453c4 -> :sswitch_9
        0x33be9529 -> :sswitch_8
        0x35f55279 -> :sswitch_7
        0x3a97662b -> :sswitch_6
        0x3b67d490 -> :sswitch_5
        0x42188da0 -> :sswitch_4
        0x4825c8dd -> :sswitch_3
        0x48e3d8f0 -> :sswitch_2
        0x4e23efa0 -> :sswitch_1
        0x56e1c33f -> :sswitch_0
    .end sparse-switch

    .line 730
    .line 731
    .line 732
    .line 733
    .line 734
    .line 735
    .line 736
    .line 737
    .line 738
    .line 739
    .line 740
    .line 741
    .line 742
    .line 743
    .line 744
    .line 745
    .line 746
    .line 747
    .line 748
    .line 749
    .line 750
    .line 751
    .line 752
    .line 753
    .line 754
    .line 755
    .line 756
    .line 757
    .line 758
    .line 759
    .line 760
    .line 761
    .line 762
    .line 763
    .line 764
    .line 765
    .line 766
    .line 767
    .line 768
    .line 769
    .line 770
    .line 771
    .line 772
    .line 773
    .line 774
    .line 775
    .line 776
    .line 777
    .line 778
    .line 779
    .line 780
    .line 781
    .line 782
    .line 783
    .line 784
    .line 785
    .line 786
    .line 787
    .line 788
    .line 789
    .line 790
    .line 791
    .line 792
    .line 793
    .line 794
    .line 795
    .line 796
    .line 797
    .line 798
    .line 799
    .line 800
    .line 801
    .line 802
    .line 803
    .line 804
    .line 805
    .line 806
    .line 807
    .line 808
    .line 809
    .line 810
    .line 811
    .line 812
    .line 813
    .line 814
    .line 815
    .line 816
    .line 817
    .line 818
    .line 819
    .line 820
    .line 821
    .line 822
    .line 823
    .line 824
    .line 825
    .line 826
    .line 827
    .line 828
    .line 829
    .line 830
    .line 831
    .line 832
    .line 833
    .line 834
    .line 835
    .line 836
    .line 837
    .line 838
    .line 839
    .line 840
    .line 841
    .line 842
    .line 843
    .line 844
    .line 845
    .line 846
    .line 847
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_11
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_11
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public W(Ll/abe0;Ll/z20;)Landroid/content/Intent;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/abe0;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/abe0;->g()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_b

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "source"

    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/o5e0;->b(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v5

    .line 21
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "category"

    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/o5e0;->b(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v6

    .line 31
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "open"

    .line 36
    .line 37
    invoke-static {v0, v1}, Ll/o5e0;->b(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v7

    .line 41
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const-string v1, "back"

    .line 46
    .line 47
    invoke-static {v0, v1}, Ll/o5e0;->b(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    const-string v2, "liveId"

    .line 56
    .line 57
    invoke-static {v1, v2}, Ll/o5e0;->b(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    invoke-static {p1}, Ll/v5k0;->h(Ll/abe0;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v8

    .line 65
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    const-string v2, "liveSchema"

    .line 70
    .line 71
    invoke-static {v1, v2}, Ll/o5e0;->b(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-static {v1}, Ll/q5k0;->O(Ljava/lang/String;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v9

    .line 79
    new-instance v1, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    const-string v2, "schema:"

    .line 82
    .line 83
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1}, Ll/abe0;->c()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v2, "path:"

    .line 94
    .line 95
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {p1}, Ll/abe0;->g()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    const-string v2, "[live][schema]"

    .line 110
    .line 111
    invoke-static {v2, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p1}, Ll/abe0;->g()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    const-string v2, "/"

    .line 119
    .line 120
    const-string v3, ""

    .line 121
    .line 122
    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 130
    .line 131
    .line 132
    move-result v2

    .line 133
    const/4 v3, -0x1

    .line 134
    sparse-switch v2, :sswitch_data_0

    .line 135
    .line 136
    .line 137
    goto/16 :goto_0

    .line 138
    .line 139
    :sswitch_0
    const-string v2, "room/jumpRoom"

    .line 140
    .line 141
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    if-nez v1, :cond_0

    .line 146
    .line 147
    goto/16 :goto_0

    .line 148
    .line 149
    :cond_0
    const/16 v3, 0x8

    .line 150
    .line 151
    goto/16 :goto_0

    .line 152
    .line 153
    :sswitch_1
    const-string v2, "audience/suggest"

    .line 154
    .line 155
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    if-nez v1, :cond_1

    .line 160
    .line 161
    goto :goto_0

    .line 162
    :cond_1
    const/4 v3, 0x7

    .line 163
    goto :goto_0

    .line 164
    :sswitch_2
    const-string v2, "liveSetting"

    .line 165
    .line 166
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    move-result v1

    .line 170
    if-nez v1, :cond_2

    .line 171
    .line 172
    goto :goto_0

    .line 173
    :cond_2
    const/4 v3, 0x6

    .line 174
    goto :goto_0

    .line 175
    :sswitch_3
    const-string v2, "jumpToVoiceFrame"

    .line 176
    .line 177
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    move-result v1

    .line 181
    if-nez v1, :cond_3

    .line 182
    .line 183
    goto :goto_0

    .line 184
    :cond_3
    const/4 v3, 0x5

    .line 185
    goto :goto_0

    .line 186
    :sswitch_4
    const-string v2, "room"

    .line 187
    .line 188
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 189
    .line 190
    .line 191
    move-result v1

    .line 192
    if-nez v1, :cond_4

    .line 193
    .line 194
    goto :goto_0

    .line 195
    :cond_4
    const/4 v3, 0x4

    .line 196
    goto :goto_0

    .line 197
    :sswitch_5
    const-string v2, "room/showUserMedal"

    .line 198
    .line 199
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    move-result v1

    .line 203
    if-nez v1, :cond_5

    .line 204
    .line 205
    goto :goto_0

    .line 206
    :cond_5
    const/4 v3, 0x3

    .line 207
    goto :goto_0

    .line 208
    :sswitch_6
    const-string v2, "square"

    .line 209
    .line 210
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 211
    .line 212
    .line 213
    move-result v1

    .line 214
    if-nez v1, :cond_6

    .line 215
    .line 216
    goto :goto_0

    .line 217
    :cond_6
    const/4 v3, 0x2

    .line 218
    goto :goto_0

    .line 219
    :sswitch_7
    const-string v2, "withOpen"

    .line 220
    .line 221
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    move-result v1

    .line 225
    if-nez v1, :cond_7

    .line 226
    .line 227
    goto :goto_0

    .line 228
    :cond_7
    const/4 v3, 0x1

    .line 229
    goto :goto_0

    .line 230
    :sswitch_8
    const-string v2, "livePrivacy"

    .line 231
    .line 232
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 233
    .line 234
    .line 235
    move-result v1

    .line 236
    if-nez v1, :cond_8

    .line 237
    .line 238
    goto :goto_0

    .line 239
    :cond_8
    const/4 v3, 0x0

    .line 240
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 241
    .line 242
    .line 243
    goto/16 :goto_1

    .line 244
    .line 245
    :pswitch_0
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 246
    .line 247
    .line 248
    move-result-object v3

    .line 249
    const-string v4, "-1"

    .line 250
    .line 251
    move-object v2, v9

    .line 252
    move-object v9, v8

    .line 253
    move-object v8, v2

    .line 254
    move-object v2, p0

    .line 255
    invoke-virtual/range {v2 .. v9}, Ll/q5k0;->M(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 256
    .line 257
    .line 258
    move-result-object p0

    .line 259
    return-object p0

    .line 260
    :pswitch_1
    move-object v2, p0

    .line 261
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 262
    .line 263
    .line 264
    move-result-object p0

    .line 265
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 266
    .line 267
    .line 268
    move-result-object p1

    .line 269
    const-string p2, "subCode"

    .line 270
    .line 271
    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 272
    .line 273
    .line 274
    move-result-object p1

    .line 275
    check-cast p1, Ljava/lang/String;

    .line 276
    .line 277
    invoke-virtual {v2, p0, p1}, Ll/q5k0;->L(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 278
    .line 279
    .line 280
    move-result-object p0

    .line 281
    return-object p0

    .line 282
    :pswitch_2
    move-object v2, p0

    .line 283
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 284
    .line 285
    .line 286
    move-result-object p0

    .line 287
    invoke-virtual {v2, p0}, Ll/q5k0;->T(Landroid/content/Context;)Landroid/content/Intent;

    .line 288
    .line 289
    .line 290
    move-result-object p0

    .line 291
    return-object p0

    .line 292
    :pswitch_3
    move-object v2, p0

    .line 293
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 294
    .line 295
    .line 296
    move-result p0

    .line 297
    if-eqz p0, :cond_9

    .line 298
    .line 299
    new-instance p0, Ljava/lang/Exception;

    .line 300
    .line 301
    const-string p2, "SchemeDoLive live id is null"

    .line 302
    .line 303
    invoke-direct {p0, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 304
    .line 305
    .line 306
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 307
    .line 308
    .line 309
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 310
    .line 311
    .line 312
    move-result-object p0

    .line 313
    invoke-virtual {v2, p0}, Ll/q5k0;->P(Landroid/content/Context;)Landroid/content/Intent;

    .line 314
    .line 315
    .line 316
    move-result-object p0

    .line 317
    return-object p0

    .line 318
    :cond_9
    const-string p0, "true"

    .line 319
    .line 320
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 321
    .line 322
    .line 323
    move-result p0

    .line 324
    if-eqz p0, :cond_a

    .line 325
    .line 326
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 327
    .line 328
    .line 329
    move-result-object v3

    .line 330
    const/4 v10, 0x0

    .line 331
    invoke-virtual/range {v2 .. v10}, Ll/q5k0;->N(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 332
    .line 333
    .line 334
    move-result-object p0

    .line 335
    return-object p0

    .line 336
    :cond_a
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 337
    .line 338
    .line 339
    move-result-object v3

    .line 340
    const-string v7, ""

    .line 341
    .line 342
    move-object v8, v9

    .line 343
    const-string v9, ""

    .line 344
    .line 345
    invoke-virtual/range {v2 .. v9}, Ll/q5k0;->M(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 346
    .line 347
    .line 348
    move-result-object p0

    .line 349
    return-object p0

    .line 350
    :pswitch_4
    move-object v2, p0

    .line 351
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 352
    .line 353
    .line 354
    move-result-object p0

    .line 355
    invoke-virtual {v2, p0}, Ll/q5k0;->S(Landroid/content/Context;)Landroid/content/Intent;

    .line 356
    .line 357
    .line 358
    move-result-object p0

    .line 359
    return-object p0

    .line 360
    :pswitch_5
    move-object v2, p0

    .line 361
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 362
    .line 363
    .line 364
    move-result-object p0

    .line 365
    invoke-virtual {v2, p0}, Ll/q5k0;->P(Landroid/content/Context;)Landroid/content/Intent;

    .line 366
    .line 367
    .line 368
    move-result-object p0

    .line 369
    return-object p0

    .line 370
    :pswitch_6
    move-object v2, p0

    .line 371
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 372
    .line 373
    .line 374
    move-result-object v3

    .line 375
    const-string v4, "-1"

    .line 376
    .line 377
    const/4 v10, 0x0

    .line 378
    invoke-virtual/range {v2 .. v10}, Ll/q5k0;->N(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 379
    .line 380
    .line 381
    move-result-object p0

    .line 382
    return-object p0

    .line 383
    :pswitch_7
    move-object v2, p0

    .line 384
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 385
    .line 386
    .line 387
    move-result-object p0

    .line 388
    invoke-virtual {v2, p0}, Ll/q5k0;->J(Landroid/content/Context;)Landroid/content/Intent;

    .line 389
    .line 390
    .line 391
    move-result-object p0

    .line 392
    return-object p0

    .line 393
    :cond_b
    :goto_1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 394
    .line 395
    .line 396
    move-result p0

    .line 397
    if-eqz p0, :cond_c

    .line 398
    .line 399
    new-instance p0, Ljava/lang/StringBuilder;

    .line 400
    .line 401
    const-string v0, "schema is:"

    .line 402
    .line 403
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 404
    .line 405
    .line 406
    invoke-virtual {p1}, Ll/abe0;->c()Ljava/lang/String;

    .line 407
    .line 408
    .line 409
    move-result-object p1

    .line 410
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 411
    .line 412
    .line 413
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 414
    .line 415
    .line 416
    move-result-object p0

    .line 417
    const-string p1, "error:schema not support"

    .line 418
    .line 419
    invoke-interface {p2, p1, p0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 420
    .line 421
    .line 422
    goto :goto_2

    .line 423
    :cond_c
    sget p0, Lcom/p1/mobile/putong/live/base/R$string;->G0:I

    .line 424
    .line 425
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 426
    .line 427
    .line 428
    :goto_2
    const/4 p0, 0x0

    .line 429
    return-object p0

    .line 430
    nop

    .line 431
    :sswitch_data_0
    .sparse-switch
        -0x59899704 -> :sswitch_8
        -0x381487d0 -> :sswitch_7
        -0x3553a6e3 -> :sswitch_6
        -0x8000ac5 -> :sswitch_5
        0x3580db -> :sswitch_4
        0x2d088784 -> :sswitch_3
        0x2f9453c4 -> :sswitch_2
        0x35f55279 -> :sswitch_1
        0x4825c8dd -> :sswitch_0
    .end sparse-switch

    .line 432
    .line 433
    .line 434
    .line 435
    .line 436
    .line 437
    .line 438
    .line 439
    .line 440
    .line 441
    .line 442
    .line 443
    .line 444
    .line 445
    .line 446
    .line 447
    .line 448
    .line 449
    .line 450
    .line 451
    .line 452
    .line 453
    .line 454
    .line 455
    .line 456
    .line 457
    .line 458
    .line 459
    .line 460
    .line 461
    .line 462
    .line 463
    .line 464
    .line 465
    .line 466
    .line 467
    .line 468
    .line 469
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method public final X(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 4

    .line 1
    invoke-static {}, Ll/mbs;->J()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p2, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    const/4 p2, 0x0

    .line 12
    const-string v0, "scheme_fake_frag"

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    const/4 v2, 0x1

    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground()Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    new-instance v3, Ll/d5k0;

    .line 23
    .line 24
    invoke-direct {v3}, Ll/d5k0;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v3}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0, v2}, Lrx/c;->take(I)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    new-instance v3, Ll/e5k0;

    .line 36
    .line 37
    invoke-direct {v3}, Ll/e5k0;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-static {v3}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {p0, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    invoke-static {p1, v0, p2}, Lcom/p1/mobile/putong/live/external/page/setting/LiveIndependentSettingAct;->Z1(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 52
    .line 53
    .line 54
    instance-of p0, p1, Landroid/app/Activity;

    .line 55
    .line 56
    if-eqz p0, :cond_0

    .line 57
    .line 58
    check-cast p1, Landroid/app/Activity;

    .line 59
    .line 60
    invoke-virtual {p1, v1, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 61
    .line 62
    .line 63
    :cond_0
    return v2

    .line 64
    :cond_1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground()Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    new-instance v3, Ll/g5k0;

    .line 69
    .line 70
    invoke-direct {v3}, Ll/g5k0;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, v3}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0, v2}, Lrx/c;->take(I)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    new-instance v3, Ll/h5k0;

    .line 82
    .line 83
    invoke-direct {v3}, Ll/h5k0;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-static {v3}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    invoke-virtual {p0, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 91
    .line 92
    .line 93
    invoke-static {p1, v0, p2}, Lcom/p1/mobile/putong/live/external/page/setting/LiveIndependentSettingAct;->Z1(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 98
    .line 99
    .line 100
    instance-of p0, p1, Landroid/app/Activity;

    .line 101
    .line 102
    if-eqz p0, :cond_2

    .line 103
    .line 104
    check-cast p1, Landroid/app/Activity;

    .line 105
    .line 106
    invoke-virtual {p1, v1, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 107
    .line 108
    .line 109
    :cond_2
    return v2
.end method

.method public final Y()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->globalLifeCycle_()Ljava/util/HashMap;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/util/HashMap;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->globalLifeCycle_()Ljava/util/HashMap;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->globalLifeCycle_()Ljava/util/HashMap;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Ljava/util/List;

    .line 42
    .line 43
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_0

    .line 48
    .line 49
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    const/4 v1, 0x1

    .line 54
    sub-int/2addr v0, v1

    .line 55
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    check-cast p0, Lcom/p1/mobile/android/app/Act$r;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    check-cast p0, Landroid/app/Activity;

    .line 68
    .line 69
    sget-object v0, Ll/tbs;->f:Ll/j6t;

    .line 70
    .line 71
    invoke-virtual {v0, p0}, Ll/j6t;->m(Landroid/app/Activity;)Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-eqz p0, :cond_0

    .line 76
    .line 77
    return v1

    .line 78
    :cond_0
    const/4 p0, 0x0

    .line 79
    return p0
.end method

.method public final Z(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    new-instance p0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v0, Lcom/p1/mobile/putong/live/external/intl/feedback/IntlFeedbackActivity;

    .line 4
    .line 5
    invoke-direct {p0, p1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 7

    .line 1
    const/4 v5, 0x0

    .line 2
    const/4 v6, 0x0

    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move-object v3, p3

    .line 7
    move-object v4, p4

    .line 8
    invoke-virtual/range {v0 .. v6}, Ll/q5k0;->Q(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final a0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p2, "live"

    .line 8
    .line 9
    :cond_0
    new-instance p0, Landroid/content/Intent;

    .line 10
    .line 11
    const-class v0, Lcom/p1/mobile/putong/live/external/intl/feedback/upload/IntlFeedbackCategoryAct;

    .line 12
    .line 13
    invoke-direct {p0, p1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "liveType"

    .line 17
    .line 18
    invoke-virtual {p0, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public b(Landroid/content/Context;Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessage;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/PushMessage;->toJson()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    const-string p0, "live.voiceLiving.push"

    .line 5
    .line 6
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-nez p0, :cond_3

    .line 11
    .line 12
    const-string p0, "live.voiceFriendLiving.push"

    .line 13
    .line 14
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-nez p0, :cond_3

    .line 19
    .line 20
    const-string p0, "live.voiceFriendOncall.push"

    .line 21
    .line 22
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-nez p0, :cond_3

    .line 27
    .line 28
    const-string p0, "live.voiceLikeOrFollowLiving.push"

    .line 29
    .line 30
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-nez p0, :cond_3

    .line 35
    .line 36
    const-string p0, "live.voiceLikeOrFollowOncall.push"

    .line 37
    .line 38
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-eqz p0, :cond_0

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    const-string p0, "voice.enterroom.push"

    .line 46
    .line 47
    invoke-virtual {p2, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_1

    .line 52
    .line 53
    invoke-static {p3}, Ll/v5k0;->g(Lcom/p1/mobile/putong/data/PushMessage;)Landroid/os/Bundle;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const-string p3, "live_push_voice"

    .line 58
    .line 59
    invoke-virtual {p0, p3, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-static {p1, p0}, Ll/bjo0;->c(Landroid/content/Context;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0

    .line 67
    :cond_1
    const-string p0, "live.chatNewMsg.push"

    .line 68
    .line 69
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-eqz p0, :cond_2

    .line 74
    .line 75
    invoke-static {p3}, Ll/v5k0;->g(Lcom/p1/mobile/putong/data/PushMessage;)Landroid/os/Bundle;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-static {p1, p0}, Ll/bjo0;->a(Landroid/content/Context;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    return-object p0

    .line 84
    :cond_2
    invoke-static {p3}, Ll/v5k0;->g(Lcom/p1/mobile/putong/data/PushMessage;)Landroid/os/Bundle;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-static {p1, p0}, Ll/r4u;->c(Landroid/content/Context;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    return-object p0

    .line 93
    :cond_3
    :goto_0
    invoke-static {p3}, Ll/v5k0;->g(Lcom/p1/mobile/putong/data/PushMessage;)Landroid/os/Bundle;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-static {p1, p0}, Ll/bjo0;->c(Landroid/content/Context;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    return-object p0
.end method

.method public b0(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/live/external/page/rights/manage/LiveRightAct;->Y1(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Landroid/content/Context;Landroid/os/Bundle;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/r4u;->c(Landroid/content/Context;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c0(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q5k0;->J(Landroid/content/Context;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public d(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p1, p0}, Ll/nae0;->e(Landroid/content/Context;Landroid/net/Uri;)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public d0(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/y4k0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/y4k0;-><init>(Ll/q5k0;Landroid/content/Context;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/data/SchemeKey;Ll/abe0;Ll/z20;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/SchemeKey;",
            "Ll/abe0;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "live"

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    new-instance v2, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p2}, Ll/abe0;->g()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    :cond_0
    invoke-virtual {p2}, Ll/abe0;->b()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-static {v2}, Ll/v5k0;->o(Landroid/content/Context;)Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    const-string v4, "enterVoiceRoom"

    .line 45
    .line 46
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    const/4 v5, 0x0

    .line 51
    if-nez v3, :cond_1

    .line 52
    .line 53
    invoke-virtual {p0, p1, p2}, Ll/q5k0;->E(Lcom/p1/mobile/putong/data/SchemeKey;Ll/abe0;)Z

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    if-eqz v3, :cond_3

    .line 58
    .line 59
    :cond_1
    if-nez v2, :cond_2

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/q5k0;->Y()Z

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    if-eqz v3, :cond_2

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/q5k0;->K()Lcom/p1/mobile/android/app/Act;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    :cond_2
    if-nez v2, :cond_3

    .line 72
    .line 73
    sget-boolean v3, Ll/sw0;->b:Z

    .line 74
    .line 75
    if-nez v3, :cond_3

    .line 76
    .line 77
    sget-object p0, Ll/itd0;->b:Ll/itd0;

    .line 78
    .line 79
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    check-cast v0, Ll/fk3;

    .line 84
    .line 85
    invoke-virtual {v0}, Ll/fk3;->f()V

    .line 86
    .line 87
    .line 88
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    check-cast p0, Ll/fk3;

    .line 93
    .line 94
    invoke-virtual {p0, p1, p2, p3}, Ll/fk3;->O(Lcom/p1/mobile/putong/data/SchemeKey;Ll/abe0;Ll/z20;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p2}, Ll/abe0;->b()Landroid/content/Context;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    if-eqz p0, :cond_17

    .line 102
    .line 103
    invoke-virtual {p2}, Ll/abe0;->b()Landroid/content/Context;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    const-string p1, "scheme_dummy_frag"

    .line 108
    .line 109
    const/4 p3, 0x0

    .line 110
    invoke-static {p0, p1, p3}, Lcom/p1/mobile/putong/live/external/page/setting/LiveIndependentSettingAct;->Z1(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    const/high16 p1, 0x10000000

    .line 115
    .line 116
    invoke-virtual {p0, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 117
    .line 118
    .line 119
    invoke-virtual {p2}, Ll/abe0;->b()Landroid/content/Context;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p2}, Ll/abe0;->b()Landroid/content/Context;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    instance-of p0, p0, Landroid/app/Activity;

    .line 131
    .line 132
    if-eqz p0, :cond_17

    .line 133
    .line 134
    invoke-virtual {p2}, Ll/abe0;->b()Landroid/content/Context;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    check-cast p0, Landroid/app/Activity;

    .line 139
    .line 140
    invoke-virtual {p0, v5, v5}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :cond_3
    if-nez v2, :cond_4

    .line 145
    .line 146
    goto/16 :goto_1

    .line 147
    .line 148
    :cond_4
    invoke-static {v0, v5}, Ll/gss;->d(Ljava/lang/String;Z)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 156
    .line 157
    .line 158
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    const/4 v3, 0x1

    .line 163
    const/4 v6, -0x1

    .line 164
    sparse-switch v0, :sswitch_data_0

    .line 165
    .line 166
    .line 167
    goto/16 :goto_0

    .line 168
    .line 169
    :sswitch_0
    const-string v0, "enterVoiceChatRoom"

    .line 170
    .line 171
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result p1

    .line 175
    if-nez p1, :cond_5

    .line 176
    .line 177
    goto/16 :goto_0

    .line 178
    .line 179
    :cond_5
    const/16 v6, 0x11

    .line 180
    .line 181
    goto/16 :goto_0

    .line 182
    .line 183
    :sswitch_1
    const-string v0, "liveRight"

    .line 184
    .line 185
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    move-result p1

    .line 189
    if-nez p1, :cond_6

    .line 190
    .line 191
    goto/16 :goto_0

    .line 192
    .line 193
    :cond_6
    const/16 v6, 0x10

    .line 194
    .line 195
    goto/16 :goto_0

    .line 196
    .line 197
    :sswitch_2
    const-string v0, "liveCover"

    .line 198
    .line 199
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    move-result p1

    .line 203
    if-nez p1, :cond_7

    .line 204
    .line 205
    goto/16 :goto_0

    .line 206
    .line 207
    :cond_7
    const/16 v6, 0xf

    .line 208
    .line 209
    goto/16 :goto_0

    .line 210
    .line 211
    :sswitch_3
    const-string v0, "liveDynamic"

    .line 212
    .line 213
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    move-result p1

    .line 217
    if-nez p1, :cond_8

    .line 218
    .line 219
    goto/16 :goto_0

    .line 220
    .line 221
    :cond_8
    const/16 v6, 0xe

    .line 222
    .line 223
    goto/16 :goto_0

    .line 224
    .line 225
    :sswitch_4
    const-string v0, "liveSquare"

    .line 226
    .line 227
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 228
    .line 229
    .line 230
    move-result p1

    .line 231
    if-nez p1, :cond_9

    .line 232
    .line 233
    goto/16 :goto_0

    .line 234
    .line 235
    :cond_9
    const/16 v6, 0xd

    .line 236
    .line 237
    goto/16 :goto_0

    .line 238
    .line 239
    :sswitch_5
    const-string v0, "liveSetting"

    .line 240
    .line 241
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    move-result p1

    .line 245
    if-nez p1, :cond_a

    .line 246
    .line 247
    goto/16 :goto_0

    .line 248
    .line 249
    :cond_a
    const/16 v6, 0xc

    .line 250
    .line 251
    goto/16 :goto_0

    .line 252
    .line 253
    :sswitch_6
    const-string v0, "jumpToVoiceFrame"

    .line 254
    .line 255
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    move-result p1

    .line 259
    if-nez p1, :cond_b

    .line 260
    .line 261
    goto/16 :goto_0

    .line 262
    .line 263
    :cond_b
    const/16 v6, 0xb

    .line 264
    .line 265
    goto/16 :goto_0

    .line 266
    .line 267
    :sswitch_7
    const-string v0, "jumpIntlServiceCenter"

    .line 268
    .line 269
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 270
    .line 271
    .line 272
    move-result p1

    .line 273
    if-nez p1, :cond_c

    .line 274
    .line 275
    goto/16 :goto_0

    .line 276
    .line 277
    :cond_c
    const/16 v6, 0xa

    .line 278
    .line 279
    goto/16 :goto_0

    .line 280
    .line 281
    :sswitch_8
    const-string v0, "liveAnchor"

    .line 282
    .line 283
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 284
    .line 285
    .line 286
    move-result p1

    .line 287
    if-nez p1, :cond_d

    .line 288
    .line 289
    goto/16 :goto_0

    .line 290
    .line 291
    :cond_d
    const/16 v6, 0x9

    .line 292
    .line 293
    goto/16 :goto_0

    .line 294
    .line 295
    :sswitch_9
    const-string v0, "enterSuggestVoiceRoom"

    .line 296
    .line 297
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 298
    .line 299
    .line 300
    move-result p1

    .line 301
    if-nez p1, :cond_e

    .line 302
    .line 303
    goto/16 :goto_0

    .line 304
    .line 305
    :cond_e
    const/16 v6, 0x8

    .line 306
    .line 307
    goto/16 :goto_0

    .line 308
    .line 309
    :sswitch_a
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 310
    .line 311
    .line 312
    move-result p1

    .line 313
    if-nez p1, :cond_f

    .line 314
    .line 315
    goto :goto_0

    .line 316
    :cond_f
    const/4 v6, 0x7

    .line 317
    goto :goto_0

    .line 318
    :sswitch_b
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 319
    .line 320
    .line 321
    move-result p1

    .line 322
    if-nez p1, :cond_10

    .line 323
    .line 324
    goto :goto_0

    .line 325
    :cond_10
    const/4 v6, 0x6

    .line 326
    goto :goto_0

    .line 327
    :sswitch_c
    const-string v0, "enterVoiceRoomPackageGiftRecall"

    .line 328
    .line 329
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 330
    .line 331
    .line 332
    move-result p1

    .line 333
    if-nez p1, :cond_11

    .line 334
    .line 335
    goto :goto_0

    .line 336
    :cond_11
    const/4 v6, 0x5

    .line 337
    goto :goto_0

    .line 338
    :sswitch_d
    const-string v0, "jumpVoiceSquare"

    .line 339
    .line 340
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 341
    .line 342
    .line 343
    move-result p1

    .line 344
    if-nez p1, :cond_12

    .line 345
    .line 346
    goto :goto_0

    .line 347
    :cond_12
    const/4 v6, 0x4

    .line 348
    goto :goto_0

    .line 349
    :sswitch_e
    const-string v0, "jumpLiveFeedbackQuestionPage"

    .line 350
    .line 351
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 352
    .line 353
    .line 354
    move-result p1

    .line 355
    if-nez p1, :cond_13

    .line 356
    .line 357
    goto :goto_0

    .line 358
    :cond_13
    const/4 v6, 0x3

    .line 359
    goto :goto_0

    .line 360
    :sswitch_f
    const-string v0, "startVoiceLive"

    .line 361
    .line 362
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 363
    .line 364
    .line 365
    move-result p1

    .line 366
    if-nez p1, :cond_14

    .line 367
    .line 368
    goto :goto_0

    .line 369
    :cond_14
    const/4 v6, 0x2

    .line 370
    goto :goto_0

    .line 371
    :sswitch_10
    const-string v0, "livePrivacy"

    .line 372
    .line 373
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 374
    .line 375
    .line 376
    move-result p1

    .line 377
    if-nez p1, :cond_15

    .line 378
    .line 379
    goto :goto_0

    .line 380
    :cond_15
    move v6, v3

    .line 381
    goto :goto_0

    .line 382
    :sswitch_11
    const-string v0, "voiceRight"

    .line 383
    .line 384
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 385
    .line 386
    .line 387
    move-result p1

    .line 388
    if-nez p1, :cond_16

    .line 389
    .line 390
    goto :goto_0

    .line 391
    :cond_16
    move v6, v5

    .line 392
    :goto_0
    const-string p1, "anchorSource"

    .line 393
    .line 394
    const-string v0, "tabId"

    .line 395
    .line 396
    packed-switch v6, :pswitch_data_0

    .line 397
    .line 398
    .line 399
    :cond_17
    :goto_1
    return-void

    .line 400
    :pswitch_0
    invoke-virtual {p0, v2, p2}, Ll/q5k0;->G(Lcom/p1/mobile/android/app/Act;Ll/abe0;)V

    .line 401
    .line 402
    .line 403
    return-void

    .line 404
    :pswitch_1
    invoke-virtual {p0, v2}, Ll/q5k0;->b0(Landroid/content/Context;)V

    .line 405
    .line 406
    .line 407
    return-void

    .line 408
    :pswitch_2
    const-string p1, "from_message"

    .line 409
    .line 410
    invoke-virtual {p0, v2, p1}, Ll/q5k0;->d0(Landroid/content/Context;Ljava/lang/String;)V

    .line 411
    .line 412
    .line 413
    return-void

    .line 414
    :pswitch_3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 415
    .line 416
    const-string p3, "{\"search\":\""

    .line 417
    .line 418
    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 419
    .line 420
    .line 421
    const-string p3, "extra"

    .line 422
    .line 423
    invoke-static {p2, p3}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 424
    .line 425
    .line 426
    move-result-object p2

    .line 427
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 428
    .line 429
    .line 430
    const-string p2, "\"}"

    .line 431
    .line 432
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 433
    .line 434
    .line 435
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 436
    .line 437
    .line 438
    move-result-object p1

    .line 439
    invoke-virtual {p0, p1}, Ll/q5k0;->F(Ljava/lang/String;)V

    .line 440
    .line 441
    .line 442
    return-void

    .line 443
    :pswitch_4
    invoke-virtual {p2}, Ll/abe0;->f()Ljava/util/Map;

    .line 444
    .line 445
    .line 446
    move-result-object p1

    .line 447
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 448
    .line 449
    .line 450
    move-result-object p1

    .line 451
    check-cast p1, Ljava/lang/String;

    .line 452
    .line 453
    invoke-virtual {p2}, Ll/abe0;->f()Ljava/util/Map;

    .line 454
    .line 455
    .line 456
    move-result-object p3

    .line 457
    const-string v0, "from"

    .line 458
    .line 459
    invoke-interface {p3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 460
    .line 461
    .line 462
    move-result-object p3

    .line 463
    check-cast p3, Ljava/lang/String;

    .line 464
    .line 465
    invoke-virtual {p2}, Ll/abe0;->f()Ljava/util/Map;

    .line 466
    .line 467
    .line 468
    move-result-object v0

    .line 469
    const-string v1, "extTabId"

    .line 470
    .line 471
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 472
    .line 473
    .line 474
    move-result-object v0

    .line 475
    check-cast v0, Ljava/lang/String;

    .line 476
    .line 477
    invoke-virtual {p2}, Ll/abe0;->f()Ljava/util/Map;

    .line 478
    .line 479
    .line 480
    move-result-object v1

    .line 481
    const-string v3, "action"

    .line 482
    .line 483
    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 484
    .line 485
    .line 486
    move-result-object v1

    .line 487
    check-cast v1, Ljava/lang/String;

    .line 488
    .line 489
    invoke-virtual {p2}, Ll/abe0;->f()Ljava/util/Map;

    .line 490
    .line 491
    .line 492
    move-result-object p2

    .line 493
    const-string v1, "userId"

    .line 494
    .line 495
    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 496
    .line 497
    .line 498
    move-result-object p2

    .line 499
    check-cast p2, Ljava/lang/String;

    .line 500
    .line 501
    invoke-virtual {p0, v2, p1, p3, v0}, Ll/q5k0;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 502
    .line 503
    .line 504
    move-result-object p0

    .line 505
    invoke-virtual {v2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 506
    .line 507
    .line 508
    return-void

    .line 509
    :pswitch_5
    const-string p1, "subCode"

    .line 510
    .line 511
    invoke-static {p2, p1}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 512
    .line 513
    .line 514
    move-result-object p1

    .line 515
    invoke-virtual {p0, v2, p1}, Ll/q5k0;->v0(Landroid/content/Context;Ljava/lang/String;)V

    .line 516
    .line 517
    .line 518
    return-void

    .line 519
    :pswitch_6
    invoke-virtual {p0, v2}, Ll/q5k0;->y0(Landroid/content/Context;)V

    .line 520
    .line 521
    .line 522
    return-void

    .line 523
    :pswitch_7
    invoke-virtual {p0, v2}, Ll/q5k0;->Z(Lcom/p1/mobile/android/app/Act;)V

    .line 524
    .line 525
    .line 526
    return-void

    .line 527
    :pswitch_8
    invoke-static {p2, p1}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 528
    .line 529
    .line 530
    move-result-object p1

    .line 531
    invoke-virtual {p0, v2, p1, v3}, Ll/q5k0;->w0(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 532
    .line 533
    .line 534
    return-void

    .line 535
    :pswitch_9
    invoke-virtual {p0, v2, v5, p2}, Ll/q5k0;->C0(Lcom/p1/mobile/android/app/Act;ZLl/abe0;)V

    .line 536
    .line 537
    .line 538
    return-void

    .line 539
    :pswitch_a
    new-instance p1, Ljava/lang/StringBuilder;

    .line 540
    .line 541
    const-string v0, "path:"

    .line 542
    .line 543
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 544
    .line 545
    .line 546
    invoke-virtual {p2}, Ll/abe0;->g()Ljava/lang/String;

    .line 547
    .line 548
    .line 549
    move-result-object v0

    .line 550
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 551
    .line 552
    .line 553
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 554
    .line 555
    .line 556
    move-result-object p1

    .line 557
    const-string v0, "[live][schema]"

    .line 558
    .line 559
    invoke-static {v0, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 560
    .line 561
    .line 562
    invoke-virtual {p0, v2, p2, p3}, Ll/q5k0;->V(Lcom/p1/mobile/android/app/Act;Ll/abe0;Ll/z20;)V

    .line 563
    .line 564
    .line 565
    return-void

    .line 566
    :pswitch_b
    invoke-virtual {p0, v2, p2}, Ll/q5k0;->E0(Lcom/p1/mobile/android/app/Act;Ll/abe0;)V

    .line 567
    .line 568
    .line 569
    return-void

    .line 570
    :pswitch_c
    invoke-virtual {p0, v2, v3, p2}, Ll/q5k0;->C0(Lcom/p1/mobile/android/app/Act;ZLl/abe0;)V

    .line 571
    .line 572
    .line 573
    return-void

    .line 574
    :pswitch_d
    invoke-static {p2, v0}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 575
    .line 576
    .line 577
    move-result-object p1

    .line 578
    invoke-virtual {p0, v2, p2, p1}, Ll/q5k0;->D0(Lcom/p1/mobile/android/app/Act;Ll/abe0;Ljava/lang/String;)V

    .line 579
    .line 580
    .line 581
    return-void

    .line 582
    :pswitch_e
    const-string p1, "liveType"

    .line 583
    .line 584
    invoke-static {p2, p1}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 585
    .line 586
    .line 587
    move-result-object p1

    .line 588
    invoke-virtual {p0, v2, p1}, Ll/q5k0;->a0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 589
    .line 590
    .line 591
    return-void

    .line 592
    :pswitch_f
    invoke-static {p2, p1}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 593
    .line 594
    .line 595
    move-result-object p1

    .line 596
    invoke-virtual {p0, v2, p1, v5}, Ll/q5k0;->w0(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 597
    .line 598
    .line 599
    return-void

    .line 600
    :pswitch_10
    invoke-virtual {p0, v2}, Ll/q5k0;->c0(Landroid/content/Context;)V

    .line 601
    .line 602
    .line 603
    return-void

    .line 604
    :pswitch_11
    invoke-virtual {p0, v2}, Ll/q5k0;->g0(Landroid/content/Context;)V

    .line 605
    .line 606
    .line 607
    return-void

    .line 608
    nop

    .line 609
    :sswitch_data_0
    .sparse-switch
        -0x5b071ff6 -> :sswitch_11
        -0x59899704 -> :sswitch_10
        -0x51dfb904 -> :sswitch_f
        -0x46850aec -> :sswitch_e
        -0x458e1c1f -> :sswitch_d
        -0x441b2f6e -> :sswitch_c
        -0x2910c6cb -> :sswitch_b
        0x32b0ec -> :sswitch_a
        0xc9e6d01 -> :sswitch_9
        0x14d4fec1 -> :sswitch_8
        0x2c1c197f -> :sswitch_7
        0x2d088784 -> :sswitch_6
        0x2f9453c4 -> :sswitch_5
        0x33be9529 -> :sswitch_4
        0x37daa5b3 -> :sswitch_3
        0x3a97662b -> :sswitch_2
        0x3b67d490 -> :sswitch_1
        0x4dbe17ad -> :sswitch_0
    .end sparse-switch

    .line 610
    .line 611
    .line 612
    .line 613
    .line 614
    .line 615
    .line 616
    .line 617
    .line 618
    .line 619
    .line 620
    .line 621
    .line 622
    .line 623
    .line 624
    .line 625
    .line 626
    .line 627
    .line 628
    .line 629
    .line 630
    .line 631
    .line 632
    .line 633
    .line 634
    .line 635
    .line 636
    .line 637
    .line 638
    .line 639
    .line 640
    .line 641
    .line 642
    .line 643
    .line 644
    .line 645
    .line 646
    .line 647
    .line 648
    .line 649
    .line 650
    .line 651
    .line 652
    .line 653
    .line 654
    .line 655
    .line 656
    .line 657
    .line 658
    .line 659
    .line 660
    .line 661
    .line 662
    .line 663
    .line 664
    .line 665
    .line 666
    .line 667
    .line 668
    .line 669
    .line 670
    .line 671
    .line 672
    .line 673
    .line 674
    .line 675
    .line 676
    .line 677
    .line 678
    .line 679
    .line 680
    .line 681
    .line 682
    .line 683
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public e0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    new-instance p0, Ll/u4k0;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2, p3}, Ll/u4k0;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/data/SchemeKey;Ll/abe0;Ll/z20;)Landroid/content/Intent;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/SchemeKey;",
            "Ll/abe0;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const-string v1, "liveAnchor"

    .line 13
    .line 14
    const-string v2, "startVoiceLive"

    .line 15
    .line 16
    const/4 v3, -0x1

    .line 17
    sparse-switch v0, :sswitch_data_0

    .line 18
    .line 19
    .line 20
    goto/16 :goto_0

    .line 21
    .line 22
    :sswitch_0
    const-string v0, "liveRight"

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    goto/16 :goto_0

    .line 31
    .line 32
    :cond_0
    const/16 v3, 0xb

    .line 33
    .line 34
    goto/16 :goto_0

    .line 35
    .line 36
    :sswitch_1
    const-string v0, "liveDynamic"

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-nez p1, :cond_1

    .line 43
    .line 44
    goto/16 :goto_0

    .line 45
    .line 46
    :cond_1
    const/16 v3, 0xa

    .line 47
    .line 48
    goto/16 :goto_0

    .line 49
    .line 50
    :sswitch_2
    const-string v0, "liveSquare"

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-nez p1, :cond_2

    .line 57
    .line 58
    goto/16 :goto_0

    .line 59
    .line 60
    :cond_2
    const/16 v3, 0x9

    .line 61
    .line 62
    goto/16 :goto_0

    .line 63
    .line 64
    :sswitch_3
    const-string v0, "liveSetting"

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-nez p1, :cond_3

    .line 71
    .line 72
    goto/16 :goto_0

    .line 73
    .line 74
    :cond_3
    const/16 v3, 0x8

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :sswitch_4
    const-string v0, "jumpToVoiceFrame"

    .line 78
    .line 79
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-nez p1, :cond_4

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_4
    const/4 v3, 0x7

    .line 87
    goto :goto_0

    .line 88
    :sswitch_5
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    if-nez p1, :cond_5

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_5
    const/4 v3, 0x6

    .line 96
    goto :goto_0

    .line 97
    :sswitch_6
    const-string v0, "enterSuggestVoiceRoom"

    .line 98
    .line 99
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    if-nez p1, :cond_6

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_6
    const/4 v3, 0x5

    .line 107
    goto :goto_0

    .line 108
    :sswitch_7
    const-string v0, "live"

    .line 109
    .line 110
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    if-nez p1, :cond_7

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_7
    const/4 v3, 0x4

    .line 118
    goto :goto_0

    .line 119
    :sswitch_8
    const-string v0, "enterVoiceRoom"

    .line 120
    .line 121
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    if-nez p1, :cond_8

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_8
    const/4 v3, 0x3

    .line 129
    goto :goto_0

    .line 130
    :sswitch_9
    const-string v0, "jumpVoiceSquare"

    .line 131
    .line 132
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    if-nez p1, :cond_9

    .line 137
    .line 138
    goto :goto_0

    .line 139
    :cond_9
    const/4 v3, 0x2

    .line 140
    goto :goto_0

    .line 141
    :sswitch_a
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result p1

    .line 145
    if-nez p1, :cond_a

    .line 146
    .line 147
    goto :goto_0

    .line 148
    :cond_a
    const/4 v3, 0x1

    .line 149
    goto :goto_0

    .line 150
    :sswitch_b
    const-string v0, "livePrivacy"

    .line 151
    .line 152
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    move-result p1

    .line 156
    if-nez p1, :cond_b

    .line 157
    .line 158
    goto :goto_0

    .line 159
    :cond_b
    const/4 v3, 0x0

    .line 160
    :goto_0
    const-string p1, "from"

    .line 161
    .line 162
    const-string v0, "tabId"

    .line 163
    .line 164
    const-string v4, "liveId"

    .line 165
    .line 166
    packed-switch v3, :pswitch_data_0

    .line 167
    .line 168
    .line 169
    const/4 p0, 0x0

    .line 170
    return-object p0

    .line 171
    :pswitch_0
    invoke-virtual {p2}, Ll/abe0;->b()Landroid/content/Context;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    invoke-static {p2, v4}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    const-string p0, "roomId"

    .line 180
    .line 181
    invoke-static {p2, p0}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v2

    .line 185
    const-string p0, "anchor_name"

    .line 186
    .line 187
    invoke-static {p2, p0}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v3

    .line 191
    const-string p0, "anchor_id"

    .line 192
    .line 193
    invoke-static {p2, p0}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v4

    .line 197
    const-string p0, "live_mode"

    .line 198
    .line 199
    invoke-static {p2, p0}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v5

    .line 203
    const-string v6, "live"

    .line 204
    .line 205
    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/live/external/page/rights/manage/LiveRightAct;->X1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    return-object p0

    .line 210
    :pswitch_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 211
    .line 212
    const-string p1, "{\"search\":\""

    .line 213
    .line 214
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 215
    .line 216
    .line 217
    const-string p1, "extra"

    .line 218
    .line 219
    invoke-static {p2, p1}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object p1

    .line 223
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    const-string p1, "\"}"

    .line 227
    .line 228
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object p0

    .line 235
    const-string p1, "navigation"

    .line 236
    .line 237
    invoke-static {p2, p1}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object p1

    .line 241
    invoke-static {p0, p1}, Ll/r4u;->d(Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    .line 242
    .line 243
    .line 244
    move-result-object p0

    .line 245
    invoke-static {}, Ll/q5k0;->I()Ll/t4k0;

    .line 246
    .line 247
    .line 248
    move-result-object p1

    .line 249
    invoke-virtual {p2}, Ll/abe0;->b()Landroid/content/Context;

    .line 250
    .line 251
    .line 252
    move-result-object p2

    .line 253
    invoke-interface {p1, p2, p0}, Ll/swl;->c(Landroid/content/Context;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 254
    .line 255
    .line 256
    move-result-object p0

    .line 257
    return-object p0

    .line 258
    :pswitch_2
    invoke-virtual {p2}, Ll/abe0;->f()Ljava/util/Map;

    .line 259
    .line 260
    .line 261
    move-result-object p3

    .line 262
    invoke-interface {p3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 263
    .line 264
    .line 265
    move-result-object p3

    .line 266
    move-object v2, p3

    .line 267
    check-cast v2, Ljava/lang/String;

    .line 268
    .line 269
    invoke-virtual {p2}, Ll/abe0;->f()Ljava/util/Map;

    .line 270
    .line 271
    .line 272
    move-result-object p3

    .line 273
    invoke-interface {p3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 274
    .line 275
    .line 276
    move-result-object p1

    .line 277
    move-object v3, p1

    .line 278
    check-cast v3, Ljava/lang/String;

    .line 279
    .line 280
    invoke-virtual {p2}, Ll/abe0;->f()Ljava/util/Map;

    .line 281
    .line 282
    .line 283
    move-result-object p1

    .line 284
    const-string p3, "extTabId"

    .line 285
    .line 286
    invoke-interface {p1, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 287
    .line 288
    .line 289
    move-result-object p1

    .line 290
    move-object v4, p1

    .line 291
    check-cast v4, Ljava/lang/String;

    .line 292
    .line 293
    invoke-virtual {p2}, Ll/abe0;->f()Ljava/util/Map;

    .line 294
    .line 295
    .line 296
    move-result-object p1

    .line 297
    const-string p3, "action"

    .line 298
    .line 299
    invoke-interface {p1, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 300
    .line 301
    .line 302
    move-result-object p1

    .line 303
    move-object v5, p1

    .line 304
    check-cast v5, Ljava/lang/String;

    .line 305
    .line 306
    invoke-virtual {p2}, Ll/abe0;->f()Ljava/util/Map;

    .line 307
    .line 308
    .line 309
    move-result-object p1

    .line 310
    const-string p3, "userId"

    .line 311
    .line 312
    invoke-interface {p1, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 313
    .line 314
    .line 315
    move-result-object p1

    .line 316
    move-object v6, p1

    .line 317
    check-cast v6, Ljava/lang/String;

    .line 318
    .line 319
    invoke-virtual {p2}, Ll/abe0;->b()Landroid/content/Context;

    .line 320
    .line 321
    .line 322
    move-result-object v1

    .line 323
    move-object v0, p0

    .line 324
    invoke-virtual/range {v0 .. v6}, Ll/q5k0;->Q(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 325
    .line 326
    .line 327
    move-result-object p0

    .line 328
    return-object p0

    .line 329
    :pswitch_3
    move-object v0, p0

    .line 330
    invoke-virtual {p2}, Ll/abe0;->b()Landroid/content/Context;

    .line 331
    .line 332
    .line 333
    move-result-object p0

    .line 334
    invoke-virtual {p2}, Ll/abe0;->f()Ljava/util/Map;

    .line 335
    .line 336
    .line 337
    move-result-object p1

    .line 338
    const-string p2, "subCode"

    .line 339
    .line 340
    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 341
    .line 342
    .line 343
    move-result-object p1

    .line 344
    check-cast p1, Ljava/lang/String;

    .line 345
    .line 346
    invoke-virtual {v0, p0, p1}, Ll/q5k0;->L(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 347
    .line 348
    .line 349
    move-result-object p0

    .line 350
    return-object p0

    .line 351
    :pswitch_4
    move-object v0, p0

    .line 352
    invoke-virtual {p2}, Ll/abe0;->b()Landroid/content/Context;

    .line 353
    .line 354
    .line 355
    move-result-object p0

    .line 356
    invoke-virtual {v0, p0}, Ll/q5k0;->T(Landroid/content/Context;)Landroid/content/Intent;

    .line 357
    .line 358
    .line 359
    move-result-object p0

    .line 360
    return-object p0

    .line 361
    :pswitch_5
    invoke-virtual {p2}, Ll/abe0;->b()Landroid/content/Context;

    .line 362
    .line 363
    .line 364
    move-result-object p0

    .line 365
    invoke-static {v1}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 366
    .line 367
    .line 368
    move-result-object p1

    .line 369
    invoke-static {p0, p1}, Ll/mbs;->s(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 370
    .line 371
    .line 372
    move-result-object p0

    .line 373
    return-object p0

    .line 374
    :pswitch_6
    move-object v0, p0

    .line 375
    invoke-virtual {v0, p2}, Ll/q5k0;->R(Ll/abe0;)Landroid/content/Intent;

    .line 376
    .line 377
    .line 378
    move-result-object p0

    .line 379
    return-object p0

    .line 380
    :pswitch_7
    move-object v0, p0

    .line 381
    invoke-virtual {v0, p2, p3}, Ll/q5k0;->W(Ll/abe0;Ll/z20;)Landroid/content/Intent;

    .line 382
    .line 383
    .line 384
    move-result-object p0

    .line 385
    return-object p0

    .line 386
    :pswitch_8
    move-object v0, p0

    .line 387
    const-string p0, "recallSourceId"

    .line 388
    .line 389
    invoke-static {p2, p0}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 390
    .line 391
    .line 392
    move-result-object p0

    .line 393
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 394
    .line 395
    .line 396
    move-result p3

    .line 397
    if-eqz p3, :cond_c

    .line 398
    .line 399
    const-string p0, "fromUserId"

    .line 400
    .line 401
    invoke-static {p2, p0}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 402
    .line 403
    .line 404
    move-result-object p0

    .line 405
    :cond_c
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 406
    .line 407
    .line 408
    move-result p3

    .line 409
    if-eqz p3, :cond_d

    .line 410
    .line 411
    const-string p0, "sourceUserId"

    .line 412
    .line 413
    invoke-static {p2, p0}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 414
    .line 415
    .line 416
    move-result-object p0

    .line 417
    :cond_d
    invoke-virtual {p2}, Ll/abe0;->b()Landroid/content/Context;

    .line 418
    .line 419
    .line 420
    move-result-object v1

    .line 421
    invoke-static {p2, v4}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 422
    .line 423
    .line 424
    move-result-object v2

    .line 425
    const-string p3, "source"

    .line 426
    .line 427
    invoke-static {p2, p3}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 428
    .line 429
    .line 430
    move-result-object v3

    .line 431
    const-string p3, "liveMode"

    .line 432
    .line 433
    invoke-static {p2, p3}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 434
    .line 435
    .line 436
    move-result-object v5

    .line 437
    invoke-static {p2, p1}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 438
    .line 439
    .line 440
    move-result-object v6

    .line 441
    move-object v4, p0

    .line 442
    invoke-virtual/range {v0 .. v6}, Ll/q5k0;->U(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 443
    .line 444
    .line 445
    move-result-object p0

    .line 446
    return-object p0

    .line 447
    :pswitch_9
    invoke-virtual {p2}, Ll/abe0;->b()Landroid/content/Context;

    .line 448
    .line 449
    .line 450
    move-result-object p0

    .line 451
    invoke-static {p2, v0}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 452
    .line 453
    .line 454
    move-result-object p1

    .line 455
    invoke-static {p0, p1}, Ll/bjo0;->b(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 456
    .line 457
    .line 458
    move-result-object p0

    .line 459
    return-object p0

    .line 460
    :pswitch_a
    invoke-virtual {p2}, Ll/abe0;->b()Landroid/content/Context;

    .line 461
    .line 462
    .line 463
    move-result-object p0

    .line 464
    invoke-static {v2}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 465
    .line 466
    .line 467
    move-result-object p1

    .line 468
    invoke-static {p0, p1}, Ll/mbs;->s(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 469
    .line 470
    .line 471
    move-result-object p0

    .line 472
    return-object p0

    .line 473
    :pswitch_b
    move-object v0, p0

    .line 474
    invoke-virtual {p2}, Ll/abe0;->b()Landroid/content/Context;

    .line 475
    .line 476
    .line 477
    move-result-object p0

    .line 478
    invoke-virtual {v0, p0}, Ll/q5k0;->J(Landroid/content/Context;)Landroid/content/Intent;

    .line 479
    .line 480
    .line 481
    move-result-object p0

    .line 482
    return-object p0

    .line 483
    :sswitch_data_0
    .sparse-switch
        -0x59899704 -> :sswitch_b
        -0x51dfb904 -> :sswitch_a
        -0x458e1c1f -> :sswitch_9
        -0x2910c6cb -> :sswitch_8
        0x32b0ec -> :sswitch_7
        0xc9e6d01 -> :sswitch_6
        0x14d4fec1 -> :sswitch_5
        0x2d088784 -> :sswitch_4
        0x2f9453c4 -> :sswitch_3
        0x33be9529 -> :sswitch_2
        0x37daa5b3 -> :sswitch_1
        0x3b67d490 -> :sswitch_0
    .end sparse-switch

    .line 484
    .line 485
    .line 486
    .line 487
    .line 488
    .line 489
    .line 490
    .line 491
    .line 492
    .line 493
    .line 494
    .line 495
    .line 496
    .line 497
    .line 498
    .line 499
    .line 500
    .line 501
    .line 502
    .line 503
    .line 504
    .line 505
    .line 506
    .line 507
    .line 508
    .line 509
    .line 510
    .line 511
    .line 512
    .line 513
    .line 514
    .line 515
    .line 516
    .line 517
    .line 518
    .line 519
    .line 520
    .line 521
    .line 522
    .line 523
    .line 524
    .line 525
    .line 526
    .line 527
    .line 528
    .line 529
    .line 530
    .line 531
    .line 532
    .line 533
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public f0(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    new-instance v0, Ll/j5k0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/j5k0;-><init>(Ll/q5k0;Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public g0(Landroid/content/Context;)V
    .locals 7

    .line 1
    const-string v5, "voice-live"

    .line 2
    .line 3
    const-string v6, ""

    .line 4
    .line 5
    const-string v1, ""

    .line 6
    .line 7
    const-string v2, ""

    .line 8
    .line 9
    const-string v3, ""

    .line 10
    .line 11
    const-string v4, ""

    .line 12
    .line 13
    move-object v0, p1

    .line 14
    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/live/external/page/rights/manage/LiveRightAct;->Z1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic h0(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/t4k0;->g(Lcom/p1/mobile/android/app/Act;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    sget-object p0, Ll/tbs;->f:Ll/j6t;

    .line 16
    .line 17
    invoke-virtual {p0, p1, p2}, Ll/j6t;->t(Landroid/content/Context;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic i0(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/t4k0;->g(Lcom/p1/mobile/android/app/Act;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Ll/mqr;->g()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    invoke-static {}, Ll/wtm;->e()Ll/wtm;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0, p1}, Ll/wtm;->j(Lcom/p1/mobile/android/app/Act;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    sget-object p0, Ll/tbs;->f:Ll/j6t;

    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/4 v1, 0x1

    .line 29
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->m(Z)Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->l(Z)Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "moment-nearby-match"

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->n(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->k()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p0, p1, v0}, Ll/j6t;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final synthetic j0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/t4k0;->g(Lcom/p1/mobile/android/app/Act;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Ll/mqr;->g()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    invoke-static {}, Ll/wtm;->e()Ll/wtm;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0, p1}, Ll/wtm;->j(Lcom/p1/mobile/android/app/Act;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    sget-object p0, Ll/tbs;->f:Ll/j6t;

    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/4 v1, 0x1

    .line 29
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->m(Z)Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->n(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->l(Z)Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->k()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-virtual {p0, p1, p2}, Ll/j6t;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic k0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/t4k0;->g(Lcom/p1/mobile/android/app/Act;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/t4k0;->h(Lcom/p1/mobile/android/app/Act;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->E(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->G(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const/4 p2, 0x0

    .line 31
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->y(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0, p5}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->F(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 36
    .line 37
    .line 38
    sget-object p2, Ll/tbs;->f:Ll/j6t;

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p2, p1, p0}, Ll/j6t;->f(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic l0(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/android/app/Act;

    if-eqz v0, :cond_1

    .line 2
    move-object v0, p1

    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 3
    invoke-virtual {p0, v0}, Ll/t4k0;->g(Lcom/p1/mobile/android/app/Act;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p0, v0}, Ll/t4k0;->g(Lcom/p1/mobile/android/app/Act;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    return-void

    .line 4
    :cond_1
    const-string v0, "link-share-voice-live"

    invoke-static {p3, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 5
    invoke-virtual {p0}, Ll/q5k0;->Y()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 6
    invoke-virtual {p0, p1, p4}, Ll/q5k0;->X(Landroid/content/Context;Ljava/lang/String;)Z

    return-void

    .line 7
    :cond_2
    invoke-static {p4, p2, p5, p3}, Ll/q5k0;->H(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object p4, p5

    move-object p3, p6

    move-object p5, p7

    move-object p6, p8

    .line 8
    invoke-virtual/range {p0 .. p6}, Ll/q5k0;->U(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    .line 9
    const-string p6, "virtualAvatar"

    invoke-static {p5, p6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p5

    if-nez p5, :cond_5

    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    move-result-object p5

    const/4 p6, 0x1

    .line 11
    invoke-virtual {p5, p6}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->Q(Z)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    move-result-object p5

    .line 12
    invoke-virtual {p5, p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->E(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    move-result-object p2

    .line 13
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    move-result-object p2

    .line 14
    invoke-virtual {p2, p9}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->G(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    move-result-object p2

    .line 15
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    const-string p5, ""

    if-eqz p3, :cond_3

    move-object p4, p5

    :cond_3
    invoke-virtual {p2, p4}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->z(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    move-result-object p2

    .line 16
    invoke-static {p10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-eqz p3, :cond_4

    move-object p10, p5

    .line 17
    :cond_4
    invoke-virtual {p2, p10}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->A(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    move-result-object p2

    .line 18
    invoke-virtual {p2, p11}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->T(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    move-result-object p2

    .line 19
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    move-result-object p2

    .line 20
    const-string p3, "LIVE_AUDIENCE_START_DATA"

    invoke-virtual {p0, p3, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 21
    :cond_5
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public final synthetic m0(Ljava/lang/String;Ll/kfn0;)Ll/kfn0;
    .locals 0

    .line 1
    invoke-virtual {p0, p2, p1}, Ll/q5k0;->r0(Ll/kfn0;Ljava/lang/String;)Ll/kfn0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic n0(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLjava/lang/String;Ll/kfn0;)V
    .locals 8

    .line 1
    invoke-static {p6}, Ll/v5k0;->n(Ll/kfn0;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p2}, Ll/q5k0;->y0(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, p6, Ll/kfn0;->a:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_3

    .line 20
    .line 21
    const-string p0, "my-fixed-room"

    .line 22
    .line 23
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    sget p0, Lcom/p1/mobile/putong/live/external/R$string;->D0:I

    .line 30
    .line 31
    invoke-static {p0}, Ll/r1j0;->f(I)V

    .line 32
    .line 33
    .line 34
    const-string p0, "tabId"

    .line 35
    .line 36
    invoke-static {p2, p0}, Ll/h3g0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    const-string p0, "start-push-follow"

    .line 41
    .line 42
    invoke-virtual {p0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-nez p0, :cond_2

    .line 47
    .line 48
    const-string p0, "\u5f53\u524d\u6ca1\u6709\u623f\u95f4\uff0c\u521b\u5efa\u4e00\u4e2a\u5427\uff5e"

    .line 49
    .line 50
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_2
    return-void

    .line 54
    :cond_3
    iget-object p3, p6, Ll/kfn0;->a:Ljava/util/List;

    .line 55
    .line 56
    const/4 p6, 0x0

    .line 57
    invoke-interface {p3, p6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p3

    .line 61
    check-cast p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

    .line 62
    .line 63
    iget-object v3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveId:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-nez p1, :cond_4

    .line 70
    .line 71
    const-string p1, "chatAssistantFixAnchorShowPackage"

    .line 72
    .line 73
    :goto_0
    move-object v5, p1

    .line 74
    goto :goto_1

    .line 75
    :cond_4
    if-eqz p4, :cond_5

    .line 76
    .line 77
    const-string p1, "chatAssistant"

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_5
    const-string p1, ""

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :goto_1
    const-string v7, ""

    .line 84
    .line 85
    const-string v2, ""

    .line 86
    .line 87
    const-string v4, "voice-chat-admin"

    .line 88
    .line 89
    move-object v0, p0

    .line 90
    move-object v1, p2

    .line 91
    move-object v6, p5

    .line 92
    invoke-virtual/range {v0 .. v7}, Ll/q5k0;->A0(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public final synthetic o0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    const-string p2, ""

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-virtual {p0, p1, p2, v0}, Ll/q5k0;->t0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/external/R$string;->R:I

    .line 15
    .line 16
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic p0(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    new-instance v0, Ll/b5k0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/b5k0;-><init>(Ll/q5k0;Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/module/api/LiveVerificationApi;->requestLiveVerification(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic q0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t4k0;->g(Lcom/p1/mobile/android/app/Act;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    invoke-static {p1, p2, p0}, Ll/mbs;->e0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final r0(Ll/kfn0;Ljava/lang/String;)Ll/kfn0;
    .locals 0

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-object p1

    .line 8
    :cond_0
    invoke-virtual {p1, p2}, Ll/kfn0;->h(Ljava/lang/String;)Ll/kfn0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public s0(Z)V
    .locals 0

    .line 1
    new-instance p0, Ll/p5k0;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/p5k0;-><init>(Z)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public t0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V
    .locals 1

    .line 1
    new-instance v0, Ll/v4k0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Ll/v4k0;-><init>(Ll/q5k0;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public u0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    move-object p3, p2

    .line 2
    move-object p2, p1

    .line 3
    move-object p1, p0

    .line 4
    new-instance p0, Ll/f5k0;

    .line 5
    .line 6
    move-object v0, p5

    .line 7
    move-object p5, p4

    .line 8
    move-object p4, p6

    .line 9
    move-object p6, v0

    .line 10
    invoke-direct/range {p0 .. p6}, Ll/f5k0;-><init>(Ll/q5k0;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public v0(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/q5k0;->L(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public w0(Landroid/content/Context;Ljava/lang/String;Z)V
    .locals 3

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    invoke-static {}, Ll/mqr;->j()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    sget p0, Lcom/p1/mobile/putong/live/external/R$string;->Z:I

    .line 10
    .line 11
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    instance-of v0, p1, Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    move-object v0, p1

    .line 20
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const/4 v1, 0x0

    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    move-object v0, v1

    .line 31
    goto :goto_0

    .line 32
    :cond_2
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Landroid/app/Activity;

    .line 43
    .line 44
    :goto_0
    instance-of v2, v0, Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    if-eqz v2, :cond_3

    .line 47
    .line 48
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_3
    move-object v0, v1

    .line 52
    :goto_1
    if-eqz v0, :cond_5

    .line 53
    .line 54
    if-eqz p3, :cond_4

    .line 55
    .line 56
    const/4 p1, 0x0

    .line 57
    invoke-virtual {p0, v0, p2, p1}, Ll/q5k0;->t0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_4
    invoke-virtual {p0, v0}, Ll/q5k0;->z0(Lcom/p1/mobile/android/app/Act;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_5
    if-eqz p3, :cond_6

    .line 66
    .line 67
    const-string p0, "liveAnchor"

    .line 68
    .line 69
    goto :goto_2

    .line 70
    :cond_6
    const-string p0, "startVoiceLive"

    .line 71
    .line 72
    :goto_2
    invoke-static {p0}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-static {p1, p0}, Ll/mbs;->s(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public x0(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q5k0;->S(Landroid/content/Context;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public y0(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q5k0;->T(Landroid/content/Context;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public z0(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/t4k0;->g(Lcom/p1/mobile/android/app/Act;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/t4k0;->h(Lcom/p1/mobile/android/app/Act;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    new-instance p0, Ll/i5k0;

    .line 14
    .line 15
    invoke-direct {p0, p1}, Ll/i5k0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method
