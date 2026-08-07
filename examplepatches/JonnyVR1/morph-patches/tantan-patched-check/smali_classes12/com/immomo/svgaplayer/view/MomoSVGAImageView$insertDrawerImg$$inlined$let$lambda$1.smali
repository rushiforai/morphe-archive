.class public final Lcom/immomo/svgaplayer/view/MomoSVGAImageView$insertDrawerImg$$inlined$let$lambda$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/svgaplayer/adaptercallback/SVGAImgLoadCallBack;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/svgaplayer/view/MomoSVGAImageView;->insertDrawerImg(Ljava/util/List;)V
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
        "\u0000#\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0008\u0010\u0003\u001a\u00020\u0004H\u0016J\u0010\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u0007H\u0016\u00a8\u0006\u0008\u00b8\u0006\u0000"
    }
    d2 = {
        "com/immomo/svgaplayer/view/MomoSVGAImageView$insertDrawerImg$2$1",
        "Lcom/immomo/svgaplayer/adaptercallback/SVGAImgLoadCallBack;",
        "(Lcom/immomo/svgaplayer/view/MomoSVGAImageView$insertDrawerImg$2;)V",
        "onImgLoadFail",
        "",
        "onImgLoadSuccess",
        "bitmap",
        "Landroid/graphics/Bitmap;",
        "svgalibrary_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xa
    }
.end annotation


# instance fields
.field final synthetic $insertImgBean$inlined:Lcom/immomo/svgaplayer/bean/InsertImgBean;

.field final synthetic this$0:Lcom/immomo/svgaplayer/view/MomoSVGAImageView;


# direct methods
.method public constructor <init>(Lcom/immomo/svgaplayer/view/MomoSVGAImageView;Lcom/immomo/svgaplayer/bean/InsertImgBean;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/view/MomoSVGAImageView$insertDrawerImg$$inlined$let$lambda$1;->this$0:Lcom/immomo/svgaplayer/view/MomoSVGAImageView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/immomo/svgaplayer/view/MomoSVGAImageView$insertDrawerImg$$inlined$let$lambda$1;->$insertImgBean$inlined:Lcom/immomo/svgaplayer/bean/InsertImgBean;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onImgLoadFail()V
    .locals 0

    return-void
.end method

.method public onImgLoadSuccess(Landroid/graphics/Bitmap;)V
    .locals 3
    .param p1    # Landroid/graphics/Bitmap;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/immomo/svgaplayer/view/MomoSVGAImageView$insertDrawerImg$$inlined$let$lambda$1;->$insertImgBean$inlined:Lcom/immomo/svgaplayer/bean/InsertImgBean;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/immomo/svgaplayer/bean/InsertImgBean;->isCircle()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget-object v1, p0, Lcom/immomo/svgaplayer/view/MomoSVGAImageView$insertDrawerImg$$inlined$let$lambda$1;->this$0:Lcom/immomo/svgaplayer/view/MomoSVGAImageView;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/immomo/svgaplayer/view/ClickSVGAImageView;->getMSVGAEntity()Lcom/immomo/svgaplayer/SVGADynamicEntity;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object p0, p0, Lcom/immomo/svgaplayer/view/MomoSVGAImageView$insertDrawerImg$$inlined$let$lambda$1;->$insertImgBean$inlined:Lcom/immomo/svgaplayer/bean/InsertImgBean;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/bean/BaseInsertBean;->getKey()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v0, p0, p1}, Lcom/immomo/svgaplayer/SVGADynamicEntity;->setDynamicCircleImage(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    invoke-virtual {v1}, Lcom/immomo/svgaplayer/view/ClickSVGAImageView;->getMSVGAEntity()Lcom/immomo/svgaplayer/SVGADynamicEntity;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iget-object v1, p0, Lcom/immomo/svgaplayer/view/MomoSVGAImageView$insertDrawerImg$$inlined$let$lambda$1;->$insertImgBean$inlined:Lcom/immomo/svgaplayer/bean/InsertImgBean;

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/immomo/svgaplayer/bean/BaseInsertBean;->getKey()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iget-object v2, p0, Lcom/immomo/svgaplayer/view/MomoSVGAImageView$insertDrawerImg$$inlined$let$lambda$1;->$insertImgBean$inlined:Lcom/immomo/svgaplayer/bean/InsertImgBean;

    .line 43
    .line 44
    invoke-virtual {v2}, Lcom/immomo/svgaplayer/bean/InsertImgBean;->getRadius()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    iget-object p0, p0, Lcom/immomo/svgaplayer/view/MomoSVGAImageView$insertDrawerImg$$inlined$let$lambda$1;->$insertImgBean$inlined:Lcom/immomo/svgaplayer/bean/InsertImgBean;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/bean/InsertImgBean;->getCorner()Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {v0, v1, p1, v2, p0}, Lcom/immomo/svgaplayer/SVGADynamicEntity;->setDynamicRadiusImage(Ljava/lang/String;Landroid/graphics/Bitmap;ILcom/immomo/svgaplayer/corner/BitmapFillet$Corner;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    return-void
.end method
