.class public Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;
.super Lv/VRelative;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$d;
    }
.end annotation


# static fields
.field public static final r:Ljava/lang/String; = "MessageMomentExpandItemLivePhotoView"


# instance fields
.field public d:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;

.field public e:Landroid/view/TextureView;

.field public f:Lv/VDraweeView;

.field public g:Landroid/view/View;

.field public h:Landroid/view/View;

.field public i:Landroid/view/View;

.field public j:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$d;

.field public final k:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ll/ie80$b;",
            ">;"
        }
    .end annotation
.end field

.field public l:Landroid/view/Surface;

.field public m:Lcom/p1/mobile/putong/data/Video;

.field public n:Z

.field public o:Ll/ie80;

.field public p:Ljava/lang/Runnable;

.field public final q:Ll/ga1;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VRelative;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$d;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$d;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->j:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$d;

    .line 10
    .line 11
    new-instance p1, Ljava/util/HashSet;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->k:Ljava/util/Set;

    .line 17
    .line 18
    new-instance p1, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$b;

    .line 19
    .line 20
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$b;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->q:Ll/ga1;

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 26
    invoke-direct {p0, p1, p2}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 27
    new-instance p1, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$d;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$d;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->j:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$d;

    .line 28
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->k:Ljava/util/Set;

    .line 29
    new-instance p1, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$b;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$b;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->q:Ll/ga1;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 30
    invoke-direct {p0, p1, p2, p3}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 31
    new-instance p1, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$d;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$d;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->j:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$d;

    .line 32
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->k:Ljava/util/Set;

    .line 33
    new-instance p1, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$b;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$b;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->q:Ll/ga1;

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->n:Z

    return p0
.end method

