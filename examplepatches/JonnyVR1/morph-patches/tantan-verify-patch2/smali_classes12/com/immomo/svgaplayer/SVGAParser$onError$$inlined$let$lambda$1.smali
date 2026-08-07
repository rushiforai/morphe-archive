.class final Lcom/immomo/svgaplayer/SVGAParser$onError$$inlined$let$lambda$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/svgaplayer/SVGAParser;->onError(Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;Ljava/lang/String;)V
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
        "\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002\u00a8\u0006\u0003"
    }
    d2 = {
        "<anonymous>",
        "",
        "run",
        "com/immomo/svgaplayer/SVGAParser$onError$1$1"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0xa
    }
.end annotation


# instance fields
.field final synthetic $callback$inlined:Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;


# direct methods
.method public constructor <init>(Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;)V
    .locals 0

    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGAParser$onError$$inlined$let$lambda$1;->$callback$inlined:Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGAParser$onError$$inlined$let$lambda$1;->$callback$inlined:Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/immomo/svgaplayer/ErrorConstant;->Companion:Lcom/immomo/svgaplayer/ErrorConstant$Companion;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/immomo/svgaplayer/ErrorConstant$Companion;->getERROR_MMSVGA_RES_LOCAL_LOAD()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {p0, v0}, Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;->onError(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
