.class public final enum Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/api/api/PaymentApi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PaymentResultStatus"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\t\u0008\u0086\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003j\u0002\u0008\u0004j\u0002\u0008\u0005j\u0002\u0008\u0006j\u0002\u0008\u0007j\u0002\u0008\u0008j\u0002\u0008\t\u00a8\u0006\n"
    }
    d2 = {
        "Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;",
        "",
        "<init>",
        "(Ljava/lang/String;I)V",
        "succeed",
        "failed",
        "subscriptionChanged",
        "pending",
        "toSigning",
        "userCancel",
        "putong-common_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final synthetic $ENTRIES:Lkotlin/enums/EnumEntries;

.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

.field public static final enum failed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

.field public static final enum pending:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

.field public static final enum subscriptionChanged:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

.field public static final enum succeed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

.field public static final enum toSigning:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

.field public static final enum userCancel:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;


# direct methods
.method private static final synthetic $values()[Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;
    .locals 6

    sget-object v0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->succeed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    sget-object v1, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    sget-object v2, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->subscriptionChanged:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    sget-object v3, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->pending:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    sget-object v4, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->toSigning:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    sget-object v5, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->userCancel:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    filled-new-array/range {v0 .. v5}, [Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 2
    .line 3
    const-string v1, "succeed"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->succeed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 12
    .line 13
    const-string v1, "failed"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 20
    .line 21
    new-instance v0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 22
    .line 23
    const-string v1, "subscriptionChanged"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->subscriptionChanged:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 30
    .line 31
    new-instance v0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 32
    .line 33
    const-string v1, "pending"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->pending:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 40
    .line 41
    new-instance v0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 42
    .line 43
    const-string v1, "toSigning"

    .line 44
    .line 45
    const/4 v2, 0x4

    .line 46
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;-><init>(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->toSigning:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 50
    .line 51
    new-instance v0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 52
    .line 53
    const-string v1, "userCancel"

    .line 54
    .line 55
    const/4 v2, 0x5

    .line 56
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;-><init>(Ljava/lang/String;I)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->userCancel:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 60
    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->$values()[Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sput-object v0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->$VALUES:[Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 66
    .line 67
    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->a([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    sput-object v0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->$ENTRIES:Lkotlin/enums/EnumEntries;

    .line 72
    .line 73
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
            "Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    sget-object v0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;
    .locals 1

    const-class v0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;
    .locals 1

    sget-object v0, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->$VALUES:[Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    return-object v0
.end method
