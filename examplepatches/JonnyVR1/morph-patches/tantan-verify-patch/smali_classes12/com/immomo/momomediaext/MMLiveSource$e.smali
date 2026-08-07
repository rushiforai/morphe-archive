.class Lcom/immomo/momomediaext/MMLiveSource$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/pub/MomoPipelineModuleRegister$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/momomediaext/MMLiveSource;->v(Ll/brx;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/momomediaext/MMLiveSource;


# direct methods
.method public constructor <init>(Lcom/immomo/momomediaext/MMLiveSource;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveSource$e;->a:Lcom/immomo/momomediaext/MMLiveSource;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/c4m;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource$e;->a:Lcom/immomo/momomediaext/MMLiveSource;

    .line 3
    .line 4
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveSource;->d(Lcom/immomo/momomediaext/MMLiveSource;)Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveSource$e;->a:Lcom/immomo/momomediaext/MMLiveSource;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveSource;->d(Lcom/immomo/momomediaext/MMLiveSource;)Lcom/momo/pub/MomoPipelineModuleRegister;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0, p1}, Lcom/momo/pub/MomoPipelineModuleRegister;->z(Ll/c4m;)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit p0

    .line 23
    return-void

    .line 24
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw p1
.end method

.method public b(Ll/c4m;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "MomoCamera"

    .line 6
    .line 7
    const-string v0, "onRecordPrepared"

    .line 8
    .line 9
    invoke-virtual {p0, p1, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
