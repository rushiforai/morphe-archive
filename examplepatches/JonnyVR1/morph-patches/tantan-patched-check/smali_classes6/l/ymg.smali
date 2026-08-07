.class public Ll/ymg;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile f:Ll/ymg;


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ll/uul;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;",
            ">;"
        }
    .end annotation
.end field

.field public e:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/ymg;->e:I

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "explore_post_guide_browse_limit"

    .line 12
    .line 13
    const/16 v2, 0xa

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->z(Ljava/lang/String;I)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Ll/ymg;->e:I

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic a(Ll/ymg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ymg;->l(Ljava/lang/String;)V

    return-void
.end method

.method public static f()Ll/ymg;
    .locals 2

    .line 1
    sget-object v0, Ll/ymg;->f:Ll/ymg;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/ymg;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/ymg;->f:Ll/ymg;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/ymg;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/ymg;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/ymg;->f:Ll/ymg;

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
    sget-object v0, Ll/ymg;->f:Ll/ymg;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/ymg;->d:Ljava/lang/ref/WeakReference;

    .line 7
    .line 8
    return-void
.end method

.method public c(Lcom/p1/mobile/android/app/Act;Ll/uul;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ymg;->a:Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_4

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;->title:Ljava/lang/String;

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
    goto :goto_0

    .line 15
    :cond_0
    if-nez p1, :cond_1

    .line 16
    .line 17
    return v1

    .line 18
    :cond_1
    iget-object v0, p0, Ll/ymg;->d:Ljava/lang/ref/WeakReference;

    .line 19
    .line 20
    if-eqz v0, :cond_4

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    if-nez v0, :cond_2

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_2
    invoke-virtual {p0}, Ll/ymg;->k()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_3

    .line 34
    .line 35
    return v1

    .line 36
    :cond_3
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 37
    .line 38
    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Ll/ymg;->c:Ljava/lang/ref/WeakReference;

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Ll/ymg;->q(Lcom/p1/mobile/android/app/Act;)V

    .line 44
    .line 45
    .line 46
    const/4 p0, 0x1

    .line 47
    return p0

    .line 48
    :cond_4
    :goto_0
    return v1
.end method

.method public d()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ymg;->a:Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;

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
    iget-object v0, p0, Ll/ymg;->a:Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;->user:Lcom/p1/mobile/putong/feed/data/AtUserIdBox;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/ymg;->a:Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;->user:Lcom/p1/mobile/putong/feed/data/AtUserIdBox;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/AtUserIdBox;->id:Ljava/lang/String;

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Ll/ymg;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public g()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ymg;->a:Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;

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
    iget-object p0, p0, Ll/ymg;->a:Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;->topicId:Ljava/lang/String;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public h()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ymg;->a:Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;

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
    iget-object p0, p0, Ll/ymg;->a:Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;->topicName:Ljava/lang/String;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public i()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ymg;->j()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/ymg;->b:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Ll/ymg;->b:Ljava/lang/String;

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final j()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymg;->b:Ljava/lang/String;

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

.method public k()Z
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jka;->O:Ll/byd0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/lang/Long;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public final synthetic l(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Ll/ymg;->b:Ljava/lang/String;

    .line 3
    .line 4
    iget-object v0, p0, Ll/ymg;->c:Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/ymg;->c:Ljava/lang/ref/WeakReference;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Ll/ymg;->c:Ljava/lang/ref/WeakReference;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ll/uul;

    .line 31
    .line 32
    invoke-interface {v0}, Ll/uul;->c()V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/ymg;->c:Ljava/lang/ref/WeakReference;

    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->clear()V

    .line 38
    .line 39
    .line 40
    iput-object p1, p0, Ll/ymg;->c:Ljava/lang/ref/WeakReference;

    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public m()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ymg;->j()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public n(Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ymg;->a:Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;

    .line 2
    .line 3
    return-void
.end method

.method public o()Z
    .locals 0

    .line 1
    iget p0, p0, Ll/ymg;->e:I

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public p()Z
    .locals 0

    .line 1
    iget p0, p0, Ll/ymg;->e:I

    .line 2
    .line 3
    if-lez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final q(Lcom/p1/mobile/android/app/Act;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ymg;->d:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sget v2, Ll/tec0;->s:I

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/view/FeedActivityPostTipsView;

    .line 24
    .line 25
    new-instance v2, Lcom/p1/mobile/android/ui/bubble/a;

    .line 26
    .line 27
    invoke-direct {v2, p1}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2, v1}, Lcom/p1/mobile/android/ui/bubble/a;->s(Landroid/view/View;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    const/4 v3, 0x0

    .line 35
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->e(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    sget v3, Ll/k9c0;->n:I

    .line 44
    .line 45
    invoke-virtual {p1, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    filled-new-array {p1}, [I

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {v2, p1}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    const-wide/16 v2, 0x1388

    .line 58
    .line 59
    invoke-virtual {p1, v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    new-instance v2, Ll/xmg;

    .line 64
    .line 65
    invoke-direct {v2, p0}, Ll/xmg;-><init>(Ll/ymg;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->j(Lcom/p1/mobile/android/ui/bubble/a$c;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    sget v2, Lcom/p1/mobile/android/ui/bubble/a;->N:I

    .line 73
    .line 74
    sget v3, Lcom/p1/mobile/android/ui/bubble/a;->P:I

    .line 75
    .line 76
    or-int/2addr v2, v3

    .line 77
    invoke-virtual {p1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    sget v2, Lcom/p1/mobile/android/ui/bubble/a;->P:I

    .line 82
    .line 83
    sget v3, Ll/qa00;->n:I

    .line 84
    .line 85
    invoke-virtual {p1, v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->o(II)Lcom/p1/mobile/android/ui/bubble/a;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    sget v2, Ll/qa00;->h:I

    .line 90
    .line 91
    invoke-virtual {p1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    iget-object v3, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->I:Lv/VText;

    .line 100
    .line 101
    invoke-virtual {v2, p1, v3}, Lcom/p1/mobile/android/ui/bubble/d;->t(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    iput-object p1, p0, Ll/ymg;->b:Ljava/lang/String;

    .line 106
    .line 107
    iget-object p1, p0, Ll/ymg;->a:Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;

    .line 108
    .line 109
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedActivityPostTipsView;->q(Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0}, Ll/ymg;->r()V

    .line 113
    .line 114
    .line 115
    iget-object p1, p0, Ll/ymg;->c:Ljava/lang/ref/WeakReference;

    .line 116
    .line 117
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-eqz p1, :cond_1

    .line 122
    .line 123
    iget-object p1, p0, Ll/ymg;->c:Ljava/lang/ref/WeakReference;

    .line 124
    .line 125
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    if-eqz p1, :cond_1

    .line 134
    .line 135
    iget-object p1, p0, Ll/ymg;->c:Ljava/lang/ref/WeakReference;

    .line 136
    .line 137
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    check-cast p1, Ll/uul;

    .line 142
    .line 143
    invoke-interface {p1}, Ll/uul;->b()V

    .line 144
    .line 145
    .line 146
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->C6()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    iget-object v0, p0, Ll/ymg;->a:Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;

    .line 151
    .line 152
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;->topicId:Ljava/lang/String;

    .line 153
    .line 154
    const-string v1, ""

    .line 155
    .line 156
    if-nez v0, :cond_2

    .line 157
    .line 158
    move-object v0, v1

    .line 159
    :cond_2
    const-string v2, "topic_id"

    .line 160
    .line 161
    invoke-static {v2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    iget-object p0, p0, Ll/ymg;->a:Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;

    .line 166
    .line 167
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;->title:Ljava/lang/String;

    .line 168
    .line 169
    if-nez p0, :cond_3

    .line 170
    .line 171
    goto :goto_0

    .line 172
    :cond_3
    move-object v1, p0

    .line 173
    :goto_0
    const-string p0, "active_pop_content"

    .line 174
    .line 175
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    filled-new-array {v0, p0}, [Ll/pf60;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    const-string v0, "e_active_post_pop"

    .line 184
    .line 185
    invoke-static {v0, p1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 186
    .line 187
    .line 188
    return-void
.end method

.method public r()V
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jka;->O:Ll/byd0;

    .line 4
    .line 5
    invoke-static {}, Ll/pzi0;->o()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method
