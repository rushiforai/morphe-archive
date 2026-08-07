.class final Lcom/immomo/svgaplayer/SVGAParser$parseFile$runnable$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/svgaplayer/SVGAParser;->parseFile(Ljava/lang/String;Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;Z)V
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

.field final synthetic $filePath:Ljava/lang/String;

.field final synthetic this$0:Lcom/immomo/svgaplayer/SVGAParser;


# direct methods
.method public constructor <init>(Lcom/immomo/svgaplayer/SVGAParser;Ljava/lang/String;ZLcom/immomo/svgaplayer/SVGAParser$ParseCompletion;)V
    .locals 0

    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGAParser$parseFile$runnable$1;->this$0:Lcom/immomo/svgaplayer/SVGAParser;

    iput-object p2, p0, Lcom/immomo/svgaplayer/SVGAParser$parseFile$runnable$1;->$filePath:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/immomo/svgaplayer/SVGAParser$parseFile$runnable$1;->$closeInputStream:Z

    iput-object p4, p0, Lcom/immomo/svgaplayer/SVGAParser$parseFile$runnable$1;->$callback:Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/immomo/svgaplayer/SVGAParser$parseFile$runnable$1;->$filePath:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    .line 9
    .line 10
    invoke-direct {v1, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/immomo/svgaplayer/SVGAParser$parseFile$runnable$1;->this$0:Lcom/immomo/svgaplayer/SVGAParser;

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/immomo/svgaplayer/SVGAParser;->access$parse(Lcom/immomo/svgaplayer/SVGAParser;Ljava/io/InputStream;)Lcom/immomo/svgaplayer/SVGAVideoEntity;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-boolean v2, p0, Lcom/immomo/svgaplayer/SVGAParser$parseFile$runnable$1;->$closeInputStream:Z

    .line 20
    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object v1, p0, Lcom/immomo/svgaplayer/SVGAParser$parseFile$runnable$1;->this$0:Lcom/immomo/svgaplayer/SVGAParser;

    .line 27
    .line 28
    iget-object v2, p0, Lcom/immomo/svgaplayer/SVGAParser$parseFile$runnable$1;->$callback:Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;

    .line 29
    .line 30
    invoke-static {v1, v2, v0}, Lcom/immomo/svgaplayer/SVGAParser;->access$onComplete(Lcom/immomo/svgaplayer/SVGAParser;Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;Lcom/immomo/svgaplayer/SVGAVideoEntity;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :catch_0
    iget-object v0, p0, Lcom/immomo/svgaplayer/SVGAParser$parseFile$runnable$1;->this$0:Lcom/immomo/svgaplayer/SVGAParser;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGAParser$parseFile$runnable$1;->$callback:Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;

    .line 37
    .line 38
    sget-object v1, Lcom/immomo/svgaplayer/ErrorConstant;->Companion:Lcom/immomo/svgaplayer/ErrorConstant$Companion;

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/immomo/svgaplayer/ErrorConstant$Companion;->getERROR_MMSVGA_RES_LOCAL_LOAD()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-static {v0, p0, v1}, Lcom/immomo/svgaplayer/SVGAParser;->access$onError(Lcom/immomo/svgaplayer/SVGAParser;Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method
