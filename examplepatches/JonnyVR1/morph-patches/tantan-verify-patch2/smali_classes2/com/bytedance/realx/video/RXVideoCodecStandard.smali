.class final enum Lcom/bytedance/realx/video/RXVideoCodecStandard;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/bytedance/realx/video/RXVideoCodecStandard;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/bytedance/realx/video/RXVideoCodecStandard;

.field public static final enum ByteVC1:Lcom/bytedance/realx/video/RXVideoCodecStandard;

.field public static final enum H264:Lcom/bytedance/realx/video/RXVideoCodecStandard;

.field public static final enum Unknown:Lcom/bytedance/realx/video/RXVideoCodecStandard;

.field public static final enum VP8:Lcom/bytedance/realx/video/RXVideoCodecStandard;

.field public static final enum VP9:Lcom/bytedance/realx/video/RXVideoCodecStandard;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    new-instance v0, Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 2
    .line 3
    const-string v1, "H264"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/bytedance/realx/video/RXVideoCodecStandard;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/bytedance/realx/video/RXVideoCodecStandard;->H264:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 10
    .line 11
    new-instance v1, Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 12
    .line 13
    const-string v2, "ByteVC1"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lcom/bytedance/realx/video/RXVideoCodecStandard;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/bytedance/realx/video/RXVideoCodecStandard;->ByteVC1:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 20
    .line 21
    new-instance v2, Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 22
    .line 23
    const-string v3, "Unknown"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4, v4}, Lcom/bytedance/realx/video/RXVideoCodecStandard;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/bytedance/realx/video/RXVideoCodecStandard;->Unknown:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 30
    .line 31
    new-instance v3, Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 32
    .line 33
    const/4 v4, 0x3

    .line 34
    const/16 v5, 0x8

    .line 35
    .line 36
    const-string v6, "VP8"

    .line 37
    .line 38
    invoke-direct {v3, v6, v4, v5}, Lcom/bytedance/realx/video/RXVideoCodecStandard;-><init>(Ljava/lang/String;II)V

    .line 39
    .line 40
    .line 41
    sput-object v3, Lcom/bytedance/realx/video/RXVideoCodecStandard;->VP8:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 42
    .line 43
    new-instance v4, Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 44
    .line 45
    const/4 v5, 0x4

    .line 46
    const/16 v6, 0x9

    .line 47
    .line 48
    const-string v7, "VP9"

    .line 49
    .line 50
    invoke-direct {v4, v7, v5, v6}, Lcom/bytedance/realx/video/RXVideoCodecStandard;-><init>(Ljava/lang/String;II)V

    .line 51
    .line 52
    .line 53
    sput-object v4, Lcom/bytedance/realx/video/RXVideoCodecStandard;->VP9:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 54
    .line 55
    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    sput-object v0, Lcom/bytedance/realx/video/RXVideoCodecStandard;->$VALUES:[Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 60
    .line 61
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/bytedance/realx/video/RXVideoCodecStandard;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromValue(I)Lcom/bytedance/realx/video/RXVideoCodecStandard;
    .locals 1

    .line 1
    if-eqz p0, :cond_2

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p0, v0, :cond_1

    .line 5
    .line 6
    const/16 v0, 0x8

    .line 7
    .line 8
    if-eq p0, v0, :cond_0

    .line 9
    .line 10
    sget-object p0, Lcom/bytedance/realx/video/RXVideoCodecStandard;->H264:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    sget-object p0, Lcom/bytedance/realx/video/RXVideoCodecStandard;->VP8:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_1
    sget-object p0, Lcom/bytedance/realx/video/RXVideoCodecStandard;->ByteVC1:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_2
    sget-object p0, Lcom/bytedance/realx/video/RXVideoCodecStandard;->H264:Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 20
    .line 21
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/bytedance/realx/video/RXVideoCodecStandard;
    .locals 1

    .line 1
    const-class v0, Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/bytedance/realx/video/RXVideoCodecStandard;
    .locals 1

    .line 1
    sget-object v0, Lcom/bytedance/realx/video/RXVideoCodecStandard;->$VALUES:[Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/bytedance/realx/video/RXVideoCodecStandard;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/bytedance/realx/video/RXVideoCodecStandard;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public mimeType()Ljava/lang/String;
    .locals 1

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/RXVideoCodecStandard;->value:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p0, v0, :cond_1

    .line 5
    .line 6
    const/16 v0, 0x8

    .line 7
    .line 8
    if-eq p0, v0, :cond_0

    .line 9
    .line 10
    const-string p0, "video/avc"

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    const-string p0, "video/x-vnd.on2.vp8"

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_1
    const-string p0, "video/hevc"

    .line 17
    .line 18
    return-object p0
.end method

.method public toInt()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/RXVideoCodecStandard;->value:I

    .line 2
    .line 3
    return p0
.end method
