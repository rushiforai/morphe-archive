.class public Ll/pj;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/pj$a;
    }
.end annotation


# static fields
.field public static volatile i:Ll/pj;


# instance fields
.field public a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ll/pj$a;

.field public c:Ll/mxd0;

.field public d:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public e:Lcom/p1/mobile/putong/account/data/CameraSticker;

.field public f:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/account/data/CameraSticker;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/account/data/CameraSticker;",
            ">;"
        }
    .end annotation
.end field

.field public h:Lcom/p1/mobile/putong/account/data/CameraSticker;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/pj$a;

    .line 5
    .line 6
    const-string v1, "account_sp_sticker_click_state"

    .line 7
    .line 8
    invoke-direct {v0, p0, v1}, Ll/pj$a;-><init>(Ll/pj;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/pj;->b:Ll/pj$a;

    .line 12
    .line 13
    new-instance v0, Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/pj;->a:Ljava/util/HashMap;

    .line 19
    .line 20
    new-instance v0, Ljava/util/HashMap;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/pj;->g:Ljava/util/Map;

    .line 26
    .line 27
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Ll/pj;->d:Lrx/subjects/a;

    .line 32
    .line 33
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Ll/pj;->f:Lrx/subjects/a;

    .line 38
    .line 39
    new-instance v0, Ll/mxd0;

    .line 40
    .line 41
    const-string v1, "account_sp_sticker_max_create_time"

    .line 42
    .line 43
    const-wide/16 v2, 0x0

    .line 44
    .line 45
    invoke-direct {v0, v1, v2, v3}, Ll/mxd0;-><init>(Ljava/lang/String;D)V

    .line 46
    .line 47
    .line 48
    iput-object v0, p0, Ll/pj;->c:Ll/mxd0;

    .line 49
    .line 50
    return-void
.end method

.method public static c()Ll/pj;
    .locals 2

    .line 1
    sget-object v0, Ll/pj;->i:Ll/pj;

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
    sget-object v1, Ll/pj;->i:Ll/pj;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/pj;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/pj;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/pj;->i:Ll/pj;

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
    sget-object v0, Ll/pj;->i:Ll/pj;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/account/data/CameraSticker;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/account/data/CameraSticker;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/pj;->k(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b()Lcom/p1/mobile/putong/account/data/CameraSticker;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pj;->h:Lcom/p1/mobile/putong/account/data/CameraSticker;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/account/data/CameraSticker;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/pj;->g:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Lcom/p1/mobile/putong/account/data/CameraSticker;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/pj;->e:Lcom/p1/mobile/putong/account/data/CameraSticker;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/account/data/CameraSticker;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/p1/mobile/putong/account/data/CameraSticker;

    .line 22
    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object v1, p0, Ll/pj;->a:Ljava/util/HashMap;

    .line 27
    .line 28
    iget-object v2, v0, Lcom/p1/mobile/putong/account/data/CameraSticker;->id:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v3, p0, Ll/pj;->b:Ll/pj$a;

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    if-nez v4, :cond_1

    .line 37
    .line 38
    const/4 v0, 0x0

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    iget-object v4, p0, Ll/pj;->a:Ljava/util/HashMap;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/account/data/CameraSticker;->id:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Ljava/lang/Integer;

    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    :goto_1
    invoke-virtual {v3, v2, v0}, Ll/pj$a;->d(Ljava/lang/String;I)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    return-void
.end method

.method public g(Lcom/p1/mobile/putong/account/data/CameraSticker;)Z
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Ll/pj;->a:Ljava/util/HashMap;

    .line 9
    .line 10
    iget-object v2, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->id:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Ll/pj;->a:Ljava/util/HashMap;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Ljava/lang/Integer;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    const/4 p1, 0x1

    .line 37
    if-ne p0, p1, :cond_0

    .line 38
    .line 39
    return p1

    .line 40
    :cond_0
    return v1
.end method

.method public h(Lcom/p1/mobile/putong/account/data/CameraSticker;Lcom/p1/mobile/putong/account/data/CameraSticker;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/pj;->g(Lcom/p1/mobile/putong/account/data/CameraSticker;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    iget-boolean p2, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->hasModelFile:Z

    .line 10
    .line 11
    if-nez p2, :cond_0

    .line 12
    .line 13
    iget-wide p1, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->updateTime:D

    .line 14
    .line 15
    invoke-virtual {p0, p1, p2}, Ll/pj;->i(D)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public i(D)Z
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    long-to-double v0, v0

    .line 6
    sub-double/2addr v0, p1

    .line 7
    const-wide p0, 0x41c2064200000000L    # 6.048E8

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    cmpg-double p0, v0, p0

    .line 13
    .line 14
    if-gez p0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public j(Lcom/p1/mobile/putong/account/data/CameraSticker;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/pj;->k(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final k(Ljava/lang/String;)V
    .locals 3
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/pj;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/pj;->a:Ljava/util/HashMap;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v0, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/pj;->b:Ll/pj$a;

    .line 26
    .line 27
    invoke-virtual {p0, p1, v1}, Ll/pj$a;->e(Ljava/lang/String;I)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public l(Lcom/p1/mobile/putong/account/data/CameraSticker;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pj;->h:Lcom/p1/mobile/putong/account/data/CameraSticker;

    .line 2
    .line 3
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/account/data/CameraSticker;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pj;->e:Lcom/p1/mobile/putong/account/data/CameraSticker;

    .line 2
    .line 3
    return-void
.end method
