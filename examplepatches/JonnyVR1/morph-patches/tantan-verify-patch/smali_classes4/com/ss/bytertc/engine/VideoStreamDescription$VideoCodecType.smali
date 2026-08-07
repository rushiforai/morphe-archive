.class public final enum Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/engine/VideoStreamDescription;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "VideoCodecType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;

.field public static final enum CODEC_TYPE_AUTO:Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;

.field public static final enum CODEC_TYPE_BYTEVC1:Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;

.field public static final enum CODEC_TYPE_H264:Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;

    .line 2
    .line 3
    const-string v1, "CODEC_TYPE_AUTO"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;->CODEC_TYPE_AUTO:Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;

    .line 10
    .line 11
    new-instance v1, Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;

    .line 12
    .line 13
    const-string v2, "CODEC_TYPE_H264"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;->CODEC_TYPE_H264:Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;

    .line 20
    .line 21
    new-instance v2, Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;

    .line 22
    .line 23
    const-string v3, "CODEC_TYPE_BYTEVC1"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4, v4}, Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;->CODEC_TYPE_BYTEVC1:Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;

    .line 30
    .line 31
    filled-new-array {v0, v1, v2}, [Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;->$VALUES:[Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;

    .line 36
    .line 37
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
    iput p3, p0, Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static convertFromInt(I)Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;
    .locals 1

    .line 1
    invoke-static {}, Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;->values()[Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    aget-object p0, v0, p0

    .line 6
    .line 7
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;->$VALUES:[Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/VideoStreamDescription$VideoCodecType;->value:I

    .line 2
    .line 3
    return p0
.end method
