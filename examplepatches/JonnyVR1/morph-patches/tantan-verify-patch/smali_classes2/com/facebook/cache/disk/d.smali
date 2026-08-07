.class public Lcom/facebook/cache/disk/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/facebook/cache/disk/b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/cache/disk/d$a;
    }
.end annotation


# static fields
.field public static final f:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field


# instance fields
.field public final a:I

.field public final b:Ll/a7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a7h0<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Ljava/lang/String;

.field public final d:Lcom/facebook/cache/common/CacheErrorLogger;

.field public volatile e:Lcom/facebook/cache/disk/d$a;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lcom/facebook/cache/disk/d;

    .line 2
    .line 3
    sput-object v0, Lcom/facebook/cache/disk/d;->f:Ljava/lang/Class;

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(ILl/a7h0;Ljava/lang/String;Lcom/facebook/cache/common/CacheErrorLogger;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ll/a7h0<",
            "Ljava/io/File;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/facebook/cache/common/CacheErrorLogger;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/facebook/cache/disk/d;->a:I

    .line 5
    .line 6
    iput-object p4, p0, Lcom/facebook/cache/disk/d;->d:Lcom/facebook/cache/common/CacheErrorLogger;

    .line 7
    .line 8
    iput-object p2, p0, Lcom/facebook/cache/disk/d;->b:Ll/a7h0;

    .line 9
    .line 10
    iput-object p3, p0, Lcom/facebook/cache/disk/d;->c:Ljava/lang/String;

    .line 11
    .line 12
    new-instance p1, Lcom/facebook/cache/disk/d$a;

    .line 13
    .line 14
    const/4 p2, 0x0

    .line 15
    invoke-direct {p1, p2, p2}, Lcom/facebook/cache/disk/d$a;-><init>(Ljava/io/File;Lcom/facebook/cache/disk/b;)V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lcom/facebook/cache/disk/d;->e:Lcom/facebook/cache/disk/d$a;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public a(Lcom/facebook/cache/disk/b$a;)J
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/facebook/cache/disk/d;->k()Lcom/facebook/cache/disk/b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Lcom/facebook/cache/disk/b;->a(Lcom/facebook/cache/disk/b$a;)J

    .line 6
    .line 7
    .line 8
    move-result-wide p0

    .line 9
    return-wide p0
.end method

.method public b(Ljava/lang/String;Ljava/lang/Object;)Lcom/facebook/cache/disk/b$b;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/facebook/cache/disk/d;->k()Lcom/facebook/cache/disk/b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1, p2}, Lcom/facebook/cache/disk/b;->b(Ljava/lang/String;Ljava/lang/Object;)Lcom/facebook/cache/disk/b$b;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public c(Ljava/lang/String;Ljava/lang/Object;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/facebook/cache/disk/d;->k()Lcom/facebook/cache/disk/b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1, p2}, Lcom/facebook/cache/disk/b;->c(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public d()V
    .locals 2

    .line 1
    :try_start_0
    invoke-virtual {p0}, Lcom/facebook/cache/disk/d;->k()Lcom/facebook/cache/disk/b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/facebook/cache/disk/b;->d()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    sget-object v0, Lcom/facebook/cache/disk/d;->f:Ljava/lang/Class;

    .line 11
    .line 12
    const-string v1, "purgeUnexpectedResources"

    .line 13
    .line 14
    invoke-static {v0, v1, p0}, Ll/huf;->e(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public e(Ljava/lang/String;Ljava/lang/Object;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/facebook/cache/disk/d;->k()Lcom/facebook/cache/disk/b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1, p2}, Lcom/facebook/cache/disk/b;->e(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public f(Ljava/lang/String;Ljava/lang/Object;)Ll/dy2;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/facebook/cache/disk/d;->k()Lcom/facebook/cache/disk/b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1, p2}, Lcom/facebook/cache/disk/b;->f(Ljava/lang/String;Ljava/lang/Object;)Ll/dy2;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public g()Ljava/util/Collection;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/facebook/cache/disk/b$a;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/facebook/cache/disk/d;->k()Lcom/facebook/cache/disk/b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/facebook/cache/disk/b;->g()Ljava/util/Collection;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public h(Ljava/io/File;)V
    .locals 3
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-static {p1}, Lcom/facebook/common/file/FileUtils;->a(Ljava/io/File;)V
    :try_end_0
    .catch Lcom/facebook/common/file/FileUtils$CreateDirectoryException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/facebook/cache/disk/d;->f:Ljava/lang/Class;

    .line 5
    .line 6
    const-string v0, "Created cache directory %s"

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {p0, v0, p1}, Ll/huf;->a(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :catch_0
    move-exception p1

    .line 17
    iget-object p0, p0, Lcom/facebook/cache/disk/d;->d:Lcom/facebook/cache/common/CacheErrorLogger;

    .line 18
    .line 19
    sget-object v0, Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;->WRITE_CREATE_DIR:Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;

    .line 20
    .line 21
    sget-object v1, Lcom/facebook/cache/disk/d;->f:Ljava/lang/Class;

    .line 22
    .line 23
    const-string v2, "createRootDirectoryIfNecessary"

    .line 24
    .line 25
    invoke-interface {p0, v0, v1, v2, p1}, Lcom/facebook/cache/common/CacheErrorLogger;->a(Lcom/facebook/cache/common/CacheErrorLogger$CacheErrorCategory;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    throw p1
.end method

.method public final i()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/facebook/cache/disk/d;->b:Ll/a7h0;

    .line 4
    .line 5
    invoke-interface {v1}, Ll/a7h0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Ljava/io/File;

    .line 10
    .line 11
    iget-object v2, p0, Lcom/facebook/cache/disk/d;->c:Ljava/lang/String;

    .line 12
    .line 13
    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/facebook/cache/disk/d;->h(Ljava/io/File;)V

    .line 17
    .line 18
    .line 19
    new-instance v1, Lcom/facebook/cache/disk/DefaultDiskStorage;

    .line 20
    .line 21
    iget v2, p0, Lcom/facebook/cache/disk/d;->a:I

    .line 22
    .line 23
    iget-object v3, p0, Lcom/facebook/cache/disk/d;->d:Lcom/facebook/cache/common/CacheErrorLogger;

    .line 24
    .line 25
    invoke-direct {v1, v0, v2, v3}, Lcom/facebook/cache/disk/DefaultDiskStorage;-><init>(Ljava/io/File;ILcom/facebook/cache/common/CacheErrorLogger;)V

    .line 26
    .line 27
    .line 28
    new-instance v2, Lcom/facebook/cache/disk/d$a;

    .line 29
    .line 30
    invoke-direct {v2, v0, v1}, Lcom/facebook/cache/disk/d$a;-><init>(Ljava/io/File;Lcom/facebook/cache/disk/b;)V

    .line 31
    .line 32
    .line 33
    iput-object v2, p0, Lcom/facebook/cache/disk/d;->e:Lcom/facebook/cache/disk/d$a;

    .line 34
    .line 35
    return-void
.end method

.method public isExternal()Z
    .locals 0

    .line 1
    :try_start_0
    invoke-virtual {p0}, Lcom/facebook/cache/disk/d;->k()Lcom/facebook/cache/disk/b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/facebook/cache/disk/b;->isExternal()Z

    .line 6
    .line 7
    .line 8
    move-result p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    return p0

    .line 10
    :catch_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public j()V
    .locals 1
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/facebook/cache/disk/d;->e:Lcom/facebook/cache/disk/d$a;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/facebook/cache/disk/d$a;->a:Lcom/facebook/cache/disk/b;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/facebook/cache/disk/d;->e:Lcom/facebook/cache/disk/d$a;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/facebook/cache/disk/d$a;->b:Ljava/io/File;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/facebook/cache/disk/d;->e:Lcom/facebook/cache/disk/d$a;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/facebook/cache/disk/d$a;->b:Ljava/io/File;

    .line 16
    .line 17
    invoke-static {p0}, Ll/cki;->b(Ljava/io/File;)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public declared-synchronized k()Lcom/facebook/cache/disk/b;
    .locals 1
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Lcom/facebook/cache/disk/d;->l()Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/facebook/cache/disk/d;->j()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/facebook/cache/disk/d;->i()V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception v0

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/facebook/cache/disk/d;->e:Lcom/facebook/cache/disk/d$a;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/facebook/cache/disk/d$a;->a:Lcom/facebook/cache/disk/b;

    .line 20
    .line 21
    invoke-static {v0}, Ll/wn80;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/facebook/cache/disk/b;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    .line 27
    monitor-exit p0

    .line 28
    return-object v0

    .line 29
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    throw v0
.end method

.method public final l()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/facebook/cache/disk/d;->e:Lcom/facebook/cache/disk/d$a;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/facebook/cache/disk/d$a;->a:Lcom/facebook/cache/disk/b;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Lcom/facebook/cache/disk/d$a;->b:Ljava/io/File;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public remove(Ljava/lang/String;)J
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/facebook/cache/disk/d;->k()Lcom/facebook/cache/disk/b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Lcom/facebook/cache/disk/b;->remove(Ljava/lang/String;)J

    .line 6
    .line 7
    .line 8
    move-result-wide p0

    .line 9
    return-wide p0
.end method
