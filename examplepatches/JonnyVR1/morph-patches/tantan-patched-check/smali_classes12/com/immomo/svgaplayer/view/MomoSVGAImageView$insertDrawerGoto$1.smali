.class public final Lcom/immomo/svgaplayer/view/MomoSVGAImageView$insertDrawerGoto$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/svgaplayer/listener/SVGAClickAreaListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/svgaplayer/view/MomoSVGAImageView;->insertDrawerGoto(Ljava/util/HashMap;)V
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
        "\u0000\u0019\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0010\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u0006H\u0016\u00a8\u0006\u0007"
    }
    d2 = {
        "com/immomo/svgaplayer/view/MomoSVGAImageView$insertDrawerGoto$1",
        "Lcom/immomo/svgaplayer/listener/SVGAClickAreaListener;",
        "(Lcom/immomo/svgaplayer/view/MomoSVGAImageView;Ljava/util/HashMap;)V",
        "onClick",
        "",
        "clickKey",
        "",
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
.field final synthetic $gotoMap:Ljava/util/HashMap;

.field final synthetic this$0:Lcom/immomo/svgaplayer/view/MomoSVGAImageView;


# direct methods
.method public constructor <init>(Lcom/immomo/svgaplayer/view/MomoSVGAImageView;Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/view/MomoSVGAImageView$insertDrawerGoto$1;->this$0:Lcom/immomo/svgaplayer/view/MomoSVGAImageView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/immomo/svgaplayer/view/MomoSVGAImageView$insertDrawerGoto$1;->$gotoMap:Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onClick(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/immomo/svgaplayer/view/MomoSVGAImageView$insertDrawerGoto$1;->$gotoMap:Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ljava/lang/String;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    sget-object v1, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->Companion:Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer$Companion;

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer$Companion;->getMSVGAGotoAdapter()Lcom/immomo/svgaplayer/adapter/SVGAGotoAdapter;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lcom/immomo/svgaplayer/view/MomoSVGAImageView$insertDrawerGoto$1;->this$0:Lcom/immomo/svgaplayer/view/MomoSVGAImageView;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    invoke-interface {v1, p0, p1, v0}, Lcom/immomo/svgaplayer/adapter/SVGAGotoAdapter;->executeGoto(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method
