.class Ltv/danmaku/ijk/media/source/CameraSource$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltv/danmaku/ijk/media/source/CameraSource;->q0(Ljava/util/List;I)Landroid/hardware/Camera$Size;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Landroid/hardware/Camera$Size;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Ltv/danmaku/ijk/media/source/CameraSource;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/source/CameraSource;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/CameraSource$2;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/hardware/Camera$Size;Landroid/hardware/Camera$Size;)I
    .locals 1

    .line 1
    iget p0, p1, Landroid/hardware/Camera$Size;->height:I

    .line 2
    .line 3
    iget v0, p2, Landroid/hardware/Camera$Size;->height:I

    .line 4
    .line 5
    if-eq p0, v0, :cond_0

    .line 6
    .line 7
    sub-int/2addr p0, v0

    .line 8
    return p0

    .line 9
    :cond_0
    iget p0, p1, Landroid/hardware/Camera$Size;->width:I

    .line 10
    .line 11
    iget p1, p2, Landroid/hardware/Camera$Size;->width:I

    .line 12
    .line 13
    sub-int/2addr p0, p1

    .line 14
    return p0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Landroid/hardware/Camera$Size;

    .line 2
    .line 3
    check-cast p2, Landroid/hardware/Camera$Size;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ltv/danmaku/ijk/media/source/CameraSource$2;->a(Landroid/hardware/Camera$Size;Landroid/hardware/Camera$Size;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
