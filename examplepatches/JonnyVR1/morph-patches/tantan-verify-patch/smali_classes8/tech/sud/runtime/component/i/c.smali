.class public Ltech/sud/runtime/component/i/c;
.super Landroid/view/SurfaceView;
.source "SourceFile"

# interfaces
.implements Landroid/widget/MediaController$MediaPlayerControl;


# instance fields
.field private A:F

.field private B:I

.field private C:Ltech/sud/runtime/component/i/a;

.field private D:Z

.field private E:Z

.field private F:Ljava/lang/String;

.field private G:Z

.field private H:Landroid/media/MediaPlayer$OnCompletionListener;

.field private I:Landroid/media/MediaPlayer$OnErrorListener;

.field private J:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

.field protected a:Landroid/content/Context;

.field protected b:I

.field protected c:I

.field protected d:I

.field protected e:I

.field protected f:I

.field protected g:I

.field protected h:I

.field protected i:I

.field protected j:Z

.field protected k:I

.field protected l:I

.field m:Landroid/media/MediaPlayer$OnPreparedListener;

.field n:Landroid/view/SurfaceHolder$Callback;

.field private o:Ljava/lang/String;

.field private p:Landroid/net/Uri;

.field private q:I

.field private r:I

.field private s:I

.field private t:Landroid/view/SurfaceHolder;

.field private u:Landroid/media/MediaPlayer;

.field private v:I

.field private w:I

.field private x:Ltech/sud/runtime/component/i/d;

.field private y:I

