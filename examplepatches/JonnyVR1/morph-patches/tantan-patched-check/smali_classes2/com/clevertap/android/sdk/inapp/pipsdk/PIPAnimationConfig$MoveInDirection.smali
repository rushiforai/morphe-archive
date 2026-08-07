.class public final enum Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MoveInDirection"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\u0007\u0008\u0086\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003j\u0002\u0008\u0004j\u0002\u0008\u0005j\u0002\u0008\u0006j\u0002\u0008\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;",
        "",
        "<init>",
        "(Ljava/lang/String;I)V",
        "LEFT",
        "RIGHT",
        "TOP",
        "BOTTOM",
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

.field private static final synthetic $VALUES:[Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;

.field public static final enum BOTTOM:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;

.field public static final enum LEFT:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;

.field public static final enum RIGHT:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;

.field public static final enum TOP:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;


# direct methods
.method private static final synthetic $values()[Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;
    .locals 4

    sget-object v0, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;->LEFT:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;

    sget-object v1, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;->RIGHT:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;

    sget-object v2, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;->TOP:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;

    sget-object v3, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;->BOTTOM:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;

    filled-new-array {v0, v1, v2, v3}, [Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;

    .line 2
    .line 3
    const-string v1, "LEFT"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;->LEFT:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;

    .line 10
    .line 11
    new-instance v0, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;

    .line 12
    .line 13
    const-string v1, "RIGHT"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;->RIGHT:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;

    .line 20
    .line 21
    new-instance v0, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;

    .line 22
    .line 23
    const-string v1, "TOP"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;->TOP:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;

    .line 30
    .line 31
    new-instance v0, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;

    .line 32
    .line 33
    const-string v1, "BOTTOM"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2}, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;->BOTTOM:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;

    .line 40
    .line 41
    invoke-static {}, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;->$values()[Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sput-object v0, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;->$VALUES:[Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;

    .line 46
    .line 47
    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->a([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    sput-object v0, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;->$ENTRIES:Lkotlin/enums/EnumEntries;

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
            "Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    sget-object v0, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;
    .locals 1

    .line 1
    const-class v0, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;
    .locals 1

    .line 1
    sget-object v0, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;->$VALUES:[Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/clevertap/android/sdk/inapp/pipsdk/PIPAnimationConfig$MoveInDirection;

    .line 8
    .line 9
    return-object v0
.end method
