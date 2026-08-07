.class public final Lcom/tantan/library/svga/compose/parser/AudioDataParser$parser$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantan/library/svga/SoundCallBack;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantan/library/svga/compose/parser/AudioDataParser;->parser(Lcom/tantan/library/svga/compose/proto/MovieEntity;Lkotlin/jvm/functions/Function1;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000!\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0007\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0010\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u0003H\u0016J\u0010\u0010\u000b\u001a\u00020\t2\u0006\u0010\u000c\u001a\u00020\rH\u0016R\u001a\u0010\u0002\u001a\u00020\u0003X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0004\u0010\u0005\"\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u000e"
    }
    d2 = {
        "com/tantan/library/svga/compose/parser/AudioDataParser$parser$1",
        "Lcom/tantan/library/svga/SoundCallBack;",
        "count",
        "",
        "getCount",
        "()I",
        "setCount",
        "(I)V",
        "onComplete",
        "",
        "soundId",
        "onVolumeChange",
        "value",
        "",
        "svga_lib_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $onReady:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "Ljava/util/Map<",
            "Ljava/io/File;",
            "Lcom/tantan/library/svga/compose/entities/SVGAAudio;",
            ">;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field

.field private count:I

.field final synthetic this$0:Lcom/tantan/library/svga/compose/parser/AudioDataParser;


# direct methods
.method public constructor <init>(Lcom/tantan/library/svga/compose/parser/AudioDataParser;Lkotlin/jvm/functions/Function1;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantan/library/svga/compose/parser/AudioDataParser;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/util/Map<",
            "Ljava/io/File;",
            "Lcom/tantan/library/svga/compose/entities/SVGAAudio;",
            ">;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/parser/AudioDataParser$parser$1;->this$0:Lcom/tantan/library/svga/compose/parser/AudioDataParser;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tantan/library/svga/compose/parser/AudioDataParser$parser$1;->$onReady:Lkotlin/jvm/functions/Function1;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final getCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantan/library/svga/compose/parser/AudioDataParser$parser$1;->count:I

    .line 2
    .line 3
    return p0
.end method

.method public onComplete(I)V
    .locals 1

    .line 1
    iget p1, p0, Lcom/tantan/library/svga/compose/parser/AudioDataParser$parser$1;->count:I

    .line 2
    .line 3
    add-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    iput p1, p0, Lcom/tantan/library/svga/compose/parser/AudioDataParser$parser$1;->count:I

    .line 6
    .line 7
    iget-object v0, p0, Lcom/tantan/library/svga/compose/parser/AudioDataParser$parser$1;->this$0:Lcom/tantan/library/svga/compose/parser/AudioDataParser;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantan/library/svga/compose/parser/AudioDataParser;->access$getAudioMap$p(Lcom/tantan/library/svga/compose/parser/AudioDataParser;)Ljava/util/Map;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Ljava/util/Map;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-lt p1, v0, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Lcom/tantan/library/svga/compose/parser/AudioDataParser$parser$1;->$onReady:Lkotlin/jvm/functions/Function1;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/tantan/library/svga/compose/parser/AudioDataParser$parser$1;->this$0:Lcom/tantan/library/svga/compose/parser/AudioDataParser;

    .line 22
    .line 23
    invoke-static {p0}, Lcom/tantan/library/svga/compose/parser/AudioDataParser;->access$getAudioMap$p(Lcom/tantan/library/svga/compose/parser/AudioDataParser;)Ljava/util/Map;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {p1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public onVolumeChange(F)V
    .locals 1

    .line 1
    sget-object v0, Lcom/tantan/library/svga/utils/SVGASoundManager;->INSTANCE:Lcom/tantan/library/svga/utils/SVGASoundManager;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantan/library/svga/compose/parser/AudioDataParser$parser$1;->this$0:Lcom/tantan/library/svga/compose/parser/AudioDataParser;

    .line 4
    .line 5
    invoke-static {p0}, Lcom/tantan/library/svga/compose/parser/AudioDataParser;->access$getEntity$p(Lcom/tantan/library/svga/compose/parser/AudioDataParser;)Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p1, p0}, Lcom/tantan/library/svga/utils/SVGASoundManager;->setVolume(FLcom/tantan/library/svga/compose/SVGAVideoEntity;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final setCount(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantan/library/svga/compose/parser/AudioDataParser$parser$1;->count:I

    .line 2
    .line 3
    return-void
.end method
