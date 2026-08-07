.class public Ll/wi5;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile h:Ll/wi5;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/data/UserStrategyConfiguration;

.field public b:Z

.field public c:Ll/byd0;

.field public d:Ll/vxd0;

.field public e:I

.field public f:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/wi5;->b:Z

    .line 6
    .line 7
    new-instance v0, Ll/byd0;

    .line 8
    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v2, "commercial_card_last_show"

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-wide/16 v2, 0x0

    .line 32
    .line 33
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Ll/wi5;->c:Ll/byd0;

    .line 41
    .line 42
    new-instance v0, Ll/vxd0;

    .line 43
    .line 44
    new-instance v1, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v2, "commercial_card_doday_show_count"

    .line 47
    .line 48
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    const/4 v2, 0x0

    .line 67
    invoke-direct {v0, v1, v2}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 68
    .line 69
    .line 70
    iput-object v0, p0, Ll/wi5;->d:Ll/vxd0;

    .line 71
    .line 72
    const/16 v0, -0x63

    .line 73
    .line 74
    iput v0, p0, Ll/wi5;->e:I

    .line 75
    .line 76
    new-instance v0, Ljava/util/HashSet;

    .line 77
    .line 78
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 79
    .line 80
    .line 81
    iput-object v0, p0, Ll/wi5;->f:Ljava/util/Set;

    .line 82
    .line 83
    new-instance v0, Ljava/util/HashMap;

    .line 84
    .line 85
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 86
    .line 87
    .line 88
    iput-object v0, p0, Ll/wi5;->g:Ljava/util/HashMap;

    .line 89
    .line 90
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/UserStrategy;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/data/UserStrategy;->strategyID:I

    .line 2
    .line 3
    const/4 v0, 0x7

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/data/UserStrategy;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/data/UserStrategy;->strategyID:I

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static d()Ll/wi5;
    .locals 2

    .line 1
    sget-object v0, Ll/wi5;->h:Ll/wi5;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/wi5;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/wi5;->h:Ll/wi5;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/wi5;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/wi5;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/wi5;->h:Ll/wi5;

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
    sget-object v0, Ll/wi5;->h:Ll/wi5;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public final c()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wi5;->a:Lcom/p1/mobile/putong/core/data/UserStrategyConfiguration;

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

.method public e()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/wi5;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/wi5;->a:Lcom/p1/mobile/putong/core/data/UserStrategyConfiguration;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/UserStrategyConfiguration;->userStrategyMap:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ll/ui5;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/ui5;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {p0, v0}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method public f()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/wi5;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/wi5;->a:Lcom/p1/mobile/putong/core/data/UserStrategyConfiguration;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/UserStrategyConfiguration;->userStrategyMap:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ll/vi5;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/vi5;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {p0, v0}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method
