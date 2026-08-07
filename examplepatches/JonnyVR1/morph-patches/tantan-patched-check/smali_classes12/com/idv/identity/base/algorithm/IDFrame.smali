.class public Lcom/idv/identity/base/algorithm/IDFrame;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final MODE_BGR:I = 0x2

.field public static final MODE_BGRA:I = 0x1

.field public static final MODE_DEPTH:I = 0x7

.field public static final MODE_GRAY_16:I = 0x6

.field public static final MODE_GRAY_8:I = 0x5

.field public static final MODE_IRIS:I = 0x6

.field public static final MODE_NV21:I = 0x0

.field public static final MODE_RGB:I = 0x4

.field public static final MODE_RGBA:I = 0x3

.field public static final TYPE_BLINK:I = 0x7

.field public static final TYPE_FAR:I = 0x2

.field public static final TYPE_LEFT:I = 0x5

.field public static final TYPE_LIGHT:I = 0x0

.field public static final TYPE_MOUTH:I = 0x4

.field public static final TYPE_NEAR:I = 0x3

.field public static final TYPE_QUALITY_FACE:I = 0x1

.field public static final TYPE_RIGHT:I = 0x6


# instance fields
.field public data:[B

.field public frameMode:I

.field public frameType:I

.field public height:I

.field public rHeight:I

.field public rWidth:I

.field public rgba:[B

.field public rotateData:[B

.field public rotation:I

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/idv/identity/base/algorithm/IDFrame;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_1

    .line 5
    .line 6
    iget-object v0, p1, Lcom/idv/identity/base/algorithm/IDFrame;->rgba:[B

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, [B->clone()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, [B

    .line 15
    .line 16
    iput-object v0, p0, Lcom/idv/identity/base/algorithm/IDFrame;->rgba:[B

    .line 17
    .line 18
    :cond_0
    iget v0, p1, Lcom/idv/identity/base/algorithm/IDFrame;->width:I

    .line 19
    .line 20
    iput v0, p0, Lcom/idv/identity/base/algorithm/IDFrame;->width:I

    .line 21
    .line 22
    iget v0, p1, Lcom/idv/identity/base/algorithm/IDFrame;->height:I

    .line 23
    .line 24
    iput v0, p0, Lcom/idv/identity/base/algorithm/IDFrame;->height:I

    .line 25
    .line 26
    iget v0, p1, Lcom/idv/identity/base/algorithm/IDFrame;->rotation:I

    .line 27
    .line 28
    iput v0, p0, Lcom/idv/identity/base/algorithm/IDFrame;->rotation:I

    .line 29
    .line 30
    iget v0, p1, Lcom/idv/identity/base/algorithm/IDFrame;->frameMode:I

    .line 31
    .line 32
    iput v0, p0, Lcom/idv/identity/base/algorithm/IDFrame;->frameMode:I

    .line 33
    .line 34
    iget p1, p1, Lcom/idv/identity/base/algorithm/IDFrame;->frameType:I

    .line 35
    .line 36
    iput p1, p0, Lcom/idv/identity/base/algorithm/IDFrame;->frameType:I

    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public constructor <init>([BIIIII)V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lcom/idv/identity/base/algorithm/IDFrame;->data:[B

    .line 41
    iput p2, p0, Lcom/idv/identity/base/algorithm/IDFrame;->width:I

    .line 42
    iput p3, p0, Lcom/idv/identity/base/algorithm/IDFrame;->height:I

    .line 43
    iput p4, p0, Lcom/idv/identity/base/algorithm/IDFrame;->rotation:I

    .line 44
    iput p5, p0, Lcom/idv/identity/base/algorithm/IDFrame;->frameMode:I

    .line 45
    iput p6, p0, Lcom/idv/identity/base/algorithm/IDFrame;->frameType:I

    return-void
.end method


# virtual methods
.method public recycle()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/idv/identity/base/algorithm/IDFrame;->rgba:[B

    .line 3
    .line 4
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "TGFrame{data=***, width="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/idv/identity/base/algorithm/IDFrame;->width:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", height="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/idv/identity/base/algorithm/IDFrame;->height:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", rotation="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/idv/identity/base/algorithm/IDFrame;->rotation:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", frameMode="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/idv/identity/base/algorithm/IDFrame;->frameMode:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", frameType="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget p0, p0, Lcom/idv/identity/base/algorithm/IDFrame;->frameType:I

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const/16 p0, 0x7d

    .line 54
    .line 55
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method
