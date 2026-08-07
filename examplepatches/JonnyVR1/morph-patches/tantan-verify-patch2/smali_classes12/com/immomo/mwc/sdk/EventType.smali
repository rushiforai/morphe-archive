.class public final enum Lcom/immomo/mwc/sdk/EventType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/immomo/mwc/sdk/EventType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/immomo/mwc/sdk/EventType;

.field public static final enum MK_CREATE:Lcom/immomo/mwc/sdk/EventType;

.field public static final enum MK_DESTROY:Lcom/immomo/mwc/sdk/EventType;

.field public static final enum MK_ONDRAW:Lcom/immomo/mwc/sdk/EventType;


# instance fields
.field public final value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Lcom/immomo/mwc/sdk/EventType;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "mk.create"

    .line 5
    .line 6
    const-string v3, "MK_CREATE"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/immomo/mwc/sdk/EventType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/immomo/mwc/sdk/EventType;->MK_CREATE:Lcom/immomo/mwc/sdk/EventType;

    .line 12
    .line 13
    new-instance v1, Lcom/immomo/mwc/sdk/EventType;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    const-string v3, "mk.ondraw"

    .line 17
    .line 18
    const-string v4, "MK_ONDRAW"

    .line 19
    .line 20
    invoke-direct {v1, v4, v2, v3}, Lcom/immomo/mwc/sdk/EventType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v1, Lcom/immomo/mwc/sdk/EventType;->MK_ONDRAW:Lcom/immomo/mwc/sdk/EventType;

    .line 24
    .line 25
    new-instance v2, Lcom/immomo/mwc/sdk/EventType;

    .line 26
    .line 27
    const/4 v3, 0x2

    .line 28
    const-string v4, "mk.destroy"

    .line 29
    .line 30
    const-string v5, "MK_DESTROY"

    .line 31
    .line 32
    invoke-direct {v2, v5, v3, v4}, Lcom/immomo/mwc/sdk/EventType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v2, Lcom/immomo/mwc/sdk/EventType;->MK_DESTROY:Lcom/immomo/mwc/sdk/EventType;

    .line 36
    .line 37
    filled-new-array {v0, v1, v2}, [Lcom/immomo/mwc/sdk/EventType;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sput-object v0, Lcom/immomo/mwc/sdk/EventType;->$VALUES:[Lcom/immomo/mwc/sdk/EventType;

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
    iput-object p3, p0, Lcom/immomo/mwc/sdk/EventType;->value:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static fromTypeName(Ljava/lang/String;)Lcom/immomo/mwc/sdk/EventType;
    .locals 5

    .line 1
    invoke-static {}, Lcom/immomo/mwc/sdk/EventType;->values()[Lcom/immomo/mwc/sdk/EventType;

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
    iget-object v4, v3, Lcom/immomo/mwc/sdk/EventType;->value:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    if-eqz v4, :cond_0

    .line 18
    .line 19
    return-object v3

    .line 20
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/immomo/mwc/sdk/EventType;
    .locals 1

    .line 1
    const-class v0, Lcom/immomo/mwc/sdk/EventType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/immomo/mwc/sdk/EventType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/immomo/mwc/sdk/EventType;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/mwc/sdk/EventType;->$VALUES:[Lcom/immomo/mwc/sdk/EventType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/immomo/mwc/sdk/EventType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/immomo/mwc/sdk/EventType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/mwc/sdk/EventType;->value:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
