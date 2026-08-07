.class public final Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor$a;,
        Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor$CropType;,
        Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor$b;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0012\u0018\u0000 \"2\u00020\u0001:\u0002\u001a#B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J+\u0010\u000b\u001a\u00020\n2\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u00062\u0008\u0008\u0002\u0010\u0008\u001a\u00020\u00062\u0008\u0008\u0002\u0010\t\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\r\u0010\r\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\r\u0010\u0010\u001a\u00020\u000f\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\u000f\u0010\u0013\u001a\u00020\u0012H\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u000f\u0010\u0015\u001a\u00020\u0012H\u0002\u00a2\u0006\u0004\u0008\u0015\u0010\u0014J\u000f\u0010\u0016\u001a\u00020\u0012H\u0002\u00a2\u0006\u0004\u0008\u0016\u0010\u0014J\u000f\u0010\u0017\u001a\u00020\u0012H\u0002\u00a2\u0006\u0004\u0008\u0017\u0010\u0014J\u000f\u0010\u0018\u001a\u00020\u0012H\u0002\u00a2\u0006\u0004\u0008\u0018\u0010\u0014J\u000f\u0010\u0019\u001a\u00020\u0012H\u0002\u00a2\u0006\u0004\u0008\u0019\u0010\u0014J\u000f\u0010\u001a\u001a\u00020\u0012H\u0002\u00a2\u0006\u0004\u0008\u001a\u0010\u0014J\u000f\u0010\u001b\u001a\u00020\u0012H\u0002\u00a2\u0006\u0004\u0008\u001b\u0010\u0014J\u000f\u0010\u001c\u001a\u00020\u0012H\u0002\u00a2\u0006\u0004\u0008\u001c\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u001a\u0010\u001d\u001a\u0004\u0008\u001e\u0010\u000eR\u0014\u0010 \u001a\u00020\u00068\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0010\u0010\u001fR\u0014\u0010!\u001a\u00020\u00068\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0016\u0010\u001fR\u0016\u0010\u0007\u001a\u00020\u00068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0013\u0010\u001fR\u0016\u0010\u0008\u001a\u00020\u00068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0015\u0010\u001fR\u0016\u0010\t\u001a\u00020\u00068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0018\u0010\u001f\u00a8\u0006$"
    }
    d2 = {
        "Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;",
        "",
        "Landroid/graphics/Bitmap;",
        "source",
        "<init>",
        "(Landroid/graphics/Bitmap;)V",
        "",
        "scaledWidth",
        "scaledHeight",
        "backgroundColor",
        "",
        "l",
        "(III)V",
        "k",
        "()Landroid/graphics/Bitmap;",
        "Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor$CropType;",
        "b",
        "()Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor$CropType;",
        "Landroid/graphics/Rect;",
        "d",
        "()Landroid/graphics/Rect;",
        "e",
        "c",
        "g",
        "f",
        "i",
        "a",
        "j",
        "h",
        "Landroid/graphics/Bitmap;",
        "getSource",
        "I",
        "width",
        "height",
        "Companion",
        "CropType",
        "android_release"
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
.field public static final Companion:Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Landroid/graphics/Bitmap;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:I

.field public final c:I

.field public d:I

.field public e:I

.field public f:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->Companion:Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor$a;

    return-void
.end method

.method public constructor <init>(Landroid/graphics/Bitmap;)V
    .locals 1
    .param p1    # Landroid/graphics/Bitmap;
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
    iput-object p1, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->a:Landroid/graphics/Bitmap;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->b:I

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    iput p1, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->c:I

    .line 20
    .line 21
    iput v0, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->d:I

    .line 22
    .line 23
    iput p1, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->e:I

    .line 24
    .line 25
    const/high16 p1, -0x1000000

    .line 26
    .line 27
    iput p1, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->f:I

    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public final a()Landroid/graphics/Rect;
    .locals 4

    .line 1
    iget v0, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->d:I

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->b:I

    .line 4
    .line 5
    sub-int/2addr v0, v1

    .line 6
    int-to-float v0, v0

    .line 7
    const/high16 v1, 0x40000000    # 2.0f

    .line 8
    .line 9
    div-float/2addr v0, v1

    .line 10
    iget v2, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->e:I

    .line 11
    .line 12
    iget v3, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->c:I

    .line 13
    .line 14
    sub-int/2addr v2, v3

    .line 15
    int-to-float v2, v2

    .line 16
    div-float/2addr v2, v1

    .line 17
    new-instance v1, Landroid/graphics/Rect;

    .line 18
    .line 19
    float-to-int v0, v0

    .line 20
    float-to-int v2, v2

    .line 21
    iget v3, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->b:I

    .line 22
    .line 23
    add-int/2addr v3, v0

    .line 24
    iget p0, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->c:I

    .line 25
    .line 26
    add-int/2addr p0, v2

    .line 27
    invoke-direct {v1, v0, v2, v3, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 28
    .line 29
    .line 30
    return-object v1
.end method

.method public final b()Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor$CropType;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor$CropType;->FIT_CENTER:Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor$CropType;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()Landroid/graphics/Rect;
    .locals 4

    .line 1
    iget v0, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->b:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    iget v1, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->c:I

    .line 5
    .line 6
    int-to-float v1, v1

    .line 7
    div-float/2addr v0, v1

    .line 8
    iget v1, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->d:I

    .line 9
    .line 10
    int-to-float v1, v1

    .line 11
    div-float/2addr v1, v0

    .line 12
    float-to-int v0, v1

    .line 13
    iget v1, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->e:I

    .line 14
    .line 15
    sub-int/2addr v1, v0

    .line 16
    int-to-float v1, v1

    .line 17
    const/high16 v2, 0x40000000    # 2.0f

    .line 18
    .line 19
    div-float/2addr v1, v2

    .line 20
    float-to-int v1, v1

    .line 21
    new-instance v2, Landroid/graphics/Rect;

    .line 22
    .line 23
    iget p0, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->d:I

    .line 24
    .line 25
    add-int/2addr v0, v1

    .line 26
    const/4 v3, 0x0

    .line 27
    invoke-direct {v2, v3, v1, p0, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 28
    .line 29
    .line 30
    return-object v2
.end method

.method public final d()Landroid/graphics/Rect;
    .locals 4

    .line 1
    iget v0, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->b:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    iget v1, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->c:I

    .line 5
    .line 6
    int-to-float v1, v1

    .line 7
    div-float/2addr v0, v1

    .line 8
    iget v1, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->d:I

    .line 9
    .line 10
    int-to-float v1, v1

    .line 11
    div-float/2addr v1, v0

    .line 12
    float-to-int v0, v1

    .line 13
    iget v1, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->e:I

    .line 14
    .line 15
    sub-int/2addr v1, v0

    .line 16
    new-instance v0, Landroid/graphics/Rect;

    .line 17
    .line 18
    iget v2, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->d:I

    .line 19
    .line 20
    iget p0, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->e:I

    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    invoke-direct {v0, v3, v1, v2, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 24
    .line 25
    .line 26
    return-object v0
.end method

.method public final e()Landroid/graphics/Rect;
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->b:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    iget v1, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->c:I

    .line 5
    .line 6
    int-to-float v1, v1

    .line 7
    div-float/2addr v0, v1

    .line 8
    iget v1, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->d:I

    .line 9
    .line 10
    int-to-float v1, v1

    .line 11
    div-float/2addr v1, v0

    .line 12
    float-to-int v0, v1

    .line 13
    new-instance v1, Landroid/graphics/Rect;

    .line 14
    .line 15
    iget p0, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->d:I

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-direct {v1, v2, v2, p0, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 19
    .line 20
    .line 21
    return-object v1
.end method

.method public final f()Landroid/graphics/Rect;
    .locals 6

    .line 1
    iget v0, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->b:I

    .line 2
    .line 3
    int-to-float v1, v0

    .line 4
    iget v2, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->c:I

    .line 5
    .line 6
    int-to-float v3, v2

    .line 7
    div-float/2addr v1, v3

    .line 8
    iget v3, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->e:I

    .line 9
    .line 10
    iget p0, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->d:I

    .line 11
    .line 12
    const/high16 v4, 0x40000000    # 2.0f

    .line 13
    .line 14
    const/4 v5, 0x0

    .line 15
    if-le v0, v2, :cond_1

    .line 16
    .line 17
    if-le v0, p0, :cond_0

    .line 18
    .line 19
    int-to-float v0, p0

    .line 20
    div-float/2addr v0, v1

    .line 21
    div-int/lit8 v3, v3, 0x2

    .line 22
    .line 23
    int-to-float v1, v3

    .line 24
    div-float v2, v0, v4

    .line 25
    .line 26
    sub-float/2addr v1, v2

    .line 27
    add-float/2addr v0, v1

    .line 28
    new-instance v2, Landroid/graphics/Rect;

    .line 29
    .line 30
    float-to-int v1, v1

    .line 31
    float-to-int v0, v0

    .line 32
    invoke-direct {v2, v5, v1, p0, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 33
    .line 34
    .line 35
    return-object v2

    .line 36
    :cond_0
    div-int/lit8 p0, p0, 0x2

    .line 37
    .line 38
    div-int/lit8 v1, v0, 0x2

    .line 39
    .line 40
    sub-int/2addr p0, v1

    .line 41
    div-int/lit8 v3, v3, 0x2

    .line 42
    .line 43
    div-int/lit8 v1, v2, 0x2

    .line 44
    .line 45
    sub-int/2addr v3, v1

    .line 46
    add-int/2addr v0, p0

    .line 47
    add-int/2addr v2, v3

    .line 48
    new-instance v1, Landroid/graphics/Rect;

    .line 49
    .line 50
    invoke-direct {v1, p0, v3, v0, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 51
    .line 52
    .line 53
    return-object v1

    .line 54
    :cond_1
    int-to-float v0, p0

    .line 55
    int-to-float v2, v3

    .line 56
    div-float/2addr v0, v2

    .line 57
    cmpg-float v0, v0, v1

    .line 58
    .line 59
    if-gez v0, :cond_2

    .line 60
    .line 61
    int-to-float v0, p0

    .line 62
    div-float/2addr v0, v1

    .line 63
    div-int/lit8 v3, v3, 0x2

    .line 64
    .line 65
    int-to-float v1, v3

    .line 66
    div-float v2, v0, v4

    .line 67
    .line 68
    sub-float/2addr v1, v2

    .line 69
    add-float/2addr v0, v1

    .line 70
    new-instance v2, Landroid/graphics/Rect;

    .line 71
    .line 72
    float-to-int v1, v1

    .line 73
    float-to-int v0, v0

    .line 74
    invoke-direct {v2, v5, v1, p0, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 75
    .line 76
    .line 77
    return-object v2

    .line 78
    :cond_2
    int-to-float v0, v3

    .line 79
    mul-float/2addr v1, v0

    .line 80
    div-int/lit8 p0, p0, 0x2

    .line 81
    .line 82
    int-to-float p0, p0

    .line 83
    div-float v0, v1, v4

    .line 84
    .line 85
    sub-float/2addr p0, v0

    .line 86
    add-float/2addr v1, p0

    .line 87
    new-instance v0, Landroid/graphics/Rect;

    .line 88
    .line 89
    float-to-int p0, p0

    .line 90
    float-to-int v1, v1

    .line 91
    invoke-direct {v0, p0, v5, v1, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 92
    .line 93
    .line 94
    return-object v0
.end method

.method public final g()Landroid/graphics/Rect;
    .locals 4

    .line 1
    iget v0, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->b:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    iget v1, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->c:I

    .line 5
    .line 6
    int-to-float v1, v1

    .line 7
    div-float/2addr v0, v1

    .line 8
    iget v1, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->e:I

    .line 9
    .line 10
    int-to-float v1, v1

    .line 11
    mul-float/2addr v1, v0

    .line 12
    float-to-int v0, v1

    .line 13
    iget v1, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->d:I

    .line 14
    .line 15
    sub-int/2addr v1, v0

    .line 16
    new-instance v0, Landroid/graphics/Rect;

    .line 17
    .line 18
    iget v2, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->d:I

    .line 19
    .line 20
    iget p0, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->e:I

    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    invoke-direct {v0, v1, v3, v2, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 24
    .line 25
    .line 26
    return-object v0
.end method

.method public final h()Landroid/graphics/Rect;
    .locals 5

    .line 1
    iget v0, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->b:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    iget v1, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->c:I

    .line 5
    .line 6
    int-to-float v1, v1

    .line 7
    div-float/2addr v0, v1

    .line 8
    iget v1, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->e:I

    .line 9
    .line 10
    int-to-float v2, v1

    .line 11
    mul-float/2addr v2, v0

    .line 12
    iget v3, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->d:I

    .line 13
    .line 14
    int-to-float v4, v3

    .line 15
    cmpl-float v2, v2, v4

    .line 16
    .line 17
    if-lez v2, :cond_0

    .line 18
    .line 19
    move v0, v3

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    int-to-float v1, v1

    .line 22
    mul-float/2addr v1, v0

    .line 23
    float-to-int v0, v1

    .line 24
    :goto_0
    sub-int/2addr v3, v0

    .line 25
    div-int/lit8 v3, v3, 0x2

    .line 26
    .line 27
    add-int/2addr v0, v3

    .line 28
    new-instance v1, Landroid/graphics/Rect;

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    iget p0, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->e:I

    .line 32
    .line 33
    invoke-direct {v1, v3, v2, v0, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 34
    .line 35
    .line 36
    return-object v1
.end method

.method public final i()Landroid/graphics/Rect;
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->b:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    iget v1, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->c:I

    .line 5
    .line 6
    int-to-float v1, v1

    .line 7
    div-float/2addr v0, v1

    .line 8
    iget v1, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->e:I

    .line 9
    .line 10
    int-to-float v1, v1

    .line 11
    mul-float/2addr v1, v0

    .line 12
    float-to-int v0, v1

    .line 13
    new-instance v1, Landroid/graphics/Rect;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    iget p0, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->e:I

    .line 17
    .line 18
    invoke-direct {v1, v2, v2, v0, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 19
    .line 20
    .line 21
    return-object v1
.end method

.method public final j()Landroid/graphics/Rect;
    .locals 5

    .line 1
    iget v0, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->b:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    iget v1, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->c:I

    .line 5
    .line 6
    int-to-float v1, v1

    .line 7
    div-float/2addr v0, v1

    .line 8
    iget v1, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->d:I

    .line 9
    .line 10
    int-to-float v2, v1

    .line 11
    div-float/2addr v2, v0

    .line 12
    iget v3, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->e:I

    .line 13
    .line 14
    int-to-float v4, v3

    .line 15
    cmpl-float v2, v2, v4

    .line 16
    .line 17
    if-lez v2, :cond_0

    .line 18
    .line 19
    move v0, v3

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    int-to-float v1, v1

    .line 22
    div-float/2addr v1, v0

    .line 23
    float-to-int v0, v1

    .line 24
    :goto_0
    sub-int/2addr v3, v0

    .line 25
    div-int/lit8 v3, v3, 0x2

    .line 26
    .line 27
    add-int/2addr v0, v3

    .line 28
    new-instance v1, Landroid/graphics/Rect;

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    iget p0, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->d:I

    .line 32
    .line 33
    invoke-direct {v1, v2, v3, p0, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 34
    .line 35
    .line 36
    return-object v1
.end method

.method public final k()Landroid/graphics/Bitmap;
    .locals 10
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget v0, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->d:I

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->e:I

    .line 4
    .line 5
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 6
    .line 7
    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    new-instance v1, Landroid/graphics/Canvas;

    .line 15
    .line 16
    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->b()Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor$CropType;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    sget-object v3, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor$b;->a:[I

    .line 24
    .line 25
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    aget v3, v3, v4

    .line 30
    .line 31
    const/4 v4, 0x0

    .line 32
    packed-switch v3, :pswitch_data_0

    .line 33
    .line 34
    .line 35
    invoke-static {}, Ll/nbr;->a()V

    .line 36
    .line 37
    .line 38
    return-object v4

    .line 39
    :pswitch_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->a()Landroid/graphics/Rect;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 44
    .line 45
    invoke-static {v3, v5}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    goto :goto_0

    .line 50
    :pswitch_1
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->d()Landroid/graphics/Rect;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 55
    .line 56
    invoke-static {v3, v5}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    goto :goto_0

    .line 61
    :pswitch_2
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->e()Landroid/graphics/Rect;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 66
    .line 67
    invoke-static {v3, v5}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    goto :goto_0

    .line 72
    :pswitch_3
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->c()Landroid/graphics/Rect;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 77
    .line 78
    invoke-static {v3, v5}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    goto :goto_0

    .line 83
    :pswitch_4
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->h()Landroid/graphics/Rect;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 88
    .line 89
    invoke-static {v3, v5}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    goto :goto_0

    .line 94
    :pswitch_5
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->j()Landroid/graphics/Rect;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 99
    .line 100
    invoke-static {v3, v5}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    goto :goto_0

    .line 105
    :pswitch_6
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->g()Landroid/graphics/Rect;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 110
    .line 111
    invoke-static {v3, v5}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    goto :goto_0

    .line 116
    :pswitch_7
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->i()Landroid/graphics/Rect;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 121
    .line 122
    invoke-static {v3, v5}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    goto :goto_0

    .line 127
    :pswitch_8
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->f()Landroid/graphics/Rect;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 132
    .line 133
    invoke-static {v3, v5}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    :goto_0
    invoke-virtual {v3}, Lkotlin/Pair;->component1()Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v5

    .line 141
    check-cast v5, Landroid/graphics/Rect;

    .line 142
    .line 143
    invoke-virtual {v3}, Lkotlin/Pair;->component2()Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    check-cast v3, Ljava/lang/Boolean;

    .line 148
    .line 149
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 150
    .line 151
    .line 152
    move-result v3

    .line 153
    iget-object v6, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->a:Landroid/graphics/Bitmap;

    .line 154
    .line 155
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getWidth()I

    .line 156
    .line 157
    .line 158
    move-result v6

    .line 159
    iget-object v7, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->a:Landroid/graphics/Bitmap;

    .line 160
    .line 161
    invoke-virtual {v7}, Landroid/graphics/Bitmap;->getHeight()I

    .line 162
    .line 163
    .line 164
    move-result v7

    .line 165
    new-instance v8, Ljava/lang/StringBuilder;

    .line 166
    .line 167
    const-string v9, "[proceedSync] cropType: "

    .line 168
    .line 169
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    const-string v2, ", dstRect: "

    .line 176
    .line 177
    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    const-string v2, ", fill: "

    .line 184
    .line 185
    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    const-string v2, ", source: "

    .line 192
    .line 193
    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    const-string v2, ":"

    .line 200
    .line 201
    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v2

    .line 211
    invoke-static {v2}, Ll/bok0;->c(Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    if-nez v3, :cond_0

    .line 215
    .line 216
    iget v2, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->f:I

    .line 217
    .line 218
    invoke-virtual {v1, v2}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 219
    .line 220
    .line 221
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->a:Landroid/graphics/Bitmap;

    .line 222
    .line 223
    invoke-virtual {v1, p0, v4, v5, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 224
    .line 225
    .line 226
    return-object v0

    .line 227
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final l(III)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->d:I

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->e:I

    .line 4
    .line 5
    iput p3, p0, Lcom/p1/mobile/android/media/gltransition/utils/BitmapProcessor;->f:I

    .line 6
    .line 7
    return-void
.end method
