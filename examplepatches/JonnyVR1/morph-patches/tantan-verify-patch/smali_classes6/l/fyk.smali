.class public final Ll/fyk;
.super Ll/gid;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/fyk$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000h\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u0012\n\u0002\u0008\u000f\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\r\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0018\u0000 M2\u00020\u00012\u00020\u0002:\u0001NB\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0017\u0010\n\u001a\u00020\t2\u0006\u0010\u0008\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u0019\u0010\u000e\u001a\u00020\t2\u0008\u0010\r\u001a\u0004\u0018\u00010\u000cH\u0016\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u000f\u0010\u0010\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\u000f\u0010\u0012\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\u0012\u0010\u0011J\u0017\u0010\u0013\u001a\u00020\t2\u0006\u0010\u0008\u001a\u00020\u0007H\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u000bJ\u001f\u0010\u0018\u001a\u00020\t2\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0017\u001a\u00020\u0016H\u0002\u00a2\u0006\u0004\u0008\u0018\u0010\u0019J\u001f\u0010\u001c\u001a\u00020\t2\u0006\u0010\u0017\u001a\u00020\u00162\u0006\u0010\u001b\u001a\u00020\u001aH\u0002\u00a2\u0006\u0004\u0008\u001c\u0010\u001dJ\u0017\u0010 \u001a\u00020\u001e2\u0006\u0010\u001f\u001a\u00020\u001eH\u0002\u00a2\u0006\u0004\u0008 \u0010!JG\u0010)\u001a\u00020\t2\u0006\u0010\"\u001a\u00020\u001e2\u0006\u0010#\u001a\u00020\u001a2\u0006\u0010$\u001a\u00020\u001a2\u0006\u0010%\u001a\u00020\u001a2\u0006\u0010&\u001a\u00020\u001e2\u0006\u0010\'\u001a\u00020\u001a2\u0006\u0010(\u001a\u00020\u001aH\u0002\u00a2\u0006\u0004\u0008)\u0010*J#\u0010+\u001a\u00020\t2\u0008\u0010\u0017\u001a\u0004\u0018\u00010\u00162\u0008\u0010\u0015\u001a\u0004\u0018\u00010\u0014H\u0002\u00a2\u0006\u0004\u0008+\u0010,J\u000f\u0010-\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008-\u0010\u0011R\u0018\u00101\u001a\u0004\u0018\u00010.8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008/\u00100R\u0018\u00104\u001a\u0004\u0018\u00010\u000c8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00082\u00103R\u001b\u0010:\u001a\u0002058BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u00086\u00107\u001a\u0004\u00088\u00109R\u0016\u0010>\u001a\u00020;8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008<\u0010=R\u0016\u0010@\u001a\u00020\u001a8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008?\u0010-R\u0016\u0010B\u001a\u00020\u001a8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008A\u0010-R\u0016\u0010D\u001a\u00020\u001a8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008C\u0010-R\u0016\u0010F\u001a\u00020\u001a8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008E\u0010-R\u0016\u0010H\u001a\u00020;8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008G\u0010=R\u0018\u0010L\u001a\u0004\u0018\u00010I8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008J\u0010K\u00a8\u0006O"
    }
    d2 = {
        "Ll/fyk;",
        "Ll/gid;",
        "Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;",
        "Ll/ap0;",
        "player",
        "<init>",
        "(Ll/ap0;)V",
        "Ll/wtl;",
        "fileContainer",
        "",
        "A",
        "(Ll/wtl;)V",
        "Landroid/graphics/SurfaceTexture;",
        "surfaceTexture",
        "onFrameAvailable",
        "(Landroid/graphics/SurfaceTexture;)V",
        "h",
        "()V",
        "L",
        "N",
        "Landroid/media/MediaExtractor;",
        "extractor",
        "Landroid/media/MediaCodec;",
        "decoder",
        "M",
        "(Landroid/media/MediaExtractor;Landroid/media/MediaCodec;)V",
        "",
        "outputIndex",
        "R",
        "(Landroid/media/MediaCodec;I)V",
        "",
        "yuv420sp",
        "P",
        "([B)[B",
        "src",
        "srcOffset",
        "inWidth",
        "inHeight",
        "dest",
        "outWidth",
        "outHeight",
        "Q",
        "([BIII[BII)V",
        "K",
        "(Landroid/media/MediaCodec;Landroid/media/MediaExtractor;)V",
        "I",
        "Landroid/view/Surface;",
        "l",
        "Landroid/view/Surface;",
        "surface",
        "m",
        "Landroid/graphics/SurfaceTexture;",
        "glTexture",
        "Landroid/media/MediaCodec$BufferInfo;",
        "n",
        "Lkotlin/Lazy;",
        "J",
        "()Landroid/media/MediaCodec$BufferInfo;",
        "bufferInfo",
        "",
        "o",
        "Z",
        "needDestroy",
        "p",
        "videoWidth",
        "q",
        "videoHeight",
        "r",
        "alignWidth",
        "s",
        "alignHeight",
        "t",
        "needYUV",
        "Landroid/media/MediaFormat;",
        "u",
        "Landroid/media/MediaFormat;",
        "outputFormat",
        "Companion",
        "a",
        "base_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Ll/fyk$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public l:Landroid/view/Surface;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public m:Landroid/graphics/SurfaceTexture;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public final n:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public o:Z

.field public p:I

.field public q:I

.field public r:I

.field public s:I

.field public t:Z

.field public u:Landroid/media/MediaFormat;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/fyk$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/fyk$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/fyk;->Companion:Ll/fyk$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Ll/ap0;)V
    .locals 0
    .param p1    # Ll/ap0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/gid;-><init>(Ll/ap0;)V

    .line 5
    .line 6
    .line 7
    new-instance p1, Ll/byk;

    .line 8
    .line 9
    invoke-direct {p1}, Ll/byk;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Ll/fyk;->n:Lkotlin/Lazy;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic C(Ll/fyk;Lkotlin/jvm/internal/Ref$ObjectRef;Landroid/media/MediaCodec;Lkotlin/jvm/internal/Ref$ObjectRef;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Ll/fyk;->O(Ll/fyk;Lkotlin/jvm/internal/Ref$ObjectRef;Landroid/media/MediaCodec;Lkotlin/jvm/internal/Ref$ObjectRef;)V

    return-void
.end method

.method public static D(Ll/fyk;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/gid;->l()Ll/ap0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/ap0;->j()Ll/bp0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/bp0;->d()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/gid;->m()Ll/q4m;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-interface {v0}, Ll/q4m;->f()V

    .line 19
    .line 20
    .line 21
    :cond_0
    const/4 v0, 0x0

    .line 22
    invoke-virtual {p0, v0}, Ll/gid;->x(Ll/q4m;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/gid;->b()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/gid;->i()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static E(Ll/fyk;Ll/wtl;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fyk;->N(Ll/wtl;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static F(Ll/fyk;)V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/fyk;->m:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/gid;->m()Ll/q4m;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-interface {v0}, Ll/q4m;->e()V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Ll/gid;->l()Ll/ap0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/ap0;->j()Ll/bp0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/bp0;->i()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/gid;->m()Ll/q4m;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    invoke-interface {p0}, Ll/q4m;->swapBuffers()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void

    .line 38
    :catchall_0
    move-exception p0

    .line 39
    sget-object v0, Ll/z0;->INSTANCE:Ll/z0;

    .line 40
    .line 41
    new-instance v1, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v2, "render exception="

    .line 44
    .line 45
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    const-string v2, "AnimPlayer.HardDecoder"

    .line 56
    .line 57
    invoke-virtual {v0, v2, v1, p0}, Ll/z0;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public static G()Landroid/media/MediaCodec$BufferInfo;
    .locals 1

    .line 1
    new-instance v0, Landroid/media/MediaCodec$BufferInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static H(Ll/fyk;Landroid/media/MediaCodec;Landroid/media/MediaExtractor;)V
    .locals 3

    .line 1
    const-string v0, "AnimPlayer.HardDecoder"

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/gid;->m()Ll/q4m;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-interface {v1}, Ll/q4m;->h()V

    .line 10
    .line 11
    .line 12
    :cond_0
    :try_start_0
    sget-object v1, Ll/z0;->INSTANCE:Ll/z0;

    .line 13
    .line 14
    const-string v2, "release"

    .line 15
    .line 16
    invoke-virtual {v1, v0, v2}, Ll/z0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/media/MediaCodec;->stop()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/media/MediaCodec;->release()V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception p1

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    :goto_0
    if-eqz p2, :cond_2

    .line 31
    .line 32
    invoke-virtual {p2}, Landroid/media/MediaExtractor;->release()V

    .line 33
    .line 34
    .line 35
    :cond_2
    iget-object p1, p0, Ll/fyk;->m:Landroid/graphics/SurfaceTexture;

    .line 36
    .line 37
    if-eqz p1, :cond_3

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/graphics/SurfaceTexture;->release()V

    .line 40
    .line 41
    .line 42
    :cond_3
    const/4 p1, 0x0

    .line 43
    iput-object p1, p0, Ll/fyk;->m:Landroid/graphics/SurfaceTexture;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/gid;->o()Ll/rvf0;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    invoke-virtual {p2}, Ll/rvf0;->b()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ll/gid;->l()Ll/ap0;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    invoke-virtual {p2}, Ll/ap0;->j()Ll/bp0;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-virtual {p2}, Ll/bp0;->g()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Ll/gid;->m()Ll/q4m;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    if-eqz p2, :cond_4

    .line 68
    .line 69
    invoke-interface {p2}, Ll/q4m;->g()V

    .line 70
    .line 71
    .line 72
    :cond_4
    iget-object p2, p0, Ll/fyk;->l:Landroid/view/Surface;

    .line 73
    .line 74
    if-eqz p2, :cond_5

    .line 75
    .line 76
    invoke-virtual {p2}, Landroid/view/Surface;->release()V

    .line 77
    .line 78
    .line 79
    :cond_5
    iput-object p1, p0, Ll/fyk;->l:Landroid/view/Surface;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    .line 81
    goto :goto_2

    .line 82
    :goto_1
    sget-object p2, Ll/z0;->INSTANCE:Ll/z0;

    .line 83
    .line 84
    new-instance v1, Ljava/lang/StringBuilder;

    .line 85
    .line 86
    const-string v2, "release e="

    .line 87
    .line 88
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {p2, v0, v1, p1}, Ll/z0;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 99
    .line 100
    .line 101
    :goto_2
    const/4 p1, 0x0

    .line 102
    invoke-virtual {p0, p1}, Ll/gid;->y(Z)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0}, Ll/gid;->f()V

    .line 106
    .line 107
    .line 108
    iget-boolean p1, p0, Ll/fyk;->o:Z

    .line 109
    .line 110
    if-eqz p1, :cond_6

    .line 111
    .line 112
    invoke-virtual {p0}, Ll/fyk;->I()V

    .line 113
    .line 114
    .line 115
    :cond_6
    return-void
.end method

.method public static final O(Ll/fyk;Lkotlin/jvm/internal/Ref$ObjectRef;Landroid/media/MediaCodec;Lkotlin/jvm/internal/Ref$ObjectRef;)V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p1, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/media/MediaExtractor;

    .line 4
    .line 5
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0, p2}, Ll/fyk;->M(Landroid/media/MediaExtractor;Landroid/media/MediaCodec;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception p2

    .line 13
    sget-object v0, Ll/z0;->INSTANCE:Ll/z0;

    .line 14
    .line 15
    new-instance v1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v2, "MediaCodec exception e="

    .line 18
    .line 19
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v2, "AnimPlayer.HardDecoder"

    .line 30
    .line 31
    invoke-virtual {v0, v2, v1, p2}, Ll/z0;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v1, "0x2 MediaCodec exception e="

    .line 37
    .line 38
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    const/16 v0, 0x2712

    .line 49
    .line 50
    invoke-virtual {p0, v0, p2}, Ll/gid;->a(ILjava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget-object p2, p3, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 54
    .line 55
    check-cast p2, Landroid/media/MediaCodec;

    .line 56
    .line 57
    iget-object p1, p1, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 58
    .line 59
    check-cast p1, Landroid/media/MediaExtractor;

    .line 60
    .line 61
    invoke-virtual {p0, p2, p1}, Ll/fyk;->K(Landroid/media/MediaCodec;Landroid/media/MediaExtractor;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method


# virtual methods
.method public A(Ll/wtl;)V
    .locals 2
    .param p1    # Ll/wtl;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Ll/gid;->z(Z)V

    .line 6
    .line 7
    .line 8
    iput-boolean v0, p0, Ll/fyk;->o:Z

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-virtual {p0, v0}, Ll/gid;->y(Z)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/gid;->n()Ll/oxk;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ll/oxk;->a()Landroid/os/Handler;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    new-instance v1, Ll/cyk;

    .line 25
    .line 26
    invoke-direct {v1, p0, p1}, Ll/cyk;-><init>(Ll/fyk;Ll/wtl;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public final I()V
    .locals 3

    .line 1
    sget-object v0, Ll/z0;->INSTANCE:Ll/z0;

    .line 2
    .line 3
    const-string v1, "AnimPlayer.HardDecoder"

    .line 4
    .line 5
    const-string v2, "destroyInner"

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/z0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/gid;->n()Ll/oxk;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/oxk;->a()Landroid/os/Handler;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    new-instance v1, Ll/zxk;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/zxk;-><init>(Ll/fyk;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final J()Landroid/media/MediaCodec$BufferInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fyk;->n:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/media/MediaCodec$BufferInfo;

    .line 8
    .line 9
    return-object p0
.end method

.method public final K(Landroid/media/MediaCodec;Landroid/media/MediaExtractor;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/gid;->n()Ll/oxk;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/oxk;->a()Landroid/os/Handler;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v1, Ll/eyk;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1, p2}, Ll/eyk;-><init>(Ll/fyk;Landroid/media/MediaCodec;Landroid/media/MediaExtractor;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final L()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/gid;->n()Ll/oxk;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/oxk;->a()Landroid/os/Handler;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v1, Ll/ayk;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/ayk;-><init>(Ll/fyk;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final M(Landroid/media/MediaExtractor;Landroid/media/MediaCodec;)V
    .locals 22

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    move-object/from16 v3, p2

    .line 6
    .line 7
    invoke-virtual {v3}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    .line 8
    .line 9
    .line 10
    move-result-object v10

    .line 11
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    const/4 v11, 0x0

    .line 15
    move v0, v11

    .line 16
    move v12, v0

    .line 17
    move v13, v12

    .line 18
    move v14, v13

    .line 19
    move v15, v14

    .line 20
    :goto_0
    if-nez v12, :cond_12

    .line 21
    .line 22
    invoke-virtual {v1}, Ll/gid;->q()Z

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    const-string v5, "AnimPlayer.HardDecoder"

    .line 27
    .line 28
    if-eqz v4, :cond_0

    .line 29
    .line 30
    sget-object v0, Ll/z0;->INSTANCE:Ll/z0;

    .line 31
    .line 32
    const-string v4, "stop decode"

    .line 33
    .line 34
    invoke-virtual {v0, v5, v4}, Ll/z0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, v3, v2}, Ll/fyk;->K(Landroid/media/MediaCodec;Landroid/media/MediaExtractor;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    const/16 v16, 0x1

    .line 42
    .line 43
    const-wide/16 v6, 0x2710

    .line 44
    .line 45
    if-nez v0, :cond_3

    .line 46
    .line 47
    invoke-virtual {v3, v6, v7}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    if-ltz v4, :cond_2

    .line 52
    .line 53
    aget-object v8, v10, v4

    .line 54
    .line 55
    invoke-virtual {v2, v8, v11}, Landroid/media/MediaExtractor;->readSampleData(Ljava/nio/ByteBuffer;I)I

    .line 56
    .line 57
    .line 58
    move-result v8

    .line 59
    if-gez v8, :cond_1

    .line 60
    .line 61
    move-wide/from16 v17, v6

    .line 62
    .line 63
    const-wide/16 v7, 0x0

    .line 64
    .line 65
    const/4 v9, 0x4

    .line 66
    move-object v6, v5

    .line 67
    const/4 v5, 0x0

    .line 68
    move-object/from16 v19, v6

    .line 69
    .line 70
    const/4 v6, 0x0

    .line 71
    move-object/from16 v11, v19

    .line 72
    .line 73
    move-wide/from16 v20, v17

    .line 74
    .line 75
    move/from16 v17, v14

    .line 76
    .line 77
    move/from16 v18, v15

    .line 78
    .line 79
    move-wide/from16 v14, v20

    .line 80
    .line 81
    invoke-virtual/range {v3 .. v9}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 82
    .line 83
    .line 84
    sget-object v0, Ll/z0;->INSTANCE:Ll/z0;

    .line 85
    .line 86
    const-string v3, "decode EOS"

    .line 87
    .line 88
    invoke-virtual {v0, v11, v3}, Ll/z0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    move-object/from16 v3, p2

    .line 92
    .line 93
    move/from16 v4, v16

    .line 94
    .line 95
    goto :goto_2

    .line 96
    :cond_1
    move-object v11, v5

    .line 97
    move/from16 v17, v14

    .line 98
    .line 99
    move/from16 v18, v15

    .line 100
    .line 101
    move-wide v14, v6

    .line 102
    move v6, v8

    .line 103
    invoke-virtual {v2}, Landroid/media/MediaExtractor;->getSampleTime()J

    .line 104
    .line 105
    .line 106
    move-result-wide v7

    .line 107
    const/4 v5, 0x0

    .line 108
    const/4 v9, 0x0

    .line 109
    move-object/from16 v3, p2

    .line 110
    .line 111
    invoke-virtual/range {v3 .. v9}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 112
    .line 113
    .line 114
    sget-object v4, Ll/z0;->INSTANCE:Ll/z0;

    .line 115
    .line 116
    new-instance v5, Ljava/lang/StringBuilder;

    .line 117
    .line 118
    const-string v7, "submitted frame "

    .line 119
    .line 120
    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    const-string v7, " to dec, size="

    .line 127
    .line 128
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v5

    .line 138
    invoke-virtual {v4, v11, v5}, Ll/z0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    add-int/lit8 v13, v13, 0x1

    .line 142
    .line 143
    invoke-virtual {v2}, Landroid/media/MediaExtractor;->advance()Z

    .line 144
    .line 145
    .line 146
    :goto_1
    move v4, v0

    .line 147
    goto :goto_2

    .line 148
    :cond_2
    move-object v11, v5

    .line 149
    move/from16 v17, v14

    .line 150
    .line 151
    move/from16 v18, v15

    .line 152
    .line 153
    move-wide v14, v6

    .line 154
    sget-object v4, Ll/z0;->INSTANCE:Ll/z0;

    .line 155
    .line 156
    const-string v5, "input buffer not available"

    .line 157
    .line 158
    invoke-virtual {v4, v11, v5}, Ll/z0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    goto :goto_1

    .line 162
    :cond_3
    move-object v11, v5

    .line 163
    move/from16 v17, v14

    .line 164
    .line 165
    move/from16 v18, v15

    .line 166
    .line 167
    move-wide v14, v6

    .line 168
    goto :goto_1

    .line 169
    :goto_2
    if-nez v12, :cond_4

    .line 170
    .line 171
    invoke-virtual {v1}, Ll/fyk;->J()Landroid/media/MediaCodec$BufferInfo;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    invoke-virtual {v3, v0, v14, v15}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    const/4 v5, -0x1

    .line 180
    if-ne v0, v5, :cond_5

    .line 181
    .line 182
    sget-object v0, Ll/z0;->INSTANCE:Ll/z0;

    .line 183
    .line 184
    const-string v5, "no output from decoder available"

    .line 185
    .line 186
    invoke-virtual {v0, v11, v5}, Ll/z0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    :cond_4
    :goto_3
    move/from16 v6, v17

    .line 190
    .line 191
    goto/16 :goto_a

    .line 192
    .line 193
    :cond_5
    const/4 v6, -0x3

    .line 194
    if-ne v0, v6, :cond_6

    .line 195
    .line 196
    sget-object v0, Ll/z0;->INSTANCE:Ll/z0;

    .line 197
    .line 198
    const-string v5, "decoder output buffers changed"

    .line 199
    .line 200
    invoke-virtual {v0, v11, v5}, Ll/z0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    goto :goto_3

    .line 204
    :cond_6
    const/4 v6, -0x2

    .line 205
    if-ne v0, v6, :cond_8

    .line 206
    .line 207
    invoke-virtual {v3}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    iput-object v0, v1, Ll/fyk;->u:Landroid/media/MediaFormat;

    .line 212
    .line 213
    if-eqz v0, :cond_7

    .line 214
    .line 215
    :try_start_0
    const-string v5, "stride"

    .line 216
    .line 217
    invoke-virtual {v0, v5}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 218
    .line 219
    .line 220
    move-result v5

    .line 221
    const-string v6, "slice-height"

    .line 222
    .line 223
    invoke-virtual {v0, v6}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 224
    .line 225
    .line 226
    move-result v0

    .line 227
    if-lez v5, :cond_7

    .line 228
    .line 229
    if-lez v0, :cond_7

    .line 230
    .line 231
    iput v5, v1, Ll/fyk;->r:I

    .line 232
    .line 233
    iput v0, v1, Ll/fyk;->s:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 234
    .line 235
    goto :goto_4

    .line 236
    :catchall_0
    move-exception v0

    .line 237
    sget-object v5, Ll/z0;->INSTANCE:Ll/z0;

    .line 238
    .line 239
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v6

    .line 243
    invoke-virtual {v5, v11, v6, v0}, Ll/z0;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 244
    .line 245
    .line 246
    :cond_7
    :goto_4
    sget-object v0, Ll/z0;->INSTANCE:Ll/z0;

    .line 247
    .line 248
    iget-object v5, v1, Ll/fyk;->u:Landroid/media/MediaFormat;

    .line 249
    .line 250
    new-instance v6, Ljava/lang/StringBuilder;

    .line 251
    .line 252
    const-string v7, "decoder output format changed: "

    .line 253
    .line 254
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 255
    .line 256
    .line 257
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object v5

    .line 264
    invoke-virtual {v0, v11, v5}, Ll/z0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 265
    .line 266
    .line 267
    goto :goto_3

    .line 268
    :cond_8
    if-ltz v0, :cond_11

    .line 269
    .line 270
    invoke-virtual {v1}, Ll/fyk;->J()Landroid/media/MediaCodec$BufferInfo;

    .line 271
    .line 272
    .line 273
    move-result-object v6

    .line 274
    iget v6, v6, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 275
    .line 276
    and-int/lit8 v6, v6, 0x4

    .line 277
    .line 278
    if-eqz v6, :cond_a

    .line 279
    .line 280
    invoke-virtual {v1}, Ll/gid;->k()I

    .line 281
    .line 282
    .line 283
    move-result v6

    .line 284
    add-int/2addr v6, v5

    .line 285
    invoke-virtual {v1, v6}, Ll/gid;->w(I)V

    .line 286
    .line 287
    .line 288
    invoke-virtual {v1}, Ll/gid;->k()I

    .line 289
    .line 290
    .line 291
    move-result v5

    .line 292
    invoke-virtual {v1}, Ll/gid;->l()Ll/ap0;

    .line 293
    .line 294
    .line 295
    move-result-object v6

    .line 296
    invoke-virtual {v1}, Ll/gid;->k()I

    .line 297
    .line 298
    .line 299
    move-result v7

    .line 300
    invoke-virtual {v6, v7}, Ll/ap0;->z(I)V

    .line 301
    .line 302
    .line 303
    invoke-virtual {v1}, Ll/gid;->k()I

    .line 304
    .line 305
    .line 306
    move-result v6

    .line 307
    if-gtz v6, :cond_9

    .line 308
    .line 309
    move/from16 v6, v16

    .line 310
    .line 311
    goto :goto_5

    .line 312
    :cond_9
    const/4 v6, 0x0

    .line 313
    :goto_5
    move v12, v6

    .line 314
    goto :goto_6

    .line 315
    :cond_a
    const/4 v5, 0x0

    .line 316
    :goto_6
    if-nez v12, :cond_b

    .line 317
    .line 318
    invoke-virtual {v1}, Ll/gid;->o()Ll/rvf0;

    .line 319
    .line 320
    .line 321
    move-result-object v6

    .line 322
    invoke-virtual {v1}, Ll/fyk;->J()Landroid/media/MediaCodec$BufferInfo;

    .line 323
    .line 324
    .line 325
    move-result-object v7

    .line 326
    iget-wide v7, v7, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 327
    .line 328
    invoke-virtual {v6, v7, v8}, Ll/rvf0;->a(J)V

    .line 329
    .line 330
    .line 331
    :cond_b
    iget-boolean v6, v1, Ll/fyk;->t:Z

    .line 332
    .line 333
    if-eqz v6, :cond_c

    .line 334
    .line 335
    if-nez v12, :cond_c

    .line 336
    .line 337
    invoke-virtual {v1, v3, v0}, Ll/fyk;->R(Landroid/media/MediaCodec;I)V

    .line 338
    .line 339
    .line 340
    :cond_c
    if-nez v12, :cond_d

    .line 341
    .line 342
    iget-boolean v6, v1, Ll/fyk;->t:Z

    .line 343
    .line 344
    if-nez v6, :cond_d

    .line 345
    .line 346
    move/from16 v6, v16

    .line 347
    .line 348
    goto :goto_7

    .line 349
    :cond_d
    const/4 v6, 0x0

    .line 350
    :goto_7
    invoke-virtual {v3, v0, v6}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 351
    .line 352
    .line 353
    if-nez v17, :cond_e

    .line 354
    .line 355
    if-nez v18, :cond_e

    .line 356
    .line 357
    invoke-virtual {v1}, Ll/gid;->c()V

    .line 358
    .line 359
    .line 360
    :cond_e
    invoke-virtual {v1}, Ll/gid;->l()Ll/ap0;

    .line 361
    .line 362
    .line 363
    move-result-object v0

    .line 364
    invoke-virtual {v0}, Ll/ap0;->j()Ll/bp0;

    .line 365
    .line 366
    .line 367
    move-result-object v0

    .line 368
    move/from16 v6, v17

    .line 369
    .line 370
    invoke-virtual {v0, v6}, Ll/bp0;->c(I)V

    .line 371
    .line 372
    .line 373
    invoke-virtual {v1}, Ll/gid;->l()Ll/ap0;

    .line 374
    .line 375
    .line 376
    move-result-object v0

    .line 377
    invoke-virtual {v0}, Ll/ap0;->e()Ll/ko0;

    .line 378
    .line 379
    .line 380
    move-result-object v0

    .line 381
    invoke-virtual {v0}, Ll/ko0;->b()Ll/jo0;

    .line 382
    .line 383
    .line 384
    move-result-object v0

    .line 385
    invoke-virtual {v1, v6, v0}, Ll/gid;->d(ILl/jo0;)V

    .line 386
    .line 387
    .line 388
    add-int/lit8 v14, v6, 0x1

    .line 389
    .line 390
    sget-object v0, Ll/z0;->INSTANCE:Ll/z0;

    .line 391
    .line 392
    new-instance v6, Ljava/lang/StringBuilder;

    .line 393
    .line 394
    const-string v7, "decode frameIndex="

    .line 395
    .line 396
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 397
    .line 398
    .line 399
    invoke-virtual {v6, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 400
    .line 401
    .line 402
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 403
    .line 404
    .line 405
    move-result-object v6

    .line 406
    invoke-virtual {v0, v11, v6}, Ll/z0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 407
    .line 408
    .line 409
    if-lez v5, :cond_f

    .line 410
    .line 411
    const-string v4, "Reached EOD, looping"

    .line 412
    .line 413
    invoke-virtual {v0, v11, v4}, Ll/z0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 414
    .line 415
    .line 416
    invoke-virtual {v1}, Ll/gid;->l()Ll/ap0;

    .line 417
    .line 418
    .line 419
    move-result-object v0

    .line 420
    invoke-virtual {v0}, Ll/ap0;->j()Ll/bp0;

    .line 421
    .line 422
    .line 423
    move-result-object v0

    .line 424
    invoke-virtual {v0}, Ll/bp0;->f()V

    .line 425
    .line 426
    .line 427
    const-wide/16 v4, 0x0

    .line 428
    .line 429
    const/4 v0, 0x2

    .line 430
    invoke-virtual {v2, v4, v5, v0}, Landroid/media/MediaExtractor;->seekTo(JI)V

    .line 431
    .line 432
    .line 433
    invoke-virtual {v3}, Landroid/media/MediaCodec;->flush()V

    .line 434
    .line 435
    .line 436
    invoke-virtual {v1}, Ll/gid;->o()Ll/rvf0;

    .line 437
    .line 438
    .line 439
    move-result-object v0

    .line 440
    invoke-virtual {v0}, Ll/rvf0;->b()V

    .line 441
    .line 442
    .line 443
    move/from16 v15, v16

    .line 444
    .line 445
    const/4 v0, 0x0

    .line 446
    const/4 v14, 0x0

    .line 447
    goto :goto_8

    .line 448
    :cond_f
    move v0, v4

    .line 449
    move/from16 v15, v18

    .line 450
    .line 451
    :goto_8
    if-eqz v12, :cond_10

    .line 452
    .line 453
    invoke-virtual {v1, v3, v2}, Ll/fyk;->K(Landroid/media/MediaCodec;Landroid/media/MediaExtractor;)V

    .line 454
    .line 455
    .line 456
    :cond_10
    :goto_9
    const/4 v11, 0x0

    .line 457
    goto/16 :goto_0

    .line 458
    .line 459
    :cond_11
    new-instance v1, Ljava/lang/RuntimeException;

    .line 460
    .line 461
    new-instance v2, Ljava/lang/StringBuilder;

    .line 462
    .line 463
    const-string v3, "unexpected result from decoder.dequeueOutputBuffer: "

    .line 464
    .line 465
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 466
    .line 467
    .line 468
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 469
    .line 470
    .line 471
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 472
    .line 473
    .line 474
    move-result-object v0

    .line 475
    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 476
    .line 477
    .line 478
    throw v1

    .line 479
    :goto_a
    move v0, v4

    .line 480
    move v14, v6

    .line 481
    move/from16 v15, v18

    .line 482
    .line 483
    goto :goto_9

    .line 484
    :cond_12
    return-void
.end method

.method public final N(Ll/wtl;)V
    .locals 11

    .line 1
    const-string v0, "video/hevc"

    .line 2
    .line 3
    const-string v1, "AnimPlayer.HardDecoder"

    .line 4
    .line 5
    const-string v2, "0x4 render create fail e="

    .line 6
    .line 7
    const-string v3, "Video MIME is "

    .line 8
    .line 9
    const-string v4, "Video size is "

    .line 10
    .line 11
    const-string v5, "0x8 hevc not support sdk:"

    .line 12
    .line 13
    new-instance v6, Lkotlin/jvm/internal/Ref$ObjectRef;

    .line 14
    .line 15
    invoke-direct {v6}, Lkotlin/jvm/internal/Ref$ObjectRef;-><init>()V

    .line 16
    .line 17
    .line 18
    new-instance v7, Lkotlin/jvm/internal/Ref$ObjectRef;

    .line 19
    .line 20
    invoke-direct {v7}, Lkotlin/jvm/internal/Ref$ObjectRef;-><init>()V

    .line 21
    .line 22
    .line 23
    :try_start_0
    sget-object v8, Ll/m7y;->INSTANCE:Ll/m7y;

    .line 24
    .line 25
    invoke-virtual {v8, p1}, Ll/m7y;->c(Ll/wtl;)Landroid/media/MediaExtractor;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, v6, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 30
    .line 31
    invoke-virtual {v8, p1}, Ll/m7y;->f(Landroid/media/MediaExtractor;)I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-ltz p1, :cond_8

    .line 36
    .line 37
    iget-object v9, v6, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast v9, Landroid/media/MediaExtractor;

    .line 40
    .line 41
    invoke-virtual {v9, p1}, Landroid/media/MediaExtractor;->selectTrack(I)V

    .line 42
    .line 43
    .line 44
    iget-object v9, v6, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 45
    .line 46
    check-cast v9, Landroid/media/MediaExtractor;

    .line 47
    .line 48
    invoke-virtual {v9, p1}, Landroid/media/MediaExtractor;->getTrackFormat(I)Landroid/media/MediaFormat;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    if-eqz p1, :cond_7

    .line 53
    .line 54
    invoke-virtual {v8, p1}, Ll/m7y;->a(Landroid/media/MediaFormat;)Z

    .line 55
    .line 56
    .line 57
    move-result v9

    .line 58
    const/4 v10, 0x0

    .line 59
    if-eqz v9, :cond_0

    .line 60
    .line 61
    invoke-virtual {v8, v0}, Ll/m7y;->b(Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    move-result v9

    .line 65
    if-nez v9, :cond_0

    .line 66
    .line 67
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 68
    .line 69
    invoke-virtual {v8, v0}, Ll/m7y;->b(Ljava/lang/String;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    new-instance v2, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    const-string p1, ",support hevc:"

    .line 82
    .line 83
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    const/16 v0, 0x2718

    .line 94
    .line 95
    invoke-virtual {p0, v0, p1}, Ll/gid;->a(ILjava/lang/String;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0, v10, v10}, Ll/fyk;->K(Landroid/media/MediaCodec;Landroid/media/MediaExtractor;)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :catchall_0
    move-exception p1

    .line 103
    goto/16 :goto_4

    .line 104
    .line 105
    :cond_0
    const-string v0, "width"

    .line 106
    .line 107
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    iput v0, p0, Ll/fyk;->p:I

    .line 112
    .line 113
    const-string v0, "height"

    .line 114
    .line 115
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    iput v0, p0, Ll/fyk;->q:I

    .line 120
    .line 121
    iget v5, p0, Ll/fyk;->p:I

    .line 122
    .line 123
    iput v5, p0, Ll/fyk;->r:I

    .line 124
    .line 125
    iput v0, p0, Ll/fyk;->s:I

    .line 126
    .line 127
    sget-object v8, Ll/z0;->INSTANCE:Ll/z0;

    .line 128
    .line 129
    new-instance v9, Ljava/lang/StringBuilder;

    .line 130
    .line 131
    invoke-direct {v9, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    const-string v4, " x "

    .line 138
    .line 139
    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-virtual {v8, v1, v0}, Ll/z0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    iget v0, p0, Ll/fyk;->p:I

    .line 153
    .line 154
    rem-int/lit8 v0, v0, 0x10

    .line 155
    .line 156
    const/4 v4, 0x0

    .line 157
    if-eqz v0, :cond_1

    .line 158
    .line 159
    invoke-virtual {p0}, Ll/gid;->l()Ll/ap0;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-virtual {v0}, Ll/ap0;->g()Z

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    if-eqz v0, :cond_1

    .line 168
    .line 169
    const/4 v0, 0x1

    .line 170
    goto :goto_0

    .line 171
    :cond_1
    move v0, v4

    .line 172
    :goto_0
    iput-boolean v0, p0, Ll/fyk;->t:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 173
    .line 174
    :try_start_1
    invoke-virtual {p0, v0}, Ll/gid;->t(Z)Z

    .line 175
    .line 176
    .line 177
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 178
    if-eqz v0, :cond_6

    .line 179
    .line 180
    :try_start_2
    iget v0, p0, Ll/fyk;->p:I

    .line 181
    .line 182
    iget v2, p0, Ll/fyk;->q:I

    .line 183
    .line 184
    invoke-virtual {p0, v0, v2}, Ll/gid;->s(II)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {p0}, Ll/gid;->m()Ll/q4m;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    if-eqz v0, :cond_2

    .line 192
    .line 193
    new-instance v2, Landroid/graphics/SurfaceTexture;

    .line 194
    .line 195
    invoke-interface {v0}, Ll/q4m;->a()I

    .line 196
    .line 197
    .line 198
    move-result v5

    .line 199
    invoke-direct {v2, v5}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 200
    .line 201
    .line 202
    invoke-virtual {v2, p0}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 203
    .line 204
    .line 205
    iget v5, p0, Ll/fyk;->p:I

    .line 206
    .line 207
    iget v9, p0, Ll/fyk;->q:I

    .line 208
    .line 209
    invoke-virtual {v2, v5, v9}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 210
    .line 211
    .line 212
    iput-object v2, p0, Ll/fyk;->m:Landroid/graphics/SurfaceTexture;

    .line 213
    .line 214
    invoke-interface {v0}, Ll/q4m;->h()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 215
    .line 216
    .line 217
    :cond_2
    :try_start_3
    const-string v0, "mime"

    .line 218
    .line 219
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    if-nez v0, :cond_3

    .line 224
    .line 225
    const-string v0, ""

    .line 226
    .line 227
    goto :goto_1

    .line 228
    :catchall_1
    move-exception p1

    .line 229
    goto :goto_3

    .line 230
    :cond_3
    :goto_1
    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v2

    .line 234
    invoke-virtual {v8, v1, v2}, Ll/z0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    invoke-static {v0}, Landroid/media/MediaCodec;->createDecoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    iget-boolean v2, p0, Ll/fyk;->t:Z

    .line 242
    .line 243
    if-eqz v2, :cond_4

    .line 244
    .line 245
    const-string v2, "color-format"

    .line 246
    .line 247
    const/16 v3, 0x13

    .line 248
    .line 249
    invoke-virtual {p1, v2, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 250
    .line 251
    .line 252
    invoke-virtual {v0, p1, v10, v10, v4}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 253
    .line 254
    .line 255
    goto :goto_2

    .line 256
    :cond_4
    new-instance v2, Landroid/view/Surface;

    .line 257
    .line 258
    iget-object v3, p0, Ll/fyk;->m:Landroid/graphics/SurfaceTexture;

    .line 259
    .line 260
    invoke-direct {v2, v3}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 261
    .line 262
    .line 263
    iput-object v2, p0, Ll/fyk;->l:Landroid/view/Surface;

    .line 264
    .line 265
    invoke-virtual {v0, p1, v2, v10, v4}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 266
    .line 267
    .line 268
    :goto_2
    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V

    .line 269
    .line 270
    .line 271
    invoke-virtual {p0}, Ll/gid;->j()Ll/oxk;

    .line 272
    .line 273
    .line 274
    move-result-object p1

    .line 275
    invoke-virtual {p1}, Ll/oxk;->a()Landroid/os/Handler;

    .line 276
    .line 277
    .line 278
    move-result-object p1

    .line 279
    if-eqz p1, :cond_5

    .line 280
    .line 281
    new-instance v2, Ll/dyk;

    .line 282
    .line 283
    invoke-direct {v2, p0, v6, v0, v7}, Ll/dyk;-><init>(Ll/fyk;Lkotlin/jvm/internal/Ref$ObjectRef;Landroid/media/MediaCodec;Lkotlin/jvm/internal/Ref$ObjectRef;)V

    .line 284
    .line 285
    .line 286
    invoke-virtual {p1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 287
    .line 288
    .line 289
    :cond_5
    iput-object v0, v7, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 290
    .line 291
    return-void

    .line 292
    :goto_3
    sget-object v0, Ll/z0;->INSTANCE:Ll/z0;

    .line 293
    .line 294
    new-instance v2, Ljava/lang/StringBuilder;

    .line 295
    .line 296
    const-string v3, "MediaCodec configure exception e="

    .line 297
    .line 298
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 299
    .line 300
    .line 301
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 302
    .line 303
    .line 304
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 305
    .line 306
    .line 307
    move-result-object v2

    .line 308
    invoke-virtual {v0, v1, v2, p1}, Ll/z0;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 309
    .line 310
    .line 311
    new-instance v0, Ljava/lang/StringBuilder;

    .line 312
    .line 313
    const-string v1, "0x2 MediaCodec exception e="

    .line 314
    .line 315
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 316
    .line 317
    .line 318
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 319
    .line 320
    .line 321
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 322
    .line 323
    .line 324
    move-result-object p1

    .line 325
    const/16 v0, 0x2712

    .line 326
    .line 327
    invoke-virtual {p0, v0, p1}, Ll/gid;->a(ILjava/lang/String;)V

    .line 328
    .line 329
    .line 330
    iget-object p1, v7, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 331
    .line 332
    check-cast p1, Landroid/media/MediaCodec;

    .line 333
    .line 334
    iget-object v0, v6, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 335
    .line 336
    check-cast v0, Landroid/media/MediaExtractor;

    .line 337
    .line 338
    invoke-virtual {p0, p1, v0}, Ll/fyk;->K(Landroid/media/MediaCodec;Landroid/media/MediaExtractor;)V

    .line 339
    .line 340
    .line 341
    return-void

    .line 342
    :cond_6
    :try_start_4
    new-instance p1, Ljava/lang/RuntimeException;

    .line 343
    .line 344
    const-string v0, "render create fail"

    .line 345
    .line 346
    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 347
    .line 348
    .line 349
    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 350
    :catchall_2
    move-exception p1

    .line 351
    :try_start_5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 352
    .line 353
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 354
    .line 355
    .line 356
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 357
    .line 358
    .line 359
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 360
    .line 361
    .line 362
    move-result-object p1

    .line 363
    const/16 v0, 0x2714

    .line 364
    .line 365
    invoke-virtual {p0, v0, p1}, Ll/gid;->a(ILjava/lang/String;)V

    .line 366
    .line 367
    .line 368
    invoke-virtual {p0, v10, v10}, Ll/fyk;->K(Landroid/media/MediaCodec;Landroid/media/MediaExtractor;)V

    .line 369
    .line 370
    .line 371
    return-void

    .line 372
    :cond_7
    new-instance p1, Ljava/lang/RuntimeException;

    .line 373
    .line 374
    const-string v0, "format is null"

    .line 375
    .line 376
    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 377
    .line 378
    .line 379
    throw p1

    .line 380
    :cond_8
    new-instance p1, Ljava/lang/RuntimeException;

    .line 381
    .line 382
    const-string v0, "No video track found"

    .line 383
    .line 384
    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 385
    .line 386
    .line 387
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 388
    :goto_4
    sget-object v0, Ll/z0;->INSTANCE:Ll/z0;

    .line 389
    .line 390
    new-instance v2, Ljava/lang/StringBuilder;

    .line 391
    .line 392
    const-string v3, "MediaExtractor exception e="

    .line 393
    .line 394
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 395
    .line 396
    .line 397
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 398
    .line 399
    .line 400
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 401
    .line 402
    .line 403
    move-result-object v2

    .line 404
    invoke-virtual {v0, v1, v2, p1}, Ll/z0;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 405
    .line 406
    .line 407
    new-instance v0, Ljava/lang/StringBuilder;

    .line 408
    .line 409
    const-string v1, "0x1 MediaExtractor exception e="

    .line 410
    .line 411
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 412
    .line 413
    .line 414
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 415
    .line 416
    .line 417
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 418
    .line 419
    .line 420
    move-result-object p1

    .line 421
    const/16 v0, 0x2711

    .line 422
    .line 423
    invoke-virtual {p0, v0, p1}, Ll/gid;->a(ILjava/lang/String;)V

    .line 424
    .line 425
    .line 426
    iget-object p1, v7, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 427
    .line 428
    check-cast p1, Landroid/media/MediaCodec;

    .line 429
    .line 430
    iget-object v0, v6, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 431
    .line 432
    check-cast v0, Landroid/media/MediaExtractor;

    .line 433
    .line 434
    invoke-virtual {p0, p1, v0}, Ll/fyk;->K(Landroid/media/MediaCodec;Landroid/media/MediaExtractor;)V

    .line 435
    .line 436
    .line 437
    return-void
.end method

.method public final P([B)[B
    .locals 5

    .line 1
    array-length v0, p1

    .line 2
    new-array v0, v0, [B

    .line 3
    .line 4
    iget v1, p0, Ll/fyk;->r:I

    .line 5
    .line 6
    iget p0, p0, Ll/fyk;->s:I

    .line 7
    .line 8
    mul-int v2, v1, p0

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    mul-int/2addr v1, p0

    .line 12
    invoke-static {p1, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 13
    .line 14
    .line 15
    move p0, v2

    .line 16
    move v1, p0

    .line 17
    :goto_0
    mul-int/lit8 v3, v2, 0x3

    .line 18
    .line 19
    div-int/lit8 v3, v3, 0x2

    .line 20
    .line 21
    if-ge p0, v3, :cond_0

    .line 22
    .line 23
    aget-byte v3, p1, p0

    .line 24
    .line 25
    aput-byte v3, v0, v1

    .line 26
    .line 27
    div-int/lit8 v3, v2, 0x4

    .line 28
    .line 29
    add-int/2addr v3, v1

    .line 30
    add-int/lit8 v4, p0, 0x1

    .line 31
    .line 32
    aget-byte v4, p1, v4

    .line 33
    .line 34
    aput-byte v4, v0, v3

    .line 35
    .line 36
    add-int/lit8 p0, p0, 0x2

    .line 37
    .line 38
    add-int/lit8 v1, v1, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    return-object v0
.end method

.method public final Q([BIII[BII)V
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    :goto_0
    if-ge p0, p4, :cond_1

    .line 3
    .line 4
    if-ge p0, p7, :cond_0

    .line 5
    .line 6
    mul-int v0, p0, p3

    .line 7
    .line 8
    add-int/2addr v0, p2

    .line 9
    mul-int v1, p0, p6

    .line 10
    .line 11
    invoke-static {p1, v0, p5, v1, p6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 12
    .line 13
    .line 14
    :cond_0
    add-int/lit8 p0, p0, 0x1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    return-void
.end method

.method public final R(Landroid/media/MediaCodec;I)V
    .locals 11

    .line 1
    invoke-virtual {p1}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    aget-object v1, v1, p2

    .line 6
    .line 7
    if-eqz v1, :cond_3

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/fyk;->J()Landroid/media/MediaCodec$BufferInfo;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    iget v3, v3, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/fyk;->J()Landroid/media/MediaCodec$BufferInfo;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    iget v4, v4, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 24
    .line 25
    add-int/2addr v3, v4

    .line 26
    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/nio/Buffer;->remaining()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    new-array v4, v3, [B

    .line 34
    .line 35
    invoke-virtual {v1, v4}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 36
    .line 37
    .line 38
    if-nez v3, :cond_0

    .line 39
    .line 40
    const/4 v2, 0x1

    .line 41
    :cond_0
    if-nez v2, :cond_3

    .line 42
    .line 43
    iget v1, p0, Ll/fyk;->p:I

    .line 44
    .line 45
    iget v2, p0, Ll/fyk;->q:I

    .line 46
    .line 47
    mul-int v3, v1, v2

    .line 48
    .line 49
    new-array v5, v3, [B

    .line 50
    .line 51
    mul-int v3, v1, v2

    .line 52
    .line 53
    div-int/lit8 v3, v3, 0x4

    .line 54
    .line 55
    new-array v9, v3, [B

    .line 56
    .line 57
    mul-int/2addr v1, v2

    .line 58
    div-int/lit8 v1, v1, 0x4

    .line 59
    .line 60
    new-array v10, v1, [B

    .line 61
    .line 62
    iget-object v1, p0, Ll/fyk;->u:Landroid/media/MediaFormat;

    .line 63
    .line 64
    if-eqz v1, :cond_1

    .line 65
    .line 66
    const-string v2, "color-format"

    .line 67
    .line 68
    invoke-virtual {v1, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    const/16 v2, 0x15

    .line 73
    .line 74
    if-ne v1, v2, :cond_1

    .line 75
    .line 76
    invoke-virtual {p0, v4}, Ll/fyk;->P([B)[B

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    :cond_1
    move-object v1, v4

    .line 81
    iget v3, p0, Ll/fyk;->r:I

    .line 82
    .line 83
    iget v4, p0, Ll/fyk;->s:I

    .line 84
    .line 85
    iget v6, p0, Ll/fyk;->p:I

    .line 86
    .line 87
    iget v7, p0, Ll/fyk;->q:I

    .line 88
    .line 89
    const/4 v2, 0x0

    .line 90
    move-object v0, p0

    .line 91
    invoke-virtual/range {v0 .. v7}, Ll/fyk;->Q([BIII[BII)V

    .line 92
    .line 93
    .line 94
    move-object v8, v5

    .line 95
    iget v2, p0, Ll/fyk;->r:I

    .line 96
    .line 97
    iget v3, p0, Ll/fyk;->s:I

    .line 98
    .line 99
    move v4, v2

    .line 100
    mul-int v2, v4, v3

    .line 101
    .line 102
    div-int/lit8 v4, v4, 0x2

    .line 103
    .line 104
    div-int/lit8 v3, v3, 0x2

    .line 105
    .line 106
    iget v5, p0, Ll/fyk;->p:I

    .line 107
    .line 108
    div-int/lit8 v6, v5, 0x2

    .line 109
    .line 110
    iget v5, p0, Ll/fyk;->q:I

    .line 111
    .line 112
    div-int/lit8 v7, v5, 0x2

    .line 113
    .line 114
    move v0, v4

    .line 115
    move v4, v3

    .line 116
    move v3, v0

    .line 117
    move-object v0, p0

    .line 118
    move-object v5, v9

    .line 119
    invoke-virtual/range {v0 .. v7}, Ll/fyk;->Q([BIII[BII)V

    .line 120
    .line 121
    .line 122
    iget v2, p0, Ll/fyk;->r:I

    .line 123
    .line 124
    iget v3, p0, Ll/fyk;->s:I

    .line 125
    .line 126
    mul-int v4, v2, v3

    .line 127
    .line 128
    mul-int/lit8 v4, v4, 0x5

    .line 129
    .line 130
    div-int/lit8 v4, v4, 0x4

    .line 131
    .line 132
    div-int/lit8 v2, v2, 0x2

    .line 133
    .line 134
    div-int/lit8 v3, v3, 0x2

    .line 135
    .line 136
    iget v5, p0, Ll/fyk;->p:I

    .line 137
    .line 138
    div-int/lit8 v6, v5, 0x2

    .line 139
    .line 140
    iget v5, p0, Ll/fyk;->q:I

    .line 141
    .line 142
    div-int/lit8 v7, v5, 0x2

    .line 143
    .line 144
    move v0, v3

    .line 145
    move v3, v2

    .line 146
    move v2, v4

    .line 147
    move v4, v0

    .line 148
    move-object v0, p0

    .line 149
    move-object v5, v10

    .line 150
    invoke-virtual/range {v0 .. v7}, Ll/fyk;->Q([BIII[BII)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0}, Ll/gid;->m()Ll/q4m;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    if-eqz v1, :cond_2

    .line 158
    .line 159
    iget v6, p0, Ll/fyk;->p:I

    .line 160
    .line 161
    iget v7, p0, Ll/fyk;->q:I

    .line 162
    .line 163
    move-object v10, v5

    .line 164
    move-object v5, v1

    .line 165
    invoke-interface/range {v5 .. v10}, Ll/q4m;->d(II[B[B[B)V

    .line 166
    .line 167
    .line 168
    :cond_2
    invoke-virtual {p0}, Ll/fyk;->L()V

    .line 169
    .line 170
    .line 171
    :cond_3
    return-void
.end method

.method public h()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/gid;->p()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Ll/fyk;->o:Z

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/gid;->B()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/fyk;->I()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 2
    .param p1    # Landroid/graphics/SurfaceTexture;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Ll/gid;->q()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object p1, Ll/z0;->INSTANCE:Ll/z0;

    .line 9
    .line 10
    const-string v0, "AnimPlayer.HardDecoder"

    .line 11
    .line 12
    const-string v1, "onFrameAvailable"

    .line 13
    .line 14
    invoke-virtual {p1, v0, v1}, Ll/z0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/fyk;->L()V

    .line 18
    .line 19
    .line 20
    return-void
.end method
