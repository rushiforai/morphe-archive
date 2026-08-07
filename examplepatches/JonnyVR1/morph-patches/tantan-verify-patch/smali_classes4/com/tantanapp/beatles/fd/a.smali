.class public Lcom/tantanapp/beatles/fd/a;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Z

.field public static b:Ll/tlg;

.field public static c:I

.field public static d:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tantanapp/beatles/fd/a$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tantanapp/beatles/fd/a$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/tantanapp/beatles/fd/a;->d:Ljava/lang/Runnable;

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

.method public static synthetic a()Ll/ulg;
    .locals 1

    .line 1
    invoke-static {}, Lcom/tantanapp/beatles/fd/a;->c()Ll/ulg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static synthetic b()Ll/tlg;
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/beatles/fd/a;->b:Ll/tlg;

    .line 2
    .line 3
    return-object v0
.end method

.method public static c()Ll/ulg;
    .locals 9

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-static {}, Lcom/tantanapp/beatles/fd/a;->d()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_5

    .line 15
    .line 16
    array-length v1, v0

    .line 17
    invoke-static {v1}, Lcom/tantanapp/beatles/fd/a;->g(I)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    goto :goto_3

    .line 24
    :cond_0
    new-instance v1, Ljava/util/HashMap;

    .line 25
    .line 26
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 27
    .line 28
    .line 29
    :try_start_0
    array-length v2, v0

    .line 30
    const/4 v3, 0x0

    .line 31
    move v4, v3

    .line 32
    :goto_0
    if-ge v4, v2, :cond_4

    .line 33
    .line 34
    aget-object v5, v0, v4

    .line 35
    .line 36
    invoke-virtual {v5}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v6

    .line 40
    const-string v7, ":"

    .line 41
    .line 42
    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v6

    .line 46
    array-length v7, v6

    .line 47
    const/4 v8, 0x2

    .line 48
    if-ne v7, v8, :cond_1

    .line 49
    .line 50
    aget-object v5, v6, v3

    .line 51
    .line 52
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result v6

    .line 56
    if-nez v6, :cond_2

    .line 57
    .line 58
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    goto :goto_1

    .line 63
    :cond_1
    invoke-virtual {v5}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    :cond_2
    :goto_1
    invoke-virtual {v1, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v6

    .line 71
    check-cast v6, Ljava/lang/Integer;

    .line 72
    .line 73
    const/4 v7, 0x1

    .line 74
    if-eqz v6, :cond_3

    .line 75
    .line 76
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 77
    .line 78
    .line 79
    move-result v6

    .line 80
    add-int/2addr v6, v7

    .line 81
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 82
    .line 83
    .line 84
    move-result-object v6

    .line 85
    goto :goto_2

    .line 86
    :cond_3
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 87
    .line 88
    .line 89
    move-result-object v6

    .line 90
    :goto_2
    invoke-virtual {v1, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 91
    .line 92
    .line 93
    add-int/lit8 v4, v4, 0x1

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :catch_0
    :cond_4
    new-instance v2, Ll/ulg;

    .line 97
    .line 98
    array-length v0, v0

    .line 99
    invoke-direct {v2, v0, v1}, Ll/ulg;-><init>(ILjava/util/HashMap;)V

    .line 100
    .line 101
    .line 102
    return-object v2

    .line 103
    :cond_5
    :goto_3
    const/4 v0, 0x0

    .line 104
    return-object v0
.end method

.method public static d()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "/proc/"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "/fd"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    return-object v0
.end method

.method public static e()V
    .locals 1

    .line 1
    new-instance v0, Ll/tlg;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/tlg;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/beatles/fd/a;->f(Ll/tlg;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static f(Ll/tlg;)V
    .locals 3

    .line 1
    sget-boolean v0, Lcom/tantanapp/beatles/fd/a;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {}, Ll/uu2;->d()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    new-array p0, p0, [Ljava/lang/Object;

    .line 14
    .line 15
    const-string v0, "You should add ExceptionMonitor first!!!"

    .line 16
    .line 17
    invoke-static {v0, p0}, Ll/f610;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    if-nez p0, :cond_2

    .line 22
    .line 23
    new-instance p0, Ll/tlg;

    .line 24
    .line 25
    invoke-direct {p0}, Ll/tlg;-><init>()V

    .line 26
    .line 27
    .line 28
    :cond_2
    sput-object p0, Lcom/tantanapp/beatles/fd/a;->b:Ll/tlg;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/tlg;->b()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    sput v0, Lcom/tantanapp/beatles/fd/a;->c:I

    .line 35
    .line 36
    sget-object v0, Lcom/tantanapp/beatles/fd/a;->d:Ljava/lang/Runnable;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/tlg;->c()J

    .line 39
    .line 40
    .line 41
    move-result-wide v1

    .line 42
    invoke-static {v0, v1, v2}, Ll/u21;->c(Ljava/lang/Runnable;J)V

    .line 43
    .line 44
    .line 45
    const/4 p0, 0x1

    .line 46
    sput-boolean p0, Lcom/tantanapp/beatles/fd/a;->a:Z

    .line 47
    .line 48
    return-void
.end method

.method public static g(I)Z
    .locals 2

    .line 1
    sget v0, Lcom/tantanapp/beatles/fd/a;->c:I

    .line 2
    .line 3
    if-lt p0, v0, :cond_0

    .line 4
    .line 5
    add-int/lit8 v0, v0, 0x32

    .line 6
    .line 7
    sput v0, Lcom/tantanapp/beatles/fd/a;->c:I

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    sget-object v0, Lcom/tantanapp/beatles/fd/a;->b:Ll/tlg;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/tlg;->b()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    if-ge p0, v0, :cond_1

    .line 19
    .line 20
    sget-object p0, Lcom/tantanapp/beatles/fd/a;->b:Ll/tlg;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/tlg;->b()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    sput p0, Lcom/tantanapp/beatles/fd/a;->c:I

    .line 27
    .line 28
    :cond_1
    return v1
.end method
