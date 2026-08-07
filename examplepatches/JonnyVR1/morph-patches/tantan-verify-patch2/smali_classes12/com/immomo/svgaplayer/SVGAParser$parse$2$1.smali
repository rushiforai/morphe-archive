.class final Lcom/immomo/svgaplayer/SVGAParser$parse$2$1;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/svgaplayer/SVGAParser$parse$2;->invoke(Ljava/io/InputStream;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Lkotlin/Unit;",
        ">;"
    }
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
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0xa
    }
.end annotation


# instance fields
.field final synthetic $videoItem:Lcom/immomo/svgaplayer/SVGAVideoEntity;

.field final synthetic this$0:Lcom/immomo/svgaplayer/SVGAParser$parse$2;


# direct methods
.method public constructor <init>(Lcom/immomo/svgaplayer/SVGAParser$parse$2;Lcom/immomo/svgaplayer/SVGAVideoEntity;)V
    .locals 0

    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGAParser$parse$2$1;->this$0:Lcom/immomo/svgaplayer/SVGAParser$parse$2;

    iput-object p2, p0, Lcom/immomo/svgaplayer/SVGAParser$parse$2$1;->$videoItem:Lcom/immomo/svgaplayer/SVGAVideoEntity;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 13
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/SVGAParser$parse$2$1;->invoke()V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public final invoke()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/svgaplayer/SVGAParser$parse$2$1;->this$0:Lcom/immomo/svgaplayer/SVGAParser$parse$2;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/immomo/svgaplayer/SVGAParser$parse$2;->this$0:Lcom/immomo/svgaplayer/SVGAParser;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/immomo/svgaplayer/SVGAParser$parse$2;->$callback:Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGAParser$parse$2$1;->$videoItem:Lcom/immomo/svgaplayer/SVGAVideoEntity;

    .line 8
    .line 9
    invoke-static {v1, v0, p0}, Lcom/immomo/svgaplayer/SVGAParser;->access$onComplete(Lcom/immomo/svgaplayer/SVGAParser;Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;Lcom/immomo/svgaplayer/SVGAVideoEntity;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
