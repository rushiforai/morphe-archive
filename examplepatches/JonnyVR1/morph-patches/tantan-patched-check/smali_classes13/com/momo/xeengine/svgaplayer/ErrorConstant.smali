.class public final Lcom/momo/xeengine/svgaplayer/ErrorConstant;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/xeengine/svgaplayer/ErrorConstant$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\u0018\u0000 \u00032\u00020\u0001:\u0001\u0003B\u0005\u00a2\u0006\u0002\u0010\u0002\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/momo/xeengine/svgaplayer/ErrorConstant;",
        "",
        "()V",
        "Companion",
        "gift_player_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xf
    }
.end annotation


# static fields
.field public static final Companion:Lcom/momo/xeengine/svgaplayer/ErrorConstant$Companion;

# The value of this static final field might be set in the static constructor
.field private static final ERROR_MMSVGA_RES_ASSETS_LOAD:Ljava/lang/String; = "MMSVGA_assets\u8d44\u6e90\u52a0\u8f7d\u9519\u8bef"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

# The value of this static final field might be set in the static constructor
.field private static final ERROR_MMSVGA_RES_LOCAL_LOAD:Ljava/lang/String; = "MMSVGA_\u672c\u5730\u8d44\u6e90\u52a0\u8f7d\u9519\u8bef"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

# The value of this static final field might be set in the static constructor
.field private static final ERROR_MMSVGA_RES_PARSE:Ljava/lang/String; = "MMSVGA_\u6570\u636e\u89e3\u6790\u9519\u8bef"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

# The value of this static final field might be set in the static constructor
.field private static final ERROR_MMSVGA_RES_REMOTE_LOAD:Ljava/lang/String; = "MMSVGA_\u7f51\u7edc\u8d44\u6e90\u52a0\u8f7d\u9519\u8bef"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/momo/xeengine/svgaplayer/ErrorConstant$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/momo/xeengine/svgaplayer/ErrorConstant$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/momo/xeengine/svgaplayer/ErrorConstant;->Companion:Lcom/momo/xeengine/svgaplayer/ErrorConstant$Companion;

    .line 8
    .line 9
    const-string v0, "MMSVGA_assets\u8d44\u6e90\u52a0\u8f7d\u9519\u8bef"

    .line 10
    .line 11
    sput-object v0, Lcom/momo/xeengine/svgaplayer/ErrorConstant;->ERROR_MMSVGA_RES_ASSETS_LOAD:Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "MMSVGA_\u7f51\u7edc\u8d44\u6e90\u52a0\u8f7d\u9519\u8bef"

    .line 14
    .line 15
    sput-object v0, Lcom/momo/xeengine/svgaplayer/ErrorConstant;->ERROR_MMSVGA_RES_REMOTE_LOAD:Ljava/lang/String;

    .line 16
    .line 17
    const-string v0, "MMSVGA_\u672c\u5730\u8d44\u6e90\u52a0\u8f7d\u9519\u8bef"

    .line 18
    .line 19
    sput-object v0, Lcom/momo/xeengine/svgaplayer/ErrorConstant;->ERROR_MMSVGA_RES_LOCAL_LOAD:Ljava/lang/String;

    .line 20
    .line 21
    const-string v0, "MMSVGA_\u6570\u636e\u89e3\u6790\u9519\u8bef"

    .line 22
    .line 23
    sput-object v0, Lcom/momo/xeengine/svgaplayer/ErrorConstant;->ERROR_MMSVGA_RES_PARSE:Ljava/lang/String;

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$getERROR_MMSVGA_RES_ASSETS_LOAD$cp()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/xeengine/svgaplayer/ErrorConstant;->ERROR_MMSVGA_RES_ASSETS_LOAD:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic access$getERROR_MMSVGA_RES_LOCAL_LOAD$cp()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/xeengine/svgaplayer/ErrorConstant;->ERROR_MMSVGA_RES_LOCAL_LOAD:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic access$getERROR_MMSVGA_RES_PARSE$cp()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/xeengine/svgaplayer/ErrorConstant;->ERROR_MMSVGA_RES_PARSE:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic access$getERROR_MMSVGA_RES_REMOTE_LOAD$cp()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/xeengine/svgaplayer/ErrorConstant;->ERROR_MMSVGA_RES_REMOTE_LOAD:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method
