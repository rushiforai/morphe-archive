.class public final enum Lcom/clevertap/android/sdk/network/EndpointId;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/clevertap/android/sdk/network/EndpointId$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/clevertap/android/sdk/network/EndpointId;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\u000e\n\u0002\u0008\r\u0008\u0086\u0081\u0002\u0018\u0000 \t2\u0008\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\nB\u0011\u0008\u0002\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0003\u0010\u0006\u001a\u0004\u0008\u0007\u0010\u0008j\u0002\u0008\u000bj\u0002\u0008\u000cj\u0002\u0008\rj\u0002\u0008\u000e\u00a8\u0006\u000f"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/network/EndpointId;",
        "",
        "",
        "identifier",
        "<init>",
        "(Ljava/lang/String;ILjava/lang/String;)V",
        "Ljava/lang/String;",
        "getIdentifier",
        "()Ljava/lang/String;",
        "Companion",
        "a",
        "ENDPOINT_SPIKY",
        "ENDPOINT_A1",
        "ENDPOINT_HELLO",
        "ENDPOINT_DEFINE_VARS",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final synthetic $ENTRIES:Lkotlin/enums/EnumEntries;

.field private static final synthetic $VALUES:[Lcom/clevertap/android/sdk/network/EndpointId;

.field public static final Companion:Lcom/clevertap/android/sdk/network/EndpointId$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final enum ENDPOINT_A1:Lcom/clevertap/android/sdk/network/EndpointId;

.field public static final enum ENDPOINT_DEFINE_VARS:Lcom/clevertap/android/sdk/network/EndpointId;

.field public static final enum ENDPOINT_HELLO:Lcom/clevertap/android/sdk/network/EndpointId;

.field public static final enum ENDPOINT_SPIKY:Lcom/clevertap/android/sdk/network/EndpointId;


# instance fields
.field private final identifier:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method private static final synthetic $values()[Lcom/clevertap/android/sdk/network/EndpointId;
    .locals 4

    sget-object v0, Lcom/clevertap/android/sdk/network/EndpointId;->ENDPOINT_SPIKY:Lcom/clevertap/android/sdk/network/EndpointId;

    sget-object v1, Lcom/clevertap/android/sdk/network/EndpointId;->ENDPOINT_A1:Lcom/clevertap/android/sdk/network/EndpointId;

    sget-object v2, Lcom/clevertap/android/sdk/network/EndpointId;->ENDPOINT_HELLO:Lcom/clevertap/android/sdk/network/EndpointId;

    sget-object v3, Lcom/clevertap/android/sdk/network/EndpointId;->ENDPOINT_DEFINE_VARS:Lcom/clevertap/android/sdk/network/EndpointId;

    filled-new-array {v0, v1, v2, v3}, [Lcom/clevertap/android/sdk/network/EndpointId;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/clevertap/android/sdk/network/EndpointId;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "-spiky"

    .line 5
    .line 6
    const-string v3, "ENDPOINT_SPIKY"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/clevertap/android/sdk/network/EndpointId;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/clevertap/android/sdk/network/EndpointId;->ENDPOINT_SPIKY:Lcom/clevertap/android/sdk/network/EndpointId;

    .line 12
    .line 13
    new-instance v0, Lcom/clevertap/android/sdk/network/EndpointId;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    const-string v2, "/a1"

    .line 17
    .line 18
    const-string v3, "ENDPOINT_A1"

    .line 19
    .line 20
    invoke-direct {v0, v3, v1, v2}, Lcom/clevertap/android/sdk/network/EndpointId;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lcom/clevertap/android/sdk/network/EndpointId;->ENDPOINT_A1:Lcom/clevertap/android/sdk/network/EndpointId;

    .line 24
    .line 25
    new-instance v0, Lcom/clevertap/android/sdk/network/EndpointId;

    .line 26
    .line 27
    const/4 v1, 0x2

    .line 28
    const-string v2, "/hello"

    .line 29
    .line 30
    const-string v3, "ENDPOINT_HELLO"

    .line 31
    .line 32
    invoke-direct {v0, v3, v1, v2}, Lcom/clevertap/android/sdk/network/EndpointId;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lcom/clevertap/android/sdk/network/EndpointId;->ENDPOINT_HELLO:Lcom/clevertap/android/sdk/network/EndpointId;

    .line 36
    .line 37
    new-instance v0, Lcom/clevertap/android/sdk/network/EndpointId;

    .line 38
    .line 39
    const/4 v1, 0x3

    .line 40
    const-string v2, "/defineVars"

    .line 41
    .line 42
    const-string v3, "ENDPOINT_DEFINE_VARS"

    .line 43
    .line 44
    invoke-direct {v0, v3, v1, v2}, Lcom/clevertap/android/sdk/network/EndpointId;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    sput-object v0, Lcom/clevertap/android/sdk/network/EndpointId;->ENDPOINT_DEFINE_VARS:Lcom/clevertap/android/sdk/network/EndpointId;

    .line 48
    .line 49
    invoke-static {}, Lcom/clevertap/android/sdk/network/EndpointId;->$values()[Lcom/clevertap/android/sdk/network/EndpointId;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    sput-object v0, Lcom/clevertap/android/sdk/network/EndpointId;->$VALUES:[Lcom/clevertap/android/sdk/network/EndpointId;

    .line 54
    .line 55
    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->a([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    sput-object v0, Lcom/clevertap/android/sdk/network/EndpointId;->$ENTRIES:Lkotlin/enums/EnumEntries;

    .line 60
    .line 61
    new-instance v0, Lcom/clevertap/android/sdk/network/EndpointId$a;

    .line 62
    .line 63
    const/4 v1, 0x0

    .line 64
    invoke-direct {v0, v1}, Lcom/clevertap/android/sdk/network/EndpointId$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 65
    .line 66
    .line 67
    sput-object v0, Lcom/clevertap/android/sdk/network/EndpointId;->Companion:Lcom/clevertap/android/sdk/network/EndpointId$a;

    .line 68
    .line 69
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
    iput-object p3, p0, Lcom/clevertap/android/sdk/network/EndpointId;->identifier:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static final fromEventGroup(Lcom/clevertap/android/sdk/events/EventGroup;)Lcom/clevertap/android/sdk/network/EndpointId;
    .locals 1
    .param p0    # Lcom/clevertap/android/sdk/events/EventGroup;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    sget-object v0, Lcom/clevertap/android/sdk/network/EndpointId;->Companion:Lcom/clevertap/android/sdk/network/EndpointId$a;

    invoke-virtual {v0, p0}, Lcom/clevertap/android/sdk/network/EndpointId$a;->a(Lcom/clevertap/android/sdk/events/EventGroup;)Lcom/clevertap/android/sdk/network/EndpointId;

    move-result-object p0

    return-object p0
.end method

.method public static final fromString(Ljava/lang/String;)Lcom/clevertap/android/sdk/network/EndpointId;
    .locals 1
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    sget-object v0, Lcom/clevertap/android/sdk/network/EndpointId;->Companion:Lcom/clevertap/android/sdk/network/EndpointId$a;

    invoke-virtual {v0, p0}, Lcom/clevertap/android/sdk/network/EndpointId$a;->b(Ljava/lang/String;)Lcom/clevertap/android/sdk/network/EndpointId;

    move-result-object p0

    return-object p0
.end method

.method public static getEntries()Lkotlin/enums/EnumEntries;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/enums/EnumEntries<",
            "Lcom/clevertap/android/sdk/network/EndpointId;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    sget-object v0, Lcom/clevertap/android/sdk/network/EndpointId;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/clevertap/android/sdk/network/EndpointId;
    .locals 1

    .line 1
    const-class v0, Lcom/clevertap/android/sdk/network/EndpointId;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/clevertap/android/sdk/network/EndpointId;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/clevertap/android/sdk/network/EndpointId;
    .locals 1

    .line 1
    sget-object v0, Lcom/clevertap/android/sdk/network/EndpointId;->$VALUES:[Lcom/clevertap/android/sdk/network/EndpointId;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/clevertap/android/sdk/network/EndpointId;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final getIdentifier()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/EndpointId;->identifier:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
