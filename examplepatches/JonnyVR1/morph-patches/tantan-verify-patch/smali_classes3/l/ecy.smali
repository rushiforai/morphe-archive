.class public Ll/ecy;
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

.method public static a(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;Landroid/view/View;)V
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
    check-cast v1, Lv/VImage;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->a:Lv/VImage;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Landroid/widget/RelativeLayout;

    .line 18
    .line 19
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->b:Landroid/widget/RelativeLayout;

    .line 20
    .line 21
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Landroid/view/ViewGroup;

    .line 26
    .line 27
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetItemLikerHeadView;

    .line 32
    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetItemLikerHeadView;

    .line 34
    .line 35
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Landroid/view/ViewGroup;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;

    .line 46
    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->d:Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;

    .line 48
    .line 49
    const/4 v0, 0x2

    .line 50
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Lv/VPullUpRecyclerView;

    .line 55
    .line 56
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->e:Lv/VPullUpRecyclerView;

    .line 57
    .line 58
    const/4 v0, 0x3

    .line 59
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    check-cast p1, Lv/VText;

    .line 64
    .line 65
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->f:Lv/VText;

    .line 66
    .line 67
    return-void
.end method
