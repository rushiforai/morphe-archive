.class public final enum Lcom/hellogroup/fep/base/FepLogLevel;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/hellogroup/fep/base/FepLogLevel;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\u0006\u0008\u0086\u0001\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002j\u0002\u0008\u0003j\u0002\u0008\u0004j\u0002\u0008\u0005j\u0002\u0008\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "Lcom/hellogroup/fep/base/FepLogLevel;",
        "",
        "(Ljava/lang/String;I)V",
        "debug",
        "info",
        "warning",
        "error",
        "FEP_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/hellogroup/fep/base/FepLogLevel;

.field public static final enum debug:Lcom/hellogroup/fep/base/FepLogLevel;

.field public static final enum error:Lcom/hellogroup/fep/base/FepLogLevel;

.field public static final enum info:Lcom/hellogroup/fep/base/FepLogLevel;

.field public static final enum warning:Lcom/hellogroup/fep/base/FepLogLevel;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    new-instance v0, Lcom/hellogroup/fep/base/FepLogLevel;

    const-string v1, "debug"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/hellogroup/fep/base/FepLogLevel;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/hellogroup/fep/base/FepLogLevel;->debug:Lcom/hellogroup/fep/base/FepLogLevel;

    new-instance v1, Lcom/hellogroup/fep/base/FepLogLevel;

    const-string v2, "info"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Lcom/hellogroup/fep/base/FepLogLevel;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/hellogroup/fep/base/FepLogLevel;->info:Lcom/hellogroup/fep/base/FepLogLevel;

    new-instance v2, Lcom/hellogroup/fep/base/FepLogLevel;

    const-string v3, "warning"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Lcom/hellogroup/fep/base/FepLogLevel;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/hellogroup/fep/base/FepLogLevel;->warning:Lcom/hellogroup/fep/base/FepLogLevel;

    new-instance v3, Lcom/hellogroup/fep/base/FepLogLevel;

    const-string v4, "error"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Lcom/hellogroup/fep/base/FepLogLevel;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/hellogroup/fep/base/FepLogLevel;->error:Lcom/hellogroup/fep/base/FepLogLevel;

    filled-new-array {v0, v1, v2, v3}, [Lcom/hellogroup/fep/base/FepLogLevel;

    move-result-object v0

    sput-object v0, Lcom/hellogroup/fep/base/FepLogLevel;->$VALUES:[Lcom/hellogroup/fep/base/FepLogLevel;

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

.method public static valueOf(Ljava/lang/String;)Lcom/hellogroup/fep/base/FepLogLevel;
    .locals 1

    const-class v0, Lcom/hellogroup/fep/base/FepLogLevel;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/hellogroup/fep/base/FepLogLevel;

    return-object p0
.end method

.method public static values()[Lcom/hellogroup/fep/base/FepLogLevel;
    .locals 1

    sget-object v0, Lcom/hellogroup/fep/base/FepLogLevel;->$VALUES:[Lcom/hellogroup/fep/base/FepLogLevel;

    invoke-virtual {v0}, [Lcom/hellogroup/fep/base/FepLogLevel;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/hellogroup/fep/base/FepLogLevel;

    return-object v0
.end method
