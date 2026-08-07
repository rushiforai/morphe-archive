.class final Lcom/immomo/svgaplayer/view/MomoSVGAImageView$loadNetSVGA$1$onResLoadFail$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/svgaplayer/view/MomoSVGAImageView$loadNetSVGA$1;->onResLoadFail()V
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
        0xa
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/immomo/svgaplayer/view/MomoSVGAImageView$loadNetSVGA$1;


# direct methods
.method public constructor <init>(Lcom/immomo/svgaplayer/view/MomoSVGAImageView$loadNetSVGA$1;)V
    .locals 0

    iput-object p1, p0, Lcom/immomo/svgaplayer/view/MomoSVGAImageView$loadNetSVGA$1$onResLoadFail$1;->this$0:Lcom/immomo/svgaplayer/view/MomoSVGAImageView$loadNetSVGA$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/immomo/svgaplayer/view/MomoSVGAImageView$loadNetSVGA$1$onResLoadFail$1;->this$0:Lcom/immomo/svgaplayer/view/MomoSVGAImageView$loadNetSVGA$1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/immomo/svgaplayer/view/MomoSVGAImageView$loadNetSVGA$1;->this$0:Lcom/immomo/svgaplayer/view/MomoSVGAImageView;

    .line 4
    .line 5
    sget-object v0, Lcom/immomo/svgaplayer/ErrorConstant;->Companion:Lcom/immomo/svgaplayer/ErrorConstant$Companion;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/immomo/svgaplayer/ErrorConstant$Companion;->getERROR_MMSVGA_RES_REMOTE_LOAD()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Lcom/immomo/svgaplayer/view/MomoSVGAImageView;->onError(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
