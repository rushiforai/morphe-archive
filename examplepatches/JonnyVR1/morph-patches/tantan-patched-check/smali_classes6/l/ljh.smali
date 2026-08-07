.class public Ll/ljh;
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

.method public static a(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;Landroid/view/View;)V
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
    check-cast v1, Landroid/view/ViewGroup;

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Lv/navigationbar/VNavigationBar;

    .line 15
    .line 16
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->c:Lv/navigationbar/VNavigationBar;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Landroid/view/ViewGroup;

    .line 23
    .line 24
    const/4 v2, 0x1

    .line 25
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Landroidx/viewpager/widget/ViewPager;

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->d:Landroidx/viewpager/widget/ViewPager;

    .line 32
    .line 33
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Landroid/widget/RelativeLayout;

    .line 38
    .line 39
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->e:Landroid/widget/RelativeLayout;

    .line 40
    .line 41
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Landroid/view/ViewGroup;

    .line 46
    .line 47
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Landroid/widget/ImageView;

    .line 52
    .line 53
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->f:Landroid/widget/ImageView;

    .line 54
    .line 55
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    check-cast p1, Landroid/view/ViewGroup;

    .line 60
    .line 61
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    check-cast p1, Landroid/widget/TextView;

    .line 66
    .line 67
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;->g:Landroid/widget/TextView;

    .line 68
    .line 69
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/tec0;->m:I

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
    invoke-static {p0, p1}, Ll/ljh;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/FeedMyInterestPeopleAct;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
