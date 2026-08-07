.class public Ll/s4d0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static b:Ll/s4d0;


# instance fields
.field public a:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ll/t4d0;",
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
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/s4d0;->a:Ljava/util/concurrent/ConcurrentHashMap;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Ljava/util/ArrayList;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-ge v0, v1, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Ll/t4d0$a;

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {v1}, Ll/t4d0$a;->onCancel()V

    .line 17
    .line 18
    .line 19
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    return-void
.end method

.method public static synthetic b(Ll/s4d0;Ljava/lang/String;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/s4d0;->t(Ljava/lang/String;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic c(Ljava/util/ArrayList;Ljava/io/File;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/t4d0$a;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-interface {v0, p1}, Ll/t4d0$a;->a(Ljava/io/File;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    return-void
.end method

.method public static synthetic d(Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-ge v0, v1, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Ll/t4d0$a;

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {v1, p1}, Ll/t4d0$a;->onFailed(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    return-void
.end method

.method public static synthetic e(Ljava/util/ArrayList;Ljava/lang/Integer;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-ge v0, v1, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Ll/t4d0$a;

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    int-to-float v2, v2

    .line 21
    invoke-interface {v1, v2}, Ll/t4d0$a;->c(F)V

    .line 22
    .line 23
    .line 24
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    return-void
.end method

.method public static synthetic f(Ll/s4d0;Ljava/lang/String;Ll/v5;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/s4d0;->s(Ljava/lang/String;Ll/v5;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic g(Ll/s4d0;Ll/k9e;Ljava/lang/String;Ljava/lang/String;Ljava/lang/StringBuffer;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/s4d0;->u(Ll/k9e;Ljava/lang/String;Ljava/lang/String;Ljava/lang/StringBuffer;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic i(Ll/s4d0;Ljava/lang/String;Lcom/p1/mobile/putong/ui/download/DownloadTask;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/s4d0;->v(Ljava/lang/String;Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    return-void
.end method

.method public static synthetic j(Ll/s4d0;Ljava/lang/String;Ljava/lang/StringBuffer;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/s4d0;->w(Ljava/lang/String;Ljava/lang/StringBuffer;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static q()Ll/s4d0;
    .locals 2

    .line 1
    sget-object v0, Ll/s4d0;->b:Ll/s4d0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/s4d0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/s4d0;->b:Ll/s4d0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/s4d0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/s4d0;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/s4d0;->b:Ll/s4d0;

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
    sget-object v0, Ll/s4d0;->b:Ll/s4d0;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public final k(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s4d0;->a:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ll/t4d0;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p1}, Ll/t4d0;->b()Ljava/util/ArrayList;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    if-nez p1, :cond_1

    .line 17
    .line 18
    :goto_0
    return-void

    .line 19
    :cond_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Ljava/util/ArrayList;

    .line 24
    .line 25
    new-instance v0, Ll/r4d0;

    .line 26
    .line 27
    invoke-direct {v0, p1}, Ll/r4d0;-><init>(Ljava/util/ArrayList;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/s4d0;->o(Ll/x20;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final l(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s4d0;->a:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ll/t4d0;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p1}, Ll/t4d0;->b()Ljava/util/ArrayList;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    if-nez p1, :cond_1

    .line 17
    .line 18
    :goto_0
    return-void

    .line 19
    :cond_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Ljava/util/ArrayList;

    .line 24
    .line 25
    new-instance v0, Ll/p4d0;

    .line 26
    .line 27
    invoke-direct {v0, p1, p2}, Ll/p4d0;-><init>(Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/s4d0;->o(Ll/x20;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final m(Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s4d0;->a:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ll/t4d0;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p1}, Ll/t4d0;->b()Ljava/util/ArrayList;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    if-nez p1, :cond_1

    .line 17
    .line 18
    :goto_0
    return-void

    .line 19
    :cond_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Ljava/util/ArrayList;

    .line 24
    .line 25
    new-instance v0, Ll/q4d0;

    .line 26
    .line 27
    invoke-direct {v0, p1, p2}, Ll/q4d0;-><init>(Ljava/util/ArrayList;Ljava/lang/Integer;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/s4d0;->o(Ll/x20;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final n(Ljava/lang/String;Ljava/io/File;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s4d0;->a:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ll/t4d0;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p1}, Ll/t4d0;->b()Ljava/util/ArrayList;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    if-nez p1, :cond_1

    .line 17
    .line 18
    :goto_0
    return-void

    .line 19
    :cond_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Ljava/util/ArrayList;

    .line 24
    .line 25
    new-instance v0, Ll/o4d0;

    .line 26
    .line 27
    invoke-direct {v0, p1, p2}, Ll/o4d0;-><init>(Ljava/util/ArrayList;Ljava/io/File;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/s4d0;->o(Ll/x20;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final o(Ll/x20;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    new-instance p0, Ll/bri0;

    .line 5
    .line 6
    invoke-direct {p0, p1}, Ll/bri0;-><init>(Ll/x20;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public p(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/CoreGiftPriority;Ll/k9e;Ll/v5;Ll/t4d0$a;)V
    .locals 3

    .line 1
    invoke-virtual {p0, p2}, Ll/s4d0;->r(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/s4d0;->a:Ljava/util/concurrent/ConcurrentHashMap;

    .line 8
    .line 9
    invoke-virtual {v0, p2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ll/t4d0;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 v1, 0x1

    .line 18
    const/4 v0, 0x0

    .line 19
    :goto_0
    if-nez v0, :cond_1

    .line 20
    .line 21
    new-instance v0, Ll/t4d0;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/t4d0;-><init>()V

    .line 24
    .line 25
    .line 26
    :cond_1
    invoke-static {p7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_2

    .line 31
    .line 32
    invoke-virtual {v0, p7}, Ll/t4d0;->a(Ll/t4d0$a;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    if-eqz v1, :cond_5

    .line 36
    .line 37
    move-object p7, p4

    .line 38
    move-object p4, p2

    .line 39
    move-object p2, p5

    .line 40
    new-instance p5, Ljava/lang/StringBuffer;

    .line 41
    .line 42
    invoke-direct {p5}, Ljava/lang/StringBuffer;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, p7}, Ll/t4d0;->c(Lcom/p1/mobile/putong/core/data/CoreGiftPriority;)V

    .line 46
    .line 47
    .line 48
    if-eqz p6, :cond_3

    .line 49
    .line 50
    invoke-virtual {p6, p1, p4}, Ll/v5;->c(Ljava/lang/String;Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result p7

    .line 54
    if-eqz p7, :cond_3

    .line 55
    .line 56
    new-instance p2, Ll/i4d0;

    .line 57
    .line 58
    invoke-direct {p2, p0, p4, p6, p1}, Ll/i4d0;-><init>(Ll/s4d0;Ljava/lang/String;Ll/v5;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, p2}, Ll/s4d0;->x(Ljava/lang/Runnable;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_3
    if-eqz p6, :cond_4

    .line 66
    .line 67
    invoke-virtual {p6, p1, p4}, Ll/v5;->m(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    :cond_4
    new-instance p6, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 71
    .line 72
    sget-object p7, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 73
    .line 74
    invoke-virtual {p7}, Lcom/p1/mobile/putong/api/api/Network;->getDownloadHttp()Ll/rg50;

    .line 75
    .line 76
    .line 77
    move-result-object p7

    .line 78
    invoke-direct {p6, p7}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;-><init>(Ll/rg50;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p6, p4}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->q(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 82
    .line 83
    .line 84
    move-result-object p6

    .line 85
    invoke-virtual {p6, p3}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 86
    .line 87
    .line 88
    move-result-object p3

    .line 89
    new-instance p6, Ll/j4d0;

    .line 90
    .line 91
    invoke-direct {p6}, Ll/j4d0;-><init>()V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p3, p6}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->i(Ll/y20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 95
    .line 96
    .line 97
    move-result-object p3

    .line 98
    new-instance p6, Ll/k4d0;

    .line 99
    .line 100
    invoke-direct {p6, p0, p4}, Ll/k4d0;-><init>(Ll/s4d0;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p3, p6}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->g(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 104
    .line 105
    .line 106
    move-result-object p6

    .line 107
    move-object p3, p1

    .line 108
    move-object p1, p0

    .line 109
    new-instance p0, Ll/l4d0;

    .line 110
    .line 111
    invoke-direct/range {p0 .. p5}, Ll/l4d0;-><init>(Ll/s4d0;Ll/k9e;Ljava/lang/String;Ljava/lang/String;Ljava/lang/StringBuffer;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p6, p0}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->j(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    new-instance p2, Ll/m4d0;

    .line 119
    .line 120
    invoke-direct {p2, p1, p4}, Ll/m4d0;-><init>(Ll/s4d0;Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->d(Ll/y20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    new-instance p2, Ll/n4d0;

    .line 128
    .line 129
    invoke-direct {p2, p1, p4, p5}, Ll/n4d0;-><init>(Ll/s4d0;Ljava/lang/String;Ljava/lang/StringBuffer;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->f(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->a()Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-static {}, Lcom/p1/mobile/putong/ui/download/a;->u()Lcom/p1/mobile/putong/ui/download/a;

    .line 141
    .line 142
    .line 143
    move-result-object p2

    .line 144
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/ui/download/a;->o(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 145
    .line 146
    .line 147
    goto :goto_1

    .line 148
    :cond_5
    move-object p1, p0

    .line 149
    move-object p4, p2

    .line 150
    :goto_1
    iget-object p0, p1, Ll/s4d0;->a:Ljava/util/concurrent/ConcurrentHashMap;

    .line 151
    .line 152
    invoke-virtual {p0, p4, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    return-void
.end method

.method public r(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s4d0;->a:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic s(Ljava/lang/String;Ll/v5;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p2, p3, p1}, Ll/v5;->k(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0, p1, p2}, Ll/s4d0;->n(Ljava/lang/String;Ljava/io/File;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic t(Ljava/lang/String;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p3}, Ll/s4d0;->m(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic u(Ll/k9e;Ljava/lang/String;Ljava/lang/String;Ljava/lang/StringBuffer;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-static {p6}, Ll/qwa;->f(Ljava/io/File;)Z

    .line 2
    .line 3
    .line 4
    move-result p5

    .line 5
    if-eqz p5, :cond_3

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-interface {p1, p2, p3, p6}, Ll/k9e;->a(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    .line 10
    .line 11
    .line 12
    move-result-object p6

    .line 13
    :cond_0
    invoke-static {p6}, Ll/qwa;->f(Ljava/io/File;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0, p3, p6}, Ll/s4d0;->n(Ljava/lang/String;Ljava/io/File;)V

    .line 20
    .line 21
    .line 22
    goto :goto_2

    .line 23
    :cond_1
    invoke-virtual {p4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_2

    .line 32
    .line 33
    const-string p1, "progressFile.null"

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    invoke-virtual {p4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    :goto_0
    invoke-virtual {p0, p3, p1}, Ll/s4d0;->l(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    goto :goto_2

    .line 44
    :cond_3
    invoke-virtual {p4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_4

    .line 53
    .line 54
    const-string p1, "file.null"

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_4
    invoke-virtual {p4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    :goto_1
    invoke-virtual {p0, p3, p1}, Ll/s4d0;->l(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :goto_2
    iget-object p0, p0, Ll/s4d0;->a:Ljava/util/concurrent/ConcurrentHashMap;

    .line 65
    .line 66
    invoke-virtual {p0, p3}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final synthetic v(Ljava/lang/String;Lcom/p1/mobile/putong/ui/download/DownloadTask;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s4d0;->k(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/s4d0;->a:Ljava/util/concurrent/ConcurrentHashMap;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic w(Ljava/lang/String;Ljava/lang/StringBuffer;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p3, p0, Ll/s4d0;->a:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {p3, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    new-instance p3, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v0, "downloadFail: "

    .line 9
    .line 10
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p4}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p4

    .line 17
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p3

    .line 24
    invoke-virtual {p2, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {p0, p1, p2}, Ll/s4d0;->l(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final x(Ljava/lang/Runnable;)V
    .locals 0
    .param p1    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
