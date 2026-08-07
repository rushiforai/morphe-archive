.class public Ll/ub40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/lb40;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VMenuBar;

.field public b:Lv/VSearchBar;

.field public c:Landroid/widget/ImageView;

.field public d:Lv/VRecyclerView;

.field public e:I

.field public f:Ll/l90;

.field public g:Ll/j90;

.field public h:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;

.field public i:Ll/lb40;

.field public j:Z

.field public k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/g90;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ll/qol$a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    iput v0, p0, Ll/ub40;->e:I

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Ll/ub40;->j:Z

    .line 9
    .line 10
    new-instance v0, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/ub40;->k:Ljava/util/List;

    .line 16
    .line 17
    new-instance v0, Ll/ub40$a;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/ub40$a;-><init>(Ll/ub40;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/ub40;->l:Ll/qol$a;

    .line 23
    .line 24
    iput-object p1, p0, Ll/ub40;->h:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;

    .line 25
    .line 26
    return-void
.end method

.method private synthetic B(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ub40;->h:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ub40;->b:Lv/VSearchBar;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic E(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ub40;->h:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/ub40;->h:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;->finish()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic F()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ub40;->I()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/ub40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ub40;->B(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/ub40;Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ub40;->C(Landroid/view/View;Z)V

    return-void
.end method

.method public static synthetic c(Ll/ub40;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ub40;->y()V

    return-void
.end method

.method public static synthetic d(Ll/ub40;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ub40;->G()V

    return-void
.end method

.method public static synthetic e(Ll/ub40;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ub40;->F()V

    return-void
.end method

.method public static synthetic f(Ll/ub40;Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ub40;->H(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V

    return-void
.end method

.method public static synthetic i(Ll/ub40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ub40;->E(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j(Ll/ub40;Ll/g90;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ub40;->M(Ll/g90;)V

    return-void
.end method

.method public static bridge synthetic k(Ll/ub40;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/ub40;->e:I

    return p0
.end method

.method public static bridge synthetic l(Ll/ub40;)Ll/j90;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ub40;->g:Ll/j90;

    return-object p0
.end method

.method public static bridge synthetic m(Ll/ub40;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ub40;->j:Z

    return p0
.end method

.method public static bridge synthetic n(Ll/ub40;Ljava/util/List;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ub40;->k:Ljava/util/List;

    return-void
.end method

.method public static bridge synthetic p(Ll/ub40;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ub40;->K(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private y()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/ub40;->w(Ll/g90;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private z()V
    .locals 2

    .line 1
    new-instance v0, Ll/l90;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ub40;->l:Ll/qol$a;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/l90;-><init>(Ll/qol$a;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ll/ub40;->f:Ll/l90;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/e3;->init()V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public A(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/cmg;->U()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/cmg;->U()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    new-instance p1, Ll/pb40;

    .line 14
    .line 15
    invoke-direct {p1, p0}, Ll/pb40;-><init>(Ll/ub40;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p1}, Ll/rkh;->a(Ll/x20;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    :cond_0
    invoke-virtual {p0}, Ll/ub40;->u()V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ll/qxv;->c()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    invoke-static {}, Ll/rkh;->c()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-nez p1, :cond_1

    .line 38
    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p0}, Ll/ub40;->act()Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const/4 v0, 0x1

    .line 48
    const/4 v1, 0x0

    .line 49
    invoke-interface {p1, p0, v0, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->dl(Lcom/p1/mobile/android/app/Act;ZLl/x20;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method

.method public final synthetic C(Landroid/view/View;Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ub40;->b:Lv/VSearchBar;

    .line 2
    .line 3
    const/high16 p1, 0x41980000    # 19.0f

    .line 4
    .line 5
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    const/high16 p1, 0x40e00000    # 7.0f

    .line 12
    .line 13
    :cond_0
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    const/4 p2, 0x0

    .line 18
    invoke-virtual {p0, v0, p2, p1, p2}, Landroid/view/View;->setPadding(IIII)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ub40;->h:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic G()V
    .locals 1

    .line 1
    const-string v0, "\u5f00\u542f\u5b9a\u4f4d\u670d\u52a1\uff0c\u83b7\u53d6\u7cbe\u51c6\u5b9a\u4f4d"

    .line 2
    .line 3
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/ub40;->h:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;->finish()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic H(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Ll/ub40;->w(Ll/g90;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public I()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "android.permission.ACCESS_FINE_LOCATION"

    .line 6
    .line 7
    const-string v2, "android.permission.ACCESS_COARSE_LOCATION"

    .line 8
    .line 9
    filled-new-array {v1, v2}, [Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/qb40;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/qb40;-><init>(Ll/ub40;)V

    .line 30
    .line 31
    .line 32
    new-instance v2, Ll/rb40;

    .line 33
    .line 34
    invoke-direct {v2, p0}, Ll/rb40;-><init>(Ll/ub40;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->m(Ll/x20;Ll/y20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object p0, p0, Ll/ub40;->h:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;

    .line 42
    .line 43
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public J(Lcom/p1/mobile/putong/location/Location;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ub40;->f:Ll/l90;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ub40;->h:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p0}, Ll/e3;->a(Lcom/p1/mobile/putong/location/Location;Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final K(Ljava/lang/CharSequence;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ub40;->g:Ll/j90;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object p1, p0, Ll/ub40;->g:Ll/j90;

    .line 14
    .line 15
    iget-object v0, p0, Ll/ub40;->k:Ljava/util/List;

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Ll/j90;->K(Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/ub40;->c:Landroid/widget/ImageView;

    .line 21
    .line 22
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/ub40;->d:Lv/VRecyclerView;

    .line 26
    .line 27
    const/4 p1, 0x1

    .line 28
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    iput-boolean v1, p0, Ll/ub40;->j:Z

    .line 33
    .line 34
    invoke-static {}, Ll/cmg;->U()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    iget-object p0, p0, Ll/ub40;->i:Ll/lb40;

    .line 41
    .line 42
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p0, p1}, Ll/lb40;->l0(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_2
    iget-object v0, p0, Ll/ub40;->f:Ll/l90;

    .line 51
    .line 52
    iget-object v1, p0, Ll/ub40;->i:Ll/lb40;

    .line 53
    .line 54
    iget-object v1, v1, Ll/lb40;->a:Lcom/p1/mobile/putong/location/Location;

    .line 55
    .line 56
    iget-object p0, p0, Ll/ub40;->h:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;

    .line 57
    .line 58
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {v0, v1, p0, p1}, Ll/e3;->c(Lcom/p1/mobile/putong/location/Location;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public L(Ljava/util/List;Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/g90;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ub40;->g:Ll/j90;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Ll/ub40;->b:Lv/VSearchBar;

    .line 10
    .line 11
    invoke-virtual {v0}, Lv/VSearchBar;->getEditText()Lv/VEditText;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-eqz p2, :cond_2

    .line 28
    .line 29
    iget-object p2, p0, Ll/ub40;->g:Ll/j90;

    .line 30
    .line 31
    invoke-virtual {p2, p1}, Ll/j90;->K(Ljava/util/List;)V

    .line 32
    .line 33
    .line 34
    iget-object p2, p0, Ll/ub40;->c:Landroid/widget/ImageView;

    .line 35
    .line 36
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iget v1, p0, Ll/ub40;->e:I

    .line 41
    .line 42
    const/4 v2, 0x0

    .line 43
    const/4 v3, 0x1

    .line 44
    if-ge v0, v1, :cond_0

    .line 45
    .line 46
    move v0, v3

    .line 47
    goto :goto_0

    .line 48
    :cond_0
    move v0, v2

    .line 49
    :goto_0
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    iget-object p2, p0, Ll/ub40;->d:Lv/VRecyclerView;

    .line 53
    .line 54
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iget v1, p0, Ll/ub40;->e:I

    .line 59
    .line 60
    if-lt v0, v1, :cond_1

    .line 61
    .line 62
    move v2, v3

    .line 63
    :cond_1
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    :cond_2
    iget-boolean p2, p0, Ll/ub40;->j:Z

    .line 67
    .line 68
    if-eqz p2, :cond_3

    .line 69
    .line 70
    iget-object p0, p0, Ll/ub40;->k:Ljava/util/List;

    .line 71
    .line 72
    invoke-interface {p0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 73
    .line 74
    .line 75
    :cond_3
    return-void
.end method

.method public final M(Ll/g90;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ub40;->w(Ll/g90;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final N()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ub40;->b:Lv/VSearchBar;

    .line 2
    .line 3
    new-instance v1, Ll/ub40$b;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/ub40$b;-><init>(Ll/ub40;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lv/VSearchBar;->d(Landroid/text/TextWatcher;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ub40;->h:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/lb40;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ub40;->s(Ll/lb40;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ub40;->q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {}, Ll/j4h;->h()Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    iget-object p2, p0, Ll/ub40;->a:Lv/VMenuBar;

    .line 12
    .line 13
    sget v0, Ll/lbc0;->m:I

    .line 14
    .line 15
    invoke-virtual {p2, v0}, Lv/VMenuBar;->setLeftImage(I)V

    .line 16
    .line 17
    .line 18
    iget-object p2, p0, Ll/ub40;->a:Lv/VMenuBar;

    .line 19
    .line 20
    iget-object v0, p0, Ll/ub40;->h:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sget v1, Ll/k9c0;->g:I

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    invoke-virtual {p2, v0}, Lv/VMenuBar;->setCenterTextColor(I)V

    .line 33
    .line 34
    .line 35
    iget-object p2, p0, Ll/ub40;->b:Lv/VSearchBar;

    .line 36
    .line 37
    iget-object v0, p0, Ll/ub40;->h:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sget v1, Ll/k9c0;->h:I

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    invoke-virtual {p2, v0}, Lv/VSearchBar;->setEditTextHintColor(I)V

    .line 50
    .line 51
    .line 52
    iget-object p2, p0, Ll/ub40;->b:Lv/VSearchBar;

    .line 53
    .line 54
    sget v0, Ll/lbc0;->n:I

    .line 55
    .line 56
    invoke-virtual {p2, v0}, Lv/VSearchBar;->setLeftImageRes(I)V

    .line 57
    .line 58
    .line 59
    :cond_0
    invoke-virtual {p0}, Ll/ub40;->N()V

    .line 60
    .line 61
    .line 62
    iget-object p2, p0, Ll/ub40;->b:Lv/VSearchBar;

    .line 63
    .line 64
    new-instance v0, Ll/mb40;

    .line 65
    .line 66
    invoke-direct {v0, p0}, Ll/mb40;-><init>(Ll/ub40;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p2, v0}, Lv/VSearchBar;->setCancelListener(Landroid/view/View$OnClickListener;)V

    .line 70
    .line 71
    .line 72
    iget-object p2, p0, Ll/ub40;->b:Lv/VSearchBar;

    .line 73
    .line 74
    new-instance v0, Ll/nb40;

    .line 75
    .line 76
    invoke-direct {v0, p0}, Ll/nb40;-><init>(Ll/ub40;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p2, v0}, Lv/VSearchBar;->setFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 80
    .line 81
    .line 82
    iget-object p2, p0, Ll/ub40;->a:Lv/VMenuBar;

    .line 83
    .line 84
    new-instance v0, Ll/ob40;

    .line 85
    .line 86
    invoke-direct {v0, p0}, Ll/ob40;-><init>(Ll/ub40;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p2, v0}, Lv/VMenuBar;->setLeftRegionClick(Landroid/view/View$OnClickListener;)V

    .line 90
    .line 91
    .line 92
    return-object p1
.end method

.method public q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/vb40;->b(Ll/ub40;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public s(Ll/lb40;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ub40;->i:Ll/lb40;

    .line 2
    .line 3
    return-void
.end method

.method public u()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ub40;->f:Ll/l90;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Ll/ub40;->z()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ll/ub40;->g:Ll/j90;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    new-instance v0, Ll/j90;

    .line 14
    .line 15
    iget-object v2, p0, Ll/ub40;->h:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;

    .line 16
    .line 17
    iget-object v3, p0, Ll/ub40;->i:Ll/lb40;

    .line 18
    .line 19
    iget-object v3, v3, Ll/lb40;->c:Ljava/lang/String;

    .line 20
    .line 21
    sget-object v4, Ll/fph;->K:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-nez v3, :cond_1

    .line 28
    .line 29
    iget-object v3, p0, Ll/ub40;->i:Ll/lb40;

    .line 30
    .line 31
    iget-object v3, v3, Ll/lb40;->c:Ljava/lang/String;

    .line 32
    .line 33
    const-string v4, "p_moment_post_guide_pop"

    .line 34
    .line 35
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-nez v3, :cond_1

    .line 40
    .line 41
    move v3, v1

    .line 42
    goto :goto_0

    .line 43
    :cond_1
    const/4 v3, 0x0

    .line 44
    :goto_0
    invoke-direct {v0, v2, v3}, Ll/j90;-><init>(Lcom/p1/mobile/android/app/Act;Z)V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Ll/ub40;->g:Ll/j90;

    .line 48
    .line 49
    new-instance v2, Ll/sb40;

    .line 50
    .line 51
    invoke-direct {v2, p0}, Ll/sb40;-><init>(Ll/ub40;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v2}, Ll/j90;->L(Ljava/lang/Runnable;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/ub40;->g:Ll/j90;

    .line 58
    .line 59
    new-instance v2, Ll/tb40;

    .line 60
    .line 61
    invoke-direct {v2, p0}, Ll/tb40;-><init>(Ll/ub40;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v2}, Ll/j90;->M(Ll/y20;)V

    .line 65
    .line 66
    .line 67
    :cond_2
    invoke-static {}, Ll/cmg;->U()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iget-object v2, p0, Ll/ub40;->i:Ll/lb40;

    .line 72
    .line 73
    if-eqz v0, :cond_3

    .line 74
    .line 75
    invoke-virtual {v2}, Ll/lb40;->k0()V

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_3
    invoke-virtual {v2}, Ll/lb40;->t0()V

    .line 80
    .line 81
    .line 82
    :goto_1
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 83
    .line 84
    iget-object v2, p0, Ll/ub40;->h:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;

    .line 85
    .line 86
    invoke-direct {v0, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 90
    .line 91
    .line 92
    iget-object v1, p0, Ll/ub40;->d:Lv/VRecyclerView;

    .line 93
    .line 94
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Ll/ub40;->d:Lv/VRecyclerView;

    .line 98
    .line 99
    iget-object p0, p0, Ll/ub40;->g:Ll/j90;

    .line 100
    .line 101
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public v()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ub40;->f:Ll/l90;

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
    iget-object p0, p0, Ll/ub40;->f:Ll/l90;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/e3;->destroy()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final w(Ll/g90;)V
    .locals 4

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/os/Bundle;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-eqz v2, :cond_1

    .line 16
    .line 17
    const-string v2, "extra_addressInfo_name"

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/g90;->c()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const-string v2, "extra_addressInfo_address"

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/g90;->a()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    const-string v2, "extra_addressInfo_location"

    .line 36
    .line 37
    invoke-virtual {p1}, Ll/g90;->b()Lcom/p1/mobile/putong/data/DoublePair;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 42
    .line 43
    .line 44
    iget-object v2, p0, Ll/ub40;->i:Ll/lb40;

    .line 45
    .line 46
    iget-object v2, v2, Ll/lb40;->c:Ljava/lang/String;

    .line 47
    .line 48
    sget-object v3, Ll/fph;->K:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-nez v2, :cond_0

    .line 55
    .line 56
    iget-object v2, p0, Ll/ub40;->i:Ll/lb40;

    .line 57
    .line 58
    iget-object v2, v2, Ll/lb40;->c:Ljava/lang/String;

    .line 59
    .line 60
    const-string v3, "p_moment_post_guide_pop"

    .line 61
    .line 62
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    if-eqz v2, :cond_1

    .line 67
    .line 68
    :cond_0
    invoke-static {}, Ll/gi80;->b()Ll/gi80;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-virtual {v2, p1}, Ll/gi80;->c(Ll/g90;)V

    .line 73
    .line 74
    .line 75
    :cond_1
    invoke-virtual {v0, v1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Ll/ub40;->h:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;

    .line 79
    .line 80
    const/4 v1, -0x1

    .line 81
    invoke-virtual {p1, v1, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 82
    .line 83
    .line 84
    iget-object p0, p0, Ll/ub40;->h:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;

    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;->finish()V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public x()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ub40;->b:Lv/VSearchBar;

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
    iget-object v0, p0, Ll/ub40;->b:Lv/VSearchBar;

    .line 10
    .line 11
    invoke-virtual {v0}, Lv/VSearchBar;->clearFocus()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/ub40;->h:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;

    .line 15
    .line 16
    iget-object p0, p0, Ll/ub40;->b:Lv/VSearchBar;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method
