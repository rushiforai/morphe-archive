.class public Ll/bez;
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

.method public static a(Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout;Landroid/view/View;)V
    .locals 2

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroid/view/ViewGroup;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/widget/LinearLayout;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout;->a:Landroid/widget/LinearLayout;

    .line 12
    .line 13
    sget v0, Ll/edc0;->n1:I

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lv/VImage;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout;->b:Lv/VImage;

    .line 22
    .line 23
    check-cast p1, Landroid/view/ViewGroup;

    .line 24
    .line 25
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Landroid/view/ViewGroup;

    .line 30
    .line 31
    const/4 v1, 0x1

    .line 32
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lv/VText;

    .line 37
    .line 38
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout;->c:Lv/VText;

    .line 39
    .line 40
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;

    .line 45
    .line 46
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout;->d:Lcom/p1/mobile/putong/core/view/CommonLabelShowView;

    .line 47
    .line 48
    const/4 v0, 0x2

    .line 49
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    check-cast p1, Lv/VRecyclerView;

    .line 54
    .line 55
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageIdealTypeHeadLayout;->e:Lv/VRecyclerView;

    .line 56
    .line 57
    return-void
.end method
