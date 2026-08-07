.class public Ll/n120;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static volatile a:Ll/zz10; = null

.field private static volatile b:Landroid/os/Handler; = null

.field private static c:Ljava/lang/String; = null

.field private static d:I = 0x0

.field private static e:I = 0x0

.field private static f:Z = true

.field private static g:Z = false

.field private static h:Z = false

.field private static i:J = 0x0L

.field private static j:J = -0x2L

.field private static k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


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
    return-void
.end method

.method private static a()V
    .locals 1

    .line 1
    sget-object v0, Ll/n120;->k:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    sput-object v0, Ll/n120;->k:Ljava/util/List;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static b()Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return v0
.end method

.method public static c()J
    .locals 2

    .line 1
    sget-wide v0, Ll/n120;->j:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static d(Z)Ll/zz10;
    .locals 3

    .line 1
    sget-object v0, Ll/n120;->a:Ll/zz10;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/n120;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/n120;->a:Ll/zz10;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/zz10;

    .line 13
    .line 14
    invoke-static {}, Ll/n120;->b()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    invoke-direct {v1, v2, p0}, Ll/zz10;-><init>(ZZ)V

    .line 19
    .line 20
    .line 21
    sput-object v1, Ll/n120;->a:Ll/zz10;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    :goto_0
    monitor-exit v0

    .line 27
    goto :goto_2

    .line 28
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    throw p0

    .line 30
    :cond_1
    :goto_2
    sget-object p0, Ll/n120;->a:Ll/zz10;

    .line 31
    .line 32
    return-object p0
.end method

.method private static e(Ljava/lang/String;II)Z
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    sget-object v0, Ll/n120;->c:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    sget p0, Ll/n120;->d:I

    .line 12
    .line 13
    if-ne p1, p0, :cond_0

    .line 14
    .line 15
    sget p0, Ll/n120;->e:I

    .line 16
    .line 17
    if-ne p2, p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public static f()Z
    .locals 1

    .line 1
    sget-object v0, Ll/n120;->a:Ll/zz10;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ll/n120;->a:Ll/zz10;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/zz10;->h()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-boolean v0, Ll/n120;->g:Z

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    return v0

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    return v0
.end method

.method public static g()V
    .locals 2

    .line 1
    const-wide/16 v0, -0x6f

    .line 2
    .line 3
    invoke-static {v0, v1}, Ll/n120;->h(J)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static h(J)Z
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "pause "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-boolean v1, Ll/n120;->g:Z

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "MusicUtils---xfy---"

    .line 18
    .line 19
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    sget-wide v0, Ll/n120;->j:J

    .line 23
    .line 24
    cmp-long p0, v0, p0

    .line 25
    .line 26
    const/4 p1, 0x0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    const-wide/high16 v2, -0x8000000000000000L

    .line 30
    .line 31
    cmp-long p0, v0, v2

    .line 32
    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    return p1

    .line 36
    :cond_0
    invoke-static {}, Ll/n120;->f()Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    const/4 v0, 0x1

    .line 41
    if-eqz p0, :cond_1

    .line 42
    .line 43
    sget-object p0, Ll/n120;->a:Ll/zz10;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/zz10;->i()V

    .line 46
    .line 47
    .line 48
    sput-boolean p1, Ll/n120;->g:Z

    .line 49
    .line 50
    sput-boolean v0, Ll/n120;->h:Z

    .line 51
    .line 52
    :cond_1
    return v0
.end method

