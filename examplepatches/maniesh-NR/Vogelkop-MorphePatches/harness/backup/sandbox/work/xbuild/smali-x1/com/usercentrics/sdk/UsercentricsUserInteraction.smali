.class public final enum Lcom/usercentrics/sdk/UsercentricsUserInteraction;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/usercentrics/sdk/UsercentricsUserInteraction;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\u0006\u0008\u0086\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002j\u0002\u0008\u0003j\u0002\u0008\u0004j\u0002\u0008\u0005j\u0002\u0008\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "Lcom/usercentrics/sdk/UsercentricsUserInteraction;",
        "",
        "(Ljava/lang/String;I)V",
        "ACCEPT_ALL",
        "DENY_ALL",
        "GRANULAR",
        "NO_INTERACTION",
        "usercentrics-ui_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final synthetic $ENTRIES:Lg58;

.field private static final synthetic $VALUES:[Lcom/usercentrics/sdk/UsercentricsUserInteraction;

.field public static final enum ACCEPT_ALL:Lcom/usercentrics/sdk/UsercentricsUserInteraction;

.field public static final enum DENY_ALL:Lcom/usercentrics/sdk/UsercentricsUserInteraction;

.field public static final enum GRANULAR:Lcom/usercentrics/sdk/UsercentricsUserInteraction;

.field public static final enum NO_INTERACTION:Lcom/usercentrics/sdk/UsercentricsUserInteraction;


# direct methods
.method private static final synthetic $values()[Lcom/usercentrics/sdk/UsercentricsUserInteraction;
    .registers 4

    sget-object v0, Lcom/usercentrics/sdk/UsercentricsUserInteraction;->ACCEPT_ALL:Lcom/usercentrics/sdk/UsercentricsUserInteraction;

    sget-object v1, Lcom/usercentrics/sdk/UsercentricsUserInteraction;->DENY_ALL:Lcom/usercentrics/sdk/UsercentricsUserInteraction;

    sget-object v2, Lcom/usercentrics/sdk/UsercentricsUserInteraction;->GRANULAR:Lcom/usercentrics/sdk/UsercentricsUserInteraction;

    sget-object v3, Lcom/usercentrics/sdk/UsercentricsUserInteraction;->NO_INTERACTION:Lcom/usercentrics/sdk/UsercentricsUserInteraction;

    filled-new-array {v0, v1, v2, v3}, [Lcom/usercentrics/sdk/UsercentricsUserInteraction;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lcom/usercentrics/sdk/UsercentricsUserInteraction;

    const-string v1, "ACCEPT_ALL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/usercentrics/sdk/UsercentricsUserInteraction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/usercentrics/sdk/UsercentricsUserInteraction;->ACCEPT_ALL:Lcom/usercentrics/sdk/UsercentricsUserInteraction;

    new-instance v0, Lcom/usercentrics/sdk/UsercentricsUserInteraction;

    const-string v1, "DENY_ALL"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/usercentrics/sdk/UsercentricsUserInteraction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/usercentrics/sdk/UsercentricsUserInteraction;->DENY_ALL:Lcom/usercentrics/sdk/UsercentricsUserInteraction;

    new-instance v0, Lcom/usercentrics/sdk/UsercentricsUserInteraction;

    const-string v1, "GRANULAR"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/usercentrics/sdk/UsercentricsUserInteraction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/usercentrics/sdk/UsercentricsUserInteraction;->GRANULAR:Lcom/usercentrics/sdk/UsercentricsUserInteraction;

    new-instance v0, Lcom/usercentrics/sdk/UsercentricsUserInteraction;

    const-string v1, "NO_INTERACTION"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/usercentrics/sdk/UsercentricsUserInteraction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/usercentrics/sdk/UsercentricsUserInteraction;->NO_INTERACTION:Lcom/usercentrics/sdk/UsercentricsUserInteraction;

    invoke-static {}, Lcom/usercentrics/sdk/UsercentricsUserInteraction;->$values()[Lcom/usercentrics/sdk/UsercentricsUserInteraction;

    move-result-object v0

    sput-object v0, Lcom/usercentrics/sdk/UsercentricsUserInteraction;->$VALUES:[Lcom/usercentrics/sdk/UsercentricsUserInteraction;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lcom/usercentrics/sdk/UsercentricsUserInteraction;->$ENTRIES:Lg58;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static getEntries()Lg58;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lg58;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    sget-object v0, Lcom/usercentrics/sdk/UsercentricsUserInteraction;->$ENTRIES:Lg58;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/usercentrics/sdk/UsercentricsUserInteraction;
    .registers 2

    const-class v0, Lcom/usercentrics/sdk/UsercentricsUserInteraction;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/usercentrics/sdk/UsercentricsUserInteraction;

    return-object p0
.end method

.method public static values()[Lcom/usercentrics/sdk/UsercentricsUserInteraction;
    .registers 1

    sget-object v0, Lcom/usercentrics/sdk/UsercentricsUserInteraction;->$VALUES:[Lcom/usercentrics/sdk/UsercentricsUserInteraction;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/usercentrics/sdk/UsercentricsUserInteraction;

    return-object v0
.end method
