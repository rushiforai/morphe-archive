.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;
.super Lcom/p1/mobile/putong/feed/newui/camera/ReloadSoAct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;
    }
.end annotation


# instance fields
.field public A:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

.field public B:Ll/vel0;

.field public C:Ljava/lang/String;

.field public D:Ljava/lang/String;

.field public E:Ljava/io/File;

.field public F:Z

.field public c:Lv/VLinear;

.field public d:Lv/navigationbar/VNavigationBar;

.field public e:Landroid/widget/FrameLayout;

.field public f:Lv/VText;

.field public g:Lv/VRecyclerView;

.field public h:Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;

.field public i:Lcom/p1/mobile/putong/data/Video;

.field public j:Ll/re80;

.field public k:Lcom/p1/mobile/putong/feed/ui/PlayerView;

.field public l:J

.field public final m:I

.field public final n:I

.field public final o:I

.field public p:I

.field public q:I

.field public r:I

.field public s:I

.field public t:I

.field public u:F

.field public v:I

.field public w:I

.field public x:I

.field public y:Lv/VImage;

.field public z:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/ReloadSoAct;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->l:J

    .line 7
    .line 8
    const/high16 v0, 0x42600000    # 56.0f

    .line 9
    .line 10
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->m:I

    .line 15
    .line 16
    const/high16 v0, 0x41a00000    # 20.0f

    .line 17
    .line 18
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->n:I

    .line 23
    .line 24
    const/high16 v0, 0x40800000    # 4.0f

    .line 25
    .line 26
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->o:I

    .line 31
    .line 32
    const-string v0, "#EEEFF1"

    .line 33
    .line 34
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->p:I

    .line 39
    .line 40
    const-string v0, "#F6F7F8"

    .line 41
    .line 42
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->q:I

    .line 47
    .line 48
    const/4 v0, 0x0

    .line 49
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->u:F

    .line 50
    .line 51
    const/high16 v0, 0x42000000    # 32.0f

    .line 52
    .line 53
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->v:I

    .line 58
    .line 59
    const/4 v0, 0x0

    .line 60
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->x:I

    .line 61
    .line 62
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->F:Z

    .line 63
    .line 64
    return-void
.end method

.method public static bridge synthetic A2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->t:I

    return p0
.end method

.method public static bridge synthetic B2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)Lcom/p1/mobile/putong/data/Video;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->i:Lcom/p1/mobile/putong/data/Video;

    return-object p0
.end method

.method public static bridge synthetic C2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)Ll/re80;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->j:Ll/re80;

    return-object p0
.end method

.method public static bridge synthetic D2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->A:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    return-object p0
.end method

.method public static bridge synthetic E2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;Lv/VImage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->y:Lv/VImage;

    return-void
.end method

.method public static bridge synthetic F2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->F:Z

    return-void
.end method

.method public static bridge synthetic H2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;I)J
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->N2(I)J

    move-result-wide p0

    return-wide p0
.end method

.method public static bridge synthetic I2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->i3()V

    return-void
.end method

