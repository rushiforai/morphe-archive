.class public Ll/xjl0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/xjl0$a;
    }
.end annotation


# instance fields
.field private final a:Ljava/lang/String;

.field private b:I

.field private c:I

.field private d:Z

.field private e:Z

.field private f:Z

.field private g:Z

.field private h:Ljava/lang/String;

.field private i:Ljava/lang/String;

.field private j:Ll/u7k;

.field private k:I

.field private l:Z

.field private m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/xjl0$a;",
            ">;"
        }
    .end annotation
.end field

.field private n:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "VideoResolutionSelector"

    .line 5
    .line 6
    iput-object v0, p0, Ll/xjl0;->a:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    iput v0, p0, Ll/xjl0;->b:I

    .line 10
    .line 11
    iput v0, p0, Ll/xjl0;->c:I

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    iput-boolean v1, p0, Ll/xjl0;->d:Z

    .line 15
    .line 16
    iput-boolean v1, p0, Ll/xjl0;->e:Z

    .line 17
    .line 18
    iput-boolean v1, p0, Ll/xjl0;->f:Z

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    iput-boolean v2, p0, Ll/xjl0;->g:Z

    .line 22
    .line 23
    iput v0, p0, Ll/xjl0;->k:I

    .line 24
    .line 25
    iput-boolean v1, p0, Ll/xjl0;->l:Z

    .line 26
    .line 27
    new-instance v0, Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Ll/xjl0;->m:Ljava/util/List;

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    iput-object v0, p0, Ll/xjl0;->n:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 36
    .line 37
    iput-object p1, p0, Ll/xjl0;->h:Ljava/lang/String;

    .line 38
    .line 39
    new-instance p1, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/xjl0;->h:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string v0, "Res_2017_10-10.ini"

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iput-object p1, p0, Ll/xjl0;->i:Ljava/lang/String;

    .line 59
    .line 60
    iget-object p1, p0, Ll/xjl0;->j:Ll/u7k;

    .line 61
    .line 62
    if-nez p1, :cond_0

    .line 63
    .line 64
    if-eqz p2, :cond_0

    .line 65
    .line 66
    new-instance p1, Ll/u7k;

    .line 67
    .line 68
    invoke-direct {p1, p2}, Ll/u7k;-><init>(Landroid/content/Context;)V

    .line 69
    .line 70
    .line 71
    iput-object p1, p0, Ll/xjl0;->j:Ll/u7k;

    .line 72
    .line 73
    :cond_0
    iget-boolean p1, p0, Ll/xjl0;->g:Z

    .line 74
    .line 75
    if-nez p1, :cond_1

    .line 76
    .line 77
    invoke-virtual {p0}, Ll/xjl0;->f()V

    .line 78
    .line 79
    .line 80
    :cond_1
    return-void
.end method

