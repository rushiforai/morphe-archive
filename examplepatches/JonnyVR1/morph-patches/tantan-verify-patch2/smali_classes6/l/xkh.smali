.class public Ll/xkh;
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

.method public static a(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPersonalizeSuggestGuideView;Landroid/view/View;)V
    .locals 3

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPersonalizeSuggestGuideView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPersonalizeSuggestGuideView;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPersonalizeSuggestGuideView;

    .line 5
    .line 6
    check-cast p1, Landroid/view/ViewGroup;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Landroid/view/ViewGroup;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lv/VText;

    .line 21
    .line 22
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPersonalizeSuggestGuideView;->b:Lv/VText;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Landroid/view/ViewGroup;

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lv/VText;

    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPersonalizeSuggestGuideView;->c:Lv/VText;

    .line 37
    .line 38
    const/4 v0, 0x2

    .line 39
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Lv/VText;

    .line 44
    .line 45
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPersonalizeSuggestGuideView;->d:Lv/VText;

    .line 46
    .line 47
    return-void
.end method
