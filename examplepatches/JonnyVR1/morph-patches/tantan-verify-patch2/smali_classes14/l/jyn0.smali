.class public Ll/jyn0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/lang/String; = "templateTypeA"

.field public static b:Ljava/lang/String; = "templateTypeB"

.field public static c:Ll/jyn0;

.field public static d:Ll/us2;

.field public static e:Ll/ss2;

.field public static f:Ll/y4o0;

.field public static g:Ll/z4o0;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/jyn0;->h()Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    new-instance p0, Ll/c5o0;

    .line 11
    .line 12
    invoke-direct {p0}, Ll/c5o0;-><init>()V

    .line 13
    .line 14
    .line 15
    sput-object p0, Ll/jyn0;->d:Ll/us2;

    .line 16
    .line 17
    new-instance p0, Ll/uwn0;

    .line 18
    .line 19
    invoke-direct {p0}, Ll/uwn0;-><init>()V

    .line 20
    .line 21
    .line 22
    sput-object p0, Ll/jyn0;->e:Ll/ss2;

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    new-instance p0, Ll/d5o0;

    .line 26
    .line 27
    invoke-direct {p0}, Ll/d5o0;-><init>()V

    .line 28
    .line 29
    .line 30
    sput-object p0, Ll/jyn0;->d:Ll/us2;

    .line 31
    .line 32
    new-instance p0, Ll/vwn0;

    .line 33
    .line 34
    invoke-direct {p0}, Ll/vwn0;-><init>()V

    .line 35
    .line 36
    .line 37
    sput-object p0, Ll/jyn0;->e:Ll/ss2;

    .line 38
    .line 39
    return-void
.end method

.method public static a()Ll/ss2;
    .locals 1

    .line 1
    invoke-static {}, Ll/jyn0;->c()Ll/jyn0;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-static {v0}, Ll/jyn0;->k(Z)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/jyn0;->e:Ll/ss2;

    .line 9
    .line 10
    return-object v0
.end method

.method public static b(Z)Ll/ss2;
    .locals 0

    .line 1
    invoke-static {}, Ll/jyn0;->c()Ll/jyn0;

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Ll/jyn0;->k(Z)V

    .line 5
    .line 6
    .line 7
    sget-object p0, Ll/jyn0;->e:Ll/ss2;

    .line 8
    .line 9
    return-object p0
.end method

.method public static c()Ll/jyn0;
    .locals 2

    .line 1
    sget-object v0, Ll/jyn0;->c:Ll/jyn0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/jyn0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/jyn0;->c:Ll/jyn0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/jyn0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/jyn0;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/jyn0;->c:Ll/jyn0;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/jyn0;->c:Ll/jyn0;

    .line 27
    .line 28
    return-object v0
.end method

.method public static d()I
    .locals 1

    .line 1
    invoke-static {}, Ll/jyn0;->j()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/16 v0, 0xbb9

    .line 8
    .line 9
    return v0

    .line 10
    :cond_0
    const/16 v0, 0xbba

    .line 11
    .line 12
    return v0
.end method

