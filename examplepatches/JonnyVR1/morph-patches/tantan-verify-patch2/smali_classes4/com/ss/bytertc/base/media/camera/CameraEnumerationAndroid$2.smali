.class Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$2;
.super Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$ClosestComparator;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid;->getClosestSupportedSize(Ljava/util/List;II)Lcom/ss/bytertc/base/media/Size;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$ClosestComparator<",
        "Lcom/ss/bytertc/base/media/Size;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$requestedHeight:I

.field final synthetic val$requestedWidth:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$2;->val$requestedWidth:I

    .line 2
    .line 3
    iput p2, p0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$2;->val$requestedHeight:I

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-direct {p0, p1}, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$ClosestComparator;-><init>(Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$1;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public diff(Lcom/ss/bytertc/base/media/Size;)I
    .locals 2

    .line 1
    iget v0, p0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$2;->val$requestedWidth:I

    .line 2
    .line 3
    iget v1, p1, Lcom/ss/bytertc/base/media/Size;->width:I

    .line 4
    .line 5
    sub-int/2addr v0, v1

    .line 6
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget p0, p0, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$2;->val$requestedHeight:I

    .line 11
    .line 12
    iget p1, p1, Lcom/ss/bytertc/base/media/Size;->height:I

    .line 13
    .line 14
    sub-int/2addr p0, p1

    .line 15
    invoke-static {p0}, Ljava/lang/Math;->abs(I)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    add-int/2addr v0, p0

    .line 20
    return v0
.end method

.method public bridge synthetic diff(Ljava/lang/Object;)I
    .locals 0

    .line 21
    check-cast p1, Lcom/ss/bytertc/base/media/Size;

    invoke-virtual {p0, p1}, Lcom/ss/bytertc/base/media/camera/CameraEnumerationAndroid$2;->diff(Lcom/ss/bytertc/base/media/Size;)I

    move-result p0

    return p0
.end method
