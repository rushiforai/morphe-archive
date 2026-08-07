.class public Ll/du10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/l0m;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/du10$h;
    }
.end annotation


# instance fields
.field private A:Ll/epw;

.field private B:Ll/bpw;

.field private C:Ll/c5g0$a;

.field private D:Ll/qpw;

.field private E:Ll/ppw;

.field private F:Landroid/app/Activity;

.field private G:Ll/vow;

.field private H:Z

.field private I:Z

.field private J:Z

.field private K:Ll/z4g0;

.field private L:Lcom/mm/mediasdk/bridge/EngineCommonBridge;

.field private M:Lcom/mm/mediasdk/utils/NetUtil$a;

.field private N:Z

.field private O:Ljava/lang/String;

.field private P:I

.field private Q:I

.field private R:Ll/m4m;

.field private final S:Ll/du10$h;

.field private a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/moment/filtermanager/MMPresetFilter;",
            ">;"
        }
    .end annotation
.end field

.field private b:Ll/rer;

.field private c:Ll/oli;

.field private d:Ll/cu10;

.field private e:Ll/qow;

.field private f:Ll/g6x;

.field private g:Z

.field private h:Z

.field private i:Z

.field private j:F

.field private k:F

.field private l:Z

.field private m:Z

.field private n:Z

.field private o:F

.field private p:Z

.field private q:Ljava/lang/String;

.field private r:Landroid/view/SurfaceHolder;

.field private s:I

.field private t:I

.field private u:I

.field private v:I

.field private w:Z

.field private x:Ljava/lang/String;

.field private y:Ljava/lang/String;

.field private z:Ll/ypl$f;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/du10;->a:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ll/du10;->g:Z

    .line 13
    .line 14
    iput-boolean v0, p0, Ll/du10;->h:Z

    .line 15
    .line 16
    iput-boolean v0, p0, Ll/du10;->i:Z

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    iput v1, p0, Ll/du10;->j:F

    .line 20
    .line 21
    iput v1, p0, Ll/du10;->k:F

    .line 22
    .line 23
    iput-boolean v0, p0, Ll/du10;->l:Z

    .line 24
    .line 25
    iput-boolean v0, p0, Ll/du10;->n:Z

    .line 26
    .line 27
    iput-boolean v0, p0, Ll/du10;->p:Z

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    iput-boolean v1, p0, Ll/du10;->w:Z

    .line 31
    .line 32
    iput-boolean v0, p0, Ll/du10;->J:Z

    .line 33
    .line 34
    new-instance v0, Ll/du10$b;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Ll/du10$b;-><init>(Ll/du10;)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Ll/du10;->M:Lcom/mm/mediasdk/utils/NetUtil$a;

    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    iput-object v0, p0, Ll/du10;->O:Ljava/lang/String;

    .line 43
    .line 44
    new-instance v1, Ll/du10$e;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/du10$e;-><init>(Ll/du10;)V

    .line 47
    .line 48
    .line 49
    iput-object v1, p0, Ll/du10;->R:Ll/m4m;

    .line 50
    .line 51
    new-instance v1, Ll/du10$h;

    .line 52
    .line 53
    invoke-direct {v1, p0, v0}, Ll/du10$h;-><init>(Ll/du10;Ll/du10$a;)V

    .line 54
    .line 55
    .line 56
    iput-object v1, p0, Ll/du10;->S:Ll/du10$h;

    .line 57
    .line 58
    return-void
.end method