.field private z:I


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "VideoView"

    .line 5
    .line 6
    iput-object v0, p0, Ltech/sud/runtime/component/i/c;->o:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Ltech/sud/runtime/component/i/c;->r:I

    .line 10
    .line 11
    iput v0, p0, Ltech/sud/runtime/component/i/c;->s:I

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    iput-object v1, p0, Ltech/sud/runtime/component/i/c;->t:Landroid/view/SurfaceHolder;

    .line 15
    .line 16
    iput-object v1, p0, Ltech/sud/runtime/component/i/c;->u:Landroid/media/MediaPlayer;

    .line 17
    .line 18
    iput v0, p0, Ltech/sud/runtime/component/i/c;->v:I

    .line 19
    .line 20
    iput v0, p0, Ltech/sud/runtime/component/i/c;->w:I

    .line 21
    .line 22
    iput-object v1, p0, Ltech/sud/runtime/component/i/c;->a:Landroid/content/Context;

    .line 23
    .line 24
    iput v0, p0, Ltech/sud/runtime/component/i/c;->b:I

    .line 25
    .line 26
    iput v0, p0, Ltech/sud/runtime/component/i/c;->c:I

    .line 27
    .line 28
    iput v0, p0, Ltech/sud/runtime/component/i/c;->d:I

    .line 29
    .line 30
    iput v0, p0, Ltech/sud/runtime/component/i/c;->e:I

    .line 31
    .line 32
    iput v0, p0, Ltech/sud/runtime/component/i/c;->f:I

    .line 33
    .line 34
    iput v0, p0, Ltech/sud/runtime/component/i/c;->g:I

    .line 35
    .line 36
    iput v0, p0, Ltech/sud/runtime/component/i/c;->h:I

    .line 37
    .line 38
    iput v0, p0, Ltech/sud/runtime/component/i/c;->i:I

    .line 39
    .line 40
    iput-boolean v0, p0, Ltech/sud/runtime/component/i/c;->j:Z

    .line 41
    .line 42
    iput v0, p0, Ltech/sud/runtime/component/i/c;->k:I

    .line 43
    .line 44
    iput v0, p0, Ltech/sud/runtime/component/i/c;->l:I

    .line 45
    .line 46
    iput v0, p0, Ltech/sud/runtime/component/i/c;->B:I

    .line 47
    .line 48
    iput-boolean v0, p0, Ltech/sud/runtime/component/i/c;->D:Z

    .line 49
    .line 50
    iput-boolean v0, p0, Ltech/sud/runtime/component/i/c;->E:Z

    .line 51
    .line 52
    iput-object v1, p0, Ltech/sud/runtime/component/i/c;->F:Ljava/lang/String;

    .line 53
    .line 54
    iput-boolean v0, p0, Ltech/sud/runtime/component/i/c;->G:Z

    .line 55
    .line 56
    new-instance v0, Ltech/sud/runtime/component/i/c$1;

    .line 57
    .line 58
    invoke-direct {v0, p0}, Ltech/sud/runtime/component/i/c$1;-><init>(Ltech/sud/runtime/component/i/c;)V

    .line 59
    .line 60
    .line 61
    iput-object v0, p0, Ltech/sud/runtime/component/i/c;->m:Landroid/media/MediaPlayer$OnPreparedListener;

    .line 62
    .line 63
    new-instance v0, Ltech/sud/runtime/component/i/c$2;

    .line 64
    .line 65
    invoke-direct {v0, p0}, Ltech/sud/runtime/component/i/c$2;-><init>(Ltech/sud/runtime/component/i/c;)V

    .line 66
    .line 67
    .line 68
    iput-object v0, p0, Ltech/sud/runtime/component/i/c;->H:Landroid/media/MediaPlayer$OnCompletionListener;

    .line 69
    .line 70
    new-instance v0, Ltech/sud/runtime/component/i/c$3;

    .line 71
    .line 72
    invoke-direct {v0, p0}, Ltech/sud/runtime/component/i/c$3;-><init>(Ltech/sud/runtime/component/i/c;)V

    .line 73
    .line 74
    .line 75
    iput-object v0, p0, Ltech/sud/runtime/component/i/c;->I:Landroid/media/MediaPlayer$OnErrorListener;

    .line 76
    .line 77
    new-instance v0, Ltech/sud/runtime/component/i/c$4;

    .line 78
    .line 79
    invoke-direct {v0, p0}, Ltech/sud/runtime/component/i/c$4;-><init>(Ltech/sud/runtime/component/i/c;)V

    .line 80
    .line 81
    .line 82
    iput-object v0, p0, Ltech/sud/runtime/component/i/c;->J:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

    .line 83
    .line 84
    new-instance v0, Ltech/sud/runtime/component/i/c$5;

    .line 85
    .line 86
    invoke-direct {v0, p0}, Ltech/sud/runtime/component/i/c$5;-><init>(Ltech/sud/runtime/component/i/c;)V

    .line 87
    .line 88
    .line 89
    iput-object v0, p0, Ltech/sud/runtime/component/i/c;->n:Landroid/view/SurfaceHolder$Callback;

    .line 90
    .line 91
    iput p2, p0, Ltech/sud/runtime/component/i/c;->B:I

    .line 92
    .line 93
    iput-object p1, p0, Ltech/sud/runtime/component/i/c;->a:Landroid/content/Context;

    .line 94
    .line 95
    invoke-direct {p0}, Ltech/sud/runtime/component/i/c;->d()V

    .line 96
    .line 97
    .line 98
    new-instance p2, Ltech/sud/runtime/component/i/a;

    .line 99
    .line 100
    invoke-direct {p2, p1, p0}, Ltech/sud/runtime/component/i/a;-><init>(Landroid/content/Context;Ltech/sud/runtime/component/i/c;)V

    .line 101
    .line 102
    .line 103
    iput-object p2, p0, Ltech/sud/runtime/component/i/c;->C:Ltech/sud/runtime/component/i/a;

    .line 104
    .line 105
    return-void
.end method

.method public static synthetic a(Ltech/sud/runtime/component/i/c;I)I
    .locals 0

    .line 131
    iput p1, p0, Ltech/sud/runtime/component/i/c;->r:I

    return p1
.end method

.method public static synthetic a(Ltech/sud/runtime/component/i/c;Landroid/view/SurfaceHolder;)Landroid/view/SurfaceHolder;
    .locals 0

    .line 113
    iput-object p1, p0, Ltech/sud/runtime/component/i/c;->t:Landroid/view/SurfaceHolder;

    return-object p1
.end method

.method public static synthetic a(Ltech/sud/runtime/component/i/c;)Ltech/sud/runtime/component/i/d;
    .locals 0

    .line 114
    iget-object p0, p0, Ltech/sud/runtime/component/i/c;->x:Ltech/sud/runtime/component/i/d;

    return-object p0
.end method

