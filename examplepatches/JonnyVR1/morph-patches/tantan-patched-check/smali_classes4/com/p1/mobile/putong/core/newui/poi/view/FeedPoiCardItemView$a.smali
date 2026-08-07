.class public Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView$a;
.super Landroid/view/ViewOutlineProvider;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;->r(Landroid/view/View;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView$a;->b:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView$a;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-direct {v0, v2, v2, v1, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 13
    .line 14
    .line 15
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView$a;->a:I

    .line 16
    .line 17
    int-to-float p0, p0

    .line 18
    invoke-virtual {p2, v0, p0}, Landroid/graphics/Outline;->setRoundRect(Landroid/graphics/Rect;F)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
