.class public Ll/nxm;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/nxm$d;,
        Ll/nxm$e;
    }
.end annotation


# static fields
.field public static final A:[I

.field public static final z:[I


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Landroid/widget/FrameLayout;

.field public c:Landroid/widget/LinearLayout;

.field public d:Landroid/widget/LinearLayout;

.field public e:Ll/pej0;

.field public final f:Lcom/p1/mobile/android/app/Act;

.field public g:Ljava/lang/String;

.field public h:Ll/l4g0;

.field public i:Ll/x20;

.field public j:Ll/x20;

.field public k:Z

.field public l:Ll/qxm;

.field public m:Ll/exm;

.field public n:Ll/uxm;

.field public o:Ll/a30;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a30<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public p:Ll/kcg0;

.field public q:Ll/kcg0;

.field public r:Z

.field public s:Lcom/p1/mobile/putong/data/User;

.field public t:Lcom/p1/mobile/putong/core/data/Privilege;

.field public u:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public final v:Landroid/content/DialogInterface$OnDismissListener;

.field public final w:Landroid/content/DialogInterface$OnCancelListener;

.field public final x:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public final y:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x5

    .line 3
    const/16 v2, 0xa

    .line 4
    .line 5
    filled-new-array {v0, v1, v2}, [I

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sput-object v1, Ll/nxm;->z:[I

    .line 10
    .line 11
    const/16 v1, 0x14

    .line 12
    .line 13
    const/16 v3, 0x32

    .line 14
    .line 15
    filled-new-array {v0, v2, v1, v3}, [I

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sput-object v0, Ll/nxm;->A:[I

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/nxm;->k:Z

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_INSTANT_CHAT:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    iput-object v0, p0, Ll/nxm;->u:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    new-instance v0, Ll/nxm$a;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/nxm$a;-><init>(Ll/nxm;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/nxm;->v:Landroid/content/DialogInterface$OnDismissListener;

    .line 17
    .line 18
    new-instance v0, Ll/nxm$b;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/nxm$b;-><init>(Ll/nxm;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/nxm;->w:Landroid/content/DialogInterface$OnCancelListener;

    .line 24
    .line 25
    new-instance v0, Ll/lxm;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Ll/lxm;-><init>(Ll/nxm;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/nxm;->x:Ll/y20;

    .line 31
    .line 32
    new-instance v0, Ll/mxm;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Ll/mxm;-><init>(Ll/nxm;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Ll/nxm;->y:Ll/z20;

    .line 38
    .line 39
    iput-object p1, p0, Ll/nxm;->f:Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    return-void
.end method

.method public static synthetic a(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic b(Ll/nxm;Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nxm;->v(Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Ll/nxm;Lcom/p1/mobile/putong/core/ui/purchase/d;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nxm;->u(Lcom/p1/mobile/putong/core/ui/purchase/d;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic d(Ljava/util/List;Lcom/p1/mobile/putong/data/Envelope;)Ll/pf60;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e(Ll/nxm;Lcom/p1/mobile/putong/core/data/ProductCategory;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nxm;->w(Lcom/p1/mobile/putong/core/data/ProductCategory;Ll/pf60;)V

    return-void
.end method

.method public static synthetic f([ILcom/p1/mobile/putong/core/ui/purchase/d;)Ljava/lang/Boolean;
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->w()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    array-length v0, p0

    .line 15
    const/4 v1, 0x0

    .line 16
    :goto_0
    if-ge v1, v0, :cond_2

    .line 17
    .line 18
    aget v2, p0, v1

    .line 19
    .line 20
    if-ne v2, p1, :cond_1

    .line 21
    .line 22
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_2
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 29
    .line 30
    return-object p0
.end method

.method public static synthetic g(Ll/nxm;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nxm;->t(Ljava/lang/Integer;)V

    return-void
.end method

.method public static bridge synthetic h(Ll/nxm;)Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nxm;->i:Ll/x20;

    return-object p0
.end method

.method public static bridge synthetic i(Ll/nxm;)Landroid/content/DialogInterface$OnCancelListener;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nxm;->w:Landroid/content/DialogInterface$OnCancelListener;

    return-object p0
.end method

.method public static bridge synthetic j(Ll/nxm;)Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nxm;->j:Ll/x20;

    return-object p0
.end method

.method public static bridge synthetic k(Ll/nxm;)Landroid/content/DialogInterface$OnDismissListener;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nxm;->v:Landroid/content/DialogInterface$OnDismissListener;

    return-object p0
.end method

.method public static bridge synthetic l(Ll/nxm;)Ll/l4g0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nxm;->h:Ll/l4g0;

    return-object p0
.end method

.method public static bridge synthetic m(Ll/nxm;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nxm;->D(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic n(Ll/nxm;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nxm;->J()V

    return-void
.end method


# virtual methods
.method public final A()V
    .locals 5

    .line 1
    new-instance v0, Ll/qxm;

    .line 2
    .line 3
    iget-object v1, p0, Ll/nxm;->f:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/qxm;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ll/nxm;->l:Ll/qxm;

    .line 9
    .line 10
    iget-object v1, p0, Ll/nxm;->f:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    iget-object v2, p0, Ll/nxm;->b:Landroid/widget/FrameLayout;

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2}, Ll/qxm;->c(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    iget-object v1, p0, Ll/nxm;->l:Ll/qxm;

    .line 25
    .line 26
    iget-object v2, p0, Ll/nxm;->x:Ll/y20;

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Ll/qxm;->g(Ll/y20;)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Ll/nxm;->l:Ll/qxm;

    .line 32
    .line 33
    iget-object v2, p0, Ll/nxm;->t:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 34
    .line 35
    iput-object v2, v1, Ll/qxm;->i:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 36
    .line 37
    iget-object v2, p0, Ll/nxm;->f:Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    iget-object v3, p0, Ll/nxm;->s:Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/nxm;->s()Z

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    invoke-virtual {v1, v2, v3, v4}, Ll/qxm;->e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)V

    .line 46
    .line 47
    .line 48
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 49
    .line 50
    const/4 v2, -0x1

    .line 51
    const/4 v3, -0x2

    .line 52
    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Ll/nxm;->b:Landroid/widget/FrameLayout;

    .line 56
    .line 57
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void
.end method

.method public final B()V
    .locals 4

    .line 1
    const-string v0, "tttInstantChat"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/putong/core/api/CoreProduct;->z5(Lcom/p1/mobile/putong/core/data/ProductCategory;Z)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    new-instance v2, Ll/gxm;

    .line 17
    .line 18
    invoke-direct {v2}, Ll/gxm;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    new-instance v2, Ll/hxm;

    .line 26
    .line 27
    invoke-direct {v2, p0}, Ll/hxm;-><init>(Ll/nxm;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->P1:Ll/e59;

    .line 37
    .line 38
    invoke-virtual {v2}, Ll/e59;->h3()Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    new-instance v3, Ll/ixm;

    .line 43
    .line 44
    invoke-direct {v3}, Ll/ixm;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-static {v1, v2, v3}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    new-instance v2, Ll/jxm;

    .line 60
    .line 61
    invoke-direct {v2, p0, v0}, Ll/jxm;-><init>(Ll/nxm;Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iput-object v0, p0, Ll/nxm;->p:Ll/kcg0;

    .line 73
    .line 74
    return-void
.end method

.method public final C()V
    .locals 4

    .line 1
    new-instance v0, Ll/uxm;

    .line 2
    .line 3
    iget-object v1, p0, Ll/nxm;->f:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    iget-object v2, p0, Ll/nxm;->u:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/uxm;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/nxm;->n:Ll/uxm;

    .line 11
    .line 12
    iget-object v1, p0, Ll/nxm;->c:Landroid/widget/LinearLayout;

    .line 13
    .line 14
    iget-boolean v2, p0, Ll/nxm;->r:Z

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2}, Ll/uxm;->b(Landroid/view/ViewGroup;Z)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 27
    .line 28
    const/4 v2, -0x1

    .line 29
    const/4 v3, -0x2

    .line 30
    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/nxm;->c:Landroid/widget/LinearLayout;

    .line 34
    .line 35
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public final D(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nxm;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public E(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nxm;->i:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public F(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nxm;->j:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public G(Ll/a30;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a30<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/nxm;->o:Ll/a30;

    .line 2
    .line 3
    return-void
.end method

.method public H(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/nxm;->k:Z

    .line 2
    .line 3
    return-void
.end method

.method public I(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nxm;->s:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-void
.end method

.method public final J()V
    .locals 3

    .line 1
    new-instance v0, Ll/pej0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/nxm;->f:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    sget v2, Ll/dgc0;->g:I

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/pej0;-><init>(Landroid/content/Context;I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/nxm;->e:Ll/pej0;

    .line 11
    .line 12
    sget-object v1, Ll/g6e;->c:Lcom/p1/mobile/android/app/Dialog$f;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/pej0;->u(Lcom/p1/mobile/android/app/Dialog$f;)V

    .line 15
    .line 16
    .line 17
    sget v0, Ll/rec0;->g3:I

    .line 18
    .line 19
    iget-object v1, p0, Ll/nxm;->f:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-virtual {v1, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0, v0}, Ll/nxm;->o(Landroid/view/View;)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Ll/nxm;->e:Ll/pej0;

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 36
    .line 37
    .line 38
    new-instance v0, Ll/nxm$d;

    .line 39
    .line 40
    invoke-direct {v0, p0}, Ll/nxm$d;-><init>(Ll/nxm;)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Ll/nxm;->e:Ll/pej0;

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Ll/nxm;->e:Ll/pej0;

    .line 49
    .line 50
    invoke-virtual {v1, v0}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ll/nxm;->s()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    iput-boolean v0, p0, Ll/nxm;->r:Z

    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const-string v1, "p_intl_instantmatch_iap_view"

    .line 68
    .line 69
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iput-object v0, p0, Ll/nxm;->h:Ll/l4g0;

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/nxm;->y()V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ll/nxm;->e:Ll/pej0;

    .line 79
    .line 80
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Ll/nxm;->B()V

    .line 84
    .line 85
    .line 86
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 87
    .line 88
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 89
    .line 90
    invoke-virtual {p0}, Ll/joa;->v4()Lrx/c;

    .line 91
    .line 92
    .line 93
    sget-object p0, Ll/x95;->INSTANCE:Ll/x95;

    .line 94
    .line 95
    const-string v0, "Purchase Page(Instant Match)"

    .line 96
    .line 97
    invoke-virtual {p0, v0, v2}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public final K(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/nxm;->h:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public L()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nxm;->p:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/nxm;->p:Ll/kcg0;

    .line 11
    .line 12
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Ll/nxm;->p:Ll/kcg0;

    .line 19
    .line 20
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Ll/nxm;->p:Ll/kcg0;

    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Ll/nxm;->q:Ll/kcg0;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Ll/nxm;->q:Ll/kcg0;

    .line 34
    .line 35
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    iget-object v0, p0, Ll/nxm;->q:Ll/kcg0;

    .line 42
    .line 43
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 44
    .line 45
    .line 46
    iput-object v1, p0, Ll/nxm;->q:Ll/kcg0;

    .line 47
    .line 48
    :cond_1
    iget-object v0, p0, Ll/nxm;->n:Ll/uxm;

    .line 49
    .line 50
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    iget-object p0, p0, Ll/nxm;->n:Ll/uxm;

    .line 57
    .line 58
    invoke-virtual {p0}, Ll/uxm;->c()V

    .line 59
    .line 60
    .line 61
    :cond_2
    return-void
.end method

.method public final o(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/oxm;->a(Ll/nxm;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final p()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nxm;->e:Ll/pej0;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    const v1, 0x1020002

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v1, Ll/fdc0;->y:I

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Landroid/widget/FrameLayout;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const/4 v1, 0x3

    .line 33
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Ll/nxm;->a:Landroid/widget/LinearLayout;

    .line 37
    .line 38
    invoke-virtual {v1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    new-instance v2, Ll/nxm$c;

    .line 43
    .line 44
    invoke-direct {v2, p0, v0}, Ll/nxm$c;-><init>(Ll/nxm;Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    return-void
.end method

.method public final q(Ljava/util/List;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/joa;->D3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/nxm;->A:[I

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object p0, Ll/nxm;->z:[I

    .line 11
    .line 12
    :goto_0
    new-instance v0, Ll/kxm;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Ll/kxm;-><init>([I)V

    .line 15
    .line 16
    .line 17
    invoke-static {p1, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public r()Ll/pej0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nxm;->e:Ll/pej0;

    .line 2
    .line 3
    return-object p0
.end method

.method public s()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/bnl0;->w0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 v0, 0x500

    .line 6
    .line 7
    if-gt p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public final synthetic t(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nxm;->e:Ll/pej0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_4

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, -0x1

    .line 14
    if-ne v0, v1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/nxm;->e:Ll/pej0;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/app/Dialog;->hide()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const/4 v1, 0x2

    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-ne v0, v1, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    const/4 v0, 0x1

    .line 41
    if-ne p1, v0, :cond_4

    .line 42
    .line 43
    iget-object p0, p0, Ll/nxm;->e:Ll/pej0;

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_2
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-ne p1, v1, :cond_3

    .line 54
    .line 55
    const/4 p1, 0x0

    .line 56
    invoke-virtual {p0, p1}, Ll/nxm;->H(Z)V

    .line 57
    .line 58
    .line 59
    :cond_3
    iget-object p0, p0, Ll/nxm;->e:Ll/pej0;

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 62
    .line 63
    .line 64
    :cond_4
    return-void
.end method

.method public final synthetic u(Lcom/p1/mobile/putong/core/ui/purchase/d;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/nxm;->m:Ll/exm;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/nxm;->m:Ll/exm;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/exm;->m(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic v(Ljava/util/List;)Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/nxm;->f:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-interface {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->g5(Landroid/content/Context;Ljava/util/List;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic w(Lcom/p1/mobile/putong/core/data/ProductCategory;Ll/pf60;)V
    .locals 0

    .line 1
    iget-object p2, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p2, Ljava/util/List;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/nxm;->x(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/nxm;->p()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final x(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/ProductCategory;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/zry;->z(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ll/jzl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/nxm;->f:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    iget-object v2, p0, Ll/nxm;->u:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    invoke-interface {v0, v1, v2, p1, p2}, Ll/jzl;->a(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    goto :goto_2

    .line 20
    :cond_0
    invoke-virtual {p0, p1}, Ll/nxm;->q(Ljava/util/List;)Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    if-eqz p2, :cond_1

    .line 29
    .line 30
    goto :goto_2

    .line 31
    :cond_1
    invoke-virtual {p0, p1}, Ll/nxm;->K(Ljava/util/List;)V

    .line 32
    .line 33
    .line 34
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    const/4 v0, 0x1

    .line 39
    sub-int/2addr p2, v0

    .line 40
    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    const/4 v1, 0x0

    .line 45
    move v2, v1

    .line 46
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    if-ge v2, v3, :cond_3

    .line 51
    .line 52
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    check-cast v3, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 57
    .line 58
    if-ne v2, p2, :cond_2

    .line 59
    .line 60
    move v4, v0

    .line 61
    goto :goto_1

    .line 62
    :cond_2
    move v4, v1

    .line 63
    :goto_1
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 64
    .line 65
    .line 66
    add-int/lit8 v2, v2, 0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_3
    iget-object p2, p0, Ll/nxm;->m:Ll/exm;

    .line 70
    .line 71
    invoke-virtual {p2}, Ll/exm;->g()V

    .line 72
    .line 73
    .line 74
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    if-eqz p2, :cond_4

    .line 79
    .line 80
    iget-object p2, p0, Ll/nxm;->n:Ll/uxm;

    .line 81
    .line 82
    iget-object v0, p0, Ll/nxm;->y:Ll/z20;

    .line 83
    .line 84
    iget-object p0, p0, Ll/nxm;->x:Ll/y20;

    .line 85
    .line 86
    invoke-virtual {p2, p1, v0, p0}, Ll/uxm;->d(Ljava/util/List;Ll/z20;Ll/y20;)V

    .line 87
    .line 88
    .line 89
    :cond_4
    :goto_2
    return-void
.end method

.method public final y()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nxm;->A()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/nxm;->C()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/nxm;->z()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final z()V
    .locals 4

    .line 1
    new-instance v0, Ll/exm;

    .line 2
    .line 3
    iget-object v1, p0, Ll/nxm;->f:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    iget-object v2, p0, Ll/nxm;->u:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/exm;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/nxm;->m:Ll/exm;

    .line 11
    .line 12
    iget-object v1, p0, Ll/nxm;->d:Landroid/widget/LinearLayout;

    .line 13
    .line 14
    iget-boolean v2, p0, Ll/nxm;->r:Z

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2}, Ll/exm;->e(Landroid/view/ViewGroup;Z)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    iget-object v1, p0, Ll/nxm;->m:Ll/exm;

    .line 27
    .line 28
    iget-object v2, p0, Ll/nxm;->x:Ll/y20;

    .line 29
    .line 30
    iget-object v3, p0, Ll/nxm;->i:Ll/x20;

    .line 31
    .line 32
    invoke-virtual {v1, v2, v3}, Ll/exm;->n(Ll/y20;Ll/x20;)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Ll/nxm;->m:Ll/exm;

    .line 36
    .line 37
    iget-object v2, p0, Ll/nxm;->g:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Ll/exm;->p(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 43
    .line 44
    const/4 v2, -0x1

    .line 45
    const/4 v3, -0x2

    .line 46
    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 47
    .line 48
    .line 49
    iget-object v2, p0, Ll/nxm;->m:Ll/exm;

    .line 50
    .line 51
    iget-object v3, p0, Ll/nxm;->o:Ll/a30;

    .line 52
    .line 53
    invoke-virtual {v2, v3}, Ll/exm;->q(Ll/a30;)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Ll/nxm;->d:Landroid/widget/LinearLayout;

    .line 57
    .line 58
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 59
    .line 60
    .line 61
    :cond_0
    return-void
.end method
