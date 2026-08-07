.class public Ll/cu10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wjm0;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/cu10$e;
    }
.end annotation


# instance fields
.field private A:Z

.field B:Ljava/lang/String;

.field C:Z

.field D:Ljava/lang/String;

.field E:Ljava/lang/String;

.field private a:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/immomo/moment/model/VideoFragment;",
            ">;"
        }
    .end annotation
.end field

.field private b:Ljava/lang/String;

.field private c:Ljava/lang/String;

.field private d:Z

.field private e:Ll/lpw;

.field public f:Ll/xjl0;

.field private g:Z

.field private h:Ll/apw;

.field private i:I

.field final j:Ljava/lang/Object;

.field private k:Ll/qow;

.field private l:Ll/sow;

.field m:Ll/nb4;

.field private n:Ll/bpw;

.field private o:Ll/qpw;

.field private p:Ll/epw;

.field q:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/SurfaceHolder;",
            ">;"
        }
    .end annotation
.end field

.field private r:Ll/ypl$f;

.field private s:Z

.field private t:Z

.field private u:I

.field private v:I

.field private w:I

.field private x:Landroid/os/Handler;

.field private y:Landroid/opengl/EGLContext;

.field private z:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/cu10;->d:Z

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-object v1, p0, Ll/cu10;->f:Ll/xjl0;

    .line 9
    .line 10
    iput-boolean v0, p0, Ll/cu10;->g:Z

    .line 11
    .line 12
    iput-object v1, p0, Ll/cu10;->h:Ll/apw;

    .line 13
    .line 14
    const v2, 0x186a0

    .line 15
    .line 16
    .line 17
    iput v2, p0, Ll/cu10;->i:I

    .line 18
    .line 19
    iput-object v1, p0, Ll/cu10;->n:Ll/bpw;

    .line 20
    .line 21
    iput-object v1, p0, Ll/cu10;->o:Ll/qpw;

    .line 22
    .line 23
    iput-object v1, p0, Ll/cu10;->p:Ll/epw;

    .line 24
    .line 25
    const/4 v2, 0x1

    .line 26
    iput-boolean v2, p0, Ll/cu10;->s:Z

    .line 27
    .line 28
    iput-boolean v0, p0, Ll/cu10;->t:Z

    .line 29
    .line 30
    const/16 v2, 0x68

    .line 31
    .line 32
    iput v2, p0, Ll/cu10;->u:I

    .line 33
    .line 34
    iput v0, p0, Ll/cu10;->v:I

    .line 35
    .line 36
    iput v0, p0, Ll/cu10;->w:I

    .line 37
    .line 38
    iput-boolean v0, p0, Ll/cu10;->z:Z

    .line 39
    .line 40
    iput-boolean v0, p0, Ll/cu10;->A:Z

    .line 41
    .line 42
    iput-object v1, p0, Ll/cu10;->B:Ljava/lang/String;

    .line 43
    .line 44
    new-instance v0, Ljava/lang/Object;

    .line 45
    .line 46
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, Ll/cu10;->j:Ljava/lang/Object;

    .line 50
    .line 51
    new-instance v0, Ll/sow;

    .line 52
    .line 53
    invoke-direct {v0}, Ll/sow;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Ll/cu10;->l:Ll/sow;

    .line 57
    .line 58
    new-instance v0, Landroid/os/Handler;

    .line 59
    .line 60
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 65
    .line 66
    .line 67
    iput-object v0, p0, Ll/cu10;->x:Landroid/os/Handler;

    .line 68
    .line 69
    return-void
.end method

