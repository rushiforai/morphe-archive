.class public final enum Lcom/bytedance/realx/video/RXVideoMemoryType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/bytedance/realx/video/RXVideoMemoryType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/bytedance/realx/video/RXVideoMemoryType;

.field public static final enum kBYTE_MEMORY:Lcom/bytedance/realx/video/RXVideoMemoryType;

.field public static final enum kOPENGL_TEXTURE:Lcom/bytedance/realx/video/RXVideoMemoryType;

.field public static final enum kUNKNOWN:Lcom/bytedance/realx/video/RXVideoMemoryType;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Lcom/bytedance/realx/video/RXVideoMemoryType;

    .line 2
    .line 3
    const-string v1, "kUNKNOWN"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/bytedance/realx/video/RXVideoMemoryType;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/bytedance/realx/video/RXVideoMemoryType;->kUNKNOWN:Lcom/bytedance/realx/video/RXVideoMemoryType;

    .line 10
    .line 11
    new-instance v1, Lcom/bytedance/realx/video/RXVideoMemoryType;

    .line 12
    .line 13
    const-string v2, "kBYTE_MEMORY"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lcom/bytedance/realx/video/RXVideoMemoryType;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/bytedance/realx/video/RXVideoMemoryType;->kBYTE_MEMORY:Lcom/bytedance/realx/video/RXVideoMemoryType;

    .line 20
    .line 21
    new-instance v2, Lcom/bytedance/realx/video/RXVideoMemoryType;

    .line 22
    .line 23
    const/4 v3, 0x2

    .line 24
    const/4 v4, 0x3

    .line 25
    const-string v5, "kOPENGL_TEXTURE"

    .line 26
    .line 27
    invoke-direct {v2, v5, v3, v4}, Lcom/bytedance/realx/video/RXVideoMemoryType;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v2, Lcom/bytedance/realx/video/RXVideoMemoryType;->kOPENGL_TEXTURE:Lcom/bytedance/realx/video/RXVideoMemoryType;

    .line 31
    .line 32
    filled-new-array {v0, v1, v2}, [Lcom/bytedance/realx/video/RXVideoMemoryType;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sput-object v0, Lcom/bytedance/realx/video/RXVideoMemoryType;->$VALUES:[Lcom/bytedance/realx/video/RXVideoMemoryType;

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
    iput p3, p0, Lcom/bytedance/realx/video/RXVideoMemoryType;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lcom/bytedance/realx/video/RXVideoMemoryType;
    .locals 5
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-static {}, Lcom/bytedance/realx/video/RXVideoMemoryType;->values()[Lcom/bytedance/realx/video/RXVideoMemoryType;

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
    invoke-virtual {v3}, Lcom/bytedance/realx/video/RXVideoMemoryType;->value()I

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

.method public static valueOf(Ljava/lang/String;)Lcom/bytedance/realx/video/RXVideoMemoryType;
    .locals 1

    .line 1
    const-class v0, Lcom/bytedance/realx/video/RXVideoMemoryType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/bytedance/realx/video/RXVideoMemoryType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/bytedance/realx/video/RXVideoMemoryType;
    .locals 1

    .line 1
    sget-object v0, Lcom/bytedance/realx/video/RXVideoMemoryType;->$VALUES:[Lcom/bytedance/realx/video/RXVideoMemoryType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/bytedance/realx/video/RXVideoMemoryType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/bytedance/realx/video/RXVideoMemoryType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public value()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/RXVideoMemoryType;->value:I

    .line 2
    .line 3
    return p0
.end method
