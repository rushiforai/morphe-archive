.class public final Ll/nxi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wk90;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/nxi0$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/wk90<",
        "TT;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u000b\u0018\u0000 \u0016*\u0004\u0008\u0000\u0010\u00012\u0008\u0012\u0004\u0012\u00028\u00000\u0002:\u0001\u000fB\u001d\u0012\u000c\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J%\u0010\r\u001a\u00020\u000c2\u000c\u0010\t\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u00082\u0006\u0010\u000b\u001a\u00020\nH\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000eR\u001d\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u000f\u0010\u0010\u001a\u0004\u0008\u0011\u0010\u0012R\u0017\u0010\u0005\u001a\u00020\u00048\u0006\u00a2\u0006\u000c\n\u0004\u0008\r\u0010\u0013\u001a\u0004\u0008\u0014\u0010\u0015\u00a8\u0006\u0017"
    }
    d2 = {
        "Ll/nxi0;",
        "T",
        "Ll/wk90;",
        "inputProducer",
        "Ll/oxi0;",
        "threadHandoffProducerQueue",
        "<init>",
        "(Ll/wk90;Ll/oxi0;)V",
        "Ll/z06;",
        "consumer",
        "Ll/yk90;",
        "context",
        "",
        "b",
        "(Ll/z06;Ll/yk90;)V",
        "a",
        "Ll/wk90;",
        "c",
        "()Ll/wk90;",
        "Ll/oxi0;",
        "d",
        "()Ll/oxi0;",
        "Companion",
        "imagepipeline_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field public static final Companion:Ll/nxi0$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Ll/wk90;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wk90<",
            "TT;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Ll/oxi0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/nxi0$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/nxi0$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/nxi0;->Companion:Ll/nxi0$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Ll/wk90;Ll/oxi0;)V
    .locals 0
    .param p1    # Ll/wk90;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/oxi0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wk90<",
            "TT;>;",
            "Ll/oxi0;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Ll/nxi0;->a:Ll/wk90;

    .line 11
    .line 12
    iput-object p2, p0, Ll/nxi0;->b:Ll/oxi0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public b(Ll/z06;Ll/yk90;)V
    .locals 5
    .param p1    # Ll/z06;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/yk90;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z06<",
            "TT;>;",
            "Ll/yk90;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/i9j;->d()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    const-string v2, "BackgroundThreadHandoffProducer"

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    invoke-interface {p2}, Ll/yk90;->n()Ll/cl90;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget-object v3, Ll/nxi0;->Companion:Ll/nxi0$a;

    .line 21
    .line 22
    invoke-static {v3, p2}, Ll/nxi0$a;->b(Ll/nxi0$a;Ll/yk90;)Z

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    if-eqz v4, :cond_0

    .line 27
    .line 28
    invoke-interface {v0, p2, v2}, Ll/cl90;->d(Ll/yk90;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-interface {v0, p2, v2, v1}, Ll/cl90;->f(Ll/yk90;Ljava/lang/String;Ljava/util/Map;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/nxi0;->a:Ll/wk90;

    .line 35
    .line 36
    invoke-interface {p0, p1, p2}, Ll/wk90;->b(Ll/z06;Ll/yk90;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    new-instance v1, Ll/nxi0$c;

    .line 41
    .line 42
    invoke-direct {v1, p1, v0, p2, p0}, Ll/nxi0$c;-><init>(Ll/z06;Ll/cl90;Ll/yk90;Ll/nxi0;)V

    .line 43
    .line 44
    .line 45
    new-instance p1, Ll/nxi0$b;

    .line 46
    .line 47
    invoke-direct {p1, v1, p0}, Ll/nxi0$b;-><init>(Ll/z3g0;Ll/nxi0;)V

    .line 48
    .line 49
    .line 50
    invoke-interface {p2, p1}, Ll/yk90;->q(Ll/zk90;)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Ll/nxi0;->b:Ll/oxi0;

    .line 54
    .line 55
    invoke-static {v3, p2}, Ll/nxi0$a;->a(Ll/nxi0$a;Ll/yk90;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-static {v1, p1}, Ll/h9j;->a(Ljava/lang/Runnable;Ljava/lang/String;)Ljava/lang/Runnable;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-interface {p0, p1}, Ll/oxi0;->c(Ljava/lang/Runnable;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_1
    const-string v0, "ThreadHandoffProducer#produceResults"

    .line 68
    .line 69
    invoke-static {v0}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    :try_start_0
    invoke-interface {p2}, Ll/yk90;->n()Ll/cl90;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    sget-object v3, Ll/nxi0;->Companion:Ll/nxi0$a;

    .line 77
    .line 78
    invoke-static {v3, p2}, Ll/nxi0$a;->b(Ll/nxi0$a;Ll/yk90;)Z

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    if-eqz v4, :cond_2

    .line 83
    .line 84
    invoke-interface {v0, p2, v2}, Ll/cl90;->d(Ll/yk90;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    invoke-interface {v0, p2, v2, v1}, Ll/cl90;->f(Ll/yk90;Ljava/lang/String;Ljava/util/Map;)V

    .line 88
    .line 89
    .line 90
    iget-object p0, p0, Ll/nxi0;->a:Ll/wk90;

    .line 91
    .line 92
    invoke-interface {p0, p1, p2}, Ll/wk90;->b(Ll/z06;Ll/yk90;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 93
    .line 94
    .line 95
    invoke-static {}, Ll/i9j;->b()V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_2
    :try_start_1
    new-instance v1, Ll/nxi0$c;

    .line 100
    .line 101
    invoke-direct {v1, p1, v0, p2, p0}, Ll/nxi0$c;-><init>(Ll/z06;Ll/cl90;Ll/yk90;Ll/nxi0;)V

    .line 102
    .line 103
    .line 104
    new-instance p1, Ll/nxi0$b;

    .line 105
    .line 106
    invoke-direct {p1, v1, p0}, Ll/nxi0$b;-><init>(Ll/z3g0;Ll/nxi0;)V

    .line 107
    .line 108
    .line 109
    invoke-interface {p2, p1}, Ll/yk90;->q(Ll/zk90;)V

    .line 110
    .line 111
    .line 112
    iget-object p0, p0, Ll/nxi0;->b:Ll/oxi0;

    .line 113
    .line 114
    invoke-static {v3, p2}, Ll/nxi0$a;->a(Ll/nxi0$a;Ll/yk90;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-static {v1, p1}, Ll/h9j;->a(Ljava/lang/Runnable;Ljava/lang/String;)Ljava/lang/Runnable;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-interface {p0, p1}, Ll/oxi0;->c(Ljava/lang/Runnable;)V

    .line 123
    .line 124
    .line 125
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 126
    .line 127
    invoke-static {}, Ll/i9j;->b()V

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :catchall_0
    move-exception p0

    .line 132
    invoke-static {}, Ll/i9j;->b()V

    .line 133
    .line 134
    .line 135
    throw p0
.end method

.method public final c()Ll/wk90;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/wk90<",
            "TT;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/nxi0;->a:Ll/wk90;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Ll/oxi0;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/nxi0;->b:Ll/oxi0;

    .line 2
    .line 3
    return-object p0
.end method
