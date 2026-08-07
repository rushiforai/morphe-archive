.class public final enum Lcom/immomo/medialog/LogLevel;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/immomo/medialog/LogLevel;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/immomo/medialog/LogLevel;

.field public static final enum ERROR:Lcom/immomo/medialog/LogLevel;

.field public static final enum FATAL:Lcom/immomo/medialog/LogLevel;

.field public static final enum INFO:Lcom/immomo/medialog/LogLevel;


# instance fields
.field private value:I


# direct methods
.method private static synthetic $values()[Lcom/immomo/medialog/LogLevel;
    .locals 3

    .line 1
    sget-object v0, Lcom/immomo/medialog/LogLevel;->INFO:Lcom/immomo/medialog/LogLevel;

    .line 2
    .line 3
    sget-object v1, Lcom/immomo/medialog/LogLevel;->ERROR:Lcom/immomo/medialog/LogLevel;

    .line 4
    .line 5
    sget-object v2, Lcom/immomo/medialog/LogLevel;->FATAL:Lcom/immomo/medialog/LogLevel;

    .line 6
    .line 7
    filled-new-array {v0, v1, v2}, [Lcom/immomo/medialog/LogLevel;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/immomo/medialog/LogLevel;

    .line 2
    .line 3
    const-string v1, "INFO"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {v0, v1, v2, v3}, Lcom/immomo/medialog/LogLevel;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/immomo/medialog/LogLevel;->INFO:Lcom/immomo/medialog/LogLevel;

    .line 11
    .line 12
    new-instance v0, Lcom/immomo/medialog/LogLevel;

    .line 13
    .line 14
    const-string v1, "ERROR"

    .line 15
    .line 16
    const/4 v2, 0x2

    .line 17
    invoke-direct {v0, v1, v3, v2}, Lcom/immomo/medialog/LogLevel;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/immomo/medialog/LogLevel;->ERROR:Lcom/immomo/medialog/LogLevel;

    .line 21
    .line 22
    new-instance v0, Lcom/immomo/medialog/LogLevel;

    .line 23
    .line 24
    const-string v1, "FATAL"

    .line 25
    .line 26
    const/4 v3, 0x3

    .line 27
    invoke-direct {v0, v1, v2, v3}, Lcom/immomo/medialog/LogLevel;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v0, Lcom/immomo/medialog/LogLevel;->FATAL:Lcom/immomo/medialog/LogLevel;

    .line 31
    .line 32
    invoke-static {}, Lcom/immomo/medialog/LogLevel;->$values()[Lcom/immomo/medialog/LogLevel;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sput-object v0, Lcom/immomo/medialog/LogLevel;->$VALUES:[Lcom/immomo/medialog/LogLevel;

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
    iput p3, p0, Lcom/immomo/medialog/LogLevel;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lcom/immomo/medialog/LogLevel;
    .locals 5

    .line 1
    invoke-static {}, Lcom/immomo/medialog/LogLevel;->values()[Lcom/immomo/medialog/LogLevel;

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
    invoke-virtual {v3}, Lcom/immomo/medialog/LogLevel;->value()I

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
    sget-object p0, Lcom/immomo/medialog/LogLevel;->INFO:Lcom/immomo/medialog/LogLevel;

    .line 22
    .line 23
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/immomo/medialog/LogLevel;
    .locals 1

    .line 1
    const-class v0, Lcom/immomo/medialog/LogLevel;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/immomo/medialog/LogLevel;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/immomo/medialog/LogLevel;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/medialog/LogLevel;->$VALUES:[Lcom/immomo/medialog/LogLevel;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/immomo/medialog/LogLevel;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/immomo/medialog/LogLevel;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/medialog/LogLevel;->value:I

    .line 2
    .line 3
    return p0
.end method