.method private d()V
    .locals 4

    .line 1
    const-string v0, "path = "

    .line 2
    .line 3
    :try_start_0
    new-instance v1, Ljava/io/File;

    .line 4
    .line 5
    iget-object v2, p0, Ll/xjl0;->h:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const-string v2, "VideoResolutionSelector"

    .line 11
    .line 12
    new-instance v3, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/xjl0;->h:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v2, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 42
    .line 43
    .line 44
    :cond_1
    new-instance v0, Ljava/io/File;

    .line 45
    .line 46
    iget-object v1, p0, Ll/xjl0;->h:Ljava/lang/String;

    .line 47
    .line 48
    const-string v2, "Res_2017_10-10.ini"

    .line 49
    .line 50
    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_2

    .line 58
    .line 59
    return-void

    .line 60
    :cond_2
    new-instance v0, Ljava/io/RandomAccessFile;

    .line 61
    .line 62
    iget-object p0, p0, Ll/xjl0;->i:Ljava/lang/String;

    .line 63
    .line 64
    const-string v1, "rw"

    .line 65
    .line 66
    invoke-direct {v0, p0, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    const/4 p0, 0x0

    .line 70
    move v1, p0

    .line 71
    :goto_0
    const/4 v2, 0x3

    .line 72
    if-ge v1, v2, :cond_3

    .line 73
    .line 74
    invoke-virtual {v0, p0}, Ljava/io/RandomAccessFile;->writeInt(I)V

    .line 75
    .line 76
    .line 77
    add-int/lit8 v1, v1, 0x1

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_3
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :catch_0
    move-exception p0

    .line 85
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 86
    .line 87
    .line 88
    return-void
.end method


# virtual methods
.method public a()I
    .locals 4

    .line 1
    iget-object v0, p0, Ll/xjl0;->j:Ll/u7k;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x2

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/u7k;->o(Z)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move v0, v2

    .line 13
    :goto_0
    const/4 v3, 0x0

    .line 14
    if-eq v0, v1, :cond_3

    .line 15
    .line 16
    if-eq v0, v2, :cond_2

    .line 17
    .line 18
    const/4 v3, 0x3

    .line 19
    if-eq v0, v3, :cond_1

    .line 20
    .line 21
    return v2

    .line 22
    :cond_1
    iput v3, p0, Ll/xjl0;->k:I

    .line 23
    .line 24
    return v1

    .line 25
    :cond_2
    iput v1, p0, Ll/xjl0;->k:I

    .line 26
    .line 27
    return v3

    .line 28
    :cond_3
    iput v3, p0, Ll/xjl0;->k:I

    .line 29
    .line 30
    return v3
.end method

.method public b(Ll/xjl0$a;)V
    .locals 3

    .line 1
    iget-boolean v0, p1, Ll/xjl0$a;->b:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iput-boolean v1, p0, Ll/xjl0;->e:Z

    .line 7
    .line 8
    :cond_0
    const/4 v2, 0x1

    .line 9
    if-ne v0, v2, :cond_1

    .line 10
    .line 11
    iput-boolean v1, p0, Ll/xjl0;->f:Z

    .line 12
    .line 13
    :cond_1
    iget-object p0, p0, Ll/xjl0;->m:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public c(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/xjl0;->n:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/xjl0;->n:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/xjl0;->n:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->init(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_1

    .line 19
    .line 20
    const-string p0, "VideoResolutionSelect"

    .line 21
    .line 22
    const-string p1, "Init videodataRetriever failed !"

    .line 23
    .line 24
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    iget-object p1, p0, Ll/xjl0;->n:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getWidth()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iget-object v0, p0, Ll/xjl0;->n:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getFrameRate()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    const/16 v1, 0x2d0

    .line 41
    .line 42
    if-ne p1, v1, :cond_2

    .line 43
    .line 44
    const/4 p1, 0x0

    .line 45
    iput p1, p0, Ll/xjl0;->b:I

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_2
    const/16 v1, 0x168

    .line 49
    .line 50
    if-eq p1, v1, :cond_4

    .line 51
    .line 52
    const/16 v1, 0x160

    .line 53
    .line 54
    if-ne p1, v1, :cond_3

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_3
    const/4 p1, 0x1

    .line 58
    iput p1, p0, Ll/xjl0;->b:I

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_4
    :goto_0
    const/4 p1, 0x2

    .line 62
    iput p1, p0, Ll/xjl0;->b:I

    .line 63
    .line 64
    :goto_1
    const/16 p1, 0x8

    .line 65
    .line 66
    const/4 v1, 0x4

    .line 67
    if-ge v0, p1, :cond_5

    .line 68
    .line 69
    move p1, v1

    .line 70
    goto :goto_2

    .line 71
    :cond_5
    const/4 p1, 0x5

    .line 72
    :goto_2
    :try_start_0
    new-instance v0, Ljava/io/RandomAccessFile;

    .line 73
    .line 74
    iget-object v2, p0, Ll/xjl0;->i:Ljava/lang/String;

    .line 75
    .line 76
    const-string v3, "rw"

    .line 77
    .line 78
    invoke-direct {v0, v2, v3}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iget p0, p0, Ll/xjl0;->b:I

    .line 82
    .line 83
    mul-int/2addr p0, v1

    .line 84
    int-to-long v1, p0

    .line 85
    invoke-virtual {v0, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, p1}, Ljava/io/RandomAccessFile;->writeInt(I)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :catch_0
    move-exception p0

    .line 96
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public e()I
    .locals 2

    .line 1
    iget v0, p0, Ll/xjl0;->c:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-boolean v0, p0, Ll/xjl0;->e:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xjl0;->h()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput v0, p0, Ll/xjl0;->c:I

    .line 15
    .line 16
    :cond_0
    iget p0, p0, Ll/xjl0;->c:I

    .line 17
    .line 18
    return p0
.end method

.method public f()V
    .locals 7

    .line 1
    invoke-direct {p0}, Ll/xjl0;->d()V

    .line 2
    .line 3
    .line 4
    :try_start_0
    new-instance v0, Ljava/io/RandomAccessFile;

    .line 5
    .line 6
    iget-object v1, p0, Ll/xjl0;->i:Ljava/lang/String;

    .line 7
    .line 8
    const-string v2, "r"

    .line 9
    .line 10
    invoke-direct {v0, v1, v2}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    move v2, v1

    .line 15
    :goto_0
    const/4 v3, 0x3

    .line 16
    const/4 v4, 0x1

    .line 17
    if-ge v2, v3, :cond_3

    .line 18
    .line 19
    new-instance v3, Ll/xjl0$a;

    .line 20
    .line 21
    invoke-direct {v3, p0, v2}, Ll/xjl0$a;-><init>(Ll/xjl0;I)V

    .line 22
    .line 23
    .line 24
    mul-int/lit8 v5, v2, 0x4

    .line 25
    .line 26
    int-to-long v5, v5

    .line 27
    invoke-virtual {v0, v5, v6}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->readInt()I

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    if-nez v5, :cond_0

    .line 35
    .line 36
    iput-boolean v1, v3, Ll/xjl0$a;->b:Z

    .line 37
    .line 38
    invoke-virtual {p0, v3}, Ll/xjl0;->b(Ll/xjl0$a;)V

    .line 39
    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_0
    and-int/lit8 v5, v5, 0x1

    .line 43
    .line 44
    if-ne v5, v4, :cond_1

    .line 45
    .line 46
    iput-boolean v4, v3, Ll/xjl0$a;->b:Z

    .line 47
    .line 48
    iput-boolean v4, v3, Ll/xjl0$a;->c:Z

    .line 49
    .line 50
    invoke-virtual {p0, v3}, Ll/xjl0;->b(Ll/xjl0$a;)V

    .line 51
    .line 52
    .line 53
    iget-boolean v3, p0, Ll/xjl0;->d:Z

    .line 54
    .line 55
    if-eqz v3, :cond_2

    .line 56
    .line 57
    iput v2, p0, Ll/xjl0;->b:I

    .line 58
    .line 59
    iput-boolean v1, p0, Ll/xjl0;->d:Z

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_1
    iput-boolean v1, v3, Ll/xjl0$a;->c:Z

    .line 63
    .line 64
    iput-boolean v4, v3, Ll/xjl0$a;->b:Z

    .line 65
    .line 66
    invoke-virtual {p0, v3}, Ll/xjl0;->b(Ll/xjl0$a;)V

    .line 67
    .line 68
    .line 69
    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_3
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    .line 73
    .line 74
    .line 75
    iput-boolean v4, p0, Ll/xjl0;->g:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    .line 77
    return-void

    .line 78
    :catch_0
    move-exception p0

    .line 79
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public g()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xjl0;->n:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->release()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/xjl0;->n:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public h()I
    .locals 5

    .line 1
    iget-boolean v0, p0, Ll/xjl0;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xjl0;->a()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Ll/xjl0;->b:I

    .line 10
    .line 11
    return v0

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    move v1, v0

    .line 14
    :goto_0
    iget-object v2, p0, Ll/xjl0;->m:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    iget-object v3, p0, Ll/xjl0;->m:Ljava/util/List;

    .line 21
    .line 22
    const/4 v4, 0x1

    .line 23
    if-ge v1, v2, :cond_4

    .line 24
    .line 25
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Ll/xjl0$a;

    .line 30
    .line 31
    iget-boolean v2, v2, Ll/xjl0$a;->c:Z

    .line 32
    .line 33
    if-ne v2, v4, :cond_2

    .line 34
    .line 35
    if-lez v1, :cond_1

    .line 36
    .line 37
    iget-object v0, p0, Ll/xjl0;->m:Ljava/util/List;

    .line 38
    .line 39
    add-int/lit8 v2, v1, -0x1

    .line 40
    .line 41
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Ll/xjl0$a;

    .line 46
    .line 47
    iget-boolean v0, v0, Ll/xjl0$a;->b:Z

    .line 48
    .line 49
    if-nez v0, :cond_1

    .line 50
    .line 51
    iput v2, p0, Ll/xjl0;->b:I

    .line 52
    .line 53
    return v2

    .line 54
    :cond_1
    iput v1, p0, Ll/xjl0;->b:I

    .line 55
    .line 56
    iput v1, p0, Ll/xjl0;->c:I

    .line 57
    .line 58
    return v1

    .line 59
    :cond_2
    iget-object v2, p0, Ll/xjl0;->m:Ljava/util/List;

    .line 60
    .line 61
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    check-cast v2, Ll/xjl0$a;

    .line 66
    .line 67
    iget-boolean v2, v2, Ll/xjl0$a;->b:Z

    .line 68
    .line 69
    if-eqz v2, :cond_3

    .line 70
    .line 71
    add-int/lit8 v2, v1, 0x1

    .line 72
    .line 73
    iget-object v3, p0, Ll/xjl0;->m:Ljava/util/List;

    .line 74
    .line 75
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    if-ge v2, v3, :cond_3

    .line 80
    .line 81
    iget-object v3, p0, Ll/xjl0;->m:Ljava/util/List;

    .line 82
    .line 83
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    check-cast v3, Ll/xjl0$a;

    .line 88
    .line 89
    iget-boolean v3, v3, Ll/xjl0$a;->b:Z

    .line 90
    .line 91
    if-nez v3, :cond_3

    .line 92
    .line 93
    iput v2, p0, Ll/xjl0;->b:I

    .line 94
    .line 95
    return v2

    .line 96
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_4
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    sub-int/2addr v1, v4

    .line 104
    iput v1, p0, Ll/xjl0;->b:I

    .line 105
    .line 106
    iput v1, p0, Ll/xjl0;->c:I

    .line 107
    .line 108
    iput-boolean v0, p0, Ll/xjl0;->l:Z

    .line 109
    .line 110
    const/4 p0, 0x2

    .line 111
    return p0
.end method
