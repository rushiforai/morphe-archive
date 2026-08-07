.class public final Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar$c;
.super Landroid/view/ViewOutlineProvider;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar;->dispatchDraw(Landroid/graphics/Canvas;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001d\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u001f\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\t"
    }
    d2 = {
        "com/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar$c",
        "Landroid/view/ViewOutlineProvider;",
        "Landroid/view/View;",
        "view",
        "Landroid/graphics/Outline;",
        "outline",
        "",
        "getOutline",
        "(Landroid/view/View;Landroid/graphics/Outline;)V",
        "b_feed_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar$c;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar$c;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar$c;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar$c;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar;

    .line 20
    .line 21
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar;)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    int-to-float v5, p0

    .line 26
    const/4 v1, 0x0

    .line 27
    const/4 v2, 0x0

    .line 28
    move-object v0, p2

    .line 29
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Outline;->setRoundRect(IIIIF)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
