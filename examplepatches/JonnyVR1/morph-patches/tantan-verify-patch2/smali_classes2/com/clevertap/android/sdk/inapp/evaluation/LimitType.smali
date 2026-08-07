.class public final enum Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/clevertap/android/sdk/inapp/evaluation/LimitType$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\u000e\n\u0002\u0008\u0012\u0008\u0086\u0081\u0002\u0018\u0000 \t2\u0008\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\nB\u0011\u0008\u0002\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0003\u0010\u0006\u001a\u0004\u0008\u0007\u0010\u0008j\u0002\u0008\u000bj\u0002\u0008\u000cj\u0002\u0008\rj\u0002\u0008\u000ej\u0002\u0008\u000fj\u0002\u0008\u0010j\u0002\u0008\u0011j\u0002\u0008\u0012j\u0002\u0008\u0013\u00a8\u0006\u0014"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;",
        "",
        "",
        "type",
        "<init>",
        "(Ljava/lang/String;ILjava/lang/String;)V",
        "Ljava/lang/String;",
        "getType",
        "()Ljava/lang/String;",
        "Companion",
        "a",
        "Ever",
        "Session",
        "Seconds",
        "Minutes",
        "Hours",
        "Days",
        "Weeks",
        "OnEvery",
        "OnExactly",
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

.field private static final synthetic $VALUES:[Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

.field public static final Companion:Lcom/clevertap/android/sdk/inapp/evaluation/LimitType$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final enum Days:Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

.field public static final enum Ever:Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

.field public static final enum Hours:Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

.field public static final enum Minutes:Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

.field public static final enum OnEvery:Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

.field public static final enum OnExactly:Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

.field public static final enum Seconds:Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

.field public static final enum Session:Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

.field public static final enum Weeks:Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;


# instance fields
.field private final type:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method private static final synthetic $values()[Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;
    .locals 9

    sget-object v0, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;->Ever:Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    sget-object v1, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;->Session:Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    sget-object v2, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;->Seconds:Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    sget-object v3, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;->Minutes:Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    sget-object v4, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;->Hours:Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    sget-object v5, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;->Days:Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    sget-object v6, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;->Weeks:Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    sget-object v7, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;->OnEvery:Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    sget-object v8, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;->OnExactly:Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    filled-new-array/range {v0 .. v8}, [Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "ever"

    .line 5
    .line 6
    const-string v3, "Ever"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;->Ever:Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    .line 12
    .line 13
    new-instance v0, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    const-string v2, "session"

    .line 17
    .line 18
    const-string v3, "Session"

    .line 19
    .line 20
    invoke-direct {v0, v3, v1, v2}, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;->Session:Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    .line 24
    .line 25
    new-instance v0, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    .line 26
    .line 27
    const/4 v1, 0x2

    .line 28
    const-string v2, "seconds"

    .line 29
    .line 30
    const-string v3, "Seconds"

    .line 31
    .line 32
    invoke-direct {v0, v3, v1, v2}, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;->Seconds:Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    .line 36
    .line 37
    new-instance v0, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    .line 38
    .line 39
    const/4 v1, 0x3

    .line 40
    const-string v2, "minutes"

    .line 41
    .line 42
    const-string v3, "Minutes"

    .line 43
    .line 44
    invoke-direct {v0, v3, v1, v2}, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    sput-object v0, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;->Minutes:Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    .line 48
    .line 49
    new-instance v0, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    .line 50
    .line 51
    const/4 v1, 0x4

    .line 52
    const-string v2, "hours"

    .line 53
    .line 54
    const-string v3, "Hours"

    .line 55
    .line 56
    invoke-direct {v0, v3, v1, v2}, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;->Hours:Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    .line 60
    .line 61
    new-instance v0, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    .line 62
    .line 63
    const/4 v1, 0x5

    .line 64
    const-string v2, "days"

    .line 65
    .line 66
    const-string v3, "Days"

    .line 67
    .line 68
    invoke-direct {v0, v3, v1, v2}, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 69
    .line 70
    .line 71
    sput-object v0, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;->Days:Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    .line 72
    .line 73
    new-instance v0, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    .line 74
    .line 75
    const/4 v1, 0x6

    .line 76
    const-string v2, "weeks"

    .line 77
    .line 78
    const-string v3, "Weeks"

    .line 79
    .line 80
    invoke-direct {v0, v3, v1, v2}, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 81
    .line 82
    .line 83
    sput-object v0, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;->Weeks:Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    .line 84
    .line 85
    new-instance v0, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    .line 86
    .line 87
    const/4 v1, 0x7

    .line 88
    const-string v2, "onEvery"

    .line 89
    .line 90
    const-string v3, "OnEvery"

    .line 91
    .line 92
    invoke-direct {v0, v3, v1, v2}, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 93
    .line 94
    .line 95
    sput-object v0, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;->OnEvery:Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    .line 96
    .line 97
    new-instance v0, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    .line 98
    .line 99
    const/16 v1, 0x8

    .line 100
    .line 101
    const-string v2, "onExactly"

    .line 102
    .line 103
    const-string v3, "OnExactly"

    .line 104
    .line 105
    invoke-direct {v0, v3, v1, v2}, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 106
    .line 107
    .line 108
    sput-object v0, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;->OnExactly:Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    .line 109
    .line 110
    invoke-static {}, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;->$values()[Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    sput-object v0, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;->$VALUES:[Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    .line 115
    .line 116
    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->a([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    sput-object v0, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;->$ENTRIES:Lkotlin/enums/EnumEntries;

    .line 121
    .line 122
    new-instance v0, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType$a;

    .line 123
    .line 124
    const/4 v1, 0x0

    .line 125
    invoke-direct {v0, v1}, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 126
    .line 127
    .line 128
    sput-object v0, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;->Companion:Lcom/clevertap/android/sdk/inapp/evaluation/LimitType$a;

    .line 129
    .line 130
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
    iput-object p3, p0, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;->type:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static getEntries()Lkotlin/enums/EnumEntries;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/enums/EnumEntries<",
            "Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    sget-object v0, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;
    .locals 1

    .line 1
    const-class v0, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;
    .locals 1

    .line 1
    sget-object v0, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;->$VALUES:[Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final getType()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;->type:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
