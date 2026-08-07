.class public Ll/l94;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/l94$a;
    }
.end annotation


# static fields
.field public static volatile j:Ll/l94;


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

.field public b:Ll/l94$a;

.field public c:Ll/l94$a;

.field public d:Ll/l94$a;

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

.field public h:Z

.field public i:D


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
    iput-object v0, p0, Ll/l94;->a:Ljava/util/Map;

    .line 10
    .line 11
    new-instance v0, Ll/l94$a;

    .line 12
    .line 13
    const-string v1, "IS_FIRST_GET_CATEGORY_STATE_SP_NAME"

    .line 14
    .line 15
    invoke-direct {v0, p0, v1}, Ll/l94$a;-><init>(Ll/l94;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/l94;->c:Ll/l94$a;

    .line 19
    .line 20
    new-instance v0, Ll/l94$a;

    .line 21
    .line 22
    const-string v1, "sp_first_camera_category_state"

    .line 23
    .line 24
    invoke-direct {v0, p0, v1}, Ll/l94$a;-><init>(Ll/l94;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Ll/l94;->d:Ll/l94$a;

    .line 28
    .line 29
    new-instance v0, Ll/l94$a;

    .line 30
    .line 31
    const-string v1, "click_camera_category_state_sp_name"

    .line 32
    .line 33
    invoke-direct {v0, p0, v1}, Ll/l94$a;-><init>(Ll/l94;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Ll/l94;->b:Ll/l94$a;

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/l94$a;->e()Ljava/util/Map;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p0, Ll/l94;->a:Ljava/util/Map;

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
    iput-object v0, p0, Ll/l94;->e:Lrx/subjects/a;

    .line 51
    .line 52
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iput-object v0, p0, Ll/l94;->f:Lrx/subjects/a;

    .line 57
    .line 58
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iput-object v0, p0, Ll/l94;->g:Lrx/subjects/a;

    .line 63
    .line 64
    return-void
.end method

.method public static e()Ll/l94;
    .locals 2

    .line 1
    sget-object v0, Ll/l94;->j:Ll/l94;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/xc4;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/l94;->j:Ll/l94;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/l94;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/l94;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/l94;->j:Ll/l94;

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
    sget-object v0, Ll/l94;->j:Ll/l94;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/feed/data/CameraCategory;)Z
    .locals 5
    .param p1    # Lcom/p1/mobile/putong/feed/data/CameraCategory;
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
    iget-object v0, p0, Ll/l94;->a:Ljava/util/Map;

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
    iget-object v0, p0, Ll/l94;->a:Ljava/util/Map;

    .line 16
    .line 17
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/CameraCategory;->id:Ljava/lang/String;

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
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/CameraCategory;->id:Ljava/lang/String;

    .line 32
    .line 33
    const/4 v2, 0x1

    .line 34
    invoke-virtual {p0, v1, v2}, Ll/l94;->b(Ljava/lang/String;I)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_0

    .line 39
    .line 40
    iget-wide v3, p1, Lcom/p1/mobile/putong/feed/data/CameraCategory;->cameraUpdateTime:D

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
    invoke-static {}, Ll/xc4;->c()Ll/xc4;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    iget-wide v0, p1, Lcom/p1/mobile/putong/feed/data/CameraCategory;->cameraUpdateTime:D

    .line 55
    .line 56
    invoke-virtual {p0, v0, v1}, Ll/xc4;->i(D)Z

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
    iget-object p0, p0, Ll/l94;->c:Ll/l94$a;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/l94$a;->c(Ll/l94$a;Ljava/lang/String;)D

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
    iget-object p0, p0, Ll/l94;->c:Ll/l94$a;

    .line 2
    .line 3
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0, v1}, Ll/l94$a;->f(Ljava/lang/String;D)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final d(ZID)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/l94;->d:Ll/l94$a;

    .line 4
    .line 5
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p0, p1}, Ll/l94$a;->c(Ll/l94$a;Ljava/lang/String;)D

    .line 10
    .line 11
    .line 12
    move-result-wide p0

    .line 13
    cmpg-double p0, p0, p3

    .line 14
    .line 15
    if-gez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public final f(Ljava/lang/String;)D
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l94;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Double;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 16
    .line 17
    .line 18
    move-result-wide p0

    .line 19
    return-wide p0

    .line 20
    :cond_0
    const-wide/16 p0, 0x0

    .line 21
    .line 22
    return-wide p0
.end method

.method public final g(Ljava/util/List;)Lcom/p1/mobile/putong/feed/data/CameraCategory;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/CameraCategory;",
            ">;)",
            "Lcom/p1/mobile/putong/feed/data/CameraCategory;"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-eqz v2, :cond_1

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    check-cast v2, Lcom/p1/mobile/putong/feed/data/CameraCategory;

    .line 19
    .line 20
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-eqz v3, :cond_0

    .line 25
    .line 26
    iget-wide v3, v2, Lcom/p1/mobile/putong/feed/data/CameraCategory;->cameraUpdateTime:D

    .line 27
    .line 28
    cmpl-double v5, v3, v0

    .line 29
    .line 30
    if-lez v5, :cond_0

    .line 31
    .line 32
    move-object p1, v2

    .line 33
    move-wide v0, v3

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return-object p1
.end method

