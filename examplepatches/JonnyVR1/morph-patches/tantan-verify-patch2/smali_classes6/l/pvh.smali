.class public Ll/pvh;
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

.method public static a(Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;Landroid/view/View;)V
    .locals 3

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroid/widget/LinearLayout;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;->a:Landroid/widget/LinearLayout;

    .line 5
    .line 6
    check-cast p1, Landroid/view/ViewGroup;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Landroid/view/ViewGroup;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Lv/VText;

    .line 28
    .line 29
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;->c:Lv/VText;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Landroid/view/ViewGroup;

    .line 36
    .line 37
    const/4 v2, 0x1

    .line 38
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Lv/VText;

    .line 43
    .line 44
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;->d:Lv/VText;

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Landroid/view/ViewGroup;

    .line 51
    .line 52
    const/4 v1, 0x2

    .line 53
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Lv/VText;

    .line 58
    .line 59
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;->e:Lv/VText;

    .line 60
    .line 61
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Lorg/apmem/tools/layouts/FlowLayout;

    .line 66
    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;->f:Lorg/apmem/tools/layouts/FlowLayout;

    .line 68
    .line 69
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    check-cast p1, Lv/VText;

    .line 74
    .line 75
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;->g:Lv/VText;

    .line 76
    .line 77
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/tec0;->G2:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p0, p1}, Ll/pvh;->a(Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedHeader;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
