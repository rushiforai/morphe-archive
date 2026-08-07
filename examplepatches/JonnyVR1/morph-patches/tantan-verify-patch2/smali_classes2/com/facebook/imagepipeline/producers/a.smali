.class public final Lcom/facebook/imagepipeline/producers/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wk90;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imagepipeline/producers/a$a;,
        Lcom/facebook/imagepipeline/producers/a$b;,
        Lcom/facebook/imagepipeline/producers/a$c;,
        Lcom/facebook/imagepipeline/producers/a$d;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/wk90<",
        "Ll/fb5<",
        "Ll/db5;",
        ">;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000j\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008*\u0018\u0000 J2\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00030\u00020\u0001:\u0004/\"+$Bw\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\u0008\u0012\u0006\u0010\u000b\u001a\u00020\n\u0012\u0006\u0010\r\u001a\u00020\u000c\u0012\u0006\u0010\u000f\u001a\u00020\u000e\u0012\u0006\u0010\u0010\u001a\u00020\u000e\u0012\u000e\u0010\u0012\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00110\u0001\u0012\u0006\u0010\u0014\u001a\u00020\u0013\u0012\u0006\u0010\u0016\u001a\u00020\u0015\u0012\u0008\u0010\u0018\u001a\u0004\u0018\u00010\u0017\u0012\u000c\u0010\u001a\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\u0019\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJ+\u0010\"\u001a\u00020!2\u0012\u0010\u001e\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00030\u00020\u001d2\u0006\u0010 \u001a\u00020\u001fH\u0016\u00a2\u0006\u0004\u0008\"\u0010#R\u0017\u0010\u0005\u001a\u00020\u00048\u0006\u00a2\u0006\u000c\n\u0004\u0008$\u0010%\u001a\u0004\u0008&\u0010\'R\u0017\u0010\u0007\u001a\u00020\u00068\u0006\u00a2\u0006\u000c\n\u0004\u0008\"\u0010(\u001a\u0004\u0008)\u0010*R\u0017\u0010\t\u001a\u00020\u00088\u0006\u00a2\u0006\u000c\n\u0004\u0008+\u0010,\u001a\u0004\u0008-\u0010.R\u0017\u0010\u000b\u001a\u00020\n8\u0006\u00a2\u0006\u000c\n\u0004\u0008/\u00100\u001a\u0004\u00081\u00102R\u0017\u0010\r\u001a\u00020\u000c8\u0006\u00a2\u0006\u000c\n\u0004\u00083\u00104\u001a\u0004\u00083\u00105R\u0017\u0010\u000f\u001a\u00020\u000e8\u0006\u00a2\u0006\u000c\n\u0004\u0008)\u00106\u001a\u0004\u0008/\u00107R\u0017\u0010\u0010\u001a\u00020\u000e8\u0006\u00a2\u0006\u000c\n\u0004\u0008-\u00106\u001a\u0004\u00088\u00107R\u001f\u0010\u0012\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00110\u00018\u0006\u00a2\u0006\u000c\n\u0004\u00089\u0010:\u001a\u0004\u0008;\u0010<R\u0017\u0010\u0014\u001a\u00020\u00138\u0006\u00a2\u0006\u000c\n\u0004\u0008=\u0010>\u001a\u0004\u0008?\u0010@R\u0017\u0010\u0016\u001a\u00020\u00158\u0006\u00a2\u0006\u000c\n\u0004\u0008A\u0010B\u001a\u0004\u0008+\u0010CR\u0019\u0010\u0018\u001a\u0004\u0018\u00010\u00178\u0006\u00a2\u0006\u000c\n\u0004\u0008D\u0010E\u001a\u0004\u00089\u0010FR\u001d\u0010\u001a\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\u00198\u0006\u00a2\u0006\u000c\n\u0004\u0008G\u0010H\u001a\u0004\u0008=\u0010I\u00a8\u0006K"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/producers/a;",
        "Ll/wk90;",
        "Ll/fb5;",
        "Ll/db5;",
        "Ll/wq3;",
        "byteArrayPool",
        "Ljava/util/concurrent/Executor;",
        "executor",
        "Ll/shm;",
        "imageDecoder",
        "Ll/t4b0;",
        "progressiveJpegConfig",
        "Lcom/facebook/imagepipeline/core/DownsampleMode;",
        "downsampleMode",
        "",
        "downsampleEnabledForNetwork",
        "decodeCancellationEnabled",
        "Ll/n0f;",
        "inputProducer",
        "",
        "maxBitmapDimension",
        "Ll/gb5;",
        "closeableReferenceFactory",
        "Ljava/lang/Runnable;",
        "reclaimMemoryRunnable",
        "Ll/a7h0;",
        "recoverFromDecoderOOM",
        "<init>",
        "(Ll/wq3;Ljava/util/concurrent/Executor;Ll/shm;Ll/t4b0;Lcom/facebook/imagepipeline/core/DownsampleMode;ZZLl/wk90;ILl/gb5;Ljava/lang/Runnable;Ll/a7h0;)V",
        "Ll/z06;",
        "consumer",
        "Ll/yk90;",
        "context",
        "",
        "b",
        "(Ll/z06;Ll/yk90;)V",
        "a",
        "Ll/wq3;",
        "getByteArrayPool",
        "()Ll/wq3;",
        "Ljava/util/concurrent/Executor;",
        "f",
        "()Ljava/util/concurrent/Executor;",
        "c",
        "Ll/shm;",
        "g",
        "()Ll/shm;",
        "d",
        "Ll/t4b0;",
        "getProgressiveJpegConfig",
        "()Ll/t4b0;",
        "e",
        "Lcom/facebook/imagepipeline/core/DownsampleMode;",
        "()Lcom/facebook/imagepipeline/core/DownsampleMode;",
        "Z",
        "()Z",
        "getDecodeCancellationEnabled",
        "h",
        "Ll/wk90;",
        "getInputProducer",
        "()Ll/wk90;",
        "i",
        "I",
        "getMaxBitmapDimension",
        "()I",
        "j",
        "Ll/gb5;",
        "()Ll/gb5;",
        "k",
        "Ljava/lang/Runnable;",
        "()Ljava/lang/Runnable;",
        "l",
        "Ll/a7h0;",
        "()Ll/a7h0;",
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
.field public static final Companion:Lcom/facebook/imagepipeline/producers/a$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Ll/wq3;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Ljava/util/concurrent/Executor;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final c:Ll/shm;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final d:Ll/t4b0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final e:Lcom/facebook/imagepipeline/core/DownsampleMode;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final f:Z

