.class public Ll/cqg;
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

.method public static a(Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;Landroid/view/View;)V
    .locals 1

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
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->a:Landroid/view/View;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->b:Landroid/view/View;

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->c:Landroid/view/View;

    .line 23
    .line 24
    const/4 v0, 0x3

    .line 25
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;

    .line 30
    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->d:Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;

    .line 32
    .line 33
    const/4 v0, 0x4

    .line 34
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lv/VImage;

    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->e:Lv/VImage;

    .line 41
    .line 42
    const/4 v0, 0x5

    .line 43
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Lv/VText;

    .line 48
    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->f:Lv/VText;

    .line 50
    .line 51
    const/4 v0, 0x6

    .line 52
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Lv/VText;

    .line 57
    .line 58
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->g:Lv/VText;

    .line 59
    .line 60
    const/4 v0, 0x7

    .line 61
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Lv/VText;

    .line 66
    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->h:Lv/VText;

    .line 68
    .line 69
    const/16 v0, 0x8

    .line 70
    .line 71
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    check-cast v0, Lv/VImage;

    .line 76
    .line 77
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->i:Lv/VImage;

    .line 78
    .line 79
    const/16 v0, 0x9

    .line 80
    .line 81
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    check-cast p1, Lv/VImage;

    .line 86
    .line 87
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;->j:Lv/VImage;

    .line 88
    .line 89
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/tec0;->K:I

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
    invoke-static {p0, p1}, Ll/cqg;->a(Lcom/p1/mobile/putong/feed/newui/mediapicker/audiopost/FeedAudioRecordView;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
