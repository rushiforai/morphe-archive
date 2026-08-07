.class public final Ll/w0n;
.super Ll/a0n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/a0n<",
        "Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/zzm;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/a0n;-><init>(Ll/zzm;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m(Ll/w0n;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/LiveSchema;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/w0n;->q(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/LiveSchema;)V

    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->liveSchemas:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->liveSchemas:Ljava/util/List;

    .line 24
    .line 25
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-nez p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public static synthetic o(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 8
    .line 9
    const v1, 0xa067

    .line 10
    .line 11
    .line 12
    if-ne v0, v1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/R$string;->u4:I

    .line 21
    .line 22
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/LiveSchema;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->liveSchemas:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/p1/mobile/putong/core/data/LiveSchema;

    .line 17
    .line 18
    return-object p0
.end method


# virtual methods
.method public e()V
    .locals 0

    .line 1
    return-void
.end method

.method public f()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 2
    .line 3
    iget-object v1, v0, Ll/zzm;->m:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 10
    .line 11
    iget-object v0, v0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extra:Ljava/lang/String;

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    invoke-virtual {v2, v0, v3}, Lcom/p1/mobile/putong/core/api/g;->wp(Ljava/lang/String;Z)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v2, Ll/s0n;

    .line 23
    .line 24
    invoke-direct {v2}, Ll/s0n;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v2, Ll/t0n;

    .line 32
    .line 33
    invoke-direct {v2}, Ll/t0n;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v0, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v2, Ll/u0n;

    .line 53
    .line 54
    invoke-direct {v2, p0, v1}, Ll/u0n;-><init>(Ll/w0n;Lcom/p1/mobile/android/app/Act;)V

    .line 55
    .line 56
    .line 57
    new-instance v1, Ll/v0n;

    .line 58
    .line 59
    invoke-direct {v1}, Ll/v0n;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-static {v2, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    :cond_0
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 70
    .line 71
    invoke-virtual {v0}, Ll/zzm;->K()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    sget-object v2, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 80
    .line 81
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-eqz v1, :cond_1

    .line 86
    .line 87
    const-string v0, "p_suggest_users_home_view"

    .line 88
    .line 89
    :cond_1
    iget-object p0, p0, Ll/a0n;->a:Ll/zzm;

    .line 90
    .line 91
    iget-object p0, p0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 92
    .line 93
    invoke-static {p0, v0}, Ll/a1n;->d(Lcom/p1/mobile/putong/data/PushMessage;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public i(Ll/v0t;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/v0t;->dismiss()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public bridge synthetic j(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/w0n;->r(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k()Z
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public l()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/zzm;->K()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    sget-object v2, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    const-string v0, "p_suggest_users_home_view"

    .line 20
    .line 21
    :cond_0
    iget-object p0, p0, Ll/a0n;->a:Ll/zzm;

    .line 22
    .line 23
    iget-object p0, p0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 24
    .line 25
    invoke-static {p0, v0}, Ll/a1n;->e(Lcom/p1/mobile/putong/data/PushMessage;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic q(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/LiveSchema;)V
    .locals 3

    .line 1
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/LiveSchema;->schema:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    new-instance v0, Ll/abe0$a;

    .line 8
    .line 9
    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-direct {v0, p1, v1}, Ll/abe0$a;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ll/abe0$a;->d()Ll/abe0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ll/abe0;->d()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const-string v2, "officialChannel"

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/abe0;->f()Ljava/util/Map;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const-string v1, "liveId"

    .line 37
    .line 38
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-nez v1, :cond_0

    .line 49
    .line 50
    iget-object p0, p0, Ll/a0n;->a:Ll/zzm;

    .line 51
    .line 52
    iget-object p0, p0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->traceId:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {v0, p0}, Ll/a1n;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_0
    invoke-static {p1, p2}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public r(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/a0n;->a:Ll/zzm;

    .line 2
    .line 3
    iget-object v0, p0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 4
    .line 5
    iget-object p0, p0, Ll/zzm;->i:Ll/iam;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->j(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/android/app/Act;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
