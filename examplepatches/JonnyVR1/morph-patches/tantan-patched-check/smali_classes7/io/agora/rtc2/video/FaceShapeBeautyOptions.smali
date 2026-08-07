.class public Lio/agora/rtc2/video/FaceShapeBeautyOptions;
.super Ljava/lang/Object;


# static fields
.field public static final FACE_SHAPE_BEAUTY_STYLE_FEMALE:I = 0x0

.field public static final FACE_SHAPE_BEAUTY_STYLE_MALE:I = 0x1


# instance fields
.field public shapeStyle:I

.field public styleIntensity:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lio/agora/rtc2/video/FaceShapeBeautyOptions;->shapeStyle:I

    const/16 v0, 0x32

    iput v0, p0, Lio/agora/rtc2/video/FaceShapeBeautyOptions;->styleIntensity:I

    return-void
.end method

.method public constructor <init>(II)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lio/agora/rtc2/video/FaceShapeBeautyOptions;->shapeStyle:I

    iput p2, p0, Lio/agora/rtc2/video/FaceShapeBeautyOptions;->styleIntensity:I

    return-void
.end method
