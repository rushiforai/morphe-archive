.class public Ll/uh;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/uh$a;
    }
.end annotation


# static fields
.field public static volatile h:Ll/uh;


# instance fields
.field public a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ll/uh$a;

.field public c:Ll/uh$a;

.field public d:Ll/uh$a;

.field public e:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public f:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public g:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/uh;->a:Ljava/util/Map;

    .line 10
    .line 11
    new-instance v0, Ll/uh$a;

    .line 12
    .line 13
    const-string v1, "account_is_first_get_category_state_sp_name"

    .line 14
    .line 15
    invoke-direct {v0, p0, v1}, Ll/uh$a;-><init>(Ll/uh;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/uh;->c:Ll/uh$a;

    .line 19
    .line 20
    new-instance v0, Ll/uh$a;

    .line 21
    .line 22
    const-string v1, "account_sp_first_camera_category_state"

    .line 23
    .line 24
    invoke-direct {v0, p0, v1}, Ll/uh$a;-><init>(Ll/uh;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Ll/uh;->d:Ll/uh$a;

    .line 28
    .line 29
    new-instance v0, Ll/uh$a;

    .line 30
    .line 31
    const-string v1, "account_click_camera_category_state_sp_name"

    .line 32
    .line 33
    invoke-direct {v0, p0, v1}, Ll/uh$a;-><init>(Ll/uh;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Ll/uh;->b:Ll/uh$a;

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/uh$a;->e()Ljava/util/Map;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p0, Ll/uh;->a:Ljava/util/Map;

    .line 43
    .line 44
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 45
    .line 46
    invoke-static {v0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Ll/uh;->e:Lrx/subjects/a;

    .line 51
    .line 52
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iput-object v0, p0, Ll/uh;->f:Lrx/subjects/a;

    .line 57
    .line 58
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iput-object v0, p0, Ll/uh;->g:Lrx/subjects/a;

    .line 63
    .line 64
    return-void
.end method

.method public static d()Ll/uh;
    .locals 2

    .line 1
    sget-object v0, Ll/uh;->h:Ll/uh;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/pj;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/uh;->h:Ll/uh;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/uh;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/uh;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/uh;->h:Ll/uh;

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
    sget-object v0, Ll/uh;->h:Ll/uh;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/account/data/CameraCategory;)Z
    .locals 5
    .param p1    # Lcom/p1/mobile/putong/account/data/CameraCategory;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/uh;->a:Ljava/util/Map;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/uh;->a:Ljava/util/Map;

    .line 16
    .line 17
    iget-object v1, p1, Lcom/p1/mobile/putong/account/data/CameraCategory;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/lang/Double;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    iget-object v1, p1, Lcom/p1/mobile/putong/account/data/CameraCategory;->id:Ljava/lang/String;

    .line 32
    .line 33
    const/4 v2, 0x1

    .line 34
    invoke-virtual {p0, v1, v2}, Ll/uh;->b(Ljava/lang/String;I)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_0

    .line 39
    .line 40
    iget-wide v3, p1, Lcom/p1/mobile/putong/account/data/CameraCategory;->cameraUpdateTime:D

    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 43
    .line 44
    .line 45
    move-result-wide v0

    .line 46
    cmpl-double p0, v3, v0

    .line 47
    .line 48
    if-lez p0, :cond_0

    .line 49
    .line 50
    invoke-static {}, Ll/pj;->c()Ll/pj;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    iget-wide v0, p1, Lcom/p1/mobile/putong/account/data/CameraCategory;->cameraUpdateTime:D

    .line 55
    .line 56
    invoke-virtual {p0, v0, v1}, Ll/pj;->i(D)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-eqz p0, :cond_0

    .line 61
    .line 62
    return v2

    .line 63
    :cond_0
    const/4 p0, 0x0

    .line 64
    return p0
.end method

.method public b(Ljava/lang/String;I)Z
    .locals 2

    .line 1
    iget-object p0, p0, Ll/uh;->c:Ll/uh$a;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/uh$a;->c(Ll/uh$a;Ljava/lang/String;)D

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    int-to-double v0, p2

    .line 8
    cmpl-double p0, p0, v0

    .line 9
    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public c(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/uh;->c:Ll/uh$a;

    .line 2
    .line 3
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0, v1}, Ll/uh$a;->f(Ljava/lang/String;D)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public e(Ljava/lang/String;D)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uh;->b:Ll/uh$a;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3}, Ll/uh$a;->f(Ljava/lang/String;D)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/uh;->a:Ljava/util/Map;

    .line 7
    .line 8
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    return-void
.end method
