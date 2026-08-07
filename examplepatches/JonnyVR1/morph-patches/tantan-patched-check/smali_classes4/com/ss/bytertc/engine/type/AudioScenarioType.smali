.class public final enum Lcom/ss/bytertc/engine/type/AudioScenarioType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/type/AudioScenarioType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/type/AudioScenarioType;

.field public static final enum AICLIENT:Lcom/ss/bytertc/engine/type/AudioScenarioType;

.field public static final enum CHATROOM:Lcom/ss/bytertc/engine/type/AudioScenarioType;

.field public static final enum CHORUS:Lcom/ss/bytertc/engine/type/AudioScenarioType;

.field public static final enum DEFAULT:Lcom/ss/bytertc/engine/type/AudioScenarioType;

.field public static final enum EDUCATION:Lcom/ss/bytertc/engine/type/AudioScenarioType;

.field public static final enum GAMESTREAMING:Lcom/ss/bytertc/engine/type/AudioScenarioType;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/type/AudioScenarioType;

    .line 2
    .line 3
    const-string v1, "DEFAULT"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/ss/bytertc/engine/type/AudioScenarioType;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/ss/bytertc/engine/type/AudioScenarioType;->DEFAULT:Lcom/ss/bytertc/engine/type/AudioScenarioType;

    .line 10
    .line 11
    new-instance v1, Lcom/ss/bytertc/engine/type/AudioScenarioType;

    .line 12
    .line 13
    const-string v2, "CHATROOM"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lcom/ss/bytertc/engine/type/AudioScenarioType;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/ss/bytertc/engine/type/AudioScenarioType;->CHATROOM:Lcom/ss/bytertc/engine/type/AudioScenarioType;

    .line 20
    .line 21
    new-instance v2, Lcom/ss/bytertc/engine/type/AudioScenarioType;

    .line 22
    .line 23
    const-string v3, "GAMESTREAMING"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4, v4}, Lcom/ss/bytertc/engine/type/AudioScenarioType;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/ss/bytertc/engine/type/AudioScenarioType;->GAMESTREAMING:Lcom/ss/bytertc/engine/type/AudioScenarioType;

    .line 30
    .line 31
    new-instance v3, Lcom/ss/bytertc/engine/type/AudioScenarioType;

    .line 32
    .line 33
    const-string v4, "CHORUS"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    invoke-direct {v3, v4, v5, v5}, Lcom/ss/bytertc/engine/type/AudioScenarioType;-><init>(Ljava/lang/String;II)V

    .line 37
    .line 38
    .line 39
    sput-object v3, Lcom/ss/bytertc/engine/type/AudioScenarioType;->CHORUS:Lcom/ss/bytertc/engine/type/AudioScenarioType;

    .line 40
    .line 41
    new-instance v4, Lcom/ss/bytertc/engine/type/AudioScenarioType;

    .line 42
    .line 43
    const-string v5, "EDUCATION"

    .line 44
    .line 45
    const/4 v6, 0x4

    .line 46
    invoke-direct {v4, v5, v6, v6}, Lcom/ss/bytertc/engine/type/AudioScenarioType;-><init>(Ljava/lang/String;II)V

    .line 47
    .line 48
    .line 49
    sput-object v4, Lcom/ss/bytertc/engine/type/AudioScenarioType;->EDUCATION:Lcom/ss/bytertc/engine/type/AudioScenarioType;

    .line 50
    .line 51
    new-instance v5, Lcom/ss/bytertc/engine/type/AudioScenarioType;

    .line 52
    .line 53
    const-string v6, "AICLIENT"

    .line 54
    .line 55
    const/4 v7, 0x5

    .line 56
    invoke-direct {v5, v6, v7, v7}, Lcom/ss/bytertc/engine/type/AudioScenarioType;-><init>(Ljava/lang/String;II)V

    .line 57
    .line 58
    .line 59
    sput-object v5, Lcom/ss/bytertc/engine/type/AudioScenarioType;->AICLIENT:Lcom/ss/bytertc/engine/type/AudioScenarioType;

    .line 60
    .line 61
    filled-new-array/range {v0 .. v5}, [Lcom/ss/bytertc/engine/type/AudioScenarioType;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sput-object v0, Lcom/ss/bytertc/engine/type/AudioScenarioType;->$VALUES:[Lcom/ss/bytertc/engine/type/AudioScenarioType;

    .line 66
    .line 67
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
    iput p3, p0, Lcom/ss/bytertc/engine/type/AudioScenarioType;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lcom/ss/bytertc/engine/type/AudioScenarioType;
    .locals 5

    .line 1
    invoke-static {}, Lcom/ss/bytertc/engine/type/AudioScenarioType;->values()[Lcom/ss/bytertc/engine/type/AudioScenarioType;

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
    invoke-virtual {v3}, Lcom/ss/bytertc/engine/type/AudioScenarioType;->value()I

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
    sget-object p0, Lcom/ss/bytertc/engine/type/AudioScenarioType;->DEFAULT:Lcom/ss/bytertc/engine/type/AudioScenarioType;

    .line 22
    .line 23
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/type/AudioScenarioType;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/type/AudioScenarioType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/type/AudioScenarioType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/type/AudioScenarioType;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/type/AudioScenarioType;->$VALUES:[Lcom/ss/bytertc/engine/type/AudioScenarioType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/type/AudioScenarioType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/type/AudioScenarioType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/type/AudioScenarioType;->value:I

    .line 2
    .line 3
    return p0
.end method
