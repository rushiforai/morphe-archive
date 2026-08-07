.class public Ll/mnc0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/mnc0$a;
    }
.end annotation


# static fields
.field private static t:[I

.field private static u:[I


# instance fields
.field private a:Ljava/lang/String;

.field private b:I

.field private c:Z

.field private d:Landroid/os/Handler;

.field private e:I

.field private f:Z

.field private g:Z

.field private h:I

.field private i:Z

.field private j:Z

.field private k:I

.field private l:I

.field private m:I

.field private n:I

.field private o:Z

.field private p:S

.field private q:S

.field private r:I

.field private s:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    const v0, 0xac44

    .line 2
    .line 3
    .line 4
    const/16 v1, 0x5622

    .line 5
    .line 6
    const/16 v2, 0x3e80

    .line 7
    .line 8
    const/16 v3, 0x2b11

    .line 9
    .line 10
    const/16 v4, 0x1f40

    .line 11
    .line 12
    filled-new-array {v0, v1, v2, v3, v4}, [I

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sput-object v0, Ll/mnc0;->t:[I

    .line 17
    .line 18
    const v0, 0xbb80

    .line 19
    .line 20
    .line 21
    const/16 v1, 0x7d00

    .line 22
    .line 23
    filled-new-array {v0, v1, v2, v4}, [I

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sput-object v0, Ll/mnc0;->u:[I

    .line 28
    .line 29
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/mnc0;->c:Z

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    iput v0, p0, Ll/mnc0;->l:I

    .line 9
    .line 10
    iput v0, p0, Ll/mnc0;->m:I

    .line 11
    .line 12
    iput v0, p0, Ll/mnc0;->n:I

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    iput-boolean v1, p0, Ll/mnc0;->o:Z

    .line 16
    .line 17
    iput-short v0, p0, Ll/mnc0;->p:S

    .line 18
    .line 19
    iput-short v0, p0, Ll/mnc0;->q:S

    .line 20
    .line 21
    iput v0, p0, Ll/mnc0;->r:I

    .line 22
    .line 23
    iput v0, p0, Ll/mnc0;->s:I

    .line 24
    .line 25
    iput-boolean p2, p0, Ll/mnc0;->i:Z

    .line 26
    .line 27
    iput-object p1, p0, Ll/mnc0;->a:Ljava/lang/String;

    .line 28
    .line 29
    return-void
.end method

.method private A([SLcom/tantanapp/media/ttns/TTNsProcessor;)[S
    .locals 1

    .line 1
    :try_start_0
    array-length v0, p1

    .line 2
    new-array v0, v0, [S

    .line 3
    .line 4
    iget p0, p0, Ll/mnc0;->r:I

    .line 5
    .line 6
    if-lez p0, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x1

    .line 10
    :goto_0
    invoke-virtual {p2, p1, p0, v0}, Lcom/tantanapp/media/ttns/TTNsProcessor;->process([SI[S)I

    .line 11
    .line 12
    .line 13
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    if-gez p0, :cond_1

    .line 15
    .line 16
    return-object p1

    .line 17
    :cond_1
    return-object v0

    .line 18
    :catch_0
    return-object p1
.end method

.method public static synthetic a(Ll/mnc0;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mnc0;->d:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Ll/mnc0;[SLcom/tantanapp/media/ttagc/TTAgcProcessor;)[S
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/mnc0;->z([SLcom/tantanapp/media/ttagc/TTAgcProcessor;)[S

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Ll/mnc0;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/mnc0;->c:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic d(Ll/mnc0;[SLcom/tantanapp/media/ttns/TTNsProcessor;)[S
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/mnc0;->A([SLcom/tantanapp/media/ttns/TTNsProcessor;)[S

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e(Ll/mnc0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/mnc0;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic f(Ll/mnc0;I)I
    .locals 0

    .line 1
    iput p1, p0, Ll/mnc0;->e:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic g(Ll/mnc0;[S)D
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mnc0;->q([S)D

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    return-wide p0
.end method

.method public static synthetic h(Ll/mnc0;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/mnc0;->f:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic i(Ll/mnc0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/mnc0;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic j(Ll/mnc0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/mnc0;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic k(Ll/mnc0;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mnc0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic l(Ll/mnc0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/mnc0;->i:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic m(Ll/mnc0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/mnc0;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic n(Ll/mnc0;Lcom/tantanapp/media/ttagc/TTAgcProcessor;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mnc0;->r(Lcom/tantanapp/media/ttagc/TTAgcProcessor;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o(Ll/mnc0;Lcom/tantanapp/media/ttns/TTNsProcessor;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mnc0;->s(Lcom/tantanapp/media/ttns/TTNsProcessor;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p(Ll/mnc0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/mnc0;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method private q([S)D
    .locals 4

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    :goto_0
    array-length v2, p1

    .line 5
    if-ge p0, v2, :cond_1

    .line 6
    .line 7
    aget-short v2, p1, p0

    .line 8
    .line 9
    const v3, 0x8000

    .line 10
    .line 11
    .line 12
    if-lt v2, v3, :cond_0

    .line 13
    .line 14
    const v3, 0xffff

    .line 15
    .line 16
    .line 17
    sub-int v2, v3, v2

    .line 18
    .line 19
    :cond_0
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    int-to-double v2, v2

    .line 24
    add-double/2addr v0, v2

    .line 25
    add-int/lit8 p0, p0, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    array-length p0, p1

    .line 29
    int-to-double p0, p0

    .line 30
    div-double/2addr v0, p0

    .line 31
    return-wide v0
.end method

.method private r(Lcom/tantanapp/media/ttagc/TTAgcProcessor;)V
    .locals 1

    .line 1
    iget-short v0, p0, Ll/mnc0;->q:S

    .line 2
    .line 3
    if-ltz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->setCompressionGaindB(S)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-boolean v0, p0, Ll/mnc0;->o:Z

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->setLimiterEnable(Z)V

    .line 11
    .line 12
    .line 13
    iget v0, p0, Ll/mnc0;->m:I

    .line 14
    .line 15
    if-ltz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->setMaxLevel(I)V

    .line 18
    .line 19
    .line 20
    :cond_1
    iget v0, p0, Ll/mnc0;->l:I

    .line 21
    .line 22
    if-ltz v0, :cond_2

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->setMinLevel(I)V

    .line 25
    .line 26
    .line 27
    :cond_2
    iget v0, p0, Ll/mnc0;->n:I

    .line 28
    .line 29
    if-ltz v0, :cond_3

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->setAgcMode(I)V

    .line 32
    .line 33
    .line 34
    :cond_3
    iget v0, p0, Ll/mnc0;->r:I

    .line 35
    .line 36
    if-ltz v0, :cond_4

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->setNumBands(I)V

    .line 39
    .line 40
    .line 41
    :cond_4
    iget-short p0, p0, Ll/mnc0;->p:S

    .line 42
    .line 43
    if-ltz p0, :cond_5

    .line 44
    .line 45
    invoke-virtual {p1, p0}, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->setTargetLevelDbfs(S)V

    .line 46
    .line 47
    .line 48
    :cond_5
    return-void
.end method

.method private s(Lcom/tantanapp/media/ttns/TTNsProcessor;)V
    .locals 0

    .line 1
    iget p0, p0, Ll/mnc0;->s:I

    .line 2
    .line 3
    if-ltz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Lcom/tantanapp/media/ttns/TTNsProcessor;->setNsMode(I)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/4 p0, 0x2

    .line 10
    invoke-virtual {p1, p0}, Lcom/tantanapp/media/ttns/TTNsProcessor;->setNsMode(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private z([SLcom/tantanapp/media/ttagc/TTAgcProcessor;)[S
    .locals 2

    .line 1
    :try_start_0
    array-length v0, p1

    .line 2
    new-array v0, v0, [S

    .line 3
    .line 4
    iget p0, p0, Ll/mnc0;->k:I

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {p2, p1, p0, v0, v1}, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->process([SI[SI)I

    .line 8
    .line 9
    .line 10
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    if-gez p0, :cond_0

    .line 12
    .line 13
    return-object p1

    .line 14
    :cond_0
    return-object v0

    .line 15
    :catch_0
    return-object p1
.end method


# virtual methods
.method public B()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/mnc0;->g:Z

    .line 3
    .line 4
    return-void
.end method

.method public t()Landroid/media/AudioRecord;
    .locals 10

    .line 1
    iget-boolean v0, p0, Ll/mnc0;->j:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ll/mnc0;->u:[I

    .line 6
    .line 7
    :goto_0
    move-object v1, v0

    .line 8
    goto :goto_1

    .line 9
    :cond_0
    sget-object v0, Ll/mnc0;->t:[I

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :goto_1
    array-length v2, v1

    .line 13
    const/4 v0, 0x0

    .line 14
    move v3, v0

    .line 15
    :goto_2
    if-ge v3, v2, :cond_4

    .line 16
    .line 17
    aget v6, v1, v3

    .line 18
    .line 19
    const/16 v0, 0x10

    .line 20
    .line 21
    const/4 v4, 0x2

    .line 22
    :try_start_0
    invoke-static {v6, v0, v4}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const/4 v4, -0x2

    .line 27
    if-eq v0, v4, :cond_3

    .line 28
    .line 29
    new-instance v4, Landroid/media/AudioRecord;

    .line 30
    .line 31
    mul-int/lit8 v9, v0, 0x2

    .line 32
    .line 33
    const/4 v5, 0x1

    .line 34
    const/16 v7, 0x10

    .line 35
    .line 36
    const/4 v8, 0x2

    .line 37
    invoke-direct/range {v4 .. v9}, Landroid/media/AudioRecord;-><init>(IIIII)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v4}, Landroid/media/AudioRecord;->getState()I

    .line 41
    .line 42
    .line 43
    move-result v5

    .line 44
    const/4 v7, 0x1

    .line 45
    if-ne v5, v7, :cond_3

    .line 46
    .line 47
    iput v6, p0, Ll/mnc0;->b:I

    .line 48
    .line 49
    iget-boolean v5, p0, Ll/mnc0;->j:Z

    .line 50
    .line 51
    if-eqz v5, :cond_2

    .line 52
    .line 53
    const/16 v0, 0x3e80

    .line 54
    .line 55
    if-ge v6, v0, :cond_1

    .line 56
    .line 57
    const/16 v0, 0x50

    .line 58
    .line 59
    iput v0, p0, Ll/mnc0;->h:I

    .line 60
    .line 61
    iput v0, p0, Ll/mnc0;->k:I

    .line 62
    .line 63
    goto :goto_3

    .line 64
    :catch_0
    move-exception v0

    .line 65
    goto :goto_4

    .line 66
    :cond_1
    const/16 v0, 0xa0

    .line 67
    .line 68
    iput v0, p0, Ll/mnc0;->h:I

    .line 69
    .line 70
    iput v0, p0, Ll/mnc0;->k:I

    .line 71
    .line 72
    goto :goto_3

    .line 73
    :cond_2
    iput v0, p0, Ll/mnc0;->h:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    .line 75
    :goto_3
    return-object v4

    .line 76
    :goto_4
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 77
    .line 78
    .line 79
    :cond_3
    add-int/lit8 v3, v3, 0x1

    .line 80
    .line 81
    goto :goto_2

    .line 82
    :cond_4
    const/4 p0, 0x0

    .line 83
    return-object p0
.end method

.method public u()I
    .locals 0

    .line 1
    iget p0, p0, Ll/mnc0;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public v(Landroid/os/Handler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mnc0;->d:Landroid/os/Handler;

    .line 2
    .line 3
    return-void
.end method

.method public w(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/mnc0;->j:Z

    .line 2
    .line 3
    return-void
.end method

.method public x(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/mnc0;->s:I

    .line 2
    .line 3
    return-void
.end method

.method public y(I)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/mnc0;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Ll/mnc0;->g:Z

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Ll/mnc0;->c:Z

    .line 11
    .line 12
    new-instance v0, Ll/mnc0$a;

    .line 13
    .line 14
    invoke-direct {v0, p0, p1}, Ll/mnc0$a;-><init>(Ll/mnc0;I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 18
    .line 19
    .line 20
    return-void
.end method
