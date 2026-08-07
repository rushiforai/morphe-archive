.class public final Ll/t1f;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000X\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0014\n\u0002\u0008\u0005\u0018\u00002\u00020\u0001B\u0011\u0012\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J!\u0010\u000b\u001a\u00020\n2\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u00062\u0008\u0010\t\u001a\u0004\u0018\u00010\u0008\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ!\u0010\u000f\u001a\u00020\n2\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u00062\u0008\u0010\u000e\u001a\u0004\u0018\u00010\r\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u001b\u0010\u0014\u001a\u00020\n2\u000c\u0010\u0013\u001a\u0008\u0018\u00010\u0011R\u00020\u0012\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u0017\u0010\u0018\u001a\u00020\n2\u0008\u0010\u0017\u001a\u0004\u0018\u00010\u0016\u00a2\u0006\u0004\u0008\u0018\u0010\u0019J\u0017\u0010\u001c\u001a\u00020\n2\u0008\u0010\u001b\u001a\u0004\u0018\u00010\u001a\u00a2\u0006\u0004\u0008\u001c\u0010\u001dR\u0016\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001c\u0010\u001eR\u0018\u0010!\u001a\u0004\u0018\u00010\u001f8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0014\u0010 R\u0014\u0010$\u001a\u00020\"8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000f\u0010#R\u0014\u0010%\u001a\u00020\"8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0018\u0010#R\u0014\u0010&\u001a\u00020\"8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000b\u0010#\u00a8\u0006\'"
    }
    d2 = {
        "Ll/t1f;",
        "",
        "Lcom/momo/xeengine/lightningrender/ILightningRender;",
        "lightningRender",
        "<init>",
        "(Lcom/momo/xeengine/lightningrender/ILightningRender;)V",
        "Ll/omw;",
        "mmcvInfo",
        "Lcom/momocv/stylizeface/StylizefaceInfo;",
        "stylizeFaceInfo",
        "",
        "e",
        "(Ll/omw;Lcom/momocv/stylizeface/StylizefaceInfo;)V",
        "Lcom/momocv/cartoonface/CartoonfaceInfo;",
        "cartoonFaceInfo",
        "c",
        "(Ll/omw;Lcom/momocv/cartoonface/CartoonfaceInfo;)V",
        "Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;",
        "Lcom/effectsar/labcv/effectsdk/PortraitMatting;",
        "mattingMask",
        "b",
        "(Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;)V",
        "Lcom/momocv/segmentation/SegmentationInfo;",
        "segmentationInfo",
        "d",
        "(Lcom/momocv/segmentation/SegmentationInfo;)V",
        "Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;",
        "bodyLandmarkPostInfo",
        "a",
        "(Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;)V",
        "Lcom/momo/xeengine/lightningrender/ILightningRender;",
        "Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;",
        "Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;",
        "xeCartoonFaceInfo",
        "",
        "[F",
        "cartoonMatrix",
        "stylizeFaceMatrix",
        "segMatrix",
        "momomediaext_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final a:Lcom/momo/xeengine/lightningrender/ILightningRender;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private b:Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final c:[F
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final d:[F
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final e:[F
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/momo/xeengine/lightningrender/ILightningRender;)V
    .locals 1
    .param p1    # Lcom/momo/xeengine/lightningrender/ILightningRender;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/t1f;->a:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 5
    .line 6
    const/16 p1, 0x9

    .line 7
    .line 8
    new-array v0, p1, [F

    .line 9
    .line 10
    fill-array-data v0, :array_0

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/t1f;->c:[F

    .line 14
    .line 15
    new-array v0, p1, [F

    .line 16
    .line 17
    fill-array-data v0, :array_1

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/t1f;->d:[F

    .line 21
    .line 22
    new-array p1, p1, [F

    .line 23
    .line 24
    fill-array-data p1, :array_2

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Ll/t1f;->e:[F

    .line 28
    .line 29
    return-void

    .line 30
    nop

    .line 31
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 32
    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    .line 52
    .line 53
    :array_1
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public final a(Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;)V
    .locals 11
    .param p1    # Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/t1f;->a:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move-object p0, v0

    .line 12
    :goto_0
    if-nez p0, :cond_1

    .line 13
    .line 14
    return-void

    .line 15
    :cond_1
    if-eqz p1, :cond_2

    .line 16
    .line 17
    iget-object v1, p1, Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;->multi_person_:[[Lcom/momocv/MMJoint;

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_2
    move-object v1, v0

    .line 21
    :goto_1
    if-eqz v1, :cond_6

    .line 22
    .line 23
    iget-object p1, p1, Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;->multi_person_:[[Lcom/momocv/MMJoint;

    .line 24
    .line 25
    new-instance v0, Ljava/util/ArrayList;

    .line 26
    .line 27
    array-length v1, p1

    .line 28
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 32
    .line 33
    .line 34
    array-length v1, p1

    .line 35
    const/4 v2, 0x0

    .line 36
    move v3, v2

    .line 37
    :goto_2
    if-ge v3, v1, :cond_5

    .line 38
    .line 39
    aget-object v4, p1, v3

    .line 40
    .line 41
    array-length v5, v4

    .line 42
    new-instance v6, Lcom/momo/xeengine/cv/bean/CVBodyInfo;

    .line 43
    .line 44
    invoke-direct {v6}, Lcom/momo/xeengine/cv/bean/CVBodyInfo;-><init>()V

    .line 45
    .line 46
    .line 47
    new-instance v7, Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-direct {v7, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 50
    .line 51
    .line 52
    iput-object v7, v6, Lcom/momo/xeengine/cv/bean/CVBodyInfo;->joints:Ljava/util/List;

    .line 53
    .line 54
    array-length v5, v4

    .line 55
    move v7, v2

    .line 56
    :goto_3
    if-ge v7, v5, :cond_4

    .line 57
    .line 58
    aget-object v8, v4, v7

    .line 59
    .line 60
    if-nez v8, :cond_3

    .line 61
    .line 62
    goto :goto_4

    .line 63
    :cond_3
    new-instance v9, Lcom/momo/xeengine/cv/bean/CVBodyInfo$Joint;

    .line 64
    .line 65
    invoke-direct {v9}, Lcom/momo/xeengine/cv/bean/CVBodyInfo$Joint;-><init>()V

    .line 66
    .line 67
    .line 68
    iget v10, v8, Lcom/momocv/MMPoint;->x_:I

    .line 69
    .line 70
    int-to-float v10, v10

    .line 71
    iput v10, v9, Lcom/momo/xeengine/cv/bean/CVBodyInfo$Joint;->x:F

    .line 72
    .line 73
    iget v10, v8, Lcom/momocv/MMPoint;->y_:I

    .line 74
    .line 75
    int-to-float v10, v10

    .line 76
    iput v10, v9, Lcom/momo/xeengine/cv/bean/CVBodyInfo$Joint;->y:F

    .line 77
    .line 78
    iget v8, v8, Lcom/momocv/MMJoint;->score_:F

    .line 79
    .line 80
    iput v8, v9, Lcom/momo/xeengine/cv/bean/CVBodyInfo$Joint;->score:F

    .line 81
    .line 82
    iget-object v8, v6, Lcom/momo/xeengine/cv/bean/CVBodyInfo;->joints:Ljava/util/List;

    .line 83
    .line 84
    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    :goto_4
    add-int/lit8 v7, v7, 0x1

    .line 88
    .line 89
    goto :goto_3

    .line 90
    :cond_4
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    add-int/lit8 v3, v3, 0x1

    .line 94
    .line 95
    goto :goto_2

    .line 96
    :cond_5
    invoke-interface {p0, v0}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchBodyInfo(Ljava/util/List;)V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_6
    invoke-interface {p0, v0}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchBodyInfo(Ljava/util/List;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public final b(Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;)V
    .locals 2
    .param p1    # Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/t1f;->a:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move-object p0, v0

    .line 12
    :goto_0
    if-nez p0, :cond_1

    .line 13
    .line 14
    return-void

    .line 15
    :cond_1
    if-eqz p1, :cond_2

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;->getBuffer()[B

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    :cond_2
    if-eqz v0, :cond_4

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;->getBuffer()[B

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    array-length v0, v0

    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    goto :goto_1

    .line 35
    :cond_3
    const/4 v0, 0x0

    .line 36
    :goto_1
    if-nez v0, :cond_4

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;->getWidth()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-lez v0, :cond_4

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;->getHeight()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-lez v0, :cond_4

    .line 49
    .line 50
    new-instance v0, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 51
    .line 52
    invoke-direct {v0}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;->getBuffer()[B

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setDatas([B)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;->getHeight()I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setHeight(I)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;->getWidth()I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setWidth(I)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;->getBuffer()[B

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    array-length p1, p1

    .line 81
    invoke-virtual {v0, p1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setLength(I)V

    .line 82
    .line 83
    .line 84
    invoke-interface {p0, v0}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchSegmentInfo(Lcom/momo/xeengine/cv/bean/CVSegmentInfo;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_4
    new-instance p1, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 89
    .line 90
    invoke-direct {p1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;-><init>()V

    .line 91
    .line 92
    .line 93
    invoke-interface {p0, p1}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchSegmentInfo(Lcom/momo/xeengine/cv/bean/CVSegmentInfo;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public final c(Ll/omw;Lcom/momocv/cartoonface/CartoonfaceInfo;)V
    .locals 6
    .param p1    # Ll/omw;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/momocv/cartoonface/CartoonfaceInfo;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/t1f;->a:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move-object v0, v1

    .line 12
    :goto_0
    if-nez v0, :cond_1

    .line 13
    .line 14
    return-void

    .line 15
    :cond_1
    if-eqz p2, :cond_2

    .line 16
    .line 17
    iget-object v2, p2, Lcom/momocv/cartoonface/CartoonfaceInfo;->mask_:[B

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_2
    move-object v2, v1

    .line 21
    :goto_1
    if-eqz v2, :cond_6

    .line 22
    .line 23
    iget-object v2, p2, Lcom/momocv/cartoonface/CartoonfaceInfo;->mask_:[B

    .line 24
    .line 25
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    array-length v2, v2

    .line 29
    const/4 v3, 0x0

    .line 30
    const/4 v4, 0x1

    .line 31
    if-nez v2, :cond_3

    .line 32
    .line 33
    move v2, v4

    .line 34
    goto :goto_2

    .line 35
    :cond_3
    move v2, v3

    .line 36
    :goto_2
    if-nez v2, :cond_6

    .line 37
    .line 38
    iget v2, p2, Lcom/momocv/cartoonface/CartoonfaceInfo;->mask_width:I

    .line 39
    .line 40
    if-lez v2, :cond_6

    .line 41
    .line 42
    iget v2, p2, Lcom/momocv/cartoonface/CartoonfaceInfo;->mask_height:I

    .line 43
    .line 44
    if-lez v2, :cond_6

    .line 45
    .line 46
    iget-object v2, p2, Lcom/momocv/cartoonface/CartoonfaceInfo;->warp_mat:[F

    .line 47
    .line 48
    if-eqz v2, :cond_6

    .line 49
    .line 50
    array-length v2, v2

    .line 51
    const/4 v5, 0x6

    .line 52
    if-lt v2, v5, :cond_6

    .line 53
    .line 54
    iget-object v1, p0, Ll/t1f;->b:Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;

    .line 55
    .line 56
    if-nez v1, :cond_4

    .line 57
    .line 58
    new-instance v1, Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;

    .line 59
    .line 60
    invoke-direct {v1}, Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;-><init>()V

    .line 61
    .line 62
    .line 63
    iput-object v1, p0, Ll/t1f;->b:Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;

    .line 64
    .line 65
    :cond_4
    iget-object v1, p0, Ll/t1f;->b:Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;

    .line 66
    .line 67
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 68
    .line 69
    .line 70
    iget-object v2, p2, Lcom/momocv/cartoonface/CartoonfaceInfo;->mask_:[B

    .line 71
    .line 72
    invoke-virtual {v1, v2}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setDatas([B)V

    .line 73
    .line 74
    .line 75
    iget-object v1, p0, Ll/t1f;->b:Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;

    .line 76
    .line 77
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 78
    .line 79
    .line 80
    iget v2, p2, Lcom/momocv/cartoonface/CartoonfaceInfo;->mask_height:I

    .line 81
    .line 82
    invoke-virtual {v1, v2}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setHeight(I)V

    .line 83
    .line 84
    .line 85
    iget-object v1, p0, Ll/t1f;->b:Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;

    .line 86
    .line 87
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 88
    .line 89
    .line 90
    iget v2, p2, Lcom/momocv/cartoonface/CartoonfaceInfo;->mask_width:I

    .line 91
    .line 92
    invoke-virtual {v1, v2}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setWidth(I)V

    .line 93
    .line 94
    .line 95
    iget-object v1, p0, Ll/t1f;->b:Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;

    .line 96
    .line 97
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 98
    .line 99
    .line 100
    iget-object v2, p2, Lcom/momocv/cartoonface/CartoonfaceInfo;->mask_:[B

    .line 101
    .line 102
    array-length v2, v2

    .line 103
    invoke-virtual {v1, v2}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setLength(I)V

    .line 104
    .line 105
    .line 106
    iget-object v1, p0, Ll/t1f;->c:[F

    .line 107
    .line 108
    iget-object p2, p2, Lcom/momocv/cartoonface/CartoonfaceInfo;->warp_mat:[F

    .line 109
    .line 110
    aget v2, p2, v3

    .line 111
    .line 112
    aput v2, v1, v3

    .line 113
    .line 114
    aget v2, p2, v4

    .line 115
    .line 116
    const/4 v3, 0x3

    .line 117
    aput v2, v1, v3

    .line 118
    .line 119
    const/4 v2, 0x2

    .line 120
    aget v2, p2, v2

    .line 121
    .line 122
    aput v2, v1, v5

    .line 123
    .line 124
    aget v2, p2, v3

    .line 125
    .line 126
    aput v2, v1, v4

    .line 127
    .line 128
    const/4 v2, 0x4

    .line 129
    aget v3, p2, v2

    .line 130
    .line 131
    aput v3, v1, v2

    .line 132
    .line 133
    const/4 v2, 0x5

    .line 134
    aget p2, p2, v2

    .line 135
    .line 136
    const/4 v2, 0x7

    .line 137
    aput p2, v1, v2

    .line 138
    .line 139
    iget-object p2, p0, Ll/t1f;->b:Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;

    .line 140
    .line 141
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 142
    .line 143
    .line 144
    iget-object v1, p0, Ll/t1f;->c:[F

    .line 145
    .line 146
    invoke-virtual {p2, v1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setWarpMat([F)V

    .line 147
    .line 148
    .line 149
    iget-object p2, p0, Ll/t1f;->b:Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;

    .line 150
    .line 151
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 152
    .line 153
    .line 154
    if-eqz p1, :cond_5

    .line 155
    .line 156
    iget-boolean v4, p1, Ll/omw;->a:Z

    .line 157
    .line 158
    :cond_5
    invoke-virtual {p2, v4}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setFlipShowX(Z)V

    .line 159
    .line 160
    .line 161
    iget-object p0, p0, Ll/t1f;->b:Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;

    .line 162
    .line 163
    invoke-interface {v0, p0}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchCartoonFaceInfo(Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;)V

    .line 164
    .line 165
    .line 166
    return-void

    .line 167
    :cond_6
    invoke-interface {v0, v1}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchCartoonFaceInfo(Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;)V

    .line 168
    .line 169
    .line 170
    return-void
.end method

.method public final d(Lcom/momocv/segmentation/SegmentationInfo;)V
    .locals 6
    .param p1    # Lcom/momocv/segmentation/SegmentationInfo;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/t1f;->a:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move-object v0, v1

    .line 12
    :goto_0
    if-nez v0, :cond_1

    .line 13
    .line 14
    return-void

    .line 15
    :cond_1
    if-eqz p1, :cond_2

    .line 16
    .line 17
    iget-object v1, p1, Lcom/momocv/segmentation/SegmentationInfo;->mask_:[B

    .line 18
    .line 19
    :cond_2
    if-eqz v1, :cond_4

    .line 20
    .line 21
    iget-object v1, p1, Lcom/momocv/segmentation/SegmentationInfo;->mask_:[B

    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    array-length v1, v1

    .line 27
    const/4 v2, 0x0

    .line 28
    const/4 v3, 0x1

    .line 29
    if-nez v1, :cond_3

    .line 30
    .line 31
    move v1, v3

    .line 32
    goto :goto_1

    .line 33
    :cond_3
    move v1, v2

    .line 34
    :goto_1
    if-nez v1, :cond_4

    .line 35
    .line 36
    iget v1, p1, Lcom/momocv/segmentation/SegmentationInfo;->mask_width:I

    .line 37
    .line 38
    if-lez v1, :cond_4

    .line 39
    .line 40
    iget v1, p1, Lcom/momocv/segmentation/SegmentationInfo;->mask_height:I

    .line 41
    .line 42
    if-lez v1, :cond_4

    .line 43
    .line 44
    new-instance v1, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 45
    .line 46
    invoke-direct {v1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;-><init>()V

    .line 47
    .line 48
    .line 49
    iget-object v4, p1, Lcom/momocv/segmentation/SegmentationInfo;->mask_:[B

    .line 50
    .line 51
    invoke-virtual {v1, v4}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setDatas([B)V

    .line 52
    .line 53
    .line 54
    iget v4, p1, Lcom/momocv/segmentation/SegmentationInfo;->mask_height:I

    .line 55
    .line 56
    invoke-virtual {v1, v4}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setHeight(I)V

    .line 57
    .line 58
    .line 59
    iget v4, p1, Lcom/momocv/segmentation/SegmentationInfo;->mask_width:I

    .line 60
    .line 61
    invoke-virtual {v1, v4}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setWidth(I)V

    .line 62
    .line 63
    .line 64
    iget-object v4, p1, Lcom/momocv/segmentation/SegmentationInfo;->mask_:[B

    .line 65
    .line 66
    array-length v4, v4

    .line 67
    invoke-virtual {v1, v4}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setLength(I)V

    .line 68
    .line 69
    .line 70
    iget-object p0, p0, Ll/t1f;->e:[F

    .line 71
    .line 72
    iget-object p1, p1, Lcom/momocv/segmentation/SegmentationInfo;->warp_mat:[F

    .line 73
    .line 74
    aget v4, p1, v2

    .line 75
    .line 76
    aput v4, p0, v2

    .line 77
    .line 78
    aget v2, p1, v3

    .line 79
    .line 80
    const/4 v4, 0x3

    .line 81
    aput v2, p0, v4

    .line 82
    .line 83
    const/4 v2, 0x2

    .line 84
    aget v2, p1, v2

    .line 85
    .line 86
    const/4 v5, 0x6

    .line 87
    aput v2, p0, v5

    .line 88
    .line 89
    aget v2, p1, v4

    .line 90
    .line 91
    aput v2, p0, v3

    .line 92
    .line 93
    const/4 v2, 0x4

    .line 94
    aget v3, p1, v2

    .line 95
    .line 96
    aput v3, p0, v2

    .line 97
    .line 98
    const/4 v2, 0x5

    .line 99
    aget p1, p1, v2

    .line 100
    .line 101
    const/4 v2, 0x7

    .line 102
    aput p1, p0, v2

    .line 103
    .line 104
    invoke-virtual {v1, p0}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setWarpMat([F)V

    .line 105
    .line 106
    .line 107
    invoke-interface {v0, v1}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchSegmentInfo(Lcom/momo/xeengine/cv/bean/CVSegmentInfo;)V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_4
    new-instance p0, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 112
    .line 113
    invoke-direct {p0}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-interface {v0, p0}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchSegmentInfo(Lcom/momo/xeengine/cv/bean/CVSegmentInfo;)V

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public final e(Ll/omw;Lcom/momocv/stylizeface/StylizefaceInfo;)V
    .locals 13
    .param p1    # Ll/omw;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/momocv/stylizeface/StylizefaceInfo;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/t1f;->a:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move-object v0, v1

    .line 12
    :goto_0
    if-nez v0, :cond_1

    .line 13
    .line 14
    return-void

    .line 15
    :cond_1
    if-eqz p2, :cond_7

    .line 16
    .line 17
    iget v2, p2, Lcom/momocv/stylizeface/StylizefaceInfo;->mask_width:I

    .line 18
    .line 19
    if-nez v2, :cond_2

    .line 20
    .line 21
    iget v2, p2, Lcom/momocv/stylizeface/StylizefaceInfo;->mask_height:I

    .line 22
    .line 23
    if-nez v2, :cond_2

    .line 24
    .line 25
    goto/16 :goto_4

    .line 26
    .line 27
    :cond_2
    iget-object v2, p2, Lcom/momocv/stylizeface/StylizefaceInfo;->mask_all:[[B

    .line 28
    .line 29
    if-eqz v2, :cond_6

    .line 30
    .line 31
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 32
    .line 33
    .line 34
    array-length v2, v2

    .line 35
    const/4 v3, 0x0

    .line 36
    const/4 v4, 0x1

    .line 37
    if-nez v2, :cond_3

    .line 38
    .line 39
    move v2, v4

    .line 40
    goto :goto_1

    .line 41
    :cond_3
    move v2, v3

    .line 42
    :goto_1
    if-nez v2, :cond_6

    .line 43
    .line 44
    new-instance v1, Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 47
    .line 48
    .line 49
    iget-object v2, p2, Lcom/momocv/stylizeface/StylizefaceInfo;->mask_all:[[B

    .line 50
    .line 51
    array-length v2, v2

    .line 52
    move v5, v3

    .line 53
    :goto_2
    if-ge v5, v2, :cond_5

    .line 54
    .line 55
    iget-object v6, p2, Lcom/momocv/stylizeface/StylizefaceInfo;->mask_all:[[B

    .line 56
    .line 57
    aget-object v6, v6, v5

    .line 58
    .line 59
    new-instance v7, Lcom/momo/xeengine/cv/bean/XEMutableInfo;

    .line 60
    .line 61
    const-string v8, "stylizeface"

    .line 62
    .line 63
    invoke-direct {v7, v8}, Lcom/momo/xeengine/cv/bean/XEMutableInfo;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    new-instance v8, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 67
    .line 68
    invoke-direct {v8}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v8, v6}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setDatas([B)V

    .line 72
    .line 73
    .line 74
    iget v6, p2, Lcom/momocv/stylizeface/StylizefaceInfo;->mask_height:I

    .line 75
    .line 76
    invoke-virtual {v8, v6}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setHeight(I)V

    .line 77
    .line 78
    .line 79
    iget v6, p2, Lcom/momocv/stylizeface/StylizefaceInfo;->mask_width:I

    .line 80
    .line 81
    invoke-virtual {v8, v6}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setWidth(I)V

    .line 82
    .line 83
    .line 84
    iget-object v6, p2, Lcom/momocv/stylizeface/StylizefaceInfo;->mask_all:[[B

    .line 85
    .line 86
    aget-object v6, v6, v5

    .line 87
    .line 88
    array-length v6, v6

    .line 89
    invoke-virtual {v8, v6}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setLength(I)V

    .line 90
    .line 91
    .line 92
    iget-object v6, p0, Ll/t1f;->d:[F

    .line 93
    .line 94
    iget-object v9, p2, Lcom/momocv/stylizeface/StylizefaceInfo;->warp_mat_all:[[F

    .line 95
    .line 96
    aget-object v9, v9, v5

    .line 97
    .line 98
    aget v10, v9, v3

    .line 99
    .line 100
    aput v10, v6, v3

    .line 101
    .line 102
    aget v10, v9, v4

    .line 103
    .line 104
    const/4 v11, 0x3

    .line 105
    aput v10, v6, v11

    .line 106
    .line 107
    const/4 v10, 0x2

    .line 108
    aget v10, v9, v10

    .line 109
    .line 110
    const/4 v12, 0x6

    .line 111
    aput v10, v6, v12

    .line 112
    .line 113
    aget v10, v9, v11

    .line 114
    .line 115
    aput v10, v6, v4

    .line 116
    .line 117
    const/4 v10, 0x4

    .line 118
    aget v11, v9, v10

    .line 119
    .line 120
    aput v11, v6, v10

    .line 121
    .line 122
    const/4 v10, 0x5

    .line 123
    aget v9, v9, v10

    .line 124
    .line 125
    const/4 v10, 0x7

    .line 126
    aput v9, v6, v10

    .line 127
    .line 128
    invoke-virtual {v8, v6}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setWarpMat([F)V

    .line 129
    .line 130
    .line 131
    if-eqz p1, :cond_4

    .line 132
    .line 133
    iget-boolean v6, p1, Ll/omw;->a:Z

    .line 134
    .line 135
    goto :goto_3

    .line 136
    :cond_4
    move v6, v4

    .line 137
    :goto_3
    invoke-virtual {v8, v6}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setFlipShowX(Z)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v7, v8}, Lcom/momo/xeengine/cv/bean/XEMutableInfo;->setMaskInfo1(Lcom/momo/xeengine/cv/bean/CVSegmentInfo;)V

    .line 141
    .line 142
    .line 143
    invoke-interface {v1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    add-int/lit8 v5, v5, 0x1

    .line 147
    .line 148
    goto :goto_2

    .line 149
    :cond_5
    invoke-interface {v0, v1}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchMutableInfo(Ljava/util/List;)V

    .line 150
    .line 151
    .line 152
    return-void

    .line 153
    :cond_6
    invoke-interface {v0, v1}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchMutableInfo(Ljava/util/List;)V

    .line 154
    .line 155
    .line 156
    return-void

    .line 157
    :cond_7
    :goto_4
    invoke-interface {v0, v1}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchMutableInfo(Ljava/util/List;)V

    .line 158
    .line 159
    .line 160
    return-void
.end method
