.class public final enum Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/video/CameraCapturerConfiguration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "CAMERA_FOCAL_LENGTH_TYPE"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;

.field public static final enum CAMERA_FOCAL_LENGTH_DEFAULT:Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;

.field public static final enum CAMERA_FOCAL_LENGTH_TELEPHOTO:Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;

.field public static final enum CAMERA_FOCAL_LENGTH_ULTRA_WIDE:Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;

.field public static final enum CAMERA_FOCAL_LENGTH_WIDE_ANGLE:Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    new-instance v0, Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;

    const-string v1, "CAMERA_FOCAL_LENGTH_DEFAULT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;->CAMERA_FOCAL_LENGTH_DEFAULT:Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;

    new-instance v1, Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;

    const-string v2, "CAMERA_FOCAL_LENGTH_WIDE_ANGLE"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;->CAMERA_FOCAL_LENGTH_WIDE_ANGLE:Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;

    new-instance v2, Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;

    const-string v3, "CAMERA_FOCAL_LENGTH_ULTRA_WIDE"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4, v4}, Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;->CAMERA_FOCAL_LENGTH_ULTRA_WIDE:Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;

    new-instance v3, Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;

    const-string v4, "CAMERA_FOCAL_LENGTH_TELEPHOTO"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5, v5}, Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;->CAMERA_FOCAL_LENGTH_TELEPHOTO:Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;

    filled-new-array {v0, v1, v2, v3}, [Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;

    move-result-object v0

    sput-object v0, Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;->$VALUES:[Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;->value:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;
    .locals 1

    const-class v0, Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;

    return-object p0
.end method

.method public static values()[Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;
    .locals 1

    sget-object v0, Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;->$VALUES:[Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;

    invoke-virtual {v0}, [Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "CAMERA_FOCAL_LENGTH_TYPE"
    .end annotation

    iget p0, p0, Lio/agora/rtc2/video/CameraCapturerConfiguration$CAMERA_FOCAL_LENGTH_TYPE;->value:I

    return p0
.end method
