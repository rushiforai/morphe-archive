.class public Ll/cay;
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

.method public static a(Ll/bay;Landroid/view/View;)V
    .locals 4

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroid/widget/FrameLayout;

    .line 3
    .line 4
    iput-object v0, p0, Ll/bay;->a:Landroid/widget/FrameLayout;

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
    check-cast v1, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 14
    .line 15
    iput-object v1, p0, Ll/bay;->b:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 23
    .line 24
    iput-object v2, p0, Ll/bay;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 25
    .line 26
    const/4 v2, 0x2

    .line 27
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Landroid/widget/RelativeLayout;

    .line 32
    .line 33
    iput-object v3, p0, Ll/bay;->d:Landroid/widget/RelativeLayout;

    .line 34
    .line 35
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    check-cast v3, Landroid/view/ViewGroup;

    .line 40
    .line 41
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 46
    .line 47
    iput-object v0, p0, Ll/bay;->e:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 48
    .line 49
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Landroid/view/ViewGroup;

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Landroid/widget/LinearLayout;

    .line 60
    .line 61
    iput-object v0, p0, Ll/bay;->f:Landroid/widget/LinearLayout;

    .line 62
    .line 63
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Landroid/view/ViewGroup;

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Landroid/view/ViewGroup;

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;

    .line 80
    .line 81
    iput-object v0, p0, Ll/bay;->g:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/StrokeTextView;

    .line 82
    .line 83
    const/4 v0, 0x3

    .line 84
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    check-cast v0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 89
    .line 90
    iput-object v0, p0, Ll/bay;->h:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 91
    .line 92
    const/4 v0, 0x4

    .line 93
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    check-cast v0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 98
    .line 99
    iput-object v0, p0, Ll/bay;->i:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeCardItem;

    .line 100
    .line 101
    const/4 v0, 0x5

    .line 102
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    check-cast p1, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeDefaultCardItem;

    .line 107
    .line 108
    iput-object p1, p0, Ll/bay;->j:Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeDefaultCardItem;

    .line 109
    .line 110
    return-void
.end method

.method public static b(Ll/bay;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/pec0;->m0:I

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
    invoke-static {p0, p1}, Ll/cay;->a(Ll/bay;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
