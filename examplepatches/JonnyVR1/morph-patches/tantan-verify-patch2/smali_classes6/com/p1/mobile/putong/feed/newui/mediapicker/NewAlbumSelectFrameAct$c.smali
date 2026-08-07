.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$c;
.super Ll/l51$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->h3(Ljava/lang/Integer;Lv/VDraweeView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lv/VDraweeView;

.field public final synthetic b:Ljava/lang/Integer;

.field public final synthetic c:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;Lv/VDraweeView;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$c;->c:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$c;->a:Lv/VDraweeView;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$c;->b:Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-direct {p0}, Ll/l51$c;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Lv/VDraweeView;Ljava/lang/Integer;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eq v0, p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 9
    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v1, "file://"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-virtual {p1, p0, p2}, Ll/fsb0;->i0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$c;->a:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$c;->b:Ljava/lang/Integer;

    .line 8
    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    goto/16 :goto_1

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$c;->c:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->H2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;I)J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    new-instance v2, Ljava/io/File;

    .line 24
    .line 25
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$c;->c:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 26
    .line 27
    invoke-static {v3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->q2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)Ljava/io/File;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    new-instance v4, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v5, ".jpeg"

    .line 40
    .line 41
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    if-eqz v3, :cond_1

    .line 56
    .line 57
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    goto :goto_0

    .line 62
    :cond_1
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$c;->c:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 63
    .line 64
    invoke-static {v3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->D2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    invoke-virtual {v3, v0, v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getFrameAtTime(J)Landroid/graphics/Bitmap;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    if-eqz v4, :cond_2

    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$c;->c:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 79
    .line 80
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->w2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)Ll/vel0;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iget v0, v0, Ll/vel0;->f:I

    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$c;->c:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 87
    .line 88
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->s2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    invoke-static {v3, v2, v0, v1}, Ll/ecj;->M(Landroid/graphics/Bitmap;Ljava/io/File;II)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    goto :goto_0

    .line 97
    :cond_2
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$c;->c:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 102
    .line 103
    invoke-static {v3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->B2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)Lcom/p1/mobile/putong/data/Video;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 108
    .line 109
    const-wide/16 v4, 0x3e8

    .line 110
    .line 111
    div-long/2addr v0, v4

    .line 112
    long-to-int v0, v0

    .line 113
    invoke-static {v2, v3, v0}, Ll/wel0;->d(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$c;->a:Lv/VDraweeView;

    .line 118
    .line 119
    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$c;->b:Ljava/lang/Integer;

    .line 124
    .line 125
    if-ne v1, v2, :cond_3

    .line 126
    .line 127
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    if-nez v1, :cond_3

    .line 132
    .line 133
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$c;->a:Lv/VDraweeView;

    .line 134
    .line 135
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$c;->b:Ljava/lang/Integer;

    .line 136
    .line 137
    new-instance v2, Ll/cp20;

    .line 138
    .line 139
    invoke-direct {v2, v1, p0, v0}, Ll/cp20;-><init>(Lv/VDraweeView;Ljava/lang/Integer;Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    invoke-static {v2}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 143
    .line 144
    .line 145
    :cond_3
    :goto_1
    return-void
.end method
