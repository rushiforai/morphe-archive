.class final Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl;->b(Ll/yjw;ZLl/mxl$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "run"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# instance fields
.field final synthetic a:Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl;

.field final synthetic b:Ll/mxl$a;

.field final synthetic c:Ll/yjw;

.field final synthetic d:Ljava/lang/String;

.field final synthetic e:Ljava/lang/String;

.field final synthetic f:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl;Ll/mxl$a;Ll/yjw;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl$a;->a:Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl$a;->b:Ll/mxl$a;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl$a;->c:Ll/yjw;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl$a;->d:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl$a;->e:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p6, p0, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl$a;->f:Ljava/lang/String;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl$a;->b:Ll/mxl$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl$a;->c:Ll/yjw;

    .line 6
    .line 7
    invoke-interface {v0, v1}, Ll/mxl$a;->c(Ll/yjw;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl$a;->a:Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl;->d(Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl$a;->d:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v2, p0, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl$a;->c:Ll/yjw;

    .line 19
    .line 20
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl$a;->a:Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl;->c(Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl;)Ll/ivl;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v1, p0, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl$a;->e:Ljava/lang/String;

    .line 30
    .line 31
    new-instance v2, Ljava/io/File;

    .line 32
    .line 33
    iget-object v3, p0, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl$a;->f:Ljava/lang/String;

    .line 34
    .line 35
    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    const/4 v3, 0x0

    .line 39
    invoke-interface {v0, v1, v2, v3, v3}, Ll/ivl;->a(Ljava/lang/String;Ljava/io/File;Ljava/util/Map;Ljava/util/Map;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl$a;->a:Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl;

    .line 43
    .line 44
    invoke-static {v0}, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl;->d(Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v1, p0, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl$a;->d:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl$a;->b:Ll/mxl$a;

    .line 54
    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    iget-object v1, p0, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl$a;->c:Ll/yjw;

    .line 58
    .line 59
    invoke-interface {v0, v1}, Ll/mxl$a;->b(Ll/yjw;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :catch_0
    iget-object v0, p0, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl$a;->a:Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl;

    .line 64
    .line 65
    invoke-static {v0}, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl;->d(Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iget-object v1, p0, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl$a;->d:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl$a;->b:Ll/mxl$a;

    .line 75
    .line 76
    if-eqz v0, :cond_1

    .line 77
    .line 78
    iget-object p0, p0, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl$a;->c:Ll/yjw;

    .line 79
    .line 80
    const/4 v1, -0x1

    .line 81
    invoke-interface {v0, p0, v1}, Ll/mxl$a;->a(Ll/yjw;I)V

    .line 82
    .line 83
    .line 84
    :cond_1
    return-void
.end method
