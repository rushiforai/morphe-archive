.class public final enum Lcom/ss/bytertc/engine/data/MirrorType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/data/MirrorType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/data/MirrorType;

.field public static final enum MIRROR_TYPE_ENCODER:Lcom/ss/bytertc/engine/data/MirrorType;

.field public static final enum MIRROR_TYPE_NONE:Lcom/ss/bytertc/engine/data/MirrorType;

.field public static final enum MIRROR_TYPE_RENDER:Lcom/ss/bytertc/engine/data/MirrorType;

.field public static final enum MIRROR_TYPE_RENDER_AND_ENCODER:Lcom/ss/bytertc/engine/data/MirrorType;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/data/MirrorType;

    .line 2
    .line 3
    const-string v1, "MIRROR_TYPE_NONE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/ss/bytertc/engine/data/MirrorType;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/ss/bytertc/engine/data/MirrorType;->MIRROR_TYPE_NONE:Lcom/ss/bytertc/engine/data/MirrorType;

    .line 10
    .line 11
    new-instance v1, Lcom/ss/bytertc/engine/data/MirrorType;

    .line 12
    .line 13
    const-string v2, "MIRROR_TYPE_RENDER"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lcom/ss/bytertc/engine/data/MirrorType;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/ss/bytertc/engine/data/MirrorType;->MIRROR_TYPE_RENDER:Lcom/ss/bytertc/engine/data/MirrorType;

    .line 20
    .line 21
    new-instance v2, Lcom/ss/bytertc/engine/data/MirrorType;

    .line 22
    .line 23
    const-string v3, "MIRROR_TYPE_ENCODER"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4, v4}, Lcom/ss/bytertc/engine/data/MirrorType;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/ss/bytertc/engine/data/MirrorType;->MIRROR_TYPE_ENCODER:Lcom/ss/bytertc/engine/data/MirrorType;

    .line 30
    .line 31
    new-instance v3, Lcom/ss/bytertc/engine/data/MirrorType;

    .line 32
    .line 33
    const-string v4, "MIRROR_TYPE_RENDER_AND_ENCODER"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    invoke-direct {v3, v4, v5, v5}, Lcom/ss/bytertc/engine/data/MirrorType;-><init>(Ljava/lang/String;II)V

    .line 37
    .line 38
    .line 39
    sput-object v3, Lcom/ss/bytertc/engine/data/MirrorType;->MIRROR_TYPE_RENDER_AND_ENCODER:Lcom/ss/bytertc/engine/data/MirrorType;

    .line 40
    .line 41
    filled-new-array {v0, v1, v2, v3}, [Lcom/ss/bytertc/engine/data/MirrorType;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sput-object v0, Lcom/ss/bytertc/engine/data/MirrorType;->$VALUES:[Lcom/ss/bytertc/engine/data/MirrorType;

    .line 46
    .line 47
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
    iput p3, p0, Lcom/ss/bytertc/engine/data/MirrorType;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lcom/ss/bytertc/engine/data/MirrorType;
    .locals 5
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-static {}, Lcom/ss/bytertc/engine/data/MirrorType;->values()[Lcom/ss/bytertc/engine/data/MirrorType;

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
    invoke-virtual {v3}, Lcom/ss/bytertc/engine/data/MirrorType;->value()I

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

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/data/MirrorType;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/data/MirrorType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/data/MirrorType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/data/MirrorType;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/data/MirrorType;->$VALUES:[Lcom/ss/bytertc/engine/data/MirrorType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/data/MirrorType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/data/MirrorType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/data/MirrorType;->MIRROR_TYPE_NONE:Lcom/ss/bytertc/engine/data/MirrorType;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const-string p0, "kMirrorTypeNone"

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    sget-object v0, Lcom/ss/bytertc/engine/data/MirrorType;->MIRROR_TYPE_RENDER:Lcom/ss/bytertc/engine/data/MirrorType;

    .line 9
    .line 10
    if-ne p0, v0, :cond_1

    .line 11
    .line 12
    const-string p0, "kMirrorTypeRender"

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    sget-object v0, Lcom/ss/bytertc/engine/data/MirrorType;->MIRROR_TYPE_RENDER_AND_ENCODER:Lcom/ss/bytertc/engine/data/MirrorType;

    .line 16
    .line 17
    if-ne p0, v0, :cond_2

    .line 18
    .line 19
    const-string p0, "kMirrorTypeRenderAndEncoder"

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_2
    const-string p0, ""

    .line 23
    .line 24
    return-object p0
.end method

.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/data/MirrorType;->value:I

    .line 2
    .line 3
    return p0
.end method
