.class public Ll/dfy;
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

.method public static a(Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeDefaultCardItem;Landroid/view/View;)V
    .locals 1

    .line 1
    check-cast p1, Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lv/VText;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeDefaultCardItem;->a:Lv/VText;

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lv/VText;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeDefaultCardItem;->b:Lv/VText;

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeDefaultCardItem;->c:Landroid/view/View;

    .line 27
    .line 28
    const/4 v0, 0x4

    .line 29
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    check-cast p1, Lv/VImage;

    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/seecard/MeetSeeDefaultCardItem;->d:Lv/VImage;

    .line 36
    .line 37
    return-void
.end method