.method private a(Landroid/net/Uri;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 121
    iput-object p1, p0, Ltech/sud/runtime/component/i/c;->p:Landroid/net/Uri;

    const/4 p1, 0x0

    .line 122
    iput p1, p0, Ltech/sud/runtime/component/i/c;->z:I

    const/high16 p2, 0x3f800000    # 1.0f

    .line 123
    iput p2, p0, Ltech/sud/runtime/component/i/c;->A:F

    .line 124
    iput p1, p0, Ltech/sud/runtime/component/i/c;->v:I

    .line 125
    iput p1, p0, Ltech/sud/runtime/component/i/c;->w:I

    .line 126
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 127
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public static synthetic a(Ltech/sud/runtime/component/i/c;Z)V
    .locals 0

    .line 115
    invoke-direct {p0, p1}, Ltech/sud/runtime/component/i/c;->a(Z)V

    return-void
.end method

.method private a(Z)V
    .locals 1

    .line 132
    iget-object v0, p0, Ltech/sud/runtime/component/i/c;->u:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 133
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->reset()V

    .line 134
    iget-object v0, p0, Ltech/sud/runtime/component/i/c;->u:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    const/4 v0, 0x0

    .line 135
    iput-object v0, p0, Ltech/sud/runtime/component/i/c;->u:Landroid/media/MediaPlayer;

    const/4 v0, 0x0

    .line 136
    iput v0, p0, Ltech/sud/runtime/component/i/c;->r:I

    if-eqz p1, :cond_0

    .line 137
    iput v0, p0, Ltech/sud/runtime/component/i/c;->s:I

    :cond_0
    return-void
.end method

.method public static synthetic b(Ltech/sud/runtime/component/i/c;)I
    .locals 0

    .line 15
    iget p0, p0, Ltech/sud/runtime/component/i/c;->B:I

    return p0
.end method

.method public static synthetic b(Ltech/sud/runtime/component/i/c;I)I
    .locals 0

    .line 14
    iput p1, p0, Ltech/sud/runtime/component/i/c;->v:I

    return p1
.end method

.method public static synthetic c(Ltech/sud/runtime/component/i/c;)I
    .locals 0

    .line 19
    iget p0, p0, Ltech/sud/runtime/component/i/c;->z:I

    return p0
.end method

.method public static synthetic c(Ltech/sud/runtime/component/i/c;I)I
    .locals 0

    .line 18
    iput p1, p0, Ltech/sud/runtime/component/i/c;->w:I

    return p1
.end method

.method public static synthetic d(Ltech/sud/runtime/component/i/c;)F
    .locals 0

    .line 36
    iget p0, p0, Ltech/sud/runtime/component/i/c;->A:F

    return p0
.end method

.method public static synthetic d(Ltech/sud/runtime/component/i/c;I)I
    .locals 0

    .line 35
    iput p1, p0, Ltech/sud/runtime/component/i/c;->s:I

    return p1
.end method

.method private d()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ltech/sud/runtime/component/i/c;->v:I

    .line 3
    .line 4
    iput v0, p0, Ltech/sud/runtime/component/i/c;->w:I

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iget-object v2, p0, Ltech/sud/runtime/component/i/c;->n:Landroid/view/SurfaceHolder$Callback;

    .line 11
    .line 12
    invoke-interface {v1, v2}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const/4 v2, 0x3

    .line 20
    invoke-interface {v1, v2}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 21
    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    invoke-virtual {p0, v1}, Landroid/view/View;->setFocusable(Z)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v1}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 28
    .line 29
    .line 30
    iput v0, p0, Ltech/sud/runtime/component/i/c;->r:I

    .line 31
    .line 32
    iput v0, p0, Ltech/sud/runtime/component/i/c;->s:I

    .line 33
    .line 34
    return-void
.end method

.method public static synthetic e(Ltech/sud/runtime/component/i/c;I)I
    .locals 0

    .line 201
    iput p1, p0, Ltech/sud/runtime/component/i/c;->y:I

    return p1
.end method

.method public static synthetic e(Ltech/sud/runtime/component/i/c;)Landroid/media/MediaPlayer;
    .locals 0

    .line 200
    iget-object p0, p0, Ltech/sud/runtime/component/i/c;->u:Landroid/media/MediaPlayer;

    return-object p0
.end method