.field public final g:Z

.field public final h:Ll/wk90;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wk90<",
            "Ll/n0f;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final i:I

.field public final j:Ll/gb5;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final k:Ljava/lang/Runnable;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public final l:Ll/a7h0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a7h0<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/facebook/imagepipeline/producers/a$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/imagepipeline/producers/a$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/facebook/imagepipeline/producers/a;->Companion:Lcom/facebook/imagepipeline/producers/a$a;

    return-void
.end method

.method public constructor <init>(Ll/wq3;Ljava/util/concurrent/Executor;Ll/shm;Ll/t4b0;Lcom/facebook/imagepipeline/core/DownsampleMode;ZZLl/wk90;ILl/gb5;Ljava/lang/Runnable;Ll/a7h0;)V
    .locals 0
    .param p1    # Ll/wq3;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/concurrent/Executor;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/shm;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Ll/t4b0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p5    # Lcom/facebook/imagepipeline/core/DownsampleMode;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p8    # Ll/wk90;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p10    # Ll/gb5;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p11    # Ljava/lang/Runnable;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p12    # Ll/a7h0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wq3;",
            "Ljava/util/concurrent/Executor;",
            "Ll/shm;",
            "Ll/t4b0;",
            "Lcom/facebook/imagepipeline/core/DownsampleMode;",
            "ZZ",
            "Ll/wk90<",
            "Ll/n0f;",
            ">;I",
            "Ll/gb5;",
            "Ljava/lang/Runnable;",
            "Ll/a7h0<",
            "Ljava/lang/Boolean;",
            ">;)V"
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
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/a;->a:Ll/wq3;

    .line 29
    .line 30
    iput-object p2, p0, Lcom/facebook/imagepipeline/producers/a;->b:Ljava/util/concurrent/Executor;

    .line 31
    .line 32
    iput-object p3, p0, Lcom/facebook/imagepipeline/producers/a;->c:Ll/shm;

    .line 33
    .line 34
    iput-object p4, p0, Lcom/facebook/imagepipeline/producers/a;->d:Ll/t4b0;

    .line 35
    .line 36
    iput-object p5, p0, Lcom/facebook/imagepipeline/producers/a;->e:Lcom/facebook/imagepipeline/core/DownsampleMode;

    .line 37
    .line 38
    iput-boolean p6, p0, Lcom/facebook/imagepipeline/producers/a;->f:Z

    .line 39
    .line 40
    iput-boolean p7, p0, Lcom/facebook/imagepipeline/producers/a;->g:Z

    .line 41
    .line 42
    iput-object p8, p0, Lcom/facebook/imagepipeline/producers/a;->h:Ll/wk90;

    .line 43
    .line 44
    iput p9, p0, Lcom/facebook/imagepipeline/producers/a;->i:I

    .line 45
    .line 46
    iput-object p10, p0, Lcom/facebook/imagepipeline/producers/a;->j:Ll/gb5;

    .line 47
    .line 48
    iput-object p11, p0, Lcom/facebook/imagepipeline/producers/a;->k:Ljava/lang/Runnable;

    .line 49
    .line 50
    iput-object p12, p0, Lcom/facebook/imagepipeline/producers/a;->l:Ll/a7h0;

    .line 51
    .line 52
    return-void
