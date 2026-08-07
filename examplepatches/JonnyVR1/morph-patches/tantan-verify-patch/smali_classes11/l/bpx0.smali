.class public Ll/bpx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Iterator;
.implements Ljava/io/Closeable;
.implements Ll/gyr0;


# static fields
.field public static final g:Ll/fyr0;

.field public static final h:Ll/ipx0;


# instance fields
.field public a:Ll/cyr0;

.field public b:Ll/cpx0;

.field public c:Ll/fyr0;

.field public d:J

.field public e:J

.field public final f:Ljava/util/List;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/apx0;

    .line 2
    .line 3
    const-string v1, "eof "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/apx0;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/bpx0;->g:Ll/fyr0;

    .line 9
    .line 10
    const-class v0, Ll/bpx0;

    .line 11
    .line 12
    invoke-static {v0}, Ll/ipx0;->b(Ljava/lang/Class;)Ll/ipx0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sput-object v0, Ll/bpx0;->h:Ll/ipx0;

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/bpx0;->c:Ll/fyr0;

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    iput-wide v0, p0, Ll/bpx0;->d:J

    .line 10
    .line 11
    iput-wide v0, p0, Ll/bpx0;->e:J

    .line 12
    .line 13
    new-instance v0, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/bpx0;->f:Ljava/util/List;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    return-void
.end method

.method public final hasNext()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bpx0;->c:Ll/fyr0;

    .line 2
    .line 3
    sget-object v1, Ll/bpx0;->g:Ll/fyr0;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    return v2

    .line 9
    :cond_0
    const/4 v1, 0x1

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    return v1

    .line 13
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Ll/bpx0;->k()Ll/fyr0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Ll/bpx0;->c:Ll/fyr0;
    :try_end_0
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    return v1

    .line 20
    :catch_0
    sget-object v0, Ll/bpx0;->g:Ll/fyr0;

    .line 21
    .line 22
    iput-object v0, p0, Ll/bpx0;->c:Ll/fyr0;

    .line 23
    .line 24
    return v2
.end method

.method public final k()Ll/fyr0;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/bpx0;->c:Ll/fyr0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    sget-object v2, Ll/bpx0;->g:Ll/fyr0;

    .line 7
    .line 8
    if-ne v0, v2, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iput-object v1, p0, Ll/bpx0;->c:Ll/fyr0;

    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/bpx0;->b:Ll/cpx0;

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    iget-wide v2, p0, Ll/bpx0;->d:J

    .line 19
    .line 20
    iget-wide v4, p0, Ll/bpx0;->e:J

    .line 21
    .line 22
    cmp-long v2, v2, v4

    .line 23
    .line 24
    if-gez v2, :cond_2

    .line 25
    .line 26
    :try_start_0
    monitor-enter v0
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    :try_start_1
    iget-object v2, p0, Ll/bpx0;->b:Ll/cpx0;

    .line 28
    .line 29
    iget-wide v3, p0, Ll/bpx0;->d:J

    .line 30
    .line 31
    invoke-interface {v2, v3, v4}, Ll/cpx0;->l(J)V

    .line 32
    .line 33
    .line 34
    iget-object v2, p0, Ll/bpx0;->a:Ll/cyr0;

    .line 35
    .line 36
    iget-object v3, p0, Ll/bpx0;->b:Ll/cpx0;

    .line 37
    .line 38
    invoke-interface {v2, v3, p0}, Ll/cyr0;->a(Ll/cpx0;Ll/gyr0;)Ll/fyr0;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    iget-object v3, p0, Ll/bpx0;->b:Ll/cpx0;

    .line 43
    .line 44
    invoke-interface {v3}, Ll/cpx0;->zzb()J

    .line 45
    .line 46
    .line 47
    move-result-wide v3

    .line 48
    iput-wide v3, p0, Ll/bpx0;->d:J

    .line 49
    .line 50
    monitor-exit v0

    .line 51
    return-object v2

    .line 52
    :catchall_0
    move-exception p0

    .line 53
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 54
    :try_start_2
    throw p0
    :try_end_2
    .catch Ljava/io/EOFException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 55
    :catch_0
    invoke-static {}, Ll/mor;->a()V

    .line 56
    .line 57
    .line 58
    return-object v1

    .line 59
    :catch_1
    invoke-static {}, Ll/mor;->a()V

    .line 60
    .line 61
    .line 62
    return-object v1

    .line 63
    :cond_2
    sget-object v0, Ll/bpx0;->g:Ll/fyr0;

    .line 64
    .line 65
    iput-object v0, p0, Ll/bpx0;->c:Ll/fyr0;

    .line 66
    .line 67
    invoke-static {}, Ll/mor;->a()V

    .line 68
    .line 69
    .line 70
    return-object v1
.end method

.method public final m()Ljava/util/List;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bpx0;->b:Ll/cpx0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/bpx0;->c:Ll/fyr0;

    .line 6
    .line 7
    sget-object v1, Ll/bpx0;->g:Ll/fyr0;

    .line 8
    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/bpx0;->f:Ljava/util/List;

    .line 12
    .line 13
    new-instance v1, Ll/hpx0;

    .line 14
    .line 15
    invoke-direct {v1, v0, p0}, Ll/hpx0;-><init>(Ljava/util/List;Ljava/util/Iterator;)V

    .line 16
    .line 17
    .line 18
    return-object v1

    .line 19
    :cond_0
    iget-object p0, p0, Ll/bpx0;->f:Ljava/util/List;

    .line 20
    .line 21
    return-object p0
.end method

.method public final n(Ll/cpx0;JLl/cyr0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/bpx0;->b:Ll/cpx0;

    .line 2
    .line 3
    invoke-interface {p1}, Ll/cpx0;->zzb()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iput-wide v0, p0, Ll/bpx0;->d:J

    .line 8
    .line 9
    invoke-interface {p1}, Ll/cpx0;->zzb()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    add-long/2addr v0, p2

    .line 14
    invoke-interface {p1, v0, v1}, Ll/cpx0;->l(J)V

    .line 15
    .line 16
    .line 17
    invoke-interface {p1}, Ll/cpx0;->zzb()J

    .line 18
    .line 19
    .line 20
    move-result-wide p1

    .line 21
    iput-wide p1, p0, Ll/bpx0;->e:J

    .line 22
    .line 23
    iput-object p4, p0, Ll/bpx0;->a:Ll/cyr0;

    .line 24
    .line 25
    return-void
.end method

.method public final bridge synthetic next()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bpx0;->k()Ll/fyr0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final remove()V
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    .line 4
    .line 5
    .line 6
    throw p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, "["

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    :goto_0
    iget-object v2, p0, Ll/bpx0;->f:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-ge v1, v2, :cond_1

    .line 30
    .line 31
    if-lez v1, :cond_0

    .line 32
    .line 33
    const-string v2, ";"

    .line 34
    .line 35
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-object v2, p0, Ll/bpx0;->f:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    check-cast v2, Ll/fyr0;

    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    add-int/lit8 v1, v1, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    const-string p0, "]"

    .line 57
    .line 58
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0
.end method
