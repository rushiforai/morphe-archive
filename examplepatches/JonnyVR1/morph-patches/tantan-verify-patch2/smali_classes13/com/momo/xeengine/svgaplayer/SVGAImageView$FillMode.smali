.class public final enum Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xeengine/svgaplayer/SVGAImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "FillMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;",
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
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\u0004\u0008\u0086\u0001\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002j\u0002\u0008\u0003j\u0002\u0008\u0004\u00a8\u0006\u0005"
    }
    d2 = {
        "Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;",
        "",
        "(Ljava/lang/String;I)V",
        "Backward",
        "Forward",
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
.field private static final synthetic $VALUES:[Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;

.field public static final enum Backward:Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;

.field public static final enum Forward:Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;

    const-string v1, "Backward"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;->Backward:Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;

    new-instance v1, Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;

    const-string v2, "Forward"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;->Forward:Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;

    filled-new-array {v0, v1}, [Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;

    move-result-object v0

    sput-object v0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;->$VALUES:[Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;

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

.method public static valueOf(Ljava/lang/String;)Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;
    .locals 1

    const-class v0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;

    return-object p0
.end method

.method public static values()[Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;
    .locals 1

    sget-object v0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;->$VALUES:[Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;

    invoke-virtual {v0}, [Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/momo/xeengine/svgaplayer/SVGAImageView$FillMode;

    return-object v0
.end method
