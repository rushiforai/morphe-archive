.class public final Ll/rmd$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/rmd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "a"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0004\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\t\u0008\u0082\u0004\u0018\u00002\u00020\u0001B\'\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\u0008\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\t\u0010\nJ\u000f\u0010\u000c\u001a\u00020\u000bH\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u001f\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u000e\u001a\u00020\u0006H\u0002\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J/\u0010\u0015\u001a\u00020\u000f2\u0006\u0010\u0007\u001a\u00020\u00062\u000e\u0010\u0014\u001a\n\u0012\u0004\u0012\u00020\u0013\u0018\u00010\u00122\u0006\u0010\u000e\u001a\u00020\u0006H\u0002\u00a2\u0006\u0004\u0008\u0015\u0010\u0016R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0010\u0010\u0017R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0015\u0010\u0018R\u0014\u0010\u0007\u001a\u00020\u00068\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0019\u0010\u001aR\u0014\u0010\u0008\u001a\u00020\u00068\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001b\u0010\u001a\u00a8\u0006\u001c"
    }
    d2 = {
        "Ll/rmd$a;",
        "Ljava/lang/Runnable;",
        "Ll/yq0;",
        "animationBackend",
        "Ll/c23;",
        "bitmapFrameCache",
        "",
        "frameNumber",
        "frameId",
        "<init>",
        "(Ll/rmd;Ll/yq0;Ll/c23;II)V",
        "",
        "run",
        "()V",
        "frameType",
        "",
        "a",
        "(II)Z",
        "Ll/fb5;",
        "Landroid/graphics/Bitmap;",
        "bitmapReference",
        "b",
        "(ILl/fb5;I)Z",
        "Ll/yq0;",
        "Ll/c23;",
        "c",
        "I",
        "d",
        "animated-drawable_release"
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


# instance fields
.field public final a:Ll/yq0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Ll/c23;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final c:I

.field public final d:I

.field public final synthetic e:Ll/rmd;


# direct methods
.method public constructor <init>(Ll/rmd;Ll/yq0;Ll/c23;II)V
    .locals 0
    .param p1    # Ll/rmd;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/yq0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/yq0;",
            "Ll/c23;",
            "II)V"
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
    iput-object p1, p0, Ll/rmd$a;->e:Ll/rmd;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p2, p0, Ll/rmd$a;->a:Ll/yq0;

    .line 13
    .line 14
    iput-object p3, p0, Ll/rmd$a;->b:Ll/c23;

    .line 15
    .line 16
    iput p4, p0, Ll/rmd$a;->c:I

    .line 17
    .line 18
    iput p5, p0, Ll/rmd$a;->d:I

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public final a(II)Z
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, -0x1

    .line 3
    const/4 v2, 0x2

    .line 4
    const/4 v3, 0x0

    .line 5
    if-eq p2, v0, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    if-eq p2, v2, :cond_0

    .line 9
    .line 10
    invoke-static {v3}, Ll/fb5;->v(Ll/fb5;)V

    .line 11
    .line 12
    .line 13
    return v0

    .line 14
    :cond_0
    :try_start_0
    iget-object v2, p0, Ll/rmd$a;->e:Ll/rmd;

    .line 15
    .line 16
    invoke-static {v2}, Ll/rmd;->e(Ll/rmd;)Ll/xc80;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    iget-object v4, p0, Ll/rmd$a;->a:Ll/yq0;

    .line 21
    .line 22
    invoke-interface {v4}, Ll/yq0;->a()I

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    iget-object v5, p0, Ll/rmd$a;->a:Ll/yq0;

    .line 27
    .line 28
    invoke-interface {v5}, Ll/yq0;->b()I

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    iget-object v6, p0, Ll/rmd$a;->e:Ll/rmd;

    .line 33
    .line 34
    invoke-static {v6}, Ll/rmd;->b(Ll/rmd;)Landroid/graphics/Bitmap$Config;

    .line 35
    .line 36
    .line 37
    move-result-object v6

    .line 38
    invoke-virtual {v2, v4, v5, v6}, Ll/xc80;->b(IILandroid/graphics/Bitmap$Config;)Ll/fb5;

    .line 39
    .line 40
    .line 41
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    move v2, v1

    .line 43
    :goto_0
    move-object v3, v0

    .line 44
    goto :goto_1

    .line 45
    :catchall_0
    move-exception p0

    .line 46
    goto :goto_3

    .line 47
    :catch_0
    move-exception p1

    .line 48
    :try_start_1
    iget-object p0, p0, Ll/rmd$a;->e:Ll/rmd;

    .line 49
    .line 50
    invoke-static {p0}, Ll/rmd;->f(Ll/rmd;)Ljava/lang/Class;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const-string p2, "Failed to create frame bitmap"

    .line 55
    .line 56
    invoke-static {p0, p2, p1}, Ll/huf;->v(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    .line 58
    .line 59
    invoke-static {v3}, Ll/fb5;->v(Ll/fb5;)V

    .line 60
    .line 61
    .line 62
    return v0

    .line 63
    :cond_1
    :try_start_2
    iget-object v0, p0, Ll/rmd$a;->b:Ll/c23;

    .line 64
    .line 65
    iget-object v4, p0, Ll/rmd$a;->a:Ll/yq0;

    .line 66
    .line 67
    invoke-interface {v4}, Ll/yq0;->a()I

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    iget-object v5, p0, Ll/rmd$a;->a:Ll/yq0;

    .line 72
    .line 73
    invoke-interface {v5}, Ll/yq0;->b()I

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    invoke-interface {v0, p1, v4, v5}, Ll/c23;->f(III)Ll/fb5;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    goto :goto_0

    .line 82
    :goto_1
    invoke-virtual {p0, p1, v3, p2}, Ll/rmd$a;->b(ILl/fb5;I)Z

    .line 83
    .line 84
    .line 85
    move-result p2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 86
    invoke-static {v3}, Ll/fb5;->v(Ll/fb5;)V

    .line 87
    .line 88
    .line 89
    if-nez p2, :cond_3

    .line 90
    .line 91
    if-ne v2, v1, :cond_2

    .line 92
    .line 93
    goto :goto_2

    .line 94
    :cond_2
    invoke-virtual {p0, p1, v2}, Ll/rmd$a;->a(II)Z

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    return p0

    .line 99
    :cond_3
    :goto_2
    return p2

    .line 100
    :goto_3
    invoke-static {v3}, Ll/fb5;->v(Ll/fb5;)V

    .line 101
    .line 102
    .line 103
    throw p0
.end method

.method public final b(ILl/fb5;I)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ll/fb5<",
            "Landroid/graphics/Bitmap;",
            ">;I)Z"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/fb5;->Q(Ll/fb5;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    if-eqz p2, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Ll/rmd$a;->e:Ll/rmd;

    .line 12
    .line 13
    invoke-static {v0}, Ll/rmd;->c(Ll/rmd;)Ll/f23;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p2}, Ll/fb5;->B()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    check-cast v2, Landroid/graphics/Bitmap;

    .line 25
    .line 26
    invoke-interface {v0, p1, v2}, Ll/f23;->d(ILandroid/graphics/Bitmap;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    iget-object v0, p0, Ll/rmd$a;->e:Ll/rmd;

    .line 34
    .line 35
    invoke-static {v0}, Ll/rmd;->f(Ll/rmd;)Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-string v1, "Frame %d ready."

    .line 40
    .line 41
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-static {v0, v1, v2}, Ll/huf;->o(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/rmd$a;->e:Ll/rmd;

    .line 49
    .line 50
    invoke-static {v0}, Ll/rmd;->d(Ll/rmd;)Landroid/util/SparseArray;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    monitor-enter v0

    .line 55
    :try_start_0
    iget-object p0, p0, Ll/rmd$a;->b:Ll/c23;

    .line 56
    .line 57
    invoke-interface {p0, p1, p2, p3}, Ll/c23;->e(ILl/fb5;I)V

    .line 58
    .line 59
    .line 60
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    .line 62
    monitor-exit v0

    .line 63
    const/4 p0, 0x1

    .line 64
    return p0

    .line 65
    :catchall_0
    move-exception p0

    .line 66
    monitor-exit v0

    .line 67
    throw p0

    .line 68
    :cond_2
    :goto_0
    return v1
.end method

.method public run()V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/rmd$a;->b:Ll/c23;

    .line 2
    .line 3
    iget v1, p0, Ll/rmd$a;->c:I

    .line 4
    .line 5
    invoke-interface {v0, v1}, Ll/c23;->c(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/rmd$a;->e:Ll/rmd;

    .line 12
    .line 13
    invoke-static {v0}, Ll/rmd;->f(Ll/rmd;)Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "Frame %d is cached already."

    .line 18
    .line 19
    iget v2, p0, Ll/rmd$a;->c:I

    .line 20
    .line 21
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-static {v0, v1, v2}, Ll/huf;->o(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/rmd$a;->e:Ll/rmd;

    .line 29
    .line 30
    invoke-static {v0}, Ll/rmd;->d(Ll/rmd;)Landroid/util/SparseArray;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v1, p0, Ll/rmd$a;->e:Ll/rmd;

    .line 35
    .line 36
    monitor-enter v0

    .line 37
    :try_start_1
    invoke-static {v1}, Ll/rmd;->d(Ll/rmd;)Landroid/util/SparseArray;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iget p0, p0, Ll/rmd$a;->d:I

    .line 42
    .line 43
    invoke-virtual {v1, p0}, Landroid/util/SparseArray;->remove(I)V

    .line 44
    .line 45
    .line 46
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 47
    .line 48
    monitor-exit v0

    .line 49
    return-void

    .line 50
    :catchall_0
    move-exception p0

    .line 51
    monitor-exit v0

    .line 52
    throw p0

    .line 53
    :catchall_1
    move-exception v0

    .line 54
    goto :goto_1

    .line 55
    :cond_0
    :try_start_2
    iget v0, p0, Ll/rmd$a;->c:I

    .line 56
    .line 57
    const/4 v1, 0x1

    .line 58
    invoke-virtual {p0, v0, v1}, Ll/rmd$a;->a(II)Z

    .line 59
    .line 60
    .line 61
    move-result v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 62
    iget-object v1, p0, Ll/rmd$a;->e:Ll/rmd;

    .line 63
    .line 64
    if-eqz v0, :cond_1

    .line 65
    .line 66
    :try_start_3
    invoke-static {v1}, Ll/rmd;->f(Ll/rmd;)Ljava/lang/Class;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const-string v1, "Prepared frame %d."

    .line 71
    .line 72
    iget v2, p0, Ll/rmd$a;->c:I

    .line 73
    .line 74
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-static {v0, v1, v2}, Ll/huf;->o(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_1
    invoke-static {v1}, Ll/rmd;->f(Ll/rmd;)Ljava/lang/Class;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    const-string v1, "Could not prepare frame %d."

    .line 87
    .line 88
    iget v2, p0, Ll/rmd$a;->c:I

    .line 89
    .line 90
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-static {v0, v1, v2}, Ll/huf;->f(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 99
    .line 100
    .line 101
    :goto_0
    iget-object v0, p0, Ll/rmd$a;->e:Ll/rmd;

    .line 102
    .line 103
    invoke-static {v0}, Ll/rmd;->d(Ll/rmd;)Landroid/util/SparseArray;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    iget-object v1, p0, Ll/rmd$a;->e:Ll/rmd;

    .line 108
    .line 109
    monitor-enter v0

    .line 110
    :try_start_4
    invoke-static {v1}, Ll/rmd;->d(Ll/rmd;)Landroid/util/SparseArray;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    iget p0, p0, Ll/rmd$a;->d:I

    .line 115
    .line 116
    invoke-virtual {v1, p0}, Landroid/util/SparseArray;->remove(I)V

    .line 117
    .line 118
    .line 119
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 120
    .line 121
    monitor-exit v0

    .line 122
    return-void

    .line 123
    :catchall_2
    move-exception p0

    .line 124
    monitor-exit v0

    .line 125
    throw p0

    .line 126
    :goto_1
    iget-object v1, p0, Ll/rmd$a;->e:Ll/rmd;

    .line 127
    .line 128
    invoke-static {v1}, Ll/rmd;->d(Ll/rmd;)Landroid/util/SparseArray;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    iget-object v2, p0, Ll/rmd$a;->e:Ll/rmd;

    .line 133
    .line 134
    monitor-enter v1

    .line 135
    :try_start_5
    invoke-static {v2}, Ll/rmd;->d(Ll/rmd;)Landroid/util/SparseArray;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    iget p0, p0, Ll/rmd$a;->d:I

    .line 140
    .line 141
    invoke-virtual {v2, p0}, Landroid/util/SparseArray;->remove(I)V

    .line 142
    .line 143
    .line 144
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 145
    .line 146
    monitor-exit v1

    .line 147
    throw v0

    .line 148
    :catchall_3
    move-exception p0

    .line 149
    monitor-exit v1

    .line 150
    throw p0
.end method