.method public static i()V
    .locals 2

    .line 1
    sget-object v0, Ll/n120;->b:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    sget-object v0, Ll/n120;->b:Landroid/os/Handler;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    sput-object v1, Ll/n120;->b:Landroid/os/Handler;

    .line 12
    .line 13
    invoke-static {}, Ll/n120;->j()V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/n120;->a()V

    .line 17
    .line 18
    .line 19
    sget-object v0, Ll/n120;->a:Ll/zz10;

    .line 20
    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    sget-object v0, Ll/n120;->a:Ll/zz10;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/zz10;->h()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    sget-object v0, Ll/n120;->a:Ll/zz10;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/zz10;->i()V

    .line 34
    .line 35
    .line 36
    :cond_1
    sget-object v0, Ll/n120;->a:Ll/zz10;

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/zz10;->j()V

    .line 39
    .line 40
    .line 41
    :cond_2
    sput-object v1, Ll/n120;->a:Ll/zz10;

    .line 42
    .line 43
    const-wide/16 v0, 0x0

    .line 44
    .line 45
    sput-wide v0, Ll/n120;->i:J

    .line 46
    .line 47
    return-void
.end method

.method public static j()V
    .locals 1

    .line 1
    invoke-static {}, Ll/n120;->k()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    sput-object v0, Ll/n120;->c:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    sput-boolean v0, Ll/n120;->g:Z

    .line 9
    .line 10
    sput-boolean v0, Ll/n120;->h:Z

    .line 11
    .line 12
    return-void
.end method

.method private static k()V
    .locals 1

    .line 1
    sget-object v0, Ll/n120;->a:Ll/zz10;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ll/n120;->a:Ll/zz10;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/zz10;->k()V

    .line 8
    .line 9
    .line 10
    :cond_0
    const/4 v0, 0x1

    .line 11
    sput-boolean v0, Ll/n120;->f:Z

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    sput-boolean v0, Ll/n120;->g:Z

    .line 15
    .line 16
    sput-boolean v0, Ll/n120;->h:Z

    .line 17
    .line 18
    return-void
.end method

