.class public Ll/ez0;
.super Ll/aoi0;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP_PREFIX:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation


# static fields
.field public static volatile c:Ll/ez0;

.field public static final d:Ljava/util/concurrent/Executor;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public static final e:Ljava/util/concurrent/Executor;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field


# instance fields
.field public a:Ll/aoi0;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public final b:Ll/aoi0;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/cz0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/cz0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/ez0;->d:Ljava/util/concurrent/Executor;

    .line 7
    .line 8
    new-instance v0, Ll/dz0;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/dz0;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/ez0;->e:Ljava/util/concurrent/Executor;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/aoi0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/jsd;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/jsd;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ez0;->b:Ll/aoi0;

    .line 10
    .line 11
    iput-object v0, p0, Ll/ez0;->a:Ll/aoi0;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic d(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/ez0;->g()Ll/ez0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/ez0;->c(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/ez0;->g()Ll/ez0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/ez0;->a(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static f()Ljava/util/concurrent/Executor;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    sget-object v0, Ll/ez0;->e:Ljava/util/concurrent/Executor;

    .line 2
    .line 3
    return-object v0
.end method

.method public static g()Ll/ez0;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    sget-object v0, Ll/ez0;->c:Ll/ez0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ll/ez0;->c:Ll/ez0;

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    const-class v0, Ll/ez0;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    sget-object v1, Ll/ez0;->c:Ll/ez0;

    .line 12
    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    new-instance v1, Ll/ez0;

    .line 16
    .line 17
    invoke-direct {v1}, Ll/ez0;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v1, Ll/ez0;->c:Ll/ez0;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception v1

    .line 24
    goto :goto_1

    .line 25
    :cond_1
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    sget-object v0, Ll/ez0;->c:Ll/ez0;

    .line 27
    .line 28
    return-object v0

    .line 29
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    throw v1
.end method


# virtual methods
.method public a(Ljava/lang/Runnable;)V
    .locals 0
    .param p1    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/ez0;->a:Ll/aoi0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/aoi0;->a(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ez0;->a:Ll/aoi0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/aoi0;->b()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c(Ljava/lang/Runnable;)V
    .locals 0
    .param p1    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/ez0;->a:Ll/aoi0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/aoi0;->c(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
