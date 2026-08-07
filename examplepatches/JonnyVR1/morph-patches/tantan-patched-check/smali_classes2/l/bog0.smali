.class public final Ll/bog0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public final d:Ljava/io/File;

.field public e:Ljava/io/File;

.field public final f:Ll/mhg0;

.field public final g:Ljava/util/ArrayList;

.field public final h:Z

.field public i:Z


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/io/File;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/bog0;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/bog0;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/bog0;->d:Ljava/io/File;

    .line 9
    .line 10
    new-instance p1, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-static {p4}, Ll/ytg0;->d(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    new-instance p1, Ll/mhg0;

    .line 24
    .line 25
    invoke-direct {p1}, Ll/mhg0;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Ll/bog0;->f:Ll/mhg0;

    .line 29
    .line 30
    const/4 p1, 0x1

    .line 31
    iput-boolean p1, p0, Ll/bog0;->h:Z

    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    new-instance p1, Ll/mhg0;

    .line 35
    .line 36
    invoke-direct {p1, p4}, Ll/mhg0;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iput-object p1, p0, Ll/bog0;->f:Ll/mhg0;

    .line 40
    .line 41
    const/4 p1, 0x0

    .line 42
    iput-boolean p1, p0, Ll/bog0;->h:Z

    .line 43
    .line 44
    new-instance p1, Ljava/io/File;

    .line 45
    .line 46
    invoke-direct {p1, p3, p4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iput-object p1, p0, Ll/bog0;->e:Ljava/io/File;

    .line 50
    .line 51
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/io/File;Ljava/lang/String;Z)V
    .locals 0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput p1, p0, Ll/bog0;->a:I

    .line 54
    iput-object p2, p0, Ll/bog0;->b:Ljava/lang/String;

    .line 55
    iput-object p3, p0, Ll/bog0;->d:Ljava/io/File;

    .line 56
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 57
    invoke-static {p4}, Ll/ytg0;->d(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 58
    new-instance p1, Ll/mhg0;

    invoke-direct {p1}, Ll/mhg0;-><init>()V

    iput-object p1, p0, Ll/bog0;->f:Ll/mhg0;

    goto :goto_0

    .line 59
    :cond_0
    new-instance p1, Ll/mhg0;

    invoke-direct {p1, p4}, Ll/mhg0;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Ll/bog0;->f:Ll/mhg0;

    .line 60
    :goto_0
    iput-boolean p5, p0, Ll/bog0;->h:Z

    return-void
.end method


# virtual methods
.method public final a()Ll/bog0;
    .locals 12

    .line 1
    new-instance v0, Ll/bog0;

    .line 2
    .line 3
    iget v1, p0, Ll/bog0;->a:I

    .line 4
    .line 5
    iget-object v2, p0, Ll/bog0;->b:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v3, p0, Ll/bog0;->d:Ljava/io/File;

    .line 8
    .line 9
    iget-object v4, p0, Ll/bog0;->f:Ll/mhg0;

    .line 10
    .line 11
    iget-object v4, v4, Ll/mhg0;->a:Ljava/lang/String;

    .line 12
    .line 13
    iget-boolean v5, p0, Ll/bog0;->h:Z

    .line 14
    .line 15
    invoke-direct/range {v0 .. v5}, Ll/bog0;-><init>(ILjava/lang/String;Ljava/io/File;Ljava/lang/String;Z)V

    .line 16
    .line 17
    .line 18
    iget-boolean v1, p0, Ll/bog0;->i:Z

    .line 19
    .line 20
    iput-boolean v1, v0, Ll/bog0;->i:Z

    .line 21
    .line 22
    iget-object p0, p0, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    const/4 v2, 0x0

    .line 29
    :goto_0
    if-ge v2, v1, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    add-int/lit8 v2, v2, 0x1

    .line 36
    .line 37
    check-cast v3, Ll/akg0;

    .line 38
    .line 39
    iget-object v4, v0, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 40
    .line 41
    new-instance v5, Ll/akg0;

    .line 42
    .line 43
    iget-wide v6, v3, Ll/akg0;->a:J

    .line 44
    .line 45
    iget-wide v8, v3, Ll/akg0;->b:J

    .line 46
    .line 47
    iget-object v3, v3, Ll/akg0;->c:Ljava/util/concurrent/atomic/AtomicLong;

    .line 48
    .line 49
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 50
    .line 51
    .line 52
    move-result-wide v10

    .line 53
    invoke-direct/range {v5 .. v11}, Ll/akg0;-><init>(JJJ)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    return-object v0
.end method

.method public final b(Ll/aug0;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/bog0;->d:Ljava/io/File;

    .line 2
    .line 3
    iget-object v1, p1, Ll/aug0;->u:Ljava/io/File;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    iget-object v0, p0, Ll/bog0;->b:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v2, p1, Ll/aug0;->c:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    iget-object v0, p1, Ll/aug0;->s:Ll/mhg0;

    .line 25
    .line 26
    iget-object v0, v0, Ll/mhg0;->a:Ljava/lang/String;

    .line 27
    .line 28
    const/4 v2, 0x1

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    iget-object v3, p0, Ll/bog0;->f:Ll/mhg0;

    .line 32
    .line 33
    iget-object v3, v3, Ll/mhg0;->a:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-eqz v3, :cond_2

    .line 40
    .line 41
    return v2

    .line 42
    :cond_2
    iget-boolean v3, p0, Ll/bog0;->h:Z

    .line 43
    .line 44
    if-eqz v3, :cond_6

    .line 45
    .line 46
    iget-boolean p1, p1, Ll/aug0;->r:Z

    .line 47
    .line 48
    if-nez p1, :cond_3

    .line 49
    .line 50
    return v1

    .line 51
    :cond_3
    if-eqz v0, :cond_5

    .line 52
    .line 53
    iget-object p0, p0, Ll/bog0;->f:Ll/mhg0;

    .line 54
    .line 55
    iget-object p0, p0, Ll/mhg0;->a:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-eqz p0, :cond_4

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_4
    return v1

    .line 65
    :cond_5
    :goto_0
    return v2

    .line 66
    :cond_6
    return v1
.end method

.method public final c()J
    .locals 6

    .line 1
    iget-boolean v0, p0, Ll/bog0;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/bog0;->e()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    iget-object p0, p0, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-wide/16 v0, 0x0

    .line 17
    .line 18
    if-eqz p0, :cond_2

    .line 19
    .line 20
    array-length v2, p0

    .line 21
    const/4 v3, 0x0

    .line 22
    :goto_0
    if-ge v3, v2, :cond_2

    .line 23
    .line 24
    aget-object v4, p0, v3

    .line 25
    .line 26
    instance-of v5, v4, Ll/akg0;

    .line 27
    .line 28
    if-eqz v5, :cond_1

    .line 29
    .line 30
    check-cast v4, Ll/akg0;

    .line 31
    .line 32
    iget-wide v4, v4, Ll/akg0;->b:J

    .line 33
    .line 34
    add-long/2addr v0, v4

    .line 35
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    return-wide v0
.end method

.method public final d()Ljava/io/File;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bog0;->f:Ll/mhg0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/mhg0;->a:Ljava/lang/String;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-object v1, p0, Ll/bog0;->e:Ljava/io/File;

    .line 10
    .line 11
    if-nez v1, :cond_1

    .line 12
    .line 13
    new-instance v1, Ljava/io/File;

    .line 14
    .line 15
    iget-object v2, p0, Ll/bog0;->d:Ljava/io/File;

    .line 16
    .line 17
    invoke-direct {v1, v2, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Ll/bog0;->e:Ljava/io/File;

    .line 21
    .line 22
    :cond_1
    iget-object p0, p0, Ll/bog0;->e:Ljava/io/File;

    .line 23
    .line 24
    return-object p0
.end method

.method public final e()J
    .locals 6

    .line 1
    iget-object p0, p0, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    array-length v2, p0

    .line 12
    const/4 v3, 0x0

    .line 13
    :goto_0
    if-ge v3, v2, :cond_1

    .line 14
    .line 15
    aget-object v4, p0, v3

    .line 16
    .line 17
    instance-of v5, v4, Ll/akg0;

    .line 18
    .line 19
    if-eqz v5, :cond_0

    .line 20
    .line 21
    check-cast v4, Ll/akg0;

    .line 22
    .line 23
    iget-object v4, v4, Ll/akg0;->c:Ljava/util/concurrent/atomic/AtomicLong;

    .line 24
    .line 25
    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 26
    .line 27
    .line 28
    move-result-wide v4

    .line 29
    add-long/2addr v4, v0

    .line 30
    move-wide v0, v4

    .line 31
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    return-wide v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "id["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ll/bog0;->a:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "] url["

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/bog0;->b:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "] etag["

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ll/bog0;->c:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "] taskOnlyProvidedParentPath["

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-boolean v1, p0, Ll/bog0;->h:Z

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "] parent path["

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Ll/bog0;->d:Ljava/io/File;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, "] filename["

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Ll/bog0;->f:Ll/mhg0;

    .line 59
    .line 60
    iget-object v1, v1, Ll/mhg0;->a:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string v1, "] block(s):"

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    iget-object p0, p0, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 71
    .line 72
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    return-object p0
.end method
