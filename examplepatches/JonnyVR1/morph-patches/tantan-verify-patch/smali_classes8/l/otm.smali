.class public Ll/otm;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile i:Ll/otm;


# instance fields
.field public a:I

.field public b:I

.field public c:Ll/byd0;

.field public d:Ll/jxd0;

.field public e:Ll/vxd0;

.field public f:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/p1/mobile/android/app/Act;",
            ">;"
        }
    .end annotation
.end field

.field public g:Z

.field public h:Ll/v8d0;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/otm;->a:I

    .line 6
    .line 7
    const/4 v1, 0x6

    .line 8
    iput v1, p0, Ll/otm;->b:I

    .line 9
    .line 10
    iput-boolean v0, p0, Ll/otm;->g:Z

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Ll/otm;->h:Ll/v8d0;

    .line 14
    .line 15
    return-void
.end method

.method public static A()V
    .locals 2

    .line 1
    sget-object v0, Ll/otm;->i:Ll/otm;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    sget-object v0, Ll/otm;->i:Ll/otm;

    .line 10
    .line 11
    iget-object v0, v0, Ll/otm;->f:Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    sget-object v0, Ll/otm;->i:Ll/otm;

    .line 20
    .line 21
    iget-object v0, v0, Ll/otm;->f:Ljava/lang/ref/WeakReference;

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->clear()V

    .line 24
    .line 25
    .line 26
    sget-object v0, Ll/otm;->i:Ll/otm;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    iput-object v1, v0, Ll/otm;->f:Ljava/lang/ref/WeakReference;

    .line 30
    .line 31
    sget-object v0, Ll/otm;->i:Ll/otm;

    .line 32
    .line 33
    iget-object v0, v0, Ll/otm;->h:Ll/v8d0;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    sget-object v0, Ll/otm;->i:Ll/otm;

    .line 42
    .line 43
    iget-object v0, v0, Ll/otm;->h:Ll/v8d0;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ll/v8d0;->c(Ll/gcj;)V

    .line 46
    .line 47
    .line 48
    sget-object v0, Ll/otm;->i:Ll/otm;

    .line 49
    .line 50
    iput-object v1, v0, Ll/otm;->h:Ll/v8d0;

    .line 51
    .line 52
    :cond_0
    sget-object v0, Ll/otm;->i:Ll/otm;

    .line 53
    .line 54
    iput-object v1, v0, Ll/otm;->c:Ll/byd0;

    .line 55
    .line 56
    sget-object v0, Ll/otm;->i:Ll/otm;

    .line 57
    .line 58
    iput-object v1, v0, Ll/otm;->e:Ll/vxd0;

    .line 59
    .line 60
    sget-object v0, Ll/otm;->i:Ll/otm;

    .line 61
    .line 62
    iput-object v1, v0, Ll/otm;->d:Ll/jxd0;

    .line 63
    .line 64
    sput-object v1, Ll/otm;->i:Ll/otm;

    .line 65
    .line 66
    :cond_1
    return-void
.end method

