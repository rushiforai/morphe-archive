.class public final enum Lcom/ss/bytertc/engine/type/BackgroundMode;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/type/BackgroundMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/type/BackgroundMode;

.field public static final enum BACKGROUND_A:Lcom/ss/bytertc/engine/type/BackgroundMode;

.field public static final enum BACKGROUND_B:Lcom/ss/bytertc/engine/type/BackgroundMode;

.field public static final enum BLUR:Lcom/ss/bytertc/engine/type/BackgroundMode;

.field public static final enum NONE:Lcom/ss/bytertc/engine/type/BackgroundMode;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/type/BackgroundMode;

    .line 2
    .line 3
    const-string v1, "BACKGROUND_A"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/ss/bytertc/engine/type/BackgroundMode;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/ss/bytertc/engine/type/BackgroundMode;->BACKGROUND_A:Lcom/ss/bytertc/engine/type/BackgroundMode;

    .line 10
    .line 11
    new-instance v1, Lcom/ss/bytertc/engine/type/BackgroundMode;

    .line 12
    .line 13
    const-string v2, "BACKGROUND_B"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lcom/ss/bytertc/engine/type/BackgroundMode;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/ss/bytertc/engine/type/BackgroundMode;->BACKGROUND_B:Lcom/ss/bytertc/engine/type/BackgroundMode;

    .line 20
    .line 21
    new-instance v2, Lcom/ss/bytertc/engine/type/BackgroundMode;

    .line 22
    .line 23
    const-string v3, "BLUR"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4, v4}, Lcom/ss/bytertc/engine/type/BackgroundMode;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/ss/bytertc/engine/type/BackgroundMode;->BLUR:Lcom/ss/bytertc/engine/type/BackgroundMode;

    .line 30
    .line 31
    new-instance v3, Lcom/ss/bytertc/engine/type/BackgroundMode;

    .line 32
    .line 33
    const-string v4, "NONE"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    invoke-direct {v3, v4, v5, v5}, Lcom/ss/bytertc/engine/type/BackgroundMode;-><init>(Ljava/lang/String;II)V

    .line 37
    .line 38
    .line 39
    sput-object v3, Lcom/ss/bytertc/engine/type/BackgroundMode;->NONE:Lcom/ss/bytertc/engine/type/BackgroundMode;

    .line 40
    .line 41
    filled-new-array {v0, v1, v2, v3}, [Lcom/ss/bytertc/engine/type/BackgroundMode;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sput-object v0, Lcom/ss/bytertc/engine/type/BackgroundMode;->$VALUES:[Lcom/ss/bytertc/engine/type/BackgroundMode;

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
    iput p3, p0, Lcom/ss/bytertc/engine/type/BackgroundMode;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/type/BackgroundMode;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/type/BackgroundMode;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/type/BackgroundMode;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/type/BackgroundMode;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/type/BackgroundMode;->$VALUES:[Lcom/ss/bytertc/engine/type/BackgroundMode;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/type/BackgroundMode;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/type/BackgroundMode;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/type/BackgroundMode;->value:I

    .line 2
    .line 3
    return p0
.end method
