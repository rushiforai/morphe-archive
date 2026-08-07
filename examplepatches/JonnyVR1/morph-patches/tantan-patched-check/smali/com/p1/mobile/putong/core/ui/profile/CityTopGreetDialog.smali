.class public Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;
.super Ll/pej0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog$c;
    }
.end annotation


# instance fields
.field public A:Ll/kcg0;

.field public B:Lcom/p1/mobile/putong/core/data/CityCentreConfig;

.field public C:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public D:Z

.field public E:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

.field public f:Landroid/widget/FrameLayout;

.field public g:Landroid/view/View;

.field public h:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public i:Landroid/widget/TextView;

.field public j:Lv/VEditText;

.field public k:Lv/VFrame;

.field public l:Lv/VDraweeView;

.field public m:Lv/VImage;

.field public n:Lv/VFrame;

.field public o:Lv/VDraweeView;

.field public p:Lv/VImage;

.field public q:Lv/VIcon;

.field public r:Lv/VLinear;

.field public s:Lv/VText;

.field public t:Ll/l4g0;

.field public u:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

.field public v:I

.field public w:I

.field public x:Lcom/p1/mobile/android/app/Act;

.field public y:Ljava/lang/String;

.field public z:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/pej0;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->C:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog$b;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog$b;-><init>(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->E:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 17
    .line 18
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->f0(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->l0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->v0()V

    return-void
.end method

.method private C0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->z:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic D(Ll/x20;)V
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
    invoke-interface {p0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static D0(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "android.permission.READ_EXTERNAL_STORAGE"

    .line 6
    .line 7
    const-string v2, "android.permission.WRITE_EXTERNAL_STORAGE"

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
    new-instance v1, Ll/w65;

    .line 23
    .line 24
    invoke-direct {v1, p1}, Ll/w65;-><init>(Ll/x20;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->o(Ll/x20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->j0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->h0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->m0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic H(Ll/y20;IILandroid/content/Intent;)Z
    .locals 1

    .line 1
    const/4 p1, -0x1

    .line 2
    if-ne p2, p1, :cond_0

    .line 3
    .line 4
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p3, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    if-ne p2, p1, :cond_1

    .line 22
    .line 23
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_1
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->k0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic J(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->n0()V

    return-void
.end method

.method public static synthetic K(Ljava/util/List;Ll/bkj0;)Ll/bkj0;
    .locals 2

    .line 1
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Ljava/util/List;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    :goto_0
    iget-object v1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v1, Ljava/lang/CharSequence;

    .line 20
    .line 21
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_1

    .line 26
    .line 27
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast p1, Ljava/lang/String;

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_1
    const-string p1, ""

    .line 33
    .line 34
    :goto_1
    invoke-static {p0, v0, p1}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public static synthetic L(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->Z(Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic M(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->s0(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic N(Landroid/view/View;)V
    .locals 1

    .line 1
    sget v0, Ll/qa00;->K:I

    .line 2
    .line 3
    neg-int v0, v0

    .line 4
    int-to-float v0, v0

    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic O(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->r0(Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method

.method public static synthetic P(Ll/bkj0;)Lrx/c;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/List;

    .line 4
    .line 5
    const-string v1, "chat"

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/data/UploadSource;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UploadSource;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const-string v2, "greeting"

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-static {v0, v2, v3, v1}, Ll/yb5;->K(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/UploadSource;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/u65;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/u65;-><init>(Ll/bkj0;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->p0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->i0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;Ljava/lang/String;Ll/bkj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->q0(Ljava/lang/String;Ll/bkj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic T(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->E0()V

    return-void
.end method

.method public static synthetic U(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->o0(Ljava/util/List;)V

    return-void
.end method

.method public static bridge synthetic V(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->u:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    return-object p0
.end method

.method public static bridge synthetic W(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;Ljava/lang/String;Ll/l4g0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->B0(Ljava/lang/String;Ll/l4g0;)V

    return-void
.end method

.method public static bridge synthetic X(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->C0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method private Z(Ljava/util/List;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)",
            "Lrx/c<",
            "Ll/bkj0<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    instance-of v1, v1, Lcom/p1/mobile/putong/data/Picture;

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    sget-object v1, Ll/uqb0;->R:Ll/s5m;

    .line 17
    .line 18
    invoke-interface {v1}, Ll/s5m;->c()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    sget-object p0, Ll/uqb0;->R:Ll/s5m;

    .line 25
    .line 26
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-interface {p0, v0}, Ll/s5m;->b(Ljava/lang/String;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    new-instance v0, Ll/z65;

    .line 47
    .line 48
    invoke-direct {v0, p1}, Ll/z65;-><init>(Ljava/util/List;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0

    .line 56
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog$2;

    .line 57
    .line 58
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog$2;-><init>(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;)V

    .line 59
    .line 60
    .line 61
    const-string p0, ""

    .line 62
    .line 63
    invoke-static {p1, v0, p0}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    return-object p0
.end method

.method private static d0()Z
    .locals 2

    .line 1
    const-string v0, "android.permission.READ_EXTERNAL_STORAGE"

    .line 2
    .line 3
    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method private f0(Landroid/content/Context;)V
    .locals 1

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->x:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->Y(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ll/h39;->i()Lcom/p1/mobile/putong/core/data/CityCentreConfig;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->B:Lcom/p1/mobile/putong/core/data/CityCentreConfig;

    .line 23
    .line 24
    return-void
.end method

.method private g0()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->z:Lcom/p1/mobile/putong/data/User;

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
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->o:Lv/VDraweeView;

    .line 12
    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->z:Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profile480()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    const/high16 v3, 0x42a00000    # 80.0f

    .line 24
    .line 25
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    invoke-virtual {v0, v1, v2, v4, v3}, Ll/fsb0;->H0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->q:Lv/VIcon;

    .line 37
    .line 38
    new-instance v1, Ll/y65;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/y65;-><init>(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->h:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 47
    .line 48
    new-instance v1, Ll/c75;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/c75;-><init>(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->r:Lv/VLinear;

    .line 57
    .line 58
    new-instance v1, Ll/d75;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Ll/d75;-><init>(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->l:Lv/VDraweeView;

    .line 67
    .line 68
    new-instance v1, Ll/e75;

    .line 69
    .line 70
    invoke-direct {v1, p0}, Ll/e75;-><init>(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->m:Lv/VImage;

    .line 77
    .line 78
    new-instance v1, Ll/f75;

    .line 79
    .line 80
    invoke-direct {v1, p0}, Ll/f75;-><init>(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;)V

    .line 81
    .line 82
    .line 83
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->i:Landroid/widget/TextView;

    .line 87
    .line 88
    new-instance v1, Ll/g75;

    .line 89
    .line 90
    invoke-direct {v1, p0}, Ll/g75;-><init>(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;)V

    .line 91
    .line 92
    .line 93
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->s:Lv/VText;

    .line 97
    .line 98
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->j:Lv/VEditText;

    .line 104
    .line 105
    const/16 v1, 0x32

    .line 106
    .line 107
    invoke-virtual {v0, v1}, Lv/VEditText;->setMaxLength(I)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->j:Lv/VEditText;

    .line 111
    .line 112
    new-instance v1, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog$a;

    .line 113
    .line 114
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog$a;-><init>(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->u0()V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method private synthetic h0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic i0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->e0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic j0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->x0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic k0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->x0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic l0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->a0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic m0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->w0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic x(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->t0(Landroid/content/DialogInterface;)V

    return-void
.end method

.method private x0()V
    .locals 2

    .line 1
    const-string v0, "e_greet_to_city_c_pic"

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->b0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->d0()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    invoke-static {}, Ll/wzx;->k()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->x:Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    new-instance v1, Ll/h75;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/h75;-><init>(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->D0(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    new-instance v0, Ll/i75;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Ll/i75;-><init>(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->F0(Ll/y20;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->x0()V

    return-void
.end method

.method public static synthetic z(Ll/bkj0;Ljava/util/List;)Ll/bkj0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/List;

    .line 4
    .line 5
    iget-object p0, p0, Ll/bkj0;->c:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p1, v0, p0}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private z0(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "picture"

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 12
    .line 13
    iput-object p2, v0, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-nez p2, :cond_0

    .line 20
    .line 21
    iput-object p3, v0, Lcom/p1/mobile/putong/core/data/Message;->riskTags:Ljava/util/List;

    .line 22
    .line 23
    :cond_0
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-nez p2, :cond_1

    .line 28
    .line 29
    iput-object p4, v0, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;

    .line 30
    .line 31
    :cond_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->A0(Ljava/lang/String;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    new-instance p2, Ll/x65;

    .line 36
    .line 37
    invoke-direct {p2, p0, v0}, Ll/x65;-><init>(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, p2}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method


# virtual methods
.method public final A0(Ljava/lang/String;)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    .line 4
    move-result-object v3

    .line 5
    const-string v0, "text"

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, v3, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 12
    .line 13
    iput-object p1, v3, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 14
    .line 15
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, p1, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->z:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    const-string p1, "city_c"

    .line 24
    .line 25
    invoke-static {p1}, Lcom/p1/mobile/putong/data/Channel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Channel;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    new-instance v5, Ll/b75;

    .line 30
    .line 31
    invoke-direct {v5, p0}, Ll/b75;-><init>(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;)V

    .line 32
    .line 33
    .line 34
    const/4 v4, 0x0

    .line 35
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/j;->u6(Ljava/lang/String;Lcom/p1/mobile/putong/data/Channel;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ll/x20;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public final B0(Ljava/lang/String;Ll/l4g0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->y:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->t:Ll/l4g0;

    .line 4
    .line 5
    return-void
.end method

.method public final E0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->x:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const-string v0, "\u53d1\u9001\u4e2d..."

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;)Landroid/app/Dialog;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final F0(Ll/y20;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->x:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    const/4 v3, 0x1

    .line 12
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMinPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    const/4 v4, 0x0

    .line 21
    invoke-virtual {v2, v4}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->showPreviewEditBtn(Z)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withImagePickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->x:Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    sget v4, Lcom/p1/mobile/putong/core/R$string;->c9:I

    .line 36
    .line 37
    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withSubmitButtonTitle(Ljava/lang/String;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->needClickPreview(Z)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    const/16 v2, 0xe

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Landroid/content/Intent;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->x:Lcom/p1/mobile/android/app/Act;

    .line 64
    .line 65
    new-instance v2, Ll/a75;

    .line 66
    .line 67
    invoke-direct {v2, p1}, Ll/a75;-><init>(Ll/y20;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(Landroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->x:Lcom/p1/mobile/android/app/Act;

    .line 74
    .line 75
    sget p1, Ll/y7c0;->e:I

    .line 76
    .line 77
    sget v0, Ll/y7c0;->a:I

    .line 78
    .line 79
    invoke-virtual {p0, p1, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public Y(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/k75;->b(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final a0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->n:Lv/VFrame;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->s:Lv/VText;

    .line 8
    .line 9
    const/high16 v2, 0x41b00000    # 22.0f

    .line 10
    .line 11
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-static {v0, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->k:Lv/VFrame;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->r:Lv/VLinear;

    .line 25
    .line 26
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->C:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public b0()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->y:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p0, "p_greet_to_city_c"

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->y:Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method

.method public final c0(Landroid/view/View;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->v:I

    .line 14
    .line 15
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->v:I

    .line 20
    .line 21
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->w:I

    .line 22
    .line 23
    if-ne v2, v0, :cond_0

    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->w:I

    .line 27
    .line 28
    add-int/lit16 v1, v1, -0xc8

    .line 29
    .line 30
    if-ge v0, v1, :cond_1

    .line 31
    .line 32
    new-instance p0, Ll/v65;

    .line 33
    .line 34
    invoke-direct {p0, p1}, Ll/v65;-><init>(Landroid/view/View;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    const/4 p0, 0x0

    .line 42
    invoke-virtual {p1, p0}, Landroid/view/View;->setTranslationY(F)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public e0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->x:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const-string v1, "input_method"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/inputmethod/InputMethodManager;->isActive()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/app/Dialog;->getCurrentFocus()Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/app/Dialog;->getCurrentFocus()Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/app/Dialog;->getCurrentFocus()Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const/4 v1, 0x2

    .line 42
    invoke-virtual {v0, p0, v1}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public final synthetic n0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->f:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->c0(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic o0(Ljava/util/List;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->C:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->C:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->s:Lv/VText;

    .line 12
    .line 13
    const/high16 v0, 0x42400000    # 48.0f

    .line 14
    .line 15
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-static {p1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->r:Lv/VLinear;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->k:Lv/VFrame;

    .line 29
    .line 30
    const/4 v1, 0x1

    .line 31
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->n:Lv/VFrame;

    .line 35
    .line 36
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->l:Lv/VDraweeView;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->C:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 52
    .line 53
    const/high16 v0, 0x42d40000    # 106.0f

    .line 54
    .line 55
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    invoke-virtual {p1, v1, p0, v2, v0}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final synthetic p0(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->x:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 7
    .line 8
    if-eqz v0, :cond_3

    .line 9
    .line 10
    move-object v0, p1

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 12
    .line 13
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 14
    .line 15
    const v1, 0x9c6a

    .line 16
    .line 17
    .line 18
    if-eq v0, v1, :cond_2

    .line 19
    .line 20
    const v1, 0x9c6c

    .line 21
    .line 22
    .line 23
    if-eq v0, v1, :cond_2

    .line 24
    .line 25
    const v1, 0x9c6d

    .line 26
    .line 27
    .line 28
    if-ne v0, v1, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const v1, 0x9c6e

    .line 32
    .line 33
    .line 34
    if-ne v0, v1, :cond_1

    .line 35
    .line 36
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->z:Lcom/p1/mobile/putong/data/User;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/api/g;->ap(Ljava/lang/String;)Lrx/c;

    .line 45
    .line 46
    .line 47
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 48
    .line 49
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/j;->s0:Lrx/subjects/a;

    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->z:Lcom/p1/mobile/putong/data/User;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_1
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_2
    :goto_0
    const-string p0, "\u5bf9\u65b9\u8d26\u53f7\u5f02\u5e38"

    .line 69
    .line 70
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_3
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 75
    .line 76
    if-eqz p0, :cond_8

    .line 77
    .line 78
    move-object p0, p1

    .line 79
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 80
    .line 81
    iget v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 82
    .line 83
    const v1, 0x9d85

    .line 84
    .line 85
    .line 86
    if-eq v0, v1, :cond_7

    .line 87
    .line 88
    const v1, 0x9d93

    .line 89
    .line 90
    .line 91
    if-ne v0, v1, :cond_4

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_4
    invoke-static {p0}, Ll/g39;->e(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eqz v0, :cond_5

    .line 99
    .line 100
    const-string p0, "\u5bf9\u65b9\u540c\u610f\u914d\u5bf9\u540e\u53ef\u53d1\u9001\u6d88\u606f\uff0c\u8bf7\u8010\u5fc3\u7b49\u5f85"

    .line 101
    .line 102
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_5
    invoke-static {p0}, Ll/g39;->d(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-eqz v0, :cond_6

    .line 111
    .line 112
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->message:Ljava/lang/String;

    .line 113
    .line 114
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_6
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :cond_7
    :goto_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 123
    .line 124
    sget p1, Lcom/tantan/core/base/R$string;->o:I

    .line 125
    .line 126
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :cond_8
    instance-of p0, p1, Lcom/p1/mobile/putong/safety/IllegalPictureException;

    .line 135
    .line 136
    if-eqz p0, :cond_9

    .line 137
    .line 138
    const-string p0, "\u7167\u7247\u542b\u6709\u8fdd\u89c4\u5185\u5bb9\uff0c\u8bf7\u66f4\u6362\u540e\u518d\u8bd5"

    .line 139
    .line 140
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :cond_9
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 145
    .line 146
    .line 147
    return-void
.end method

.method public final synthetic q0(Ljava/lang/String;Ll/bkj0;)Lrx/c;
    .locals 2

    .line 1
    iget-object v0, p2, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/List;

    .line 4
    .line 5
    iget-object v1, p2, Ll/bkj0;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Ljava/util/List;

    .line 8
    .line 9
    iget-object p2, p2, Ll/bkj0;->c:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p2, Ljava/lang/String;

    .line 12
    .line 13
    invoke-direct {p0, p1, v0, v1, p2}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->z0(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic r0(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->x:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/j;->s0:Lrx/subjects/a;

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->z:Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    const-string p1, "\u62db\u547c\u5df2\u53d1\u9001\uff0c\u5bf9\u65b9\u56de\u590d\u5373\u53ef\u914d\u5bf9"

    .line 20
    .line 21
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic s0(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)Lrx/c;
    .locals 6

    .line 1
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->D:Z

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->z:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p2, p0, p1, v0}, Lcom/p1/mobile/putong/core/api/g;->Dn(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Sticker;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_0
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, p2, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->z:Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    const-string p0, "city_c"

    .line 28
    .line 29
    invoke-static {p0}, Lcom/p1/mobile/putong/data/Channel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Channel;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    const/4 v4, 0x0

    .line 34
    const/4 v5, 0x0

    .line 35
    move-object v3, p1

    .line 36
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/j;->u6(Ljava/lang/String;Lcom/p1/mobile/putong/data/Channel;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ll/x20;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public show()V
    .locals 3

    return-void

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/vcc0;->E:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/FrameLayout;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/4 v2, -0x1

    .line 17
    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 20
    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->u:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 31
    .line 32
    const/4 v1, 0x3

    .line 33
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->u:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->E:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 41
    .line 42
    .line 43
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->g0()V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->t:Ll/l4g0;

    .line 47
    .line 48
    if-nez v0, :cond_0

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->b0()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const-class v1, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-static {v0, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->t:Ll/l4g0;

    .line 65
    .line 66
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->t:Ll/l4g0;

    .line 67
    .line 68
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 69
    .line 70
    .line 71
    new-instance v0, Ll/n65;

    .line 72
    .line 73
    invoke-direct {v0, p0}, Ll/n65;-><init>(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public final synthetic t0(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->t:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final u0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->f:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/t65;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/t65;-><init>(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final v0()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->D:Z

    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->x:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->z:Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-interface {v0, v1, p0, v2}, Ll/r97;->D4(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final w0()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->j:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const-string v1, "greet_result"

    .line 12
    .line 13
    const-string v2, "e_greet_to_city_c_confirm"

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->j:Lv/VEditText;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const/16 v3, 0xa

    .line 28
    .line 29
    if-ge v0, v3, :cond_0

    .line 30
    .line 31
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    const-string v4, "\u4e3a\u4e86\u8868\u793a\u4ea4\u53cb\u8bda\u610f\uff0c\u62db\u547c\u5185\u5bb9\u4e0d\u80fd\u4f4e\u4e8e%d\u5b57"

    .line 44
    .line 45
    invoke-static {v0, v4, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->b0()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    const/4 v0, 0x3

    .line 57
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    filled-new-array {v0}, [Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-static {v2, p0, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 74
    .line 75
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 76
    .line 77
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    if-eqz v3, :cond_2

    .line 86
    .line 87
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    if-eqz v3, :cond_1

    .line 92
    .line 93
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->startJailedDialogLikeAct()V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isNameFake()Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-eqz v0, :cond_2

    .line 106
    .line 107
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->x:Lcom/p1/mobile/android/app/Act;

    .line 116
    .line 117
    invoke-interface {v0, p0}, Ll/r97;->A(Lcom/p1/mobile/android/app/Act;)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->b0()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->C:Ljava/util/List;

    .line 126
    .line 127
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 128
    .line 129
    .line 130
    move-result v3

    .line 131
    if-eqz v3, :cond_3

    .line 132
    .line 133
    const/4 v3, 0x1

    .line 134
    goto :goto_0

    .line 135
    :cond_3
    const/4 v3, 0x2

    .line 136
    :goto_0
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    invoke-static {v1, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    filled-new-array {v1}, [Ll/pf60;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    invoke-static {v2, v0, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 149
    .line 150
    .line 151
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->A:Ll/kcg0;

    .line 152
    .line 153
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 154
    .line 155
    .line 156
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->j:Lv/VEditText;

    .line 157
    .line 158
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->C:Ljava/util/List;

    .line 167
    .line 168
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->y0(Ljava/lang/String;Ljava/util/List;)Ll/kcg0;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->A:Ll/kcg0;

    .line 173
    .line 174
    return-void
.end method

.method public y0(Ljava/lang/String;Ljava/util/List;)Ll/kcg0;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)",
            "Ll/kcg0;"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;->A0(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    new-instance v0, Ll/i1y;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-direct {v0, p2, v1}, Ll/i1y;-><init>(Ljava/util/List;Z)V

    .line 16
    .line 17
    .line 18
    new-instance p2, Ll/j75;

    .line 19
    .line 20
    invoke-direct {p2, p0}, Ll/j75;-><init>(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, p2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p2, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-virtual {p2}, Lrx/c;->last()Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-static {}, Ll/psd0;->Q()Lrx/c$d;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p2, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    new-instance v0, Ll/o65;

    .line 48
    .line 49
    invoke-direct {v0}, Ll/o65;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p2, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p2, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    new-instance v0, Ll/p65;

    .line 65
    .line 66
    invoke-direct {v0, p0, p1}, Ll/p65;-><init>(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p2, v0}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    :goto_0
    invoke-virtual {p0, p1}, Ll/pej0;->duringCreated(Lrx/c;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    new-instance p2, Ll/q65;

    .line 78
    .line 79
    invoke-direct {p2, p0}, Ll/q65;-><init>(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1, p2}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    new-instance p2, Ll/r65;

    .line 87
    .line 88
    invoke-direct {p2, p0}, Ll/r65;-><init>(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;)V

    .line 89
    .line 90
    .line 91
    new-instance v0, Ll/s65;

    .line 92
    .line 93
    invoke-direct {v0, p0}, Ll/s65;-><init>(Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;)V

    .line 94
    .line 95
    .line 96
    invoke-static {p2, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    return-object p0
.end method
