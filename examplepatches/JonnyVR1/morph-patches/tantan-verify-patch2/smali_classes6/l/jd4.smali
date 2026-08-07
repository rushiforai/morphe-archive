.class public Ll/jd4;
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

.method public static a(Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;Landroid/view/View;)V
    .locals 4

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
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;

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
    check-cast v2, Lv/VFrame;

    .line 18
    .line 19
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->b:Lv/VFrame;

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
    move-result-object v2

    .line 31
    check-cast v2, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 32
    .line 33
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->c:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 34
    .line 35
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Landroid/view/ViewGroup;

    .line 40
    .line 41
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    check-cast v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/redpointview/FeedRedDotView;

    .line 46
    .line 47
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/redpointview/FeedRedDotView;

    .line 48
    .line 49
    const/4 v2, 0x2

    .line 50
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    check-cast v2, Landroid/view/ViewGroup;

    .line 55
    .line 56
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    check-cast v2, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 61
    .line 62
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->e:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 63
    .line 64
    const/4 v2, 0x3

    .line 65
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    check-cast v3, Landroid/widget/LinearLayout;

    .line 70
    .line 71
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->f:Landroid/widget/LinearLayout;

    .line 72
    .line 73
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    check-cast v3, Landroid/view/ViewGroup;

    .line 78
    .line 79
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    check-cast v0, Landroid/widget/ImageView;

    .line 84
    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->g:Landroid/widget/ImageView;

    .line 86
    .line 87
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    check-cast p1, Landroid/view/ViewGroup;

    .line 92
    .line 93
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    check-cast p1, Landroid/widget/ImageView;

    .line 98
    .line 99
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->h:Landroid/widget/ImageView;

    .line 100
    .line 101
    return-void
.end method
