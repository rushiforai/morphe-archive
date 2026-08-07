.class Ll/nwq0$b;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/nwq0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field private final a:Ll/i0r0;

.field private final b:Ll/mrq0;

.field private final c:Ljava/io/File;

.field private final d:Ljava/io/File;

.field final synthetic e:Ll/nwq0;


# direct methods
.method public constructor <init>(Ll/nwq0;Ljava/io/File;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/nwq0$b;->e:Ll/nwq0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/nwq0$b;->c:Ljava/io/File;

    .line 7
    .line 8
    invoke-static {}, Ll/n0r0;->i()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p2}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {p1, v0}, Ll/j5r0;->c(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Ll/nwq0$b;->d:Ljava/io/File;

    .line 21
    .line 22
    new-instance p1, Ll/mrq0;

    .line 23
    .line 24
    invoke-direct {p1, p2}, Ll/mrq0;-><init>(Ljava/io/File;)V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Ll/nwq0$b;->b:Ll/mrq0;

    .line 28
    .line 29
    new-instance v0, Ll/i0r0;

    .line 30
    .line 31
    invoke-direct {v0, p2}, Ll/i0r0;-><init>(Ljava/io/File;)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Ll/nwq0$b;->a:Ll/i0r0;

    .line 35
    .line 36
    invoke-virtual {p1}, Ll/mrq0;->a()Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-eqz p0, :cond_0

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/i0r0;->a()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    if-nez p0, :cond_0

    .line 47
    .line 48
    invoke-virtual {v0, p2}, Ll/i0r0;->b(Ljava/io/File;)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method

.method public static synthetic b(Ll/nwq0$b;)Ll/mrq0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nwq0$b;->b:Ll/mrq0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Ll/nwq0$b;)Ll/i0r0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nwq0$b;->a:Ll/i0r0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Ll/nwq0$b;)Ljava/io/File;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nwq0$b;->c:Ljava/io/File;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public a()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/nwq0$b;->b:Ll/mrq0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/mrq0;->c()Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    :try_start_0
    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const-string v0, "start_time"

    .line 16
    .line 17
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljava/lang/String;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    :goto_0
    if-eqz p0, :cond_1

    .line 26
    .line 27
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 28
    .line 29
    .line 30
    move-result-wide v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    return-wide v0

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    invoke-static {}, Ll/pwq0;->a()Ll/pwq0;

    .line 34
    .line 35
    .line 36
    const-string v0, "NPTH_CATCH"

    .line 37
    .line 38
    invoke-static {v0, p0}, Ll/pwq0;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 39
    .line 40
    .line 41
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 42
    .line 43
    .line 44
    move-result-wide v0

    .line 45
    return-wide v0
.end method

.method public c()Ljava/io/File;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nwq0$b;->c:Ljava/io/File;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nwq0$b;->b:Ll/mrq0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/mrq0;->a()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
