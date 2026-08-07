.class public Lcom/google/protobuf/n;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final e:Lcom/google/protobuf/h;


# instance fields
.field public a:Lcom/google/protobuf/ByteString;

.field public b:Lcom/google/protobuf/h;

.field public volatile c:Lcom/google/protobuf/q;

.field public volatile d:Lcom/google/protobuf/ByteString;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/h;->b()Lcom/google/protobuf/h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/google/protobuf/n;->e:Lcom/google/protobuf/h;

    .line 6
    .line 7
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


# virtual methods
.method public a(Lcom/google/protobuf/q;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/protobuf/n;->c:Lcom/google/protobuf/q;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    monitor-enter p0

    .line 7
    :try_start_0
    iget-object v0, p0, Lcom/google/protobuf/n;->c:Lcom/google/protobuf/q;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception p1

    .line 14
    goto :goto_2

    .line 15
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/google/protobuf/n;->a:Lcom/google/protobuf/ByteString;

    .line 16
    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    invoke-interface {p1}, Lcom/google/protobuf/q;->getParserForType()Ll/ng60;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Lcom/google/protobuf/n;->a:Lcom/google/protobuf/ByteString;

    .line 24
    .line 25
    iget-object v2, p0, Lcom/google/protobuf/n;->b:Lcom/google/protobuf/h;

    .line 26
    .line 27
    invoke-interface {v0, v1, v2}, Ll/ng60;->a(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lcom/google/protobuf/q;

    .line 32
    .line 33
    iput-object v0, p0, Lcom/google/protobuf/n;->c:Lcom/google/protobuf/q;

    .line 34
    .line 35
    iget-object v0, p0, Lcom/google/protobuf/n;->a:Lcom/google/protobuf/ByteString;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/google/protobuf/n;->d:Lcom/google/protobuf/ByteString;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    iput-object p1, p0, Lcom/google/protobuf/n;->c:Lcom/google/protobuf/q;

    .line 41
    .line 42
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    .line 43
    .line 44
    iput-object v0, p0, Lcom/google/protobuf/n;->d:Lcom/google/protobuf/ByteString;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :catch_0
    :try_start_2
    iput-object p1, p0, Lcom/google/protobuf/n;->c:Lcom/google/protobuf/q;

    .line 48
    .line 49
    sget-object p1, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    .line 50
    .line 51
    iput-object p1, p0, Lcom/google/protobuf/n;->d:Lcom/google/protobuf/ByteString;

    .line 52
    .line 53
    :goto_0
    monitor-exit p0

    .line 54
    :goto_1
    return-void

    .line 55
    :goto_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 56
    throw p1
.end method

.method public b()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/protobuf/n;->d:Lcom/google/protobuf/ByteString;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/protobuf/n;->d:Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/google/protobuf/ByteString;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/google/protobuf/n;->a:Lcom/google/protobuf/ByteString;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/google/protobuf/ByteString;->size()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_1
    iget-object v0, p0, Lcom/google/protobuf/n;->c:Lcom/google/protobuf/q;

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    iget-object p0, p0, Lcom/google/protobuf/n;->c:Lcom/google/protobuf/q;

    .line 26
    .line 27
    invoke-interface {p0}, Lcom/google/protobuf/q;->getSerializedSize()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0

    .line 32
    :cond_2
    const/4 p0, 0x0

    .line 33
    return p0
.end method

.method public c(Lcom/google/protobuf/q;)Lcom/google/protobuf/q;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/protobuf/n;->a(Lcom/google/protobuf/q;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/protobuf/n;->c:Lcom/google/protobuf/q;

    .line 5
    .line 6
    return-object p0
.end method

.method public d(Lcom/google/protobuf/q;)Lcom/google/protobuf/q;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/protobuf/n;->c:Lcom/google/protobuf/q;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput-object v1, p0, Lcom/google/protobuf/n;->a:Lcom/google/protobuf/ByteString;

    .line 5
    .line 6
    iput-object v1, p0, Lcom/google/protobuf/n;->d:Lcom/google/protobuf/ByteString;

    .line 7
    .line 8
    iput-object p1, p0, Lcom/google/protobuf/n;->c:Lcom/google/protobuf/q;

    .line 9
    .line 10
    return-object v0
.end method

.method public e()Lcom/google/protobuf/ByteString;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/protobuf/n;->d:Lcom/google/protobuf/ByteString;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/protobuf/n;->d:Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/google/protobuf/n;->a:Lcom/google/protobuf/ByteString;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_1
    monitor-enter p0

    .line 14
    :try_start_0
    iget-object v0, p0, Lcom/google/protobuf/n;->d:Lcom/google/protobuf/ByteString;

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    iget-object v0, p0, Lcom/google/protobuf/n;->d:Lcom/google/protobuf/ByteString;

    .line 19
    .line 20
    monitor-exit p0

    .line 21
    return-object v0

    .line 22
    :catchall_0
    move-exception v0

    .line 23
    goto :goto_1

    .line 24
    :cond_2
    iget-object v0, p0, Lcom/google/protobuf/n;->c:Lcom/google/protobuf/q;

    .line 25
    .line 26
    if-nez v0, :cond_3

    .line 27
    .line 28
    sget-object v0, Lcom/google/protobuf/ByteString;->EMPTY:Lcom/google/protobuf/ByteString;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/google/protobuf/n;->d:Lcom/google/protobuf/ByteString;

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_3
    iget-object v0, p0, Lcom/google/protobuf/n;->c:Lcom/google/protobuf/q;

    .line 34
    .line 35
    invoke-interface {v0}, Lcom/google/protobuf/q;->toByteString()Lcom/google/protobuf/ByteString;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/google/protobuf/n;->d:Lcom/google/protobuf/ByteString;

    .line 40
    .line 41
    :goto_0
    iget-object v0, p0, Lcom/google/protobuf/n;->d:Lcom/google/protobuf/ByteString;

    .line 42
    .line 43
    monitor-exit p0

    .line 44
    return-object v0

    .line 45
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    throw v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2

    .line 1
    if-ne p0, p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    instance-of v0, p1, Lcom/google/protobuf/n;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_1
    check-cast p1, Lcom/google/protobuf/n;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/google/protobuf/n;->c:Lcom/google/protobuf/q;

    .line 14
    .line 15
    iget-object v1, p1, Lcom/google/protobuf/n;->c:Lcom/google/protobuf/q;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    if-nez v1, :cond_2

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/google/protobuf/n;->e()Lcom/google/protobuf/ByteString;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p1}, Lcom/google/protobuf/n;->e()Lcom/google/protobuf/ByteString;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Lcom/google/protobuf/ByteString;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0

    .line 34
    :cond_2
    if-eqz v0, :cond_3

    .line 35
    .line 36
    if-eqz v1, :cond_3

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    return p0

    .line 43
    :cond_3
    if-eqz v0, :cond_4

    .line 44
    .line 45
    invoke-interface {v0}, Ll/lfz;->getDefaultInstanceForType()Lcom/google/protobuf/q;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p1, p0}, Lcom/google/protobuf/n;->c(Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    return p0

    .line 58
    :cond_4
    invoke-interface {v1}, Ll/lfz;->getDefaultInstanceForType()Lcom/google/protobuf/q;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p0, p1}, Lcom/google/protobuf/n;->c(Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    return p0
.end method

.method public hashCode()I
    .locals 0

    const/4 p0, 0x1

    return p0
.end method
