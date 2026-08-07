.class final Lcom/tantan/library/svga/compose/SVGAVideoEntity$checkAndParserAudio$2;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantan/library/svga/compose/SVGAVideoEntity;->checkAndParserAudio(ZLkotlin/jvm/functions/Function0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function1<",
        "Ljava/util/Map<",
        "Ljava/io/File;",
        "+",
        "Lcom/tantan/library/svga/compose/entities/SVGAAudio;",
        ">;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0016\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u00020\u00012\u0012\u0010\u0002\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00050\u0003H\n\u00a2\u0006\u0002\u0008\u0006"
    }
    d2 = {
        "<anonymous>",
        "",
        "it",
        "",
        "Ljava/io/File;",
        "Lcom/tantan/library/svga/compose/entities/SVGAAudio;",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tantan/library/svga/compose/SVGAVideoEntity;


# direct methods
.method public constructor <init>(Lcom/tantan/library/svga/compose/SVGAVideoEntity;)V
    .locals 0

    iput-object p1, p0, Lcom/tantan/library/svga/compose/SVGAVideoEntity$checkAndParserAudio$2;->this$0:Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 14
    check-cast p1, Ljava/util/Map;

    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/compose/SVGAVideoEntity$checkAndParserAudio$2;->invoke(Ljava/util/Map;)V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public final invoke(Ljava/util/Map;)V
    .locals 0
    .param p1    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/io/File;",
            "Lcom/tantan/library/svga/compose/entities/SVGAAudio;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/tantan/library/svga/compose/SVGAVideoEntity$checkAndParserAudio$2;->this$0:Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->getAudioMap$svga_lib_release()Ljava/util/HashMap;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
