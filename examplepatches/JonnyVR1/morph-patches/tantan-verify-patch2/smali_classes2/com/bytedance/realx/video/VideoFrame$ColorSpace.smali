.class public final enum Lcom/bytedance/realx/video/VideoFrame$ColorSpace;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bytedance/realx/video/VideoFrame;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ColorSpace"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/bytedance/realx/video/VideoFrame$ColorSpace;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/bytedance/realx/video/VideoFrame$ColorSpace;

.field public static final enum kUnknown:Lcom/bytedance/realx/video/VideoFrame$ColorSpace;

.field public static final enum kYCbCrBT601FullRange:Lcom/bytedance/realx/video/VideoFrame$ColorSpace;

.field public static final enum kYCbCrBT601LimitedRange:Lcom/bytedance/realx/video/VideoFrame$ColorSpace;

.field public static final enum kYCbCrBT709FullRange:Lcom/bytedance/realx/video/VideoFrame$ColorSpace;

.field public static final enum kYCbCrBT709LimitedRange:Lcom/bytedance/realx/video/VideoFrame$ColorSpace;


# instance fields
.field private colorSpace:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v0, Lcom/bytedance/realx/video/VideoFrame$ColorSpace;

    .line 2
    .line 3
    const-string v1, "kUnknown"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/bytedance/realx/video/VideoFrame$ColorSpace;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/bytedance/realx/video/VideoFrame$ColorSpace;->kUnknown:Lcom/bytedance/realx/video/VideoFrame$ColorSpace;

    .line 10
    .line 11
    new-instance v1, Lcom/bytedance/realx/video/VideoFrame$ColorSpace;

    .line 12
    .line 13
    const-string v2, "kYCbCrBT601LimitedRange"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lcom/bytedance/realx/video/VideoFrame$ColorSpace;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/bytedance/realx/video/VideoFrame$ColorSpace;->kYCbCrBT601LimitedRange:Lcom/bytedance/realx/video/VideoFrame$ColorSpace;

    .line 20
    .line 21
    new-instance v2, Lcom/bytedance/realx/video/VideoFrame$ColorSpace;

    .line 22
    .line 23
    const-string v3, "kYCbCrBT601FullRange"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4, v4}, Lcom/bytedance/realx/video/VideoFrame$ColorSpace;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/bytedance/realx/video/VideoFrame$ColorSpace;->kYCbCrBT601FullRange:Lcom/bytedance/realx/video/VideoFrame$ColorSpace;

    .line 30
    .line 31
    new-instance v3, Lcom/bytedance/realx/video/VideoFrame$ColorSpace;

    .line 32
    .line 33
    const-string v4, "kYCbCrBT709LimitedRange"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    invoke-direct {v3, v4, v5, v5}, Lcom/bytedance/realx/video/VideoFrame$ColorSpace;-><init>(Ljava/lang/String;II)V

    .line 37
    .line 38
    .line 39
    sput-object v3, Lcom/bytedance/realx/video/VideoFrame$ColorSpace;->kYCbCrBT709LimitedRange:Lcom/bytedance/realx/video/VideoFrame$ColorSpace;

    .line 40
    .line 41
    new-instance v4, Lcom/bytedance/realx/video/VideoFrame$ColorSpace;

    .line 42
    .line 43
    const-string v5, "kYCbCrBT709FullRange"

    .line 44
    .line 45
    const/4 v6, 0x4

    .line 46
    invoke-direct {v4, v5, v6, v6}, Lcom/bytedance/realx/video/VideoFrame$ColorSpace;-><init>(Ljava/lang/String;II)V

    .line 47
    .line 48
    .line 49
    sput-object v4, Lcom/bytedance/realx/video/VideoFrame$ColorSpace;->kYCbCrBT709FullRange:Lcom/bytedance/realx/video/VideoFrame$ColorSpace;

    .line 50
    .line 51
    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/bytedance/realx/video/VideoFrame$ColorSpace;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    sput-object v0, Lcom/bytedance/realx/video/VideoFrame$ColorSpace;->$VALUES:[Lcom/bytedance/realx/video/VideoFrame$ColorSpace;

    .line 56
    .line 57
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
    iput p3, p0, Lcom/bytedance/realx/video/VideoFrame$ColorSpace;->colorSpace:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/bytedance/realx/video/VideoFrame$ColorSpace;
    .locals 1

    .line 1
    const-class v0, Lcom/bytedance/realx/video/VideoFrame$ColorSpace;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/bytedance/realx/video/VideoFrame$ColorSpace;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/bytedance/realx/video/VideoFrame$ColorSpace;
    .locals 1

    .line 1
    sget-object v0, Lcom/bytedance/realx/video/VideoFrame$ColorSpace;->$VALUES:[Lcom/bytedance/realx/video/VideoFrame$ColorSpace;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/bytedance/realx/video/VideoFrame$ColorSpace;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/bytedance/realx/video/VideoFrame$ColorSpace;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getColorSpace()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/VideoFrame$ColorSpace;->colorSpace:I

    .line 2
    .line 3
    return p0
.end method
