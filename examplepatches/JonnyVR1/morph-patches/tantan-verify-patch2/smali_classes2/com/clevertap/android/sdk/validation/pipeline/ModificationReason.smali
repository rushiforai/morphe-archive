.class public final enum Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\u0005\u0008\u0086\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003j\u0002\u0008\u0004j\u0002\u0008\u0005\u00a8\u0006\u0006"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;",
        "",
        "<init>",
        "(Ljava/lang/String;I)V",
        "INVALID_CHARACTERS_REMOVED",
        "TRUNCATED_TO_MAX_LENGTH",
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

.field private static final synthetic $VALUES:[Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;

.field public static final enum INVALID_CHARACTERS_REMOVED:Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;

.field public static final enum TRUNCATED_TO_MAX_LENGTH:Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;


# direct methods
.method private static final synthetic $values()[Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;
    .locals 2

    sget-object v0, Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;->INVALID_CHARACTERS_REMOVED:Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;

    sget-object v1, Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;->TRUNCATED_TO_MAX_LENGTH:Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;

    filled-new-array {v0, v1}, [Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;

    .line 2
    .line 3
    const-string v1, "INVALID_CHARACTERS_REMOVED"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;->INVALID_CHARACTERS_REMOVED:Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;

    .line 10
    .line 11
    new-instance v0, Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;

    .line 12
    .line 13
    const-string v1, "TRUNCATED_TO_MAX_LENGTH"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;->TRUNCATED_TO_MAX_LENGTH:Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;

    .line 20
    .line 21
    invoke-static {}, Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;->$values()[Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;->$VALUES:[Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;

    .line 26
    .line 27
    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->a([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sput-object v0, Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;->$ENTRIES:Lkotlin/enums/EnumEntries;

    .line 32
    .line 33
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getEntries()Lkotlin/enums/EnumEntries;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/enums/EnumEntries<",
            "Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    sget-object v0, Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;
    .locals 1

    .line 1
    const-class v0, Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;
    .locals 1

    .line 1
    sget-object v0, Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;->$VALUES:[Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;

    .line 8
    .line 9
    return-object v0
.end method
