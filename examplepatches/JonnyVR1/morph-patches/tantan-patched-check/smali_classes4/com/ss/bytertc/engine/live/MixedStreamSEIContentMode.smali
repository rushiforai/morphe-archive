.class public final enum Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;

.field public static final enum MIXED_STREAM_SEI_CONTENT_MODE_DEFAULT:Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;

.field public static final enum MIXED_STREAM_SEI_CONTENT_MODE_ENABLE_VOLUME_INDICATION:Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;


# instance fields
.field private seiContentMode:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;

    .line 2
    .line 3
    const-string v1, "MIXED_STREAM_SEI_CONTENT_MODE_DEFAULT"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;->MIXED_STREAM_SEI_CONTENT_MODE_DEFAULT:Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;

    .line 10
    .line 11
    new-instance v1, Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;

    .line 12
    .line 13
    const-string v2, "MIXED_STREAM_SEI_CONTENT_MODE_ENABLE_VOLUME_INDICATION"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;->MIXED_STREAM_SEI_CONTENT_MODE_ENABLE_VOLUME_INDICATION:Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;

    .line 20
    .line 21
    filled-new-array {v0, v1}, [Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;->$VALUES:[Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;

    .line 26
    .line 27
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
    iput p3, p0, Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;->seiContentMode:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;->$VALUES:[Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamSEIContentMode;->seiContentMode:I

    .line 2
    .line 3
    return p0
.end method
