.class public Ll/xz10;
.super Ll/eas;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/xz10$b;
    }
.end annotation


# static fields
.field public static s:Ljava/lang/String; = "MusicPlayManager"

.field public static t:Ljava/lang/String; = "play_mode_single_loop"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ll/c0m;

.field public e:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

.field public f:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ljava/lang/String;

.field public i:Ll/x2m;

.field public j:Ll/wyd0;

.field public k:Ll/kcg0;

.field public l:Ll/wyd0;

.field public m:Z

.field public n:Ljava/lang/String;

.field public o:Ll/nxd0;

.field public p:Ll/kcg0;

.field public q:Z

.field public r:Ll/kcg0;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/eas;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "play_mode_playlist_loop"

    .line 5
    .line 6
    iput-object v0, p0, Ll/xz10;->a:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "intl_local_playlist"

    .line 9
    .line 10
    iput-object v0, p0, Ll/xz10;->b:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, "intl_music_play_mode"

    .line 13
    .line 14
    iput-object v0, p0, Ll/xz10;->c:Ljava/lang/String;

    .line 15
    .line 16
    new-instance v0, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/xz10;->g:Ljava/util/List;

    .line 22
    .line 23
    iget-object v0, p0, Ll/xz10;->a:Ljava/lang/String;

    .line 24
    .line 25
    iput-object v0, p0, Ll/xz10;->h:Ljava/lang/String;

    .line 26
    .line 27
    const-string v0, ""

    .line 28
    .line 29
    iput-object v0, p0, Ll/xz10;->n:Ljava/lang/String;

    .line 30
    .line 31
    return-void
.end method

.method public synthetic constructor <init>(Ll/yz10;)V
    .locals 0

    .line 32
    invoke-direct {p0}, Ll/xz10;-><init>()V

    return-void
.end method

