.class public Ll/g500;
.super Ll/j3z;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/j3z<",
        "Ll/i500;",
        ">;"
    }
.end annotation


# static fields
.field public static n:J = -0x1L


# instance fields
.field public b:J

.field public c:Lcom/p1/mobile/android/media/AudioPlayer;

.field public d:Z

.field public e:Ll/gcg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gcg0<",
            "Lcom/p1/mobile/android/media/AudioPlayer$State;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ljava/lang/Runnable;

.field public g:Ll/tnw;

.field public h:Landroid/media/SoundPool;

.field public i:I

.field public j:I

.field public k:Z

.field public l:Lcom/p1/mobile/android/media/AudioPlayer$State;

.field public m:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/ner;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/j3z;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    sget-wide v0, Ll/g500;->n:J

    .line 5
    .line 6
    iput-wide v0, p0, Ll/g500;->b:J

    .line 7
    .line 8
    new-instance p1, Ll/g500$a;

    .line 9
    .line 10
    invoke-direct {p1, p0}, Ll/g500$a;-><init>(Ll/g500;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/g500;->e:Ll/gcg0;

    .line 14
    .line 15
    new-instance p1, Ll/a500;

    .line 16
    .line 17
    invoke-direct {p1, p0}, Ll/a500;-><init>(Ll/g500;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/g500;->f:Ljava/lang/Runnable;

    .line 21
    .line 22
    sget-object p1, Lcom/p1/mobile/android/media/AudioPlayer$State;->stopped:Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 23
    .line 24
    iput-object p1, p0, Ll/g500;->l:Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 25
    .line 26
    const/4 p1, 0x0

    .line 27
    iput-boolean p1, p0, Ll/g500;->m:Z

    .line 28
    .line 29
    return-void
.end method

.method public static bridge synthetic A0(Ll/g500;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/g500;->m:Z

    return-void
.end method

.method public static bridge synthetic C0(Ll/g500;J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/g500;->b:J

    return-void
.end method

.method public static bridge synthetic D0(Ll/g500;Lcom/p1/mobile/android/media/AudioPlayer$State;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g500;->l:Lcom/p1/mobile/android/media/AudioPlayer$State;

    return-void
.end method

.method public static bridge synthetic E0(Ll/g500;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g500;->G0()V

    return-void
.end method

.method public static bridge synthetic F0()J
    .locals 2

    .line 1
    sget-wide v0, Ll/g500;->n:J

    return-wide v0
.end method

.method private L0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/u400;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/u400;-><init>(Ll/g500;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic h0(Ll/g500;Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g500;->a1(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i0(Ll/g500;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g500;->Q0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic j0(Ll/g500;II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/g500;->U0(II)V

    return-void
.end method

.method public static synthetic k0(Ll/g500;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g500;->P0()V

    return-void
.end method

.method public static synthetic l0(Ll/g500;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g500;->X0()V

    return-void
.end method

.method public static synthetic m0(Ll/g500;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g500;->S0()V

    return-void
.end method

.method public static synthetic n0(Ll/g500;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g500;->V0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic o0(Ll/g500;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g500;->W0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic p0(Ll/g500;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g500;->R0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic q0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic r0(Ll/g500;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/g500;->Y0(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static bridge synthetic s0(Ll/g500;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/g500;->d:Z

    return p0
.end method

.method public static bridge synthetic t0(Ll/g500;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/g500;->m:Z

    return p0
.end method

.method public static bridge synthetic u0(Ll/g500;)Lcom/p1/mobile/android/media/AudioPlayer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g500;->c:Lcom/p1/mobile/android/media/AudioPlayer;

    return-object p0
.end method

.method public static bridge synthetic x0(Ll/g500;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/g500;->b:J

    return-wide v0
.end method

.method public static bridge synthetic y0(Ll/g500;)Lcom/p1/mobile/android/media/AudioPlayer$State;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g500;->l:Lcom/p1/mobile/android/media/AudioPlayer$State;

    return-object p0
.end method

.method public static bridge synthetic z0(Ll/g500;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/g500;->d:Z

    return-void
.end method


# virtual methods
.method public final G0()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/g500;->k:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "audio"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Landroid/media/AudioManager;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    .line 26
    .line 27
    .line 28
    :cond_1
    const/4 v0, 0x0

    .line 29
    iput-boolean v0, p0, Ll/g500;->k:Z

    .line 30
    .line 31
    return-void
.end method

.method public H0()Lcom/p1/mobile/android/media/AudioPlayer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g500;->c:Lcom/p1/mobile/android/media/AudioPlayer;

    .line 2
    .line 3
    return-object p0
.end method

.method public I0()Lcom/p1/mobile/android/media/AudioPlayer$State;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g500;->l:Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 2
    .line 3
    return-object p0
.end method

.method public J0()Ll/tnw;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g500;->g:Ll/tnw;

    .line 2
    .line 3
    return-object p0
.end method

.method public N0(J)Z
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/g500;->b:J

    .line 2
    .line 3
    cmp-long p0, v0, p1

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public O0()Z
    .locals 2

    .line 1
    sget-wide v0, Ll/g500;->n:J

    .line 2
    .line 3
    invoke-virtual {p0, v0, v1}, Ll/g500;->N0(J)Z

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

.method public final synthetic P0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g500;->h:Landroid/media/SoundPool;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/media/SoundPool;->release()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic Q0(Lcom/p1/mobile/android/app/c;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p0, p0, Ll/g500;->f:Ljava/lang/Runnable;

    .line 10
    .line 11
    const-wide/16 v0, 0x1f4

    .line 12
    .line 13
    invoke-virtual {p1, p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 18
    .line 19
    if-ne p1, v0, :cond_3

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget-object v0, p0, Ll/g500;->f:Ljava/lang/Runnable;

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/g500;->h:Landroid/media/SoundPool;

    .line 31
    .line 32
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    new-instance p1, Ll/b500;

    .line 39
    .line 40
    invoke-direct {p1, p0}, Ll/b500;-><init>(Ll/g500;)V

    .line 41
    .line 42
    .line 43
    invoke-static {p1}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 44
    .line 45
    .line 46
    :cond_1
    iget-object p1, p0, Ll/g500;->g:Ll/tnw;

    .line 47
    .line 48
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_2

    .line 53
    .line 54
    iget-object p1, p0, Ll/g500;->g:Ll/tnw;

    .line 55
    .line 56
    invoke-virtual {p1}, Ll/tnw;->j()V

    .line 57
    .line 58
    .line 59
    :cond_2
    invoke-static {}, Lcom/tantanapp/media/proxy/api/a;->p()Lcom/tantanapp/media/proxy/api/a;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p1}, Lcom/tantanapp/media/proxy/api/a;->l()V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Ll/g500;->c:Lcom/p1/mobile/android/media/AudioPlayer;

    .line 67
    .line 68
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-eqz p1, :cond_4

    .line 73
    .line 74
    iget-object p0, p0, Ll/g500;->c:Lcom/p1/mobile/android/media/AudioPlayer;

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->destroy()V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_3
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 81
    .line 82
    if-ne p1, v0, :cond_4

    .line 83
    .line 84
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p0}, Ll/clz;->a3()V

    .line 93
    .line 94
    .line 95
    :cond_4
    return-void
.end method

.method public final synthetic R0(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Zo()Ll/nam;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-interface {p1, v0}, Ll/nam;->f(Z)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast p1, Ll/i500;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/i500;->q()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-nez p1, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-interface {p1}, Ll/mzl;->u0()Ll/g500;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Ll/j3z;->g0()Ll/iam;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    check-cast p1, Ll/i500;

    .line 36
    .line 37
    invoke-virtual {p1}, Ll/i500;->p()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iget-object p1, p1, Lcom/p1/mobile/android/app/Act;->res:Landroid/content/res/Resources;

    .line 45
    .line 46
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_0

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-interface {p1}, Ll/mzl;->l()Ll/clz;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p0}, Ll/g500;->b1()Ll/tnw;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Ll/tnw;->m()Ljava/io/File;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p0}, Ll/g500;->b1()Ll/tnw;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0}, Ll/tnw;->s()J

    .line 73
    .line 74
    .line 75
    move-result-wide v1

    .line 76
    long-to-float p0, v1

    .line 77
    const/high16 v1, 0x3f800000    # 1.0f

    .line 78
    .line 79
    mul-float/2addr p0, v1

    .line 80
    const/high16 v1, 0x447a0000    # 1000.0f

    .line 81
    .line 82
    div-float/2addr p0, v1

    .line 83
    const-string v1, "audio/mp3"

    .line 84
    .line 85
    invoke-virtual {p1, v0, v1, p0}, Ll/clz;->M6(Ljava/io/File;Ljava/lang/String;F)V

    .line 86
    .line 87
    .line 88
    :cond_0
    return-void

    .line 89
    :cond_1
    invoke-virtual {p0}, Ll/g500;->h1()V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public final synthetic S0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/mzl;->u0()Ll/g500;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/i500;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/i500;->u()V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Zo()Ll/nam;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/4 v0, 0x1

    .line 27
    invoke-interface {p0, v0}, Ll/nam;->f(Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic U0(II)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/i500;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/i500;->n()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-ne p2, p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/g500;->d1()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic V0(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g500;->c:Lcom/p1/mobile/android/media/AudioPlayer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->stop()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic W0(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g500;->c:Lcom/p1/mobile/android/media/AudioPlayer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->stopIfNotInProximityMode()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic X0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->d6:I

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic Y0(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ll/clz;->e7(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/clz;->pageId()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const/4 p1, 0x0

    .line 36
    new-array p1, p1, [Ll/sfj0$a;

    .line 37
    .line 38
    const-string v0, "e_chat_message_convert_to_text_initial_button"

    .line 39
    .line 40
    invoke-static {v0, p0, p1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    invoke-static {p2, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public a0()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/g500;->L0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic a1(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Ll/clz;->f7(Lcom/p1/mobile/putong/core/data/Message;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public b1()Ll/tnw;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/g500;->g:Ll/tnw;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/tnw;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/tnw;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/g500;->g:Ll/tnw;

    .line 11
    .line 12
    invoke-static {}, Ll/kl40;->e()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {v0, v1}, Ll/tnw;->y(Z)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Landroid/media/AudioAttributes$Builder;

    .line 20
    .line 21
    invoke-direct {v0}, Landroid/media/AudioAttributes$Builder;-><init>()V

    .line 22
    .line 23
    .line 24
    const/4 v1, 0x3

    .line 25
    invoke-virtual {v0, v1}, Landroid/media/AudioAttributes$Builder;->setLegacyStreamType(I)Landroid/media/AudioAttributes$Builder;

    .line 26
    .line 27
    .line 28
    new-instance v2, Landroid/media/SoundPool$Builder;

    .line 29
    .line 30
    invoke-direct {v2}, Landroid/media/SoundPool$Builder;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2, v1}, Landroid/media/SoundPool$Builder;->setMaxStreams(I)Landroid/media/SoundPool$Builder;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v1, v0}, Landroid/media/SoundPool$Builder;->setAudioAttributes(Landroid/media/AudioAttributes;)Landroid/media/SoundPool$Builder;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Landroid/media/SoundPool$Builder;->build()Landroid/media/SoundPool;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-object v0, p0, Ll/g500;->h:Landroid/media/SoundPool;

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    sget v2, Ll/tfc0;->c:I

    .line 56
    .line 57
    const/4 v3, 0x1

    .line 58
    invoke-virtual {v0, v1, v2, v3}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iput v0, p0, Ll/g500;->i:I

    .line 63
    .line 64
    iget-object v0, p0, Ll/g500;->h:Landroid/media/SoundPool;

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    sget v2, Ll/tfc0;->b:I

    .line 71
    .line 72
    invoke-virtual {v0, v1, v2, v3}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    iput v0, p0, Ll/g500;->j:I

    .line 77
    .line 78
    iget-object v0, p0, Ll/g500;->g:Ll/tnw;

    .line 79
    .line 80
    new-instance v1, Ll/x400;

    .line 81
    .line 82
    invoke-direct {v1, p0}, Ll/x400;-><init>(Ll/g500;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ll/tnw;->B(Ll/tnw$e;)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ll/g500;->g:Ll/tnw;

    .line 89
    .line 90
    new-instance v1, Ll/y400;

    .line 91
    .line 92
    invoke-direct {v1, p0}, Ll/y400;-><init>(Ll/g500;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ll/tnw;->A(Ll/tnw$d;)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Ll/g500;->g:Ll/tnw;

    .line 99
    .line 100
    new-instance v1, Ll/z400;

    .line 101
    .line 102
    invoke-direct {v1, p0}, Ll/z400;-><init>(Ll/g500;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ll/tnw;->z(Ll/tnw$c;)V

    .line 106
    .line 107
    .line 108
    :cond_0
    iget-object p0, p0, Ll/g500;->g:Ll/tnw;

    .line 109
    .line 110
    return-object p0
.end method

.method public c1(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/g500;->c:Lcom/p1/mobile/android/media/AudioPlayer;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/android/media/AudioPlayer;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Lcom/p1/mobile/android/media/AudioPlayer;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/g500;->c:Lcom/p1/mobile/android/media/AudioPlayer;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/android/media/AudioPlayer;->obs()Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Ll/g500;->e:Ll/gcg0;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    sget-object v0, Lv/VTexturePlayer;->x:Lrx/subjects/b;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/c500;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/c500;-><init>(Ll/g500;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ll/d500;

    .line 48
    .line 49
    invoke-direct {v1}, Ll/d500;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/e500;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/e500;-><init>(Ll/g500;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    :cond_0
    iget-object v0, p0, Ll/g500;->l:Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 69
    .line 70
    sget-object v1, Lcom/p1/mobile/android/media/AudioPlayer$State;->stopped:Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 71
    .line 72
    if-eq v0, v1, :cond_1

    .line 73
    .line 74
    iget-object v0, p0, Ll/g500;->c:Lcom/p1/mobile/android/media/AudioPlayer;

    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/p1/mobile/android/media/AudioPlayer;->stop()V

    .line 77
    .line 78
    .line 79
    :cond_1
    iget-wide v0, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 80
    .line 81
    iput-wide v0, p0, Ll/g500;->b:J

    .line 82
    .line 83
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    const/4 v1, 0x0

    .line 98
    const/4 v2, 0x1

    .line 99
    if-nez v0, :cond_2

    .line 100
    .line 101
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->audio()Lcom/p1/mobile/putong/data/Audio;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/Audio;->audioRead:Z

    .line 106
    .line 107
    if-nez v0, :cond_2

    .line 108
    .line 109
    move v0, v2

    .line 110
    goto :goto_0

    .line 111
    :cond_2
    move v0, v1

    .line 112
    :goto_0
    iput-boolean v0, p0, Ll/g500;->m:Z

    .line 113
    .line 114
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->audio()Lcom/p1/mobile/putong/data/Audio;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/Audio;->audioRead:Z

    .line 119
    .line 120
    if-nez v0, :cond_3

    .line 121
    .line 122
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isOtherUser()Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-eqz v0, :cond_3

    .line 127
    .line 128
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 129
    .line 130
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 131
    .line 132
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/api/g;->An(Ljava/lang/String;)Lrx/c;

    .line 135
    .line 136
    .line 137
    :cond_3
    iget-object v0, p0, Ll/g500;->c:Lcom/p1/mobile/android/media/AudioPlayer;

    .line 138
    .line 139
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    invoke-interface {v3}, Ll/mzl;->l()Ll/clz;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    invoke-virtual {v3}, Ll/clz;->f6()Z

    .line 148
    .line 149
    .line 150
    move-result v3

    .line 151
    if-eqz v3, :cond_4

    .line 152
    .line 153
    iget-boolean v3, p0, Ll/g500;->m:Z

    .line 154
    .line 155
    if-eqz v3, :cond_4

    .line 156
    .line 157
    move v1, v2

    .line 158
    :cond_4
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/media/AudioPlayer;->setNeedToPlayNext(Z)V

    .line 159
    .line 160
    .line 161
    iget-object v0, p0, Ll/g500;->c:Lcom/p1/mobile/android/media/AudioPlayer;

    .line 162
    .line 163
    new-instance v1, Ll/f500;

    .line 164
    .line 165
    invoke-direct {v1, p0}, Ll/f500;-><init>(Ll/g500;)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/media/AudioPlayer;->setError(Ljava/lang/Runnable;)V

    .line 169
    .line 170
    .line 171
    iget-object v0, p0, Ll/g500;->c:Lcom/p1/mobile/android/media/AudioPlayer;

    .line 172
    .line 173
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->audio()Lcom/p1/mobile/putong/data/Audio;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Audio;->format32()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    invoke-static {v1}, Ll/uqb0;->d0(Ljava/lang/String;)Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/media/AudioPlayer;->play(Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {p0}, Ll/g500;->e1()V

    .line 189
    .line 190
    .line 191
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    invoke-interface {v0}, Ll/r97;->g1()Z

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    if-eqz v0, :cond_5

    .line 204
    .line 205
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    invoke-virtual {v0, p1}, Ll/clz;->m4(Lcom/p1/mobile/putong/core/data/Message;)Z

    .line 214
    .line 215
    .line 216
    move-result p1

    .line 217
    if-eqz p1, :cond_5

    .line 218
    .line 219
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 220
    .line 221
    .line 222
    move-result-object p0

    .line 223
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 224
    .line 225
    .line 226
    move-result-object p0

    .line 227
    invoke-virtual {p0}, Ll/clz;->J6()V

    .line 228
    .line 229
    .line 230
    :cond_5
    return-void
.end method

.method public d1()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/g500;->b1()Ll/tnw;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/tnw;->j()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Ll/i500;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/i500;->p()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ll/clz;->a3()V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Zo()Ll/nam;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const/4 v0, 0x0

    .line 35
    invoke-interface {p0, v0}, Ll/nam;->f(Z)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final e1()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "audio"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/media/AudioManager;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    const/4 v1, 0x3

    .line 20
    const/4 v2, 0x2

    .line 21
    const/4 v3, 0x0

    .line 22
    invoke-virtual {v0, v3, v1, v2}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const/4 v1, 0x1

    .line 27
    if-ne v0, v1, :cond_0

    .line 28
    .line 29
    iput-boolean v1, p0, Ll/g500;->k:Z

    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public f1()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/g500;->J0()Ll/tnw;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ll/tnw;->m()Ljava/io/File;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p0}, Ll/g500;->J0()Ll/tnw;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ll/tnw;->s()J

    .line 22
    .line 23
    .line 24
    move-result-wide v2

    .line 25
    long-to-float p0, v2

    .line 26
    const/high16 v2, 0x3f800000    # 1.0f

    .line 27
    .line 28
    mul-float/2addr p0, v2

    .line 29
    const/high16 v2, 0x447a0000    # 1000.0f

    .line 30
    .line 31
    div-float/2addr p0, v2

    .line 32
    const-string v2, "audio/mp3"

    .line 33
    .line 34
    invoke-virtual {v0, v1, v2, p0}, Ll/clz;->M6(Ljava/io/File;Ljava/lang/String;F)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public g1(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/mzl;->l()Ll/clz;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/qzz;->j0()Ll/g900;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    new-instance v2, Ll/v400;

    .line 22
    .line 23
    invoke-direct {v2, p0, p1}, Ll/v400;-><init>(Ll/g500;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v2}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-static {}, Ll/psd0;->Q()Lrx/c$d;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-virtual {v2, v3}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v0, v1, v2}, Ll/l900;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Ll/w400;

    .line 51
    .line 52
    invoke-direct {v1, p0, p1, p2}, Ll/w400;-><init>(Ll/g500;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public h1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/g500;->b1()Ll/tnw;

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 5
    .line 6
    const-string v0, "vibrator"

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Landroid/os/Vibrator;

    .line 13
    .line 14
    const-wide/16 v0, 0x64

    .line 15
    .line 16
    invoke-virtual {p0, v0, v1}, Landroid/os/Vibrator;->vibrate(J)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public i1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g500;->c:Lcom/p1/mobile/android/media/AudioPlayer;

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
    iget-object v0, p0, Ll/g500;->l:Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/android/media/AudioPlayer$State;->playing:Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 12
    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/g500;->c:Lcom/p1/mobile/android/media/AudioPlayer;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/android/media/AudioPlayer;->stop()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