.method private e()V
    .locals 11

    .line 1
    const-string v1, "Unable to open content: "

    .line 2
    .line 3
    iget-object v0, p0, Ltech/sud/runtime/component/i/c;->t:Landroid/view/SurfaceHolder;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-boolean v0, p0, Ltech/sud/runtime/component/i/c;->E:Z

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Ltech/sud/runtime/component/i/c;->F:Ljava/lang/String;

    .line 13
    .line 14
    if-nez v0, :cond_2

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    iget-object v0, p0, Ltech/sud/runtime/component/i/c;->p:Landroid/net/Uri;

    .line 18
    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    :goto_0
    return-void

    .line 22
    :cond_2
    const/4 v2, 0x0

    .line 23
    invoke-direct {p0, v2}, Ltech/sud/runtime/component/i/c;->a(Z)V

    .line 24
    .line 25
    .line 26
    const/4 v3, 0x1

    .line 27
    const/4 v4, -0x1

    .line 28
    :try_start_0
    new-instance v0, Landroid/media/MediaPlayer;

    .line 29
    .line 30
    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ltech/sud/runtime/component/i/c;->u:Landroid/media/MediaPlayer;

    .line 34
    .line 35
    iget-object v5, p0, Ltech/sud/runtime/component/i/c;->m:Landroid/media/MediaPlayer$OnPreparedListener;

    .line 36
    .line 37
    invoke-virtual {v0, v5}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ltech/sud/runtime/component/i/c;->u:Landroid/media/MediaPlayer;

    .line 41
    .line 42
    iget-object v5, p0, Ltech/sud/runtime/component/i/c;->H:Landroid/media/MediaPlayer$OnCompletionListener;

    .line 43
    .line 44
    invoke-virtual {v0, v5}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ltech/sud/runtime/component/i/c;->u:Landroid/media/MediaPlayer;

    .line 48
    .line 49
    iget-object v5, p0, Ltech/sud/runtime/component/i/c;->I:Landroid/media/MediaPlayer$OnErrorListener;

    .line 50
    .line 51
    invoke-virtual {v0, v5}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ltech/sud/runtime/component/i/c;->u:Landroid/media/MediaPlayer;

    .line 55
    .line 56
    iget-object v5, p0, Ltech/sud/runtime/component/i/c;->J:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

    .line 57
    .line 58
    invoke-virtual {v0, v5}, Landroid/media/MediaPlayer;->setOnBufferingUpdateListener(Landroid/media/MediaPlayer$OnBufferingUpdateListener;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ltech/sud/runtime/component/i/c;->u:Landroid/media/MediaPlayer;

    .line 62
    .line 63
    iget-object v5, p0, Ltech/sud/runtime/component/i/c;->t:Landroid/view/SurfaceHolder;

    .line 64
    .line 65
    invoke-virtual {v0, v5}, Landroid/media/MediaPlayer;->setDisplay(Landroid/view/SurfaceHolder;)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ltech/sud/runtime/component/i/c;->u:Landroid/media/MediaPlayer;

    .line 69
    .line 70
    const/4 v5, 0x3

    .line 71
    invoke-virtual {v0, v5}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Ltech/sud/runtime/component/i/c;->u:Landroid/media/MediaPlayer;

    .line 75
    .line 76
    invoke-virtual {v0, v3}, Landroid/media/MediaPlayer;->setScreenOnWhilePlaying(Z)V

    .line 77
    .line 78
    .line 79
    iput v4, p0, Ltech/sud/runtime/component/i/c;->q:I

    .line 80
    .line 81
    iput v2, p0, Ltech/sud/runtime/component/i/c;->y:I

    .line 82
    .line 83
    iget-boolean v0, p0, Ltech/sud/runtime/component/i/c;->E:Z

    .line 84
    .line 85
    if-eqz v0, :cond_3

    .line 86
    .line 87
    iget-object v0, p0, Ltech/sud/runtime/component/i/c;->a:Landroid/content/Context;

    .line 88
    .line 89
    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iget-object v5, p0, Ltech/sud/runtime/component/i/c;->F:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {v0, v5}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    iget-object v5, p0, Ltech/sud/runtime/component/i/c;->u:Landroid/media/MediaPlayer;

    .line 100
    .line 101
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    .line 102
    .line 103
    .line 104
    move-result-object v6

    .line 105
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    .line 106
    .line 107
    .line 108
    move-result-wide v7

    .line 109
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    .line 110
    .line 111
    .line 112
    move-result-wide v9

    .line 113
    invoke-virtual/range {v5 .. v10}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V

    .line 114
    .line 115
    .line 116
    goto :goto_1

    .line 117
    :catch_0
    move-exception v0

    .line 118
    goto :goto_2

    .line 119
    :catch_1
    move-exception v0

    .line 120
    goto :goto_3

    .line 121
    :cond_3
    iget-object v0, p0, Ltech/sud/runtime/component/i/c;->u:Landroid/media/MediaPlayer;

    .line 122
    .line 123
    iget-object v5, p0, Ltech/sud/runtime/component/i/c;->a:Landroid/content/Context;

    .line 124
    .line 125
    iget-object v6, p0, Ltech/sud/runtime/component/i/c;->p:Landroid/net/Uri;

    .line 126
    .line 127
    invoke-virtual {v0, v5, v6}, Landroid/media/MediaPlayer;->setDataSource(Landroid/content/Context;Landroid/net/Uri;)V

    .line 128
    .line 129
    .line 130
    :goto_1
    iget-object v0, p0, Ltech/sud/runtime/component/i/c;->u:Landroid/media/MediaPlayer;

    .line 131
    .line 132
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepareAsync()V

    .line 133
    .line 134
    .line 135
    iput v3, p0, Ltech/sud/runtime/component/i/c;->r:I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 136
    .line 137
    return-void

    .line 138
    :goto_2
    iget-object v5, p0, Ltech/sud/runtime/component/i/c;->o:Ljava/lang/String;

    .line 139
    .line 140
    new-instance v6, Ljava/lang/StringBuilder;

    .line 141
    .line 142
    invoke-direct {v6, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    iget-object v1, p0, Ltech/sud/runtime/component/i/c;->p:Landroid/net/Uri;

    .line 146
    .line 147
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    invoke-static {v5, v1, v0}, Ltech/sud/runtime/component/h/f;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 155
    .line 156
    .line 157
    iput v4, p0, Ltech/sud/runtime/component/i/c;->r:I

    .line 158
    .line 159
    iput v4, p0, Ltech/sud/runtime/component/i/c;->s:I

    .line 160
    .line 161
    iget-object v0, p0, Ltech/sud/runtime/component/i/c;->I:Landroid/media/MediaPlayer$OnErrorListener;

    .line 162
    .line 163
    iget-object p0, p0, Ltech/sud/runtime/component/i/c;->u:Landroid/media/MediaPlayer;

    .line 164
    .line 165
    invoke-interface {v0, p0, v3, v2}, Landroid/media/MediaPlayer$OnErrorListener;->onError(Landroid/media/MediaPlayer;II)Z

    .line 166
    .line 167
    .line 168
    return-void

    .line 169
    :goto_3
    iget-object v5, p0, Ltech/sud/runtime/component/i/c;->o:Ljava/lang/String;

    .line 170
    .line 171
    new-instance v6, Ljava/lang/StringBuilder;

    .line 172
    .line 173
    invoke-direct {v6, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    iget-object v1, p0, Ltech/sud/runtime/component/i/c;->p:Landroid/net/Uri;

    .line 177
    .line 178
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    invoke-static {v5, v1, v0}, Ltech/sud/runtime/component/h/f;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 186
    .line 187
    .line 188
    iput v4, p0, Ltech/sud/runtime/component/i/c;->r:I

    .line 189
    .line 190
    iput v4, p0, Ltech/sud/runtime/component/i/c;->s:I

    .line 191
    .line 192
    iget-object v0, p0, Ltech/sud/runtime/component/i/c;->I:Landroid/media/MediaPlayer$OnErrorListener;

    .line 193
    .line 194
    iget-object p0, p0, Ltech/sud/runtime/component/i/c;->u:Landroid/media/MediaPlayer;

    .line 195
    .line 196
    invoke-interface {v0, p0, v3, v2}, Landroid/media/MediaPlayer$OnErrorListener;->onError(Landroid/media/MediaPlayer;II)Z

    .line 197
    .line 198
    .line 199
    return-void
.end method

.method public static synthetic f(Ltech/sud/runtime/component/i/c;)I
    .locals 0

    .line 1
    iget p0, p0, Ltech/sud/runtime/component/i/c;->s:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic g(Ltech/sud/runtime/component/i/c;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/i/c;->o:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h(Ltech/sud/runtime/component/i/c;)I
    .locals 0

    .line 1
    iget p0, p0, Ltech/sud/runtime/component/i/c;->v:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic i(Ltech/sud/runtime/component/i/c;)I
    .locals 0

    .line 1
    iget p0, p0, Ltech/sud/runtime/component/i/c;->w:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic j(Ltech/sud/runtime/component/i/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltech/sud/runtime/component/i/c;->e()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()V
    .locals 4

    .line 128
    iget-boolean v0, p0, Ltech/sud/runtime/component/i/c;->j:Z

    if-eqz v0, :cond_0

    .line 129
    iget v0, p0, Ltech/sud/runtime/component/i/c;->k:I

    iget v1, p0, Ltech/sud/runtime/component/i/c;->l:I

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v2, v0, v1}, Ltech/sud/runtime/component/i/c;->a(IIII)V

    return-void

    .line 130
    :cond_0
    iget v0, p0, Ltech/sud/runtime/component/i/c;->b:I

    iget v1, p0, Ltech/sud/runtime/component/i/c;->c:I

    iget v2, p0, Ltech/sud/runtime/component/i/c;->d:I

    iget v3, p0, Ltech/sud/runtime/component/i/c;->e:I

    invoke-virtual {p0, v0, v1, v2, v3}, Ltech/sud/runtime/component/i/c;->a(IIII)V

    return-void
.end method

.method public a(IIII)V
    .locals 4

    .line 1
    iget v0, p0, Ltech/sud/runtime/component/i/c;->v:I

    .line 2
    .line 3
    if-eqz v0, :cond_5

    .line 4
    .line 5
    iget v1, p0, Ltech/sud/runtime/component/i/c;->w:I

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    if-eqz p3, :cond_4

    .line 11
    .line 12
    if-eqz p4, :cond_4

    .line 13
    .line 14
    iget-boolean v2, p0, Ltech/sud/runtime/component/i/c;->G:Z

    .line 15
    .line 16
    if-eqz v2, :cond_3

    .line 17
    .line 18
    mul-int v2, v0, p4

    .line 19
    .line 20
    mul-int v3, p3, v1

    .line 21
    .line 22
    if-le v2, v3, :cond_1

    .line 23
    .line 24
    iput p3, p0, Ltech/sud/runtime/component/i/c;->h:I

    .line 25
    .line 26
    div-int/2addr v3, v0

    .line 27
    iput v3, p0, Ltech/sud/runtime/component/i/c;->i:I

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    if-ge v2, v3, :cond_2

    .line 31
    .line 32
    div-int/2addr v2, v1

    .line 33
    iput v2, p0, Ltech/sud/runtime/component/i/c;->h:I

    .line 34
    .line 35
    iput p4, p0, Ltech/sud/runtime/component/i/c;->i:I

    .line 36
    .line 37
    :cond_2
    :goto_0
    iget v0, p0, Ltech/sud/runtime/component/i/c;->h:I

    .line 38
    .line 39
    sub-int/2addr p3, v0

    .line 40
    div-int/lit8 p3, p3, 0x2

    .line 41
    .line 42
    add-int/2addr p3, p1

    .line 43
    iput p3, p0, Ltech/sud/runtime/component/i/c;->f:I

    .line 44
    .line 45
    iget p1, p0, Ltech/sud/runtime/component/i/c;->i:I

    .line 46
    .line 47
    sub-int/2addr p4, p1

    .line 48
    div-int/lit8 p4, p4, 0x2

    .line 49
    .line 50
    add-int/2addr p4, p2

    .line 51
    iput p4, p0, Ltech/sud/runtime/component/i/c;->g:I

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_3
    iput p1, p0, Ltech/sud/runtime/component/i/c;->f:I

    .line 55
    .line 56
    iput p2, p0, Ltech/sud/runtime/component/i/c;->g:I

    .line 57
    .line 58
    iput p3, p0, Ltech/sud/runtime/component/i/c;->h:I

    .line 59
    .line 60
    iput p4, p0, Ltech/sud/runtime/component/i/c;->i:I

    .line 61
    .line 62
    goto :goto_2

    .line 63
    :cond_4
    iput p1, p0, Ltech/sud/runtime/component/i/c;->f:I

    .line 64
    .line 65
    iput p2, p0, Ltech/sud/runtime/component/i/c;->g:I

    .line 66
    .line 67
    iput v0, p0, Ltech/sud/runtime/component/i/c;->h:I

    .line 68
    .line 69
    iput v1, p0, Ltech/sud/runtime/component/i/c;->i:I

    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_5
    :goto_1
    iput p1, p0, Ltech/sud/runtime/component/i/c;->f:I

    .line 73
    .line 74
    iput p2, p0, Ltech/sud/runtime/component/i/c;->g:I

    .line 75
    .line 76
    iput p3, p0, Ltech/sud/runtime/component/i/c;->h:I

    .line 77
    .line 78
    iput p4, p0, Ltech/sud/runtime/component/i/c;->i:I

    .line 79
    .line 80
    :goto_2
    invoke-virtual {p0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    iget p2, p0, Ltech/sud/runtime/component/i/c;->h:I

    .line 85
    .line 86
    iget p3, p0, Ltech/sud/runtime/component/i/c;->i:I

    .line 87
    .line 88
    invoke-interface {p1, p2, p3}, Landroid/view/SurfaceHolder;->setFixedSize(II)V

    .line 89
    .line 90
    .line 91
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 92
    .line 93
    const/4 p2, -0x2

    .line 94
    invoke-direct {p1, p2, p2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 95
    .line 96
    .line 97
    iget p2, p0, Ltech/sud/runtime/component/i/c;->f:I

    .line 98
    .line 99
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 100
    .line 101
    iget p2, p0, Ltech/sud/runtime/component/i/c;->g:I

    .line 102
    .line 103
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 104
    .line 105
    const/16 p2, 0x33

    .line 106
    .line 107
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 108
    .line 109
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public a(ZII)V
    .locals 1

    .line 116
    iput-boolean p1, p0, Ltech/sud/runtime/component/i/c;->j:Z

    .line 117
    iget-object v0, p0, Ltech/sud/runtime/component/i/c;->C:Ltech/sud/runtime/component/i/a;

    invoke-virtual {v0, p1}, Ltech/sud/runtime/component/i/a;->a(Z)V

    if-eqz p2, :cond_0

    if-eqz p3, :cond_0

    .line 118
    iput p2, p0, Ltech/sud/runtime/component/i/c;->k:I

    .line 119
    iput p3, p0, Ltech/sud/runtime/component/i/c;->l:I

    .line 120
    :cond_0
    invoke-virtual {p0}, Ltech/sud/runtime/component/i/c;->a()V

    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ltech/sud/runtime/component/i/c;->pause()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ltech/sud/runtime/component/i/c;->x:Ltech/sud/runtime/component/i/d;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget p0, p0, Ltech/sud/runtime/component/i/c;->B:I

    .line 9
    .line 10
    invoke-interface {v0, p0}, Ltech/sud/runtime/component/i/d;->a(I)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public c()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/i/c;->u:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Ltech/sud/runtime/component/i/c;->r:I

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    if-eq p0, v0, :cond_0

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    if-eq p0, v0, :cond_0

    .line 14
    .line 15
    return v0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public canPause()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public canSeekBackward()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public canSeekForward()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public getAudioSessionId()I
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/i/c;->u:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->getAudioSessionId()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getBufferPercentage()I
    .locals 1

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/i/c;->u:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Ltech/sud/runtime/component/i/c;->y:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public getCurrentPosition()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Ltech/sud/runtime/component/i/c;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ltech/sud/runtime/component/i/c;->u:Landroid/media/MediaPlayer;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public getDuration()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Ltech/sud/runtime/component/i/c;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget v0, p0, Ltech/sud/runtime/component/i/c;->q:I

    .line 8
    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    return v0

    .line 12
    :cond_0
    iget-object v0, p0, Ltech/sud/runtime/component/i/c;->u:Landroid/media/MediaPlayer;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getDuration()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput v0, p0, Ltech/sud/runtime/component/i/c;->q:I

    .line 19
    .line 20
    return v0

    .line 21
    :cond_1
    const/4 v0, -0x1

    .line 22
    iput v0, p0, Ltech/sud/runtime/component/i/c;->q:I

    .line 23
    .line 24
    return v0
.end method

.method public getVideoControlView()Ltech/sud/runtime/component/i/a;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/i/c;->C:Ltech/sud/runtime/component/i/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public isPlaying()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ltech/sud/runtime/component/i/c;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ltech/sud/runtime/component/i/c;->u:Landroid/media/MediaPlayer;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->isPlaying()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public pause()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ltech/sud/runtime/component/i/c;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x4

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Ltech/sud/runtime/component/i/c;->u:Landroid/media/MediaPlayer;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ltech/sud/runtime/component/i/c;->u:Landroid/media/MediaPlayer;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 19
    .line 20
    .line 21
    iput v1, p0, Ltech/sud/runtime/component/i/c;->r:I

    .line 22
    .line 23
    :cond_0
    iput v1, p0, Ltech/sud/runtime/component/i/c;->s:I

    .line 24
    .line 25
    return-void
.end method

.method public seekTo(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ltech/sud/runtime/component/i/c;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ltech/sud/runtime/component/i/c;->u:Landroid/media/MediaPlayer;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 10
    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput p1, p0, Ltech/sud/runtime/component/i/c;->z:I

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iput p1, p0, Ltech/sud/runtime/component/i/c;->z:I

    .line 17
    .line 18
    return-void
.end method

.method public setEventCallback(Ltech/sud/runtime/component/i/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/runtime/component/i/c;->x:Ltech/sud/runtime/component/i/d;

    .line 2
    .line 3
    return-void
.end method

.method public setKeepRatio(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltech/sud/runtime/component/i/c;->G:Z

    .line 2
    .line 3
    return-void
.end method

.method public setVideoFileName(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "assets/"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x7

    .line 10
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    :cond_0
    const-string v0, "/"

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-boolean v0, p0, Ltech/sud/runtime/component/i/c;->E:Z

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    iput-object p1, p0, Ltech/sud/runtime/component/i/c;->F:Ljava/lang/String;

    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    iput-boolean v0, p0, Ltech/sud/runtime/component/i/c;->E:Z

    .line 30
    .line 31
    :goto_0
    new-instance v0, Ljava/io/File;

    .line 32
    .line 33
    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const/4 v0, 0x0

    .line 41
    invoke-direct {p0, p1, v0}, Ltech/sud/runtime/component/i/c;->a(Landroid/net/Uri;Ljava/util/Map;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public setVideoURL(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ltech/sud/runtime/component/i/c;->E:Z

    .line 3
    .line 4
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, p1, v0}, Ltech/sud/runtime/component/i/c;->a(Landroid/net/Uri;Ljava/util/Map;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setVisibility(I)V
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    invoke-virtual {p0}, Ltech/sud/runtime/component/i/c;->isPlaying()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iput-boolean v0, p0, Ltech/sud/runtime/component/i/c;->D:Z

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Ltech/sud/runtime/component/i/c;->getCurrentPosition()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iput v0, p0, Ltech/sud/runtime/component/i/c;->z:I

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-boolean v0, p0, Ltech/sud/runtime/component/i/c;->D:Z

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Ltech/sud/runtime/component/i/c;->start()V

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput-boolean v0, p0, Ltech/sud/runtime/component/i/c;->D:Z

    .line 28
    .line 29
    :cond_1
    :goto_0
    invoke-super {p0, p1}, Landroid/view/SurfaceView;->setVisibility(I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public setVolume(F)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ltech/sud/runtime/component/i/c;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ltech/sud/runtime/component/i/c;->u:Landroid/media/MediaPlayer;

    .line 8
    .line 9
    invoke-virtual {v0, p1, p1}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iput p1, p0, Ltech/sud/runtime/component/i/c;->A:F

    .line 13
    .line 14
    return-void
.end method

.method public start()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ltech/sud/runtime/component/i/c;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x3

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Ltech/sud/runtime/component/i/c;->u:Landroid/media/MediaPlayer;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 11
    .line 12
    .line 13
    iput v1, p0, Ltech/sud/runtime/component/i/c;->r:I

    .line 14
    .line 15
    :cond_0
    iput v1, p0, Ltech/sud/runtime/component/i/c;->s:I

    .line 16
    .line 17
    return-void
.end method
