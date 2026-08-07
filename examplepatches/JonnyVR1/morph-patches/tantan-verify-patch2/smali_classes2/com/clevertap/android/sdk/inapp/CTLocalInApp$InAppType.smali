.class public final enum Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0000\n\u0002\u0010\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0008\t\u0008\u0086\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0011\u0008\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006R\u0017\u0010\u0004\u001a\u00020\u00038\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0004\u0010\u0007\u001a\u0004\u0008\u0008\u0010\tj\u0002\u0008\nj\u0002\u0008\u000b\u00a8\u0006\u000c"
    }
    d2 = {
        "com/clevertap/android/sdk/inapp/CTLocalInApp$InAppType",
        "",
        "Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;",
        "",
        "type",
        "<init>",
        "(Ljava/lang/String;ILjava/lang/String;)V",
        "Ljava/lang/String;",
        "getType",
        "()Ljava/lang/String;",
        "ALERT",
        "HALF_INTERSTITIAL",
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

.field private static final synthetic $VALUES:[Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;

.field public static final enum ALERT:Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;

.field public static final enum HALF_INTERSTITIAL:Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;


# instance fields
.field private final type:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method private static final synthetic $values()[Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;
    .locals 2

    sget-object v0, Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;->ALERT:Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;

    sget-object v1, Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;->HALF_INTERSTITIAL:Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;

    filled-new-array {v0, v1}, [Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;

    .line 2
    .line 3
    sget-object v1, Lcom/clevertap/android/sdk/inapp/CTInAppType;->CTInAppTypeAlert:Lcom/clevertap/android/sdk/inapp/CTInAppType;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/inapp/CTInAppType;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "ALERT"

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-direct {v0, v2, v3, v1}, Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    sput-object v0, Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;->ALERT:Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;

    .line 16
    .line 17
    new-instance v0, Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;

    .line 18
    .line 19
    sget-object v1, Lcom/clevertap/android/sdk/inapp/CTInAppType;->CTInAppTypeHalfInterstitial:Lcom/clevertap/android/sdk/inapp/CTInAppType;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/inapp/CTInAppType;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, "HALF_INTERSTITIAL"

    .line 26
    .line 27
    const/4 v3, 0x1

    .line 28
    invoke-direct {v0, v2, v3, v1}, Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 29
    .line 30
    .line 31
    sput-object v0, Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;->HALF_INTERSTITIAL:Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;

    .line 32
    .line 33
    invoke-static {}, Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;->$values()[Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sput-object v0, Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;->$VALUES:[Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;

    .line 38
    .line 39
    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->a([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sput-object v0, Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;->$ENTRIES:Lkotlin/enums/EnumEntries;

    .line 44
    .line 45
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
    iput-object p3, p0, Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;->type:Ljava/lang/String;

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
            "Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    sget-object v0, Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;
    .locals 1

    .line 1
    const-class v0, Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;
    .locals 1

    .line 1
    sget-object v0, Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;->$VALUES:[Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;

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
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/CTLocalInApp$InAppType;->type:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
