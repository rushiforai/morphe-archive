.class public final Ll/x4e$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/x4e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "b"
.end annotation


# instance fields
.field public final a:Ll/x4e$d;

.field public final b:[Z

.field public c:Z

.field public final synthetic d:Ll/x4e;


# direct methods
.method public constructor <init>(Ll/x4e;Ll/x4e$d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/x4e$b;->d:Ll/x4e;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/x4e$b;->a:Ll/x4e$d;

    .line 7
    .line 8
    iget-boolean p2, p2, Ll/x4e$d;->e:Z

    .line 9
    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget p1, p1, Ll/x4e;->h:I

    .line 15
    .line 16
    new-array p1, p1, [Z

    .line 17
    .line 18
    :goto_0
    iput-object p1, p0, Ll/x4e$b;->b:[Z

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public a()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/x4e$b;->d:Ll/x4e;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Ll/x4e$b;->c:Z

    .line 5
    .line 6
    if-nez v1, :cond_1

    .line 7
    .line 8
    iget-object v1, p0, Ll/x4e$b;->a:Ll/x4e$d;

    .line 9
    .line 10
    iget-object v1, v1, Ll/x4e$d;->f:Ll/x4e$b;

    .line 11
    .line 12
    if-ne v1, p0, :cond_0

    .line 13
    .line 14
    iget-object v1, p0, Ll/x4e$b;->d:Ll/x4e;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-virtual {v1, p0, v2}, Ll/x4e;->m(Ll/x4e$b;Z)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :goto_0
    const/4 v1, 0x1

    .line 24
    iput-boolean v1, p0, Ll/x4e$b;->c:Z

    .line 25
    .line 26
    monitor-exit v0

    .line 27
    return-void

    .line 28
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 29
    .line 30
    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    .line 31
    .line 32
    .line 33
    throw p0

    .line 34
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    throw p0
.end method

.method public b()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/x4e$b;->d:Ll/x4e;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Ll/x4e$b;->c:Z

    .line 5
    .line 6
    if-nez v1, :cond_1

    .line 7
    .line 8
    iget-object v1, p0, Ll/x4e$b;->a:Ll/x4e$d;

    .line 9
    .line 10
    iget-object v1, v1, Ll/x4e$d;->f:Ll/x4e$b;

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    if-ne v1, p0, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Ll/x4e$b;->d:Ll/x4e;

    .line 16
    .line 17
    invoke-virtual {v1, p0, v2}, Ll/x4e;->m(Ll/x4e$b;Z)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :goto_0
    iput-boolean v2, p0, Ll/x4e$b;->c:Z

    .line 24
    .line 25
    monitor-exit v0

    .line 26
    return-void

    .line 27
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 28
    .line 29
    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    .line 30
    .line 31
    .line 32
    throw p0

    .line 33
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    throw p0
.end method

.method public c()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/x4e$b;->a:Ll/x4e$d;

    .line 2
    .line 3
    iget-object v0, v0, Ll/x4e$d;->f:Ll/x4e$b;

    .line 4
    .line 5
    if-ne v0, p0, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    :goto_0
    iget-object v1, p0, Ll/x4e$b;->d:Ll/x4e;

    .line 9
    .line 10
    iget v2, v1, Ll/x4e;->h:I

    .line 11
    .line 12
    if-ge v0, v2, :cond_0

    .line 13
    .line 14
    :try_start_0
    iget-object v1, v1, Ll/x4e;->a:Ll/bki;

    .line 15
    .line 16
    iget-object v2, p0, Ll/x4e$b;->a:Ll/x4e$d;

    .line 17
    .line 18
    iget-object v2, v2, Ll/x4e$d;->d:[Ljava/io/File;

    .line 19
    .line 20
    aget-object v2, v2, v0

    .line 21
    .line 22
    invoke-interface {v1, v2}, Ll/bki;->c(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    .line 25
    :catch_0
    add-int/lit8 v0, v0, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object p0, p0, Ll/x4e$b;->a:Ll/x4e$d;

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    iput-object v0, p0, Ll/x4e$d;->f:Ll/x4e$b;

    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public d(I)Lokio/Sink;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/x4e$b;->d:Ll/x4e;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Ll/x4e$b;->c:Z

    .line 5
    .line 6
    if-nez v1, :cond_2

    .line 7
    .line 8
    iget-object v1, p0, Ll/x4e$b;->a:Ll/x4e$d;

    .line 9
    .line 10
    iget-object v2, v1, Ll/x4e$d;->f:Ll/x4e$b;

    .line 11
    .line 12
    if-eq v2, p0, :cond_0

    .line 13
    .line 14
    invoke-static {}, Lokio/Okio;->blackhole()Lokio/Sink;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    monitor-exit v0

    .line 19
    return-object p0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-boolean v2, v1, Ll/x4e$d;->e:Z

    .line 23
    .line 24
    if-nez v2, :cond_1

    .line 25
    .line 26
    iget-object v2, p0, Ll/x4e$b;->b:[Z

    .line 27
    .line 28
    const/4 v3, 0x1

    .line 29
    aput-boolean v3, v2, p1

    .line 30
    .line 31
    :cond_1
    iget-object v1, v1, Ll/x4e$d;->d:[Ljava/io/File;

    .line 32
    .line 33
    aget-object p1, v1, p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    .line 35
    :try_start_1
    iget-object v1, p0, Ll/x4e$b;->d:Ll/x4e;

    .line 36
    .line 37
    iget-object v1, v1, Ll/x4e;->a:Ll/bki;

    .line 38
    .line 39
    invoke-interface {v1, p1}, Ll/bki;->h(Ljava/io/File;)Lokio/Sink;

    .line 40
    .line 41
    .line 42
    move-result-object p1
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    :try_start_2
    new-instance v1, Ll/x4e$b$a;

    .line 44
    .line 45
    invoke-direct {v1, p0, p1}, Ll/x4e$b$a;-><init>(Ll/x4e$b;Lokio/Sink;)V

    .line 46
    .line 47
    .line 48
    monitor-exit v0

    .line 49
    return-object v1

    .line 50
    :catch_0
    invoke-static {}, Lokio/Okio;->blackhole()Lokio/Sink;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    monitor-exit v0

    .line 55
    return-object p0

    .line 56
    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 57
    .line 58
    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    .line 59
    .line 60
    .line 61
    throw p0

    .line 62
    :goto_0
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 63
    throw p0
.end method
