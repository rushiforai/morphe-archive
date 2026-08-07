.class final Lcom/immomo/svgaplayer/SVGAVideoEntity$resetAudios$$inlined$let$lambda$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/SoundPool$OnLoadCompleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/svgaplayer/SVGAVideoEntity;->resetAudios(Lcom/immomo/svgaplayer/proto/MovieEntity;Lkotlin/jvm/functions/Function0;)V
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
        "\u0000 \n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0008\u0003\u0010\u0000\u001a\u00020\u00012\u000e\u0010\u0002\u001a\n \u0004*\u0004\u0018\u00010\u00030\u00032\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u0006H\n\u00a2\u0006\u0002\u0008\u0008\u00a8\u0006\t"
    }
    d2 = {
        "<anonymous>",
        "",
        "soundPool",
        "Landroid/media/SoundPool;",
        "kotlin.jvm.PlatformType",
        "<anonymous parameter 1>",
        "",
        "<anonymous parameter 2>",
        "onLoadComplete",
        "com/immomo/svgaplayer/SVGAVideoEntity$resetAudios$2$1"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0xa
    }
.end annotation


# instance fields
.field final synthetic $audios:Ljava/util/List;

.field final synthetic $completionBlock$inlined:Lkotlin/jvm/functions/Function0;

.field final synthetic $obj$inlined:Lcom/immomo/svgaplayer/proto/MovieEntity;

.field final synthetic $soundLoaded:Lkotlin/jvm/internal/Ref$IntRef;

.field final synthetic this$0:Lcom/immomo/svgaplayer/SVGAVideoEntity;


# direct methods
.method public constructor <init>(Lkotlin/jvm/internal/Ref$IntRef;Ljava/util/List;Lcom/immomo/svgaplayer/SVGAVideoEntity;Lkotlin/jvm/functions/Function0;Lcom/immomo/svgaplayer/proto/MovieEntity;)V
    .locals 0

    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGAVideoEntity$resetAudios$$inlined$let$lambda$1;->$soundLoaded:Lkotlin/jvm/internal/Ref$IntRef;

    iput-object p2, p0, Lcom/immomo/svgaplayer/SVGAVideoEntity$resetAudios$$inlined$let$lambda$1;->$audios:Ljava/util/List;

    iput-object p3, p0, Lcom/immomo/svgaplayer/SVGAVideoEntity$resetAudios$$inlined$let$lambda$1;->this$0:Lcom/immomo/svgaplayer/SVGAVideoEntity;

    iput-object p4, p0, Lcom/immomo/svgaplayer/SVGAVideoEntity$resetAudios$$inlined$let$lambda$1;->$completionBlock$inlined:Lkotlin/jvm/functions/Function0;

    iput-object p5, p0, Lcom/immomo/svgaplayer/SVGAVideoEntity$resetAudios$$inlined$let$lambda$1;->$obj$inlined:Lcom/immomo/svgaplayer/proto/MovieEntity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onLoadComplete(Landroid/media/SoundPool;II)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/immomo/svgaplayer/SVGAVideoEntity$resetAudios$$inlined$let$lambda$1;->$soundLoaded:Lkotlin/jvm/internal/Ref$IntRef;

    .line 2
    .line 3
    iget p2, p1, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    .line 4
    .line 5
    add-int/lit8 p2, p2, 0x1

    .line 6
    .line 7
    iput p2, p1, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    .line 8
    .line 9
    iget-object p1, p0, Lcom/immomo/svgaplayer/SVGAVideoEntity$resetAudios$$inlined$let$lambda$1;->$audios:Ljava/util/List;

    .line 10
    .line 11
    check-cast p1, Ljava/util/Collection;

    .line 12
    .line 13
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-lt p2, p1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGAVideoEntity$resetAudios$$inlined$let$lambda$1;->$completionBlock$inlined:Lkotlin/jvm/functions/Function0;

    .line 20
    .line 21
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method
