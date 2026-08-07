.class public final enum Lcom/ss/bytertc/engine/type/VideoDeviceType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/type/VideoDeviceType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/type/VideoDeviceType;

.field public static final enum VIDEO_DEVICE_TYPE_CAPTURE_DEVICE:Lcom/ss/bytertc/engine/type/VideoDeviceType;

.field public static final enum VIDEO_DEVICE_TYPE_RENDER_DEVICE:Lcom/ss/bytertc/engine/type/VideoDeviceType;

.field public static final enum VIDEO_DEVICE_TYPE_SCREEN_CAPTURE_DEVICE:Lcom/ss/bytertc/engine/type/VideoDeviceType;

.field public static final enum VIDEO_DEVICE_TYPE_UNKNOWN:Lcom/ss/bytertc/engine/type/VideoDeviceType;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/type/VideoDeviceType;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const-string v2, "VIDEO_DEVICE_TYPE_UNKNOWN"

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-direct {v0, v2, v3, v1}, Lcom/ss/bytertc/engine/type/VideoDeviceType;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/ss/bytertc/engine/type/VideoDeviceType;->VIDEO_DEVICE_TYPE_UNKNOWN:Lcom/ss/bytertc/engine/type/VideoDeviceType;

    .line 11
    .line 12
    new-instance v1, Lcom/ss/bytertc/engine/type/VideoDeviceType;

    .line 13
    .line 14
    const-string v2, "VIDEO_DEVICE_TYPE_RENDER_DEVICE"

    .line 15
    .line 16
    const/4 v4, 0x1

    .line 17
    invoke-direct {v1, v2, v4, v3}, Lcom/ss/bytertc/engine/type/VideoDeviceType;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v1, Lcom/ss/bytertc/engine/type/VideoDeviceType;->VIDEO_DEVICE_TYPE_RENDER_DEVICE:Lcom/ss/bytertc/engine/type/VideoDeviceType;

    .line 21
    .line 22
    new-instance v2, Lcom/ss/bytertc/engine/type/VideoDeviceType;

    .line 23
    .line 24
    const-string v3, "VIDEO_DEVICE_TYPE_CAPTURE_DEVICE"

    .line 25
    .line 26
    const/4 v5, 0x2

    .line 27
    invoke-direct {v2, v3, v5, v4}, Lcom/ss/bytertc/engine/type/VideoDeviceType;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v2, Lcom/ss/bytertc/engine/type/VideoDeviceType;->VIDEO_DEVICE_TYPE_CAPTURE_DEVICE:Lcom/ss/bytertc/engine/type/VideoDeviceType;

    .line 31
    .line 32
    new-instance v3, Lcom/ss/bytertc/engine/type/VideoDeviceType;

    .line 33
    .line 34
    const-string v4, "VIDEO_DEVICE_TYPE_SCREEN_CAPTURE_DEVICE"

    .line 35
    .line 36
    const/4 v6, 0x3

    .line 37
    invoke-direct {v3, v4, v6, v5}, Lcom/ss/bytertc/engine/type/VideoDeviceType;-><init>(Ljava/lang/String;II)V

    .line 38
    .line 39
    .line 40
    sput-object v3, Lcom/ss/bytertc/engine/type/VideoDeviceType;->VIDEO_DEVICE_TYPE_SCREEN_CAPTURE_DEVICE:Lcom/ss/bytertc/engine/type/VideoDeviceType;

    .line 41
    .line 42
    filled-new-array {v0, v1, v2, v3}, [Lcom/ss/bytertc/engine/type/VideoDeviceType;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sput-object v0, Lcom/ss/bytertc/engine/type/VideoDeviceType;->$VALUES:[Lcom/ss/bytertc/engine/type/VideoDeviceType;

    .line 47
    .line 48
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/ss/bytertc/engine/type/VideoDeviceType;->value:I

    .line 6
    .line 7
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 8
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 9
    iput p3, p0, Lcom/ss/bytertc/engine/type/VideoDeviceType;->value:I

    return-void
.end method

.method public static fromId(I)Lcom/ss/bytertc/engine/type/VideoDeviceType;
    .locals 5
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-static {}, Lcom/ss/bytertc/engine/type/VideoDeviceType;->values()[Lcom/ss/bytertc/engine/type/VideoDeviceType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v1, v0

    .line 6
    const/4 v2, 0x0

    .line 7
    :goto_0
    if-ge v2, v1, :cond_1

    .line 8
    .line 9
    aget-object v3, v0, v2

    .line 10
    .line 11
    invoke-virtual {v3}, Lcom/ss/bytertc/engine/type/VideoDeviceType;->value()I

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    if-ne v4, p0, :cond_0

    .line 16
    .line 17
    return-object v3

    .line 18
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    sget-object p0, Lcom/ss/bytertc/engine/type/VideoDeviceType;->VIDEO_DEVICE_TYPE_UNKNOWN:Lcom/ss/bytertc/engine/type/VideoDeviceType;

    .line 22
    .line 23
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/type/VideoDeviceType;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/type/VideoDeviceType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/type/VideoDeviceType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/type/VideoDeviceType;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/type/VideoDeviceType;->$VALUES:[Lcom/ss/bytertc/engine/type/VideoDeviceType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/type/VideoDeviceType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/type/VideoDeviceType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/type/VideoDeviceType;->value:I

    .line 2
    .line 3
    return p0
.end method
