.class public Ll/wtb;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/io/File;

.field public b:Ljava/io/PrintWriter;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ll/du2;->p()Ll/cjk0;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ll/cjk0;->l()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v1, "/temp_event"

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {}, Ll/xni0;->c()Ll/yni0;

    .line 30
    .line 31
    .line 32
    invoke-static {}, Ll/xni0;->b()Ll/yni0;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    new-instance v2, Ll/wtb$a;

    .line 37
    .line 38
    invoke-direct {v2, p0, v0}, Ll/wtb$a;-><init>(Ll/wtb;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1, v2}, Ll/yni0;->a(Ljava/lang/Runnable;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public static synthetic a(Ll/wtb;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wtb;->b(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/nki;->g(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/io/File;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-void

    .line 23
    :cond_1
    :goto_0
    new-instance p1, Ljava/io/File;

    .line 24
    .line 25
    const-string v1, "event.json"

    .line 26
    .line 27
    invoke-direct {p1, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Ll/wtb;->a:Ljava/io/File;

    .line 31
    .line 32
    :try_start_0
    new-instance p1, Ljava/io/PrintWriter;

    .line 33
    .line 34
    new-instance v0, Ljava/io/FileWriter;

    .line 35
    .line 36
    iget-object v1, p0, Ll/wtb;->a:Ljava/io/File;

    .line 37
    .line 38
    invoke-direct {v0, v1}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    .line 39
    .line 40
    .line 41
    invoke-direct {p1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 42
    .line 43
    .line 44
    iput-object p1, p0, Ll/wtb;->b:Ljava/io/PrintWriter;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    .line 46
    return-void

    .line 47
    :catch_0
    iget-object p1, p0, Ll/wtb;->a:Ljava/io/File;

    .line 48
    .line 49
    invoke-static {p1}, Ll/nki;->f(Ljava/io/File;)Z

    .line 50
    .line 51
    .line 52
    const/4 p1, 0x0

    .line 53
    iput-object p1, p0, Ll/wtb;->b:Ljava/io/PrintWriter;

    .line 54
    .line 55
    return-void
.end method

.method public c(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v1, v0, [Ljava/lang/Object;

    .line 3
    .line 4
    const-string v2, "saveEvent2DiskCache start!"

    .line 5
    .line 6
    invoke-static {v2, v1}, Ll/f610;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getCacheDir()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Lcom/google/gson/Gson;

    .line 14
    .line 15
    invoke-direct {v2}, Lcom/google/gson/Gson;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v2, p1}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    iget-object v3, p0, Ll/wtb;->b:Ljava/io/PrintWriter;

    .line 23
    .line 24
    if-eqz v3, :cond_0

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getEventType()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    const-string v4, "crash"

    .line 31
    .line 32
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    if-eqz v3, :cond_0

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    :try_start_0
    iget-object v3, p0, Ll/wtb;->b:Ljava/io/PrintWriter;

    .line 40
    .line 41
    invoke-static {v2, v3}, Ll/nki;->p(Ljava/lang/String;Ljava/io/PrintWriter;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    .line 43
    .line 44
    iget-object v2, p0, Ll/wtb;->b:Ljava/io/PrintWriter;

    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/io/PrintWriter;->close()V

    .line 47
    .line 48
    .line 49
    iput-object v1, p0, Ll/wtb;->b:Ljava/io/PrintWriter;

    .line 50
    .line 51
    iget-object p0, p0, Ll/wtb;->a:Ljava/io/File;

    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getCacheDir()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-static {p0, p1}, Ll/nki;->m(Ljava/lang/String;Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :catchall_0
    move-exception p1

    .line 66
    iget-object v0, p0, Ll/wtb;->b:Ljava/io/PrintWriter;

    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/io/PrintWriter;->close()V

    .line 69
    .line 70
    .line 71
    iput-object v1, p0, Ll/wtb;->b:Ljava/io/PrintWriter;

    .line 72
    .line 73
    throw p1

    .line 74
    :cond_0
    const-string p0, "event.json"

    .line 75
    .line 76
    invoke-static {v2, v1, p0}, Ll/nki;->q(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 77
    .line 78
    .line 79
    :goto_0
    const-string p0, "saveEvent2DiskCache end!"

    .line 80
    .line 81
    new-array p1, v0, [Ljava/lang/Object;

    .line 82
    .line 83
    invoke-static {p0, p1}, Ll/f610;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method
