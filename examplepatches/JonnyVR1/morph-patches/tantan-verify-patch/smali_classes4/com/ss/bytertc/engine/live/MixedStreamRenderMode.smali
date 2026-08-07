.class public final enum Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;

.field public static final enum MIXED_STREAM_RENDER_MODE_ADAPTIVE:Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;

.field public static final enum MIXED_STREAM_RENDER_MODE_FIT:Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;

.field public static final enum MIXED_STREAM_RENDER_MODE_HIDDEN:Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;


# instance fields
.field private renderMode:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;

    .line 2
    .line 3
    const-string v1, "MIXED_STREAM_RENDER_MODE_HIDDEN"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {v0, v1, v2, v3}, Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;->MIXED_STREAM_RENDER_MODE_HIDDEN:Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;

    .line 11
    .line 12
    new-instance v1, Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;

    .line 13
    .line 14
    const-string v2, "MIXED_STREAM_RENDER_MODE_FIT"

    .line 15
    .line 16
    const/4 v4, 0x2

    .line 17
    invoke-direct {v1, v2, v3, v4}, Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v1, Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;->MIXED_STREAM_RENDER_MODE_FIT:Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;

    .line 21
    .line 22
    new-instance v2, Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;

    .line 23
    .line 24
    const-string v3, "MIXED_STREAM_RENDER_MODE_ADAPTIVE"

    .line 25
    .line 26
    const/4 v5, 0x3

    .line 27
    invoke-direct {v2, v3, v4, v5}, Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v2, Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;->MIXED_STREAM_RENDER_MODE_ADAPTIVE:Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;

    .line 31
    .line 32
    filled-new-array {v0, v1, v2}, [Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sput-object v0, Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;->$VALUES:[Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;

    .line 37
    .line 38
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
    iput p3, p0, Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;->renderMode:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;->$VALUES:[Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamRenderMode;->renderMode:I

    .line 2
    .line 3
    return p0
.end method