.method private C0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/cu10;->c0(Ll/mpw;)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/cu10;->b0(Ll/npw;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/cu10;->Y(Ll/bpw;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/cu10;->W(Ll/ypl$f;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/cu10;->M(Ll/la1;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private G()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cu10;->a:Ljava/util/LinkedList;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/cu10;->a:Ljava/util/LinkedList;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/immomo/moment/model/VideoFragment;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/immomo/moment/model/VideoFragment;->getVideoPath()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object p0, p0, Ll/cu10;->a:Ljava/util/LinkedList;

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    const-string p0, "RecoderUtils"

    .line 32
    .line 33
    const-string v0, "The video path of videoFragments is null !!!"

    .line 34
    .line 35
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    new-instance p0, Ljava/io/File;

    .line 40
    .line 41
    invoke-direct {p0, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-static {p0}, Ll/kki;->a(Ljava/io/File;)V

    .line 45
    .line 46
    .line 47
    :cond_2
    :goto_0
    return-void
.end method

.method public static synthetic a(Ll/cu10;)Ljava/util/LinkedList;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cu10;->a:Ljava/util/LinkedList;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Ll/cu10;)Ll/apw;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cu10;->h:Ll/apw;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Ll/cu10;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/cu10;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic d(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/cu10;->s(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private e(Lcom/immomo/moment/model/VideoFragment;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, "RecoderUtils"

    .line 4
    .line 5
    const-string p1, "Don\'t insert empty object"

    .line 6
    .line 7
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p0, Ll/cu10;->a:Ljava/util/LinkedList;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    new-instance v0, Ljava/util/LinkedList;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/cu10;->a:Ljava/util/LinkedList;

    .line 21
    .line 22
    :cond_1
    iget-object p0, p0, Ll/cu10;->a:Ljava/util/LinkedList;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private i()V
    .locals 0

    .line 1
    return-void
.end method

.method private l()Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/cu10;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "RecoderUtils"

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/cu10;->b:Ljava/lang/String;

    .line 12
    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 19
    .line 20
    .line 21
    move-result-wide v2

    .line 22
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v2, ".mp4"

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string v2, "jarek fragment path:"

    .line 41
    .line 42
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-object p0

    .line 56
    :cond_0
    const-string p0, "mediaOutPath is null !!!"

    .line 57
    .line 58
    invoke-static {v1, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    const-string p0, "mediaOutPath is null"

    .line 62
    .line 63
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    const/4 p0, 0x0

    .line 67
    return-object p0
.end method

.method private p()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cu10;->a:Ljava/util/LinkedList;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance p0, Ljava/util/LinkedList;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/util/LinkedList;-><init>()V

    .line 8
    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    iget-object v1, p0, Ll/cu10;->a:Ljava/util/LinkedList;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 20
    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    :goto_0
    iget-object v2, p0, Ll/cu10;->a:Ljava/util/LinkedList;

    .line 24
    .line 25
    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-ge v1, v2, :cond_2

    .line 30
    .line 31
    iget-object v2, p0, Ll/cu10;->a:Ljava/util/LinkedList;

    .line 32
    .line 33
    invoke-virtual {v2, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Lcom/immomo/moment/model/VideoFragment;

    .line 38
    .line 39
    invoke-virtual {v2}, Lcom/immomo/moment/model/VideoFragment;->getVideoPath()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-direct {p0, v2}, Ll/cu10;->x(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eqz v2, :cond_1

    .line 48
    .line 49
    iget-object v2, p0, Ll/cu10;->a:Ljava/util/LinkedList;

    .line 50
    .line 51
    invoke-virtual {v2, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    check-cast v2, Lcom/immomo/moment/model/VideoFragment;

    .line 56
    .line 57
    invoke-virtual {v2}, Lcom/immomo/moment/model/VideoFragment;->getVideoPath()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    return-object v0
.end method

.method private r0(Ll/mpw;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/cu10;->d:Z

    .line 2
    .line 3
    const-string v1, "RecoderUtils"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "recording is true, have you forget to stop?"

    .line 8
    .line 9
    invoke-static {v1, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Ll/cu10;->b:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    invoke-direct {p0}, Ll/cu10;->l()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-boolean v1, p0, Ll/cu10;->g:Z

    .line 26
    .line 27
    invoke-virtual {p0, v1}, Ll/cu10;->O(Z)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Ll/cu10;->c:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p0, v0, v1, p1}, Ll/cu10;->q0(Ljava/lang/String;Ljava/lang/String;Ll/mpw;)V

    .line 33
    .line 34
    .line 35
    const/4 p1, 0x1

    .line 36
    iput-boolean p1, p0, Ll/cu10;->d:Z

    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    const-string p0, "The mediaOutPath is empty, please set outpath first !!!"

    .line 40
    .line 41
    invoke-static {v1, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    const-string p0, "set outPath first"

    .line 45
    .line 46
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private static s(Ljava/lang/String;)V
    .locals 7

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/io/File;->length()J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const-wide/16 v0, 0x0

    .line 24
    .line 25
    :goto_0
    new-instance v2, Landroid/media/MediaMetadataRetriever;

    .line 26
    .line 27
    invoke-direct {v2}, Landroid/media/MediaMetadataRetriever;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2, p0}, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const/16 v3, 0x14

    .line 34
    .line 35
    invoke-virtual {v2, v3}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    const/16 v4, 0x12

    .line 40
    .line 41
    invoke-virtual {v2, v4}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    const/16 v5, 0x13

    .line 46
    .line 47
    invoke-virtual {v2, v5}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    const/16 v6, 0x9

    .line 52
    .line 53
    invoke-virtual {v2, v6}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v6

    .line 57
    invoke-virtual {v2}, Landroid/media/MediaMetadataRetriever;->release()V

    .line 58
    .line 59
    .line 60
    new-instance v2, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 61
    .line 62
    invoke-direct {v2}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v2, p0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->init(Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    invoke-virtual {v2}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getFrameRate()I

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    invoke-virtual {v2}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->release()V

    .line 73
    .line 74
    .line 75
    :try_start_0
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {v2}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    invoke-virtual {v2, v3}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraVideoFileBitrate(I)V

    .line 88
    .line 89
    .line 90
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-virtual {v2}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    invoke-virtual {v2, v3}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraVideoFileWidth(I)V

    .line 103
    .line 104
    .line 105
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    invoke-virtual {v2}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 114
    .line 115
    .line 116
    move-result v3

    .line 117
    invoke-virtual {v2, v3}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraVideoFileHeight(I)V

    .line 118
    .line 119
    .line 120
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    invoke-virtual {v2}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 129
    .line 130
    .line 131
    move-result-wide v3

    .line 132
    invoke-virtual {v2, v3, v4}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraVideoFileDuration(J)V

    .line 133
    .line 134
    .line 135
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    invoke-virtual {v2}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-virtual {v2, v0, v1}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraVideoFileSize(J)V

    .line 144
    .line 145
    .line 146
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-virtual {v0}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    invoke-virtual {v0, p0}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraVideoFileFps(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 155
    .line 156
    .line 157
    return-void

    .line 158
    :catch_0
    move-exception p0

    .line 159
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 160
    .line 161
    .line 162
    return-void
.end method

.method private t(Ll/qow;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cu10;->l:Ll/sow;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/qow;->w()Ll/crf0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ll/crf0;->b()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iput v1, v0, Ll/sow;->o:I

    .line 12
    .line 13
    iget-object v0, p0, Ll/cu10;->l:Ll/sow;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/qow;->w()Ll/crf0;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Ll/crf0;->a()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iput v1, v0, Ll/sow;->p:I

    .line 24
    .line 25
    iget-object v0, p0, Ll/cu10;->l:Ll/sow;

    .line 26
    .line 27
    invoke-virtual {p1}, Ll/qow;->t()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    iput v1, v0, Ll/sow;->u:I

    .line 32
    .line 33
    iget-object v0, p0, Ll/cu10;->l:Ll/sow;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/qow;->u()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    iput v1, v0, Ll/sow;->s:I

    .line 40
    .line 41
    iget-object v0, p0, Ll/cu10;->l:Ll/sow;

    .line 42
    .line 43
    invoke-virtual {p1}, Ll/qow;->v()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    iput v1, v0, Ll/sow;->q:I

    .line 48
    .line 49
    iget-object v0, p0, Ll/cu10;->l:Ll/sow;

    .line 50
    .line 51
    invoke-virtual {p1}, Ll/qow;->m()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    iput v1, v0, Ll/sow;->z:I

    .line 56
    .line 57
    iget-object v0, p0, Ll/cu10;->l:Ll/sow;

    .line 58
    .line 59
    invoke-virtual {p1}, Ll/qow;->r()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    iput v1, v0, Ll/sow;->I:I

    .line 64
    .line 65
    iget-object v0, p0, Ll/cu10;->l:Ll/sow;

    .line 66
    .line 67
    invoke-virtual {p1}, Ll/qow;->g()I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    iput v1, v0, Ll/sow;->t:I

    .line 72
    .line 73
    iget-object v0, p0, Ll/cu10;->l:Ll/sow;

    .line 74
    .line 75
    invoke-virtual {p1}, Ll/qow;->f()I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    iput v1, v0, Ll/sow;->J:I

    .line 80
    .line 81
    iget-object v0, p0, Ll/cu10;->l:Ll/sow;

    .line 82
    .line 83
    invoke-virtual {p1}, Ll/qow;->o()I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    iput v1, v0, Ll/sow;->K:I

    .line 88
    .line 89
    iget-object v0, p0, Ll/cu10;->l:Ll/sow;

    .line 90
    .line 91
    invoke-virtual {p1}, Ll/qow;->p()F

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    iput v1, v0, Ll/sow;->L:F

    .line 96
    .line 97
    iget-object v0, p0, Ll/cu10;->l:Ll/sow;

    .line 98
    .line 99
    invoke-virtual {p1}, Ll/qow;->s()Z

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    iput-boolean v1, v0, Ll/sow;->M:Z

    .line 104
    .line 105
    iget-object v0, p0, Ll/cu10;->l:Ll/sow;

    .line 106
    .line 107
    invoke-virtual {p1}, Ll/qow;->c()I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    iput v1, v0, Ll/sow;->C:I

    .line 112
    .line 113
    iget-object v0, p0, Ll/cu10;->l:Ll/sow;

    .line 114
    .line 115
    invoke-virtual {p1}, Ll/qow;->b()I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    iput v1, v0, Ll/sow;->E:I

    .line 120
    .line 121
    iget-object v0, p0, Ll/cu10;->l:Ll/sow;

    .line 122
    .line 123
    invoke-virtual {p1}, Ll/qow;->a()I

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    iput v1, v0, Ll/sow;->D:I

    .line 128
    .line 129
    iget-object v0, p0, Ll/cu10;->l:Ll/sow;

    .line 130
    .line 131
    invoke-virtual {p1}, Ll/qow;->k()I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    iput v1, v0, Ll/sow;->c0:I

    .line 136
    .line 137
    iget-object v0, p0, Ll/cu10;->l:Ll/sow;

    .line 138
    .line 139
    invoke-virtual {p1}, Ll/qow;->h()Z

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    iput-boolean v1, v0, Ll/sow;->d0:Z

    .line 144
    .line 145
    iget-object v0, p0, Ll/cu10;->l:Ll/sow;

    .line 146
    .line 147
    invoke-virtual {p1}, Ll/qow;->x()Z

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    iput-boolean v1, v0, Ll/sow;->g0:Z

    .line 152
    .line 153
    iget-object p0, p0, Ll/cu10;->l:Ll/sow;

    .line 154
    .line 155
    invoke-virtual {p1}, Ll/qow;->z()Z

    .line 156
    .line 157
    .line 158
    move-result p1

    .line 159
    iput-boolean p1, p0, Ll/sow;->U:Z

    .line 160
    .line 161
    return-void
.end method

.method private declared-synchronized u0(Ll/npw;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/cu10;->d:Z

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const-string p1, "RecoderUtils"

    .line 7
    .line 8
    const-string v0, "recording is false, have you forget to start?"

    .line 9
    .line 10
    invoke-static {p1, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    monitor-exit p0

    .line 14
    return-void

    .line 15
    :catchall_0
    move-exception p1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    :try_start_1
    invoke-virtual {p0, p1}, Ll/cu10;->v0(Ll/npw;)Lcom/immomo/moment/model/VideoFragment;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    invoke-direct {p0, p1}, Ll/cu10;->e(Lcom/immomo/moment/model/VideoFragment;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    const/4 p1, 0x0

    .line 27
    iput-boolean p1, p0, Ll/cu10;->d:Z

    .line 28
    .line 29
    const-string p1, "RecoderUtils"

    .line 30
    .line 31
    const-string v0, "stopRecording"

    .line 32
    .line 33
    invoke-static {p1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    .line 35
    .line 36
    monitor-exit p0

    .line 37
    return-void

    .line 38
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 39
    throw p1
.end method

.method private x(Ljava/lang/String;)Z
    .locals 0

    .line 1
    :try_start_0
    new-instance p0, Ljava/io/File;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 7
    .line 8
    .line 9
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    return p0

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    const-string p1, "RecoderUtils"

    .line 13
    .line 14
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return p0
.end method


# virtual methods
.method public A()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/nb4;->F()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public A0(Ljava/lang/String;Z)V
    .locals 8

    .line 1
    const/4 v5, 0x0

    .line 2
    const/4 v6, 0x0

    .line 3
    const/4 v2, 0x0

    .line 4
    const/4 v3, 0x0

    .line 5
    const/4 v4, 0x0

    .line 6
    move-object v0, p0

    .line 7
    move-object v1, p1

    .line 8
    move v7, p2

    .line 9
    invoke-virtual/range {v0 .. v7}, Ll/cu10;->B0(Ljava/lang/String;ZIIIIZ)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public declared-synchronized B()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/cu10;->d:Z

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/cu10;->t0()V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    :goto_0
    invoke-virtual {p0}, Ll/cu10;->E()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    .line 14
    .line 15
    monitor-exit p0

    .line 16
    return-void

    .line 17
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    throw v0
.end method

.method public B0(Ljava/lang/String;ZIIIIZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface/range {p0 .. p7}, Ll/nb4;->U(Ljava/lang/String;ZIIIIZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public declared-synchronized C(Landroid/app/Activity;Ll/qow;)Z
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {p1}, Ll/xti0;->a(Landroid/app/Activity;)I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    invoke-virtual {p0, p1, v0, p2}, Ll/cu10;->D(Landroid/content/Context;ILl/qow;)Z

    .line 7
    .line 8
    .line 9
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    monitor-exit p0

    .line 11
    return p1

    .line 12
    :catchall_0
    move-exception p1

    .line 13
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    throw p1
.end method

.method public D(Landroid/content/Context;ILl/qow;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Ll/cu10;->j:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-object p3, p0, Ll/cu10;->k:Ll/qow;

    .line 5
    .line 6
    invoke-direct {p0, p3}, Ll/cu10;->t(Ll/qow;)V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Ll/cu10;->l:Ll/sow;

    .line 10
    .line 11
    iget-boolean v2, p0, Ll/cu10;->A:Z

    .line 12
    .line 13
    iput-boolean v2, v1, Ll/sow;->T:Z

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Ll/cu10;->u(Ll/sow;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/cu10;->m:Ll/nb4;

    .line 19
    .line 20
    invoke-interface {v1, p0}, Ll/nb4;->H(Ll/wjm0;)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Ll/cu10;->m:Ll/nb4;

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-interface {v1, v2}, Ll/nb4;->Q(Ll/mpw;)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Ll/cu10;->m:Ll/nb4;

    .line 30
    .line 31
    invoke-interface {v1, v2}, Ll/nb4;->I(Ll/npw;)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Ll/cu10;->m:Ll/nb4;

    .line 35
    .line 36
    iget-object v3, p0, Ll/cu10;->r:Ll/ypl$f;

    .line 37
    .line 38
    invoke-interface {v1, v3}, Ll/nb4;->l(Ll/ypl$f;)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Ll/cu10;->m:Ll/nb4;

    .line 42
    .line 43
    invoke-interface {v1, v2}, Ll/nb4;->L(Ll/la1;)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Ll/cu10;->m:Ll/nb4;

    .line 47
    .line 48
    iget-object v3, p0, Ll/cu10;->n:Ll/bpw;

    .line 49
    .line 50
    invoke-interface {v1, v3}, Ll/nb4;->z(Ll/bpw;)V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Ll/cu10;->m:Ll/nb4;

    .line 54
    .line 55
    iget-object v3, p0, Ll/cu10;->h:Ll/apw;

    .line 56
    .line 57
    invoke-interface {v1, v3}, Ll/nb4;->m0(Ll/apw;)V

    .line 58
    .line 59
    .line 60
    new-instance v1, Ljava/util/HashMap;

    .line 61
    .line 62
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 63
    .line 64
    .line 65
    const-string v3, "FaceInfo"

    .line 66
    .line 67
    iget-boolean v4, p0, Ll/cu10;->s:Z

    .line 68
    .line 69
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    iget-object v3, p0, Ll/cu10;->m:Ll/nb4;

    .line 77
    .line 78
    invoke-interface {v3, v1}, Ll/nb4;->g0(Ljava/util/HashMap;)V

    .line 79
    .line 80
    .line 81
    iget-object v1, p0, Ll/cu10;->m:Ll/nb4;

    .line 82
    .line 83
    iget v3, p0, Ll/cu10;->u:I

    .line 84
    .line 85
    invoke-interface {v1, v3}, Ll/nb4;->J(I)V

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Ll/cu10;->m:Ll/nb4;

    .line 89
    .line 90
    iget-boolean v3, p0, Ll/cu10;->t:Z

    .line 91
    .line 92
    invoke-interface {v1, v3}, Ll/nb4;->c0(Z)V

    .line 93
    .line 94
    .line 95
    iget-object v1, p0, Ll/cu10;->m:Ll/nb4;

    .line 96
    .line 97
    new-instance v3, Ll/cu10$d;

    .line 98
    .line 99
    invoke-direct {v3, p0, p3}, Ll/cu10$d;-><init>(Ll/cu10;Ll/qow;)V

    .line 100
    .line 101
    .line 102
    invoke-interface {v1, v3}, Ll/nb4;->G(Ll/hpw;)V

    .line 103
    .line 104
    .line 105
    iget-object v1, p0, Ll/cu10;->m:Ll/nb4;

    .line 106
    .line 107
    invoke-interface {v1, v2}, Ll/nb4;->o0(Ll/cpw;)V

    .line 108
    .line 109
    .line 110
    iget-object v1, p0, Ll/cu10;->m:Ll/nb4;

    .line 111
    .line 112
    iget-object v3, p0, Ll/cu10;->o:Ll/qpw;

    .line 113
    .line 114
    invoke-interface {v1, v3}, Ll/nb4;->l0(Ll/qpw;)V

    .line 115
    .line 116
    .line 117
    iget-object v1, p0, Ll/cu10;->m:Ll/nb4;

    .line 118
    .line 119
    invoke-interface {v1, v2}, Ll/nb4;->Z(Ll/fpw;)V

    .line 120
    .line 121
    .line 122
    iget-object v1, p0, Ll/cu10;->m:Ll/nb4;

    .line 123
    .line 124
    invoke-interface {v1, v2}, Ll/nb4;->n0(Ll/opw;)V

    .line 125
    .line 126
    .line 127
    iget-object v1, p0, Ll/cu10;->m:Ll/nb4;

    .line 128
    .line 129
    invoke-interface {v1, v2}, Ll/nb4;->W(Ll/wow;)V

    .line 130
    .line 131
    .line 132
    iget-object v1, p0, Ll/cu10;->m:Ll/nb4;

    .line 133
    .line 134
    invoke-interface {v1, v2}, Ll/nb4;->t0(Ll/fpw;)V

    .line 135
    .line 136
    .line 137
    iget-object v1, p0, Ll/cu10;->m:Ll/nb4;

    .line 138
    .line 139
    iget-object v3, p0, Ll/cu10;->p:Ll/epw;

    .line 140
    .line 141
    invoke-interface {v1, v3}, Ll/nb4;->D(Ll/epw;)V

    .line 142
    .line 143
    .line 144
    iget-object v1, p0, Ll/cu10;->B:Ljava/lang/String;

    .line 145
    .line 146
    if-eqz v1, :cond_0

    .line 147
    .line 148
    iget-object v3, p0, Ll/cu10;->m:Ll/nb4;

    .line 149
    .line 150
    invoke-interface {v3, v1}, Ll/nb4;->E(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    goto :goto_0

    .line 154
    :catchall_0
    move-exception p0

    .line 155
    goto :goto_2

    .line 156
    :cond_0
    :goto_0
    iget-object v1, p0, Ll/cu10;->m:Ll/nb4;

    .line 157
    .line 158
    iget-boolean v3, p0, Ll/cu10;->C:Z

    .line 159
    .line 160
    invoke-interface {v1, v3}, Ll/nb4;->b0(Z)V

    .line 161
    .line 162
    .line 163
    iget-object v1, p0, Ll/cu10;->m:Ll/nb4;

    .line 164
    .line 165
    invoke-interface {v1, v2}, Ll/nb4;->f0(Ll/dpw;)V

    .line 166
    .line 167
    .line 168
    iget-object v1, p0, Ll/cu10;->m:Ll/nb4;

    .line 169
    .line 170
    invoke-interface {v1, v2}, Ll/nb4;->O(Ll/cu10$e;)V

    .line 171
    .line 172
    .line 173
    iget-object v1, p0, Ll/cu10;->m:Ll/nb4;

    .line 174
    .line 175
    invoke-interface {v1, v2}, Ll/nb4;->u0(Ll/yow;)V

    .line 176
    .line 177
    .line 178
    iget-object v1, p0, Ll/cu10;->D:Ljava/lang/String;

    .line 179
    .line 180
    if-eqz v1, :cond_1

    .line 181
    .line 182
    iget-object v2, p0, Ll/cu10;->m:Ll/nb4;

    .line 183
    .line 184
    invoke-interface {v2, v1}, Ll/nb4;->r0(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    :cond_1
    iget-object v1, p0, Ll/cu10;->E:Ljava/lang/String;

    .line 188
    .line 189
    if-eqz v1, :cond_2

    .line 190
    .line 191
    iget-object v2, p0, Ll/cu10;->m:Ll/nb4;

    .line 192
    .line 193
    invoke-interface {v2, v1}, Ll/nb4;->p0(Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    :cond_2
    iget-object v1, p0, Ll/cu10;->m:Ll/nb4;

    .line 197
    .line 198
    invoke-interface {v1, p1}, Ll/nb4;->w0(Landroid/content/Context;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 199
    .line 200
    .line 201
    const/4 p1, 0x0

    .line 202
    :try_start_1
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 203
    .line 204
    invoke-interface {p0, p2, p3}, Ll/nb4;->C(ILl/qow;)Z

    .line 205
    .line 206
    .line 207
    move-result p0

    .line 208
    if-nez p0, :cond_3

    .line 209
    .line 210
    const-string p0, "RecoderUtils"

    .line 211
    .line 212
    const-string p2, "Recoder prepare failed !!!"

    .line 213
    .line 214
    invoke-static {p0, p2}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 215
    .line 216
    .line 217
    :try_start_2
    monitor-exit v0

    .line 218
    return p1

    .line 219
    :catch_0
    move-exception p0

    .line 220
    goto :goto_1

    .line 221
    :cond_3
    const-string p0, "RecoderUtils"

    .line 222
    .line 223
    const-string p1, "Recoder prepare success !!!"

    .line 224
    .line 225
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    const/4 p0, 0x1

    .line 229
    monitor-exit v0

    .line 230
    return p0

    .line 231
    :goto_1
    const-string p2, "RecoderUtils"

    .line 232
    .line 233
    const-string p3, "Record prepare failed ! "

    .line 234
    .line 235
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    invoke-static {p2, p3, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 240
    .line 241
    .line 242
    monitor-exit v0

    .line 243
    return p1

    .line 244
    :goto_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 245
    throw p0
.end method

.method public E()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cu10;->j:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/cu10;->m:Ll/nb4;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-interface {v1, v2}, Ll/nb4;->H(Ll/wjm0;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Ll/cu10;->m:Ll/nb4;

    .line 13
    .line 14
    invoke-interface {v1}, Ll/nb4;->release()V

    .line 15
    .line 16
    .line 17
    iput-object v2, p0, Ll/cu10;->m:Ll/nb4;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    iget-object v1, p0, Ll/cu10;->q:Ljava/lang/ref/WeakReference;

    .line 23
    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->clear()V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-object v1, p0, Ll/cu10;->x:Landroid/os/Handler;

    .line 30
    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    iput-object v2, p0, Ll/cu10;->x:Landroid/os/Handler;

    .line 34
    .line 35
    :cond_2
    invoke-direct {p0}, Ll/cu10;->C0()V

    .line 36
    .line 37
    .line 38
    monitor-exit v0

    .line 39
    return-void

    .line 40
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    throw p0
.end method

.method public declared-synchronized F()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-direct {p0}, Ll/cu10;->G()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    .line 5
    monitor-exit p0

    .line 6
    return-void

    .line 7
    :catchall_0
    move-exception v0

    .line 8
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 9
    throw v0
.end method

.method public H()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/nb4;->a0()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public I()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/nb4;->h0()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public J(Ljava/lang/String;)V
    .locals 3

    .line 1
    :try_start_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    new-instance v0, Ljava/io/File;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    new-instance p1, Ljava/io/File;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    new-instance v2, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v0, ".bak"

    .line 32
    .line 33
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-direct {p1, v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_4

    .line 48
    .line 49
    invoke-static {p1}, Ll/rn00;->b(Ljava/io/File;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    check-cast p1, Ljava/util/ArrayList;

    .line 54
    .line 55
    if-eqz p1, :cond_3

    .line 56
    .line 57
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    const/4 v1, 0x1

    .line 62
    if-ge v0, v1, :cond_1

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_1
    iget-object v0, p0, Ll/cu10;->a:Ljava/util/LinkedList;

    .line 66
    .line 67
    if-nez v0, :cond_2

    .line 68
    .line 69
    new-instance v0, Ljava/util/LinkedList;

    .line 70
    .line 71
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 72
    .line 73
    .line 74
    iput-object v0, p0, Ll/cu10;->a:Ljava/util/LinkedList;

    .line 75
    .line 76
    :cond_2
    const/4 v0, 0x0

    .line 77
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-ge v0, v1, :cond_4

    .line 82
    .line 83
    iget-object v1, p0, Ll/cu10;->a:Ljava/util/LinkedList;

    .line 84
    .line 85
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    check-cast v2, Lcom/immomo/moment/model/VideoFragment;

    .line 90
    .line 91
    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    add-int/lit8 v0, v0, 0x1

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_3
    :goto_1
    return-void

    .line 98
    :cond_4
    invoke-direct {p0}, Ll/cu10;->i()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :catchall_0
    move-exception p0

    .line 103
    const-string p1, "RecoderUtils"

    .line 104
    .line 105
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public K()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/cu10;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_3

    .line 8
    .line 9
    new-instance v0, Ljava/io/File;

    .line 10
    .line 11
    iget-object v1, p0, Ll/cu10;->b:Ljava/lang/String;

    .line 12
    .line 13
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    new-instance v1, Ljava/io/File;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    new-instance v3, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v0, ".bak"

    .line 35
    .line 36
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-direct {v1, v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/cu10;->a:Ljava/util/LinkedList;

    .line 47
    .line 48
    const-string v2, "RecoderUtils"

    .line 49
    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-lez v0, :cond_2

    .line 57
    .line 58
    new-instance v0, Ljava/util/ArrayList;

    .line 59
    .line 60
    iget-object v3, p0, Ll/cu10;->a:Ljava/util/LinkedList;

    .line 61
    .line 62
    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 67
    .line 68
    .line 69
    const/4 v3, 0x0

    .line 70
    :goto_0
    iget-object v4, p0, Ll/cu10;->a:Ljava/util/LinkedList;

    .line 71
    .line 72
    invoke-virtual {v4}, Ljava/util/LinkedList;->size()I

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    if-ge v3, v4, :cond_0

    .line 77
    .line 78
    iget-object v4, p0, Ll/cu10;->a:Ljava/util/LinkedList;

    .line 79
    .line 80
    invoke-virtual {v4, v3}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    check-cast v4, Lcom/immomo/moment/model/VideoFragment;

    .line 85
    .line 86
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    add-int/lit8 v3, v3, 0x1

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_0
    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z

    .line 93
    .line 94
    .line 95
    invoke-static {v1, v0}, Ll/rn00;->c(Ljava/io/File;Ljava/io/Serializable;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    .line 97
    .line 98
    goto :goto_1

    .line 99
    :catch_0
    move-exception v0

    .line 100
    new-instance v1, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    const-string v3, "Save fragments to storage failed !!!"

    .line 103
    .line 104
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-static {v2, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    iget-object v1, p0, Ll/cu10;->h:Ll/apw;

    .line 122
    .line 123
    if-eqz v1, :cond_1

    .line 124
    .line 125
    iget p0, p0, Ll/cu10;->i:I

    .line 126
    .line 127
    add-int/lit16 p0, p0, 0x3ef

    .line 128
    .line 129
    new-instance v2, Ljava/lang/StringBuilder;

    .line 130
    .line 131
    const-string v3, " Save fragments to storage failed !!! "

    .line 132
    .line 133
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    invoke-interface {v1, p0, v2}, Ll/apw;->onError(ILjava/lang/String;)V

    .line 148
    .line 149
    .line 150
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-static {p0}, Ll/lyv;->b(Ljava/lang/String;)I

    .line 155
    .line 156
    .line 157
    goto :goto_1

    .line 158
    :cond_2
    :try_start_1
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 159
    .line 160
    .line 161
    move-result p0

    .line 162
    if-eqz p0, :cond_3

    .line 163
    .line 164
    invoke-virtual {v1}, Ljava/io/File;->delete()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 165
    .line 166
    .line 167
    return-void

    .line 168
    :catch_1
    move-exception p0

    .line 169
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    invoke-static {v2, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    :cond_3
    :goto_1
    return-void
.end method

.method public L(Ll/kt2;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/nb4;->v0(Ll/kt2;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public M(Ll/la1;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/cu10;->j:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter p1

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-interface {p0, v0}, Ll/nb4;->L(Ll/la1;)V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    :goto_0
    monitor-exit p1

    .line 16
    return-void

    .line 17
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    throw p0
.end method

.method public N(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/cu10;->u:I

    .line 2
    .line 3
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/nb4;->J(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public declared-synchronized O(Z)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-boolean p1, p0, Ll/cu10;->g:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/cu10;->m:Ll/nb4;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ll/nb4;->K(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p1

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    :goto_0
    monitor-exit p0

    .line 15
    return-void

    .line 16
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17
    throw p1
.end method

.method public P(Ll/bvb;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/nb4;->V(Ll/bvb;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public Q(Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/nb4;->g0(Ljava/util/HashMap;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public R(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cu10;->j:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-boolean p1, p0, Ll/cu10;->s:Z

    .line 5
    .line 6
    iget-object p1, p0, Ll/cu10;->m:Ll/nb4;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    new-instance p1, Ljava/util/HashMap;

    .line 11
    .line 12
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v1, "FaceInfo"

    .line 16
    .line 17
    iget-boolean v2, p0, Ll/cu10;->s:Z

    .line 18
    .line 19
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {p1, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 27
    .line 28
    invoke-interface {p0, p1}, Ll/nb4;->g0(Ljava/util/HashMap;)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    :goto_0
    monitor-exit v0

    .line 35
    return-void

    .line 36
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    throw p0
.end method

.method public S(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cu10;->B:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/nb4;->E(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public T(Ll/gpw;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/nb4;->T(Ll/gpw;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public declared-synchronized U(Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "The mediaOutPath is "

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iput-object p1, p0, Ll/cu10;->b:Ljava/lang/String;

    .line 5
    .line 6
    iget-object v1, p0, Ll/cu10;->j:Ljava/lang/Object;

    .line 7
    .line 8
    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 9
    :try_start_1
    iget-object v2, p0, Ll/cu10;->m:Ll/nb4;

    .line 10
    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    invoke-interface {v2, p1}, Ll/nb4;->q0(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception p1

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    :goto_0
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    :try_start_2
    const-string p1, "RecoderUtils"

    .line 21
    .line 22
    new-instance v1, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/cu10;->b:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {p1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 37
    .line 38
    .line 39
    monitor-exit p0

    .line 40
    return-void

    .line 41
    :catchall_1
    move-exception p1

    .line 42
    goto :goto_2

    .line 43
    :goto_1
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 44
    :try_start_4
    throw p1

    .line 45
    :goto_2
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 46
    throw p1
.end method

.method public V(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/nb4;->k0(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public W(Ll/ypl$f;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cu10;->j:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-object p1, p0, Ll/cu10;->r:Ll/ypl$f;

    .line 5
    .line 6
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p0, p1}, Ll/nb4;->l(Ll/ypl$f;)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit v0

    .line 17
    return-void

    .line 18
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw p0
.end method

.method public X(Ll/apw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cu10;->h:Ll/apw;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/nb4;->m0(Ll/apw;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public Y(Ll/bpw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cu10;->n:Ll/bpw;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/nb4;->z(Ll/bpw;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public Z(Ll/epw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cu10;->p:Ll/epw;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/nb4;->D(Ll/epw;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public a0(Ll/lpw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cu10;->e:Ll/lpw;

    .line 2
    .line 3
    return-void
.end method

.method public b0(Ll/npw;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cu10;->j:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ll/nb4;->I(Ll/npw;)V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    :goto_0
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    throw p0
.end method

.method public c0(Ll/mpw;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cu10;->j:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ll/nb4;->Q(Ll/mpw;)V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    :goto_0
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    throw p0
.end method

.method public d0(Ll/qpw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cu10;->o:Ll/qpw;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/nb4;->l0(Ll/qpw;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public declared-synchronized e0(Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "The origin mediaOutPath is "

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iput-object p1, p0, Ll/cu10;->c:Ljava/lang/String;

    .line 5
    .line 6
    iget-object p1, p0, Ll/cu10;->j:Ljava/lang/Object;

    .line 7
    .line 8
    monitor-enter p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 9
    :try_start_1
    iget-object v1, p0, Ll/cu10;->m:Ll/nb4;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object v2, p0, Ll/cu10;->c:Ljava/lang/String;

    .line 14
    .line 15
    invoke-interface {v1, v2}, Ll/nb4;->S(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    :goto_0
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    :try_start_2
    const-string p1, "RecoderUtils"

    .line 23
    .line 24
    new-instance v1, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/cu10;->c:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {p1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 39
    .line 40
    .line 41
    monitor-exit p0

    .line 42
    return-void

    .line 43
    :catchall_1
    move-exception p1

    .line 44
    goto :goto_2

    .line 45
    :goto_1
    :try_start_3
    monitor-exit p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 46
    :try_start_4
    throw v0

    .line 47
    :goto_2
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 48
    throw p1
.end method

.method public declared-synchronized f()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/cu10;->a:Ljava/util/LinkedList;

    .line 3
    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x1

    .line 11
    if-ge v0, v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    new-instance v0, Ljava/lang/Thread;

    .line 15
    .line 16
    new-instance v1, Ll/cu10$a;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/cu10$a;-><init>(Ll/cu10;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    .line 27
    monitor-exit p0

    .line 28
    return-void

    .line 29
    :catchall_0
    move-exception v0

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    :goto_0
    :try_start_1
    const-string v0, "RecoderUtils"

    .line 32
    .line 33
    const-string v1, "Start calling cancelRecording !!!"

    .line 34
    .line 35
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    .line 37
    .line 38
    monitor-exit p0

    .line 39
    return-void

    .line 40
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 41
    throw v0
.end method

.method public f0(Landroid/view/SurfaceHolder;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cu10;->j:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    new-instance v1, Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Ll/cu10;->q:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    monitor-exit v0

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    throw p0
.end method

.method public g(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/nb4;->e0(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public g0(Ll/cu10$e;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/nb4;->O(Ll/cu10$e;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public h(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V
    .locals 3

    .line 1
    const-string v0, "RecoderUtils"

    .line 2
    .line 3
    if-eqz p1, :cond_2

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-lez v1, :cond_2

    .line 10
    .line 11
    if-eqz p2, :cond_2

    .line 12
    .line 13
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-gtz v1, :cond_0

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_0
    new-instance v1, Ll/xjl0;

    .line 21
    .line 22
    invoke-direct {v1, p2, p3}, Ll/xjl0;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ll/xjl0;->e()I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    const/4 p3, -0x1

    .line 30
    if-ne p2, p3, :cond_1

    .line 31
    .line 32
    :try_start_0
    invoke-virtual {v1, p1}, Ll/xjl0;->c(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :catch_0
    move-exception p1

    .line 37
    new-instance p2, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string p3, " Decide resolution failed !!! "

    .line 40
    .line 41
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-static {v0, p2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-object p2, p0, Ll/cu10;->h:Ll/apw;

    .line 59
    .line 60
    if-eqz p2, :cond_1

    .line 61
    .line 62
    iget-object p2, p0, Ll/cu10;->h:Ll/apw;

    .line 63
    .line 64
    iget p0, p0, Ll/cu10;->i:I

    .line 65
    .line 66
    add-int/lit16 p0, p0, 0x3f0

    .line 67
    .line 68
    new-instance v0, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    invoke-direct {v0, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-interface {p2, p0, p1}, Ll/apw;->onError(ILjava/lang/String;)V

    .line 85
    .line 86
    .line 87
    :cond_1
    :goto_0
    invoke-virtual {v1}, Ll/xjl0;->g()V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_2
    :goto_1
    const-string p0, "Parameter is empty "

    .line 92
    .line 93
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public h0(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/nb4;->j0(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public i0(Ll/c5g0$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/nb4;->B(Ll/c5g0$a;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public j(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ll/lpw;Landroid/content/Context;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/lpw;",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "RecoderUtils"

    .line 2
    .line 3
    const-string v1, "Start calling finishRecording !!!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-lez v0, :cond_0

    .line 15
    .line 16
    if-eqz p3, :cond_0

    .line 17
    .line 18
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-lez v0, :cond_0

    .line 23
    .line 24
    if-eqz p5, :cond_0

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p0, v0, p3, p5}, Ll/cu10;->h(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/cu10;->s0(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ll/lpw;)V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    invoke-virtual {p0, p1}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraVideoSegments(I)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public j0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/nb4;->P(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public k(Landroid/graphics/Rect;Landroid/hardware/Camera$AutoFocusCallback;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ll/nb4;->k(Landroid/graphics/Rect;Landroid/hardware/Camera$AutoFocusCallback;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public k0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/cu10;->A:Z

    .line 2
    .line 3
    return-void
.end method

.method public l0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/nb4;->d0(Z)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/immomo/moment/datadot/DataDotUtils;->getInstance()Lcom/immomo/moment/datadot/DataDotUtils;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/immomo/moment/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/immomo/moment/datadot/RecoderDataDotInfo;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1}, Lcom/immomo/moment/datadot/RecoderDataDotInfo;->setCameraBeautyUseDoki(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public m()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/nb4;->d()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public declared-synchronized m0(II)Ll/crf0;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/cu10;->l:Ll/sow;

    .line 3
    .line 4
    iput p1, v0, Ll/sow;->o:I

    .line 5
    .line 6
    iput p2, v0, Ll/sow;->p:I

    .line 7
    .line 8
    iget-object v0, p0, Ll/cu10;->m:Ll/nb4;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-interface {v0, p1, p2}, Ll/nb4;->x(II)Ll/crf0;

    .line 13
    .line 14
    .line 15
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    monitor-exit p0

    .line 17
    return-object p1

    .line 18
    :catchall_0
    move-exception p1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    monitor-exit p0

    .line 21
    const/4 p0, 0x0

    .line 22
    return-object p0

    .line 23
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    throw p1
.end method

.method public declared-synchronized n()I
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/cu10;->a:Ljava/util/LinkedList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    :try_start_1
    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 13
    monitor-exit p0

    .line 14
    return v0

    .line 15
    :catchall_0
    move-exception v0

    .line 16
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 17
    throw v0
.end method

.method public n0(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/nb4;->b(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public o()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/cu10;->p()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public o0()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cu10;->j:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/cu10;->q:Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    iget-object v1, p0, Ll/cu10;->m:Ll/nb4;

    .line 15
    .line 16
    iget-object v2, p0, Ll/cu10;->q:Ljava/lang/ref/WeakReference;

    .line 17
    .line 18
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Landroid/view/SurfaceHolder;

    .line 23
    .line 24
    invoke-interface {v2}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-interface {v1, v2}, Ll/nb4;->R(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Ll/cu10;->q:Ljava/lang/ref/WeakReference;

    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Landroid/view/SurfaceHolder;

    .line 38
    .line 39
    invoke-interface {v1}, Landroid/view/SurfaceHolder;->getSurfaceFrame()Landroid/graphics/Rect;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    iget-object v2, p0, Ll/cu10;->q:Ljava/lang/ref/WeakReference;

    .line 48
    .line 49
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    check-cast v2, Landroid/view/SurfaceHolder;

    .line 54
    .line 55
    invoke-interface {v2}, Landroid/view/SurfaceHolder;->getSurfaceFrame()Landroid/graphics/Rect;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    invoke-virtual {p0, v1, v2}, Ll/cu10;->m0(II)Ll/crf0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 64
    .line 65
    .line 66
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 67
    return-void

    .line 68
    :catchall_0
    move-exception p0

    .line 69
    goto :goto_1

    .line 70
    :catchall_1
    move-exception p0

    .line 71
    goto :goto_0

    .line 72
    :cond_0
    :try_start_2
    const-string p0, "RecoderUtils"

    .line 73
    .line 74
    const-string v1, "Invalid surfaceHolder of recoder !!!"

    .line 75
    .line 76
    invoke-static {p0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    new-instance p0, Ljava/lang/Exception;

    .line 80
    .line 81
    const-string v1, "Invalid surfaceHolder"

    .line 82
    .line 83
    invoke-direct {p0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    throw p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 87
    :goto_0
    :try_start_3
    const-string v1, "RecoderUtils"

    .line 88
    .line 89
    invoke-static {v1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 90
    .line 91
    .line 92
    throw p0

    .line 93
    :goto_1
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 94
    throw p0
.end method

.method public declared-synchronized p0()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    :try_start_0
    invoke-direct {p0, v0}, Ll/cu10;->r0(Ll/mpw;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception v0

    .line 9
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 10
    throw v0
.end method

.method public q()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/nb4;->c()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public q0(Ljava/lang/String;Ljava/lang/String;Ll/mpw;)V
    .locals 3
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/cu10;->j:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/cu10;->m:Ll/nb4;

    .line 5
    .line 6
    if-eqz v1, :cond_3

    .line 7
    .line 8
    iget-object v1, p0, Ll/cu10;->l:Ll/sow;

    .line 9
    .line 10
    iget-object v2, p0, Ll/cu10;->k:Ll/qow;

    .line 11
    .line 12
    invoke-virtual {v2}, Ll/qow;->v()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    iput v2, v1, Ll/sow;->q:I

    .line 17
    .line 18
    iget-object v1, p0, Ll/cu10;->m:Ll/nb4;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-interface {v1, v2}, Ll/nb4;->Q(Ll/mpw;)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Ll/cu10;->m:Ll/nb4;

    .line 25
    .line 26
    invoke-interface {v1, v2}, Ll/nb4;->I(Ll/npw;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    iget-object v2, p0, Ll/cu10;->m:Ll/nb4;

    .line 34
    .line 35
    if-nez v1, :cond_0

    .line 36
    .line 37
    :try_start_1
    invoke-interface {v2, p1}, Ll/nb4;->q0(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :catchall_0
    move-exception p0

    .line 42
    goto :goto_2

    .line 43
    :cond_0
    invoke-interface {v2}, Ll/nb4;->Y()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-nez p1, :cond_2

    .line 52
    .line 53
    :goto_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-nez p1, :cond_1

    .line 58
    .line 59
    iget-object p1, p0, Ll/cu10;->m:Ll/nb4;

    .line 60
    .line 61
    invoke-interface {p1, p2}, Ll/nb4;->S(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 65
    .line 66
    invoke-interface {p0, p3}, Ll/nb4;->N(Ll/mpw;)V

    .line 67
    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_2
    const-string p0, "RecoderUtils"

    .line 71
    .line 72
    const-string p1, "Video Output is Null!"

    .line 73
    .line 74
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    new-instance p0, Ljava/lang/RuntimeException;

    .line 78
    .line 79
    const-string p1, "Video Output is Null!"

    .line 80
    .line 81
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    throw p0

    .line 85
    :cond_3
    :goto_1
    monitor-exit v0

    .line 86
    return-void

    .line 87
    :goto_2
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 88
    throw p0
.end method

.method public declared-synchronized r()J
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    const-wide/16 v0, 0x0

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    :goto_0
    :try_start_0
    iget-object v3, p0, Ll/cu10;->a:Ljava/util/LinkedList;

    .line 6
    .line 7
    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    if-ge v2, v3, :cond_0

    .line 12
    .line 13
    iget-object v3, p0, Ll/cu10;->a:Ljava/util/LinkedList;

    .line 14
    .line 15
    invoke-virtual {v3, v2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    check-cast v3, Lcom/immomo/moment/model/VideoFragment;

    .line 20
    .line 21
    invoke-virtual {v3}, Lcom/immomo/moment/model/VideoFragment;->getDuration()J

    .line 22
    .line 23
    .line 24
    move-result-wide v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    add-long/2addr v0, v3

    .line 26
    add-int/lit8 v2, v2, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception v0

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    monitor-exit p0

    .line 32
    return-wide v0

    .line 33
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    throw v0
.end method

.method public s0(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ll/lpw;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/lpw;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v4

    .line 5
    const-string p3, " Start splicing videos !!!"

    .line 6
    .line 7
    const-string v1, "RecoderUtils"

    .line 8
    .line 9
    invoke-static {v1, p3}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    if-eqz p2, :cond_1

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result p3

    .line 20
    if-lez p3, :cond_1

    .line 21
    .line 22
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result p3

    .line 26
    const/4 v0, 0x1

    .line 27
    if-ne p3, v0, :cond_1

    .line 28
    .line 29
    :try_start_0
    new-instance p3, Ljava/io/File;

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    check-cast p1, Ljava/lang/String;

    .line 37
    .line 38
    invoke-direct {p3, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    new-instance p1, Ljava/io/File;

    .line 42
    .line 43
    invoke-direct {p1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-static {p3, p1}, Ll/rn00;->a(Ljava/io/File;Ljava/io/File;)V

    .line 47
    .line 48
    .line 49
    if-eqz p4, :cond_4

    .line 50
    .line 51
    invoke-interface {p4}, Ll/lpw;->c()V

    .line 52
    .line 53
    .line 54
    invoke-static {p2}, Ll/cu10;->s(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :catch_0
    move-exception v0

    .line 59
    move-object p1, v0

    .line 60
    new-instance p2, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    const-string p3, "When splice file copy failed !!! "

    .line 63
    .line 64
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    invoke-static {v1, p2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    if-eqz p4, :cond_0

    .line 82
    .line 83
    const-string p2, "\u751f\u6210\u6587\u4ef6\u9519\u8bef\uff01"

    .line 84
    .line 85
    invoke-interface {p4, p2}, Ll/lpw;->a(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    :cond_0
    iget-object p2, p0, Ll/cu10;->h:Ll/apw;

    .line 89
    .line 90
    if-eqz p2, :cond_4

    .line 91
    .line 92
    iget p0, p0, Ll/cu10;->i:I

    .line 93
    .line 94
    add-int/lit16 p0, p0, 0x3ea

    .line 95
    .line 96
    new-instance p4, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    invoke-direct {p4, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-interface {p2, p0, p1}, Ll/apw;->onError(ILjava/lang/String;)V

    .line 113
    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_1
    new-instance p3, Lcom/immomo/moment/mediautils/p;

    .line 117
    .line 118
    invoke-direct {p3}, Lcom/immomo/moment/mediautils/p;-><init>()V

    .line 119
    .line 120
    .line 121
    new-instance v0, Ll/cu10$b;

    .line 122
    .line 123
    invoke-direct {v0, p0}, Ll/cu10$b;-><init>(Ll/cu10;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p3, v0}, Lcom/immomo/moment/mediautils/p;->p(Ll/spw;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p3, p1, p2}, Lcom/immomo/moment/mediautils/p;->r(Ljava/util/List;Ljava/lang/String;)Z

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    if-eqz p1, :cond_2

    .line 134
    .line 135
    new-instance v0, Ll/cu10$c;

    .line 136
    .line 137
    move-object v1, p0

    .line 138
    move-object v3, p2

    .line 139
    move-object v2, p4

    .line 140
    invoke-direct/range {v0 .. v5}, Ll/cu10$c;-><init>(Ll/cu10;Ll/lpw;Ljava/lang/String;J)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p3, v0}, Lcom/immomo/moment/mediautils/p;->q(Ll/kpw;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p3}, Lcom/immomo/moment/mediautils/p;->s()V

    .line 147
    .line 148
    .line 149
    return-void

    .line 150
    :cond_2
    move-object v2, p4

    .line 151
    const-string p1, "When splice files the out path is empty !!!"

    .line 152
    .line 153
    invoke-static {v1, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    if-eqz v2, :cond_3

    .line 157
    .line 158
    const-string p1, "Media Path Empty"

    .line 159
    .line 160
    invoke-interface {v2, p1}, Ll/lpw;->a(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    :cond_3
    iget-object p1, p0, Ll/cu10;->h:Ll/apw;

    .line 164
    .line 165
    if-eqz p1, :cond_4

    .line 166
    .line 167
    iget p0, p0, Ll/cu10;->i:I

    .line 168
    .line 169
    add-int/lit16 p0, p0, 0x3eb

    .line 170
    .line 171
    const-string p2, " When splice files the out path is empty !!! "

    .line 172
    .line 173
    invoke-interface {p1, p0, p2}, Ll/apw;->onError(ILjava/lang/String;)V

    .line 174
    .line 175
    .line 176
    :cond_4
    :goto_0
    return-void
.end method

.method public declared-synchronized t0()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    :try_start_0
    invoke-direct {p0, v0}, Ll/cu10;->u0(Ll/npw;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception v0

    .line 9
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 10
    throw v0
.end method

.method public u(Ll/sow;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cu10;->m:Ll/nb4;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/ob4;

    .line 6
    .line 7
    iget-object v1, p0, Ll/cu10;->y:Landroid/opengl/EGLContext;

    .line 8
    .line 9
    invoke-direct {v0, p1, v1}, Ll/ob4;-><init>(Ll/sow;Landroid/opengl/EGLContext;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/cu10;->m:Ll/nb4;

    .line 13
    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Ll/sow;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string p1, " isAR = "

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-boolean p0, p0, Ll/cu10;->z:Z

    .line 32
    .line 33
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string p1, "RecoderUtils"

    .line 41
    .line 42
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public v()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ll/nb4;->i0()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public v0(Ll/npw;)Lcom/immomo/moment/model/VideoFragment;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cu10;->j:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ll/nb4;->M(Ll/npw;)Lcom/immomo/moment/model/VideoFragment;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    monitor-exit v0

    .line 13
    return-object p0

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    monitor-exit v0

    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0

    .line 19
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    throw p0
.end method

.method public declared-synchronized w()Z
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/cu10;->m:Ll/nb4;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-interface {v0}, Ll/nb4;->e()Z

    .line 7
    .line 8
    .line 9
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception v0

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    :goto_0
    monitor-exit p0

    .line 18
    return v0

    .line 19
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    throw v0
.end method

.method public w0(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cu10;->j:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/cu10;->m:Ll/nb4;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Ll/cu10;->k:Ll/qow;

    .line 9
    .line 10
    invoke-interface {v1, p1, p0}, Ll/nb4;->A(ILl/qow;)Z

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit v0

    .line 17
    return-void

    .line 18
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw p0
.end method

.method public x0(Landroid/app/Activity;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/xti0;->a(Landroid/app/Activity;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p1}, Ll/cu10;->w0(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public y()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/nb4;->y()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public y0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/nb4;->s0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public z()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cu10;->m:Ll/nb4;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/nb4;->X()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public z0(Ljava/lang/String;IIIIZ)V
    .locals 8

    .line 1
    const/4 v2, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move v3, p2

    .line 5
    move v4, p3

    .line 6
    move v5, p4

    .line 7
    move v6, p5

    .line 8
    move v7, p6

    .line 9
    invoke-virtual/range {v0 .. v7}, Ll/cu10;->B0(Ljava/lang/String;ZIIIIZ)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
