.class public final Lcom/momo/xeengine/svgaplayer/SVGAPathKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u000c\n\u0000\n\u0002\u0010\"\n\u0002\u0010\u000e\n\u0000\"\u0014\u0010\u0000\u001a\u0008\u0012\u0004\u0012\u00020\u00020\u0001X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0003"
    }
    d2 = {
        "VALID_METHODS",
        "",
        "",
        "gift_player_release"
    }
    k = 0x2
    mv = {
        0x1,
        0x1,
        0xf
    }
.end annotation


# static fields
.field private static final VALID_METHODS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 21

    .line 1
    const-string v19, "a"

    .line 2
    .line 3
    const-string v20, "z"

    .line 4
    .line 5
    const-string v1, "M"

    .line 6
    .line 7
    const-string v2, "L"

    .line 8
    .line 9
    const-string v3, "H"

    .line 10
    .line 11
    const-string v4, "V"

    .line 12
    .line 13
    const-string v5, "C"

    .line 14
    .line 15
    const-string v6, "S"

    .line 16
    .line 17
    const-string v7, "Q"

    .line 18
    .line 19
    const-string v8, "R"

    .line 20
    .line 21
    const-string v9, "A"

    .line 22
    .line 23
    const-string v10, "Z"

    .line 24
    .line 25
    const-string v11, "m"

    .line 26
    .line 27
    const-string v12, "l"

    .line 28
    .line 29
    const-string v13, "h"

    .line 30
    .line 31
    const-string v14, "v"

    .line 32
    .line 33
    const-string v15, "c"

    .line 34
    .line 35
    const-string v16, "s"

    .line 36
    .line 37
    const-string v17, "q"

    .line 38
    .line 39
    const-string v18, "r"

    .line 40
    .line 41
    filled-new-array/range {v1 .. v20}, [Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {v0}, Lkotlin/collections/SetsKt;->setOf([Ljava/lang/Object;)Ljava/util/Set;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    sput-object v0, Lcom/momo/xeengine/svgaplayer/SVGAPathKt;->VALID_METHODS:Ljava/util/Set;

    .line 50
    .line 51
    return-void
.end method

.method public static final synthetic access$getVALID_METHODS$p()Ljava/util/Set;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/xeengine/svgaplayer/SVGAPathKt;->VALID_METHODS:Ljava/util/Set;

    .line 2
    .line 3
    return-object v0
.end method
