.class public final enum Lcom/hellogroup/fep/base/FepLogModuleType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/hellogroup/fep/base/FepLogModuleType;",
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
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0007\u0008\u0086\u0001\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u000f\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006j\u0002\u0008\u0007j\u0002\u0008\u0008j\u0002\u0008\t\u00a8\u0006\n"
    }
    d2 = {
        "Lcom/hellogroup/fep/base/FepLogModuleType;",
        "",
        "mName",
        "",
        "(Ljava/lang/String;ILjava/lang/String;)V",
        "getMName",
        "()Ljava/lang/String;",
        "config",
        "grey",
        "offlinepkg",
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
.field private static final synthetic $VALUES:[Lcom/hellogroup/fep/base/FepLogModuleType;

.field public static final enum config:Lcom/hellogroup/fep/base/FepLogModuleType;

.field public static final enum grey:Lcom/hellogroup/fep/base/FepLogModuleType;

.field public static final enum offlinepkg:Lcom/hellogroup/fep/base/FepLogModuleType;


# instance fields
.field private final mName:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Lcom/hellogroup/fep/base/FepLogModuleType;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "FepConfig"

    .line 5
    .line 6
    const-string v3, "config"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/hellogroup/fep/base/FepLogModuleType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/hellogroup/fep/base/FepLogModuleType;->config:Lcom/hellogroup/fep/base/FepLogModuleType;

    .line 12
    .line 13
    new-instance v1, Lcom/hellogroup/fep/base/FepLogModuleType;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    const-string v3, "FepGrey"

    .line 17
    .line 18
    const-string v4, "grey"

    .line 19
    .line 20
    invoke-direct {v1, v4, v2, v3}, Lcom/hellogroup/fep/base/FepLogModuleType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v1, Lcom/hellogroup/fep/base/FepLogModuleType;->grey:Lcom/hellogroup/fep/base/FepLogModuleType;

    .line 24
    .line 25
    new-instance v2, Lcom/hellogroup/fep/base/FepLogModuleType;

    .line 26
    .line 27
    const/4 v3, 0x2

    .line 28
    const-string v4, "FepPackage"

    .line 29
    .line 30
    const-string v5, "offlinepkg"

    .line 31
    .line 32
    invoke-direct {v2, v5, v3, v4}, Lcom/hellogroup/fep/base/FepLogModuleType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v2, Lcom/hellogroup/fep/base/FepLogModuleType;->offlinepkg:Lcom/hellogroup/fep/base/FepLogModuleType;

    .line 36
    .line 37
    filled-new-array {v0, v1, v2}, [Lcom/hellogroup/fep/base/FepLogModuleType;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sput-object v0, Lcom/hellogroup/fep/base/FepLogModuleType;->$VALUES:[Lcom/hellogroup/fep/base/FepLogModuleType;

    .line 42
    .line 43
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
    iput-object p3, p0, Lcom/hellogroup/fep/base/FepLogModuleType;->mName:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/hellogroup/fep/base/FepLogModuleType;
    .locals 1

    const-class v0, Lcom/hellogroup/fep/base/FepLogModuleType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/hellogroup/fep/base/FepLogModuleType;

    return-object p0
.end method

.method public static values()[Lcom/hellogroup/fep/base/FepLogModuleType;
    .locals 1

    sget-object v0, Lcom/hellogroup/fep/base/FepLogModuleType;->$VALUES:[Lcom/hellogroup/fep/base/FepLogModuleType;

    invoke-virtual {v0}, [Lcom/hellogroup/fep/base/FepLogModuleType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/hellogroup/fep/base/FepLogModuleType;

    return-object v0
.end method


# virtual methods
.method public final getMName()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/hellogroup/fep/base/FepLogModuleType;->mName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
