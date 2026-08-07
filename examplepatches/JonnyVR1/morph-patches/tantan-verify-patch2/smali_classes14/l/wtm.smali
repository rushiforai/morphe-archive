.class public Ll/wtm;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/wtm$a;
    }
.end annotation


# instance fields
.field public final a:Ll/ft5;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ft5;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/ft5;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/wtm;->a:Ll/ft5;

    .line 10
    .line 11
    return-void
.end method

.method public synthetic constructor <init>(Ll/xtm;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ll/wtm;-><init>()V

    return-void
.end method

.method public static synthetic a(Ll/wtm;Lcom/p1/mobile/android/app/Act;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wtm;->g(Lcom/p1/mobile/android/app/Act;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic b(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/live/base/R$string;->f:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 2

    .line 1
    const-string p1, "[live]verification"

    .line 2
    .line 3
    const-string v0, "Ind verification patched,start live"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object p1, Ll/tbs;->f:Ll/j6t;

    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->m(Z)Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "p_live"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->n(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->k()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p1, p0, v0}, Ll/j6t;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveVerificationApi;->requestLiveVerification()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static synthetic d(Ll/wtm;Lcom/p1/mobile/android/app/Act;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wtm;->f(Lcom/p1/mobile/android/app/Act;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static e()Ll/wtm;
    .locals 1

    .line 1
    invoke-static {}, Ll/wtm$a;->a()Ll/wtm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public final synthetic f(Lcom/p1/mobile/android/app/Act;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveVerificationApi;->noVerificationInfo()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    const-string p2, "[live]verification"

    .line 8
    .line 9
    const-string v0, "Ind verification refreshed"

    .line 10
    .line 11
    invoke-static {p2, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/wtm;->i(Lcom/p1/mobile/android/app/Act;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final synthetic g(Lcom/p1/mobile/android/app/Act;Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Ind startLive bind Phone result ="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "[live]verification"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    if-eqz p2, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ll/wtm;->i(Lcom/p1/mobile/android/app/Act;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public final h()Z
    .locals 3

    .line 1
    invoke-static {}, Ll/mbs;->J()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p0, :cond_4

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    goto :goto_2

    .line 13
    :cond_0
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const/4 v2, 0x0

    .line 22
    if-eqz v1, :cond_2

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-nez p0, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    move p0, v2

    .line 38
    goto :goto_1

    .line 39
    :cond_2
    :goto_0
    move p0, v0

    .line 40
    :goto_1
    invoke-static {}, Ll/mqr;->g()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_3

    .line 45
    .line 46
    if-nez p0, :cond_3

    .line 47
    .line 48
    return v0

    .line 49
    :cond_3
    return v2

    .line 50
    :cond_4
    :goto_2
    return v0
.end method

.method public final i(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveVerificationApi;->noVerificationInfo()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "[live]verification"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string v0, "Ind verification no verification info,pull it first"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Ll/ttm;

    .line 15
    .line 16
    invoke-direct {v0, p0, p1}, Ll/ttm;-><init>(Ll/wtm;Lcom/p1/mobile/android/app/Act;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/module/api/LiveVerificationApi;->requestLiveVerification(Ll/y20;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-static {}, Ll/mbs;->G()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->getLiveVerification()Ll/cvu;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-interface {v0}, Ll/cvu;->a()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    const-string p0, "Ind verification passed,start live"

    .line 38
    .line 39
    invoke-static {v1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    sget-object p0, Ll/tbs;->f:Ll/j6t;

    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const/4 v1, 0x0

    .line 49
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->m(Z)Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const-string v1, "p_live"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->n(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->k()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p0, p1, v0}, Ll/j6t;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveVerificationApi;->patchUserAsPersonalAnchor()Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    new-instance v1, Ll/utm;

    .line 76
    .line 77
    invoke-direct {v1, p1}, Ll/utm;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 78
    .line 79
    .line 80
    new-instance p1, Ll/vtm;

    .line 81
    .line 82
    invoke-direct {p1}, Ll/vtm;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-static {v1, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    iget-object p0, p0, Ll/wtm;->a:Ll/ft5;

    .line 94
    .line 95
    invoke-virtual {p0, p1}, Ll/ft5;->a(Ll/kcg0;)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public j(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wtm;->a:Ll/ft5;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ft5;->c()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/wtm;->h()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string v0, "[live]verification"

    .line 13
    .line 14
    const-string v1, "Ind startLive need bind Phone"

    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget v0, Lcom/p1/mobile/putong/live/base/R$string;->o:I

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {p1, v0}, Ll/mbs;->d0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/stm;

    .line 42
    .line 43
    invoke-direct {v1, p0, p1}, Ll/stm;-><init>(Ll/wtm;Lcom/p1/mobile/android/app/Act;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iget-object p0, p0, Ll/wtm;->a:Ll/ft5;

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Ll/ft5;->a(Ll/kcg0;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_0
    invoke-virtual {p0, p1}, Ll/wtm;->i(Lcom/p1/mobile/android/app/Act;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method
