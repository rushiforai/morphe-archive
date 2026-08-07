.class public Ll/djf0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static f:J

.field public static g:Ll/djf0;


# instance fields
.field public final a:Ll/byd0;

.field public final b:Ll/jxd0;

.field public c:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/android/app/Act;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/android/app/Act;",
            ">;"
        }
    .end annotation
.end field


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
    new-instance v0, Ll/byd0;

    .line 5
    .line 6
    const-wide/16 v1, 0x0

    .line 7
    .line 8
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const-string v2, "sign_up_back_last_to_background_time"

    .line 13
    .line 14
    invoke-direct {v0, v2, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/djf0;->a:Ll/byd0;

    .line 18
    .line 19
    new-instance v0, Ll/jxd0;

    .line 20
    .line 21
    const-string v1, "sign_up_back_has_seen_back_button"

    .line 22
    .line 23
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Ll/djf0;->b:Ll/jxd0;

    .line 29
    .line 30
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iput-object v0, p0, Ll/djf0;->c:Lrx/subjects/a;

    .line 35
    .line 36
    new-instance v0, Ll/bjf0;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Ll/bjf0;-><init>(Ll/djf0;)V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Ll/djf0;->d:Ll/y20;

    .line 42
    .line 43
    new-instance v0, Ll/cjf0;

    .line 44
    .line 45
    invoke-direct {v0, p0}, Ll/cjf0;-><init>(Ll/djf0;)V

    .line 46
    .line 47
    .line 48
    iput-object v0, p0, Ll/djf0;->e:Ll/y20;

    .line 49
    .line 50
    return-void
.end method

.method public static synthetic a(Ll/djf0;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/djf0;->e(Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method

.method public static synthetic b(Ll/djf0;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/djf0;->d(Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method

.method public static c()Ll/djf0;
    .locals 2

    .line 1
    sget-object v0, Ll/djf0;->g:Ll/djf0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/djf0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/djf0;->g:Ll/djf0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/djf0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/djf0;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/djf0;->g:Ll/djf0;

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
    sget-object v0, Ll/djf0;->g:Ll/djf0;

    .line 27
    .line 28
    return-object v0
.end method

.method public static f(Lcom/p1/mobile/putong/data/AuthData;)Ll/wyd0;
    .locals 3

    .line 1
    new-instance v0, Ll/wyd0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "last_signin_type"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v1, ""

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-direct {v0, p0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 23
    .line 24
    .line 25
    return-object v0
.end method

.method public static g()Ll/wyd0;
    .locals 4

    .line 1
    new-instance v0, Ll/wyd0;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const-string v3, "last_signin_type"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static i()V
    .locals 1

    .line 1
    sget-object v0, Ll/djf0;->g:Ll/djf0;

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
    sget-object v0, Ll/djf0;->g:Ll/djf0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/djf0;->l()V

    .line 12
    .line 13
    .line 14
    sget-object v0, Ll/djf0;->g:Ll/djf0;

    .line 15
    .line 16
    iget-object v0, v0, Ll/djf0;->c:Lrx/subjects/a;

    .line 17
    .line 18
    invoke-virtual {v0}, Lrx/subjects/a;->onCompleted()V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    sput-object v0, Ll/djf0;->g:Ll/djf0;

    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public static j(Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/djf0;->g()Ll/wyd0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ljava/lang/CharSequence;

    .line 10
    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-static {p0}, Ll/djf0;->f(Lcom/p1/mobile/putong/data/AuthData;)Ll/wyd0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {}, Ll/djf0;->g()Ll/wyd0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public static k()Ll/jxd0;
    .locals 4

    .line 1
    new-instance v0, Ll/jxd0;

    .line 2
    .line 3
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const-string v3, "remember_sign_in_dialog_enable"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;Z)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method


# virtual methods
.method public final synthetic d(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    instance-of p1, p1, Ll/x5m;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/djf0;->a:Ll/byd0;

    .line 6
    .line 7
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final synthetic e(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sput-wide v0, Ll/djf0;->f:J

    .line 6
    .line 7
    iget-object p0, p0, Ll/djf0;->c:Lrx/subjects/a;

    .line 8
    .line 9
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public h()V
    .locals 3

    .line 1
    invoke-static {}, Ll/srf;->a()Ll/srf;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/android/app/ExtraActLifecycle;->onStopToBackground:Lcom/p1/mobile/android/app/ExtraActLifecycle;

    .line 6
    .line 7
    iget-object v2, p0, Ll/djf0;->d:Ll/y20;

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/srf;->b(Lcom/p1/mobile/android/app/ExtraActLifecycle;Ll/y20;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/srf;->a()Ll/srf;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v1, Lcom/p1/mobile/android/app/ExtraActLifecycle;->onResumeFromAppStartOrBackground:Lcom/p1/mobile/android/app/ExtraActLifecycle;

    .line 17
    .line 18
    iget-object p0, p0, Ll/djf0;->e:Ll/y20;

    .line 19
    .line 20
    invoke-virtual {v0, v1, p0}, Ll/srf;->b(Lcom/p1/mobile/android/app/ExtraActLifecycle;Ll/y20;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public l()V
    .locals 3

    .line 1
    invoke-static {}, Ll/srf;->a()Ll/srf;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/android/app/ExtraActLifecycle;->onStopToBackground:Lcom/p1/mobile/android/app/ExtraActLifecycle;

    .line 6
    .line 7
    iget-object v2, p0, Ll/djf0;->d:Ll/y20;

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/srf;->d(Lcom/p1/mobile/android/app/ExtraActLifecycle;Ll/y20;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/srf;->a()Ll/srf;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v1, Lcom/p1/mobile/android/app/ExtraActLifecycle;->onResumeFromAppStartOrBackground:Lcom/p1/mobile/android/app/ExtraActLifecycle;

    .line 17
    .line 18
    iget-object p0, p0, Ll/djf0;->e:Ll/y20;

    .line 19
    .line 20
    invoke-virtual {v0, v1, p0}, Ll/srf;->d(Lcom/p1/mobile/android/app/ExtraActLifecycle;Ll/y20;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
