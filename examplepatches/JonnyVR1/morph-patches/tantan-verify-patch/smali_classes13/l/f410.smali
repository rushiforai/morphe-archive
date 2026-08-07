.class public Ll/f410;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static a:Ll/tn0;


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

.method public static declared-synchronized a(Ll/uow;Ll/q210$a;)Ll/dpl;
    .locals 2
    .param p1    # Ll/q210$a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-class v0, Ll/f410;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Ll/f410;->a:Ll/tn0;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Ll/tn0;

    .line 9
    .line 10
    invoke-direct {v1, p0, p1}, Ll/tn0;-><init>(Ll/uow;Ll/q210$a;)V

    .line 11
    .line 12
    .line 13
    sput-object v1, Ll/f410;->a:Ll/tn0;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    sget-object p1, Ll/f410;->a:Ll/tn0;

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Ll/tn0;->a(Ll/uow;)V

    .line 21
    .line 22
    .line 23
    sget-object p0, Ll/f410;->a:Ll/tn0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    .line 25
    monitor-exit v0

    .line 26
    return-object p0

    .line 27
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    throw p0
.end method

.method public static b(Ll/uow;Ll/q210$a;Ll/jt2;)Ll/bql;
    .locals 1
    .param p0    # Ll/uow;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ll/q210$a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/u94;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/u94;-><init>(Ll/uow;Ll/q210$a;Ll/jt2;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static c(Landroid/content/Context;IIZ)Lcom/momo/piplinemomoext/input/audio/a;
    .locals 1

    .line 1
    new-instance v0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p0, p3}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;-><init>(IILandroid/content/Context;Z)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static d(Landroid/content/Context;Lcom/momo/pipline/MomoInterface/MomoPipeline;Ll/q210$a;)Lcom/momo/pipline/MomoInterface/MomoCodec;
    .locals 0
    .param p0    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/q210$a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance p1, Ll/s410;

    .line 2
    .line 3
    invoke-direct {p1, p0, p2}, Ll/s410;-><init>(Landroid/content/Context;Ll/q210$a;)V

    .line 4
    .line 5
    .line 6
    return-object p1
.end method

.method public static e()Ll/m5m;
    .locals 1

    .line 1
    new-instance v0, Ll/fde0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/fde0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static declared-synchronized f()Ll/dpl;
    .locals 1

    .line 1
    const-class v0, Ll/f410;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    monitor-exit v0

    .line 5
    const/4 v0, 0x0

    .line 6
    return-object v0
.end method

.method public static declared-synchronized g()V
    .locals 2

    .line 1
    const-class v0, Ll/f410;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Ll/f410;->a:Ll/tn0;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {v1}, Ll/tn0;->X()V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    sput-object v1, Ll/f410;->a:Ll/tn0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception v1

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    :goto_0
    monitor-exit v0

    .line 18
    return-void

    .line 19
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    throw v1
.end method
