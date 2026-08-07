.class public final Ll/qgl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/p13;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/qgl$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u0000 \u00152\u00020\u0001:\u0001\u000cB\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\'\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0008\u001a\u00020\u00062\u0006\u0010\n\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\rR\u0014\u0010\u0010\u001a\u00020\u000e8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000c\u0010\u000fR\u0014\u0010\u0014\u001a\u00020\u00118\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0012\u0010\u0013\u00a8\u0006\u0016"
    }
    d2 = {
        "Ll/qgl;",
        "Ll/p13;",
        "Ll/aj80;",
        "poolFactory",
        "<init>",
        "(Ll/aj80;)V",
        "",
        "width",
        "height",
        "Landroid/graphics/Bitmap$Config;",
        "bitmapConfig",
        "Landroid/graphics/Bitmap;",
        "a",
        "(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;",
        "Ll/xze;",
        "Ll/xze;",
        "jpegGenerator",
        "Ll/vsi;",
        "b",
        "Ll/vsi;",
        "flexByteArrayPool",
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


# static fields
.field public static final Companion:Ll/qgl$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Ll/xze;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Ll/vsi;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/qgl$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/qgl$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/qgl;->Companion:Ll/qgl$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Ll/aj80;)V
    .locals 2
    .param p1    # Ll/aj80;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/xze;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/aj80;->h()Ll/fj80;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-direct {v0, v1}, Ll/xze;-><init>(Ll/fj80;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/qgl;->a:Ll/xze;

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/aj80;->d()Ll/vsi;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Ll/qgl;->b:Ll/vsi;

    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public a(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    .locals 4
    .param p3    # Landroid/graphics/Bitmap$Config;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/qgl;->a:Ll/xze;

    .line 5
    .line 6
    int-to-short p1, p1

    .line 7
    int-to-short p2, p2

    .line 8
    invoke-virtual {v0, p1, p2}, Ll/xze;->a(SS)Ll/fb5;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    const/4 p2, 0x0

    .line 16
    :try_start_0
    new-instance v0, Ll/n0f;

    .line 17
    .line 18
    invoke-direct {v0, p1}, Ll/n0f;-><init>(Ll/fb5;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 19
    .line 20
    .line 21
    :try_start_1
    sget-object v1, Ll/ppd;->a:Ll/him;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/n0f;->n0(Ll/him;)V

    .line 24
    .line 25
    .line 26
    sget-object v1, Ll/qgl;->Companion:Ll/qgl$a;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/n0f;->J()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    invoke-static {v1, v2, p3}, Ll/qgl$a;->a(Ll/qgl$a;ILandroid/graphics/Bitmap$Config;)Landroid/graphics/BitmapFactory$Options;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    invoke-virtual {p1}, Ll/fb5;->B()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Lcom/facebook/common/memory/PooledByteBuffer;

    .line 41
    .line 42
    invoke-interface {v1}, Lcom/facebook/common/memory/PooledByteBuffer;->size()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-virtual {p1}, Ll/fb5;->B()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 51
    .line 52
    .line 53
    check-cast v2, Lcom/facebook/common/memory/PooledByteBuffer;

    .line 54
    .line 55
    iget-object p0, p0, Ll/qgl;->b:Ll/vsi;

    .line 56
    .line 57
    add-int/lit8 v3, v1, 0x2

    .line 58
    .line 59
    invoke-virtual {p0, v3}, Ll/vsi;->a(I)Ll/fb5;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-virtual {p2}, Ll/fb5;->B()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 68
    .line 69
    .line 70
    check-cast p0, [B

    .line 71
    .line 72
    const/4 v3, 0x0

    .line 73
    invoke-interface {v2, v3, p0, v3, v1}, Lcom/facebook/common/memory/PooledByteBuffer;->p(I[BII)I

    .line 74
    .line 75
    .line 76
    invoke-static {p0, v3, v1, p3}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    if-eqz p0, :cond_0

    .line 81
    .line 82
    const/4 p3, 0x1

    .line 83
    invoke-virtual {p0, p3}, Landroid/graphics/Bitmap;->setHasAlpha(Z)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0, v3}, Landroid/graphics/Bitmap;->eraseColor(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 87
    .line 88
    .line 89
    invoke-static {p2}, Ll/fb5;->v(Ll/fb5;)V

    .line 90
    .line 91
    .line 92
    invoke-static {v0}, Ll/n0f;->n(Ll/n0f;)V

    .line 93
    .line 94
    .line 95
    invoke-static {p1}, Ll/fb5;->v(Ll/fb5;)V

    .line 96
    .line 97
    .line 98
    return-object p0

    .line 99
    :catchall_0
    move-exception p0

    .line 100
    goto :goto_0

    .line 101
    :cond_0
    :try_start_2
    const-string p0, "Required value was null."

    .line 102
    .line 103
    new-instance p3, Ljava/lang/IllegalStateException;

    .line 104
    .line 105
    invoke-direct {p3, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    throw p3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 109
    :catchall_1
    move-exception p0

    .line 110
    move-object v0, p2

    .line 111
    :goto_0
    invoke-static {p2}, Ll/fb5;->v(Ll/fb5;)V

    .line 112
    .line 113
    .line 114
    invoke-static {v0}, Ll/n0f;->n(Ll/n0f;)V

    .line 115
    .line 116
    .line 117
    invoke-static {p1}, Ll/fb5;->v(Ll/fb5;)V

    .line 118
    .line 119
    .line 120
    throw p0
.end method
