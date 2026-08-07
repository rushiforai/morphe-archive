.class public Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# static fields
.field public static final m:Ljava/lang/String;


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;

.field public b:Lv/VFrame;

.field public c:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

.field public d:Lcom/p1/mobile/putong/feed/newui/photoalbum/redpointview/FeedRedDotView;

.field public e:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

.field public f:Landroid/widget/LinearLayout;

.field public g:Landroid/widget/ImageView;

.field public h:Landroid/widget/ImageView;

.field public i:I

.field public j:Ll/o94;

.field public k:Z

.field public final l:Ll/ga1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraPhotoControlView;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->m:Ljava/lang/String;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 13
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 12
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView$a;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->l:Ll/ga1;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->o(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->r(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->p(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->s(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->i:I

    return p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->j()V

    return-void
.end method


# virtual methods
.method public final h(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jd4;->a(Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public final j()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->k()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->t()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final k()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->i:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const/4 v2, 0x4

    .line 5
    if-eq v0, v1, :cond_1

    .line 6
    .line 7
    const/4 v1, 0x5

    .line 8
    if-eq v0, v2, :cond_0

    .line 9
    .line 10
    if-eq v0, v1, :cond_1

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->i:I

    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->i:I

    .line 17
    .line 18
    return-void
.end method

.method public final l()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->v()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->i:I

    .line 6
    .line 7
    return-void
.end method

.method public m()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->i:I

    .line 3
    .line 4
    return-void
.end method

.method public n(Lcom/p1/mobile/putong/data/Media;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->e:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->getDraweeView()Lv/VDraweeView;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/lbc0;->r0:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->e:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->getDraweeView()Lv/VDraweeView;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    new-instance v0, Lcom/facebook/drawee/generic/RoundingParams;

    .line 21
    .line 22
    invoke-direct {v0}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 23
    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/generic/RoundingParams;->v(Z)Lcom/facebook/drawee/generic/RoundingParams;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const/high16 v1, 0x40a00000    # 5.0f

    .line 31
    .line 32
    invoke-static {v1}, Ll/bnl0;->w(F)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    int-to-float v1, v1

    .line 37
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Ll/wlj;

    .line 46
    .line 47
    invoke-virtual {v1, v0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Ll/wlj;

    .line 55
    .line 56
    sget-object v1, Ll/h1e0;->h:Ll/h1e0;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ll/wlj;->w(Ll/h1e0;)V

    .line 59
    .line 60
    .line 61
    const/high16 v0, 0x40400000    # 3.0f

    .line 62
    .line 63
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    invoke-virtual {p0, v0, v0, v0, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 68
    .line 69
    .line 70
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 71
    .line 72
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->m0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->getDraweeLayout()Landroid/widget/FrameLayout;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    sget p1, Ll/lbc0;->q0:I

    .line 83
    .line 84
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public final synthetic o(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->j:Ll/o94;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->j:Ll/o94;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/o94;->i(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->h(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->l()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic p(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->j:Ll/o94;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->j:Ll/o94;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/o94;->v(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic q(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->j:Ll/o94;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->j:Ll/o94;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/o94;->f(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic r(Landroid/view/View;)V
    .locals 2

    .line 1
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->i:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->j:Ll/o94;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->j:Ll/o94;

    .line 16
    .line 17
    invoke-interface {p1}, Ll/o94;->p()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    :goto_0
    return-void

    .line 24
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->x()V

    .line 25
    .line 26
    .line 27
    const-string p1, "android.permission.RECORD_AUDIO"

    .line 28
    .line 29
    filled-new-array {p1}, [Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-nez v1, :cond_2

    .line 38
    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    filled-new-array {p1}, [Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    const/4 v1, 0x0

    .line 52
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->i()Lcom/p1/mobile/android/app/Act;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_2
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->i:I

    .line 69
    .line 70
    const/4 v0, 0x2

    .line 71
    if-eq p1, v0, :cond_4

    .line 72
    .line 73
    const/4 v0, 0x5

    .line 74
    if-ne p1, v0, :cond_3

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_3
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->m:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {p1, v0}, Ll/pb1;->a(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->j()V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_4
    :goto_1
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->m:Ljava/lang/String;

    .line 95
    .line 96
    sget-object v1, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->NORMAL:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 97
    .line 98
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->l:Ll/ga1;

    .line 99
    .line 100
    invoke-virtual {p1, v0, v1, p0}, Ll/pb1;->f(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public final synthetic s(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x6

    .line 2
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->i:I

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->t()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setActivated(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/View;->setActivated(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setCallback(Ll/o94;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->j:Ll/o94;

    .line 2
    .line 3
    return-void
.end method

.method public setState(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->i:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->t()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final t()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->j:Ll/o94;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->j:Ll/o94;

    .line 10
    .line 11
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->i:I

    .line 12
    .line 13
    invoke-interface {v0, v1}, Ll/o94;->onStateChanged(I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->i:I

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    const/4 v2, 0x2

    .line 20
    const/4 v3, 0x0

    .line 21
    const/16 v4, 0x8

    .line 22
    .line 23
    if-eq v0, v2, :cond_3

    .line 24
    .line 25
    const/4 v5, 0x4

    .line 26
    if-eq v0, v5, :cond_2

    .line 27
    .line 28
    const/4 v2, 0x5

    .line 29
    if-eq v0, v2, :cond_1

    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->b:Lv/VFrame;

    .line 33
    .line 34
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->e:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 38
    .line 39
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->f:Landroid/widget/LinearLayout;

    .line 43
    .line 44
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;

    .line 48
    .line 49
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->setState(I)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->b:Lv/VFrame;

    .line 54
    .line 55
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->e:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 59
    .line 60
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->f:Landroid/widget/LinearLayout;

    .line 64
    .line 65
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;

    .line 69
    .line 70
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->setState(I)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->b:Lv/VFrame;

    .line 75
    .line 76
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->e:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 80
    .line 81
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->f:Landroid/widget/LinearLayout;

    .line 85
    .line 86
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;

    .line 90
    .line 91
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;->setState(I)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public u()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->i:I

    .line 3
    .line 4
    return-void
.end method

.method public final v()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->c:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 2
    .line 3
    new-instance v1, Ll/ed4;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/ed4;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->e:Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraMenuView;

    .line 12
    .line 13
    new-instance v1, Ll/fd4;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/fd4;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->g:Landroid/widget/ImageView;

    .line 22
    .line 23
    new-instance v1, Ll/gd4;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/gd4;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/RecordButton;

    .line 32
    .line 33
    new-instance v1, Ll/hd4;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/hd4;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->h:Landroid/widget/ImageView;

    .line 42
    .line 43
    new-instance v1, Ll/id4;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/id4;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public w(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/redpointview/FeedRedDotView;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final x()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->k:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/CameraVideoControlView;->k:Z

    .line 8
    .line 9
    return-void
.end method
