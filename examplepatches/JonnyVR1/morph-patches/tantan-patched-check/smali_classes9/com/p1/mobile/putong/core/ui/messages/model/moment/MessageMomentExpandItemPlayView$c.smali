.class public Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView$c;
.super Landroid/view/ViewOutlineProvider;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;->setRadius(F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:F

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView$c;->b:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView$c;->a:F

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
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    sub-int/2addr v1, v2

    .line 12
    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    sub-int/2addr v2, p1

    .line 21
    const/4 p1, 0x0

    .line 22
    invoke-direct {v0, p1, p1, v1, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 23
    .line 24
    .line 25
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemPlayView$c;->a:F

    .line 26
    .line 27
    invoke-virtual {p2, v0, p0}, Landroid/graphics/Outline;->setRoundRect(Landroid/graphics/Rect;F)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
