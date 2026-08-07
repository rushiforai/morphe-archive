.class public final Lcom/facebook/imagepipeline/producers/a$c;
.super Lcom/facebook/imagepipeline/producers/a$d;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/imagepipeline/producers/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "c"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000J\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u000e\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0082\u0004\u0018\u00002\u00060\u0001R\u00020\u0002BC\u0012\u0012\u0010\u0006\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00050\u00040\u0003\u0012\u0006\u0010\u0008\u001a\u00020\u0007\u0012\u0006\u0010\n\u001a\u00020\t\u0012\u0006\u0010\u000c\u001a\u00020\u000b\u0012\u0006\u0010\u000e\u001a\u00020\r\u0012\u0006\u0010\u0010\u001a\u00020\u000f\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J!\u0010\u0016\u001a\u00020\r2\u0008\u0010\u0014\u001a\u0004\u0018\u00010\u00132\u0006\u0010\u0015\u001a\u00020\u000fH\u0014\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J\u0017\u0010\u0018\u001a\u00020\u000f2\u0006\u0010\u0014\u001a\u00020\u0013H\u0014\u00a2\u0006\u0004\u0008\u0018\u0010\u0019R\u0017\u0010\n\u001a\u00020\t8\u0006\u00a2\u0006\u000c\n\u0004\u0008\u001a\u0010\u001b\u001a\u0004\u0008\u001c\u0010\u001dR\u0017\u0010\u000c\u001a\u00020\u000b8\u0006\u00a2\u0006\u000c\n\u0004\u0008\u001e\u0010\u001f\u001a\u0004\u0008 \u0010!R\u0014\u0010%\u001a\u00020\"8TX\u0094\u0004\u00a2\u0006\u0006\u001a\u0004\u0008#\u0010$\u00a8\u0006&"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/producers/a$c;",
        "Lcom/facebook/imagepipeline/producers/a$d;",
        "Lcom/facebook/imagepipeline/producers/a;",
        "Ll/z06;",
        "Ll/fb5;",
        "Ll/db5;",
        "consumer",
        "Ll/yk90;",
        "producerContext",
        "Ll/u4b0;",
        "progressiveJpegParser",
        "Ll/t4b0;",
        "progressiveJpegConfig",
        "",
        "decodeCancellationEnabled",
        "",
        "maxBitmapDimension",
        "<init>",
        "(Lcom/facebook/imagepipeline/producers/a;Ll/z06;Ll/yk90;Ll/u4b0;Ll/t4b0;ZI)V",
        "Ll/n0f;",
        "encodedImage",
        "status",
        "H",
        "(Ll/n0f;I)Z",
        "v",
        "(Ll/n0f;)I",
        "k",
        "Ll/u4b0;",
        "getProgressiveJpegParser",
        "()Ll/u4b0;",
        "l",
        "Ll/t4b0;",
        "getProgressiveJpegConfig",
        "()Ll/t4b0;",
        "Ll/qvb0;",
        "x",
        "()Ll/qvb0;",
        "qualityInfo",
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


# instance fields
.field public final k:Ll/u4b0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final l:Ll/t4b0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final synthetic m:Lcom/facebook/imagepipeline/producers/a;


