.class final Lcom/momo/xeengine/svgaplayer/SVGAParser$onComplete$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/xeengine/svgaplayer/SVGAParser;->onComplete(Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "run"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0xf
    }
.end annotation


# instance fields
.field final synthetic $callback:Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;

.field final synthetic $videoItem:Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;


# direct methods
.method public constructor <init>(Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;)V
    .locals 0

    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAParser$onComplete$1;->$callback:Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;

    iput-object p2, p0, Lcom/momo/xeengine/svgaplayer/SVGAParser$onComplete$1;->$videoItem:Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGAParser$onComplete$1;->$callback:Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAParser$onComplete$1;->$videoItem:Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;

    .line 6
    .line 7
    invoke-interface {v0, p0}, Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;->onComplete(Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
