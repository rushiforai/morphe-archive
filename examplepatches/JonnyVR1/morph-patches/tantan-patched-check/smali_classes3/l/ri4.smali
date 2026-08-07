.class public Ll/ri4;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;Landroid/view/View;)V
    .locals 3

    .line 1
    check-cast p1, Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->c:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->d:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

    .line 20
    .line 21
    const/4 v1, 0x2

    .line 22
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Lcom/p1/mobile/putong/core/view/MaximumScroll;

    .line 27
    .line 28
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->e:Lcom/p1/mobile/putong/core/view/MaximumScroll;

    .line 29
    .line 30
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Landroid/view/ViewGroup;

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 41
    .line 42
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentCardTwoView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 43
    .line 44
    return-void
.end method