.end method


# virtual methods
.method public b(Ll/z06;Ll/yk90;)V
    .locals 10
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
            "Ll/fb5<",
            "Ll/db5;",
            ">;>;",
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
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p2}, Ll/yk90;->t()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequest;->w()Landroid/net/Uri;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {v1}, Ll/i4k0;->o(Landroid/net/Uri;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequest;->w()Landroid/net/Uri;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->s(Landroid/net/Uri;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    new-instance v1, Lcom/facebook/imagepipeline/producers/a$b;

    .line 38
    .line 39
    iget-boolean v5, p0, Lcom/facebook/imagepipeline/producers/a;->g:Z

    .line 40
    .line 41
    iget v6, p0, Lcom/facebook/imagepipeline/producers/a;->i:I

    .line 42
    .line 43
    move-object v2, p0

    .line 44
    move-object v3, p1

    .line 45
    move-object v4, p2

    .line 46
    invoke-direct/range {v1 .. v6}, Lcom/facebook/imagepipeline/producers/a$b;-><init>(Lcom/facebook/imagepipeline/producers/a;Ll/z06;Ll/yk90;ZI)V

    .line 47
    .line 48
    .line 49
    move-object v3, v2

    .line 50
    move-object v5, v4

    .line 51
    goto :goto_0

    .line 52
    :cond_0
    move-object v3, p0

    .line 53
    move-object v4, p1

    .line 54
    move-object v5, p2

    .line 55
    new-instance v6, Ll/u4b0;

    .line 56
    .line 57
    iget-object p0, v3, Lcom/facebook/imagepipeline/producers/a;->a:Ll/wq3;

    .line 58
    .line 59
    invoke-direct {v6, p0}, Ll/u4b0;-><init>(Ll/wq3;)V

    .line 60
    .line 61
    .line 62
    new-instance v2, Lcom/facebook/imagepipeline/producers/a$c;

    .line 63
    .line 64
    iget-object v7, v3, Lcom/facebook/imagepipeline/producers/a;->d:Ll/t4b0;

    .line 65
    .line 66
    iget-boolean v8, v3, Lcom/facebook/imagepipeline/producers/a;->g:Z

    .line 67
    .line 68
    iget v9, v3, Lcom/facebook/imagepipeline/producers/a;->i:I

    .line 69
    .line 70
    invoke-direct/range {v2 .. v9}, Lcom/facebook/imagepipeline/producers/a$c;-><init>(Lcom/facebook/imagepipeline/producers/a;Ll/z06;Ll/yk90;Ll/u4b0;Ll/t4b0;ZI)V

    .line 71
    .line 72
    .line 73
    move-object v1, v2

    .line 74
    :goto_0
    iget-object p0, v3, Lcom/facebook/imagepipeline/producers/a;->h:Ll/wk90;

    .line 75
    .line 76
    invoke-interface {p0, v1, v5}, Ll/wk90;->b(Ll/z06;Ll/yk90;)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_1
    move-object v3, p0

    .line 81
    move-object v4, p1

    .line 82
    move-object v5, p2

    .line 83
    const-string p0, "DecodeProducer#produceResults"

    .line 84
    .line 85
    invoke-static {p0}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    :try_start_0
    invoke-interface {v5}, Ll/yk90;->t()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/request/ImageRequest;->w()Landroid/net/Uri;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-static {p1}, Ll/i4k0;->o(Landroid/net/Uri;)Z

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    if-nez p1, :cond_2

    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/request/ImageRequest;->w()Landroid/net/Uri;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-static {p0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->s(Landroid/net/Uri;)Z

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    if-nez p0, :cond_2

    .line 111
    .line 112
    new-instance v2, Lcom/facebook/imagepipeline/producers/a$b;

    .line 113
    .line 114
    iget-boolean v6, v3, Lcom/facebook/imagepipeline/producers/a;->g:Z

    .line 115
    .line 116
    iget v7, v3, Lcom/facebook/imagepipeline/producers/a;->i:I

    .line 117
    .line 118
    invoke-direct/range {v2 .. v7}, Lcom/facebook/imagepipeline/producers/a$b;-><init>(Lcom/facebook/imagepipeline/producers/a;Ll/z06;Ll/yk90;ZI)V

    .line 119
    .line 120
    .line 121
    goto :goto_1

    .line 122
    :cond_2
    new-instance v6, Ll/u4b0;

    .line 123
    .line 124
    iget-object p0, v3, Lcom/facebook/imagepipeline/producers/a;->a:Ll/wq3;

    .line 125
    .line 126
    invoke-direct {v6, p0}, Ll/u4b0;-><init>(Ll/wq3;)V

    .line 127
    .line 128
    .line 129
    new-instance v2, Lcom/facebook/imagepipeline/producers/a$c;

    .line 130
    .line 131
    iget-object v7, v3, Lcom/facebook/imagepipeline/producers/a;->d:Ll/t4b0;

    .line 132
    .line 133
    iget-boolean v8, v3, Lcom/facebook/imagepipeline/producers/a;->g:Z

    .line 134
    .line 135
    iget v9, v3, Lcom/facebook/imagepipeline/producers/a;->i:I

    .line 136
    .line 137
    invoke-direct/range {v2 .. v9}, Lcom/facebook/imagepipeline/producers/a$c;-><init>(Lcom/facebook/imagepipeline/producers/a;Ll/z06;Ll/yk90;Ll/u4b0;Ll/t4b0;ZI)V

    .line 138
    .line 139
    .line 140
    :goto_1
    iget-object p0, v3, Lcom/facebook/imagepipeline/producers/a;->h:Ll/wk90;

    .line 141
    .line 142
    invoke-interface {p0, v2, v5}, Ll/wk90;->b(Ll/z06;Ll/yk90;)V

    .line 143
    .line 144
    .line 145
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 146
    .line 147
    invoke-static {}, Ll/i9j;->b()V

    .line 148
    .line 149
    .line 150
    return-void

    .line 151
    :catchall_0
    move-exception v0

    .line 152
    move-object p0, v0

    .line 153
    invoke-static {}, Ll/i9j;->b()V

    .line 154
    .line 155
    .line 156
    throw p0
.end method

.method public final c()Ll/gb5;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/facebook/imagepipeline/producers/a;->j:Ll/gb5;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/facebook/imagepipeline/producers/a;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public final e()Lcom/facebook/imagepipeline/core/DownsampleMode;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/facebook/imagepipeline/producers/a;->e:Lcom/facebook/imagepipeline/core/DownsampleMode;

    .line 2
    .line 3
    return-object p0
.end method

.method public final f()Ljava/util/concurrent/Executor;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/facebook/imagepipeline/producers/a;->b:Ljava/util/concurrent/Executor;

    .line 2
    .line 3
    return-object p0
.end method

.method public final g()Ll/shm;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/facebook/imagepipeline/producers/a;->c:Ll/shm;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h()Ljava/lang/Runnable;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/facebook/imagepipeline/producers/a;->k:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method public final i()Ll/a7h0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/a7h0<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/facebook/imagepipeline/producers/a;->l:Ll/a7h0;

    .line 2
    .line 3
    return-object p0
.end method
