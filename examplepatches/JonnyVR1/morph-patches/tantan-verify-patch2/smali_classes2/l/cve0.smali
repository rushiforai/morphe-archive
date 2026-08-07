.class public Ll/cve0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/facebook/cache/common/a;


# static fields
.field public static final i:Ljava/lang/Object;

.field public static j:Ll/cve0;

.field public static k:I


# instance fields
.field public a:Ll/by3;

.field public b:Ljava/lang/String;

.field public c:J

.field public d:J

.field public e:J

.field public f:Ljava/io/IOException;

.field public g:Lcom/facebook/cache/common/CacheEventListener$EvictionReason;

.field public h:Ll/cve0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/cve0;->i:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()Ll/cve0;
    .locals 3

    .line 1
    sget-object v0, Ll/cve0;->i:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Ll/cve0;->j:Ll/cve0;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-object v2, v1, Ll/cve0;->h:Ll/cve0;

    .line 9
    .line 10
    sput-object v2, Ll/cve0;->j:Ll/cve0;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    iput-object v2, v1, Ll/cve0;->h:Ll/cve0;

    .line 14
    .line 15
    sget v2, Ll/cve0;->k:I

    .line 16
    .line 17
    add-int/lit8 v2, v2, -0x1

    .line 18
    .line 19
    sput v2, Ll/cve0;->k:I

    .line 20
    .line 21
    monitor-exit v0

    .line 22
    return-object v1

    .line 23
    :catchall_0
    move-exception v1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    new-instance v0, Ll/cve0;

    .line 27
    .line 28
    invoke-direct {v0}, Ll/cve0;-><init>()V

    .line 29
    .line 30
    .line 31
    return-object v0

    .line 32
    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    throw v1
.end method


# virtual methods
.method public b()V
    .locals 3

    .line 1
    sget-object v0, Ll/cve0;->i:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget v1, Ll/cve0;->k:I

    .line 5
    .line 6
    const/4 v2, 0x5

    .line 7
    if-ge v1, v2, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/cve0;->c()V

    .line 10
    .line 11
    .line 12
    sget v1, Ll/cve0;->k:I

    .line 13
    .line 14
    add-int/lit8 v1, v1, 0x1

    .line 15
    .line 16
    sput v1, Ll/cve0;->k:I

    .line 17
    .line 18
    sget-object v1, Ll/cve0;->j:Ll/cve0;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    iput-object v1, p0, Ll/cve0;->h:Ll/cve0;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    :goto_0
    sput-object p0, Ll/cve0;->j:Ll/cve0;

    .line 28
    .line 29
    :cond_1
    monitor-exit v0

    .line 30
    return-void

    .line 31
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    throw p0
.end method

.method public final c()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/cve0;->a:Ll/by3;

    .line 3
    .line 4
    iput-object v0, p0, Ll/cve0;->b:Ljava/lang/String;

    .line 5
    .line 6
    const-wide/16 v1, 0x0

    .line 7
    .line 8
    iput-wide v1, p0, Ll/cve0;->c:J

    .line 9
    .line 10
    iput-wide v1, p0, Ll/cve0;->d:J

    .line 11
    .line 12
    iput-wide v1, p0, Ll/cve0;->e:J

    .line 13
    .line 14
    iput-object v0, p0, Ll/cve0;->f:Ljava/io/IOException;

    .line 15
    .line 16
    iput-object v0, p0, Ll/cve0;->g:Lcom/facebook/cache/common/CacheEventListener$EvictionReason;

    .line 17
    .line 18
    return-void
.end method

.method public d(Ll/by3;)Ll/cve0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cve0;->a:Ll/by3;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(J)Ll/cve0;
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/cve0;->d:J

    .line 2
    .line 3
    return-object p0
.end method

.method public f(J)Ll/cve0;
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/cve0;->e:J

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Lcom/facebook/cache/common/CacheEventListener$EvictionReason;)Ll/cve0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cve0;->g:Lcom/facebook/cache/common/CacheEventListener$EvictionReason;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Ljava/io/IOException;)Ll/cve0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cve0;->f:Ljava/io/IOException;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(J)Ll/cve0;
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/cve0;->c:J

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Ljava/lang/String;)Ll/cve0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cve0;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
