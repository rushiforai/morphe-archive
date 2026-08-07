.class public final enum Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\u0008\n\u0002\u0008\u0012\u0008\u0086\u0081\u0002\u0018\u0000 \t2\u0008\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\nB\u0011\u0008\u0002\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0003\u0010\u0006\u001a\u0004\u0008\u0007\u0010\u0008j\u0002\u0008\u000bj\u0002\u0008\u000cj\u0002\u0008\rj\u0002\u0008\u000ej\u0002\u0008\u000fj\u0002\u0008\u0010j\u0002\u0008\u0011j\u0002\u0008\u0012j\u0002\u0008\u0013\u00a8\u0006\u0014"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;",
        "",
        "",
        "operatorValue",
        "<init>",
        "(Ljava/lang/String;II)V",
        "I",
        "getOperatorValue",
        "()I",
        "Companion",
        "a",
        "GreaterThan",
        "Equals",
        "LessThan",
        "Contains",
        "Between",
        "NotEquals",
        "Set",
        "NotSet",
        "NotContains",
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

.field private static final synthetic $VALUES:[Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

.field public static final enum Between:Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

.field public static final Companion:Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final enum Contains:Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

.field public static final enum Equals:Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

.field public static final enum GreaterThan:Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

.field public static final enum LessThan:Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

.field public static final enum NotContains:Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

.field public static final enum NotEquals:Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

.field public static final enum NotSet:Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

.field public static final enum Set:Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;


# instance fields
.field private final operatorValue:I


# direct methods
.method private static final synthetic $values()[Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;
    .locals 9

    sget-object v0, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;->GreaterThan:Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    sget-object v1, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;->Equals:Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    sget-object v2, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;->LessThan:Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    sget-object v3, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;->Contains:Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    sget-object v4, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;->Between:Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    sget-object v5, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;->NotEquals:Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    sget-object v6, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;->Set:Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    sget-object v7, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;->NotSet:Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    sget-object v8, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;->NotContains:Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    filled-new-array/range {v0 .. v8}, [Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    .line 2
    .line 3
    const-string v1, "GreaterThan"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;->GreaterThan:Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    .line 10
    .line 11
    new-instance v0, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    .line 12
    .line 13
    const-string v1, "Equals"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2, v2}, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;->Equals:Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    .line 20
    .line 21
    new-instance v0, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    .line 22
    .line 23
    const-string v1, "LessThan"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2, v2}, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;->LessThan:Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    .line 30
    .line 31
    new-instance v0, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    .line 32
    .line 33
    const-string v1, "Contains"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2, v2}, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;-><init>(Ljava/lang/String;II)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;->Contains:Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    .line 40
    .line 41
    new-instance v0, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    .line 42
    .line 43
    const-string v1, "Between"

    .line 44
    .line 45
    const/4 v2, 0x4

    .line 46
    invoke-direct {v0, v1, v2, v2}, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;-><init>(Ljava/lang/String;II)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;->Between:Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    .line 50
    .line 51
    new-instance v0, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    .line 52
    .line 53
    const/4 v1, 0x5

    .line 54
    const/16 v2, 0xf

    .line 55
    .line 56
    const-string v3, "NotEquals"

    .line 57
    .line 58
    invoke-direct {v0, v3, v1, v2}, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;-><init>(Ljava/lang/String;II)V

    .line 59
    .line 60
    .line 61
    sput-object v0, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;->NotEquals:Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    .line 62
    .line 63
    new-instance v0, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    .line 64
    .line 65
    const/4 v1, 0x6

    .line 66
    const/16 v2, 0x1a

    .line 67
    .line 68
    const-string v3, "Set"

    .line 69
    .line 70
    invoke-direct {v0, v3, v1, v2}, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;-><init>(Ljava/lang/String;II)V

    .line 71
    .line 72
    .line 73
    sput-object v0, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;->Set:Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    .line 74
    .line 75
    new-instance v0, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    .line 76
    .line 77
    const/4 v1, 0x7

    .line 78
    const/16 v2, 0x1b

    .line 79
    .line 80
    const-string v3, "NotSet"

    .line 81
    .line 82
    invoke-direct {v0, v3, v1, v2}, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;-><init>(Ljava/lang/String;II)V

    .line 83
    .line 84
    .line 85
    sput-object v0, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;->NotSet:Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    .line 86
    .line 87
    new-instance v0, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    .line 88
    .line 89
    const/16 v1, 0x8

    .line 90
    .line 91
    const/16 v2, 0x1c

    .line 92
    .line 93
    const-string v3, "NotContains"

    .line 94
    .line 95
    invoke-direct {v0, v3, v1, v2}, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;-><init>(Ljava/lang/String;II)V

    .line 96
    .line 97
    .line 98
    sput-object v0, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;->NotContains:Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    .line 99
    .line 100
    invoke-static {}, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;->$values()[Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    sput-object v0, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;->$VALUES:[Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    .line 105
    .line 106
    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->a([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    sput-object v0, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;->$ENTRIES:Lkotlin/enums/EnumEntries;

    .line 111
    .line 112
    new-instance v0, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator$a;

    .line 113
    .line 114
    const/4 v1, 0x0

    .line 115
    invoke-direct {v0, v1}, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 116
    .line 117
    .line 118
    sput-object v0, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;->Companion:Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator$a;

    .line 119
    .line 120
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
    iput p3, p0, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;->operatorValue:I

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
            "Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    sget-object v0, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;
    .locals 1

    .line 1
    const-class v0, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;
    .locals 1

    .line 1
    sget-object v0, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;->$VALUES:[Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final getOperatorValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/clevertap/android/sdk/inapp/evaluation/TriggerOperator;->operatorValue:I

    .line 2
    .line 3
    return p0
.end method
