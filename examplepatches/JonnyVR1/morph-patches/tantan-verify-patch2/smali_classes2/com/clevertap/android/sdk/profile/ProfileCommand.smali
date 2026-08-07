.class public final enum Lcom/clevertap/android/sdk/profile/ProfileCommand;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/clevertap/android/sdk/profile/ProfileCommand;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\r\u0008\u0080\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u0019\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bj\u0002\u0008\u000cj\u0002\u0008\rj\u0002\u0008\u000ej\u0002\u0008\u000fj\u0002\u0008\u0010j\u0002\u0008\u0011\u00a8\u0006\u0012"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/profile/ProfileCommand;",
        "",
        "commandString",
        "",
        "operation",
        "Lcom/clevertap/android/sdk/profile/traversal/ProfileOperation;",
        "<init>",
        "(Ljava/lang/String;ILjava/lang/String;Lcom/clevertap/android/sdk/profile/traversal/ProfileOperation;)V",
        "getCommandString",
        "()Ljava/lang/String;",
        "getOperation",
        "()Lcom/clevertap/android/sdk/profile/traversal/ProfileOperation;",
        "SET",
        "ADD",
        "REMOVE",
        "DELETE",
        "INCREMENT",
        "DECREMENT",
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

.field private static final synthetic $VALUES:[Lcom/clevertap/android/sdk/profile/ProfileCommand;

.field public static final enum ADD:Lcom/clevertap/android/sdk/profile/ProfileCommand;

.field public static final enum DECREMENT:Lcom/clevertap/android/sdk/profile/ProfileCommand;

.field public static final enum DELETE:Lcom/clevertap/android/sdk/profile/ProfileCommand;

.field public static final enum INCREMENT:Lcom/clevertap/android/sdk/profile/ProfileCommand;

.field public static final enum REMOVE:Lcom/clevertap/android/sdk/profile/ProfileCommand;

.field public static final enum SET:Lcom/clevertap/android/sdk/profile/ProfileCommand;


# instance fields
.field private final commandString:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final operation:Lcom/clevertap/android/sdk/profile/traversal/ProfileOperation;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method private static final synthetic $values()[Lcom/clevertap/android/sdk/profile/ProfileCommand;
    .locals 6

    sget-object v0, Lcom/clevertap/android/sdk/profile/ProfileCommand;->SET:Lcom/clevertap/android/sdk/profile/ProfileCommand;

    sget-object v1, Lcom/clevertap/android/sdk/profile/ProfileCommand;->ADD:Lcom/clevertap/android/sdk/profile/ProfileCommand;

    sget-object v2, Lcom/clevertap/android/sdk/profile/ProfileCommand;->REMOVE:Lcom/clevertap/android/sdk/profile/ProfileCommand;

    sget-object v3, Lcom/clevertap/android/sdk/profile/ProfileCommand;->DELETE:Lcom/clevertap/android/sdk/profile/ProfileCommand;

    sget-object v4, Lcom/clevertap/android/sdk/profile/ProfileCommand;->INCREMENT:Lcom/clevertap/android/sdk/profile/ProfileCommand;

    sget-object v5, Lcom/clevertap/android/sdk/profile/ProfileCommand;->DECREMENT:Lcom/clevertap/android/sdk/profile/ProfileCommand;

    filled-new-array/range {v0 .. v5}, [Lcom/clevertap/android/sdk/profile/ProfileCommand;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/clevertap/android/sdk/profile/ProfileCommand;

    .line 2
    .line 3
    const-string v1, "$set"

    .line 4
    .line 5
    sget-object v2, Lcom/clevertap/android/sdk/profile/traversal/ProfileOperation;->UPDATE:Lcom/clevertap/android/sdk/profile/traversal/ProfileOperation;

    .line 6
    .line 7
    const-string v3, "SET"

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/clevertap/android/sdk/profile/ProfileCommand;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/clevertap/android/sdk/profile/traversal/ProfileOperation;)V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/clevertap/android/sdk/profile/ProfileCommand;->SET:Lcom/clevertap/android/sdk/profile/ProfileCommand;

    .line 14
    .line 15
    new-instance v0, Lcom/clevertap/android/sdk/profile/ProfileCommand;

    .line 16
    .line 17
    const-string v1, "$add"

    .line 18
    .line 19
    sget-object v2, Lcom/clevertap/android/sdk/profile/traversal/ProfileOperation;->ARRAY_ADD:Lcom/clevertap/android/sdk/profile/traversal/ProfileOperation;

    .line 20
    .line 21
    const-string v3, "ADD"

    .line 22
    .line 23
    const/4 v4, 0x1

    .line 24
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/clevertap/android/sdk/profile/ProfileCommand;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/clevertap/android/sdk/profile/traversal/ProfileOperation;)V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lcom/clevertap/android/sdk/profile/ProfileCommand;->ADD:Lcom/clevertap/android/sdk/profile/ProfileCommand;

    .line 28
    .line 29
    new-instance v0, Lcom/clevertap/android/sdk/profile/ProfileCommand;

    .line 30
    .line 31
    const-string v1, "$remove"

    .line 32
    .line 33
    sget-object v2, Lcom/clevertap/android/sdk/profile/traversal/ProfileOperation;->ARRAY_REMOVE:Lcom/clevertap/android/sdk/profile/traversal/ProfileOperation;

    .line 34
    .line 35
    const-string v3, "REMOVE"

    .line 36
    .line 37
    const/4 v4, 0x2

    .line 38
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/clevertap/android/sdk/profile/ProfileCommand;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/clevertap/android/sdk/profile/traversal/ProfileOperation;)V

    .line 39
    .line 40
    .line 41
    sput-object v0, Lcom/clevertap/android/sdk/profile/ProfileCommand;->REMOVE:Lcom/clevertap/android/sdk/profile/ProfileCommand;

    .line 42
    .line 43
    new-instance v0, Lcom/clevertap/android/sdk/profile/ProfileCommand;

    .line 44
    .line 45
    const-string v1, "$delete"

    .line 46
    .line 47
    sget-object v2, Lcom/clevertap/android/sdk/profile/traversal/ProfileOperation;->DELETE:Lcom/clevertap/android/sdk/profile/traversal/ProfileOperation;

    .line 48
    .line 49
    const-string v3, "DELETE"

    .line 50
    .line 51
    const/4 v4, 0x3

    .line 52
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/clevertap/android/sdk/profile/ProfileCommand;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/clevertap/android/sdk/profile/traversal/ProfileOperation;)V

    .line 53
    .line 54
    .line 55
    sput-object v0, Lcom/clevertap/android/sdk/profile/ProfileCommand;->DELETE:Lcom/clevertap/android/sdk/profile/ProfileCommand;

    .line 56
    .line 57
    new-instance v0, Lcom/clevertap/android/sdk/profile/ProfileCommand;

    .line 58
    .line 59
    const-string v1, "$incr"

    .line 60
    .line 61
    sget-object v2, Lcom/clevertap/android/sdk/profile/traversal/ProfileOperation;->INCREMENT:Lcom/clevertap/android/sdk/profile/traversal/ProfileOperation;

    .line 62
    .line 63
    const-string v3, "INCREMENT"

    .line 64
    .line 65
    const/4 v4, 0x4

    .line 66
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/clevertap/android/sdk/profile/ProfileCommand;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/clevertap/android/sdk/profile/traversal/ProfileOperation;)V

    .line 67
    .line 68
    .line 69
    sput-object v0, Lcom/clevertap/android/sdk/profile/ProfileCommand;->INCREMENT:Lcom/clevertap/android/sdk/profile/ProfileCommand;

    .line 70
    .line 71
    new-instance v0, Lcom/clevertap/android/sdk/profile/ProfileCommand;

    .line 72
    .line 73
    const-string v1, "$decr"

    .line 74
    .line 75
    sget-object v2, Lcom/clevertap/android/sdk/profile/traversal/ProfileOperation;->DECREMENT:Lcom/clevertap/android/sdk/profile/traversal/ProfileOperation;

    .line 76
    .line 77
    const-string v3, "DECREMENT"

    .line 78
    .line 79
    const/4 v4, 0x5

    .line 80
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/clevertap/android/sdk/profile/ProfileCommand;-><init>(Ljava/lang/String;ILjava/lang/String;Lcom/clevertap/android/sdk/profile/traversal/ProfileOperation;)V

    .line 81
    .line 82
    .line 83
    sput-object v0, Lcom/clevertap/android/sdk/profile/ProfileCommand;->DECREMENT:Lcom/clevertap/android/sdk/profile/ProfileCommand;

    .line 84
    .line 85
    invoke-static {}, Lcom/clevertap/android/sdk/profile/ProfileCommand;->$values()[Lcom/clevertap/android/sdk/profile/ProfileCommand;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    sput-object v0, Lcom/clevertap/android/sdk/profile/ProfileCommand;->$VALUES:[Lcom/clevertap/android/sdk/profile/ProfileCommand;

    .line 90
    .line 91
    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->a([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    sput-object v0, Lcom/clevertap/android/sdk/profile/ProfileCommand;->$ENTRIES:Lkotlin/enums/EnumEntries;

    .line 96
    .line 97
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Lcom/clevertap/android/sdk/profile/traversal/ProfileOperation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/clevertap/android/sdk/profile/traversal/ProfileOperation;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/clevertap/android/sdk/profile/ProfileCommand;->commandString:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p4, p0, Lcom/clevertap/android/sdk/profile/ProfileCommand;->operation:Lcom/clevertap/android/sdk/profile/traversal/ProfileOperation;

    .line 7
    .line 8
    return-void
.end method

.method public static getEntries()Lkotlin/enums/EnumEntries;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/enums/EnumEntries<",
            "Lcom/clevertap/android/sdk/profile/ProfileCommand;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    sget-object v0, Lcom/clevertap/android/sdk/profile/ProfileCommand;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/clevertap/android/sdk/profile/ProfileCommand;
    .locals 1

    .line 1
    const-class v0, Lcom/clevertap/android/sdk/profile/ProfileCommand;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/clevertap/android/sdk/profile/ProfileCommand;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/clevertap/android/sdk/profile/ProfileCommand;
    .locals 1

    .line 1
    sget-object v0, Lcom/clevertap/android/sdk/profile/ProfileCommand;->$VALUES:[Lcom/clevertap/android/sdk/profile/ProfileCommand;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/clevertap/android/sdk/profile/ProfileCommand;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final getCommandString()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/profile/ProfileCommand;->commandString:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getOperation()Lcom/clevertap/android/sdk/profile/traversal/ProfileOperation;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/profile/ProfileCommand;->operation:Lcom/clevertap/android/sdk/profile/traversal/ProfileOperation;

    .line 2
    .line 3
    return-object p0
.end method
