.class public final Lcom/momo/xeengine/svgaplayer/SVGAParser$parseFile$loadResult$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/somanager/IXEngineSOLoader$LoaderCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/xeengine/svgaplayer/SVGAParser;->parseFile(Ljava/lang/String;Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;)V
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
        "\u0000\'\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0006\n\u0002\u0008\u0002*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0012\u0010\u0002\u001a\u00020\u00032\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005H\u0016J\u0018\u0010\u0006\u001a\u00020\u00032\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\nH\u0016J\u0008\u0010\u000b\u001a\u00020\u0003H\u0016\u00a8\u0006\u000c"
    }
    d2 = {
        "com/momo/xeengine/svgaplayer/SVGAParser$parseFile$loadResult$1",
        "Lcom/momo/xeengine/somanager/IXEngineSOLoader$LoaderCallback;",
        "onFailed",
        "",
        "errorMsg",
        "",
        "onProcess",
        "percent",
        "",
        "speed",
        "",
        "onSuccess",
        "gift_player_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xf
    }
.end annotation


# instance fields
.field final synthetic $callback:Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;

.field final synthetic $loadFunc:Lkotlin/jvm/functions/Function0;

.field final synthetic this$0:Lcom/momo/xeengine/svgaplayer/SVGAParser;


# direct methods
.method public constructor <init>(Lcom/momo/xeengine/svgaplayer/SVGAParser;Lkotlin/jvm/functions/Function0;Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0;",
            "Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAParser$parseFile$loadResult$1;->this$0:Lcom/momo/xeengine/svgaplayer/SVGAParser;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/momo/xeengine/svgaplayer/SVGAParser$parseFile$loadResult$1;->$loadFunc:Lkotlin/jvm/functions/Function0;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/momo/xeengine/svgaplayer/SVGAParser$parseFile$loadResult$1;->$callback:Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onFailed(Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAParser$parseFile$loadResult$1;->this$0:Lcom/momo/xeengine/svgaplayer/SVGAParser;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAParser$parseFile$loadResult$1;->$callback:Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;

    .line 4
    .line 5
    sget-object v0, Lcom/momo/xeengine/svgaplayer/ErrorConstant;->Companion:Lcom/momo/xeengine/svgaplayer/ErrorConstant$Companion;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/momo/xeengine/svgaplayer/ErrorConstant$Companion;->getERROR_MMSVGA_RES_LOCAL_LOAD()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {p1, p0, v0}, Lcom/momo/xeengine/svgaplayer/SVGAParser;->access$onError(Lcom/momo/xeengine/svgaplayer/SVGAParser;Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onProcess(ID)V
    .locals 0

    return-void
.end method

.method public onSuccess()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGAParser$parseFile$loadResult$1;->this$0:Lcom/momo/xeengine/svgaplayer/SVGAParser;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/svgaplayer/SVGAParser;->access$getExecutorService$p(Lcom/momo/xeengine/svgaplayer/SVGAParser;)Ljava/util/concurrent/ExecutorService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAParser$parseFile$loadResult$1;->$loadFunc:Lkotlin/jvm/functions/Function0;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    new-instance v1, Lcom/momo/xeengine/svgaplayer/SVGAParser$sam$java_lang_Runnable$0;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Lcom/momo/xeengine/svgaplayer/SVGAParser$sam$java_lang_Runnable$0;-><init>(Lkotlin/jvm/functions/Function0;)V

    .line 14
    .line 15
    .line 16
    move-object p0, v1

    .line 17
    :cond_0
    check-cast p0, Ljava/lang/Runnable;

    .line 18
    .line 19
    invoke-interface {v0, p0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 20
    .line 21
    .line 22
    return-void
.end method
