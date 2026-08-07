.class public final enum Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ErrorReason"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\n\u0008\u0086\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u0011\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0008\u0010\u000c\u001a\u00020\u0003H\u0016R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007j\u0002\u0008\u0008j\u0002\u0008\tj\u0002\u0008\nj\u0002\u0008\u000b\u00a8\u0006\r"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;",
        "",
        "message",
        "",
        "<init>",
        "(Ljava/lang/String;ILjava/lang/String;)V",
        "getMessage",
        "()Ljava/lang/String;",
        "NOT_FOUND_IN_DB",
        "STORE_NOT_INITIALIZED",
        "DB_SAVE_FAILED",
        "UNKNOWN",
        "toString",
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

.field private static final synthetic $VALUES:[Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;

.field public static final enum DB_SAVE_FAILED:Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;

.field public static final enum NOT_FOUND_IN_DB:Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;

.field public static final enum STORE_NOT_INITIALIZED:Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;

.field public static final enum UNKNOWN:Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;


# instance fields
.field private final message:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method private static final synthetic $values()[Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;
    .locals 4

    sget-object v0, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;->NOT_FOUND_IN_DB:Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;

    sget-object v1, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;->STORE_NOT_INITIALIZED:Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;

    sget-object v2, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;->DB_SAVE_FAILED:Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;

    sget-object v3, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;->UNKNOWN:Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;

    filled-new-array {v0, v1, v2, v3}, [Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "Delayed in-app not found in database"

    .line 5
    .line 6
    const-string v3, "NOT_FOUND_IN_DB"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;->NOT_FOUND_IN_DB:Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;

    .line 12
    .line 13
    new-instance v0, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    const-string v2, "DelayedLegacyInAppStore is not initialized"

    .line 17
    .line 18
    const-string v3, "STORE_NOT_INITIALIZED"

    .line 19
    .line 20
    invoke-direct {v0, v3, v1, v2}, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;->STORE_NOT_INITIALIZED:Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;

    .line 24
    .line 25
    new-instance v0, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;

    .line 26
    .line 27
    const/4 v1, 0x2

    .line 28
    const-string v2, "Failed to save delayed in-app to database"

    .line 29
    .line 30
    const-string v3, "DB_SAVE_FAILED"

    .line 31
    .line 32
    invoke-direct {v0, v3, v1, v2}, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;->DB_SAVE_FAILED:Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;

    .line 36
    .line 37
    new-instance v0, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;

    .line 38
    .line 39
    const/4 v1, 0x3

    .line 40
    const-string v2, "Unknown error occurred"

    .line 41
    .line 42
    const-string v3, "UNKNOWN"

    .line 43
    .line 44
    invoke-direct {v0, v3, v1, v2}, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    sput-object v0, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;->UNKNOWN:Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;

    .line 48
    .line 49
    invoke-static {}, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;->$values()[Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    sput-object v0, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;->$VALUES:[Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;

    .line 54
    .line 55
    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->a([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    sput-object v0, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;->$ENTRIES:Lkotlin/enums/EnumEntries;

    .line 60
    .line 61
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
    iput-object p3, p0, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;->message:Ljava/lang/String;

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
            "Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    sget-object v0, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;
    .locals 1

    .line 1
    const-class v0, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;
    .locals 1

    .line 1
    sget-object v0, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;->$VALUES:[Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final getMessage()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;->message:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult$Error$ErrorReason;->message:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