.method public static synthetic S0(Ll/xz10;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xz10;->i1(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic T0(Ll/xz10;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xz10;->r1(Ljava/util/ArrayList;)V

    return-void
.end method

.method public static synthetic U0(Ll/xz10;Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xz10;->s1(Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic V0(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->filePath:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic W0(Ll/xz10;Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xz10;->q1(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic X0(Ll/xz10;Ll/gcg0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xz10;->p1(Ll/gcg0;)V

    return-void
.end method

.method public static synthetic Y0(Ll/xz10;Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xz10;->o1(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V

    return-void
.end method

.method public static synthetic Z0(Ljava/lang/Long;)V
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    new-array p0, p0, [Ll/pf60;

    .line 3
    .line 4
    const-string v0, "e_intl_local_music_play_during_time"

    .line 5
    .line 6
    const-string v1, "p_intl_local_music_play_main"

    .line 7
    .line 8
    invoke-static {v0, v1, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a1(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->filePath:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->filePath:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic b1(Ll/xz10;ILcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xz10;->n1(ILcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static f1()Ll/xz10;
    .locals 1

    .line 1
    invoke-static {}, Ll/xz10$b;->a()Ll/xz10;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public A1(Ll/x2m;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/xz10;->i:Ll/x2m;

    .line 2
    .line 3
    iget-object p1, p0, Ll/xz10;->e:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->STATUS_PLAYING:Ljava/lang/String;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->playStatus:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    iget-object p1, p0, Ll/xz10;->i:Ll/x2m;

    .line 19
    .line 20
    iget-object p0, p0, Ll/xz10;->e:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 21
    .line 22
    invoke-interface {p1, p0}, Ll/x2m;->o1(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->STATUS_PAUSED:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v0, p0, Ll/xz10;->e:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->playStatus:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_2

    .line 37
    .line 38
    iget-object p1, p0, Ll/xz10;->i:Ll/x2m;

    .line 39
    .line 40
    iget-object p0, p0, Ll/xz10;->e:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 41
    .line 42
    invoke-interface {p1, p0}, Ll/x2m;->w1(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V

    .line 43
    .line 44
    .line 45
    :cond_2
    :goto_0
    return-void
.end method

.method public B1()V
    .locals 2

    .line 1
    sget-object v0, Ll/xz10;->s:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "releasePlayer"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/xz10;->d:Ll/c0m;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ll/c0m;->a()Ll/uzl;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Ll/uzl;->stopSurroundMusic()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/xz10;->d:Ll/c0m;

    .line 21
    .line 22
    invoke-interface {v0}, Ll/c0m;->b()Ll/wsl;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-interface {v0, p0}, Ll/wsl;->a(Ll/w6m;)V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Ll/xz10;->d:Ll/c0m;

    .line 30
    .line 31
    :cond_0
    iget-object v0, p0, Ll/xz10;->r:Ll/kcg0;

    .line 32
    .line 33
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/xz10;->k:Ll/kcg0;

    .line 37
    .line 38
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/xz10;->p:Ll/kcg0;

    .line 42
    .line 43
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 44
    .line 45
    .line 46
    iput-object v1, p0, Ll/xz10;->e:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 47
    .line 48
    iput-object v1, p0, Ll/xz10;->f:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 49
    .line 50
    const-string v0, ""

    .line 51
    .line 52
    iput-object v0, p0, Ll/xz10;->n:Ljava/lang/String;

    .line 53
    .line 54
    return-void
.end method

.method public C0(Ljava/lang/String;ILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->C0(Ljava/lang/String;ILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/xz10;->d:Ll/c0m;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-interface {p1}, Ll/c0m;->a()Ll/uzl;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Ll/xz10;->d:Ll/c0m;

    .line 15
    .line 16
    invoke-interface {p1}, Ll/c0m;->a()Ll/uzl;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-interface {p1}, Ll/uzl;->stopSurroundMusic()V

    .line 21
    .line 22
    .line 23
    :cond_0
    invoke-virtual {p0}, Ll/xz10;->B1()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public C1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xz10;->d:Ll/c0m;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/c0m;->a()Ll/uzl;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ll/uzl;->q()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/xz10;->e:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 11
    .line 12
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->STATUS_PLAYING:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->playStatus:Ljava/lang/String;

    .line 15
    .line 16
    iget-object p0, p0, Ll/xz10;->i:Ll/x2m;

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    invoke-interface {p0, v0}, Ll/x2m;->k1(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    sget-object p0, Ll/xz10;->s:Ljava/lang/String;

    .line 24
    .line 25
    const-string v0, "resumePlay"

    .line 26
    .line 27
    invoke-static {p0, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public D1()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object v1, p0, Ll/xz10;->g:Ljava/util/List;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ll/qz10;

    .line 9
    .line 10
    invoke-direct {v1, p0, v0}, Ll/qz10;-><init>(Ll/xz10;Ljava/util/ArrayList;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v1}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public E1(Ljava/util/List;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/xz10;->g:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Ll/xz10;->c1(Ljava/util/List;Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public F1(Ll/c0m;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xz10;->d:Ll/c0m;

    .line 2
    .line 3
    invoke-interface {p1}, Ll/c0m;->b()Ll/wsl;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p1, p0}, Ll/wsl;->b(Ll/w6m;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public G1(FZ)V
    .locals 2

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object p2, p0, Ll/xz10;->o:Ll/nxd0;

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p2, v0}, Ll/nxd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    sget-object p2, Ll/xz10;->s:Ljava/lang/String;

    .line 13
    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v1, "save  volume:"

    .line 17
    .line 18
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {p2, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-boolean p2, p0, Ll/xz10;->m:Z

    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    if-eqz p2, :cond_1

    .line 35
    .line 36
    sget-object p1, Ll/xz10;->s:Ljava/lang/String;

    .line 37
    .line 38
    const-string p2, "set  volume isMute 0"

    .line 39
    .line 40
    invoke-static {p1, p2}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    move p1, v0

    .line 44
    :cond_1
    iget-boolean p2, p0, Ll/xz10;->q:Z

    .line 45
    .line 46
    if-nez p2, :cond_2

    .line 47
    .line 48
    sget-object p1, Ll/xz10;->s:Ljava/lang/String;

    .line 49
    .line 50
    const-string p2, "set  volume background 0"

    .line 51
    .line 52
    invoke-static {p1, p2}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    move v0, p1

    .line 57
    :goto_0
    iget-object p0, p0, Ll/xz10;->d:Ll/c0m;

    .line 58
    .line 59
    if-eqz p0, :cond_3

    .line 60
    .line 61
    invoke-interface {p0}, Ll/c0m;->a()Ll/uzl;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-interface {p0, v0}, Ll/uzl;->a0(F)V

    .line 66
    .line 67
    .line 68
    sget-object p0, Ll/xz10;->s:Ljava/lang/String;

    .line 69
    .line 70
    new-instance p1, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    const-string p2, "set sdk volume:"

    .line 73
    .line 74
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-static {p0, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    :cond_3
    return-void
.end method

.method public final H1()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xz10;->r:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0xf

    .line 7
    .line 8
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 9
    .line 10
    invoke-static {v0, v1, v2}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/vz10;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/vz10;-><init>(Ll/xz10;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/wz10;

    .line 36
    .line 37
    invoke-direct {v1}, Ll/wz10;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, p0, Ll/xz10;->r:Ll/kcg0;

    .line 49
    .line 50
    return-void
.end method

.method public I1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xz10;->e:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 2
    .line 3
    iput-object v0, p0, Ll/xz10;->f:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 4
    .line 5
    iget-object p0, p0, Ll/xz10;->d:Ll/c0m;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/c0m;->a()Ll/uzl;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Ll/uzl;->stopSurroundMusic()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public J1(Ll/x2m;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xz10;->i:Ll/x2m;

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput-object p1, p0, Ll/xz10;->i:Ll/x2m;

    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public W()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/eas;->W()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/xz10;->f:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->STATUS_IDLE:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->playStatus:Ljava/lang/String;

    .line 11
    .line 12
    sget-object v0, Ll/xz10;->s:Ljava/lang/String;

    .line 13
    .line 14
    new-instance v1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v2, "onPlayStop:"

    .line 17
    .line 18
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v2, p0, Ll/xz10;->f:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 22
    .line 23
    iget-object v2, v2, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->filePath:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/xz10;->i:Ll/x2m;

    .line 36
    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    iget-object v1, p0, Ll/xz10;->f:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 40
    .line 41
    invoke-interface {v0, v1}, Ll/x2m;->e0(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V

    .line 42
    .line 43
    .line 44
    const/4 v0, 0x0

    .line 45
    iput-object v0, p0, Ll/xz10;->f:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public X()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/eas;->X()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/xz10;->s:Ljava/lang/String;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "onPlayFinish:"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v2, p0, Ll/xz10;->e:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 14
    .line 15
    iget-object v2, v2, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->filePath:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/xz10;->e:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 28
    .line 29
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->STATUS_IDLE:Ljava/lang/String;

    .line 30
    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->playStatus:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v1, p0, Ll/xz10;->i:Ll/x2m;

    .line 34
    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    invoke-interface {v1, v0}, Ll/x2m;->e0(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    invoke-virtual {p0}, Ll/xz10;->m1()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    iget-object v0, p0, Ll/xz10;->e:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ll/xz10;->v1(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    invoke-virtual {p0}, Ll/xz10;->w1()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public Z()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/eas;->Z()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/xz10;->s:Ljava/lang/String;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "onPlayStart:"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v2, p0, Ll/xz10;->e:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 14
    .line 15
    iget-object v2, v2, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->filePath:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    new-array v1, v0, [Ll/pf60;

    .line 29
    .line 30
    const-string v2, "e_intl_local_music_play_music"

    .line 31
    .line 32
    const-string v3, "p_intl_local_music_play_main"

    .line 33
    .line 34
    invoke-static {v2, v3, v1}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Ll/xz10;->o:Ll/nxd0;

    .line 38
    .line 39
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Ljava/lang/Float;

    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    invoke-virtual {p0, v1, v0}, Ll/xz10;->G1(FZ)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/xz10;->e:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 53
    .line 54
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->STATUS_PLAYING:Ljava/lang/String;

    .line 55
    .line 56
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->playStatus:Ljava/lang/String;

    .line 57
    .line 58
    iget-object p0, p0, Ll/xz10;->i:Ll/x2m;

    .line 59
    .line 60
    if-eqz p0, :cond_0

    .line 61
    .line 62
    invoke-interface {p0, v0}, Ll/x2m;->o1(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V

    .line 63
    .line 64
    .line 65
    :cond_0
    return-void
.end method

.method public c1(Ljava/util/List;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Ll/xz10;->g:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/xz10;->i:Ll/x2m;

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/xz10;->g:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p1, v0}, Ll/x2m;->e1(Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    if-eqz p2, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xz10;->D1()V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public d()F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xz10;->o:Ll/nxd0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/lang/Float;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/high16 p0, 0x3f000000    # 0.5f

    .line 17
    .line 18
    return p0
.end method

.method public d1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xz10;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Ll/xz10;->h:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Ll/xz10;->t:Ljava/lang/String;

    .line 12
    .line 13
    iput-object v0, p0, Ll/xz10;->h:Ljava/lang/String;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object v0, p0, Ll/xz10;->a:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Ll/xz10;->h:Ljava/lang/String;

    .line 19
    .line 20
    :goto_0
    sget-object v0, Ll/xz10;->s:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Ll/xz10;->h:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/xz10;->l:Ll/wyd0;

    .line 28
    .line 29
    iget-object p0, p0, Ll/xz10;->h:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public e1(Ljava/util/ArrayList;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Ll/rz10;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/rz10;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-static {p1, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/xz10;->I1()V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Ll/xz10;->g:Ljava/util/List;

    .line 25
    .line 26
    new-instance v2, Ll/sz10;

    .line 27
    .line 28
    invoke-direct {v2, v0}, Ll/sz10;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1, v2}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/lit8 v1, v0, 0x1

    .line 36
    .line 37
    :goto_0
    iget-object v2, p0, Ll/xz10;->g:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    add-int/2addr v2, v0

    .line 44
    if-ge v1, v2, :cond_2

    .line 45
    .line 46
    iget-object v2, p0, Ll/xz10;->g:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    rem-int v2, v1, v2

    .line 53
    .line 54
    new-instance v3, Ll/tz10;

    .line 55
    .line 56
    invoke-direct {v3, p0, v2}, Ll/tz10;-><init>(Ll/xz10;I)V

    .line 57
    .line 58
    .line 59
    invoke-static {p1, v3}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 64
    .line 65
    if-nez v3, :cond_1

    .line 66
    .line 67
    iget-object v0, p0, Ll/xz10;->g:Ljava/util/List;

    .line 68
    .line 69
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 74
    .line 75
    invoke-virtual {p0, v0}, Ll/xz10;->v1(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_2
    :goto_1
    iget-object v0, p0, Ll/xz10;->g:Ljava/util/List;

    .line 83
    .line 84
    invoke-interface {v0, p1}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 85
    .line 86
    .line 87
    iget-object p1, p0, Ll/xz10;->i:Ll/x2m;

    .line 88
    .line 89
    if-eqz p1, :cond_3

    .line 90
    .line 91
    iget-object v0, p0, Ll/xz10;->g:Ljava/util/List;

    .line 92
    .line 93
    invoke-interface {p1, v0}, Ll/x2m;->e1(Ljava/util/List;)V

    .line 94
    .line 95
    .line 96
    :cond_3
    invoke-virtual {p0}, Ll/xz10;->D1()V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public g1()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/xz10;->g:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public h1(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iput-boolean v1, p0, Ll/xz10;->m:Z

    .line 18
    .line 19
    iget-object p1, p0, Ll/xz10;->o:Ll/nxd0;

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Ljava/lang/Float;

    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    invoke-virtual {p0, p1, v1}, Ll/xz10;->G1(FZ)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 36
    iput-boolean p1, p0, Ll/xz10;->m:Z

    .line 37
    .line 38
    const/4 p1, 0x0

    .line 39
    invoke-virtual {p0, p1, v1}, Ll/xz10;->G1(FZ)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    iput-boolean v1, p0, Ll/xz10;->m:Z

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/xz10;->B1()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final i1(Ljava/lang/Boolean;)V
    .locals 3

    .line 1
    sget-object v0, Ll/xz10;->s:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "isFront:"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, ",isVisible:"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->isAppVisible()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iput-boolean v0, p0, Ll/xz10;->q:Z

    .line 37
    .line 38
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    const/4 v0, 0x0

    .line 43
    if-nez p1, :cond_0

    .line 44
    .line 45
    const/4 p1, 0x0

    .line 46
    invoke-virtual {p0, p1, v0}, Ll/xz10;->G1(FZ)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    iget-object p1, p0, Ll/xz10;->o:Ll/nxd0;

    .line 51
    .line 52
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Ljava/lang/Float;

    .line 57
    .line 58
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    invoke-virtual {p0, p1, v0}, Ll/xz10;->G1(FZ)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public j1(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xz10;->n:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/xz10;->j:Ll/wyd0;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    return-void

    .line 15
    :cond_1
    :goto_0
    iput-object p1, p0, Ll/xz10;->n:Ljava/lang/String;

    .line 16
    .line 17
    new-instance v0, Ll/wyd0;

    .line 18
    .line 19
    new-instance v1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    iget-object v2, p0, Ll/xz10;->b:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const-string v2, ""

    .line 37
    .line 38
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Ll/xz10;->j:Ll/wyd0;

    .line 42
    .line 43
    new-instance v0, Ll/wyd0;

    .line 44
    .line 45
    new-instance v1, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .line 49
    .line 50
    iget-object v2, p0, Ll/xz10;->c:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iget-object v2, p0, Ll/xz10;->a:Ljava/lang/String;

    .line 63
    .line 64
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iput-object v0, p0, Ll/xz10;->l:Ll/wyd0;

    .line 68
    .line 69
    new-instance v0, Ll/nxd0;

    .line 70
    .line 71
    new-instance v1, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    const-string v2, "intl_music_play_volume"

    .line 74
    .line 75
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    const/high16 v1, 0x3f000000    # 0.5f

    .line 86
    .line 87
    invoke-direct {v0, p1, v1}, Ll/nxd0;-><init>(Ljava/lang/String;F)V

    .line 88
    .line 89
    .line 90
    iput-object v0, p0, Ll/xz10;->o:Ll/nxd0;

    .line 91
    .line 92
    iget-object p1, p0, Ll/xz10;->l:Ll/wyd0;

    .line 93
    .line 94
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    check-cast p1, Ljava/lang/String;

    .line 99
    .line 100
    iput-object p1, p0, Ll/xz10;->h:Ljava/lang/String;

    .line 101
    .line 102
    return-void
.end method

.method public k1(Ljava/lang/String;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xz10;->g:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/nz10;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/nz10;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public l1()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xz10;->e:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->isUsing()Z

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

.method public m1()Z
    .locals 1

    .line 1
    sget-object v0, Ll/xz10;->t:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/xz10;->h:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final synthetic n1(ILcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xz10;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->filePath:Ljava/lang/String;

    .line 10
    .line 11
    iget-object p1, p2, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->filePath:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public final synthetic o1(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xz10;->e:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->filePath:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->filePath:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/xz10;->e:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->playStatus:Ljava/lang/String;

    .line 18
    .line 19
    iput-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->playStatus:Ljava/lang/String;

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->STATUS_IDLE:Ljava/lang/String;

    .line 23
    .line 24
    iput-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->playStatus:Ljava/lang/String;

    .line 25
    .line 26
    return-void
.end method

.method public final synthetic p1(Ll/gcg0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xz10;->j:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/String;

    .line 8
    .line 9
    new-instance v1, Ll/xz10$a;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/xz10$a;-><init>(Ll/xz10;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/google/gson/reflect/TypeToken;->getType()Ljava/lang/reflect/Type;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;->getInstance()Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v2, v0, v1}, Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Ljava/util/List;

    .line 27
    .line 28
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-nez v1, :cond_0

    .line 33
    .line 34
    new-instance v1, Ll/mz10;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/mz10;-><init>(Ll/xz10;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 40
    .line 41
    .line 42
    invoke-interface {p1, v0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_0
    new-instance p0, Ljava/util/ArrayList;

    .line 47
    .line 48
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-interface {p1, p0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final synthetic q1(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->filePath:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/xz10;->e:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->filePath:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public r0(I)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/eas;->r0(I)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/xz10;->s:Ljava/lang/String;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "onPlayError:"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v2, p0, Ll/xz10;->e:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 14
    .line 15
    iget-object v2, v2, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->filePath:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/xz10;->e:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 28
    .line 29
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->STATUS_IDLE:Ljava/lang/String;

    .line 30
    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->playStatus:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v1, p0, Ll/xz10;->i:Ll/x2m;

    .line 34
    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    invoke-interface {v1, v0, p1}, Ll/x2m;->N(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;I)V

    .line 38
    .line 39
    .line 40
    :cond_0
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->s:I

    .line 41
    .line 42
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Ll/xz10;->e:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 46
    .line 47
    filled-new-array {p1}, [Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p0, p1}, Ll/xz10;->e1(Ljava/util/ArrayList;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final synthetic r1(Ljava/util/ArrayList;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;->getInstance()Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/gson/SafeJsonUtil;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p0, p0, Ll/xz10;->j:Ll/wyd0;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic s1(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xz10;->e:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->isPlaying()Z

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
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public t1()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/uz10;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/uz10;-><init>(Ll/xz10;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public u1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xz10;->d:Ll/c0m;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/c0m;->a()Ll/uzl;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ll/uzl;->j()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/xz10;->e:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 11
    .line 12
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->STATUS_PAUSED:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->playStatus:Ljava/lang/String;

    .line 15
    .line 16
    sget-object v0, Ll/xz10;->s:Ljava/lang/String;

    .line 17
    .line 18
    const-string v1, "pausePlay"

    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/xz10;->i:Ll/x2m;

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Ll/xz10;->e:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 28
    .line 29
    invoke-interface {v0, p0}, Ll/x2m;->w1(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public v1(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xz10;->e:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->isUsing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xz10;->I1()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/xz10;->d:Ll/c0m;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iput-object p1, p0, Ll/xz10;->e:Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 19
    .line 20
    invoke-interface {v0}, Ll/c0m;->a()Ll/uzl;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->filePath:Ljava/lang/String;

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    invoke-interface {p0, p1, v0}, Ll/uzl;->E(Ljava/lang/String;Z)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public w1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xz10;->g:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/pz10;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/pz10;-><init>(Ll/xz10;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    add-int/lit8 v0, v0, 0x1

    .line 13
    .line 14
    iget-object v1, p0, Ll/xz10;->g:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-lt v0, v1, :cond_0

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    :cond_0
    iget-object v1, p0, Ll/xz10;->g:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ll/xz10;->v1(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public x1(Ll/x2m;Ll/c0m;Lrx/c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/x2m;",
            "Ll/c0m;",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/xz10;->A1(Ll/x2m;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/xz10;->F1(Ll/c0m;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p3}, Ll/xz10;->y1(Lrx/c;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xz10;->z1()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xz10;->H1()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public y1(Lrx/c;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/xz10;->k:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/xz10;->n:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    new-instance v0, Ll/lz10;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/lz10;-><init>(Ll/xz10;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, p0, Ll/xz10;->k:Ll/kcg0;

    .line 29
    .line 30
    return-void
.end method

.method public final z1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xz10;->p:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->isAppVisible()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iput-boolean v0, p0, Ll/xz10;->q:Z

    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->front()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/oz10;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/oz10;-><init>(Ll/xz10;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Ll/xz10;->p:Ll/kcg0;

    .line 30
    .line 31
    return-void
.end method
