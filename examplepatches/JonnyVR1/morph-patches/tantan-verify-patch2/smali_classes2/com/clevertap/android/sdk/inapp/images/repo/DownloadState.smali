.class public final enum Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\u0007\u0008\u0086\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003j\u0002\u0008\u0004j\u0002\u0008\u0005j\u0002\u0008\u0006j\u0002\u0008\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;",
        "",
        "<init>",
        "(Ljava/lang/String;I)V",
        "QUEUED",
        "IN_PROGRESS",
        "SUCCESSFUL",
        "FAILED",
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

.field private static final synthetic $VALUES:[Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;

.field public static final enum FAILED:Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;

.field public static final enum IN_PROGRESS:Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;

.field public static final enum QUEUED:Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;

.field public static final enum SUCCESSFUL:Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;


# direct methods
.method private static final synthetic $values()[Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;
    .locals 4

    sget-object v0, Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;->QUEUED:Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;

    sget-object v1, Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;->IN_PROGRESS:Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;

    sget-object v2, Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;->SUCCESSFUL:Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;

    sget-object v3, Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;->FAILED:Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;

    filled-new-array {v0, v1, v2, v3}, [Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;

    .line 2
    .line 3
    const-string v1, "QUEUED"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;->QUEUED:Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;

    .line 10
    .line 11
    new-instance v0, Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;

    .line 12
    .line 13
    const-string v1, "IN_PROGRESS"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;->IN_PROGRESS:Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;

    .line 20
    .line 21
    new-instance v0, Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;

    .line 22
    .line 23
    const-string v1, "SUCCESSFUL"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;->SUCCESSFUL:Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;

    .line 30
    .line 31
    new-instance v0, Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;

    .line 32
    .line 33
    const-string v1, "FAILED"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2}, Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;->FAILED:Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;

    .line 40
    .line 41
    invoke-static {}, Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;->$values()[Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sput-object v0, Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;->$VALUES:[Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;

    .line 46
    .line 47
    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->a([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    sput-object v0, Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;->$ENTRIES:Lkotlin/enums/EnumEntries;

    .line 52
    .line 53
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
            "Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    sget-object v0, Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;
    .locals 1

    .line 1
    const-class v0, Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;
    .locals 1

    .line 1
    sget-object v0, Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;->$VALUES:[Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/clevertap/android/sdk/inapp/images/repo/DownloadState;

    .line 8
    .line 9
    return-object v0
.end method
