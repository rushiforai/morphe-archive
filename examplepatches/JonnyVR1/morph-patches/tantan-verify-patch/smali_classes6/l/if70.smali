.class public Ll/if70;
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

.method public static a(Ll/hf70;Landroid/view/View;)V
    .locals 3

    .line 1
    sget v0, Ll/hdc0;->A1:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lv/VLinear;

    .line 8
    .line 9
    iput-object v0, p0, Ll/hf70;->a:Lv/VLinear;

    .line 10
    .line 11
    check-cast p1, Landroid/view/ViewGroup;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Landroid/widget/RelativeLayout;

    .line 19
    .line 20
    iput-object v1, p0, Ll/hf70;->b:Landroid/widget/RelativeLayout;

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Landroid/view/ViewGroup;

    .line 27
    .line 28
    const/4 v2, 0x1

    .line 29
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Lv/VImage;

    .line 34
    .line 35
    iput-object v1, p0, Ll/hf70;->c:Lv/VImage;

    .line 36
    .line 37
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;

    .line 42
    .line 43
    iput-object v1, p0, Ll/hf70;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;

    .line 44
    .line 45
    const/4 v1, 0x2

    .line 46
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;

    .line 51
    .line 52
    iput-object v1, p0, Ll/hf70;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;

    .line 53
    .line 54
    const/4 v1, 0x3

    .line 55
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    check-cast v1, Landroid/widget/FrameLayout;

    .line 60
    .line 61
    iput-object v1, p0, Ll/hf70;->f:Landroid/widget/FrameLayout;

    .line 62
    .line 63
    const/4 v1, 0x4

    .line 64
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    check-cast v2, Landroid/widget/FrameLayout;

    .line 69
    .line 70
    iput-object v2, p0, Ll/hf70;->g:Landroid/widget/FrameLayout;

    .line 71
    .line 72
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    check-cast p1, Landroid/view/ViewGroup;

    .line 77
    .line 78
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    check-cast p1, Landroid/widget/FrameLayout;

    .line 83
    .line 84
    iput-object p1, p0, Ll/hf70;->h:Landroid/widget/FrameLayout;

    .line 85
    .line 86
    return-void
.end method

.method public static b(Ll/hf70;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/tec0;->v5:I

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
    invoke-static {p0, p1}, Ll/if70;->a(Ll/hf70;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method

.method public static c(Ll/hf70;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/hf70;->a:Lv/VLinear;

    .line 3
    .line 4
    iput-object v0, p0, Ll/hf70;->b:Landroid/widget/RelativeLayout;

    .line 5
    .line 6
    iput-object v0, p0, Ll/hf70;->c:Lv/VImage;

    .line 7
    .line 8
    iput-object v0, p0, Ll/hf70;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;

    .line 9
    .line 10
    iput-object v0, p0, Ll/hf70;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;

    .line 11
    .line 12
    iput-object v0, p0, Ll/hf70;->f:Landroid/widget/FrameLayout;

    .line 13
    .line 14
    iput-object v0, p0, Ll/hf70;->g:Landroid/widget/FrameLayout;

    .line 15
    .line 16
    iput-object v0, p0, Ll/hf70;->h:Landroid/widget/FrameLayout;

    .line 17
    .line 18
    return-void
.end method
