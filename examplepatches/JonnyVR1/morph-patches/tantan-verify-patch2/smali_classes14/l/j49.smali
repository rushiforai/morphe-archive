.class public Ll/j49;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile b:Ll/j49;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/j49;->a:Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder;->a()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static c()Ll/j49;
    .locals 2

    .line 1
    sget-object v0, Ll/j49;->b:Ll/j49;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/j49;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/j49;->b:Ll/j49;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/j49;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/j49;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/j49;->b:Ll/j49;

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
    sget-object v0, Ll/j49;->b:Ll/j49;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j49;->a:Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder;->coreBusinessService:Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 4
    .line 5
    return-object p0
.end method

.method public b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j49;->a:Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder;->coreBuzzInnerService:Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 4
    .line 5
    return-object p0
.end method

.method public d()Lcom/p1/mobile/putong/core/innovation/service/CoreInnovationInnerService;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j49;->a:Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder;->innovationInnerService:Lcom/p1/mobile/putong/core/innovation/service/CoreInnovationInnerService;

    .line 4
    .line 5
    return-object p0
.end method

.method public e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j49;->a:Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder;->coreMemberInnerService:Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 4
    .line 5
    return-object p0
.end method

.method public f()Lcom/p1/mobile/putong/core/message/service/CoreMessageInnerService;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j49;->a:Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder;->coreMessageInnerService:Lcom/p1/mobile/putong/core/message/service/CoreMessageInnerService;

    .line 4
    .line 5
    return-object p0
.end method

.method public g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j49;->a:Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder;->corePayInnerService:Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 4
    .line 5
    return-object p0
.end method

.method public h()Lcom/p1/mobile/putong/core/profile/service/CoreProfileInnerService;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j49;->a:Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder;->coreProfileInnerService:Lcom/p1/mobile/putong/core/profile/service/CoreProfileInnerService;

    .line 4
    .line 5
    return-object p0
.end method

.method public i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j49;->a:Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/inject/provider/CoreInnerServiceHolder;->coreBusinessService:Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 4
    .line 5
    return-object p0
.end method
