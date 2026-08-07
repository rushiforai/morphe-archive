.class public Ll/nwq0$e;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/nwq0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "e"
.end annotation


# instance fields
.field protected a:Ljava/io/File;

.field protected b:Ljava/lang/String;

.field protected c:Ljava/lang/String;

.field protected d:I

.field final synthetic e:Ll/nwq0;


# direct methods
.method public constructor <init>(Ll/nwq0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nwq0$e;->e:Ll/nwq0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()I
    .locals 4

    .line 1
    iget-object v0, p0, Ll/nwq0$e;->a:Ljava/io/File;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, -0x1

    .line 8
    if-eqz v0, :cond_4

    .line 9
    .line 10
    iget-object v0, p0, Ll/nwq0$e;->a:Ljava/io/File;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    goto :goto_2

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    :try_start_0
    new-instance v2, Ljava/io/FileReader;

    .line 21
    .line 22
    iget-object v3, p0, Ll/nwq0$e;->a:Ljava/io/File;

    .line 23
    .line 24
    invoke-direct {v2, v3}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    .line 25
    .line 26
    .line 27
    new-instance v3, Ljava/io/BufferedReader;

    .line 28
    .line 29
    invoke-direct {v3, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 30
    .line 31
    .line 32
    move v0, v1

    .line 33
    :goto_0
    :try_start_1
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    if-eqz v2, :cond_1

    .line 38
    .line 39
    invoke-virtual {p0, v2}, Ll/nwq0$e;->b(Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    if-ne v0, v1, :cond_1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :catchall_0
    move-exception p0

    .line 47
    move v1, v0

    .line 48
    move-object v0, v3

    .line 49
    goto :goto_1

    .line 50
    :cond_1
    invoke-static {v3}, Ll/m4r0;->a(Ljava/io/Closeable;)V

    .line 51
    .line 52
    .line 53
    return v0

    .line 54
    :catchall_1
    move-exception p0

    .line 55
    :goto_1
    :try_start_2
    invoke-static {}, Ll/pwq0;->a()Ll/pwq0;

    .line 56
    .line 57
    .line 58
    const-string v2, "NPTH_CATCH"

    .line 59
    .line 60
    invoke-static {v2, p0}, Ll/pwq0;->b(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 61
    .line 62
    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    invoke-static {v0}, Ll/m4r0;->a(Ljava/io/Closeable;)V

    .line 66
    .line 67
    .line 68
    :cond_2
    return v1

    .line 69
    :catchall_2
    move-exception p0

    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    invoke-static {v0}, Ll/m4r0;->a(Ljava/io/Closeable;)V

    .line 73
    .line 74
    .line 75
    :cond_3
    throw p0

    .line 76
    :cond_4
    :goto_2
    return v1
.end method

.method public b(Ljava/lang/String;)I
    .locals 2

    .line 1
    iget v0, p0, Ll/nwq0$e;->d:I

    .line 2
    .line 3
    iget-object v1, p0, Ll/nwq0$e;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/nwq0$e;->c:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 p1, 0x1

    .line 18
    :try_start_0
    aget-object p0, p0, p1

    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    goto :goto_0

    .line 29
    :catch_0
    move-exception p0

    .line 30
    invoke-static {}, Ll/pwq0;->a()Ll/pwq0;

    .line 31
    .line 32
    .line 33
    const-string p1, "NPTH_CATCH"

    .line 34
    .line 35
    invoke-static {p1, p0}, Ll/pwq0;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    :goto_0
    if-gez v0, :cond_0

    .line 39
    .line 40
    const/4 v0, -0x2

    .line 41
    :cond_0
    return v0
.end method