.method public static e(Ljava/lang/String;)Ll/ts2;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/jyn0;->i(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    sget-object p0, Ll/jyn0;->f:Ll/y4o0;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    new-instance p0, Ll/y4o0;

    .line 12
    .line 13
    invoke-direct {p0}, Ll/y4o0;-><init>()V

    .line 14
    .line 15
    .line 16
    sput-object p0, Ll/jyn0;->f:Ll/y4o0;

    .line 17
    .line 18
    :cond_0
    sget-object p0, Ll/jyn0;->f:Ll/y4o0;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_1
    sget-object p0, Ll/jyn0;->g:Ll/z4o0;

    .line 22
    .line 23
    if-nez p0, :cond_2

    .line 24
    .line 25
    new-instance p0, Ll/z4o0;

    .line 26
    .line 27
    invoke-direct {p0}, Ll/z4o0;-><init>()V

    .line 28
    .line 29
    .line 30
    sput-object p0, Ll/jyn0;->g:Ll/z4o0;

    .line 31
    .line 32
    :cond_2
    sget-object p0, Ll/jyn0;->g:Ll/z4o0;

    .line 33
    .line 34
    return-object p0
.end method

.method public static f()Ll/us2;
    .locals 1

    .line 1
    invoke-static {}, Ll/jyn0;->c()Ll/jyn0;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-static {v0}, Ll/jyn0;->k(Z)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/jyn0;->d:Ll/us2;

    .line 9
    .line 10
    return-object v0
.end method

.method public static g(Z)Ll/us2;
    .locals 0

    .line 1
    invoke-static {}, Ll/jyn0;->c()Ll/jyn0;

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Ll/jyn0;->k(Z)V

    .line 5
    .line 6
    .line 7
    sget-object p0, Ll/jyn0;->d:Ll/us2;

    .line 8
    .line 9
    return-object p0
.end method

.method public static h()Z
    .locals 2

    .line 1
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/vwt;->rb()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Ll/jyn0;->a:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    sget-object v1, Ll/jyn0;->b:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v0, 0x0

    .line 25
    return v0

    .line 26
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 27
    return v0
.end method

.method public static i(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const-string v0, "intlVoiceLive"

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/jyn0;->h()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public static j()Z
    .locals 2

    .line 1
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/vwt;->rb()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Ll/jyn0;->a:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static k(Z)V
    .locals 1

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    sget-object p0, Ll/jyn0;->d:Ll/us2;

    .line 4
    .line 5
    instance-of p0, p0, Ll/d5o0;

    .line 6
    .line 7
    sget-object v0, Ll/jyn0;->e:Ll/ss2;

    .line 8
    .line 9
    instance-of v0, v0, Ll/vwn0;

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    new-instance p0, Ll/d5o0;

    .line 14
    .line 15
    invoke-direct {p0}, Ll/d5o0;-><init>()V

    .line 16
    .line 17
    .line 18
    sput-object p0, Ll/jyn0;->d:Ll/us2;

    .line 19
    .line 20
    :cond_0
    if-nez v0, :cond_5

    .line 21
    .line 22
    new-instance p0, Ll/vwn0;

    .line 23
    .line 24
    invoke-direct {p0}, Ll/vwn0;-><init>()V

    .line 25
    .line 26
    .line 27
    sput-object p0, Ll/jyn0;->e:Ll/ss2;

    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    invoke-static {}, Ll/jyn0;->h()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_3

    .line 35
    .line 36
    sget-object p0, Ll/jyn0;->d:Ll/us2;

    .line 37
    .line 38
    instance-of p0, p0, Ll/c5o0;

    .line 39
    .line 40
    sget-object v0, Ll/jyn0;->e:Ll/ss2;

    .line 41
    .line 42
    instance-of v0, v0, Ll/uwn0;

    .line 43
    .line 44
    if-nez p0, :cond_2

    .line 45
    .line 46
    new-instance p0, Ll/c5o0;

    .line 47
    .line 48
    invoke-direct {p0}, Ll/c5o0;-><init>()V

    .line 49
    .line 50
    .line 51
    sput-object p0, Ll/jyn0;->d:Ll/us2;

    .line 52
    .line 53
    :cond_2
    if-nez v0, :cond_5

    .line 54
    .line 55
    new-instance p0, Ll/uwn0;

    .line 56
    .line 57
    invoke-direct {p0}, Ll/uwn0;-><init>()V

    .line 58
    .line 59
    .line 60
    sput-object p0, Ll/jyn0;->e:Ll/ss2;

    .line 61
    .line 62
    return-void

    .line 63
    :cond_3
    sget-object p0, Ll/jyn0;->d:Ll/us2;

    .line 64
    .line 65
    instance-of p0, p0, Ll/d5o0;

    .line 66
    .line 67
    sget-object v0, Ll/jyn0;->e:Ll/ss2;

    .line 68
    .line 69
    instance-of v0, v0, Ll/vwn0;

    .line 70
    .line 71
    if-nez p0, :cond_4

    .line 72
    .line 73
    new-instance p0, Ll/d5o0;

    .line 74
    .line 75
    invoke-direct {p0}, Ll/d5o0;-><init>()V

    .line 76
    .line 77
    .line 78
    sput-object p0, Ll/jyn0;->d:Ll/us2;

    .line 79
    .line 80
    :cond_4
    if-nez v0, :cond_5

    .line 81
    .line 82
    new-instance p0, Ll/vwn0;

    .line 83
    .line 84
    invoke-direct {p0}, Ll/vwn0;-><init>()V

    .line 85
    .line 86
    .line 87
    sput-object p0, Ll/jyn0;->e:Ll/ss2;

    .line 88
    .line 89
    :cond_5
    return-void
.end method
