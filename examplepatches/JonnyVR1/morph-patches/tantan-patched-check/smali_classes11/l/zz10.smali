.class public Ll/zz10;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

.field private b:I

.field private c:I

.field private d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPlayPositionListener;",
            ">;"
        }
    .end annotation
.end field

.field private e:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPreparedListener;

.field private f:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPlayPositionListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 62
    invoke-direct {p0, v0, v0}, Ll/zz10;-><init>(ZZ)V

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/zz10;->c:I

    .line 6
    .line 7
    new-instance v0, Ll/zz10$a;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/zz10$a;-><init>(Ll/zz10;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/zz10;->e:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPreparedListener;

    .line 13
    .line 14
    new-instance v0, Ll/zz10$b;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/zz10$b;-><init>(Ll/zz10;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/zz10;->f:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPlayPositionListener;

    .line 20
    .line 21
    new-instance v0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-direct {v0, p1, v1}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;-><init>(ZZ)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Ll/zz10;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 28
    .line 29
    new-instance p1, Ll/dp50;

    .line 30
    .line 31
    invoke-direct {p1}, Ll/dp50;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, p1}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->setOnErrorDotDataListener(Ll/apw;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/zz10;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 38
    .line 39
    new-instance v0, Ll/ql50;

    .line 40
    .line 41
    invoke-direct {v0}, Ll/ql50;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->setOnErrorDotDataListener(Ll/apw;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/zz10;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 48
    .line 49
    iget-object v0, p0, Ll/zz10;->e:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPreparedListener;

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->setOnPreparedListener(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPreparedListener;)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Ll/zz10;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 55
    .line 56
    iget-object p0, p0, Ll/zz10;->f:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPlayPositionListener;

    .line 57
    .line 58
    invoke-virtual {p1, p0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->setOnPlayPositionListener(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPlayPositionListener;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public constructor <init>(ZZ)V
    .locals 1

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 64
    iput v0, p0, Ll/zz10;->c:I

    .line 65
    new-instance v0, Ll/zz10$a;

    invoke-direct {v0, p0}, Ll/zz10$a;-><init>(Ll/zz10;)V

    iput-object v0, p0, Ll/zz10;->e:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPreparedListener;

    .line 66
    new-instance v0, Ll/zz10$b;

    invoke-direct {v0, p0}, Ll/zz10$b;-><init>(Ll/zz10;)V

    iput-object v0, p0, Ll/zz10;->f:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPlayPositionListener;

    .line 67
    new-instance v0, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    invoke-direct {v0, p1, p2}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;-><init>(ZZ)V

    iput-object v0, p0, Ll/zz10;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 68
    new-instance p1, Ll/dp50;

    invoke-direct {p1}, Ll/dp50;-><init>()V

    invoke-virtual {v0, p1}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->setOnErrorDotDataListener(Ll/apw;)V

    .line 69
    iget-object p1, p0, Ll/zz10;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    new-instance p2, Ll/ql50;

    invoke-direct {p2}, Ll/ql50;-><init>()V

    invoke-virtual {p1, p2}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->setOnErrorDotDataListener(Ll/apw;)V

    .line 70
    iget-object p1, p0, Ll/zz10;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    iget-object p2, p0, Ll/zz10;->e:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPreparedListener;

    invoke-virtual {p1, p2}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->setOnPreparedListener(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPreparedListener;)V

    .line 71
    iget-object p1, p0, Ll/zz10;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    iget-object p0, p0, Ll/zz10;->f:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPlayPositionListener;

    invoke-virtual {p1, p0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->setOnPlayPositionListener(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPlayPositionListener;)V

    return-void
.end method

.method public static synthetic a(Ll/zz10;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/zz10;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Ll/zz10;I)I
    .locals 0

    .line 1
    iput p1, p0, Ll/zz10;->c:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic c(Ll/zz10;)Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zz10;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Ll/zz10;I)I
    .locals 0

    .line 1
    iput p1, p0, Ll/zz10;->b:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic e(Ll/zz10;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zz10;->d:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method private f()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zz10;->d:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/zz10;->d:Ljava/util/List;

    .line 10
    .line 11
    :cond_0
    return-void
.end method


# virtual methods
.method public g()Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zz10;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zz10;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->isPlaying()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public i()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zz10;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->isPlaying()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/zz10;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->pause()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public j()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zz10;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->isPlaying()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/zz10;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->pause()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Ll/zz10;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->release()V

    .line 19
    .line 20
    .line 21
    :cond_1
    invoke-direct {p0}, Ll/zz10;->f()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public k()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zz10;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->pause()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/zz10;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->reset()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public l(F)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/zz10;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/zz10;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->setPlaySpeed(F)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/zz10;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->start()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public m(Ljava/lang/String;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/SecurityException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    new-instance v0, Ljava/io/File;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Ll/zz10;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->setDataSource(Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    :cond_0
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public n(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPreparedListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zz10;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->setOnPreparedListener(Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer$OnPreparedListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/zz10;->c:I

    .line 2
    .line 3
    if-ltz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/zz10;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->seekPlayTime(I)Z

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public p(IIZF)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/zz10;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/zz10;->i()V

    .line 8
    .line 9
    .line 10
    if-nez p3, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/zz10;->q()V

    .line 13
    .line 14
    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    iput v0, p0, Ll/zz10;->b:I

    .line 17
    .line 18
    iget-object v0, p0, Ll/zz10;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 19
    .line 20
    invoke-virtual {v0, p4}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->setPlaySpeed(F)V

    .line 21
    .line 22
    .line 23
    iget-object p4, p0, Ll/zz10;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 24
    .line 25
    invoke-virtual {p4, p1, p2}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->setPlayTimeRange(II)Z

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/zz10;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 29
    .line 30
    if-nez p3, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->prepare()V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->start()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public q()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/zz10;->b:I

    .line 3
    .line 4
    iget-object v0, p0, Ll/zz10;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->isPlaying()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/zz10;->i()V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/zz10;->a:Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/AudioSpeedControlPlayer;->release()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
