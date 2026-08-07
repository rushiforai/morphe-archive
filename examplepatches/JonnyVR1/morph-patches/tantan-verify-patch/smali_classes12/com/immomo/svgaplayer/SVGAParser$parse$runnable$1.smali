.class final Lcom/immomo/svgaplayer/SVGAParser$parse$runnable$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/svgaplayer/SVGAParser;->parse(Ljava/io/InputStream;Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;Z)V
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
.field final synthetic $callback:Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;

.field final synthetic $closeInputStream:Z

.field final synthetic $inputStream:Ljava/io/InputStream;

.field final synthetic this$0:Lcom/immomo/svgaplayer/SVGAParser;


# direct methods
.method public constructor <init>(Lcom/immomo/svgaplayer/SVGAParser;Ljava/io/InputStream;ZLcom/immomo/svgaplayer/SVGAParser$ParseCompletion;)V
    .locals 0

    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGAParser$parse$runnable$1;->this$0:Lcom/immomo/svgaplayer/SVGAParser;

    iput-object p2, p0, Lcom/immomo/svgaplayer/SVGAParser$parse$runnable$1;->$inputStream:Ljava/io/InputStream;

    iput-boolean p3, p0, Lcom/immomo/svgaplayer/SVGAParser$parse$runnable$1;->$closeInputStream:Z

    iput-object p4, p0, Lcom/immomo/svgaplayer/SVGAParser$parse$runnable$1;->$callback:Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/svgaplayer/SVGAParser$parse$runnable$1;->this$0:Lcom/immomo/svgaplayer/SVGAParser;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/immomo/svgaplayer/SVGAParser$parse$runnable$1;->$inputStream:Ljava/io/InputStream;

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/immomo/svgaplayer/SVGAParser;->access$parse(Lcom/immomo/svgaplayer/SVGAParser;Ljava/io/InputStream;)Lcom/immomo/svgaplayer/SVGAVideoEntity;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-boolean v1, p0, Lcom/immomo/svgaplayer/SVGAParser$parse$runnable$1;->$closeInputStream:Z

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Lcom/immomo/svgaplayer/SVGAParser$parse$runnable$1;->$inputStream:Ljava/io/InputStream;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v1, p0, Lcom/immomo/svgaplayer/SVGAParser$parse$runnable$1;->this$0:Lcom/immomo/svgaplayer/SVGAParser;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGAParser$parse$runnable$1;->$callback:Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;

    .line 21
    .line 22
    invoke-static {v1, p0, v0}, Lcom/immomo/svgaplayer/SVGAParser;->access$onComplete(Lcom/immomo/svgaplayer/SVGAParser;Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;Lcom/immomo/svgaplayer/SVGAVideoEntity;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