.method public static L2(Landroid/content/Context;Lcom/p1/mobile/putong/data/Media;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "media"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->b3(Landroid/view/View;)V

    return-void
.end method

.method private synthetic X2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;Landroid/media/MediaPlayer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->e3(Landroid/media/MediaPlayer;)V

    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;Ll/gcg0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->V2(Ll/gcg0;)V

    return-void
.end method

.method private synthetic Z2(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->Q2()V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/jka;->Pb()Ll/jfh;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {p1, p0, v0}, Ll/jfh;->h(Landroid/content/Context;Landroidx/appcompat/widget/Toolbar;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->h:Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    new-instance p1, Ll/vo20;

    .line 24
    .line 25
    invoke-direct {p1, p0}, Ll/vo20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p1}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    new-instance v0, Ll/wo20;

    .line 41
    .line 42
    invoke-direct {v0, p0}, Ll/wo20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)V

    .line 43
    .line 44
    .line 45
    new-instance v1, Ll/xo20;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/xo20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->g3(Ljava/lang/Integer;)V

    return-void
.end method

.method private synthetic a3()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->j:Ll/re80;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->j:Ll/re80;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/re80;->release()V

    .line 12
    .line 13
    .line 14
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$a;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$a;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->X2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;Lcom/p1/mobile/putong/feed/ui/PlayerView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->f3(Lcom/p1/mobile/putong/feed/ui/PlayerView;)V

    return-void
.end method

.method private synthetic c3(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_1

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->k:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 6
    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->F:Z

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->i3()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->k:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->N()V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->h:Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;

    .line 27
    .line 28
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->w:I

    .line 29
    .line 30
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->h(I)V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public static synthetic d2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->T2(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic e2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->d3()V

    return-void
.end method

.method public static synthetic g2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->U2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic h2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->Z2(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic i2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->c3(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic k2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->W2(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic l2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->a3()V

    return-void
.end method

.method public static synthetic m2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->S2()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic n2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->o:I

    return p0
.end method

.method public static bridge synthetic o2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->p:I

    return p0
.end method

.method public static bridge synthetic p2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->q:I

    return p0
.end method

.method public static bridge synthetic q2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)Ljava/io/File;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->E:Ljava/io/File;

    return-object p0
.end method

.method private r()V
    .locals 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->h:Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->i:Lcom/p1/mobile/putong/data/Video;

    .line 8
    .line 9
    iget v1, v0, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 10
    .line 11
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->u:F

    .line 12
    .line 13
    new-instance v1, Lcom/p1/mobile/putong/data/Dimension;

    .line 14
    .line 15
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/Dimension;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->f:Lv/VText;

    .line 21
    .line 22
    iget-wide v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->l:J

    .line 23
    .line 24
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->j3(J)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->B:Ll/vel0;

    .line 32
    .line 33
    iget v1, v0, Ll/vel0;->f:I

    .line 34
    .line 35
    const/16 v2, 0x5a

    .line 36
    .line 37
    if-eq v1, v2, :cond_1

    .line 38
    .line 39
    const/16 v2, 0x10e

    .line 40
    .line 41
    if-ne v1, v2, :cond_0

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->i:Lcom/p1/mobile/putong/data/Video;

    .line 45
    .line 46
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 47
    .line 48
    iget v2, v0, Ll/vel0;->c:I

    .line 49
    .line 50
    iput v2, v1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 51
    .line 52
    iget v0, v0, Ll/vel0;->d:I

    .line 53
    .line 54
    iput v0, v1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->i:Lcom/p1/mobile/putong/data/Video;

    .line 58
    .line 59
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 60
    .line 61
    iget v2, v0, Ll/vel0;->d:I

    .line 62
    .line 63
    iput v2, v1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 64
    .line 65
    iget v0, v0, Ll/vel0;->c:I

    .line 66
    .line 67
    iput v0, v1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 68
    .line 69
    :goto_1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->n:I

    .line 74
    .line 75
    mul-int/lit8 v1, v1, 0x2

    .line 76
    .line 77
    sub-int/2addr v0, v1

    .line 78
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->r:I

    .line 79
    .line 80
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->t:I

    .line 81
    .line 82
    int-to-float v0, v0

    .line 83
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->v:I

    .line 84
    .line 85
    int-to-float v1, v1

    .line 86
    div-float/2addr v0, v1

    .line 87
    float-to-double v0, v0

    .line 88
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    .line 89
    .line 90
    .line 91
    move-result-wide v0

    .line 92
    double-to-int v0, v0

    .line 93
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->s:I

    .line 94
    .line 95
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->t:I

    .line 96
    .line 97
    invoke-static {}, Ll/bnl0;->y0()I

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    if-le v0, v1, :cond_2

    .line 102
    .line 103
    invoke-static {}, Ll/bnl0;->y0()I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    goto :goto_2

    .line 108
    :cond_2
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->t:I

    .line 109
    .line 110
    :goto_2
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->t:I

    .line 111
    .line 112
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->n:I

    .line 113
    .line 114
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->w:I

    .line 115
    .line 116
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->x:I

    .line 117
    .line 118
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->h:Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;

    .line 119
    .line 120
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->r:I

    .line 121
    .line 122
    new-instance v4, Ll/yo20;

    .line 123
    .line 124
    invoke-direct {v4, p0}, Ll/yo20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v2, v1, v0, v3, v4}, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->f(IIILl/y20;)V

    .line 128
    .line 129
    .line 130
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;

    .line 131
    .line 132
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)V

    .line 133
    .line 134
    .line 135
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->z:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;

    .line 136
    .line 137
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 138
    .line 139
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 140
    .line 141
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 142
    .line 143
    .line 144
    const/4 v1, 0x0

    .line 145
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 146
    .line 147
    .line 148
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->e:Landroid/widget/FrameLayout;

    .line 149
    .line 150
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->R2(Landroid/view/ViewGroup;)Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->k:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 155
    .line 156
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->g:Lv/VRecyclerView;

    .line 157
    .line 158
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 159
    .line 160
    .line 161
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->g:Lv/VRecyclerView;

    .line 162
    .line 163
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->z:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$d;

    .line 164
    .line 165
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 166
    .line 167
    .line 168
    return-void
.end method

.method public static bridge synthetic r2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->s:I

    return p0
.end method

.method public static bridge synthetic s2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->m:I

    return p0
.end method

.method public static bridge synthetic u2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)Lv/VImage;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->y:Lv/VImage;

    return-object p0
.end method

.method public static bridge synthetic v2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->x:I

    return p0
.end method

.method public static bridge synthetic w2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)Ll/vel0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->B:Ll/vel0;

    return-object p0
.end method

.method public static bridge synthetic y2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->F:Z

    return p0
.end method

.method public static bridge synthetic z2(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->v:I

    return p0
.end method


# virtual methods
.method public K2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/dp20;->b(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final M2()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->U2:I

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;)Landroid/app/Dialog;

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/ap20;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/ap20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/bp20;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/bp20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)V

    .line 38
    .line 39
    .line 40
    new-instance v2, Ll/po20;

    .line 41
    .line 42
    invoke-direct {v2, p0}, Ll/po20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final N2(I)J
    .locals 2

    .line 1
    int-to-float p1, p1

    .line 2
    const/high16 v0, 0x3f800000    # 1.0f

    .line 3
    .line 4
    sub-float/2addr p1, v0

    .line 5
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->s:I

    .line 6
    .line 7
    int-to-float v0, v0

    .line 8
    div-float/2addr p1, v0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->B:Ll/vel0;

    .line 10
    .line 11
    iget-wide v0, p0, Ll/vel0;->b:J

    .line 12
    .line 13
    long-to-float p0, v0

    .line 14
    mul-float/2addr p1, p0

    .line 15
    float-to-long p0, p1

    .line 16
    const-wide/16 v0, 0x3e8

    .line 17
    .line 18
    mul-long/2addr p0, v0

    .line 19
    return-wide p0
.end method

.method public final Q2()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->d:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->E1:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->d:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 13
    .line 14
    .line 15
    new-instance v0, Landroid/widget/TextView;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 20
    .line 21
    .line 22
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->i:I

    .line 23
    .line 24
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/app/PutongAct;->actionItemPadding(Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    sget v2, Ll/k9c0;->n:I

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 46
    .line 47
    .line 48
    const/high16 v1, 0x41900000    # 18.0f

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->d:Lv/navigationbar/VNavigationBar;

    .line 54
    .line 55
    const/4 v2, 0x1

    .line 56
    new-array v2, v2, [Landroid/view/View;

    .line 57
    .line 58
    const/4 v3, 0x0

    .line 59
    aput-object v0, v2, v3

    .line 60
    .line 61
    invoke-virtual {v1, v2}, Lv/navigationbar/VNavigationBar;->z([Landroid/view/View;)V

    .line 62
    .line 63
    .line 64
    new-instance v1, Ll/zo20;

    .line 65
    .line 66
    invoke-direct {v1, p0}, Ll/zo20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final R2(Landroid/view/ViewGroup;)Lcom/p1/mobile/putong/feed/ui/PlayerView;
    .locals 4

    .line 1
    new-instance v0, Ll/re80;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/re80;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->j:Ll/re80;

    .line 7
    .line 8
    new-instance v1, Ll/qo20;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/qo20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/re80;->u(Ll/x20;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->j:Ll/re80;

    .line 17
    .line 18
    new-instance v1, Ll/ro20;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/ro20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/re80;->v(Landroid/media/MediaPlayer$OnSeekCompleteListener;)V

    .line 24
    .line 25
    .line 26
    new-instance v0, Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/feed/ui/PlayerView;-><init>(Landroid/content/Context;)V

    .line 31
    .line 32
    .line 33
    const/4 v1, 0x0

    .line 34
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->setProgressBarsEnabled(Z)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    sget v3, Ll/k9c0;->p0:I

    .line 42
    .line 43
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 48
    .line 49
    .line 50
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->j:Ll/re80;

    .line 51
    .line 52
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->setPlayer(Ll/ie80;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->i:Lcom/p1/mobile/putong/data/Video;

    .line 59
    .line 60
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->setVideo(Lcom/p1/mobile/putong/data/Video;)V

    .line 61
    .line 62
    .line 63
    iget-object p1, v0, Lcom/p1/mobile/putong/feed/ui/PlayerView;->h:Lv/VFrame_ColorFilter;

    .line 64
    .line 65
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 66
    .line 67
    .line 68
    iget-object p1, v0, Lcom/p1/mobile/putong/feed/ui/PlayerView;->b:Lv/AutoVDraweeView;

    .line 69
    .line 70
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 71
    .line 72
    .line 73
    iget-object p1, v0, Lcom/p1/mobile/putong/feed/ui/PlayerView;->b:Lv/AutoVDraweeView;

    .line 74
    .line 75
    const/4 v2, 0x0

    .line 76
    invoke-virtual {p1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 77
    .line 78
    .line 79
    iget-object p1, v0, Lcom/p1/mobile/putong/feed/ui/PlayerView;->h:Lv/VFrame_ColorFilter;

    .line 80
    .line 81
    invoke-virtual {p1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 82
    .line 83
    .line 84
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$b;

    .line 85
    .line 86
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$b;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->x(Ll/ie80$b;)V

    .line 90
    .line 91
    .line 92
    new-instance p1, Ll/so20;

    .line 93
    .line 94
    invoke-direct {p1, p0, v0}, Ll/so20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;Lcom/p1/mobile/putong/feed/ui/PlayerView;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 98
    .line 99
    .line 100
    invoke-static {v0, v1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 101
    .line 102
    .line 103
    iget-object p0, v0, Lcom/p1/mobile/putong/feed/ui/PlayerView;->h:Lv/VFrame_ColorFilter;

    .line 104
    .line 105
    invoke-static {p0, v1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 106
    .line 107
    .line 108
    return-object v0
.end method

.method public final synthetic S2()Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->C:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 9
    .line 10
    const/16 v2, 0x1e

    .line 11
    .line 12
    const-string v3, ".jpg"

    .line 13
    .line 14
    if-lt v1, v2, :cond_0

    .line 15
    .line 16
    new-instance v0, Ljava/io/File;

    .line 17
    .line 18
    invoke-static {}, Ll/uqb0;->t0()Ljava/io/File;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    new-instance v2, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 28
    .line 29
    .line 30
    move-result-wide v4

    .line 31
    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    goto :goto_0

    .line 49
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 71
    .line 72
    .line 73
    move-result-wide v4

    .line 74
    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->k:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 85
    .line 86
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView;->a:Landroid/view/TextureView;

    .line 87
    .line 88
    invoke-virtual {p0}, Landroid/view/TextureView;->getBitmap()Landroid/graphics/Bitmap;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    const/4 v1, 0x0

    .line 93
    :try_start_0
    new-instance v2, Ljava/io/FileOutputStream;

    .line 94
    .line 95
    new-instance v3, Ljava/io/File;

    .line 96
    .line 97
    invoke-direct {v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    invoke-direct {v2, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 101
    .line 102
    .line 103
    :try_start_1
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    .line 104
    .line 105
    const/16 v3, 0x5f

    .line 106
    .line 107
    invoke-virtual {p0, v1, v3, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 108
    .line 109
    .line 110
    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-virtual {v1}, Ljava/io/FileDescriptor;->sync()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 118
    .line 119
    .line 120
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    if-eqz v1, :cond_1

    .line 125
    .line 126
    :goto_1
    :try_start_2
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 127
    .line 128
    .line 129
    goto :goto_2

    .line 130
    :catch_0
    move-exception v1

    .line 131
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 132
    .line 133
    .line 134
    :cond_1
    :goto_2
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    .line 135
    .line 136
    .line 137
    goto :goto_5

    .line 138
    :catchall_0
    move-exception v0

    .line 139
    move-object v1, v2

    .line 140
    goto :goto_6

    .line 141
    :catch_1
    move-exception v1

    .line 142
    goto :goto_3

    .line 143
    :catch_2
    move-exception v1

    .line 144
    goto :goto_4

    .line 145
    :catchall_1
    move-exception v0

    .line 146
    goto :goto_6

    .line 147
    :catch_3
    move-exception v2

    .line 148
    move-object v6, v2

    .line 149
    move-object v2, v1

    .line 150
    move-object v1, v6

    .line 151
    goto :goto_3

    .line 152
    :catch_4
    move-exception v2

    .line 153
    move-object v6, v2

    .line 154
    move-object v2, v1

    .line 155
    move-object v1, v6

    .line 156
    goto :goto_4

    .line 157
    :goto_3
    :try_start_3
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 158
    .line 159
    .line 160
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    if-eqz v1, :cond_1

    .line 165
    .line 166
    goto :goto_1

    .line 167
    :goto_4
    :try_start_4
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 168
    .line 169
    .line 170
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    move-result v1

    .line 174
    if-eqz v1, :cond_1

    .line 175
    .line 176
    goto :goto_1

    .line 177
    :goto_5
    return-object v0

    .line 178
    :goto_6
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    move-result v2

    .line 182
    if-eqz v2, :cond_2

    .line 183
    .line 184
    :try_start_5
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_5

    .line 185
    .line 186
    .line 187
    goto :goto_7

    .line 188
    :catch_5
    move-exception v1

    .line 189
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 190
    .line 191
    .line 192
    :cond_2
    :goto_7
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    .line 193
    .line 194
    .line 195
    throw v0
.end method

.method public final synthetic T2(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Landroid/content/Intent;

    .line 7
    .line 8
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v1, "framePath"

    .line 12
    .line 13
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    const/4 p1, -0x1

    .line 17
    invoke-virtual {p0, p1, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic U2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic V2(Ll/gcg0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->i:Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 4
    .line 5
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->C:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 8
    .line 9
    new-instance v0, Ll/vel0;

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ll/vel0;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->B:Ll/vel0;

    .line 15
    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->i:Lcom/p1/mobile/putong/data/Video;

    .line 22
    .line 23
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->i:Lcom/p1/mobile/putong/data/Video;

    .line 29
    .line 30
    iget v2, v2, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {v0}, Ll/niw;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->D:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v0}, Ll/ecj;->L(Ljava/lang/String;)Ljava/io/File;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->E:Ljava/io/File;

    .line 50
    .line 51
    new-instance v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 52
    .line 53
    invoke-direct {v0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->A:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->init(Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 62
    .line 63
    invoke-interface {p1, p0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final synthetic W2(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->r()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic b3(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->F:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->M2()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic d3()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->i3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic e3(Landroid/media/MediaPlayer;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getDuration()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    int-to-float p1, p1

    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->u:F

    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->k:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/ui/PlayerView;->b:Lv/AutoVDraweeView;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setAlpha(I)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->k:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView;->h:Lv/VFrame_ColorFilter;

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic f3(Lcom/p1/mobile/putong/feed/ui/PlayerView;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 6
    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->N()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final synthetic g3(Ljava/lang/Integer;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    int-to-float p1, p1

    .line 6
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->t:I

    .line 7
    .line 8
    int-to-float v0, v0

    .line 9
    div-float/2addr p1, v0

    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->B:Ll/vel0;

    .line 11
    .line 12
    iget-wide v0, v0, Ll/vel0;->b:J

    .line 13
    .line 14
    long-to-float v0, v0

    .line 15
    mul-float/2addr p1, v0

    .line 16
    float-to-long v0, p1

    .line 17
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->l:J

    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->f:Lv/VText;

    .line 20
    .line 21
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->j3(J)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    iget-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->l:J

    .line 29
    .line 30
    long-to-float p1, v0

    .line 31
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->u:F

    .line 32
    .line 33
    cmpl-float p1, p1, v2

    .line 34
    .line 35
    if-ltz p1, :cond_0

    .line 36
    .line 37
    const/high16 p1, 0x3f800000    # 1.0f

    .line 38
    .line 39
    sub-float/2addr v2, p1

    .line 40
    float-to-long v0, v2

    .line 41
    :cond_0
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->l:J

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->i3()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public h3(Ljava/lang/Integer;Lv/VDraweeView;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$c;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct$c;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;Lv/VDraweeView;Ljava/lang/Integer;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final i3()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->j:Ll/re80;

    .line 2
    .line 3
    iget-wide v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->l:J

    .line 4
    .line 5
    long-to-int p0, v1

    .line 6
    invoke-virtual {v0, p0}, Ll/re80;->t(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->K2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/jka;->Pb()Ll/jfh;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-interface {v0}, Ll/jfh;->i()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput-boolean v0, p0, Lcom/p1/mobile/putong/app/PutongAct;->mIfInNewUi1ShouldUseThemNewUI2:Z

    .line 15
    .line 16
    new-instance v0, Ll/oo20;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Ll/oo20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)V

    .line 19
    .line 20
    .line 21
    new-instance v1, Ll/to20;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/to20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;Ll/x20;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public initSubscription()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/uo20;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/uo20;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public j3(J)Ljava/lang/String;
    .locals 4

    .line 1
    const-wide/16 v0, 0x3e8

    .line 2
    .line 3
    div-long v2, p1, v0

    .line 4
    .line 5
    rem-long/2addr p1, v0

    .line 6
    const-wide/16 v0, 0x1f4

    .line 7
    .line 8
    cmp-long p0, p1, v0

    .line 9
    .line 10
    if-lez p0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    :goto_0
    int-to-long p0, p0

    .line 16
    add-long/2addr v2, p0

    .line 17
    const-wide/16 p0, 0x3c

    .line 18
    .line 19
    rem-long/2addr v2, p0

    .line 20
    new-instance p0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string p1, "00:"

    .line 23
    .line 24
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const-wide/16 p1, 0xa

    .line 28
    .line 29
    cmp-long p1, v2, p1

    .line 30
    .line 31
    if-ltz p1, :cond_1

    .line 32
    .line 33
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    goto :goto_1

    .line 38
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string p2, "0"

    .line 41
    .line 42
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    :goto_1
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "media"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/data/Video;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->i:Lcom/p1/mobile/putong/data/Video;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 18
    .line 19
    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 22
    .line 23
    .line 24
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