.method private A0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v1, p0, Ll/du10;->u:I

    .line 6
    .line 7
    iget p0, p0, Ll/du10;->v:I

    .line 8
    .line 9
    invoke-virtual {v0, v1, p0}, Ll/cu10;->m0(II)Ll/crf0;

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private B0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/du10;->d:Ll/cu10;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/cu10;->y0()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static synthetic S(Ll/du10;)Ll/rer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/du10;->b:Ll/rer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic T(Ll/du10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/du10;->m0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic U(Ll/du10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/du10;->j0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic V(Ll/du10;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/du10;->x:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic W(Ll/du10;)Ll/ppw;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/du10;->E:Ll/ppw;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic X(Ll/du10;)Ll/c5g0$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/du10;->C:Ll/c5g0$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Y(Ll/du10;)Ll/qpw;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/du10;->D:Ll/qpw;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Z(Ll/du10;)Ll/cu10;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/du10;->d:Ll/cu10;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic a0(Ll/du10;)Ll/z4g0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/du10;->K:Ll/z4g0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b0(Ll/du10;Ll/g6x;)Ll/g6x;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/du10;->f:Ll/g6x;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic c0(Ll/du10;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/du10;->g:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic d0(Ll/du10;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/du10;->i:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic e0(Ll/du10;Ljava/lang/String;FZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/du10;->x0(Ljava/lang/String;FZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f0(Ll/du10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/du10;->u0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private g0(Ll/g6x;Z)Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_3

    .line 5
    .line 6
    iget-object v2, p0, Ll/du10;->b:Ll/rer;

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    if-eqz p2, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/du10;->M()V

    .line 14
    .line 15
    .line 16
    :cond_1
    if-nez p1, :cond_2

    .line 17
    .line 18
    return v1

    .line 19
    :cond_2
    invoke-direct {p0, p1, v0}, Ll/du10;->s0(Ll/g6x;Ll/cu10;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0

    .line 24
    :cond_3
    :goto_0
    return v1
.end method

.method private h0(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/du10;->e:Ll/qow;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/qow;->q()Ll/crf0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    const v2, 0x3fe38e39

    .line 13
    .line 14
    .line 15
    invoke-static {p1, v0, v1, v2}, Ll/vc4;->f(Landroid/content/Context;Ll/crf0;IF)Ll/crf0;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    new-instance p1, Ll/crf0;

    .line 22
    .line 23
    const/16 v0, 0x280

    .line 24
    .line 25
    const/16 v1, 0x1e0

    .line 26
    .line 27
    invoke-direct {p1, v0, v1}, Ll/crf0;-><init>(II)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object p0, p0, Ll/du10;->e:Ll/qow;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ll/qow;->R(Ll/crf0;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private i0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/du10;->H:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    :goto_0
    new-instance v0, Ll/cu10;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/cu10;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-virtual {v0, v1}, Ll/cu10;->R(Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 23
    .line 24
    new-instance v2, Ll/gn50;

    .line 25
    .line 26
    invoke-direct {v2}, Ll/gn50;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v2}, Ll/cu10;->X(Ll/apw;)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Ll/lrw;->j()Ll/lrw;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Ll/lrw;->d()Ll/upl;

    .line 37
    .line 38
    .line 39
    iput-boolean v1, p0, Ll/du10;->H:Z

    .line 40
    .line 41
    iget-object v0, p0, Ll/du10;->O:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    const/4 v1, 0x0

    .line 48
    if-nez v0, :cond_2

    .line 49
    .line 50
    iget-object v0, p0, Ll/du10;->O:Ljava/lang/String;

    .line 51
    .line 52
    iget v2, p0, Ll/du10;->P:I

    .line 53
    .line 54
    iget v3, p0, Ll/du10;->Q:I

    .line 55
    .line 56
    invoke-virtual {p0, v0, v2, v3, v1}, Ll/du10;->E(Ljava/lang/String;IIZ)Z

    .line 57
    .line 58
    .line 59
    :cond_2
    iget-object v0, p0, Ll/du10;->r:Landroid/view/SurfaceHolder;

    .line 60
    .line 61
    if-eqz v0, :cond_3

    .line 62
    .line 63
    const-string v2, "createRecorder setHolder %s"

    .line 64
    .line 65
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    const-string v3, "VideoRecord"

    .line 70
    .line 71
    invoke-static {v3, v2, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 75
    .line 76
    iget-object v2, p0, Ll/du10;->r:Landroid/view/SurfaceHolder;

    .line 77
    .line 78
    invoke-virtual {v0, v2}, Ll/cu10;->f0(Landroid/view/SurfaceHolder;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 82
    .line 83
    iget v2, p0, Ll/du10;->s:I

    .line 84
    .line 85
    iget v3, p0, Ll/du10;->t:I

    .line 86
    .line 87
    invoke-virtual {v0, v2, v3}, Ll/cu10;->m0(II)Ll/crf0;

    .line 88
    .line 89
    .line 90
    :cond_3
    const-string v0, "beauty_thinFaceValue"

    .line 91
    .line 92
    const v2, 0x3f19999a    # 0.6f

    .line 93
    .line 94
    .line 95
    invoke-direct {p0, v0, v2, v1}, Ll/du10;->x0(Ljava/lang/String;FZ)V

    .line 96
    .line 97
    .line 98
    const-string v0, "beauty_bigEyeValue"

    .line 99
    .line 100
    const/high16 v2, 0x3f000000    # 0.5f

    .line 101
    .line 102
    invoke-direct {p0, v0, v2, v1}, Ll/du10;->x0(Ljava/lang/String;FZ)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 106
    .line 107
    new-instance v1, Ll/du10$c;

    .line 108
    .line 109
    invoke-direct {v1, p0}, Ll/du10$c;-><init>(Ll/du10;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v0, v1}, Ll/cu10;->Y(Ll/bpw;)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 116
    .line 117
    const/4 v1, 0x0

    .line 118
    invoke-virtual {v0, v1}, Ll/cu10;->g0(Ll/cu10$e;)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 122
    .line 123
    iget-object v2, p0, Ll/du10;->z:Ll/ypl$f;

    .line 124
    .line 125
    invoke-virtual {v0, v2}, Ll/cu10;->W(Ll/ypl$f;)V

    .line 126
    .line 127
    .line 128
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 129
    .line 130
    iget-object v2, p0, Ll/du10;->A:Ll/epw;

    .line 131
    .line 132
    invoke-virtual {v0, v2}, Ll/cu10;->Z(Ll/epw;)V

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 136
    .line 137
    invoke-virtual {v0, v1}, Ll/cu10;->M(Ll/la1;)V

    .line 138
    .line 139
    .line 140
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 141
    .line 142
    iget-object v1, p0, Ll/du10;->B:Ll/bpw;

    .line 143
    .line 144
    invoke-virtual {v0, v1}, Ll/cu10;->Y(Ll/bpw;)V

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 148
    .line 149
    new-instance v1, Ll/du10$d;

    .line 150
    .line 151
    invoke-direct {v1, p0}, Ll/du10$d;-><init>(Ll/du10;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v0, v1}, Ll/cu10;->d0(Ll/qpw;)V

    .line 155
    .line 156
    .line 157
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 158
    .line 159
    iget-boolean p0, p0, Ll/du10;->N:Z

    .line 160
    .line 161
    invoke-virtual {v0, p0}, Ll/cu10;->k0(Z)V

    .line 162
    .line 163
    .line 164
    return-void
.end method

.method private j0()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/du10;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput-boolean v1, p0, Ll/du10;->h:Z

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/cu10;->w()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-direct {p0}, Ll/du10;->o0()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 25
    .line 26
    iget-object p0, p0, Ll/du10;->F:Landroid/app/Activity;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Ll/cu10;->x0(Landroid/app/Activity;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iget-object v0, p0, Ll/du10;->e:Ll/qow;

    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    invoke-virtual {v0, v1}, Ll/qow;->E(I)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 39
    .line 40
    iget-object v1, p0, Ll/du10;->F:Landroid/app/Activity;

    .line 41
    .line 42
    iget-object v2, p0, Ll/du10;->e:Ll/qow;

    .line 43
    .line 44
    invoke-virtual {v0, v1, v2}, Ll/cu10;->C(Landroid/app/Activity;Ll/qow;)Z

    .line 45
    .line 46
    .line 47
    invoke-direct {p0}, Ll/du10;->A0()V

    .line 48
    .line 49
    .line 50
    :cond_1
    return-void
.end method

.method private k0(I)Ljava/lang/String;
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    if-eq p1, p0, :cond_1

    .line 3
    .line 4
    const/4 p0, 0x2

    .line 5
    if-eq p1, p0, :cond_0

    .line 6
    .line 7
    const-string p0, "off"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, "auto"

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_1
    const-string p0, "on"

    .line 14
    .line 15
    return-object p0
.end method

.method private l0()V
    .locals 3

    .line 1
    new-instance v0, Ll/rer;

    .line 2
    .line 3
    sget-object v1, Lcom/immomo/components/interfaces/IProcessOutput$ProcessType;->PROCESS_PREVIEW_TYPE:Lcom/immomo/components/interfaces/IProcessOutput$ProcessType;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/rer;-><init>(Lcom/immomo/components/interfaces/IProcessOutput$ProcessType;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ll/du10;->b:Ll/rer;

    .line 9
    .line 10
    iget-object v1, p0, Ll/du10;->d:Ll/cu10;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1, v0}, Ll/cu10;->P(Ll/bvb;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    new-instance v0, Lcom/mm/mediasdk/bridge/EngineCommonBridge;

    .line 18
    .line 19
    iget-object v1, p0, Ll/du10;->b:Ll/rer;

    .line 20
    .line 21
    invoke-direct {v0, v1}, Lcom/mm/mediasdk/bridge/EngineCommonBridge;-><init>(Ll/rer;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/du10;->L:Lcom/mm/mediasdk/bridge/EngineCommonBridge;

    .line 25
    .line 26
    new-instance v0, Ll/oli;

    .line 27
    .line 28
    iget-object v1, p0, Ll/du10;->b:Ll/rer;

    .line 29
    .line 30
    iget-object v2, p0, Ll/du10;->a:Ljava/util/List;

    .line 31
    .line 32
    invoke-direct {v0, v1, v2}, Ll/oli;-><init>(Ll/rer;Ljava/util/List;)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Ll/du10;->c:Ll/oli;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/oli;->b()Ll/kt2;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    iget-object v1, p0, Ll/du10;->d:Ll/cu10;

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Ll/cu10;->L(Ll/kt2;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 49
    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    iget-object v1, p0, Ll/du10;->S:Ll/du10$h;

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ll/cu10;->i0(Ll/c5g0$a;)V

    .line 55
    .line 56
    .line 57
    :cond_2
    iget-object v0, p0, Ll/du10;->b:Ll/rer;

    .line 58
    .line 59
    new-instance v1, Ll/du10$g;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/du10$g;-><init>(Ll/du10;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ll/rer;->m0(Ll/dh4;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method private m0()V
    .locals 0

    .line 1
    return-void
.end method

.method private o0()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method private r0(Ljava/lang/String;)V
    .locals 3

    .line 1
    sget-object p0, Lcom/immomo/components/interfaces/IProcessOutput$ProcessType;->PROCESS_PREVIEW_TYPE:Lcom/immomo/components/interfaces/IProcessOutput$ProcessType;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/j4g0;->a(Lcom/immomo/components/interfaces/IProcessOutput$ProcessType;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->getInstance()Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    sget-object v2, Lcom/momo/xengine/mestatistics/ReportType;->COUNT:Lcom/momo/xengine/mestatistics/ReportType;

    .line 16
    .line 17
    invoke-virtual {p1, p0, v0, v1, v2}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->realTimeReport(Ljava/lang/String;JLcom/momo/xengine/mestatistics/ReportType;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private s0(Ll/g6x;Ll/cu10;)Z
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/du10;->i:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Ll/du10;->g:Z

    .line 5
    .line 6
    iput-object p1, p0, Ll/du10;->f:Ll/g6x;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/g6x;->a()Ll/w80;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Ll/w80;->a()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move v1, v0

    .line 20
    :goto_0
    iget-object v2, p0, Ll/du10;->b:Ll/rer;

    .line 21
    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    invoke-static {}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->getInstance()Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 29
    .line 30
    .line 31
    move-result-wide v3

    .line 32
    sget-object v5, Lcom/momo/xengine/mestatistics/ReportType;->COUNT:Lcom/momo/xengine/mestatistics/ReportType;

    .line 33
    .line 34
    const-string v6, "sdk-camera-engine-use-sticker"

    .line 35
    .line 36
    invoke-virtual {v2, v6, v3, v4, v5}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->realTimeReport(Ljava/lang/String;JLcom/momo/xengine/mestatistics/ReportType;)V

    .line 37
    .line 38
    .line 39
    iget-object v2, p0, Ll/du10;->b:Ll/rer;

    .line 40
    .line 41
    invoke-virtual {v2, p1}, Ll/rer;->Y(Ll/g6x;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    const/4 p1, 0x1

    .line 45
    if-eqz v1, :cond_3

    .line 46
    .line 47
    iput-boolean p1, p0, Ll/du10;->g:Z

    .line 48
    .line 49
    iput-boolean p1, p0, Ll/du10;->h:Z

    .line 50
    .line 51
    invoke-direct {p0}, Ll/du10;->B0()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_2

    .line 56
    .line 57
    invoke-virtual {p2}, Ll/cu10;->w()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_6

    .line 62
    .line 63
    iget-object p0, p0, Ll/du10;->F:Landroid/app/Activity;

    .line 64
    .line 65
    invoke-virtual {p2, p0}, Ll/cu10;->x0(Landroid/app/Activity;)V

    .line 66
    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_2
    iput-boolean p1, p0, Ll/du10;->i:Z

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_3
    iput-boolean v0, p0, Ll/du10;->i:Z

    .line 73
    .line 74
    iput-boolean v0, p0, Ll/du10;->g:Z

    .line 75
    .line 76
    iget-boolean v1, p0, Ll/du10;->h:Z

    .line 77
    .line 78
    if-eqz v1, :cond_5

    .line 79
    .line 80
    iput-boolean v0, p0, Ll/du10;->h:Z

    .line 81
    .line 82
    invoke-virtual {p2}, Ll/cu10;->w()Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-nez v0, :cond_6

    .line 87
    .line 88
    invoke-direct {p0}, Ll/du10;->o0()Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_4

    .line 93
    .line 94
    invoke-direct {p0}, Ll/du10;->u0()V

    .line 95
    .line 96
    .line 97
    iget-object p0, p0, Ll/du10;->F:Landroid/app/Activity;

    .line 98
    .line 99
    invoke-virtual {p2, p0}, Ll/cu10;->x0(Landroid/app/Activity;)V

    .line 100
    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_4
    iget-object v0, p0, Ll/du10;->e:Ll/qow;

    .line 104
    .line 105
    invoke-virtual {v0, p1}, Ll/qow;->E(I)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p0, Ll/du10;->F:Landroid/app/Activity;

    .line 109
    .line 110
    iget-object v1, p0, Ll/du10;->e:Ll/qow;

    .line 111
    .line 112
    invoke-virtual {p2, v0, v1}, Ll/cu10;->C(Landroid/app/Activity;Ll/qow;)Z

    .line 113
    .line 114
    .line 115
    iget-object p2, p0, Ll/du10;->d:Ll/cu10;

    .line 116
    .line 117
    iget v0, p0, Ll/du10;->s:I

    .line 118
    .line 119
    iget p0, p0, Ll/du10;->t:I

    .line 120
    .line 121
    invoke-virtual {p2, v0, p0}, Ll/cu10;->m0(II)Ll/crf0;

    .line 122
    .line 123
    .line 124
    goto :goto_1

    .line 125
    :cond_5
    invoke-direct {p0}, Ll/du10;->u0()V

    .line 126
    .line 127
    .line 128
    :cond_6
    :goto_1
    return p1
.end method

.method private u0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/du10;->d:Ll/cu10;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/cu10;->I()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private v0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/du10;->O:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    :try_start_0
    iget v0, p0, Ll/du10;->o:F

    .line 6
    .line 7
    const/high16 v1, 0x3f800000    # 1.0f

    .line 8
    .line 9
    div-float/2addr v1, v0

    .line 10
    invoke-direct {p0}, Ll/du10;->w0()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-boolean v2, p0, Ll/du10;->p:Z

    .line 15
    .line 16
    if-eqz v2, :cond_1

    .line 17
    .line 18
    if-ltz v0, :cond_0

    .line 19
    .line 20
    invoke-static {v0}, Ll/n120;->n(I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    invoke-static {v1}, Ll/n120;->l(F)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    const/4 v2, 0x1

    .line 28
    iput-boolean v2, p0, Ll/du10;->p:Z

    .line 29
    .line 30
    iget-object v2, p0, Ll/du10;->O:Ljava/lang/String;

    .line 31
    .line 32
    iget v3, p0, Ll/du10;->Q:I

    .line 33
    .line 34
    iget-object p0, p0, Ll/du10;->G:Ll/vow;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/vow;->b()Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    invoke-static {v2, v0, v3, v1, p0}, Ll/n120;->r(Ljava/lang/String;IIFZ)J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :catch_0
    move-exception p0

    .line 45
    const-string v0, "VideoRecord"

    .line 46
    .line 47
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 48
    .line 49
    .line 50
    :cond_2
    return-void
.end method

.method private w0()I
    .locals 6

    .line 1
    iget-object v0, p0, Ll/du10;->O:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "seekMusic endMillTime"

    .line 10
    .line 11
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget v2, p0, Ll/du10;->Q:I

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v2, "SDK_VIDEO_SDK"

    .line 24
    .line 25
    invoke-static {v2, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget v0, p0, Ll/du10;->Q:I

    .line 29
    .line 30
    iget v3, p0, Ll/du10;->P:I

    .line 31
    .line 32
    if-nez v3, :cond_1

    .line 33
    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    :cond_1
    if-ne v3, v0, :cond_3

    .line 37
    .line 38
    :cond_2
    return v1

    .line 39
    :cond_3
    :try_start_0
    iget-object v3, p0, Ll/du10;->d:Ll/cu10;

    .line 40
    .line 41
    if-nez v3, :cond_4

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_4
    invoke-virtual {v3}, Ll/cu10;->r()J

    .line 45
    .line 46
    .line 47
    move-result-wide v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    long-to-int v3, v3

    .line 49
    goto :goto_1

    .line 50
    :catch_0
    :goto_0
    move v3, v1

    .line 51
    :goto_1
    iget v4, p0, Ll/du10;->P:I

    .line 52
    .line 53
    add-int/2addr v3, v4

    .line 54
    new-instance v4, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string v5, "seekMusic seek "

    .line 57
    .line 58
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    invoke-static {v2, v4}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    iget p0, p0, Ll/du10;->P:I

    .line 72
    .line 73
    if-ge v3, p0, :cond_5

    .line 74
    .line 75
    return v1

    .line 76
    :cond_5
    if-le v3, v0, :cond_6

    .line 77
    .line 78
    sub-int/2addr v0, p0

    .line 79
    rem-int/2addr v3, v0

    .line 80
    :cond_6
    new-instance p0, Ljava/lang/StringBuilder;

    .line 81
    .line 82
    const-string v0, "seekMusic real seek "

    .line 83
    .line 84
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-static {v2, p0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    return v3
.end method

.method private x0(Ljava/lang/String;FZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/du10;->y0(Ljava/lang/String;F)V

    .line 2
    .line 3
    .line 4
    if-eqz p3, :cond_0

    .line 5
    .line 6
    iget-object p3, p0, Ll/du10;->K:Ll/z4g0;

    .line 7
    .line 8
    if-eqz p3, :cond_0

    .line 9
    .line 10
    invoke-virtual {p3, p1, p2}, Ll/z4g0;->c(Ljava/lang/String;F)V

    .line 11
    .line 12
    .line 13
    :cond_0
    const-string p3, "beauty_thinBodyValue"

    .line 14
    .line 15
    invoke-virtual {p3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p3

    .line 19
    if-eqz p3, :cond_1

    .line 20
    .line 21
    iput p2, p0, Ll/du10;->j:F

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/du10;->z0()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const-string p3, "beauty_longLegValue"

    .line 28
    .line 29
    invoke-virtual {p3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p3

    .line 33
    if-eqz p3, :cond_2

    .line 34
    .line 35
    iput p2, p0, Ll/du10;->k:F

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/du10;->z0()V

    .line 38
    .line 39
    .line 40
    :cond_2
    :goto_0
    iget-object p0, p0, Ll/du10;->b:Ll/rer;

    .line 41
    .line 42
    if-eqz p0, :cond_3

    .line 43
    .line 44
    invoke-virtual {p0, p1, p2}, Ll/rer;->n0(Ljava/lang/String;F)V

    .line 45
    .line 46
    .line 47
    :cond_3
    return-void
.end method

.method private y0(Ljava/lang/String;F)V
    .locals 3

    .line 1
    invoke-static {p1}, Ll/j4g0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->getInstance()Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    sget-object p2, Lcom/momo/xengine/mestatistics/ReportType;->COUNT:Lcom/momo/xengine/mestatistics/ReportType;

    .line 14
    .line 15
    const-string v2, "sdk-camera-engine-use-beauty"

    .line 16
    .line 17
    invoke-virtual {p1, v2, v0, v1, p2}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->realTimeReport(Ljava/lang/String;JLcom/momo/xengine/mestatistics/ReportType;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->getInstance()Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    new-instance v0, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v1, "sdk-camera-engine-"

    .line 27
    .line 28
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 39
    .line 40
    .line 41
    move-result-wide v0

    .line 42
    invoke-virtual {p1, p0, v0, v1, p2}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->realTimeReport(Ljava/lang/String;JLcom/momo/xengine/mestatistics/ReportType;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method


# virtual methods
.method public A(Ll/g6x;)Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, p1, v0}, Ll/du10;->g0(Ll/g6x;Z)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public B(Ll/c5g0$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/du10;->C:Ll/c5g0$a;

    .line 2
    .line 3
    return-void
.end method

.method public C(Ljava/lang/String;ZLl/qpw;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    iput-object p3, p0, Ll/du10;->D:Ll/qpw;

    .line 6
    .line 7
    invoke-virtual {v0, p1, p2}, Ll/cu10;->A0(Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception p0

    .line 12
    const-string p1, "SDK_VIDEO_SDK"

    .line 13
    .line 14
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public C0(Ljava/lang/String;IIIIZLl/qpw;)V
    .locals 1

    .line 1
    move-object v0, p0

    .line 2
    iget-object p0, v0, Ll/du10;->d:Ll/cu10;

    .line 3
    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    :try_start_0
    iput-object p7, v0, Ll/du10;->D:Ll/qpw;

    .line 7
    .line 8
    invoke-virtual/range {p0 .. p6}, Ll/cu10;->z0(Ljava/lang/String;IIIIZ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    move-exception v0

    .line 13
    move-object p0, v0

    .line 14
    const-string p1, "SDK_VIDEO_SDK"

    .line 15
    .line 16
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public D(Ll/epw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/du10;->A:Ll/epw;

    .line 2
    .line 3
    iget-object p0, p0, Ll/du10;->d:Ll/cu10;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/cu10;->Z(Ll/epw;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public E(Ljava/lang/String;IIZ)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/du10;->p:Z

    .line 3
    .line 4
    iput-object p1, p0, Ll/du10;->O:Ljava/lang/String;

    .line 5
    .line 6
    iput p2, p0, Ll/du10;->P:I

    .line 7
    .line 8
    iput p3, p0, Ll/du10;->Q:I

    .line 9
    .line 10
    iget-object p2, p0, Ll/du10;->d:Ll/cu10;

    .line 11
    .line 12
    const-string p3, "VideoRecord"

    .line 13
    .line 14
    if-nez p2, :cond_0

    .line 15
    .line 16
    const-string p0, "please prepare first"

    .line 17
    .line 18
    invoke-static {p3, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return v0

    .line 22
    :cond_0
    invoke-static {}, Ll/n120;->b()Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-eqz p2, :cond_2

    .line 27
    .line 28
    if-eqz p4, :cond_1

    .line 29
    .line 30
    const-string p0, "\u8be5\u673a\u578b\u6682\u4e0d\u652f\u6301\u6b64\u529f\u80fd\uff01"

    .line 31
    .line 32
    invoke-static {p0}, Ll/u1j0;->l(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    const-string p0, "this device is not support music"

    .line 36
    .line 37
    invoke-static {p3, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return v0

    .line 41
    :cond_2
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    if-nez p2, :cond_4

    .line 46
    .line 47
    new-instance p2, Ljava/io/File;

    .line 48
    .line 49
    invoke-direct {p2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_3

    .line 57
    .line 58
    invoke-virtual {p2}, Ljava/io/File;->length()J

    .line 59
    .line 60
    .line 61
    move-result-wide p1

    .line 62
    const-wide/16 v1, 0x0

    .line 63
    .line 64
    cmp-long p1, p1, v1

    .line 65
    .line 66
    if-lez p1, :cond_3

    .line 67
    .line 68
    iget-object p0, p0, Ll/du10;->d:Ll/cu10;

    .line 69
    .line 70
    const/4 p1, 0x1

    .line 71
    invoke-virtual {p0, p1}, Ll/cu10;->O(Z)V

    .line 72
    .line 73
    .line 74
    return p1

    .line 75
    :cond_3
    const-string p0, "music file not exist"

    .line 76
    .line 77
    invoke-static {p3, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    return v0

    .line 81
    :cond_4
    const-string p0, "\u97f3\u4e50\u8def\u5f84\u4e0d\u80fd\u8bbe\u7f6e\u4e3a\u7a7a"

    .line 82
    .line 83
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    const/4 p0, 0x0

    .line 87
    return p0
.end method

.method public F()Ll/m4m;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/du10;->R:Ll/m4m;

    .line 2
    .line 3
    return-object p0
.end method

.method public G(Ljava/lang/String;IIIILl/qpw;)V
    .locals 8

    .line 1
    const/4 v6, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    move v5, p5

    .line 8
    move-object v7, p6

    .line 9
    invoke-virtual/range {v0 .. v7}, Ll/du10;->C0(Ljava/lang/String;IIIIZLl/qpw;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public H(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/du10;->x:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/du10;->d:Ll/cu10;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/cu10;->U(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public I(Landroid/app/Activity;Ll/qow;)Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    new-instance v0, Ll/vow$b;

    .line 2
    .line 3
    invoke-direct {v0, p2}, Ll/vow$b;-><init>(Ll/qow;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ll/vow$b;->i()Ll/vow;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-virtual {p0, p1, p2}, Ll/du10;->R(Landroid/app/Activity;Ll/vow;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public J(F)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/du10;->I:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string v0, "beauty_skinSmoothingValue"

    .line 7
    .line 8
    invoke-virtual {p0, v0, p1}, Ll/du10;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public K(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/du10;->o:F

    .line 2
    .line 3
    iget-object p0, p0, Ll/du10;->d:Ll/cu10;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/cu10;->h0(F)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public L()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/du10;->d:Ll/cu10;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Ll/cu10;->n()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public M()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/du10;->b:Ll/rer;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v1, Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/cu10;->Q(Ljava/util/HashMap;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/du10;->K:Ll/z4g0;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Ll/z4g0;->b(Ll/du10;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    iget-object v0, p0, Ll/du10;->b:Ll/rer;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/rer;->d0()V

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    iput-object v0, p0, Ll/du10;->f:Ll/g6x;

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    iput-boolean v0, p0, Ll/du10;->g:Z

    .line 34
    .line 35
    iput-boolean v0, p0, Ll/du10;->i:Z

    .line 36
    .line 37
    :cond_2
    invoke-virtual {p0}, Ll/du10;->t0()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ll/du10;->n0()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_3

    .line 45
    .line 46
    invoke-direct {p0}, Ll/du10;->u0()V

    .line 47
    .line 48
    .line 49
    :cond_3
    invoke-direct {p0}, Ll/du10;->j0()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public N(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/du10;->w:Z

    .line 2
    .line 3
    return-void
.end method

.method public O(F)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/du10;->I:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string v0, "beauty_skinWhitenValue"

    .line 7
    .line 8
    invoke-virtual {p0, v0, p1}, Ll/du10;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public P(Ll/lpw;)Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/du10;->m:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/du10;->s()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    new-instance v0, Ll/du10$f;

    .line 13
    .line 14
    invoke-direct {v0, p0, p1}, Ll/du10$f;-><init>(Ll/du10;Ll/lpw;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x2

    .line 18
    invoke-static {p0, v0}, Ll/lyi0;->d(ILjava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public Q(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/cu10;->g(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/du10;->b:Ll/rer;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/rer;->g0(Z)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public R(Landroid/app/Activity;Ll/vow;)Z
    .locals 2

    .line 1
    iput-object p1, p0, Ll/du10;->F:Landroid/app/Activity;

    .line 2
    .line 3
    iput-object p2, p0, Ll/du10;->G:Ll/vow;

    .line 4
    .line 5
    invoke-virtual {p2}, Ll/vow;->a()Ll/qow;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iput-object p2, p0, Ll/du10;->e:Ll/qow;

    .line 10
    .line 11
    invoke-direct {p0}, Ll/du10;->i0()V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0, p1}, Ll/du10;->h0(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    iget-object p2, p0, Ll/du10;->d:Ll/cu10;

    .line 18
    .line 19
    iget-object v0, p0, Ll/du10;->e:Ll/qow;

    .line 20
    .line 21
    invoke-virtual {p2, p1, v0}, Ll/cu10;->C(Landroid/app/Activity;Ll/qow;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iget-object p2, p0, Ll/du10;->d:Ll/cu10;

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    invoke-virtual {p2, v0}, Ll/cu10;->R(Z)V

    .line 29
    .line 30
    .line 31
    iget-object p2, p0, Ll/du10;->d:Ll/cu10;

    .line 32
    .line 33
    new-instance v1, Ll/du10$a;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/du10$a;-><init>(Ll/du10;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p2, v1}, Ll/cu10;->T(Ll/gpw;)V

    .line 39
    .line 40
    .line 41
    invoke-static {}, Ll/byx;->a()Z

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    if-eqz p2, :cond_0

    .line 46
    .line 47
    :try_start_0
    invoke-static {}, Lcom/momo/xeengine/XE3DEngine;->loadLuaEngineSo()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    .line 49
    .line 50
    :catchall_0
    :cond_0
    iget-object p2, p0, Ll/du10;->d:Ll/cu10;

    .line 51
    .line 52
    invoke-virtual {p2, v0}, Ll/cu10;->l0(Z)V

    .line 53
    .line 54
    .line 55
    iget-object p2, p0, Ll/du10;->d:Ll/cu10;

    .line 56
    .line 57
    iget-boolean v0, p0, Ll/du10;->J:Z

    .line 58
    .line 59
    invoke-virtual {p2, v0}, Ll/cu10;->j0(Z)V

    .line 60
    .line 61
    .line 62
    iget-object p2, p0, Ll/du10;->M:Lcom/mm/mediasdk/utils/NetUtil$a;

    .line 63
    .line 64
    invoke-static {p2}, Lcom/mm/mediasdk/utils/NetUtil;->f(Lcom/mm/mediasdk/utils/NetUtil$a;)V

    .line 65
    .line 66
    .line 67
    invoke-direct {p0}, Ll/du10;->m0()V

    .line 68
    .line 69
    .line 70
    invoke-direct {p0}, Ll/du10;->l0()V

    .line 71
    .line 72
    .line 73
    new-instance p2, Ll/z4g0;

    .line 74
    .line 75
    invoke-direct {p2}, Ll/z4g0;-><init>()V

    .line 76
    .line 77
    .line 78
    iput-object p2, p0, Ll/du10;->K:Ll/z4g0;

    .line 79
    .line 80
    return p1
.end method

.method public a()V
    .locals 2

    .line 1
    const-string v0, "VideoRecord"

    .line 2
    .line 3
    const-string v1, "stopPreview"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Ll/du10;->x:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/cu10;->U(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Ll/du10;->y:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ll/cu10;->e0(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ll/cu10;->B()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ll/cu10;->K()V

    .line 26
    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-virtual {v0, v1}, Ll/cu10;->W(Ll/ypl$f;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ll/cu10;->Y(Ll/bpw;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ll/cu10;->a0(Ll/lpw;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ll/cu10;->b0(Ll/npw;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ll/cu10;->f0(Landroid/view/SurfaceHolder;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    const/4 v0, 0x0

    .line 45
    iput-boolean v0, p0, Ll/du10;->H:Z

    .line 46
    .line 47
    iput-boolean v0, p0, Ll/du10;->l:Z

    .line 48
    .line 49
    return-void
.end method

.method public b(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/du10;->q0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p0, p0, Ll/du10;->d:Ll/cu10;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/cu10;->n0(I)V

    .line 13
    .line 14
    .line 15
    :cond_1
    :goto_0
    return-void
.end method

.method public c()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/du10;->d:Ll/cu10;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/cu10;->q()I

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

.method public d()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/du10;->d:Ll/cu10;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/cu10;->m()I

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

.method public e()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/du10;->d:Ll/cu10;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/cu10;->w()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public f()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v1, p0, Ll/du10;->F:Landroid/app/Activity;

    .line 6
    .line 7
    if-eqz v1, :cond_2

    .line 8
    .line 9
    iget-boolean v1, p0, Ll/du10;->g:Z

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {v0}, Ll/cu10;->w()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-nez v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/du10;->p0()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    const-string p0, "\u6b64\u624b\u673a\u4e0d\u652f\u6301\u524d\u7f6e\u6444\u50cf\u5934"

    .line 27
    .line 28
    invoke-static {p0}, Ll/u1j0;->n(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    iget-object p0, p0, Ll/du10;->F:Landroid/app/Activity;

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Ll/cu10;->x0(Landroid/app/Activity;)V

    .line 35
    .line 36
    .line 37
    :cond_2
    :goto_0
    return-void
.end method

.method public g()V
    .locals 4

    .line 1
    const-string v0, "startPreview"

    .line 2
    .line 3
    const-string v1, "VideoRecord"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/du10;->r:Landroid/view/SurfaceHolder;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    const-string p0, "\u8c03\u7528startPreview\u524d\u8bf7\u5148\u8c03\u7528setPreviewDisplay"

    .line 13
    .line 14
    invoke-static {v1, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-boolean v0, p0, Ll/du10;->l:Z

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const-string p0, "\u8bf7\u907f\u514d\u91cd\u590dstartPreview"

    .line 23
    .line 24
    invoke-static {v1, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 29
    .line 30
    if-nez v0, :cond_3

    .line 31
    .line 32
    iget-object v0, p0, Ll/du10;->e:Ll/qow;

    .line 33
    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    iget-object v2, p0, Ll/du10;->F:Landroid/app/Activity;

    .line 37
    .line 38
    if-eqz v2, :cond_2

    .line 39
    .line 40
    invoke-virtual {p0, v2, v0}, Ll/du10;->I(Landroid/app/Activity;Ll/qow;)Z

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    const-string p0, "\u8c03\u7528startPreview\u4e4b\u524d\u9700\u8981\u5148\u8fdb\u884cprepare\u7684\u8c03\u7528"

    .line 45
    .line 46
    invoke-static {v1, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_3
    :goto_0
    :try_start_0
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 51
    .line 52
    invoke-virtual {v0}, Ll/cu10;->o0()V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/du10;->f:Ll/g6x;

    .line 56
    .line 57
    if-eqz v0, :cond_4

    .line 58
    .line 59
    const/4 v2, 0x0

    .line 60
    invoke-direct {p0, v0, v2}, Ll/du10;->g0(Ll/g6x;Z)Z

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :catchall_0
    move-exception p0

    .line 65
    goto :goto_2

    .line 66
    :cond_4
    :goto_1
    iget-object v0, p0, Ll/du10;->c:Ll/oli;

    .line 67
    .line 68
    if-eqz v0, :cond_5

    .line 69
    .line 70
    iget-object v2, p0, Ll/du10;->q:Ljava/lang/String;

    .line 71
    .line 72
    const/4 v3, 0x0

    .line 73
    invoke-virtual {v0, v2, v3}, Ll/oli;->f(Ljava/lang/String;F)V

    .line 74
    .line 75
    .line 76
    :cond_5
    const/4 v0, 0x1

    .line 77
    iput-boolean v0, p0, Ll/du10;->l:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 78
    .line 79
    :try_start_1
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 80
    .line 81
    iget-object p0, p0, Ll/du10;->x:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v0, p0}, Ll/cu10;->J(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 84
    .line 85
    .line 86
    goto :goto_3

    .line 87
    :goto_2
    invoke-static {v1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 88
    .line 89
    .line 90
    :catch_0
    :goto_3
    return-void
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/du10;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method public i()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v1, p0, Ll/du10;->x:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/cu10;->U(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/du10;->y:Ljava/lang/String;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v1, p0, Ll/du10;->d:Ll/cu10;

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ll/cu10;->e0(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/cu10;->p0()V

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    iput-boolean v0, p0, Ll/du10;->m:Z

    .line 27
    .line 28
    invoke-direct {p0}, Ll/du10;->v0()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public j()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/du10;->m:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/cu10;->t0()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/cu10;->f()V

    .line 17
    .line 18
    .line 19
    :cond_1
    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Ll/du10;->m:Z

    .line 21
    .line 22
    invoke-static {}, Ll/n120;->i()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public k(Landroid/graphics/Rect;Landroid/hardware/Camera$AutoFocusCallback;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/du10;->d:Ll/cu10;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/cu10;->k(Landroid/graphics/Rect;Landroid/hardware/Camera$AutoFocusCallback;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public l(Ll/ypl$f;)V
    .locals 2

    .line 1
    const-string v0, "VideoRecord"

    .line 2
    .line 3
    const-string v1, "setOnCameraSetListener"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Ll/du10;->z:Ll/ypl$f;

    .line 9
    .line 10
    iget-object p0, p0, Ll/du10;->d:Ll/cu10;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/cu10;->W(Ll/ypl$f;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public m()Z
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/du10;->d:Ll/cu10;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/cu10;->z()Z

    .line 6
    .line 7
    .line 8
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    return p0

    .line 10
    :catchall_0
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public n(II)V
    .locals 1

    .line 1
    iput p1, p0, Ll/du10;->u:I

    .line 2
    .line 3
    iput p2, p0, Ll/du10;->v:I

    .line 4
    .line 5
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, p1, p2}, Ll/cu10;->m0(II)Ll/crf0;

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iput p1, p0, Ll/du10;->s:I

    .line 14
    .line 15
    iput p2, p0, Ll/du10;->t:I

    .line 16
    .line 17
    return-void
.end method

.method public n0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/du10;->d:Ll/cu10;

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
    invoke-virtual {p0}, Ll/cu10;->v()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public o(Ljava/lang/String;F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/du10;->b:Ll/rer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/rer;->q0(Ljava/lang/String;F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public p(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/du10;->b:Ll/rer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/rer;->l0(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public p0()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/dd4;->a()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
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
    const-string v1, "VideoRecord"

    .line 10
    .line 11
    const-string v2, "setFaceThinScale %f"

    .line 12
    .line 13
    invoke-static {v1, v2, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "beauty_thinFaceValue"

    .line 17
    .line 18
    invoke-virtual {p0, v0, p1}, Ll/du10;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public q0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/du10;->d:Ll/cu10;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/cu10;->A()Z

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

.method public r(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/du10;->m()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    if-ne p1, v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/cu10;->y()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-direct {p0, p1}, Ll/du10;->k0(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Ll/cu10;->S(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-direct {p0, p1}, Ll/du10;->k0(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p0}, Ll/cu10;->S(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public release()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Lcom/mm/mediasdk/utils/NetUtil;->f(Lcom/mm/mediasdk/utils/NetUtil$a;)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Ll/du10;->c:Ll/oli;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/oli;->a()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/du10;->c:Ll/oli;

    .line 13
    .line 14
    :cond_0
    invoke-static {}, Ll/n120;->c()J

    .line 15
    .line 16
    .line 17
    move-result-wide v1

    .line 18
    invoke-static {v1, v2}, Ll/n120;->s(J)Z

    .line 19
    .line 20
    .line 21
    invoke-static {}, Ll/n120;->i()V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Ll/du10;->a:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 27
    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    iput-boolean v1, p0, Ll/du10;->H:Z

    .line 31
    .line 32
    invoke-static {}, Ll/yqc0;->b()V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Ll/du10;->L:Lcom/mm/mediasdk/bridge/EngineCommonBridge;

    .line 36
    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    invoke-virtual {v1}, Lcom/mm/mediasdk/bridge/EngineCommonBridge;->b()V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Ll/du10;->L:Lcom/mm/mediasdk/bridge/EngineCommonBridge;

    .line 43
    .line 44
    :cond_1
    return-void
.end method

.method public removeLast()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/du10;->d:Ll/cu10;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/cu10;->F()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public s()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/du10;->h()Z

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
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/cu10;->t0()V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/n120;->g()V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-boolean v0, p0, Ll/du10;->m:Z

    .line 22
    .line 23
    :cond_1
    :goto_0
    return-void
.end method

.method public setFaceBeautyValue(Ljava/lang/String;F)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, p1, p2, v0}, Ll/du10;->x0(Ljava/lang/String;FZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public t()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/du10;->b:Ll/rer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/rer;->k0()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public t0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/du10;->d:Ll/cu10;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/cu10;->H()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public u(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/du10;->r0(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/du10;->b:Ll/rer;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/rer;->a0(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public v(F)V
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
    const-string v1, "VideoRecord"

    .line 10
    .line 11
    const-string v2, "setFaceEyeScale %f"

    .line 12
    .line 13
    invoke-static {v1, v2, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "beauty_bigEyeValue"

    .line 17
    .line 18
    invoke-virtual {p0, v0, p1}, Ll/du10;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public w(Landroid/view/SurfaceHolder;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ll/du10;->r:Landroid/view/SurfaceHolder;

    .line 2
    .line 3
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 4
    .line 5
    filled-new-array {v0, p1}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "VideoRecord"

    .line 10
    .line 11
    const-string v2, "setPreviewDisplay delegate:%s holder: %s"

    .line 12
    .line 13
    invoke-static {v1, v2, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/du10;->d:Ll/cu10;

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/cu10;->f0(Landroid/view/SurfaceHolder;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public x(F)V
    .locals 0
    .param p1    # F
        .annotation build Landroidx/annotation/FloatRange;
            from = 0.0
            to = 1.0
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/du10;->c:Ll/oli;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/oli;->c(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public y(Ljava/lang/String;F)V
    .locals 5

    .line 1
    invoke-static {}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->getInstance()Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    sget-object v3, Lcom/momo/xengine/mestatistics/ReportType;->COUNT:Lcom/momo/xengine/mestatistics/ReportType;

    .line 10
    .line 11
    const-string v4, "sdk-camera-engine-use-lookup"

    .line 12
    .line 13
    invoke-virtual {v0, v4, v1, v2, v3}, Lcom/immomo/moment/util/datadot/RecorderDataDotUtils;->realTimeReport(Ljava/lang/String;JLcom/momo/xengine/mestatistics/ReportType;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/du10;->q:Ljava/lang/String;

    .line 17
    .line 18
    iget-object p0, p0, Ll/du10;->c:Ll/oli;

    .line 19
    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0, p1, p2}, Ll/oli;->f(Ljava/lang/String;F)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public z(Ll/bpw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/du10;->B:Ll/bpw;

    .line 2
    .line 3
    iget-object p0, p0, Ll/du10;->d:Ll/cu10;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/cu10;->Y(Ll/bpw;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public z0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/du10;->d:Ll/cu10;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget v1, p0, Ll/du10;->j:F

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    cmpl-float v1, v1, v2

    .line 9
    .line 10
    const-string v3, "VideoRecord"

    .line 11
    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    iget v1, p0, Ll/du10;->k:F

    .line 15
    .line 16
    cmpl-float v1, v1, v2

    .line 17
    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    invoke-virtual {v0, p0}, Ll/cu10;->V(Z)V

    .line 22
    .line 23
    .line 24
    const-string p0, "setNeedBodyWrap false"

    .line 25
    .line 26
    invoke-static {v3, p0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    const/4 v1, 0x1

    .line 31
    invoke-virtual {v0, v1}, Ll/cu10;->V(Z)V

    .line 32
    .line 33
    .line 34
    iget v0, p0, Ll/du10;->j:F

    .line 35
    .line 36
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget p0, p0, Ll/du10;->k:F

    .line 41
    .line 42
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const-string v0, "setNeedBodyWrap true %f - %f"

    .line 51
    .line 52
    invoke-static {v3, v0, p0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method