.method public static l(F)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    sget-wide v0, Ll/n120;->j:J

    .line 2
    .line 3
    invoke-static {v0, v1, p0}, Ll/n120;->m(JF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private static m(JF)V
    .locals 0

    .line 1
    sput-wide p0, Ll/n120;->j:J

    .line 2
    .line 3
    sget-object p0, Ll/n120;->a:Ll/zz10;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-boolean p0, Ll/n120;->f:Z

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Ll/n120;->a:Ll/zz10;

    .line 12
    .line 13
    invoke-virtual {p0, p2}, Ll/zz10;->l(F)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    sput-boolean p0, Ll/n120;->g:Z

    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    sput-boolean p0, Ll/n120;->h:Z

    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public static n(I)V
    .locals 1

    .line 1
    sget-object v0, Ll/n120;->a:Ll/zz10;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ll/n120;->a:Ll/zz10;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ll/zz10;->o(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method private static o(Ljava/lang/String;IIZ)Z
    .locals 3

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    sget-object v0, Ll/n120;->c:Ljava/lang/String;

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-static {p0, p1, p2}, Ll/n120;->e(Ljava/lang/String;II)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    return v2

    .line 21
    :cond_1
    invoke-static {p3}, Ll/n120;->d(Z)Ll/zz10;

    .line 22
    .line 23
    .line 24
    invoke-static {}, Ll/n120;->j()V

    .line 25
    .line 26
    .line 27
    sput-object p0, Ll/n120;->c:Ljava/lang/String;

    .line 28
    .line 29
    sput p1, Ll/n120;->d:I

    .line 30
    .line 31
    sput p2, Ll/n120;->e:I

    .line 32
    .line 33
    :try_start_0
    sget-object p0, Ll/n120;->a:Ll/zz10;

    .line 34
    .line 35
    sget-object p1, Ll/n120;->c:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ll/zz10;->m(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    sput-boolean v1, Ll/n120;->f:Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    .line 43
    return p0

    .line 44
    :catch_0
    move-exception p0

    .line 45
    const-string p1, "MusicUtils---xfy---"

    .line 46
    .line 47
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 48
    .line 49
    .line 50
    sput-boolean v2, Ll/n120;->f:Z

    .line 51
    .line 52
    return v1
.end method

.method private static p(JIIZF)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "start "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-boolean v1, Ll/n120;->f:Z

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    sget-object v1, Ll/n120;->a:Ll/zz10;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    const/4 v3, 0x1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    move v1, v3

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move v1, v2

    .line 27
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "MusicUtils---xfy---"

    .line 35
    .line 36
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    sput-wide p0, Ll/n120;->j:J

    .line 40
    .line 41
    sget-object p0, Ll/n120;->a:Ll/zz10;

    .line 42
    .line 43
    if-eqz p0, :cond_1

    .line 44
    .line 45
    sget-boolean p0, Ll/n120;->f:Z

    .line 46
    .line 47
    if-nez p0, :cond_1

    .line 48
    .line 49
    sget-object p0, Ll/n120;->a:Ll/zz10;

    .line 50
    .line 51
    invoke-virtual {p0, p2, p3, p4, p5}, Ll/zz10;->p(IIZF)V

    .line 52
    .line 53
    .line 54
    sput-boolean v3, Ll/n120;->g:Z

    .line 55
    .line 56
    sput-boolean v2, Ll/n120;->h:Z

    .line 57
    .line 58
    :cond_1
    return-void
.end method

.method private static q(Ljava/lang/String;JIIFZ)J
    .locals 3

    .line 1
    invoke-static {}, Ll/n120;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-wide/16 v1, 0x0

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-wide v1

    .line 10
    :cond_0
    if-nez p0, :cond_1

    .line 11
    .line 12
    return-wide v1

    .line 13
    :cond_1
    move-object v0, p0

    .line 14
    move-wide p0, p1

    .line 15
    move p2, p3

    .line 16
    move p3, p4

    .line 17
    invoke-static {v0, p2, p3}, Ll/n120;->e(Ljava/lang/String;II)Z

    .line 18
    .line 19
    .line 20
    move-result p4

    .line 21
    if-nez p4, :cond_2

    .line 22
    .line 23
    invoke-static {v0, p2, p3, p6}, Ll/n120;->o(Ljava/lang/String;IIZ)Z

    .line 24
    .line 25
    .line 26
    :cond_2
    invoke-static/range {p0 .. p5}, Ll/n120;->p(JIIZF)V

    .line 27
    .line 28
    .line 29
    return-wide p0
.end method

.method public static r(Ljava/lang/String;IIFZ)J
    .locals 9

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "startPlayForRecording startOfMs"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "SDK_VIDEO_SDK"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    new-instance v0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v2, "startPlayForRecording endOfMs"

    .line 23
    .line 24
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    const-wide/16 v3, -0x6f

    .line 38
    .line 39
    move-object v2, p0

    .line 40
    move v5, p1

    .line 41
    move v6, p2

    .line 42
    move v7, p3

    .line 43
    move v8, p4

    .line 44
    invoke-static/range {v2 .. v8}, Ll/n120;->q(Ljava/lang/String;JIIFZ)J

    .line 45
    .line 46
    .line 47
    move-result-wide p0

    .line 48
    return-wide p0
.end method

.method public static s(J)Z
    .locals 4

    .line 1
    sget-wide v0, Ll/n120;->j:J

    .line 2
    .line 3
    cmp-long p0, v0, p0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const-wide/high16 v2, -0x8000000000000000L

    .line 9
    .line 10
    cmp-long p0, v0, v2

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    return p1

    .line 15
    :cond_0
    sget-object p0, Ll/n120;->a:Ll/zz10;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    sget-object p0, Ll/n120;->a:Ll/zz10;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/zz10;->q()V

    .line 22
    .line 23
    .line 24
    sput-boolean p1, Ll/n120;->g:Z

    .line 25
    .line 26
    sput-boolean p1, Ll/n120;->h:Z

    .line 27
    .line 28
    :cond_1
    const/4 p0, 0x0

    .line 29
    sput-object p0, Ll/n120;->c:Ljava/lang/String;

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0
.end method
