.class public Ll/kdl0;
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

.method public static a(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;Landroid/view/View;)V
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
    check-cast v1, Landroid/view/TextureView;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->z:Landroid/view/TextureView;

    .line 11
    .line 12
    const/4 v1, 0x3

    .line 13
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Landroid/widget/ImageView;

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->A:Landroid/widget/ImageView;

    .line 20
    .line 21
    const/4 v1, 0x4

    .line 22
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Landroid/widget/ImageView;

    .line 27
    .line 28
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->B:Landroid/widget/ImageView;

    .line 29
    .line 30
    const/4 v1, 0x5

    .line 31
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, Landroid/view/ViewGroup;

    .line 36
    .line 37
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 42
    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->C:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 44
    .line 45
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Landroid/view/ViewGroup;

    .line 50
    .line 51
    const/4 v2, 0x1

    .line 52
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 57
    .line 58
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 59
    .line 60
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    check-cast v0, Landroid/view/ViewGroup;

    .line 65
    .line 66
    const/4 v1, 0x2

    .line 67
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 72
    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->E:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 74
    .line 75
    const/4 v0, 0x6

    .line 76
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Lv/VButton;

    .line 81
    .line 82
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->F:Lv/VButton;

    .line 83
    .line 84
    const/4 v0, 0x7

    .line 85
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    check-cast v0, Lv/VText;

    .line 90
    .line 91
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->G:Lv/VText;

    .line 92
    .line 93
    const/16 v0, 0x8

    .line 94
    .line 95
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    check-cast v0, Landroid/view/ViewStub;

    .line 100
    .line 101
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->H:Landroid/view/ViewStub;

    .line 102
    .line 103
    const/16 v0, 0x9

    .line 104
    .line 105
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    check-cast v0, Landroid/view/ViewStub;

    .line 110
    .line 111
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->I:Landroid/view/ViewStub;

    .line 112
    .line 113
    const/16 v0, 0xa

    .line 114
    .line 115
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    check-cast p1, Landroid/view/ViewStub;

    .line 120
    .line 121
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->J:Landroid/view/ViewStub;

    .line 122
    .line 123
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/tec0;->U3:I

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
    invoke-static {p0, p1}, Ll/kdl0;->a(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
