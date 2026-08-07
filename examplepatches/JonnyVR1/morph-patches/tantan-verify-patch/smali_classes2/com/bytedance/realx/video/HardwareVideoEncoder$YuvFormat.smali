.class abstract enum Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bytedance/realx/video/HardwareVideoEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4409
    name = "YuvFormat"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;

.field public static final enum I420:Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;

.field public static final enum NV12:Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat$1;

    .line 2
    .line 3
    const-string v1, "I420"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat$1;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;->I420:Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;

    .line 10
    .line 11
    new-instance v1, Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat$2;

    .line 12
    .line 13
    const-string v3, "NV12"

    .line 14
    .line 15
    const/4 v4, 0x1

    .line 16
    invoke-direct {v1, v3, v4}, Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat$2;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;->NV12:Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;

    .line 20
    .line 21
    const/4 v3, 0x2

    .line 22
    new-array v3, v3, [Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;

    .line 23
    .line 24
    aput-object v0, v3, v2

    .line 25
    .line 26
    aput-object v1, v3, v4

    .line 27
    .line 28
    sput-object v3, Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;->$VALUES:[Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;

    .line 29
    .line 30
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
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;ILcom/bytedance/realx/video/HardwareVideoEncoder$1;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(I)Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;
    .locals 1

    .line 1
    const/16 v0, 0x13

    .line 2
    .line 3
    if-eq p0, v0, :cond_2

    .line 4
    .line 5
    const/16 v0, 0x15

    .line 6
    .line 7
    if-eq p0, v0, :cond_1

    .line 8
    .line 9
    const v0, 0x7fa30c00

    .line 10
    .line 11
    .line 12
    if-eq p0, v0, :cond_1

    .line 13
    .line 14
    const v0, 0x7fa30c04

    .line 15
    .line 16
    .line 17
    if-ne p0, v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string v0, "Unsupported colorFormat: "

    .line 21
    .line 22
    invoke-static {v0, p0}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    return-object p0

    .line 27
    :cond_1
    :goto_0
    sget-object p0, Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;->NV12:Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_2
    sget-object p0, Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;->I420:Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;

    .line 31
    .line 32
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;
    .locals 1

    .line 33
    const-class v0, Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;

    return-object p0
.end method

.method public static values()[Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;
    .locals 1

    .line 1
    sget-object v0, Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;->$VALUES:[Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/bytedance/realx/video/HardwareVideoEncoder$YuvFormat;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public abstract fillBuffer(Ljava/nio/ByteBuffer;Lcom/bytedance/realx/video/memory/RXVideoFrameInterface;)V
.end method
