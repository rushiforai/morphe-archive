.class public final Ll/hlg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/prg0;


# instance fields
.field public final synthetic a:Ll/tog0;


# direct methods
.method public constructor <init>(Ll/tog0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hlg0;->a:Ll/tog0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Ljava/io/File;JLjava/lang/Object;Ll/tpg0;)V
    .locals 9

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/hlg0;->a:Ll/tog0;

    .line 4
    .line 5
    invoke-virtual {v0, p4}, Ll/tog0;->d(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    :cond_0
    move-object v8, p5

    .line 12
    goto :goto_0

    .line 13
    :cond_1
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v1, "processor onDownloadSuccess:"

    .line 20
    .line 21
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "RealSudGameCoreManager"

    .line 32
    .line 33
    invoke-static {v1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    sget-object v0, Ll/fkg0;->a:Ljava/util/concurrent/ExecutorService;

    .line 37
    .line 38
    new-instance v1, Ll/mig0;

    .line 39
    .line 40
    move-object v2, p0

    .line 41
    move-object v4, p1

    .line 42
    move-wide v5, p2

    .line 43
    move-object v7, p4

    .line 44
    move-object v8, p5

    .line 45
    invoke-direct/range {v1 .. v8}, Ll/mig0;-><init>(Ll/hlg0;Ljava/lang/String;Ljava/io/File;JLjava/lang/Object;Ll/gkg0;)V

    .line 46
    .line 47
    .line 48
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :goto_0
    const/4 p0, 0x0

    .line 53
    invoke-virtual {v8, p0}, Ll/tpg0;->a(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final synthetic b(Ljava/lang/String;Ljava/io/File;JLjava/lang/Object;Ll/gkg0;)V
    .locals 4

    .line 1
    const-string v0, "processor onDownloadSuccess beginUnzip file:"

    .line 2
    .line 3
    const-string v1, "RealSudGameCoreManager"

    .line 4
    .line 5
    invoke-static {v1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/isg0;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/isg0;-><init>()V

    .line 11
    .line 12
    .line 13
    iget-object v2, p0, Ll/hlg0;->a:Ll/tog0;

    .line 14
    .line 15
    iget-object v2, v2, Ll/tog0;->c:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p1, v2}, Ll/ing0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/vgg0;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    new-instance v2, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v3, "processor onDownloadSuccess unzipResult:"

    .line 24
    .line 25
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v3, "  path:"

    .line 32
    .line 33
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string p2, "  _sudPathCache:"

    .line 44
    .line 45
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object p2, p0, Ll/hlg0;->a:Ll/tog0;

    .line 49
    .line 50
    iget-object p2, p2, Ll/tog0;->c:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    invoke-static {v1, p2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    iget p1, p1, Ll/vgg0;->a:I

    .line 63
    .line 64
    if-nez p1, :cond_0

    .line 65
    .line 66
    iget-object p1, p0, Ll/hlg0;->a:Ll/tog0;

    .line 67
    .line 68
    invoke-virtual {p1}, Ll/tog0;->a()Ll/vgg0;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    new-instance p2, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    const-string v2, "processor onDownloadSuccess copyRuntimeResult:"

    .line 75
    .line 76
    invoke-direct {p2, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    invoke-static {v1, p2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    iget p1, p1, Ll/vgg0;->a:I

    .line 90
    .line 91
    if-nez p1, :cond_0

    .line 92
    .line 93
    iget-object p1, p0, Ll/hlg0;->a:Ll/tog0;

    .line 94
    .line 95
    invoke-virtual {p1, p3, p4, p5, v0}, Ll/tog0;->c(JLjava/lang/Object;Ll/isg0;)V

    .line 96
    .line 97
    .line 98
    :cond_0
    iget-object p0, p0, Ll/hlg0;->a:Ll/tog0;

    .line 99
    .line 100
    iget-object p0, p0, Ll/tog0;->c:Ljava/lang/String;

    .line 101
    .line 102
    invoke-static {p0}, Ll/ofg0;->b(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    check-cast p6, Ll/tpg0;

    .line 106
    .line 107
    invoke-virtual {p6, v0}, Ll/tpg0;->a(Ljava/lang/Object;)V

    .line 108
    .line 109
    .line 110
    return-void
.end method