.method public final h(D)Z
    .locals 7

    .line 1
    iget-object v0, p0, Ll/l94;->d:Ll/l94$a;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    invoke-static {v0, v2}, Ll/l94$a;->c(Ll/l94$a;Ljava/lang/String;)D

    .line 9
    .line 10
    .line 11
    move-result-wide v2

    .line 12
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v4, 0x0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    const-wide/16 v5, 0x0

    .line 24
    .line 25
    cmpl-double v0, v2, v5

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    cmpg-double p0, v2, p1

    .line 30
    .line 31
    if-gez p0, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_0
    return v4

    .line 36
    :cond_1
    invoke-virtual {p0, v1, p1, p2}, Ll/l94;->m(ID)V

    .line 37
    .line 38
    .line 39
    return v4
.end method

.method public i(Ljava/lang/String;D)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l94;->b:Ll/l94$a;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3}, Ll/l94$a;->f(Ljava/lang/String;D)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/l94;->a:Ljava/util/Map;

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

.method public j()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/l94;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ll/l94;->h:Z

    .line 7
    .line 8
    iget-object v1, p0, Ll/l94;->e:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v1, v2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    iget-wide v1, p0, Ll/l94;->i:D

    .line 18
    .line 19
    invoke-virtual {p0, v0, v1, v2}, Ll/l94;->m(ID)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public k()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/l94;->g:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iget-wide v1, p0, Ll/l94;->i:D

    .line 10
    .line 11
    invoke-virtual {p0, v0, v1, v2}, Ll/l94;->m(ID)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public l()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/l94;->f:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x2

    .line 9
    iget-wide v1, p0, Ll/l94;->i:D

    .line 10
    .line 11
    invoke-virtual {p0, v0, v1, v2}, Ll/l94;->m(ID)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final m(ID)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l94;->d:Ll/l94$a;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1, p2, p3}, Ll/l94$a;->f(Ljava/lang/String;D)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public n(Ljava/util/List;)Z
    .locals 5
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/CameraCategory;",
            ">;)Z"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    invoke-virtual {p0, p1}, Ll/l94;->g(Ljava/util/List;)Lcom/p1/mobile/putong/feed/data/CameraCategory;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/CameraCategory;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, v1}, Ll/l94;->f(Ljava/lang/String;)D

    .line 18
    .line 19
    .line 20
    move-result-wide v1

    .line 21
    const-wide/16 v3, 0x0

    .line 22
    .line 23
    cmpl-double v1, v1, v3

    .line 24
    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    invoke-static {}, Ll/xc4;->c()Ll/xc4;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget-wide v2, p1, Lcom/p1/mobile/putong/feed/data/CameraCategory;->cameraUpdateTime:D

    .line 32
    .line 33
    invoke-virtual {v1, v2, v3}, Ll/xc4;->i(D)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    iget-wide v1, p1, Lcom/p1/mobile/putong/feed/data/CameraCategory;->cameraUpdateTime:D

    .line 40
    .line 41
    iput-wide v1, p0, Ll/l94;->i:D

    .line 42
    .line 43
    invoke-virtual {p0, v1, v2}, Ll/l94;->h(D)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    iput-boolean p1, p0, Ll/l94;->h:Z

    .line 48
    .line 49
    iget-object v1, p0, Ll/l94;->e:Lrx/subjects/a;

    .line 50
    .line 51
    iget-wide v2, p0, Ll/l94;->i:D

    .line 52
    .line 53
    invoke-virtual {p0, p1, v0, v2, v3}, Ll/l94;->d(ZID)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {v1, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Ll/l94;->g:Lrx/subjects/a;

    .line 65
    .line 66
    iget-boolean v0, p0, Ll/l94;->h:Z

    .line 67
    .line 68
    const/4 v1, 0x1

    .line 69
    iget-wide v2, p0, Ll/l94;->i:D

    .line 70
    .line 71
    invoke-virtual {p0, v0, v1, v2, v3}, Ll/l94;->d(ZID)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Ll/l94;->f:Lrx/subjects/a;

    .line 83
    .line 84
    iget-boolean v0, p0, Ll/l94;->h:Z

    .line 85
    .line 86
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_1
    iget-object p1, p0, Ll/l94;->e:Lrx/subjects/a;

    .line 95
    .line 96
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 97
    .line 98
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    :goto_0
    iget-boolean p0, p0, Ll/l94;->h:Z

    .line 102
    .line 103
    return p0
.end method
