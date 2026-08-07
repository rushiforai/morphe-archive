.class public final enum Lcom/momo/piplineext/config/MMLiveChorusUserRole;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/momo/piplineext/config/MMLiveChorusUserRole;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/momo/piplineext/config/MMLiveChorusUserRole;

.field public static final enum ACCOMPANY_SINGER:Lcom/momo/piplineext/config/MMLiveChorusUserRole;

.field public static final enum AUDIENCE:Lcom/momo/piplineext/config/MMLiveChorusUserRole;

.field public static final enum BROADCASTER:Lcom/momo/piplineext/config/MMLiveChorusUserRole;

.field public static final enum LEADER_SINGER:Lcom/momo/piplineext/config/MMLiveChorusUserRole;

.field public static final enum UNKNOWUSER:Lcom/momo/piplineext/config/MMLiveChorusUserRole;


# instance fields
.field private value:I


# direct methods
.method private static synthetic $values()[Lcom/momo/piplineext/config/MMLiveChorusUserRole;
    .locals 5

    .line 1
    sget-object v0, Lcom/momo/piplineext/config/MMLiveChorusUserRole;->UNKNOWUSER:Lcom/momo/piplineext/config/MMLiveChorusUserRole;

    .line 2
    .line 3
    sget-object v1, Lcom/momo/piplineext/config/MMLiveChorusUserRole;->BROADCASTER:Lcom/momo/piplineext/config/MMLiveChorusUserRole;

    .line 4
    .line 5
    sget-object v2, Lcom/momo/piplineext/config/MMLiveChorusUserRole;->AUDIENCE:Lcom/momo/piplineext/config/MMLiveChorusUserRole;

    .line 6
    .line 7
    sget-object v3, Lcom/momo/piplineext/config/MMLiveChorusUserRole;->LEADER_SINGER:Lcom/momo/piplineext/config/MMLiveChorusUserRole;

    .line 8
    .line 9
    sget-object v4, Lcom/momo/piplineext/config/MMLiveChorusUserRole;->ACCOMPANY_SINGER:Lcom/momo/piplineext/config/MMLiveChorusUserRole;

    .line 10
    .line 11
    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/momo/piplineext/config/MMLiveChorusUserRole;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/momo/piplineext/config/MMLiveChorusUserRole;

    .line 2
    .line 3
    const-string v1, "UNKNOWUSER"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {v0, v1, v2, v3}, Lcom/momo/piplineext/config/MMLiveChorusUserRole;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/momo/piplineext/config/MMLiveChorusUserRole;->UNKNOWUSER:Lcom/momo/piplineext/config/MMLiveChorusUserRole;

    .line 11
    .line 12
    new-instance v0, Lcom/momo/piplineext/config/MMLiveChorusUserRole;

    .line 13
    .line 14
    const-string v1, "BROADCASTER"

    .line 15
    .line 16
    const/4 v2, 0x2

    .line 17
    invoke-direct {v0, v1, v3, v2}, Lcom/momo/piplineext/config/MMLiveChorusUserRole;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/momo/piplineext/config/MMLiveChorusUserRole;->BROADCASTER:Lcom/momo/piplineext/config/MMLiveChorusUserRole;

    .line 21
    .line 22
    new-instance v0, Lcom/momo/piplineext/config/MMLiveChorusUserRole;

    .line 23
    .line 24
    const-string v1, "AUDIENCE"

    .line 25
    .line 26
    const/4 v3, 0x3

    .line 27
    invoke-direct {v0, v1, v2, v3}, Lcom/momo/piplineext/config/MMLiveChorusUserRole;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v0, Lcom/momo/piplineext/config/MMLiveChorusUserRole;->AUDIENCE:Lcom/momo/piplineext/config/MMLiveChorusUserRole;

    .line 31
    .line 32
    new-instance v0, Lcom/momo/piplineext/config/MMLiveChorusUserRole;

    .line 33
    .line 34
    const-string v1, "LEADER_SINGER"

    .line 35
    .line 36
    const/4 v2, 0x4

    .line 37
    invoke-direct {v0, v1, v3, v2}, Lcom/momo/piplineext/config/MMLiveChorusUserRole;-><init>(Ljava/lang/String;II)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/momo/piplineext/config/MMLiveChorusUserRole;->LEADER_SINGER:Lcom/momo/piplineext/config/MMLiveChorusUserRole;

    .line 41
    .line 42
    new-instance v0, Lcom/momo/piplineext/config/MMLiveChorusUserRole;

    .line 43
    .line 44
    const-string v1, "ACCOMPANY_SINGER"

    .line 45
    .line 46
    const/4 v3, 0x5

    .line 47
    invoke-direct {v0, v1, v2, v3}, Lcom/momo/piplineext/config/MMLiveChorusUserRole;-><init>(Ljava/lang/String;II)V

    .line 48
    .line 49
    .line 50
    sput-object v0, Lcom/momo/piplineext/config/MMLiveChorusUserRole;->ACCOMPANY_SINGER:Lcom/momo/piplineext/config/MMLiveChorusUserRole;

    .line 51
    .line 52
    invoke-static {}, Lcom/momo/piplineext/config/MMLiveChorusUserRole;->$values()[Lcom/momo/piplineext/config/MMLiveChorusUserRole;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    sput-object v0, Lcom/momo/piplineext/config/MMLiveChorusUserRole;->$VALUES:[Lcom/momo/piplineext/config/MMLiveChorusUserRole;

    .line 57
    .line 58
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
    iput p3, p0, Lcom/momo/piplineext/config/MMLiveChorusUserRole;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lcom/momo/piplineext/config/MMLiveChorusUserRole;
    .locals 5

    .line 1
    invoke-static {}, Lcom/momo/piplineext/config/MMLiveChorusUserRole;->values()[Lcom/momo/piplineext/config/MMLiveChorusUserRole;

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
    invoke-virtual {v3}, Lcom/momo/piplineext/config/MMLiveChorusUserRole;->value()I

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

.method public static valueOf(Ljava/lang/String;)Lcom/momo/piplineext/config/MMLiveChorusUserRole;
    .locals 1

    .line 1
    const-class v0, Lcom/momo/piplineext/config/MMLiveChorusUserRole;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/momo/piplineext/config/MMLiveChorusUserRole;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/momo/piplineext/config/MMLiveChorusUserRole;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/piplineext/config/MMLiveChorusUserRole;->$VALUES:[Lcom/momo/piplineext/config/MMLiveChorusUserRole;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/momo/piplineext/config/MMLiveChorusUserRole;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/momo/piplineext/config/MMLiveChorusUserRole;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/piplineext/config/MMLiveChorusUserRole;->value:I

    .line 2
    .line 3
    return p0
.end method
