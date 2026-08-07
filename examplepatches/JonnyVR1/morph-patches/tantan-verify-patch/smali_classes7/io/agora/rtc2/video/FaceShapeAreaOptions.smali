.class public Lio/agora/rtc2/video/FaceShapeAreaOptions;
.super Ljava/lang/Object;


# static fields
.field public static final FACE_SHAPE_AREA_CHEEK:I = 0x6

.field public static final FACE_SHAPE_AREA_CHEEKBONE:I = 0x5

.field public static final FACE_SHAPE_AREA_CHIN:I = 0x7

.field public static final FACE_SHAPE_AREA_EYESCALE:I = 0x8

.field public static final FACE_SHAPE_AREA_FACECONTOUR:I = 0x2

.field public static final FACE_SHAPE_AREA_FACELENGTH:I = 0x3

.field public static final FACE_SHAPE_AREA_FACEWIDTH:I = 0x4

.field public static final FACE_SHAPE_AREA_FOREHEAD:I = 0x1

.field public static final FACE_SHAPE_AREA_HEADSCALE:I = 0x0

.field public static final FACE_SHAPE_AREA_MOUTHSCALE:I = 0xb

.field public static final FACE_SHAPE_AREA_NONE:I = -0x1

.field public static final FACE_SHAPE_AREA_NOSELENGTH:I = 0x9

.field public static final FACE_SHAPE_AREA_NOSEWIDTH:I = 0xa


# instance fields
.field public shapeArea:I

.field public shapeIntensity:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lio/agora/rtc2/video/FaceShapeAreaOptions;->shapeArea:I

    const/4 v0, 0x0

    iput v0, p0, Lio/agora/rtc2/video/FaceShapeAreaOptions;->shapeIntensity:I

    return-void
.end method

.method public constructor <init>(II)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lio/agora/rtc2/video/FaceShapeAreaOptions;->shapeArea:I

    iput p2, p0, Lio/agora/rtc2/video/FaceShapeAreaOptions;->shapeIntensity:I

    return-void
.end method
