.class Ll/lfl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/fam;
.implements Ll/rpw;


# instance fields
.field private a:Ll/n410;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field private b:Z

.field private c:Ll/ile;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field private d:Ll/a5g0;

.field private e:Ll/kt2;

.field private f:Z

.field private g:Ll/kqf0;

.field private h:Ll/l13;

.field private i:Ll/n610;

.field private j:Lcom/immomo/moment/mediautils/cmds/EffectModel;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public k:Ll/fe00;

.field private l:I

.field private m:I

.field private n:I

.field private o:I

.field private p:Z

.field private q:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/moment/filtermanager/MMPresetFilter;",
            ">;"
        }
    .end annotation
.end field

.field private r:Ll/oli;

.field private s:Ll/rpw;

.field private t:Ll/rer;

.field private u:F

.field private v:F

.field w:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field x:Ll/kqf0;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/lfl0;->b:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/lfl0;->f:Z

    .line 9
    .line 10
    new-instance v1, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 11
    .line 12
    invoke-direct {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Ll/lfl0;->q:Ljava/util/List;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    iput v1, p0, Ll/lfl0;->u:F

    .line 19
    .line 20
    const/high16 v1, 0x3f800000    # 1.0f

    .line 21
    .line 22
    iput v1, p0, Ll/lfl0;->v:F

    .line 23
    .line 24
    new-instance v1, Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Ll/lfl0;->w:Ljava/util/List;

    .line 30
    .line 31
    new-instance v1, Ll/n410;

    .line 32
    .line 33
    invoke-direct {v1}, Ll/n410;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Ll/lfl0;->a:Ll/n410;

    .line 37
    .line 38
    invoke-virtual {v1, v0}, Ll/n410;->f1(Z)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/lfl0;->a:Ll/n410;

    .line 42
    .line 43
    new-instance v1, Ll/dp50;

    .line 44
    .line 45
    invoke-direct {v1}, Ll/dp50;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ll/n410;->X0(Ll/apw;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/lfl0;->a:Ll/n410;

    .line 52
    .line 53
    invoke-virtual {v0, p0}, Ll/n410;->Y0(Ll/rpw;)V

    .line 54
    .line 55
    .line 56
    new-instance v0, Ll/ile;

    .line 57
    .line 58
    invoke-direct {v0}, Ll/ile;-><init>()V

    .line 59
    .line 60
    .line 61
    iput-object v0, p0, Ll/lfl0;->c:Ll/ile;

    .line 62
    .line 63
    invoke-direct {p0}, Ll/lfl0;->z()Ll/a5g0;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iput-object v0, p0, Ll/lfl0;->d:Ll/a5g0;

    .line 68
    .line 69
    invoke-static {}, Ll/lrw;->j()Ll/lrw;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0}, Ll/lrw;->d()Ll/upl;

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method private A()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/lfl0;->e:Ll/kt2;

    .line 3
    .line 4
    iput-object v0, p0, Ll/lfl0;->g:Ll/kqf0;

    .line 5
    .line 6
    iput-object v0, p0, Ll/lfl0;->h:Ll/l13;

    .line 7
    .line 8
    iput-object v0, p0, Ll/lfl0;->i:Ll/n610;

    .line 9
    .line 10
    return-void
.end method

.method private C(Ljava/lang/String;JZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lfl0;->a:Ll/n410;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/n410;->k1(Ljava/lang/String;JZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private s(Landroid/graphics/Bitmap;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method private t()Lcom/immomo/moment/mediautils/cmds/EffectModel;
    .locals 9

    .line 1
    iget-object v0, p0, Ll/lfl0;->k:Ll/fe00;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/lfl0;->j:Lcom/immomo/moment/mediautils/cmds/EffectModel;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-virtual {v0}, Ll/fe00;->a()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Ll/lfl0;->k:Ll/fe00;

    .line 16
    .line 17
    iget-object v0, v0, Ll/fe00;->b:Ljava/lang/String;

    .line 18
    .line 19
    move-object v4, v0

    .line 20
    goto :goto_0

    .line 21
    :cond_1
    move-object v4, v1

    .line 22
    :goto_0
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iget-object v2, p0, Ll/lfl0;->k:Ll/fe00;

    .line 27
    .line 28
    iget-object v2, v2, Ll/fe00;->g:Lcom/immomo/moment/mediautils/cmds/VideoEffects;

    .line 29
    .line 30
    if-eqz v2, :cond_2

    .line 31
    .line 32
    invoke-virtual {v2}, Lcom/immomo/moment/mediautils/cmds/VideoEffects;->getTimeRangeScales()Ljava/util/List;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget-object v2, p0, Ll/lfl0;->k:Ll/fe00;

    .line 37
    .line 38
    iget-object v2, v2, Ll/fe00;->g:Lcom/immomo/moment/mediautils/cmds/VideoEffects;

    .line 39
    .line 40
    invoke-virtual {v2}, Lcom/immomo/moment/mediautils/cmds/VideoEffects;->getVideoCuts()Ljava/util/List;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    move-object v8, v2

    .line 45
    goto :goto_1

    .line 46
    :cond_2
    move-object v8, v1

    .line 47
    :goto_1
    iget-object v2, p0, Ll/lfl0;->k:Ll/fe00;

    .line 48
    .line 49
    if-nez v0, :cond_3

    .line 50
    .line 51
    move-object v0, v2

    .line 52
    iget-object v2, v0, Ll/fe00;->a:Ljava/lang/String;

    .line 53
    .line 54
    iget v3, p0, Ll/lfl0;->v:F

    .line 55
    .line 56
    iget v5, p0, Ll/lfl0;->u:F

    .line 57
    .line 58
    iget v6, v0, Ll/fe00;->c:I

    .line 59
    .line 60
    iget v7, v0, Ll/fe00;->d:I

    .line 61
    .line 62
    invoke-static/range {v2 .. v8}, Ll/dr00;->c(Ljava/lang/String;FLjava/lang/String;FIILjava/util/List;)Lcom/immomo/moment/mediautils/cmds/EffectModel;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    goto :goto_2

    .line 67
    :cond_3
    move-object v0, v2

    .line 68
    iget-object v0, v0, Ll/fe00;->a:Ljava/lang/String;

    .line 69
    .line 70
    iget p0, p0, Ll/lfl0;->v:F

    .line 71
    .line 72
    invoke-static {v0, p0, v8}, Ll/dr00;->b(Ljava/lang/String;FLjava/util/List;)Lcom/immomo/moment/mediautils/cmds/EffectModel;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    :goto_2
    if-eqz v1, :cond_4

    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/cmds/EffectModel;->getVideoEffects()Lcom/immomo/moment/mediautils/cmds/VideoEffects;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0, v1}, Lcom/immomo/moment/mediautils/cmds/VideoEffects;->setTimeRangeScales(Ljava/util/List;)V

    .line 83
    .line 84
    .line 85
    :cond_4
    return-object p0
.end method

.method private u(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Ll/a5g0;)Ll/kt2;
    .locals 4

    .line 1
    invoke-direct {p0, p1}, Ll/lfl0;->s(Landroid/graphics/Bitmap;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-direct {p0, p2}, Ll/lfl0;->s(Landroid/graphics/Bitmap;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, p0, Ll/lfl0;->h:Ll/l13;

    .line 10
    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    new-instance v2, Ll/l13;

    .line 14
    .line 15
    invoke-direct {v2}, Ll/l13;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v2, p0, Ll/lfl0;->h:Ll/l13;

    .line 19
    .line 20
    :cond_0
    iget-object v2, p0, Ll/lfl0;->i:Ll/n610;

    .line 21
    .line 22
    if-nez v2, :cond_1

    .line 23
    .line 24
    new-instance v2, Ll/n610;

    .line 25
    .line 26
    invoke-direct {v2}, Ll/n610;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v2, p0, Ll/lfl0;->i:Ll/n610;

    .line 30
    .line 31
    :cond_1
    iget-object v2, p0, Ll/lfl0;->i:Ll/n610;

    .line 32
    .line 33
    if-eqz v2, :cond_5

    .line 34
    .line 35
    if-eqz p2, :cond_2

    .line 36
    .line 37
    if-eqz p1, :cond_3

    .line 38
    .line 39
    :cond_2
    if-eqz p2, :cond_4

    .line 40
    .line 41
    if-eqz p1, :cond_4

    .line 42
    .line 43
    :cond_3
    const/4 v3, 0x1

    .line 44
    goto :goto_0

    .line 45
    :cond_4
    const/4 v3, 0x0

    .line 46
    :goto_0
    invoke-virtual {v2, v3}, Ll/n610;->X(Z)V

    .line 47
    .line 48
    .line 49
    :cond_5
    iget-object v2, p0, Ll/lfl0;->g:Ll/kqf0;

    .line 50
    .line 51
    if-nez v2, :cond_7

    .line 52
    .line 53
    new-instance v2, Ljava/util/ArrayList;

    .line 54
    .line 55
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 56
    .line 57
    .line 58
    if-eqz p3, :cond_6

    .line 59
    .line 60
    invoke-interface {v2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    :cond_6
    new-instance p3, Ll/kqf0;

    .line 64
    .line 65
    invoke-direct {p3, v2}, Ll/kqf0;-><init>(Ljava/util/List;)V

    .line 66
    .line 67
    .line 68
    iput-object p3, p0, Ll/lfl0;->g:Ll/kqf0;

    .line 69
    .line 70
    :cond_7
    if-eqz v0, :cond_8

    .line 71
    .line 72
    iget-object p3, p0, Ll/lfl0;->h:Ll/l13;

    .line 73
    .line 74
    invoke-virtual {p3, p1}, Ll/l13;->n0(Landroid/graphics/Bitmap;)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Ll/lfl0;->g:Ll/kqf0;

    .line 78
    .line 79
    invoke-virtual {p1}, Ll/kqf0;->Z()Ljava/util/List;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iget-object p3, p0, Ll/lfl0;->h:Ll/l13;

    .line 84
    .line 85
    invoke-interface {p1, p3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-nez p1, :cond_8

    .line 90
    .line 91
    iget-object p1, p0, Ll/lfl0;->g:Ll/kqf0;

    .line 92
    .line 93
    iget-object p3, p0, Ll/lfl0;->h:Ll/l13;

    .line 94
    .line 95
    invoke-virtual {p1, p3}, Ll/kqf0;->X(Ll/kt2;)V

    .line 96
    .line 97
    .line 98
    :cond_8
    if-eqz v1, :cond_9

    .line 99
    .line 100
    iget-object p1, p0, Ll/lfl0;->i:Ll/n610;

    .line 101
    .line 102
    invoke-virtual {p1, p2}, Ll/n610;->W(Landroid/graphics/Bitmap;)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Ll/lfl0;->g:Ll/kqf0;

    .line 106
    .line 107
    invoke-virtual {p1}, Ll/kqf0;->Z()Ljava/util/List;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    iget-object p2, p0, Ll/lfl0;->i:Ll/n610;

    .line 112
    .line 113
    invoke-interface {p1, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    if-nez p1, :cond_9

    .line 118
    .line 119
    iget-object p1, p0, Ll/lfl0;->g:Ll/kqf0;

    .line 120
    .line 121
    iget-object p2, p0, Ll/lfl0;->i:Ll/n610;

    .line 122
    .line 123
    invoke-virtual {p1, p2}, Ll/kqf0;->X(Ll/kt2;)V

    .line 124
    .line 125
    .line 126
    :cond_9
    iget-object p0, p0, Ll/lfl0;->g:Ll/kqf0;

    .line 127
    .line 128
    return-object p0
.end method

.method private v()V
    .locals 3

    .line 1
    new-instance v0, Ll/rer;

    .line 2
    .line 3
    sget-object v1, Lcom/immomo/components/interfaces/IProcessOutput$ProcessType;->PROCESS_VIDEO_TYPE:Lcom/immomo/components/interfaces/IProcessOutput$ProcessType;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-direct {v0, v1, v2}, Ll/rer;-><init>(Lcom/immomo/components/interfaces/IProcessOutput$ProcessType;Z)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/lfl0;->t:Ll/rer;

    .line 10
    .line 11
    iget-object v1, p0, Ll/lfl0;->a:Ll/n410;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ll/n410;->S0(Ll/bvb;)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Ll/oli;

    .line 17
    .line 18
    iget-object v1, p0, Ll/lfl0;->q:Ljava/util/List;

    .line 19
    .line 20
    iget-object v2, p0, Ll/lfl0;->t:Ll/rer;

    .line 21
    .line 22
    invoke-direct {v0, v1, v2}, Ll/oli;-><init>(Ljava/util/List;Ll/rer;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/lfl0;->r:Ll/oli;

    .line 26
    .line 27
    const/4 v1, -0x1

    .line 28
    invoke-virtual {v0, v1}, Ll/oli;->d(I)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/lfl0;->c:Ll/ile;

    .line 32
    .line 33
    iget-object v1, p0, Ll/lfl0;->r:Ll/oli;

    .line 34
    .line 35
    invoke-virtual {v1}, Ll/oli;->b()Ll/kt2;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Ll/ile;->b(Ll/kt2;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/lfl0;->x:Ll/kqf0;

    .line 43
    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    iget-object p0, p0, Ll/lfl0;->c:Ll/ile;

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ll/ile;->b(Ll/kt2;)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method

.method private w()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/lfl0;->e:Ll/kt2;

    .line 2
    .line 3
    iget-object v1, p0, Ll/lfl0;->d:Ll/a5g0;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-direct {p0, v2, v2, v1}, Ll/lfl0;->u(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Ll/a5g0;)Ll/kt2;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/lfl0;->e:Ll/kt2;

    .line 13
    .line 14
    iget-object p0, p0, Ll/lfl0;->c:Ll/ile;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/ile;->a(Ll/kt2;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-direct {p0, v2, v2, v1}, Ll/lfl0;->u(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Ll/a5g0;)Ll/kt2;

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private y(Ll/fe00;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget v0, p1, Ll/fe00;->e:I

    .line 4
    .line 5
    int-to-float v0, v0

    .line 6
    const/high16 v1, 0x42c80000    # 100.0f

    .line 7
    .line 8
    div-float/2addr v0, v1

    .line 9
    iput v0, p0, Ll/lfl0;->v:F

    .line 10
    .line 11
    iget p1, p1, Ll/fe00;->f:I

    .line 12
    .line 13
    int-to-float p1, p1

    .line 14
    div-float/2addr p1, v1

    .line 15
    iput p1, p0, Ll/lfl0;->u:F

    .line 16
    .line 17
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget p0, p0, Ll/lfl0;->u:F

    .line 22
    .line 23
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    filled-new-array {p1, p0}, [Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string p1, "VideoProcess"

    .line 32
    .line 33
    const-string v0, "initVolume mVideoVolume:%f  mMusicVolume:%f"

    .line 34
    .line 35
    invoke-static {p1, v0, p0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method private z()Ll/a5g0;
    .locals 1

    .line 1
    new-instance p0, Ll/a5g0;

    .line 2
    .line 3
    invoke-static {}, Ll/kv0;->a()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, v0}, Ll/a5g0;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    return-object p0
.end method


# virtual methods
.method public B(IIIIZ)V
    .locals 1

    .line 1
    shr-int/lit8 v0, p1, 0x4

    .line 2
    .line 3
    shl-int/lit8 v0, v0, 0x4

    .line 4
    .line 5
    iput v0, p0, Ll/lfl0;->l:I

    .line 6
    .line 7
    shr-int/lit8 v0, p2, 0x4

    .line 8
    .line 9
    shl-int/lit8 v0, v0, 0x4

    .line 10
    .line 11
    iput v0, p0, Ll/lfl0;->m:I

    .line 12
    .line 13
    iput p3, p0, Ll/lfl0;->n:I

    .line 14
    .line 15
    iput p4, p0, Ll/lfl0;->o:I

    .line 16
    .line 17
    iput-boolean p5, p0, Ll/lfl0;->p:Z

    .line 18
    .line 19
    iget-object p0, p0, Ll/lfl0;->a:Ll/n410;

    .line 20
    .line 21
    invoke-virtual/range {p0 .. p5}, Ll/n410;->b1(IIIIZ)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lfl0;->a:Ll/n410;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/n410;->O0()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/lfl0;->a:Ll/n410;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/n410;->j1()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public b(Ll/fe00;)Z
    .locals 1

    .line 1
    iput-object p1, p0, Ll/lfl0;->k:Ll/fe00;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/lfl0;->y(Ll/fe00;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ll/lfl0;->t()Lcom/immomo/moment/mediautils/cmds/EffectModel;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ll/lfl0;->j:Lcom/immomo/moment/mediautils/cmds/EffectModel;

    .line 11
    .line 12
    invoke-direct {p0}, Ll/lfl0;->w()V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/lfl0;->j:Lcom/immomo/moment/mediautils/cmds/EffectModel;

    .line 16
    .line 17
    invoke-static {p1}, Lcom/immomo/moment/mediautils/cmds/EffectModel;->toEffectCmd(Lcom/immomo/moment/mediautils/cmds/EffectModel;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object v0, p0, Ll/lfl0;->a:Ll/n410;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ll/n410;->K0(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iget-object v0, p0, Ll/lfl0;->c:Ll/ile;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/ile;->c()Ll/rdl0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0, v0}, Ll/lfl0;->x(Ll/kt2;)V

    .line 34
    .line 35
    .line 36
    invoke-direct {p0}, Ll/lfl0;->v()V

    .line 37
    .line 38
    .line 39
    return p1
.end method

.method public c(Ljava/util/List;Ljava/util/List;JZ)V
    .locals 2
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/immomo/moment/mediautils/cmds/VideoCut;",
            ">;",
            "Ljava/util/List<",
            "Lcom/immomo/moment/mediautils/cmds/TimeRangeScale;",
            ">;JZ)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/lfl0;->k:Ll/fe00;

    .line 2
    .line 3
    iget-object v1, v0, Ll/fe00;->g:Lcom/immomo/moment/mediautils/cmds/VideoEffects;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    new-instance v1, Lcom/immomo/moment/mediautils/cmds/VideoEffects;

    .line 8
    .line 9
    invoke-direct {v1}, Lcom/immomo/moment/mediautils/cmds/VideoEffects;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v1, v0, Ll/fe00;->g:Lcom/immomo/moment/mediautils/cmds/VideoEffects;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/lfl0;->k:Ll/fe00;

    .line 15
    .line 16
    iget-object v0, v0, Ll/fe00;->g:Lcom/immomo/moment/mediautils/cmds/VideoEffects;

    .line 17
    .line 18
    invoke-virtual {v0, p2}, Lcom/immomo/moment/mediautils/cmds/VideoEffects;->setTimeRangeScales(Ljava/util/List;)V

    .line 19
    .line 20
    .line 21
    iget-object p2, p0, Ll/lfl0;->k:Ll/fe00;

    .line 22
    .line 23
    iget-object p2, p2, Ll/fe00;->g:Lcom/immomo/moment/mediautils/cmds/VideoEffects;

    .line 24
    .line 25
    invoke-virtual {p2, p1}, Lcom/immomo/moment/mediautils/cmds/VideoEffects;->setVideoCuts(Ljava/util/List;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p3, p4, p5}, Ll/lfl0;->m(JZ)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public d(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lfl0;->a:Ll/n410;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n410;->V0(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lfl0;->a:Ll/n410;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n410;->f1(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lfl0;->a:Ll/n410;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/n410;->q0()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public g()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/lfl0;->f:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/lfl0;->a:Ll/n410;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/n410;->h1()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public h(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lfl0;->a:Ll/n410;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n410;->i0(Landroid/graphics/SurfaceTexture;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i(F)V
    .locals 3

    .line 1
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "VideoProcess"

    .line 10
    .line 11
    const-string v2, "setPlayingMusicAudioRatio %f"

    .line 12
    .line 13
    invoke-static {v1, v2, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iput p1, p0, Ll/lfl0;->u:F

    .line 17
    .line 18
    iget-object p0, p0, Ll/lfl0;->a:Ll/n410;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/n410;->c1(F)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public j(Ll/jpw;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lfl0;->a:Ll/n410;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n410;->Z0(Ll/jpw;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k(IIII)V
    .locals 6

    .line 1
    const/4 v5, 0x1

    .line 2
    move-object v0, p0

    .line 3
    move v1, p1

    .line 4
    move v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    invoke-virtual/range {v0 .. v5}, Ll/lfl0;->B(IIIIZ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public l()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lfl0;->s:Ll/rpw;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/rpw;->l()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public m(JZ)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/lfl0;->t()Lcom/immomo/moment/mediautils/cmds/EffectModel;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/lfl0;->j:Lcom/immomo/moment/mediautils/cmds/EffectModel;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/cmds/EffectModel;->getAudioEffects()Lcom/immomo/moment/mediautils/cmds/AudioEffects;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/cmds/AudioEffects;->getAudioSource()Lcom/immomo/moment/mediautils/cmds/AudioEffects$a;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget v2, p0, Ll/lfl0;->v:F

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Lcom/immomo/moment/mediautils/cmds/AudioEffects$a;->c(F)V

    .line 22
    .line 23
    .line 24
    :cond_0
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/cmds/AudioEffects;->getAudioBackgrounds()Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-lez v1, :cond_1

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Lcom/immomo/moment/mediautils/cmds/AudioBackground;

    .line 42
    .line 43
    iget v1, p0, Ll/lfl0;->u:F

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lcom/immomo/moment/mediautils/cmds/AudioBackground;->setRatio(F)V

    .line 46
    .line 47
    .line 48
    :cond_1
    iget-object v0, p0, Ll/lfl0;->a:Ll/n410;

    .line 49
    .line 50
    iget v1, p0, Ll/lfl0;->v:F

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ll/n410;->d1(F)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/lfl0;->a:Ll/n410;

    .line 56
    .line 57
    iget v1, p0, Ll/lfl0;->u:F

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ll/n410;->c1(F)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/lfl0;->j:Lcom/immomo/moment/mediautils/cmds/EffectModel;

    .line 63
    .line 64
    invoke-static {v0}, Lcom/immomo/moment/mediautils/cmds/EffectModel;->toEffectCmd(Lcom/immomo/moment/mediautils/cmds/EffectModel;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-direct {p0, v0, p1, p2, p3}, Ll/lfl0;->C(Ljava/lang/String;JZ)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public n(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/lfl0;->t()Lcom/immomo/moment/mediautils/cmds/EffectModel;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/lfl0;->j:Lcom/immomo/moment/mediautils/cmds/EffectModel;

    .line 6
    .line 7
    iget v0, p0, Ll/lfl0;->v:F

    .line 8
    .line 9
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget v1, p0, Ll/lfl0;->u:F

    .line 14
    .line 15
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "VideoProcess"

    .line 24
    .line 25
    const-string v2, "makeVideo mVideoVolume:%f  mMusicVolume:%f"

    .line 26
    .line 27
    invoke-static {v1, v2, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/lfl0;->j:Lcom/immomo/moment/mediautils/cmds/EffectModel;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/cmds/EffectModel;->getAudioEffects()Lcom/immomo/moment/mediautils/cmds/AudioEffects;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/cmds/AudioEffects;->getAudioSource()Lcom/immomo/moment/mediautils/cmds/AudioEffects$a;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    if-eqz v1, :cond_0

    .line 43
    .line 44
    iget v2, p0, Ll/lfl0;->v:F

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Lcom/immomo/moment/mediautils/cmds/AudioEffects$a;->c(F)V

    .line 47
    .line 48
    .line 49
    :cond_0
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/cmds/AudioEffects;->getAudioBackgrounds()Ljava/util/List;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-lez v1, :cond_1

    .line 60
    .line 61
    const/4 v1, 0x0

    .line 62
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Lcom/immomo/moment/mediautils/cmds/AudioBackground;

    .line 67
    .line 68
    iget v1, p0, Ll/lfl0;->u:F

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Lcom/immomo/moment/mediautils/cmds/AudioBackground;->setRatio(F)V

    .line 71
    .line 72
    .line 73
    :cond_1
    iget-object v0, p0, Ll/lfl0;->a:Ll/n410;

    .line 74
    .line 75
    iget-object v1, p0, Ll/lfl0;->j:Lcom/immomo/moment/mediautils/cmds/EffectModel;

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Ll/n410;->T0(Lcom/immomo/moment/mediautils/cmds/EffectModel;)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Ll/lfl0;->a:Ll/n410;

    .line 81
    .line 82
    invoke-virtual {p0, p1}, Ll/n410;->I0(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public o(Ll/kpw;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/lfl0;->a:Ll/n410;

    .line 2
    .line 3
    new-instance v0, Ll/en50;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/en50;-><init>(Ll/kpw;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/n410;->a1(Ll/kpw;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public p()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/lfl0;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/lfl0;->b:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/lfl0;->a:Ll/n410;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/n410;->Q0()V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public pause()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lfl0;->a:Ll/n410;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/n410;->J0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q(F)V
    .locals 3

    .line 1
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "VideoProcess"

    .line 10
    .line 11
    const-string v2, "setPlayingSrcAudioRatio %f"

    .line 12
    .line 13
    invoke-static {v1, v2, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iput p1, p0, Ll/lfl0;->v:F

    .line 17
    .line 18
    iget-object p0, p0, Ll/lfl0;->a:Ll/n410;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/n410;->d1(F)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public r(Ll/ipw;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lfl0;->a:Ll/n410;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n410;->e1(Ll/ipw;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public release()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/lfl0;->x:Ll/kqf0;

    .line 3
    .line 4
    iget-object v0, p0, Ll/lfl0;->w:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/lfl0;->a:Ll/n410;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/n410;->L0()V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0}, Ll/lfl0;->A()V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-boolean v0, p0, Ll/lfl0;->f:Z

    .line 19
    .line 20
    invoke-static {}, Ll/yqc0;->c()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public resume()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/lfl0;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/lfl0;->a:Ll/n410;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/n410;->Q0()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public x(Ll/kt2;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lfl0;->a:Ll/n410;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n410;->h0(Ll/kt2;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
