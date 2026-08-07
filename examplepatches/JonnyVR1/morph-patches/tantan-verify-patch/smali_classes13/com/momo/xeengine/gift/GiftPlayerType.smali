.class public final enum Lcom/momo/xeengine/gift/GiftPlayerType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/momo/xeengine/gift/GiftPlayerType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/momo/xeengine/gift/GiftPlayerType;

.field public static final enum Auto:Lcom/momo/xeengine/gift/GiftPlayerType;

.field public static final enum Hardware:Lcom/momo/xeengine/gift/GiftPlayerType;

.field public static final enum Software:Lcom/momo/xeengine/gift/GiftPlayerType;


# instance fields
.field private final value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Lcom/momo/xeengine/gift/GiftPlayerType;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "auto"

    .line 5
    .line 6
    const-string v3, "Auto"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/momo/xeengine/gift/GiftPlayerType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/momo/xeengine/gift/GiftPlayerType;->Auto:Lcom/momo/xeengine/gift/GiftPlayerType;

    .line 12
    .line 13
    new-instance v1, Lcom/momo/xeengine/gift/GiftPlayerType;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    const-string v3, "hardware"

    .line 17
    .line 18
    const-string v4, "Hardware"

    .line 19
    .line 20
    invoke-direct {v1, v4, v2, v3}, Lcom/momo/xeengine/gift/GiftPlayerType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v1, Lcom/momo/xeengine/gift/GiftPlayerType;->Hardware:Lcom/momo/xeengine/gift/GiftPlayerType;

    .line 24
    .line 25
    new-instance v2, Lcom/momo/xeengine/gift/GiftPlayerType;

    .line 26
    .line 27
    const/4 v3, 0x2

    .line 28
    const-string v4, "software"

    .line 29
    .line 30
    const-string v5, "Software"

    .line 31
    .line 32
    invoke-direct {v2, v5, v3, v4}, Lcom/momo/xeengine/gift/GiftPlayerType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v2, Lcom/momo/xeengine/gift/GiftPlayerType;->Software:Lcom/momo/xeengine/gift/GiftPlayerType;

    .line 36
    .line 37
    filled-new-array {v0, v1, v2}, [Lcom/momo/xeengine/gift/GiftPlayerType;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sput-object v0, Lcom/momo/xeengine/gift/GiftPlayerType;->$VALUES:[Lcom/momo/xeengine/gift/GiftPlayerType;

    .line 42
    .line 43
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/momo/xeengine/gift/GiftPlayerType;->value:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static fromString(Ljava/lang/String;)Lcom/momo/xeengine/gift/GiftPlayerType;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string v0, "auto"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    const-string v0, "software"

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-nez p0, :cond_0

    .line 19
    .line 20
    sget-object p0, Lcom/momo/xeengine/gift/GiftPlayerType;->Hardware:Lcom/momo/xeengine/gift/GiftPlayerType;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_0
    sget-object p0, Lcom/momo/xeengine/gift/GiftPlayerType;->Software:Lcom/momo/xeengine/gift/GiftPlayerType;

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_1
    sget-object p0, Lcom/momo/xeengine/gift/GiftPlayerType;->Auto:Lcom/momo/xeengine/gift/GiftPlayerType;

    .line 27
    .line 28
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/momo/xeengine/gift/GiftPlayerType;
    .locals 1

    .line 1
    const-class v0, Lcom/momo/xeengine/gift/GiftPlayerType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/momo/xeengine/gift/GiftPlayerType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/momo/xeengine/gift/GiftPlayerType;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/xeengine/gift/GiftPlayerType;->$VALUES:[Lcom/momo/xeengine/gift/GiftPlayerType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/momo/xeengine/gift/GiftPlayerType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/momo/xeengine/gift/GiftPlayerType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getValue()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayerType;->value:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
