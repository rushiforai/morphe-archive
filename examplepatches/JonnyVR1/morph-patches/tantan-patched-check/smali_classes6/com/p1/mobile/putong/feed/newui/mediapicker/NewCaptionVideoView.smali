.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;
.super Lv/VFrame;
.source "SourceFile"


# static fields
.field public static g:I


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VImage;

.field public c:Landroid/view/View;

.field public d:Landroid/widget/ImageView;

.field public e:Landroid/widget/ImageView;

.field public f:Ll/w30;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x431c0000    # 156.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->g:I

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/data/Video;Ll/gcg0;)V
    .locals 6

    .line 1
    invoke-interface {p1, p0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/wel0;

    .line 5
    .line 6
    new-instance v1, Ll/vel0;

    .line 7
    .line 8
    iget-object v2, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v2}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-direct {v1, v2}, Ll/vel0;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-direct {v0, v1, v2, v2}, Ll/wel0;-><init>(Ll/vel0;ZZ)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    :cond_0
    invoke-static {p0}, Ll/l7y;->f(Lcom/p1/mobile/putong/data/Video;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    new-instance v3, Lcom/p1/mobile/putong/data/Picture;

    .line 38
    .line 39
    invoke-direct {v3}, Lcom/p1/mobile/putong/data/Picture;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 43
    .line 44
    :try_start_0
    iget-object v3, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v0}, Ll/wel0;->k()[I

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    aget v2, v4, v2

    .line 51
    .line 52
    invoke-virtual {v0}, Ll/wel0;->k()[I

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    const/4 v5, 0x1

    .line 57
    aget v4, v4, v5

    .line 58
    .line 59
    invoke-static {v3, v2, v4, v1}, Ll/wel0;->g(Ljava/lang/String;IILjava/lang/String;)Ljava/io/File;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-eqz v3, :cond_1

    .line 68
    .line 69
    iget-object v3, p0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 70
    .line 71
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-static {v2}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    iput-object v2, v3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :catch_0
    move-exception v2

    .line 83
    goto :goto_0

    .line 84
    :cond_1
    invoke-static {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->E(Lcom/p1/mobile/putong/data/Video;Ll/wel0;Ljava/lang/String;)Ll/wel0;

    .line 85
    .line 86
    .line 87
    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 88
    goto :goto_1

    .line 89
    :goto_0
    invoke-static {v2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 90
    .line 91
    .line 92
    invoke-static {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->E(Lcom/p1/mobile/putong/data/Video;Ll/wel0;Ljava/lang/String;)Ll/wel0;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 97
    .line 98
    new-instance v2, Lcom/p1/mobile/putong/data/Dimension;

    .line 99
    .line 100
    invoke-virtual {v0}, Ll/wel0;->k()[I

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-direct {v2, v0}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 105
    .line 106
    .line 107
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 108
    .line 109
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 110
    .line 111
    const-string v1, "image/jpeg"

    .line 112
    .line 113
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 114
    .line 115
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 116
    .line 117
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {v0, v1}, Ll/fsb0;->x0(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    :cond_2
    invoke-interface {p1, p0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 123
    .line 124
    .line 125
    invoke-interface {p1}, Ll/bb50;->onCompleted()V

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;Landroid/view/View;Ljava/util/ArrayList;ILl/xl80;Ll/y0m;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->K(Landroid/view/View;Ljava/util/ArrayList;ILl/xl80;Ll/y0m;)V

    return-void
.end method

.method public static E(Lcom/p1/mobile/putong/data/Video;Ll/wel0;Ljava/lang/String;)Ll/wel0;
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 3
    .line 4
    iget-object v2, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {p2, v2, v0}, Ll/wel0;->d(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    invoke-static {v2}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;
    :try_end_0
    .catch Lcom/p1/mobile/android/media/TTFFmpegCommand$FFmpegCommandException; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catch_0
    move-exception v1

    .line 18
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v2, "TTFFmpeg command failed with code 1 command"

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    new-instance v1, Ljava/io/File;

    .line 31
    .line 32
    iget-object v2, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v2}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    new-instance v2, Ljava/io/File;

    .line 42
    .line 43
    invoke-static {}, Ll/uqb0;->t0()Ljava/io/File;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    new-instance v4, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    const-string v5, "__copy__"

    .line 50
    .line 51
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v5

    .line 58
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-static {v1, v3}, Ll/oki;->e(Ljava/lang/String;Ljava/lang/String;)Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-eqz v1, :cond_0

    .line 81
    .line 82
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 83
    .line 84
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-static {p2, v1, v0}, Ll/wel0;->d(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    invoke-static {p2}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    iput-object p2, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 103
    .line 104
    new-instance p1, Ll/wel0;

    .line 105
    .line 106
    new-instance p2, Ll/vel0;

    .line 107
    .line 108
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 109
    .line 110
    invoke-static {p0}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-direct {p2, p0}, Ll/vel0;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    invoke-direct {p1, p2, v0, v0}, Ll/wel0;-><init>(Ll/vel0;ZZ)V

    .line 118
    .line 119
    .line 120
    :cond_0
    :goto_0
    return-object p1
.end method

.method private synthetic F(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->f:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/app/PutongAct;Ljava/util/ArrayList;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "e_pick_cover"

    .line 2
    .line 3
    const-string v0, "p_moment_post"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 9
    .line 10
    .line 11
    const/4 p2, 0x0

    .line 12
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 17
    .line 18
    invoke-static {p0, p1}, Ll/cn40;->p0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;Lcom/p1/mobile/putong/app/PutongAct;Ljava/util/ArrayList;ILl/xl80;Ll/y0m;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->L(Lcom/p1/mobile/putong/app/PutongAct;Ljava/util/ArrayList;ILl/xl80;Ll/y0m;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;Ljava/util/ArrayList;ILl/xl80;Ll/y0m;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p7}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->G(Ljava/util/ArrayList;ILl/xl80;Ll/y0m;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;Ljava/util/ArrayList;Lcom/p1/mobile/putong/data/Video;Ll/xl80;Ll/y0m;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->N(Ljava/util/ArrayList;Lcom/p1/mobile/putong/data/Video;Ll/xl80;Ll/y0m;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;Lcom/p1/mobile/putong/data/Video;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->M(Lcom/p1/mobile/putong/data/Video;)V

    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->F(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final synthetic G(Ljava/util/ArrayList;ILl/xl80;Ll/y0m;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 2
    .line 3
    .line 4
    move-result p5

    .line 5
    add-int/lit8 p6, p2, 0x1

    .line 6
    .line 7
    if-lt p5, p6, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 13
    .line 14
    .line 15
    invoke-interface {p4}, Ll/y0m;->a()V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->f:Ll/w30;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic K(Landroid/view/View;Ljava/util/ArrayList;ILl/xl80;Ll/y0m;)V
    .locals 8

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->h:I

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    new-instance v1, Ll/w30$b;

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-direct {v1, p1}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 26
    .line 27
    .line 28
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->a:I

    .line 29
    .line 30
    invoke-virtual {v1, p1}, Ll/w30$b;->H(I)Ll/w30$b;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    new-instance v2, Ll/br20;

    .line 35
    .line 36
    invoke-direct {v2, p0}, Ll/br20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, v2}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1, v0}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    new-instance v2, Ll/cr20;

    .line 48
    .line 49
    move-object v3, p0

    .line 50
    move-object v4, p2

    .line 51
    move v5, p3

    .line 52
    move-object v6, p4

    .line 53
    move-object v7, p5

    .line 54
    invoke-direct/range {v2 .. v7}, Ll/cr20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;Ljava/util/ArrayList;ILl/xl80;Ll/y0m;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, v2}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1}, Ll/w30$b;->F()Ll/w30;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    iput-object p0, v3, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->f:Ll/w30;

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/w30;->f()V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final synthetic L(Lcom/p1/mobile/putong/app/PutongAct;Ljava/util/ArrayList;ILl/xl80;Ll/y0m;Landroid/view/View;)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->f:Ll/w30;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->f:Ll/w30;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/w30;->b()V

    .line 15
    .line 16
    .line 17
    :cond_0
    new-instance v1, Ll/ar20;

    .line 18
    .line 19
    move-object v2, p0

    .line 20
    move-object v4, p2

    .line 21
    move v5, p3

    .line 22
    move-object v6, p4

    .line 23
    move-object v7, p5

    .line 24
    move-object v3, p6

    .line 25
    invoke-direct/range {v1 .. v7}, Ll/ar20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;Landroid/view/View;Ljava/util/ArrayList;ILl/xl80;Ll/y0m;)V

    .line 26
    .line 27
    .line 28
    const-wide/16 p2, 0x190

    .line 29
    .line 30
    invoke-static {p1, v1, p2, p3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic M(Lcom/p1/mobile/putong/data/Video;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->c:Landroid/view/View;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->a:Lv/VDraweeView;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->m0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->c:Landroid/view/View;

    .line 38
    .line 39
    const/4 p1, 0x1

    .line 40
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic N(Ljava/util/ArrayList;Lcom/p1/mobile/putong/data/Video;Ll/xl80;Ll/y0m;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget p5, Lcom/p1/mobile/putong/feed/R$string;->s4:I

    .line 2
    .line 3
    invoke-static {p5}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    iget-object p5, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->b:Lv/VImage;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-static {p5, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p5, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->c:Landroid/view/View;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-static {p5, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->b:Lv/VImage;

    .line 19
    .line 20
    sget p5, Ll/lbc0;->g6:I

    .line 21
    .line 22
    invoke-virtual {p0, p5}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 32
    .line 33
    .line 34
    invoke-interface {p4}, Ll/y0m;->a()V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public final O(Lcom/p1/mobile/putong/data/Video;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 10
    .line 11
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 18
    .line 19
    iget v1, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 20
    .line 21
    if-lez v1, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 33
    .line 34
    iget p1, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 35
    .line 36
    if-lez p1, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    new-instance v0, Lcom/p1/mobile/putong/data/Dimension;

    .line 40
    .line 41
    const/16 p1, 0x168

    .line 42
    .line 43
    const/16 v1, 0x280

    .line 44
    .line 45
    invoke-direct {v0, p1, v1}, Lcom/p1/mobile/putong/data/Dimension;-><init>(II)V

    .line 46
    .line 47
    .line 48
    :goto_0
    iget p1, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 49
    .line 50
    int-to-float p1, p1

    .line 51
    iget v0, v0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 52
    .line 53
    int-to-float v0, v0

    .line 54
    div-float/2addr p1, v0

    .line 55
    sget v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->g:I

    .line 56
    .line 57
    const v1, 0x3f547ae1    # 0.83f

    .line 58
    .line 59
    .line 60
    cmpg-float v1, p1, v1

    .line 61
    .line 62
    if-gtz v1, :cond_2

    .line 63
    .line 64
    mul-int/lit8 p1, v0, 0x4

    .line 65
    .line 66
    div-int/lit8 p1, p1, 0x3

    .line 67
    .line 68
    move v2, v0

    .line 69
    move v0, p1

    .line 70
    move p1, v2

    .line 71
    goto :goto_1

    .line 72
    :cond_2
    const v1, 0x3f99999a    # 1.2f

    .line 73
    .line 74
    .line 75
    cmpl-float p1, p1, v1

    .line 76
    .line 77
    if-ltz p1, :cond_3

    .line 78
    .line 79
    mul-int/lit8 p1, v0, 0x4

    .line 80
    .line 81
    div-int/lit8 p1, p1, 0x3

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_3
    move p1, v0

    .line 85
    :goto_1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 90
    .line 91
    iput p1, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 92
    .line 93
    invoke-virtual {p0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public P(Lcom/p1/mobile/putong/app/PutongAct;Ll/y0m;Ljava/util/ArrayList;Lcom/p1/mobile/putong/data/Video;Ll/xl80;I)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/app/PutongAct;",
            "Ll/y0m;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Lcom/p1/mobile/putong/data/Video;",
            "Ll/xl80;",
            "I)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/j4h;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->e:Landroid/widget/ImageView;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->d:Landroid/widget/ImageView;

    .line 11
    .line 12
    :goto_0
    new-instance v1, Ll/vq20;

    .line 13
    .line 14
    move-object v2, p0

    .line 15
    move-object v3, p1

    .line 16
    move-object v7, p2

    .line 17
    move-object v4, p3

    .line 18
    move-object v6, p5

    .line 19
    move v5, p6

    .line 20
    invoke-direct/range {v1 .. v7}, Ll/vq20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;Lcom/p1/mobile/putong/app/PutongAct;Ljava/util/ArrayList;ILl/xl80;Ll/y0m;)V

    .line 21
    .line 22
    .line 23
    move-object p1, v2

    .line 24
    move-object p2, v4

    .line 25
    move-object p5, v7

    .line 26
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 27
    .line 28
    .line 29
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 30
    .line 31
    iget-object p3, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->a:Lv/VDraweeView;

    .line 32
    .line 33
    invoke-virtual {p0, p3}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, p4}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->O(Lcom/p1/mobile/putong/data/Video;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->a:Lv/VDraweeView;

    .line 40
    .line 41
    new-instance p3, Ll/wq20;

    .line 42
    .line 43
    invoke-direct {p3, v3, p2}, Ll/wq20;-><init>(Lcom/p1/mobile/putong/app/PutongAct;Ljava/util/ArrayList;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 47
    .line 48
    .line 49
    new-instance p0, Ll/xq20;

    .line 50
    .line 51
    invoke-direct {p0, p4}, Ll/xq20;-><init>(Lcom/p1/mobile/putong/data/Video;)V

    .line 52
    .line 53
    .line 54
    invoke-static {p0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 59
    .line 60
    .line 61
    move-result-object p3

    .line 62
    invoke-virtual {p0, p3}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {v6, v3, p0}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object p6

    .line 70
    new-instance v0, Ll/yq20;

    .line 71
    .line 72
    invoke-direct {v0, p1}, Ll/yq20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;)V

    .line 73
    .line 74
    .line 75
    new-instance p0, Ll/zq20;

    .line 76
    .line 77
    move-object p3, p4

    .line 78
    move-object p4, v6

    .line 79
    invoke-direct/range {p0 .. p5}, Ll/zq20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;Ljava/util/ArrayList;Lcom/p1/mobile/putong/data/Video;Ll/xl80;Ll/y0m;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p6, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/hdc0;->m0:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VDraweeView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->a:Lv/VDraweeView;

    .line 13
    .line 14
    sget v0, Ll/hdc0;->q1:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VImage;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->b:Lv/VImage;

    .line 23
    .line 24
    sget v0, Ll/hdc0;->H0:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->c:Landroid/view/View;

    .line 31
    .line 32
    sget v0, Ll/hdc0;->F:I

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Landroid/widget/ImageView;

    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->d:Landroid/widget/ImageView;

    .line 41
    .line 42
    sget v0, Ll/hdc0;->G:I

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Landroid/widget/ImageView;

    .line 49
    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->e:Landroid/widget/ImageView;

    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->d:Landroid/widget/ImageView;

    .line 53
    .line 54
    invoke-static {}, Ll/j4h;->h()Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    xor-int/lit8 v1, v1, 0x1

    .line 59
    .line 60
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->e:Landroid/widget/ImageView;

    .line 64
    .line 65
    invoke-static {}, Ll/j4h;->h()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 70
    .line 71
    .line 72
    return-void
.end method
