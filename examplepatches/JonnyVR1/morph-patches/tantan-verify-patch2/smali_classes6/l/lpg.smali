.class public Ll/lpg;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile m:Ll/lpg;


# instance fields
.field public a:Ll/azl;

.field public b:Lcom/p1/mobile/putong/feed/data/Moment;

.field public c:Landroid/app/Activity;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/npg;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ll/mpg;

.field public h:Landroid/media/AudioManager$OnAudioFocusChangeListener;

.field public i:Z

.field public j:Ljava/lang/Runnable;

.field public k:Z

.field public l:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/lpg;->B()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic a(Ll/npg;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/npg;->onStart()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic b(Ll/npg;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/npg;->onComplete()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic c(Ll/npg;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/npg;->h()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic d(ZLl/npg;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p1, p0}, Ll/npg;->i(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic e(Ll/lpg;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/lpg;->I()V

    return-void
.end method

.method public static synthetic f(Ll/lpg;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/lpg;->J()V

    return-void
.end method

.method public static synthetic g(Ll/npg;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/npg;->onPause()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic h(Ljava/lang/Exception;Ll/npg;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p1, p0}, Ll/npg;->a(Ljava/lang/Exception;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic i(Ll/npg;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/npg;->onResume()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic j(FLl/npg;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p1, p0}, Ll/npg;->j(F)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic k(Ll/lpg;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lpg;->H(I)V

    return-void
.end method

.method public static synthetic l(Ll/lpg;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/lpg;->G()V

    return-void
.end method

.method public static v()Ll/lpg;
    .locals 2

    .line 1
    sget-object v0, Ll/lpg;->m:Ll/lpg;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/lpg;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/lpg;->m:Ll/lpg;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/lpg;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/lpg;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/lpg;->m:Ll/lpg;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/lpg;->m:Ll/lpg;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public final A()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/lpg;->g:Ll/mpg;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/mpg;

    .line 6
    .line 7
    iget-object v1, p0, Ll/lpg;->c:Landroid/app/Activity;

    .line 8
    .line 9
    iget-object v2, p0, Ll/lpg;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    invoke-direct {v0, v1, v2}, Ll/mpg;-><init>(Landroid/app/Activity;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/lpg;->g:Ll/mpg;

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object p0, p0, Ll/lpg;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ll/mpg;->e(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final B()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/lpg;->f:Ljava/util/List;

    .line 7
    .line 8
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/lpg;->l:Lrx/subjects/b;

    .line 13
    .line 14
    return-void
.end method

.method public final C()V
    .locals 2

    .line 1
    new-instance v0, Ll/aqh0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/aqh0;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/lpg;->a:Ll/azl;

    .line 7
    .line 8
    new-instance v1, Ll/gpg;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/gpg;-><init>(Ll/lpg;)V

    .line 11
    .line 12
    .line 13
    invoke-interface {v0, v1}, Ll/azl;->b(Ll/y20;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/lpg;->a:Ll/azl;

    .line 17
    .line 18
    new-instance v1, Ll/hpg;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/hpg;-><init>(Ll/lpg;)V

    .line 21
    .line 22
    .line 23
    invoke-interface {v0, v1}, Ll/azl;->a(Ll/a30;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/lpg;->a:Ll/azl;

    .line 27
    .line 28
    new-instance v1, Ll/ipg;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/ipg;-><init>(Ll/lpg;)V

    .line 31
    .line 32
    .line 33
    invoke-interface {v0, v1}, Ll/azl;->c(Ll/a30;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/lpg;->a:Ll/azl;

    .line 37
    .line 38
    new-instance v1, Ll/jpg;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/jpg;-><init>(Ll/lpg;)V

    .line 41
    .line 42
    .line 43
    invoke-interface {v0, v1}, Ll/azl;->d(Ll/y20;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public D()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/lpg;->E()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/lpg;->F()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public E()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lpg;->a:Ll/azl;

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
    iget-object p0, p0, Ll/lpg;->a:Ll/azl;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/azl;->isPlaying()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public final F()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lpg;->e:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public final synthetic G()V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/lpg;->d:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-boolean v0, p0, Ll/lpg;->k:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/lpg;->d:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/lpg;->Y(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Ll/lpg;->k:Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    :cond_0
    return-void

    .line 22
    :catch_0
    move-exception p0

    .line 23
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic H(I)V
    .locals 1

    .line 1
    const/4 v0, -0x3

    .line 2
    if-eq p1, v0, :cond_2

    .line 3
    .line 4
    const/4 v0, -0x2

    .line 5
    if-eq p1, v0, :cond_2

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    if-eq p1, v0, :cond_1

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    if-eq p1, v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    new-instance p1, Ll/wog;

    .line 15
    .line 16
    invoke-direct {p1, p0}, Ll/wog;-><init>(Ll/lpg;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    new-instance p1, Ll/vog;

    .line 24
    .line 25
    invoke-direct {p1, p0}, Ll/vog;-><init>(Ll/lpg;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_2
    new-instance p1, Ll/kpg;

    .line 33
    .line 34
    invoke-direct {p1, p0}, Ll/kpg;-><init>(Ll/lpg;)V

    .line 35
    .line 36
    .line 37
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic I()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/lpg;->X()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/lpg;->k:Z

    .line 6
    .line 7
    return-void
.end method

.method public final synthetic J()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/lpg;->i0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/lpg;->a:Ll/azl;

    .line 5
    .line 6
    invoke-interface {v0}, Ll/azl;->getCurrentPosition()F

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-virtual {p0, v0}, Ll/lpg;->T(F)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public K()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/lpg;->y()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/yog;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/yog;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public L(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/lpg;->K()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/lpg;->R()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/lpg;->q()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public M(Ljava/lang/Exception;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/lpg;->y()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/zog;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/zog;-><init>(Ljava/lang/Exception;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public N(Ljava/lang/Object;II)Z
    .locals 2

    .line 1
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->Y0:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p1, v0}, Ll/o1j0;->i(IZ)V

    .line 5
    .line 6
    .line 7
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 8
    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string p2, ""

    .line 18
    .line 19
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ll/lpg;->M(Ljava/lang/Exception;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/lpg;->R()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Ll/lpg;->q()V

    .line 39
    .line 40
    .line 41
    return v0
.end method

.method public O(Ljava/lang/Object;II)Z
    .locals 0

    .line 1
    const/16 p1, 0x2bd

    .line 2
    .line 3
    const/4 p3, 0x1

    .line 4
    if-eq p2, p1, :cond_1

    .line 5
    .line 6
    const/16 p1, 0x2be

    .line 7
    .line 8
    if-eq p2, p1, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/lpg;->U()V

    .line 13
    .line 14
    .line 15
    return p3

    .line 16
    :cond_1
    invoke-virtual {p0}, Ll/lpg;->P()V

    .line 17
    .line 18
    .line 19
    return p3
.end method

.method public P()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/lpg;->y()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/epg;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/epg;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public Q()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/lpg;->y()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/bpg;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/bpg;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final R()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/lpg;->k0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/lpg;->b0()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/lpg;->f:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/lpg;->t()Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, Ll/lb1;->a(Landroid/media/AudioManager$OnAudioFocusChangeListener;)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public S(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/lpg;->z()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Ll/lpg;->e:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/lpg;->r(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public T(F)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/lpg;->y()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/xog;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/xog;-><init>(F)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public U()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/lpg;->y()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/apg;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/apg;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public V()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/lpg;->y()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/fpg;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/fpg;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/lpg;->i0()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public W(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/lpg;->y()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/dpg;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/dpg;-><init>(Z)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public X()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/lpg;->a0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/lpg;->E()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/lpg;->a:Ll/azl;

    .line 11
    .line 12
    invoke-interface {v0}, Ll/azl;->pause()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/lpg;->Q()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public Y(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/lpg;->Z(Ljava/lang/String;Ll/npg;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public Z(Ljava/lang/String;Ll/npg;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/lpg;->f0(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/feed/helper/audioplayer/FeedAudioCanWorkControl;->a()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    iget-object v0, p0, Ll/lpg;->a:Ll/azl;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/lpg;->C()V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-virtual {p0, p1}, Ll/lpg;->g0(Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ll/lpg;->r(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    invoke-virtual {p0}, Ll/lpg;->o()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p2}, Ll/lpg;->m(Ll/npg;)Ll/lpg;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/lpg;->A()V

    .line 37
    .line 38
    .line 39
    iput-object p1, p0, Ll/lpg;->e:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/lpg;->P()V

    .line 42
    .line 43
    .line 44
    iget-object p2, p0, Ll/lpg;->a:Ll/azl;

    .line 45
    .line 46
    invoke-interface {p2}, Ll/azl;->reset()V

    .line 47
    .line 48
    .line 49
    iget-object p2, p0, Ll/lpg;->a:Ll/azl;

    .line 50
    .line 51
    invoke-interface {p2, p1}, Ll/azl;->setDataSource(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Ll/lpg;->a:Ll/azl;

    .line 55
    .line 56
    invoke-interface {p0}, Ll/azl;->prepareAsync()V

    .line 57
    .line 58
    .line 59
    :cond_2
    return-void
.end method

.method public final a0()V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    iput-object v0, p0, Ll/lpg;->e:Ljava/lang/String;

    .line 4
    .line 5
    return-void
.end method

.method public final b0()V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    iput-object v0, p0, Ll/lpg;->d:Ljava/lang/String;

    .line 4
    .line 5
    return-void
.end method

.method public c0(Lcom/p1/mobile/putong/feed/data/Moment;)Ll/lpg;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lpg;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    return-object p0
.end method

.method public d0(Landroid/app/Activity;)Ll/lpg;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lpg;->c:Landroid/app/Activity;

    .line 2
    .line 3
    return-object p0
.end method

.method public e0(Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/lpg;->g0(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/lpg;->h0(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public final f0(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lpg;->e:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public g0(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lpg;->d:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method public h0(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lpg;->e:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method public final i0()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/lpg;->i:Z

    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/lpg;->w()Ljava/lang/Runnable;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-wide/16 v1, 0x3e8

    .line 11
    .line 12
    invoke-static {v0, p0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public j0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/lpg;->D()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Ll/lpg;->W(Z)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/lpg;->E()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/lpg;->s()V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-virtual {p0}, Ll/lpg;->R()V

    .line 22
    .line 23
    .line 24
    :goto_0
    invoke-virtual {p0}, Ll/lpg;->q()V

    .line 25
    .line 26
    .line 27
    :cond_1
    invoke-virtual {p0}, Ll/lpg;->a0()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final k0()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/lpg;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/lpg;->w()Ljava/lang/Runnable;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Ll/lpg;->i:Z

    .line 14
    .line 15
    return-void
.end method

.method public m(Ll/npg;)Ll/lpg;
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/lpg;->f:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/lpg;->f:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    return-object p0
.end method

.method public final n(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/npg;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/lpg;->g:Ll/mpg;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final o()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/lpg;->E()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p0, v0}, Ll/lpg;->W(Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/lpg;->s()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final p()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lpg;->g:Ll/mpg;

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
    iget-object v0, p0, Ll/lpg;->g:Ll/mpg;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/mpg;->b()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Ll/lpg;->g:Ll/mpg;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final q()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/lpg;->p()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/lpg;->c:Landroid/app/Activity;

    .line 6
    .line 7
    return-void
.end method

.method public final r(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/lpg;->a0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/lpg;->t()Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-static {v0, v1}, Ll/lb1;->b(Landroid/media/AudioManager$OnAudioFocusChangeListener;I)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iput-object p1, p0, Ll/lpg;->d:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v0, p0, Ll/lpg;->a:Ll/azl;

    .line 18
    .line 19
    invoke-interface {v0}, Ll/azl;->start()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/lpg;->V()V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/lpg;->l:Lrx/subjects/b;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public final s()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lpg;->a:Ll/azl;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/azl;->stop()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/lpg;->R()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public t()Landroid/media/AudioManager$OnAudioFocusChangeListener;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lpg;->h:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/uog;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/uog;-><init>(Ll/lpg;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/lpg;->h:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/lpg;->h:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 13
    .line 14
    return-object p0
.end method

.method public u()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lpg;->b:Lcom/p1/mobile/putong/feed/data/Moment;

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
    iget-object p0, p0, Ll/lpg;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string p0, ""

    .line 15
    .line 16
    return-object p0
.end method

.method public final w()Ljava/lang/Runnable;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lpg;->j:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/cpg;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/cpg;-><init>(Ll/lpg;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/lpg;->j:Ljava/lang/Runnable;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/lpg;->j:Ljava/lang/Runnable;

    .line 13
    .line 14
    return-object p0
.end method

.method public x()Lrx/subjects/b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/b<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/lpg;->l:Lrx/subjects/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public final y()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/npg;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object v1, p0, Ll/lpg;->f:Ljava/util/List;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/lpg;->n(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public final z()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lpg;->e:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method