.method public static bridge synthetic H(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->p:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic I(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;)Landroid/view/Surface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->l:Landroid/view/Surface;

    return-object p0
.end method

.method public static bridge synthetic L(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;)Lcom/p1/mobile/putong/data/Video;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->m:Lcom/p1/mobile/putong/data/Video;

    return-object p0
.end method

.method public static bridge synthetic M(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->n:Z

    return-void
.end method

.method public static bridge synthetic O(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;Landroid/view/Surface;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->l:Landroid/view/Surface;

    return-void
.end method

.method public static bridge synthetic P(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->Y(Z)V

    return-void
.end method

.method private Y(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->l:Landroid/view/Surface;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->p:Ljava/lang/Runnable;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ll/k000;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/k000;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->p:Ljava/lang/Runnable;

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 18
    .line 19
    .line 20
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->p:Ljava/lang/Runnable;

    .line 21
    .line 22
    const-wide/16 v1, 0x2710

    .line 23
    .line 24
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->o:Ll/ie80;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_3

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->m:Lcom/p1/mobile/putong/data/Video;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    const/4 v0, 0x1

    .line 44
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->n:Z

    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->l:Landroid/view/Surface;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->o:Ll/ie80;

    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->j:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$d;

    .line 57
    .line 58
    invoke-interface {v0, p0, p1}, Ll/ie80;->d(Ll/ie80$a;Z)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->j:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$d;

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$d;->c()V

    .line 65
    .line 66
    .line 67
    :cond_3
    return-void
.end method

.method private init()V
    .locals 2

    .line 1
    new-instance v0, Ll/ye80;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ye80;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->o:Ll/ie80;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->R()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->V(Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->e:Landroid/view/TextureView;

    .line 16
    .line 17
    new-instance v1, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$a;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->T()V

    return-void
.end method

.method public static bridge synthetic q(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;)Ljava/util/Set;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->k:Ljava/util/Set;

    return-object p0
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;)Ll/ie80;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->o:Ll/ie80;

    return-object p0
.end method


# virtual methods
.method public final Q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/l000;->a(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final R()Z
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    const-string v1, "livephoto_function"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    new-instance v1, Lorg/json/JSONObject;

    .line 19
    .line 20
    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    .line 22
    .line 23
    :catch_0
    :cond_0
    return p0
.end method

.method public S()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->n:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic T()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->l:Landroid/view/Surface;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->j:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$d;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->j:Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$d;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$d;->d()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->k:Ljava/util/Set;

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ll/ie80$b;

    .line 35
    .line 36
    invoke-interface {v0}, Ll/ie80$b;->d()V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    return-void
.end method

.method public V(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->o:Ll/ie80;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0, p1}, Ll/ie80;->mute(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public W()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->p:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->n:Z

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->o:Ll/ie80;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->o:Ll/ie80;

    .line 18
    .line 19
    invoke-interface {p0}, Ll/ie80;->pause()V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->r:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Ll/pb1;->a(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public X()V
    .locals 3

    .line 1
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->r:Ljava/lang/String;

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->NORMAL:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->q:Ll/ga1;

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2, p0}, Ll/pb1;->f(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public Z(Lcom/p1/mobile/putong/data/Video;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->n:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->a0()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->m:Lcom/p1/mobile/putong/data/Video;

    .line 9
    .line 10
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->f:Lv/VDraweeView;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->f:Lv/VDraweeView;

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->aspectRatioBiggest()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->B0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->f:Lv/VDraweeView;

    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    sget v0, Ll/g9c0;->a:I

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->p:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->n:Z

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->o:Ll/ie80;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->o:Ll/ie80;

    .line 18
    .line 19
    invoke-interface {p0}, Ll/ie80;->stop()V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->r:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Ll/pb1;->a(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public b0(II)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->m:Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 15
    .line 16
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 23
    .line 24
    iget v1, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 25
    .line 26
    if-lez v1, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->m:Lcom/p1/mobile/putong/data/Video;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->m:Lcom/p1/mobile/putong/data/Video;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 42
    .line 43
    iget v1, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 44
    .line 45
    if-lez v1, :cond_2

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    new-instance v0, Lcom/p1/mobile/putong/data/Dimension;

    .line 49
    .line 50
    const/high16 v1, 0x43320000    # 178.0f

    .line 51
    .line 52
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    invoke-direct {v0, v2, v1}, Lcom/p1/mobile/putong/data/Dimension;-><init>(II)V

    .line 61
    .line 62
    .line 63
    :goto_0
    int-to-float v1, p1

    .line 64
    iget v2, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 65
    .line 66
    int-to-float v2, v2

    .line 67
    div-float v2, v1, v2

    .line 68
    .line 69
    int-to-float v3, p2

    .line 70
    iget v4, v0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 71
    .line 72
    int-to-float v4, v4

    .line 73
    div-float v4, v3, v4

    .line 74
    .line 75
    new-instance v5, Landroid/graphics/Matrix;

    .line 76
    .line 77
    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-static {v2, v4}, Ljava/lang/Math;->max(FF)F

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    iget v4, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 85
    .line 86
    int-to-float v4, v4

    .line 87
    div-float/2addr v4, v1

    .line 88
    iget v0, v0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 89
    .line 90
    int-to-float v0, v0

    .line 91
    div-float/2addr v0, v3

    .line 92
    div-int/lit8 p1, p1, 0x2

    .line 93
    .line 94
    int-to-float p1, p1

    .line 95
    div-int/lit8 p2, p2, 0x2

    .line 96
    .line 97
    int-to-float p2, p2

    .line 98
    invoke-virtual {v5, v4, v0, p1, p2}, Landroid/graphics/Matrix;->preScale(FFFF)Z

    .line 99
    .line 100
    .line 101
    invoke-virtual {v5, v2, v2, p1, p2}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->e:Landroid/view/TextureView;

    .line 105
    .line 106
    invoke-virtual {p1, v5}, Landroid/view/TextureView;->setTransform(Landroid/graphics/Matrix;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->Q(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->init()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setRadius(F)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->e:Landroid/view/TextureView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$c;

    .line 10
    .line 11
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView$c;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;F)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->e:Landroid/view/TextureView;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->e:Landroid/view/TextureView;

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-virtual {p1, v1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->f:Lv/VDraweeView;

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/moment/MessageMomentExpandItemLivePhotoView;->f:Lv/VDraweeView;

    .line 31
    .line 32
    invoke-virtual {p0, v1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method
