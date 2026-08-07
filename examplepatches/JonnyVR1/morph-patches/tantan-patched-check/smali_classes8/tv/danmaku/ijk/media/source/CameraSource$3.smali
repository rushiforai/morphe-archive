.class Ltv/danmaku/ijk/media/source/CameraSource$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltv/danmaku/ijk/media/source/CameraSource;->w0(Landroid/hardware/Camera$Parameters;I)[I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "[I>;"
    }
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Ltv/danmaku/ijk/media/source/CameraSource;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/source/CameraSource;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/CameraSource$3;->b:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 2
    .line 3
    iput p2, p0, Ltv/danmaku/ijk/media/source/CameraSource$3;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a([I[I)I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v1, p1, v0

    .line 3
    .line 4
    iget v2, p0, Ltv/danmaku/ijk/media/source/CameraSource$3;->a:I

    .line 5
    .line 6
    sub-int/2addr v1, v2

    .line 7
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x1

    .line 12
    aget p1, p1, v2

    .line 13
    .line 14
    iget v3, p0, Ltv/danmaku/ijk/media/source/CameraSource$3;->a:I

    .line 15
    .line 16
    sub-int/2addr p1, v3

    .line 17
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    add-int/2addr v1, p1

    .line 22
    aget p1, p2, v0

    .line 23
    .line 24
    iget v3, p0, Ltv/danmaku/ijk/media/source/CameraSource$3;->a:I

    .line 25
    .line 26
    sub-int/2addr p1, v3

    .line 27
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    aget p2, p2, v2

    .line 32
    .line 33
    iget p0, p0, Ltv/danmaku/ijk/media/source/CameraSource$3;->a:I

    .line 34
    .line 35
    sub-int/2addr p2, p0

    .line 36
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    add-int/2addr p1, p0

    .line 41
    if-le v1, p1, :cond_0

    .line 42
    .line 43
    return v2

    .line 44
    :cond_0
    if-ge v1, p1, :cond_1

    .line 45
    .line 46
    const/4 p0, -0x1

    .line 47
    return p0

    .line 48
    :cond_1
    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, [I

    .line 2
    .line 3
    check-cast p2, [I

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ltv/danmaku/ijk/media/source/CameraSource$3;->a([I[I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
