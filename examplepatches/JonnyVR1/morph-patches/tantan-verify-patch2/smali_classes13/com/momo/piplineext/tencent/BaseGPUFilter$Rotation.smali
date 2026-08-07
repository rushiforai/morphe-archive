.class public final enum Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;

.field public static final enum NORMAL:Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;

.field public static final enum ROTATION_180:Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;

.field public static final enum ROTATION_270:Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;

.field public static final enum ROTATION_90:Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;


# direct methods
.method private static synthetic $values()[Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;
    .locals 4

    .line 1
    sget-object v0, Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;->NORMAL:Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;

    .line 2
    .line 3
    sget-object v1, Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;->ROTATION_90:Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;

    .line 4
    .line 5
    sget-object v2, Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;->ROTATION_180:Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;

    .line 6
    .line 7
    sget-object v3, Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;->ROTATION_270:Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;

    .line 8
    .line 9
    filled-new-array {v0, v1, v2, v3}, [Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;

    .line 2
    .line 3
    const-string v1, "NORMAL"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;->NORMAL:Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;

    .line 10
    .line 11
    new-instance v0, Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;

    .line 12
    .line 13
    const-string v1, "ROTATION_90"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;->ROTATION_90:Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;

    .line 20
    .line 21
    new-instance v0, Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;

    .line 22
    .line 23
    const-string v1, "ROTATION_180"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;->ROTATION_180:Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;

    .line 30
    .line 31
    new-instance v0, Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;

    .line 32
    .line 33
    const-string v1, "ROTATION_270"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2}, Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;->ROTATION_270:Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;

    .line 40
    .line 41
    invoke-static {}, Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;->$values()[Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sput-object v0, Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;->$VALUES:[Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;

    .line 46
    .line 47
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

.method public static fromInt(I)Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;
    .locals 1

    .line 1
    if-eqz p0, :cond_4

    .line 2
    .line 3
    const/16 v0, 0x5a

    .line 4
    .line 5
    if-eq p0, v0, :cond_3

    .line 6
    .line 7
    const/16 v0, 0xb4

    .line 8
    .line 9
    if-eq p0, v0, :cond_2

    .line 10
    .line 11
    const/16 v0, 0x10e

    .line 12
    .line 13
    if-eq p0, v0, :cond_1

    .line 14
    .line 15
    const/16 v0, 0x168

    .line 16
    .line 17
    if-ne p0, v0, :cond_0

    .line 18
    .line 19
    sget-object p0, Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;->NORMAL:Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    invoke-static {p0}, Ll/pmd0;->a(I)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    return-object p0

    .line 27
    :cond_1
    sget-object p0, Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;->ROTATION_270:Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_2
    sget-object p0, Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;->ROTATION_180:Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_3
    sget-object p0, Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;->ROTATION_90:Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_4
    sget-object p0, Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;->NORMAL:Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;

    .line 37
    .line 38
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;
    .locals 1

    .line 1
    const-class v0, Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;->$VALUES:[Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/momo/piplineext/tencent/BaseGPUFilter$Rotation;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public asInt()I
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/piplineext/tencent/a;->a:[I

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
    const/4 v0, 0x1

    .line 10
    if-eq p0, v0, :cond_3

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p0, v0, :cond_2

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-eq p0, v0, :cond_1

    .line 17
    .line 18
    const/4 v0, 0x4

    .line 19
    if-ne p0, v0, :cond_0

    .line 20
    .line 21
    const/16 p0, 0x10e

    .line 22
    .line 23
    return p0

    .line 24
    :cond_0
    const-string p0, "Unknown Rotation!"

    .line 25
    .line 26
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x0

    .line 30
    return p0

    .line 31
    :cond_1
    const/16 p0, 0xb4

    .line 32
    .line 33
    return p0

    .line 34
    :cond_2
    const/16 p0, 0x5a

    .line 35
    .line 36
    return p0

    .line 37
    :cond_3
    const/4 p0, 0x0

    .line 38
    return p0
.end method
