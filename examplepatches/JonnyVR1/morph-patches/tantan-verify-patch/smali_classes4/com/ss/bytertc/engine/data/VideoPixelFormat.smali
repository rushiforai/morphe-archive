.class public final enum Lcom/ss/bytertc/engine/data/VideoPixelFormat;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/data/VideoPixelFormat;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/data/VideoPixelFormat;

.field public static final enum I420:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

.field public static final enum NV12:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

.field public static final enum NV21:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

.field public static final enum RGBA:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

.field public static final enum TEXTURE_2D:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

.field public static final enum TEXTURE_OES:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

.field public static final enum UNKNOWN:Lcom/ss/bytertc/engine/data/VideoPixelFormat;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 2
    .line 3
    const-string v1, "UNKNOWN"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/ss/bytertc/engine/data/VideoPixelFormat;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->UNKNOWN:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 10
    .line 11
    new-instance v1, Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 12
    .line 13
    const-string v2, "I420"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lcom/ss/bytertc/engine/data/VideoPixelFormat;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->I420:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 20
    .line 21
    new-instance v2, Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 22
    .line 23
    const-string v3, "NV12"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4, v4}, Lcom/ss/bytertc/engine/data/VideoPixelFormat;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->NV12:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 30
    .line 31
    new-instance v3, Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 32
    .line 33
    const-string v4, "NV21"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    invoke-direct {v3, v4, v5, v5}, Lcom/ss/bytertc/engine/data/VideoPixelFormat;-><init>(Ljava/lang/String;II)V

    .line 37
    .line 38
    .line 39
    sput-object v3, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->NV21:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 40
    .line 41
    new-instance v4, Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 42
    .line 43
    const-string v5, "RGBA"

    .line 44
    .line 45
    const/4 v6, 0x4

    .line 46
    const/4 v7, 0x5

    .line 47
    invoke-direct {v4, v5, v6, v7}, Lcom/ss/bytertc/engine/data/VideoPixelFormat;-><init>(Ljava/lang/String;II)V

    .line 48
    .line 49
    .line 50
    sput-object v4, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->RGBA:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 51
    .line 52
    new-instance v5, Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 53
    .line 54
    const-string v6, "TEXTURE_2D"

    .line 55
    .line 56
    const/16 v8, 0xde1

    .line 57
    .line 58
    invoke-direct {v5, v6, v7, v8}, Lcom/ss/bytertc/engine/data/VideoPixelFormat;-><init>(Ljava/lang/String;II)V

    .line 59
    .line 60
    .line 61
    sput-object v5, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->TEXTURE_2D:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 62
    .line 63
    new-instance v6, Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 64
    .line 65
    const/4 v7, 0x6

    .line 66
    const v8, 0x8d65

    .line 67
    .line 68
    .line 69
    const-string v9, "TEXTURE_OES"

    .line 70
    .line 71
    invoke-direct {v6, v9, v7, v8}, Lcom/ss/bytertc/engine/data/VideoPixelFormat;-><init>(Ljava/lang/String;II)V

    .line 72
    .line 73
    .line 74
    sput-object v6, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->TEXTURE_OES:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 75
    .line 76
    filled-new-array/range {v0 .. v6}, [Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    sput-object v0, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->$VALUES:[Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 81
    .line 82
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
    iput p3, p0, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lcom/ss/bytertc/engine/data/VideoPixelFormat;
    .locals 5
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-static {}, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->values()[Lcom/ss/bytertc/engine/data/VideoPixelFormat;

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
    invoke-virtual {v3}, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->value()I

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
    const/4 p0, 0x0

    .line 22
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/data/VideoPixelFormat;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/data/VideoPixelFormat;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->$VALUES:[Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/data/VideoPixelFormat;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/data/VideoPixelFormat$1;->$SwitchMap$com$ss$bytertc$engine$data$VideoPixelFormat:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    packed-switch p0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    const-string p0, "kVideoPixelFormatUnknown"

    .line 13
    .line 14
    return-object p0

    .line 15
    :pswitch_0
    const-string p0, "kVideoPixelFormatTextureOES"

    .line 16
    .line 17
    return-object p0

    .line 18
    :pswitch_1
    const-string p0, "kVideoPixelFormatTexture2D"

    .line 19
    .line 20
    return-object p0

    .line 21
    :pswitch_2
    const-string p0, "kVideoPixelFormatRGBA"

    .line 22
    .line 23
    return-object p0

    .line 24
    :pswitch_3
    const-string p0, "kVideoPixelFormatNV21"

    .line 25
    .line 26
    return-object p0

    .line 27
    :pswitch_4
    const-string p0, "kVideoPixelFormatNV12"

    .line 28
    .line 29
    return-object p0

    .line 30
    :pswitch_5
    const-string p0, "kVideoPixelFormatI420"

    .line 31
    .line 32
    return-object p0

    .line 33
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public value()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->value:I

    .line 2
    .line 3
    return p0
.end method
