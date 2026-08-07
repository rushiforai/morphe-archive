.class public Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/api/mobile/ChinaMobileController$MobileType;
    }
.end annotation


# static fields
.field public static d:Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;


# instance fields
.field public a:Ll/lxj0;

.field public b:Ll/ie00;

.field public c:Ll/orb;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/lxj0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/lxj0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->a:Ll/lxj0;

    .line 10
    .line 11
    new-instance v0, Ll/ie00;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/ie00;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->b:Ll/ie00;

    .line 17
    .line 18
    new-instance v0, Ll/orb;

    .line 19
    .line 20
    invoke-direct {v0}, Ll/orb;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->c:Ll/orb;

    .line 24
    .line 25
    return-void
.end method

.method public static b()Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->d:Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->d:Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->d:Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;

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
    sget-object v0, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->d:Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;

    .line 27
    .line 28
    return-object v0
.end method

.method public static c()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    return-object v0
.end method

.method public static d()Ll/pf60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-static {v0, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static e()Lcom/p1/mobile/putong/api/mobile/ChinaMobileController$MobileType;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController$MobileType;->unknown:Lcom/p1/mobile/putong/api/mobile/ChinaMobileController$MobileType;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a()Ll/orb;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->c:Ll/orb;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Ll/ie00;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->b:Ll/ie00;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Ll/lxj0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/api/mobile/ChinaMobileController;->a:Ll/lxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(I)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/MobileRespInfo;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lrx/c;->empty()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public i(I)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/MobileRespInfo;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lrx/c;->empty()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
