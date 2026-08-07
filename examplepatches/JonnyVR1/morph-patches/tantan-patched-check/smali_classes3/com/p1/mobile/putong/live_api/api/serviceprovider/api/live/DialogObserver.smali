.class public final enum Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;

.field public static final enum BOOST_AND_SEE:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;

.field public static final enum LIVE_CAMPAIGN_SUGGEST:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;

.field public static final enum LIVE_SUGGEST:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;

.field public static final enum PURCHASE:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;


# instance fields
.field private callbacks:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver$a;",
            ">;"
        }
    .end annotation
.end field

.field private volatile isDialogShown:Z


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;->BOOST_AND_SEE:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;->PURCHASE:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;->LIVE_SUGGEST:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;->LIVE_CAMPAIGN_SUGGEST:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;

    .line 8
    .line 9
    filled-new-array {v0, v1, v2, v3}, [Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;

    .line 2
    .line 3
    const-string v1, "BOOST_AND_SEE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;->BOOST_AND_SEE:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;

    .line 12
    .line 13
    const-string v1, "PURCHASE"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;->PURCHASE:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;

    .line 20
    .line 21
    new-instance v0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;

    .line 22
    .line 23
    const-string v1, "LIVE_SUGGEST"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;->LIVE_SUGGEST:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;

    .line 30
    .line 31
    new-instance v0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;

    .line 32
    .line 33
    const-string v1, "LIVE_CAMPAIGN_SUGGEST"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;->LIVE_CAMPAIGN_SUGGEST:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;

    .line 40
    .line 41
    invoke-static {}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;->$values()[Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sput-object v0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;->$VALUES:[Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;

    .line 46
    .line 47
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;->isDialogShown:Z

    .line 6
    .line 7
    new-instance p1, Ljava/util/LinkedHashSet;

    .line 8
    .line 9
    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;->callbacks:Ljava/util/Set;

    .line 13
    .line 14
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;->$VALUES:[Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public declared-synchronized addOnDismissCallBack(Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver$a;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;->callbacks:Ljava/util/Set;

    .line 3
    .line 4
    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p1

    .line 10
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    throw p1
.end method

.method public isDialogShown()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;->isDialogShown:Z

    .line 2
    .line 3
    return p0
.end method

.method public declared-synchronized removeOnDismissCallBack(Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver$a;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;->callbacks:Ljava/util/Set;

    .line 3
    .line 4
    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p1

    .line 10
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    throw p1
.end method

.method public declared-synchronized setDialogShown(Z)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;->isDialogShown:Z

    .line 3
    .line 4
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;->isDialogShown:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver;->callbacks:Ljava/util/Set;

    .line 7
    .line 8
    if-nez p1, :cond_1

    .line 9
    .line 10
    :try_start_1
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver$a;

    .line 25
    .line 26
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver$a;->b()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception p1

    .line 31
    goto :goto_2

    .line 32
    :cond_0
    monitor-exit p0

    .line 33
    return-void

    .line 34
    :cond_1
    :try_start_2
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver$a;

    .line 49
    .line 50
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/live/DialogObserver$a;->c()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 51
    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_2
    monitor-exit p0

    .line 55
    return-void

    .line 56
    :goto_2
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 57
    throw p1
.end method
