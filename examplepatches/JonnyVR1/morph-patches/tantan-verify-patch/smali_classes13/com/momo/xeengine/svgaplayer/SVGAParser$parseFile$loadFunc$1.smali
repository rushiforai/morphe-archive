.class final Lcom/momo/xeengine/svgaplayer/SVGAParser$parseFile$loadFunc$1;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/xeengine/svgaplayer/SVGAParser;->parseFile(Ljava/lang/String;Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;)V
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
        0x3
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
        0xf
    }
.end annotation


# instance fields
.field final synthetic $callback:Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;

.field final synthetic $filePath:Ljava/lang/String;

.field final synthetic this$0:Lcom/momo/xeengine/svgaplayer/SVGAParser;


# direct methods
.method public constructor <init>(Lcom/momo/xeengine/svgaplayer/SVGAParser;Ljava/lang/String;Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;)V
    .locals 0

    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAParser$parseFile$loadFunc$1;->this$0:Lcom/momo/xeengine/svgaplayer/SVGAParser;

    iput-object p2, p0, Lcom/momo/xeengine/svgaplayer/SVGAParser$parseFile$loadFunc$1;->$filePath:Ljava/lang/String;

    iput-object p3, p0, Lcom/momo/xeengine/svgaplayer/SVGAParser$parseFile$loadFunc$1;->$callback:Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 44
    invoke-virtual {p0}, Lcom/momo/xeengine/svgaplayer/SVGAParser$parseFile$loadFunc$1;->invoke()V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public final invoke()V
    .locals 3

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/SVGAParser$parseFile$loadFunc$1;->$filePath:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    new-instance v1, Lcom/momo/xeengine/svgaplayer/utils/SVGAInputStream;

    .line 9
    .line 10
    invoke-direct {v1, v0}, Lcom/momo/xeengine/svgaplayer/utils/SVGAInputStream;-><init>(Ljava/io/File;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGAParser$parseFile$loadFunc$1;->this$0:Lcom/momo/xeengine/svgaplayer/SVGAParser;

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/momo/xeengine/svgaplayer/SVGAParser;->access$parse(Lcom/momo/xeengine/svgaplayer/SVGAParser;Ljava/io/InputStream;)Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v1}, Lcom/momo/xeengine/svgaplayer/utils/SVGAInputStream;->close()V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/momo/xeengine/svgaplayer/SVGAParser$parseFile$loadFunc$1;->this$0:Lcom/momo/xeengine/svgaplayer/SVGAParser;

    .line 23
    .line 24
    iget-object v2, p0, Lcom/momo/xeengine/svgaplayer/SVGAParser$parseFile$loadFunc$1;->$callback:Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;

    .line 25
    .line 26
    invoke-static {v1, v2, v0}, Lcom/momo/xeengine/svgaplayer/SVGAParser;->access$onComplete(Lcom/momo/xeengine/svgaplayer/SVGAParser;Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :catch_0
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGAParser$parseFile$loadFunc$1;->this$0:Lcom/momo/xeengine/svgaplayer/SVGAParser;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAParser$parseFile$loadFunc$1;->$callback:Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;

    .line 33
    .line 34
    sget-object v1, Lcom/momo/xeengine/svgaplayer/ErrorConstant;->Companion:Lcom/momo/xeengine/svgaplayer/ErrorConstant$Companion;

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/momo/xeengine/svgaplayer/ErrorConstant$Companion;->getERROR_MMSVGA_RES_LOCAL_LOAD()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-static {v0, p0, v1}, Lcom/momo/xeengine/svgaplayer/SVGAParser;->access$onError(Lcom/momo/xeengine/svgaplayer/SVGAParser;Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
