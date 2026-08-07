.class public final enum Lcom/p1/mobile/putong/core/data/SwipeDirection;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/core/data/SwipeDirection;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/core/data/SwipeDirection;

.field public static final enum LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

.field public static final enum REMOVE:Lcom/p1/mobile/putong/core/data/SwipeDirection;

.field public static final enum RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

.field public static final enum UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;


# instance fields
.field private value:I


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/core/data/SwipeDirection;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->REMOVE:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 8
    .line 9
    filled-new-array {v0, v1, v2, v3}, [Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    const-string v1, "RIGHT"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 11
    .line 12
    new-instance v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 13
    .line 14
    const-string v1, "UP"

    .line 15
    .line 16
    const/4 v2, 0x2

    .line 17
    invoke-direct {v0, v1, v3, v2}, Lcom/p1/mobile/putong/core/data/SwipeDirection;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 21
    .line 22
    new-instance v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 23
    .line 24
    const-string v1, "LEFT"

    .line 25
    .line 26
    const/4 v3, -0x1

    .line 27
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/data/SwipeDirection;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 31
    .line 32
    new-instance v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 33
    .line 34
    const-string v1, "REMOVE"

    .line 35
    .line 36
    const/4 v2, 0x3

    .line 37
    invoke-direct {v0, v1, v2, v2}, Lcom/p1/mobile/putong/core/data/SwipeDirection;-><init>(Ljava/lang/String;II)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->REMOVE:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->$values()[Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sput-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->$VALUES:[Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 47
    .line 48
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
    iput p3, p0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromValue(I)Lcom/p1/mobile/putong/core/data/SwipeDirection;
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    if-eq p0, v0, :cond_2

    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    if-eq p0, v0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return-object p0

    .line 12
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 19
    .line 20
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SwipeDirection;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/core/data/SwipeDirection;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->$VALUES:[Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/core/data/SwipeDirection;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->value:I

    .line 2
    .line 3
    return p0
.end method
