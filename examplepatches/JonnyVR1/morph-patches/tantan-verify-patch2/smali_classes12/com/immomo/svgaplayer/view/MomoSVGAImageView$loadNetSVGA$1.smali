.class public final Lcom/immomo/svgaplayer/view/MomoSVGAImageView$loadNetSVGA$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/svgaplayer/adaptercallback/SVGAResLoadCallBack;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/svgaplayer/view/MomoSVGAImageView;->loadNetSVGA(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x2
    }
    d1 = {
        "\u0000\u001b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0008\u0010\u0003\u001a\u00020\u0004H\u0016J\u0010\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u0007H\u0016\u00a8\u0006\u0008"
    }
    d2 = {
        "com/immomo/svgaplayer/view/MomoSVGAImageView$loadNetSVGA$1",
        "Lcom/immomo/svgaplayer/adaptercallback/SVGAResLoadCallBack;",
        "(Lcom/immomo/svgaplayer/view/MomoSVGAImageView;)V",
        "onResLoadFail",
        "",
        "onResLoadSuccess",
        "filePath",
        "",
        "svgalibrary_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xa
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/immomo/svgaplayer/view/MomoSVGAImageView;


# direct methods
.method public constructor <init>(Lcom/immomo/svgaplayer/view/MomoSVGAImageView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/view/MomoSVGAImageView$loadNetSVGA$1;->this$0:Lcom/immomo/svgaplayer/view/MomoSVGAImageView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onResLoadFail()V
    .locals 2

    .line 1
    new-instance v0, Landroid/os/Handler;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/immomo/svgaplayer/view/MomoSVGAImageView$loadNetSVGA$1;->this$0:Lcom/immomo/svgaplayer/view/MomoSVGAImageView;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 17
    .line 18
    .line 19
    new-instance v1, Lcom/immomo/svgaplayer/view/MomoSVGAImageView$loadNetSVGA$1$onResLoadFail$1;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Lcom/immomo/svgaplayer/view/MomoSVGAImageView$loadNetSVGA$1$onResLoadFail$1;-><init>(Lcom/immomo/svgaplayer/view/MomoSVGAImageView$loadNetSVGA$1;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public onResLoadSuccess(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/immomo/svgaplayer/view/MomoSVGAImageView$loadNetSVGA$1;->this$0:Lcom/immomo/svgaplayer/view/MomoSVGAImageView;

    .line 5
    .line 6
    invoke-static {p0, p1}, Lcom/immomo/svgaplayer/view/MomoSVGAImageView;->access$loadLocalResource(Lcom/immomo/svgaplayer/view/MomoSVGAImageView;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
