.class public final Lcom/momo/xeengine/svgaplayer/SVGAVideoEntityKt;
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
        "\u0000\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0002"
    }
    d2 = {
        "options",
        "Landroid/graphics/BitmapFactory$Options;",
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
.field private static final options:Landroid/graphics/BitmapFactory$Options;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/momo/xeengine/svgaplayer/SVGAVideoEntityKt;->options:Landroid/graphics/BitmapFactory$Options;

    .line 7
    .line 8
    return-void
.end method

.method public static final synthetic access$getOptions$p()Landroid/graphics/BitmapFactory$Options;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/xeengine/svgaplayer/SVGAVideoEntityKt;->options:Landroid/graphics/BitmapFactory$Options;

    .line 2
    .line 3
    return-object v0
.end method
