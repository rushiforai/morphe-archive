.class public Ll/gta;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile b:Ll/gta;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/api/inject/provider/CoreGlobalServiceHolder;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/core/api/inject/provider/CoreGlobalServiceHolder;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreGlobalServiceHolder;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/gta;->a:Lcom/p1/mobile/putong/core/api/inject/provider/CoreGlobalServiceHolder;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/b17;->a()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static e()Ll/gta;
    .locals 2

    .line 1
    sget-object v0, Ll/gta;->b:Ll/gta;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/gta;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/gta;->b:Ll/gta;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/gta;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/gta;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/gta;->b:Ll/gta;

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
    sget-object v0, Ll/gta;->b:Ll/gta;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnovationProviderInterface;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gta;->a:Lcom/p1/mobile/putong/core/api/inject/provider/CoreGlobalServiceHolder;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreGlobalServiceHolder;->b()Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnovationProviderInterface;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b()Lcom/p1/mobile/putong/core/api/inject/provider/CoreMemberProviderInterface;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gta;->a:Lcom/p1/mobile/putong/core/api/inject/provider/CoreGlobalServiceHolder;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreGlobalServiceHolder;->c()Lcom/p1/mobile/putong/core/api/inject/provider/CoreMemberProviderInterface;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c()Lcom/p1/mobile/putong/core/api/inject/provider/CoreMessageProviderInterface;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gta;->a:Lcom/p1/mobile/putong/core/api/inject/provider/CoreGlobalServiceHolder;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreGlobalServiceHolder;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreMessageProviderInterface;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gta;->a:Lcom/p1/mobile/putong/core/api/inject/provider/CoreGlobalServiceHolder;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreGlobalServiceHolder;->e()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