.method public static synthetic a(Ll/otm;ZLl/v8d0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/otm;->p(ZLl/v8d0;)V

    return-void
.end method

.method public static synthetic b(Ll/otm;Ljava/lang/String;ZLl/gcg0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/otm;->s(Ljava/lang/String;ZLl/gcg0;)V

    return-void
.end method

.method public static synthetic c(Ll/otm;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/otm;->q(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic d(Ll/otm;Ll/t8d0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/otm;->r(Ll/t8d0;)V

    return-void
.end method

.method public static bridge synthetic e(Ll/otm;)Ljava/lang/ref/WeakReference;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/otm;->f:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/otm;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/otm;->g:Z

    return p0
.end method

.method public static bridge synthetic g(Ll/otm;)Ll/v8d0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/otm;->h:Ll/v8d0;

    return-object p0
.end method

.method public static bridge synthetic h(Ll/otm;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/otm;->g:Z

    return-void
.end method

.method public static bridge synthetic i(Ll/otm;Ll/v8d0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/otm;->h:Ll/v8d0;

    return-void
.end method

.method public static bridge synthetic j(Ll/otm;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/otm;->k()Z

    move-result p0

    return p0
.end method

.method public static o()Ll/otm;
    .locals 2

    .line 1
    sget-object v0, Ll/otm;->i:Ll/otm;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/otm;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/otm;->i:Ll/otm;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/otm;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/otm;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/otm;->i:Ll/otm;

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
    sget-object v0, Ll/otm;->i:Ll/otm;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public B()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/otm;->c:Ll/byd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/otm;->c:Ll/byd0;

    .line 20
    .line 21
    invoke-static {}, Ll/pzi0;->o()J

    .line 22
    .line 23
    .line 24
    move-result-wide v1

    .line 25
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/otm;->d:Ll/jxd0;

    .line 33
    .line 34
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/otm;->e:Ll/vxd0;

    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p0, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method public C(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/otm;->f:Ljava/lang/ref/WeakReference;

    .line 7
    .line 8
    return-void
.end method

.method public D(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/otm;->a:I

    .line 2
    .line 3
    return-void
.end method

.method public E(Ljava/lang/Integer;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Ll/otm;->b:I

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public F()V
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    new-array p0, p0, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v0, "e_suggest_swipe_limit_popup_get_vip"

    .line 5
    .line 6
    const-string v1, "p_suggest_swipe_limit_popup"

    .line 7
    .line 8
    invoke-static {v0, v1, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public G()V
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    new-array p0, p0, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v0, "e_suggest_swipe_limit_popup_watch_video"

    .line 5
    .line 6
    const-string v1, "p_suggest_swipe_limit_popup"

    .line 7
    .line 8
    invoke-static {v0, v1, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final k()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/otm;->f:Ljava/lang/ref/WeakReference;

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
    iget-object v0, p0, Ll/otm;->f:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/otm;->f:Ljava/lang/ref/WeakReference;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-nez p0, :cond_0

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_0
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method public l()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/otm;->h:Ll/v8d0;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public m()Z
    .locals 4

    .line 1
    invoke-static {}, Ll/d79;->Z()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p0}, Ll/otm;->n()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/otm;->c:Ll/byd0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ljava/lang/Long;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 21
    .line 22
    .line 23
    move-result-wide v2

    .line 24
    invoke-static {v2, v3}, Ll/pzi0;->D(J)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    return v1

    .line 31
    :cond_1
    iget-object v0, p0, Ll/otm;->d:Ll/jxd0;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ljava/lang/Boolean;

    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    const/4 v2, 0x0

    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    return v2

    .line 47
    :cond_2
    iget-object v0, p0, Ll/otm;->e:Ll/vxd0;

    .line 48
    .line 49
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Ljava/lang/Integer;

    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iget p0, p0, Ll/otm;->b:I

    .line 60
    .line 61
    if-ge v0, p0, :cond_3

    .line 62
    .line 63
    return v1

    .line 64
    :cond_3
    return v2
.end method

.method public final n()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/otm;->c:Ll/byd0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/byd0;

    .line 6
    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "today_incentive_operation_time_"

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-wide/16 v2, 0x0

    .line 30
    .line 31
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Ll/otm;->c:Ll/byd0;

    .line 39
    .line 40
    :cond_0
    iget-object v0, p0, Ll/otm;->e:Ll/vxd0;

    .line 41
    .line 42
    if-nez v0, :cond_1

    .line 43
    .line 44
    new-instance v0, Ll/vxd0;

    .line 45
    .line 46
    new-instance v1, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    const-string v2, "today_incentive_watch_count_"

    .line 49
    .line 50
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    const/4 v2, 0x0

    .line 69
    invoke-direct {v0, v1, v2}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 70
    .line 71
    .line 72
    iput-object v0, p0, Ll/otm;->e:Ll/vxd0;

    .line 73
    .line 74
    :cond_1
    iget-object v0, p0, Ll/otm;->d:Ll/jxd0;

    .line 75
    .line 76
    if-nez v0, :cond_2

    .line 77
    .line 78
    new-instance v0, Ll/jxd0;

    .line 79
    .line 80
    new-instance v1, Ljava/lang/StringBuilder;

    .line 81
    .line 82
    const-string v2, "today_incentive_close_"

    .line 83
    .line 84
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 103
    .line 104
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 105
    .line 106
    .line 107
    iput-object v0, p0, Ll/otm;->d:Ll/jxd0;

    .line 108
    .line 109
    :cond_2
    return-void
.end method

.method public final synthetic p(ZLl/v8d0;)V
    .locals 1

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput-object p2, p0, Ll/otm;->h:Ll/v8d0;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/otm;->w()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic q(Ljava/lang/Integer;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Ll/otm;->D(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-lez p0, :cond_0

    .line 13
    .line 14
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/dkb;->H9()Lrx/c;

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final synthetic r(Ll/t8d0;)V
    .locals 1

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Ll/otm;->g:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/otm;->k()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->G1:Ll/cob;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/cob;->g3()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance v0, Ll/ltm;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/ltm;-><init>(Ll/otm;)V

    .line 21
    .line 22
    .line 23
    new-instance p0, Ll/v60;

    .line 24
    .line 25
    invoke-direct {p0}, Ll/v60;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public final synthetic s(Ljava/lang/String;ZLl/gcg0;)V
    .locals 3

    .line 1
    new-instance v0, Ll/s70$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/s70$a;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v1}, Ll/u2n;->g(Z)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/r6;->e(Ljava/util/List;)Ll/r6;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/s70$a;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/s70$a;->i()Ll/s70;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Ll/otm;->f:Ljava/lang/ref/WeakReference;

    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Landroid/content/Context;

    .line 28
    .line 29
    new-instance v2, Ll/otm$b;

    .line 30
    .line 31
    invoke-direct {v2, p0, p1, p2, p3}, Ll/otm$b;-><init>(Ll/otm;Ljava/lang/String;ZLl/gcg0;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1, p1, v0, v2}, Ll/v8d0;->b(Landroid/content/Context;Ljava/lang/String;Ll/s70;Ll/w8d0;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public t()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/otm;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, -0x1

    .line 8
    return p0

    .line 9
    :cond_0
    iget p0, p0, Ll/otm;->a:I

    .line 10
    .line 11
    return p0
.end method

.method public final u(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/otm;->h:Ll/v8d0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/otm;->k()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/otm;->f:Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    const-string v1, "ca-app-pub-6567608331519569/9203957625"

    .line 20
    .line 21
    invoke-virtual {p0, v1, p1}, Ll/otm;->x(Ljava/lang/String;Z)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/mtm;

    .line 30
    .line 31
    invoke-direct {v1, p0, p1}, Ll/mtm;-><init>(Ll/otm;Z)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public v(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/otm;->u(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public w()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/otm;->g:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/otm;->h:Ll/v8d0;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/otm;->k()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Ll/otm;->h:Ll/v8d0;

    .line 19
    .line 20
    new-instance v1, Ll/otm$a;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/otm$a;-><init>(Ll/otm;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ll/v8d0;->c(Ll/gcj;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/otm;->h:Ll/v8d0;

    .line 29
    .line 30
    iget-object v1, p0, Ll/otm;->f:Ljava/lang/ref/WeakReference;

    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Landroid/app/Activity;

    .line 37
    .line 38
    new-instance v2, Ll/ktm;

    .line 39
    .line 40
    invoke-direct {v2, p0}, Ll/ktm;-><init>(Ll/otm;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1, v2}, Ll/v8d0;->d(Landroid/app/Activity;Ll/bp50;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    const/4 v0, 0x1

    .line 48
    invoke-virtual {p0, v0}, Ll/otm;->u(Z)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final x(Ljava/lang/String;Z)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Lrx/c<",
            "Ll/v8d0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/ntm;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/ntm;-><init>(Ll/otm;Ljava/lang/String;Z)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public y()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/otm;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/otm;->B()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/otm;->d:Ll/jxd0;

    .line 8
    .line 9
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public z()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/otm;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/otm;->B()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/otm;->e:Ll/vxd0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/lang/Integer;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    add-int/lit8 v0, v0, 0x1

    .line 20
    .line 21
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    return-void
.end method
