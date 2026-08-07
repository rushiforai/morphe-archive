.class public Ll/dx6;
.super Ll/dy6;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/dx6$a;
    }
.end annotation


# instance fields
.field public R:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/core/data/AdvancedSettings;",
            ">;"
        }
    .end annotation
.end field

.field public S:Ll/dx6$a;

.field public T:Ll/jxd0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/dy6;-><init>(Lcom/p1/mobile/putong/core/api/c;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/dx6;->R:Lrx/subjects/a;

    .line 9
    .line 10
    new-instance p1, Ll/dx6$a;

    .line 11
    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v1, "advance_filter_last_matchest_"

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-direct {p1, p0, v0, v1}, Ll/dx6$a;-><init>(Ll/dx6;Ljava/lang/String;Lcom/p1/mobile/putong/data/LastMatchesData;)V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Ll/dx6;->S:Ll/dx6$a;

    .line 39
    .line 40
    new-instance p1, Ll/jxd0;

    .line 41
    .line 42
    new-instance v0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v1, "svip_advanced_filter_home_dot_shown_"

    .line 45
    .line 46
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 65
    .line 66
    invoke-direct {p1, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 67
    .line 68
    .line 69
    iput-object p1, p0, Ll/dx6;->T:Ll/jxd0;

    .line 70
    .line 71
    return-void
.end method

.method public static synthetic a3(Ll/dx6;Lcom/p1/mobile/putong/core/data/AdvancedSettings;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dx6;->l3(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b3(Ll/uxj0;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->z5(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic c3(Ll/dx6;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/dx6;->n3()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d3(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "/advanced-search-settings?method=patch"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->J0(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->toJson()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {v1, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public static synthetic e3()Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "/advanced-search-settings"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->J0(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    return-object v0
.end method

.method public static synthetic f3(Ll/dx6;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dx6;->m3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g3(Ll/dx6;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dx6;->k3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public h3()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/AdvancedSettings;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dx6;->R:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public i3()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dx6;->T:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    xor-int/lit8 p0, p0, 0x1

    .line 14
    .line 15
    return p0
.end method

.method public j3()Lcom/p1/mobile/putong/core/data/AdvancedSettings;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dx6;->R:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic k3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->advancedSettings:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/dx6;->R:Lrx/subjects/a;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 30
    .line 31
    return-object p0
.end method

.method public final synthetic l3(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/bx6;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/bx6;-><init>(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v0, Ll/cx6;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/cx6;-><init>(Ll/dx6;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic m3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->advancedSettings:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/dx6;->R:Lrx/subjects/a;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 30
    .line 31
    return-object p0
.end method

.method public final synthetic n3()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/xw6;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/xw6;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/fjf0;

    .line 11
    .line 12
    invoke-direct {v1}, Ll/fjf0;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/yw6;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/yw6;-><init>(Ll/dx6;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public o3(Lcom/p1/mobile/putong/core/data/AdvancedSettings;Z)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/AdvancedSettings;",
            "Z)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dx6;->R:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->subtract(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)Lcom/p1/mobile/putong/core/data/AdvancedSettings;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    :goto_0
    if-nez p1, :cond_1

    .line 17
    .line 18
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 19
    .line 20
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0

    .line 25
    :cond_1
    if-nez p2, :cond_2

    .line 26
    .line 27
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 30
    .line 31
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->C5()V

    .line 32
    .line 33
    .line 34
    :cond_2
    invoke-virtual {p0, p1}, Ll/dx6;->p3(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    new-instance p1, Ll/zw6;

    .line 39
    .line 40
    invoke-direct {p1}, Ll/zw6;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, p1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method public final p3(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/AdvancedSettings;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ll/ax6;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/ax6;-><init>(Ll/dx6;Lcom/p1/mobile/putong/core/data/AdvancedSettings;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "advanced_settings"

    .line 9
    .line 10
    const/4 p1, -0x1

    .line 11
    invoke-virtual {v0, p0, p1, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public q3()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ll/ww6;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/ww6;-><init>(Ll/dx6;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "advanced_discovery"

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, p0, v2, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public r3()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/dx6;->T:Ll/jxd0;

    .line 2
    .line 3
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public s3()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    const-string v0, "advanced_settings"

    .line 4
    .line 5
    const/4 v1, -0x1

    .line 6
    invoke-virtual {p0, v0, v1}, Lcom/tantanapp/common/network/RunnerProxy;->wait(Ljava/lang/String;I)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public t3(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)Ll/pf60;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/AdvancedSettings;",
            ")",
            "Ll/pf60<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/ProfileZodiac;",
            ">;",
            "Lcom/p1/mobile/putong/data/ProfileZodiac;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dx6;->S:Ll/dx6$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/data/LastMatchesData;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 14
    .line 15
    .line 16
    move-result-wide v1

    .line 17
    iget-wide v3, v0, Lcom/p1/mobile/putong/data/LastMatchesData;->time:J

    .line 18
    .line 19
    const/4 v5, 0x1

    .line 20
    invoke-static {v1, v2, v3, v4, v5}, Ll/tzi0;->h(JJI)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    iget-object p0, v0, Lcom/p1/mobile/putong/data/LastMatchesData;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 27
    .line 28
    goto/16 :goto_1

    .line 29
    .line 30
    :cond_0
    new-instance v0, Ljava/util/Random;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 33
    .line 34
    .line 35
    const/16 v1, 0xc

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    packed-switch v0, :pswitch_data_0

    .line 42
    .line 43
    .line 44
    const-string v0, "scorpio"

    .line 45
    .line 46
    invoke-static {v0}, Lcom/p1/mobile/putong/data/ProfileZodiac;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    goto :goto_0

    .line 51
    :pswitch_0
    const-string v0, "libra"

    .line 52
    .line 53
    invoke-static {v0}, Lcom/p1/mobile/putong/data/ProfileZodiac;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    goto :goto_0

    .line 58
    :pswitch_1
    const-string v0, "aquarius"

    .line 59
    .line 60
    invoke-static {v0}, Lcom/p1/mobile/putong/data/ProfileZodiac;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    goto :goto_0

    .line 65
    :pswitch_2
    const-string v0, "gemini"

    .line 66
    .line 67
    invoke-static {v0}, Lcom/p1/mobile/putong/data/ProfileZodiac;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    goto :goto_0

    .line 72
    :pswitch_3
    const-string v0, "pisces"

    .line 73
    .line 74
    invoke-static {v0}, Lcom/p1/mobile/putong/data/ProfileZodiac;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    goto :goto_0

    .line 79
    :pswitch_4
    const-string v0, "leo"

    .line 80
    .line 81
    invoke-static {v0}, Lcom/p1/mobile/putong/data/ProfileZodiac;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    goto :goto_0

    .line 86
    :pswitch_5
    const-string v0, "sagittarius"

    .line 87
    .line 88
    invoke-static {v0}, Lcom/p1/mobile/putong/data/ProfileZodiac;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    goto :goto_0

    .line 93
    :pswitch_6
    const-string v0, "capricorn"

    .line 94
    .line 95
    invoke-static {v0}, Lcom/p1/mobile/putong/data/ProfileZodiac;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    goto :goto_0

    .line 100
    :pswitch_7
    const-string v0, "cancer"

    .line 101
    .line 102
    invoke-static {v0}, Lcom/p1/mobile/putong/data/ProfileZodiac;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    goto :goto_0

    .line 107
    :pswitch_8
    const-string v0, "taurus"

    .line 108
    .line 109
    invoke-static {v0}, Lcom/p1/mobile/putong/data/ProfileZodiac;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    goto :goto_0

    .line 114
    :pswitch_9
    const-string v0, "virgo"

    .line 115
    .line 116
    invoke-static {v0}, Lcom/p1/mobile/putong/data/ProfileZodiac;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    goto :goto_0

    .line 121
    :pswitch_a
    const-string v0, "aries"

    .line 122
    .line 123
    invoke-static {v0}, Lcom/p1/mobile/putong/data/ProfileZodiac;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    :goto_0
    new-instance v1, Lcom/p1/mobile/putong/data/LastMatchesData;

    .line 128
    .line 129
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/LastMatchesData;-><init>()V

    .line 130
    .line 131
    .line 132
    sget-object v2, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 133
    .line 134
    invoke-virtual {v2}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 135
    .line 136
    .line 137
    move-result-wide v2

    .line 138
    iput-wide v2, v1, Lcom/p1/mobile/putong/data/LastMatchesData;->time:J

    .line 139
    .line 140
    iput-object v0, v1, Lcom/p1/mobile/putong/data/LastMatchesData;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 141
    .line 142
    iget-object p0, p0, Ll/dx6;->S:Ll/dx6$a;

    .line 143
    .line 144
    invoke-virtual {p0, v1}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-object p0, v0

    .line 148
    :goto_1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->zodiacs:Ljava/util/List;

    .line 149
    .line 150
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    return-object p0

    .line 155
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
