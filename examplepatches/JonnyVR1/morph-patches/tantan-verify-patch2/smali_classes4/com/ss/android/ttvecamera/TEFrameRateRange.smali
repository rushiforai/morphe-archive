.class public Lcom/ss/android/ttvecamera/TEFrameRateRange;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/ss/android/ttvecamera/TEFrameRateRange;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public fpsUnitFactor:I

.field public max:I

.field public min:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/ss/android/ttvecamera/TEFrameRateRange$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/ss/android/ttvecamera/TEFrameRateRange$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/ss/android/ttvecamera/TEFrameRateRange;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 27
    iput v0, p0, Lcom/ss/android/ttvecamera/TEFrameRateRange;->fpsUnitFactor:I

    .line 28
    iput p1, p0, Lcom/ss/android/ttvecamera/TEFrameRateRange;->min:I

    .line 29
    iput p2, p0, Lcom/ss/android/ttvecamera/TEFrameRateRange;->max:I

    const/16 p1, 0x3e8

    if-le p2, p1, :cond_0

    move v0, p1

    .line 30
    :cond_0
    iput v0, p0, Lcom/ss/android/ttvecamera/TEFrameRateRange;->fpsUnitFactor:I

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lcom/ss/android/ttvecamera/TEFrameRateRange;->fpsUnitFactor:I

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Lcom/ss/android/ttvecamera/TEFrameRateRange;->min:I

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iput v0, p0, Lcom/ss/android/ttvecamera/TEFrameRateRange;->max:I

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    iput p1, p0, Lcom/ss/android/ttvecamera/TEFrameRateRange;->fpsUnitFactor:I

    .line 24
    .line 25
    return-void
.end method

.method public static a(Ljava/util/List;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "[I>;)I"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-gtz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, [I

    .line 15
    .line 16
    aget p0, p0, v1

    .line 17
    .line 18
    const/16 v0, 0x3e8

    .line 19
    .line 20
    if-le p0, v0, :cond_1

    .line 21
    .line 22
    return v0

    .line 23
    :cond_1
    return v1
.end method


# virtual methods
.method public b()[I
    .locals 2

    .line 1
    iget v0, p0, Lcom/ss/android/ttvecamera/TEFrameRateRange;->min:I

    .line 2
    .line 3
    iget v1, p0, Lcom/ss/android/ttvecamera/TEFrameRateRange;->fpsUnitFactor:I

    .line 4
    .line 5
    div-int/2addr v0, v1

    .line 6
    iget p0, p0, Lcom/ss/android/ttvecamera/TEFrameRateRange;->max:I

    .line 7
    .line 8
    div-int/2addr p0, v1

    .line 9
    filled-new-array {v0, p0}, [I

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public c(I)[I
    .locals 2

    .line 1
    iget v0, p0, Lcom/ss/android/ttvecamera/TEFrameRateRange;->min:I

    .line 2
    .line 3
    iget v1, p0, Lcom/ss/android/ttvecamera/TEFrameRateRange;->fpsUnitFactor:I

    .line 4
    .line 5
    div-int/2addr v0, v1

    .line 6
    mul-int/2addr v0, p1

    .line 7
    iget p0, p0, Lcom/ss/android/ttvecamera/TEFrameRateRange;->max:I

    .line 8
    .line 9
    div-int/2addr p0, v1

    .line 10
    mul-int/2addr p0, p1

    .line 11
    filled-new-array {v0, p0}, [I

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p1, Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    check-cast p1, Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 8
    .line 9
    iget v0, p0, Lcom/ss/android/ttvecamera/TEFrameRateRange;->min:I

    .line 10
    .line 11
    iget v2, p1, Lcom/ss/android/ttvecamera/TEFrameRateRange;->min:I

    .line 12
    .line 13
    if-ne v0, v2, :cond_1

    .line 14
    .line 15
    iget p0, p0, Lcom/ss/android/ttvecamera/TEFrameRateRange;->max:I

    .line 16
    .line 17
    iget p1, p1, Lcom/ss/android/ttvecamera/TEFrameRateRange;->max:I

    .line 18
    .line 19
    if-ne p0, p1, :cond_1

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_1
    return v1
.end method

.method public hashCode()I
    .locals 2

    .line 1
    const v0, 0x10001

    .line 2
    .line 3
    .line 4
    iget v1, p0, Lcom/ss/android/ttvecamera/TEFrameRateRange;->min:I

    .line 5
    .line 6
    mul-int/2addr v1, v0

    .line 7
    add-int/lit8 v1, v1, 0x1

    .line 8
    .line 9
    iget p0, p0, Lcom/ss/android/ttvecamera/TEFrameRateRange;->max:I

    .line 10
    .line 11
    add-int/2addr v1, p0

    .line 12
    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/ss/android/ttvecamera/TEFrameRateRange;->min:I

    .line 9
    .line 10
    iget v2, p0, Lcom/ss/android/ttvecamera/TEFrameRateRange;->fpsUnitFactor:I

    .line 11
    .line 12
    div-int/2addr v1, v2

    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ", "

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget v1, p0, Lcom/ss/android/ttvecamera/TEFrameRateRange;->max:I

    .line 22
    .line 23
    iget p0, p0, Lcom/ss/android/ttvecamera/TEFrameRateRange;->fpsUnitFactor:I

    .line 24
    .line 25
    div-int/2addr v1, p0

    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string p0, "]"

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 1
    iget p2, p0, Lcom/ss/android/ttvecamera/TEFrameRateRange;->min:I

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 4
    .line 5
    .line 6
    iget p2, p0, Lcom/ss/android/ttvecamera/TEFrameRateRange;->max:I

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 9
    .line 10
    .line 11
    iget p0, p0, Lcom/ss/android/ttvecamera/TEFrameRateRange;->fpsUnitFactor:I

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
