.class final Lcom/immomo/svgaplayer/SVGAParser$parse$2;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/svgaplayer/SVGAParser;->parse(Ljava/net/URL;Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function1<",
        "Ljava/io/InputStream;",
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
        "\u0000\u000e\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\n\u00a2\u0006\u0002\u0008\u0004"
    }
    d2 = {
        "<anonymous>",
        "",
        "it",
        "Ljava/io/InputStream;",
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
.field final synthetic $callback:Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;

.field final synthetic this$0:Lcom/immomo/svgaplayer/SVGAParser;


# direct methods
.method public constructor <init>(Lcom/immomo/svgaplayer/SVGAParser;Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;)V
    .locals 0

    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGAParser$parse$2;->this$0:Lcom/immomo/svgaplayer/SVGAParser;

    iput-object p2, p0, Lcom/immomo/svgaplayer/SVGAParser$parse$2;->$callback:Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 45
    check-cast p1, Ljava/io/InputStream;

    invoke-virtual {p0, p1}, Lcom/immomo/svgaplayer/SVGAParser$parse$2;->invoke(Ljava/io/InputStream;)V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public final invoke(Ljava/io/InputStream;)V
    .locals 1
    .param p1    # Ljava/io/InputStream;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/immomo/svgaplayer/SVGAParser$parse$2;->this$0:Lcom/immomo/svgaplayer/SVGAParser;

    .line 5
    .line 6
    invoke-static {v0, p1}, Lcom/immomo/svgaplayer/SVGAParser;->access$parse(Lcom/immomo/svgaplayer/SVGAParser;Ljava/io/InputStream;)Lcom/immomo/svgaplayer/SVGAVideoEntity;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    new-instance v0, Lcom/immomo/svgaplayer/SVGAParser$parse$2$1;

    .line 13
    .line 14
    invoke-direct {v0, p0, p1}, Lcom/immomo/svgaplayer/SVGAParser$parse$2$1;-><init>(Lcom/immomo/svgaplayer/SVGAParser$parse$2;Lcom/immomo/svgaplayer/SVGAVideoEntity;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v0}, Lcom/immomo/svgaplayer/SVGAVideoEntity;->prepare$svgalibrary_release(Lkotlin/jvm/functions/Function0;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    new-instance p1, Landroid/os/Handler;

    .line 22
    .line 23
    iget-object v0, p0, Lcom/immomo/svgaplayer/SVGAParser$parse$2;->this$0:Lcom/immomo/svgaplayer/SVGAParser;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/immomo/svgaplayer/SVGAParser;->access$getContext$p(Lcom/immomo/svgaplayer/SVGAParser;)Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 34
    .line 35
    .line 36
    new-instance v0, Lcom/immomo/svgaplayer/SVGAParser$parse$2$videoItem$1;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Lcom/immomo/svgaplayer/SVGAParser$parse$2$videoItem$1;-><init>(Lcom/immomo/svgaplayer/SVGAParser$parse$2;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 42
    .line 43
    .line 44
    return-void
.end method
