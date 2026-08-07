.class public final Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lv/VScroll$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar;->e(Lv/VScroll;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001f\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0004\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J9\u0010\n\u001a\u00020\t2\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u00022\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00042\u0006\u0010\u0008\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000b\u00a8\u0006\u000c"
    }
    d2 = {
        "com/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar$b",
        "Lv/VScroll$a;",
        "Lv/VScroll;",
        "v",
        "",
        "x",
        "y",
        "oldX",
        "oldY",
        "",
        "a",
        "(Lv/VScroll;IIII)V",
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
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lv/VScroll;IIII)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p1, 0x0

    .line 20
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar;

    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar;->setMaxLength(I)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar;

    .line 33
    .line 34
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar;->b(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar;)Landroid/widget/ScrollView;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    check-cast p2, Lv/VScroll;

    .line 42
    .line 43
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    add-int/2addr p3, p2

    .line 48
    invoke-static {p1, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar;->c(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar;I)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar;

    .line 52
    .line 53
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar;->d(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar;)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar$b;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar;

    .line 57
    .line 58
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 59
    .line 60
    .line 61
    return-void
.end method
