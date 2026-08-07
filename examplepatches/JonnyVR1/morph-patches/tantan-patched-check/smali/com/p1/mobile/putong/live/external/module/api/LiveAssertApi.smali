.class public Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final KEY_LIVE_ASSETS:Ljava/lang/String; = "key_live_assets"

.field private static canUseMaskMode:Z

.field private static canUserStartLiveNow:Z

.field private static liveAssetsWrapper:Ll/gwr;

.field private static final userStartLiveObs:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static final userStartVoiceLiveObs:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private deviceTotalMemory:D


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->userStartLiveObs:Lrx/subjects/b;

    .line 6
    .line 7
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->userStartVoiceLiveObs:Lrx/subjects/a;

    .line 12
    .line 13
    invoke-static {}, Ll/mbs;->e()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->getAuthData()Ll/gxd0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/ixd0;->c()Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/bwr;

    .line 38
    .line 39
    invoke-direct {v1}, Ll/bwr;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->deviceTotalMemory:D

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->refreshLiveAssets()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Ll/pf60;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Ljava/lang/CharSequence;

    .line 8
    .line 9
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 3

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/gwr;

    .line 8
    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v2, "key_live_assets"

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object v2, p0, Lcom/p1/mobile/putong/data/AuthData;->userId:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-direct {v0, v1}, Ll/gwr;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    sput-object v0, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->liveAssetsWrapper:Ll/gwr;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/data/AuthData;->userId:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->checkVoiceLivePermission(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    const-string p0, "[live]assert_api"

    .line 37
    .line 38
    const-string v0, "authData is NULL"

    .line 39
    .line 40
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x0

    .line 44
    sput-object p0, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->liveAssetsWrapper:Ll/gwr;

    .line 45
    .line 46
    return-void
.end method

.method private static checkVoiceLivePermission(Ljava/lang/String;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->liveAssetsWrapper:Ll/gwr;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "[live]assert_api"

    .line 6
    .line 7
    const-string v1, "liveAssetsWrapper is Null"

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->userStartVoiceLiveObs:Lrx/subjects/a;

    .line 13
    .line 14
    new-instance v1, Ll/pf60;

    .line 15
    .line 16
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 17
    .line 18
    invoke-direct {v1, p0, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveAssets;

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAssets;->livePermissionControl:Lcom/p1/mobile/putong/live/base/data/BLivePermissionControl;

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePermissionControl;->canStartVoiceLive:Z

    .line 38
    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    sget-object v0, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->userStartVoiceLiveObs:Lrx/subjects/a;

    .line 42
    .line 43
    new-instance v1, Ll/pf60;

    .line 44
    .line 45
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 46
    .line 47
    invoke-direct {v1, p0, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 4

    .line 1
    new-instance v0, Ll/gwr;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "key_live_assets"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-direct {v0, v1}, Ll/gwr;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveAssets:Lcom/p1/mobile/putong/live/base/data/BLiveAssets;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    sget-object v0, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->liveAssetsWrapper:Ll/gwr;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveAssets:Lcom/p1/mobile/putong/live/base/data/BLiveAssets;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveAssets:Lcom/p1/mobile/putong/live/base/data/BLiveAssets;

    .line 43
    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAssets;->livePermissionControl:Lcom/p1/mobile/putong/live/base/data/BLivePermissionControl;

    .line 47
    .line 48
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePermissionControl;->canUserStartLive:Z

    .line 49
    .line 50
    sput-boolean v1, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->canUserStartLiveNow:Z

    .line 51
    .line 52
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePermissionControl;->canUseMaskMode:Z

    .line 53
    .line 54
    sput-boolean v0, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->canUseMaskMode:Z

    .line 55
    .line 56
    sget-object v0, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->userStartLiveObs:Lrx/subjects/b;

    .line 57
    .line 58
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 66
    .line 67
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveAssets:Lcom/p1/mobile/putong/live/base/data/BLiveAssets;

    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAssets;->livePermissionControl:Lcom/p1/mobile/putong/live/base/data/BLivePermissionControl;

    .line 70
    .line 71
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePermissionControl;->canStartVoiceLive:Z

    .line 72
    .line 73
    sget-object v1, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->userStartVoiceLiveObs:Lrx/subjects/a;

    .line 74
    .line 75
    new-instance v2, Ll/pf60;

    .line 76
    .line 77
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-direct {v2, v3, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1, v2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveVerificationApi;->noVerificationInfo()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_0

    .line 96
    .line 97
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveVerificationApi;->requestLiveVerification()V

    .line 98
    .line 99
    .line 100
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    const-string v1, "server:"

    .line 103
    .line 104
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 108
    .line 109
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveAssets:Lcom/p1/mobile/putong/live/base/data/BLiveAssets;

    .line 110
    .line 111
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    const-string v0, "[live]assert_api"

    .line 119
    .line 120
    invoke-static {v0, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    :cond_1
    return-void
.end method

.method public static synthetic e(Ll/pf60;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljava/lang/Boolean;

    .line 4
    .line 5
    return-object p0
.end method

.method public static getCanUseMaskMode()Z
    .locals 1

    const/4 v0, 0x1

    return v0

    .line 1
    sget-boolean v0, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->canUseMaskMode:Z

    .line 2
    .line 3
    return v0
.end method

.method public static getUserStartLiveObs()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->userStartLiveObs:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static getUserStartVoiceLiveObs()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->userStartVoiceLiveObs:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/cwr;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/cwr;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/dwr;

    .line 17
    .line 18
    invoke-direct {v1}, Ll/dwr;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    return-object v0
.end method

.method public static isCanStartLive()Z
    .locals 3

    const/4 v0, 0x1

    return v0

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->liveAssetsWrapper:Ll/gwr;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const-string v0, "[live]assert_api"

    .line 7
    .line 8
    const-string v2, "liveAssetsWrapper is Null"

    .line 9
    .line 10
    invoke-static {v0, v2}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return v1

    .line 14
    :cond_0
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveAssets;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAssets;->livePermissionControl:Lcom/p1/mobile/putong/live/base/data/BLivePermissionControl;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePermissionControl;->canUserStartLive:Z

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    return v0

    .line 32
    :cond_1
    return v1
.end method

.method public static isCanUserStartLiveNow()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->isCanStartLive()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    sget-boolean v0, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->canUserStartLiveNow:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    return v0

    .line 14
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 15
    return v0
.end method

.method public static isUserStartVoiceLiveEnable()Z
    .locals 4

    const/4 v0, 0x1

    return v0

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->userStartVoiceLiveObs:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/pf60;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    iget-object v2, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v2, Ljava/lang/CharSequence;

    .line 16
    .line 17
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-nez v2, :cond_1

    .line 26
    .line 27
    return v1

    .line 28
    :cond_1
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 29
    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    return v1

    .line 33
    :cond_2
    check-cast v0, Ljava/lang/Boolean;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    return v0
.end method

.method public static updateCanUserStartLive(Z)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "updateCanUserStartLive:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "[live]assert_api"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    new-instance v0, Ll/gwr;

    .line 21
    .line 22
    new-instance v1, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v2, "key_live_assets"

    .line 25
    .line 26
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-direct {v0, v1}, Ll/gwr;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveAssets;

    .line 48
    .line 49
    if-nez v1, :cond_0

    .line 50
    .line 51
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveAssets;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveAssets;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    :cond_0
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAssets;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAssets;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAssets;->livePermissionControl:Lcom/p1/mobile/putong/live/base/data/BLivePermissionControl;

    .line 60
    .line 61
    iput-boolean p0, v2, Lcom/p1/mobile/putong/live/base/data/BLivePermissionControl;->canUserStartLive:Z

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    sput-boolean p0, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->canUserStartLiveNow:Z

    .line 67
    .line 68
    sget-object v0, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->userStartLiveObs:Lrx/subjects/b;

    .line 69
    .line 70
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    if-eqz p0, :cond_1

    .line 78
    .line 79
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveVerificationApi;->requestLiveVerification()V

    .line 80
    .line 81
    .line 82
    :cond_1
    return-void
.end method


# virtual methods
.method public clean()V
    .locals 1

    .line 1
    const-string p0, "[live]assert_api"

    .line 2
    .line 3
    const-string v0, "LiveAssertApi clean:"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    sput-boolean p0, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->canUserStartLiveNow:Z

    .line 10
    .line 11
    return-void
.end method

.method public refreshLiveAssets()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->deviceTotalMemory:D

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmpl-double v0, v0, v2

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    :try_start_0
    sget-object v0, Ll/tbs;->a:Landroid/app/Application;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/beatles/utils/DeviceUtil;->m(Landroid/content/Context;)D

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->deviceTotalMemory:D
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catch_0
    iput-wide v2, p0, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->deviceTotalMemory:D

    .line 19
    .line 20
    :cond_0
    :goto_0
    const-string v0, "/live-assets"

    .line 21
    .line 22
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Ll/rnl;->l(Ljava/lang/String;)Ll/rnl;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ll/rnl;->p()Ll/rnl$a;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "with"

    .line 35
    .line 36
    const-string v2, "livecontrol"

    .line 37
    .line 38
    invoke-virtual {v0, v1, v2}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->deviceTotalMemory:D

    .line 43
    .line 44
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const-string v1, "device_totalMemory"

    .line 49
    .line 50
    invoke-virtual {v0, v1, p0}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Ll/rnl$a;->d()Ll/rnl;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    const-string v0, "getLiveAssets"

    .line 59
    .line 60
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/external/module/api/LiveExternalApi;->buildLiveReadReq(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    new-instance v0, Ll/ewr;

    .line 65
    .line 66
    invoke-direct {v0}, Ll/ewr;-><init>()V

    .line 67
    .line 68
    .line 69
    new-instance v1, Ll/fwr;

    .line 70
    .line 71
    invoke-direct {v1}, Ll/fwr;-><init>()V

    .line 72
    .line 73
    .line 74
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 79
    .line 80
    .line 81
    return-void
.end method