# direct methods
.method public constructor <init>(Lcom/facebook/imagepipeline/producers/a;Ll/z06;Ll/yk90;Ll/u4b0;Ll/t4b0;ZI)V
    .locals 6
    .param p1    # Lcom/facebook/imagepipeline/producers/a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/z06;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/yk90;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Ll/u4b0;
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
            "Ll/u4b0;",
            "Ll/t4b0;",
            "ZI)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/a$c;->m:Lcom/facebook/imagepipeline/producers/a;

    .line 14
    .line 15
    move-object v0, p0

    .line 16
    move-object v1, p1

    .line 17
    move-object v2, p2

    .line 18
    move-object v3, p3

    .line 19
    move v4, p6

    .line 20
    move v5, p7

    .line 21
    invoke-direct/range {v0 .. v5}, Lcom/facebook/imagepipeline/producers/a$d;-><init>(Lcom/facebook/imagepipeline/producers/a;Ll/z06;Ll/yk90;ZI)V

    .line 22
    .line 23
    .line 24
    iput-object p4, v0, Lcom/facebook/imagepipeline/producers/a$c;->k:Ll/u4b0;

    .line 25
    .line 26
    iput-object p5, v0, Lcom/facebook/imagepipeline/producers/a$c;->l:Ll/t4b0;

    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    invoke-virtual {v0, p0}, Lcom/facebook/imagepipeline/producers/a$d;->G(I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public declared-synchronized H(Ll/n0f;I)Z
    .locals 3
    .param p1    # Ll/n0f;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    monitor-exit p0

    .line 6
    return v0

    .line 7
    :cond_0
    :try_start_0
    invoke-super {p0, p1, p2}, Lcom/facebook/imagepipeline/producers/a$d;->H(Ll/n0f;I)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-static {p2}, Ll/ji2;->e(I)Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-nez v2, :cond_1

    .line 16
    .line 17
    const/16 v2, 0x8

    .line 18
    .line 19
    invoke-static {p2, v2}, Ll/ji2;->m(II)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_5

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p1

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    :goto_0
    const/4 v2, 0x4

    .line 29
    invoke-static {p2, v2}, Ll/ji2;->m(II)Z

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    if-nez p2, :cond_5

    .line 34
    .line 35
    invoke-static {p1}, Ll/n0f;->d0(Ll/n0f;)Z

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-eqz p2, :cond_5

    .line 40
    .line 41
    invoke-virtual {p1}, Ll/n0f;->F()Ll/him;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    sget-object v2, Ll/ppd;->a:Ll/him;

    .line 46
    .line 47
    if-ne p2, v2, :cond_5

    .line 48
    .line 49
    iget-object p2, p0, Lcom/facebook/imagepipeline/producers/a$c;->k:Ll/u4b0;

    .line 50
    .line 51
    invoke-virtual {p2, p1}, Ll/u4b0;->g(Ll/n0f;)Z

    .line 52
    .line 53
    .line 54
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    if-nez p1, :cond_2

    .line 56
    .line 57
    monitor-exit p0

    .line 58
    return v0

    .line 59
    :cond_2
    :try_start_1
    iget-object p1, p0, Lcom/facebook/imagepipeline/producers/a$c;->k:Ll/u4b0;

    .line 60
    .line 61
    invoke-virtual {p1}, Ll/u4b0;->d()I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/producers/a$d;->w()I

    .line 66
    .line 67
    .line 68
    move-result p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 69
    if-gt p1, p2, :cond_3

    .line 70
    .line 71
    monitor-exit p0

    .line 72
    return v0

    .line 73
    :cond_3
    :try_start_2
    iget-object p2, p0, Lcom/facebook/imagepipeline/producers/a$c;->l:Ll/t4b0;

    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/producers/a$d;->w()I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    invoke-interface {p2, v2}, Ll/t4b0;->a(I)I

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    if-ge p1, p2, :cond_4

    .line 84
    .line 85
    iget-object p2, p0, Lcom/facebook/imagepipeline/producers/a$c;->k:Ll/u4b0;

    .line 86
    .line 87
    invoke-virtual {p2}, Ll/u4b0;->e()Z

    .line 88
    .line 89
    .line 90
    move-result p2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 91
    if-nez p2, :cond_4

    .line 92
    .line 93
    monitor-exit p0

    .line 94
    return v0

    .line 95
    :cond_4
    :try_start_3
    invoke-virtual {p0, p1}, Lcom/facebook/imagepipeline/producers/a$d;->G(I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 96
    .line 97
    .line 98
    :cond_5
    monitor-exit p0

    .line 99
    return v1

    .line 100
    :goto_1
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 101
    throw p1
.end method

.method public v(Ll/n0f;)I
    .locals 0
    .param p1    # Ll/n0f;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/facebook/imagepipeline/producers/a$c;->k:Ll/u4b0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/u4b0;->c()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public x()Ll/qvb0;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/facebook/imagepipeline/producers/a$c;->l:Ll/t4b0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/facebook/imagepipeline/producers/a$c;->k:Ll/u4b0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/u4b0;->d()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-interface {v0, p0}, Ll/t4b0;->b(I)Ll/qvb0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    return-object p0
.end method
