.class final Lcom/immomo/svgaplayer/SVGADynamicEntity$setDynamicImage$runable$1$$special$$inlined$let$lambda$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/svgaplayer/SVGADynamicEntity$setDynamicImage$runable$1;->run()V
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
        "\u0000\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0008\u0003\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002\u00a8\u0006\u0004"
    }
    d2 = {
        "<anonymous>",
        "",
        "run",
        "com/immomo/svgaplayer/SVGADynamicEntity$setDynamicImage$runable$1$1$1$1",
        "com/immomo/svgaplayer/SVGADynamicEntity$setDynamicImage$runable$1$$special$$inlined$let$lambda$1"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0xa
    }
.end annotation


# instance fields
.field final synthetic $it:Landroid/graphics/Bitmap;

.field final synthetic this$0:Lcom/immomo/svgaplayer/SVGADynamicEntity$setDynamicImage$runable$1;


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;Lcom/immomo/svgaplayer/SVGADynamicEntity$setDynamicImage$runable$1;)V
    .locals 0

    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGADynamicEntity$setDynamicImage$runable$1$$special$$inlined$let$lambda$2;->$it:Landroid/graphics/Bitmap;

    iput-object p2, p0, Lcom/immomo/svgaplayer/SVGADynamicEntity$setDynamicImage$runable$1$$special$$inlined$let$lambda$2;->this$0:Lcom/immomo/svgaplayer/SVGADynamicEntity$setDynamicImage$runable$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/svgaplayer/SVGADynamicEntity$setDynamicImage$runable$1$$special$$inlined$let$lambda$2;->this$0:Lcom/immomo/svgaplayer/SVGADynamicEntity$setDynamicImage$runable$1;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/immomo/svgaplayer/SVGADynamicEntity$setDynamicImage$runable$1;->this$0:Lcom/immomo/svgaplayer/SVGADynamicEntity;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/immomo/svgaplayer/SVGADynamicEntity$setDynamicImage$runable$1;->$forKey:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGADynamicEntity$setDynamicImage$runable$1$$special$$inlined$let$lambda$2;->$it:Landroid/graphics/Bitmap;

    .line 8
    .line 9
    invoke-virtual {v1, v0, p0}, Lcom/immomo/svgaplayer/SVGADynamicEntity;->setDynamicImage(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
