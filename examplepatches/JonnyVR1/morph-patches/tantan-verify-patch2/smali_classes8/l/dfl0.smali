.class public Ll/dfl0;
.super Ll/k4;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/dfl0$a;
    }
.end annotation


# instance fields
.field public a:Ll/y4m;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/k4;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/xpq0;

    .line 5
    .line 6
    invoke-static {}, Ll/yge;->b()Ljava/io/File;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {v0, v1}, Ll/xpq0;-><init>(Ljava/io/File;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/dfl0;->a:Ll/y4m;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic d(Ll/dfl0$a;Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/dfl0$a;->a(Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method


# virtual methods
.method public a()Ll/y4m;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dfl0;->a:Ll/y4m;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Ljava/lang/String;ZLl/y4m$a;)Z
    .locals 9

    .line 1
    invoke-virtual {p0, p1}, Ll/k4;->b(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/dfl0;->a:Ll/y4m;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v3, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v4, v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicURL:Ljava/lang/String;

    .line 15
    .line 16
    invoke-interface {v1, v3, v4}, Ll/y4m;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v3, p0, Ll/dfl0;->a:Ll/y4m;

    .line 21
    .line 22
    iget-object v4, v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicURL:Ljava/lang/String;

    .line 23
    .line 24
    invoke-interface {v3, p1, v4}, Ll/y4m;->c(Ljava/lang/String;Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    if-eqz v3, :cond_0

    .line 29
    .line 30
    new-instance p0, Ljava/io/File;

    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {p1}, Lcom/tantanapp/media/ttmediaeffect/video/VideoEffectModel;->getConfigPath(Ljava/lang/String;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_1

    .line 48
    .line 49
    const/4 p0, 0x1

    .line 50
    return p0

    .line 51
    :cond_0
    if-eqz p2, :cond_1

    .line 52
    .line 53
    iget-object v3, p0, Ll/dfl0;->a:Ll/y4m;

    .line 54
    .line 55
    iget-object v5, v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicURL:Ljava/lang/String;

    .line 56
    .line 57
    iget-object v6, v0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->dynamicMD5:Ljava/lang/String;

    .line 58
    .line 59
    const-string p0, "IMMEDIATE"

    .line 60
    .line 61
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/CoreGiftPriority;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/CoreGiftPriority;

    .line 62
    .line 63
    .line 64
    move-result-object v7

    .line 65
    move-object v4, p1

    .line 66
    move-object v8, p3

    .line 67
    invoke-interface/range {v3 .. v8}, Ll/y4m;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/CoreGiftPriority;Ll/y4m$a;)V

    .line 68
    .line 69
    .line 70
    :cond_1
    return v2
.end method

.method public e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/dfl0$a;)Ll/kcg0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dfl0;->a:Ll/y4m;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/y4m;->d(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance p1, Ll/bfl0;

    .line 12
    .line 13
    invoke-direct {p1}, Ll/bfl0;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    new-instance p1, Ll/cfl0;

    .line 29
    .line 30
    invoke-direct {p1, p4}, Ll/cfl0;-><init>(Ll/dfl0$a;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method
