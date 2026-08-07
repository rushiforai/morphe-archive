.class final Lcom/momo/xeengine/svgaplayer/SVGAImageView$onComplete$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/xeengine/svgaplayer/SVGAImageView;->onComplete(Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;)V
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
.field final synthetic $videoItem:Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;

.field final synthetic this$0:Lcom/momo/xeengine/svgaplayer/SVGAImageView;


# direct methods
.method public constructor <init>(Lcom/momo/xeengine/svgaplayer/SVGAImageView;Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;)V
    .locals 0

    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$onComplete$1;->this$0:Lcom/momo/xeengine/svgaplayer/SVGAImageView;

    iput-object p2, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$onComplete$1;->$videoItem:Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$onComplete$1;->$videoItem:Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$onComplete$1;->this$0:Lcom/momo/xeengine/svgaplayer/SVGAImageView;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->getAntiAlias()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$onComplete$1;->this$0:Lcom/momo/xeengine/svgaplayer/SVGAImageView;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$onComplete$1;->$videoItem:Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->setVideoItem(Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$onComplete$1;->this$0:Lcom/momo/xeengine/svgaplayer/SVGAImageView;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->getAutoPlay()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAImageView$onComplete$1;->this$0:Lcom/momo/xeengine/svgaplayer/SVGAImageView;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/SVGAImageView;->startAnimation()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method
