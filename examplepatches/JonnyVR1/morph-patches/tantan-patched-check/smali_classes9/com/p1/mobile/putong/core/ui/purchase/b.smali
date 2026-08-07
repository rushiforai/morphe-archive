.class public Lcom/p1/mobile/putong/core/ui/purchase/b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/purchase/b$d;
    }
.end annotation


# static fields
.field public static final X:I


# instance fields
.field public A:Ll/t5m;

.field public B:Ll/i2m;

.field public C:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/a690;",
            ">;"
        }
    .end annotation
.end field

.field public D:Landroid/app/Dialog;

.field public E:Ll/x20;

.field public F:Ll/x20;

.field public G:Ll/x20;

.field public H:Ll/x20;

.field public I:Z

.field public J:Ll/kcg0;

.field public K:Ll/kcg0;

.field public L:Ll/kcg0;

.field public M:Ll/l4g0;

.field public N:Z

.field public O:Lcom/p1/mobile/putong/data/Picture$ImageUri;

.field public P:Ljava/lang/String;

.field public Q:Ljava/lang/Object;

.field public R:Z

.field public S:Lcom/p1/mobile/putong/data/PayMethod;

.field public T:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public U:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation
.end field

.field public V:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation
.end field

.field public W:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            ">;"
        }
    .end annotation
.end field

.field public a:Landroid/widget/FrameLayout;

.field public b:Lcom/p1/mobile/putong/core/ui/alifree/AliFreeAutoView;

.field public c:Lv/VScroll_Fill_BottomAligned;

.field public d:Landroid/widget/LinearLayout;

.field public e:Landroid/widget/FrameLayout;

.field public f:Landroid/widget/LinearLayout;

.field public g:Landroid/widget/LinearLayout;

.field public h:Landroid/widget/FrameLayout;

.field public i:Landroid/widget/LinearLayout;

.field public j:Landroid/widget/FrameLayout;

.field public k:Landroid/widget/LinearLayout;

.field public l:Landroid/widget/LinearLayout;

.field public m:Landroid/widget/LinearLayout;

.field public n:Landroid/widget/TextView;

.field public o:Landroid/widget/TextView;

.field public p:Lv/VImage;

.field public q:I

.field public final r:Lcom/p1/mobile/android/app/Act;

.field public final s:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public t:Lcom/p1/mobile/putong/core/data/Privilege;

.field public u:Z

.field public v:Z

.field public w:Ljava/lang/String;

.field public x:Ll/a30;
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

.field public y:Ll/a30;
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

.field public z:Ll/l3m;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "#FEFCF7"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/p1/mobile/putong/core/ui/purchase/b;->X:I

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->I:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->R:Z

    .line 9
    .line 10
    new-instance v0, Ll/k9b0;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/k9b0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/b;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->T:Ll/y20;

    .line 16
    .line 17
    new-instance v0, Ll/v9b0;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/v9b0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/b;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->U:Ll/y20;

    .line 23
    .line 24
    new-instance v0, Ll/dab0;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ll/dab0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/b;)V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->V:Ll/y20;

    .line 30
    .line 31
    new-instance v0, Ll/eab0;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Ll/eab0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/b;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->W:Ll/y20;

    .line 37
    .line 38
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->r:Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 41
    .line 42
    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/core/ui/purchase/b;Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->n0(Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/putong/core/ui/purchase/b;)Ll/i2m;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->B:Ll/i2m;

    return-object p0
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/putong/core/ui/purchase/b;)Lcom/p1/mobile/putong/core/data/PurchaseType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    return-object p0
.end method

.method public static bridge synthetic D(Lcom/p1/mobile/putong/core/ui/purchase/b;)Ll/t5m;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->A:Ll/t5m;

    return-object p0
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/putong/core/ui/purchase/b;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->x0(I)V

    return-void
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/putong/core/ui/purchase/b;Lcom/p1/mobile/putong/core/data/Privilege;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/b;->y0(Lcom/p1/mobile/putong/core/data/Privilege;Z)V

    return-void
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/putong/core/ui/purchase/b;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->z0(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic H(Lcom/p1/mobile/putong/core/ui/purchase/b;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->A0(Ll/x20;)V

    return-void
.end method

.method public static bridge synthetic I(Lcom/p1/mobile/putong/core/ui/purchase/b;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->B0(Ll/x20;)V

    return-void
.end method

.method public static bridge synthetic J(Lcom/p1/mobile/putong/core/ui/purchase/b;Ll/a30;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->D0(Ll/a30;)V

    return-void
.end method

.method public static bridge synthetic K(Lcom/p1/mobile/putong/core/ui/purchase/b;Ll/a30;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->E0(Ll/a30;)V

    return-void
.end method

.method public static bridge synthetic L(Lcom/p1/mobile/putong/core/ui/purchase/b;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->I0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/purchase/b;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->f0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/purchase/b;ZZ)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/b;->k0(ZZ)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/purchase/b;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->Y(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic e(Ljava/util/List;)Ljava/lang/Boolean;
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

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/purchase/b;Lcom/google/common/base/Optional;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->e0(Lcom/google/common/base/Optional;)V

    return-void
.end method

.method public static synthetic g(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 4
    .line 5
    const/4 v0, 0x3

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/v5b0;->n(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic j(Ljava/util/List;Ljava/util/List;)Ljava/util/List;
    .locals 3

    .line 1
    if-eqz p0, :cond_2

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    if-eqz p1, :cond_2

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_2

    .line 16
    .line 17
    new-instance v0, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 20
    .line 21
    .line 22
    new-instance p0, Ll/z9b0;

    .line 23
    .line 24
    invoke-direct {p0}, Ll/z9b0;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {p1, p0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 32
    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    const/4 p1, 0x0

    .line 36
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-ge p1, v1, :cond_1

    .line 41
    .line 42
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    if-eqz v1, :cond_0

    .line 47
    .line 48
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 53
    .line 54
    iget v1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 55
    .line 56
    const/4 v2, 0x3

    .line 57
    if-ne v1, v2, :cond_0

    .line 58
    .line 59
    invoke-interface {v0, p1, p0}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    return-object v0

    .line 63
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    return-object v0

    .line 67
    :cond_2
    return-object p0
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/core/ui/purchase/b;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/b;->o0(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/core/ui/purchase/b;Lcom/p1/mobile/putong/data/PayMethod;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->j0(Lcom/p1/mobile/putong/data/PayMethod;)V

    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/core/ui/purchase/b;Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/purchase/b;->a0(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/core/ui/purchase/b;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->m0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/core/ui/purchase/b;Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->p0(Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->K5()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/core/ui/purchase/b;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/b;->q0(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/core/ui/purchase/b;Lcom/p1/mobile/android/app/Dialog;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->b0(Lcom/p1/mobile/android/app/Dialog;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/ui/purchase/b;Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->i0(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    return-void
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/core/ui/purchase/b;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->g0(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/core/ui/purchase/b;Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->h0(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/core/ui/purchase/b;Lcom/google/common/base/Optional;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->c0(Lcom/google/common/base/Optional;)V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/core/ui/purchase/b;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->d0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic x(Lcom/p1/mobile/putong/core/ui/purchase/b;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->l0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/core/ui/purchase/b;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->Z(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/core/ui/purchase/b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/b;->X()V

    return-void
.end method


# virtual methods
.method public final A0(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->F:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public final B0(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->E:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public C0(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->H:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public final D0(Ll/a30;)V
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->y:Ll/a30;

    .line 2
    .line 3
    return-void
.end method

.method public final E0(Ll/a30;)V
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->x:Ll/a30;

    .line 2
    .line 3
    return-void
.end method

.method public F0(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->G:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public G0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->O:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 2
    .line 3
    return-void
.end method

.method public H0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->P:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final I0(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/a690;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->C:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public J0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->I:Z

    .line 2
    .line 3
    return-void
.end method

.method public K0(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->Q:Ljava/lang/Object;

    .line 2
    .line 3
    return-void
.end method

.method public L0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->r:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    if-eqz v0, :cond_7

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_1

    .line 12
    .line 13
    :cond_0
    new-instance v0, Ll/l4g0;

    .line 14
    .line 15
    new-instance v1, Lcom/p1/mobile/putong/core/ui/purchase/b$a;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/purchase/b$a;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/b;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {v0, v1}, Ll/l4g0;-><init>(Ll/e6m;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->M:Ll/l4g0;

    .line 24
    .line 25
    invoke-static {}, Ll/vnb;->q1()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->v:Z

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/b;->M0()V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->jh()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->D:Landroid/app/Dialog;

    .line 49
    .line 50
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_2

    .line 59
    .line 60
    sget v0, Ll/jbc0;->I9:I

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 63
    .line 64
    invoke-static {v1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-eqz v1, :cond_1

    .line 69
    .line 70
    sget v0, Ll/jbc0;->m4:I

    .line 71
    .line 72
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->c:Lv/VScroll_Fill_BottomAligned;

    .line 73
    .line 74
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->D:Landroid/app/Dialog;

    .line 78
    .line 79
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    sget v1, Ll/jbc0;->P9:I

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/b;->Q()V

    .line 89
    .line 90
    .line 91
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 92
    .line 93
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 94
    .line 95
    const-string v2, "showFrom"

    .line 96
    .line 97
    if-ne v0, v1, :cond_3

    .line 98
    .line 99
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->w:Ljava/lang/String;

    .line 100
    .line 101
    filled-new-array {v2, v0}, [Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    const-string v1, "vip_purchase_shown"

    .line 106
    .line 107
    invoke-static {v1, v0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_3
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_LIKERS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 112
    .line 113
    if-ne v0, v1, :cond_4

    .line 114
    .line 115
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->w:Ljava/lang/String;

    .line 116
    .line 117
    filled-new-array {v2, v0}, [Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    const-string v1, "see_purchase_shown"

    .line 122
    .line 123
    invoke-static {v1, v0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 124
    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_4
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP_SUPERLIKE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 128
    .line 129
    if-ne v0, v1, :cond_5

    .line 130
    .line 131
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->w:Ljava/lang/String;

    .line 132
    .line 133
    filled-new-array {v2, v0}, [Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    const-string v1, "superlike_purchase_shown"

    .line 138
    .line 139
    invoke-static {v1, v0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 140
    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_5
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_BOOST:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 144
    .line 145
    if-ne v0, v1, :cond_6

    .line 146
    .line 147
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->w:Ljava/lang/String;

    .line 148
    .line 149
    filled-new-array {v2, v0}, [Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    const-string v1, "boost_purchase_shown"

    .line 154
    .line 155
    invoke-static {v1, v0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 156
    .line 157
    .line 158
    :cond_6
    :goto_0
    const/4 v0, 0x1

    .line 159
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/purchase/b;->s0(Z)V

    .line 160
    .line 161
    .line 162
    sget-object v0, Ll/i9b0;->INSTANCE:Ll/i9b0;

    .line 163
    .line 164
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 165
    .line 166
    invoke-virtual {v0, p0}, Ll/i9b0;->a(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 167
    .line 168
    .line 169
    :cond_7
    :goto_1
    return-void
.end method

.method public final M(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/dbb0;->a(Lcom/p1/mobile/putong/core/ui/purchase/b;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final M0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/b;->R()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/b;->v0()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/b;->w0()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/b;->T()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/b;->S()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->D:Landroid/app/Dialog;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public N(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->A:Ll/t5m;

    .line 2
    .line 3
    instance-of v0, p0, Ll/fl40;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    check-cast p0, Ll/fl40;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    sget-object p1, Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;->checked:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;->unchecked:Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;

    .line 19
    .line 20
    :goto_0
    invoke-virtual {p0, p1}, Ll/fl40;->y(Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent$AgreementState;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public final N0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->B4()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y4()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 28
    .line 29
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_LIKERS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 30
    .line 31
    if-ne v0, v1, :cond_2

    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->A4()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->r:Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 46
    .line 47
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->C4()Lcom/p1/mobile/putong/core/data/FreeTrialData;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/FreeTrialData;->titleText:Ljava/lang/String;

    .line 54
    .line 55
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 58
    .line 59
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/CoreProduct;->C4()Lcom/p1/mobile/putong/core/data/FreeTrialData;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/FreeTrialData;->promotionUrl:Ljava/lang/String;

    .line 64
    .line 65
    const/4 v3, 0x1

    .line 66
    invoke-static {v0, v1, v2, v3}, Lcom/p1/mobile/putong/ui/webview/WebViewAct;->b2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const-string v1, "hideNavigationBar"

    .line 71
    .line 72
    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->r:Lcom/p1/mobile/android/app/Act;

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 78
    .line 79
    .line 80
    :cond_2
    return-void
.end method

.method public O()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/b;->W()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->D:Landroid/app/Dialog;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->B8()Ll/wyd0;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string v0, ""

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final O0(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->b:Lcom/p1/mobile/putong/core/ui/alifree/AliFreeAutoView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/alifree/AliFreeAutoView;->setTextList(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->b:Lcom/p1/mobile/putong/core/ui/alifree/AliFreeAutoView;

    .line 7
    .line 8
    const-wide/16 v0, 0x5dc

    .line 9
    .line 10
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/alifree/AliFreeAutoView;->setTextStillTime(J)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->b:Lcom/p1/mobile/putong/core/ui/alifree/AliFreeAutoView;

    .line 14
    .line 15
    const-wide/16 v0, 0x3e8

    .line 16
    .line 17
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/alifree/AliFreeAutoView;->setAnimTime(J)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->b:Lcom/p1/mobile/putong/core/ui/alifree/AliFreeAutoView;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/alifree/AliFreeAutoView;->f()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public P(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-static {v0}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Ll/r97;->f()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->R:Z

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->A:Ll/t5m;

    .line 27
    .line 28
    instance-of v0, p0, Ll/zul;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    check-cast p0, Ll/zul;

    .line 33
    .line 34
    invoke-interface {p0, p1}, Ll/zul;->g(Z)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->R:Z

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->A:Ll/t5m;

    .line 41
    .line 42
    instance-of v0, p0, Ll/zul;

    .line 43
    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    check-cast p0, Ll/zul;

    .line 47
    .line 48
    invoke-interface {p0, p1}, Ll/zul;->g(Z)V

    .line 49
    .line 50
    .line 51
    :cond_1
    return-void
.end method

.method public final P0(Ljava/lang/String;Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string p2, "svipPicksMembership"

    .line 2
    .line 3
    const-string v0, "picksMembership"

    .line 4
    .line 5
    const-string v1, "oDiamond"

    .line 6
    .line 7
    const-string v2, "svip"

    .line 8
    .line 9
    const-string v3, "vip"

    .line 10
    .line 11
    new-instance v4, Lorg/json/JSONObject;

    .line 12
    .line 13
    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 14
    .line 15
    .line 16
    :try_start_0
    const-string v5, "purchaseShowFrom"

    .line 17
    .line 18
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->w:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v6}, Ll/abb0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v6

    .line 24
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 25
    .line 26
    .line 27
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 28
    .line 29
    invoke-static {v5}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 30
    .line 31
    .line 32
    move-result v5

    .line 33
    if-eqz v5, :cond_0

    .line 34
    .line 35
    const-string v5, "first_carousel_page"

    .line 36
    .line 37
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->t:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 38
    .line 39
    invoke-static {v6}, Ll/mib0;->m(Lcom/p1/mobile/putong/core/data/Privilege;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v6

    .line 43
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :catch_0
    move-exception p1

    .line 48
    goto/16 :goto_4

    .line 49
    .line 50
    :cond_0
    :goto_0
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 51
    .line 52
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 53
    .line 54
    .line 55
    move-result-object v5

    .line 56
    const-string v6, "productType"

    .line 57
    .line 58
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v7

    .line 62
    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 63
    .line 64
    .line 65
    const-string v6, "skuGroup"

    .line 66
    .line 67
    invoke-virtual {v4, v6, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 68
    .line 69
    .line 70
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p1, v3}, Ll/tab0;->g(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    if-eqz p1, :cond_1

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_1
    move-object v2, v3

    .line 86
    :goto_1
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    if-ne v5, p1, :cond_2

    .line 91
    .line 92
    move-object p2, v1

    .line 93
    goto :goto_2

    .line 94
    :cond_2
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    if-ne v5, p1, :cond_3

    .line 99
    .line 100
    move-object p2, v0

    .line 101
    goto :goto_2

    .line 102
    :cond_3
    invoke-static {p2}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    if-ne v5, p1, :cond_4

    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_4
    move-object p2, v2

    .line 110
    :goto_2
    const-string p1, "default_product"

    .line 111
    .line 112
    invoke-virtual {v4, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 113
    .line 114
    .line 115
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-virtual {p1, v5}, Ll/tab0;->p(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    const-string p2, "default_duration"

    .line 124
    .line 125
    invoke-virtual {v4, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 126
    .line 127
    .line 128
    const-string p1, "if_sale"

    .line 129
    .line 130
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->N:Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 131
    .line 132
    const-string v0, "no"

    .line 133
    .line 134
    const-string v1, "yes"

    .line 135
    .line 136
    if-eqz p2, :cond_5

    .line 137
    .line 138
    move-object p2, v1

    .line 139
    goto :goto_3

    .line 140
    :cond_5
    move-object p2, v0

    .line 141
    :goto_3
    :try_start_1
    invoke-virtual {v4, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 142
    .line 143
    .line 144
    const-string p1, "if_discount"

    .line 145
    .line 146
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->N:Z

    .line 147
    .line 148
    invoke-virtual {v4, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 149
    .line 150
    .line 151
    const-string p1, "if_double_tab"

    .line 152
    .line 153
    const/4 p2, 0x0

    .line 154
    invoke-virtual {v4, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 155
    .line 156
    .line 157
    const-string p1, "function_type"

    .line 158
    .line 159
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->t:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 160
    .line 161
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->w:Ljava/lang/String;

    .line 162
    .line 163
    invoke-static {v2, v3}, Ll/mib0;->f(Lcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/String;)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v2

    .line 167
    invoke-virtual {v4, p1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 168
    .line 169
    .line 170
    const-string p1, "tooltips_trigger_mode"

    .line 171
    .line 172
    const-string v2, "active"

    .line 173
    .line 174
    invoke-virtual {v4, p1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 175
    .line 176
    .line 177
    const-string p1, "tooltips_type_ui"

    .line 178
    .line 179
    const-string v2, "alert_self_definition_business_a"

    .line 180
    .line 181
    invoke-virtual {v4, p1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 182
    .line 183
    .line 184
    const-string p1, "tooltips_trigger_module"

    .line 185
    .line 186
    const-string v2, "purchase_button"

    .line 187
    .line 188
    invoke-virtual {v4, p1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 189
    .line 190
    .line 191
    const-string p1, "tooltips_trigger_page"

    .line 192
    .line 193
    const-string v2, "anywhere"

    .line 194
    .line 195
    invoke-virtual {v4, p1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 196
    .line 197
    .line 198
    const-string p1, "tooltips_type"

    .line 199
    .line 200
    const-string v2, "alert"

    .line 201
    .line 202
    invoke-virtual {v4, p1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 203
    .line 204
    .line 205
    const-string p1, "tooltips_trigger_reason"

    .line 206
    .line 207
    const-string v2, "purchase"

    .line 208
    .line 209
    invoke-virtual {v4, p1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 210
    .line 211
    .line 212
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->U()Z

    .line 221
    .line 222
    .line 223
    move-result p1

    .line 224
    if-eqz p1, :cond_6

    .line 225
    .line 226
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 227
    .line 228
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 229
    .line 230
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->w3()Z

    .line 231
    .line 232
    .line 233
    move-result p1

    .line 234
    if-eqz p1, :cond_6

    .line 235
    .line 236
    move-object v0, v1

    .line 237
    :cond_6
    const-string p1, "no_secret_payment"

    .line 238
    .line 239
    invoke-virtual {v4, p1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 240
    .line 241
    .line 242
    const-string p1, "user_secret_staus"

    .line 243
    .line 244
    invoke-virtual {v4, p1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 245
    .line 246
    .line 247
    const-string p1, "ttc_page_type"

    .line 248
    .line 249
    const-string v0, "popup"

    .line 250
    .line 251
    invoke-virtual {v4, p1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 252
    .line 253
    .line 254
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 255
    .line 256
    .line 257
    move-result-object p1

    .line 258
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 259
    .line 260
    .line 261
    move-result-object p1

    .line 262
    invoke-interface {p1}, Ll/r97;->N()Z

    .line 263
    .line 264
    .line 265
    move-result p1

    .line 266
    if-eqz p1, :cond_8

    .line 267
    .line 268
    const-string p1, "is_fakeunreal"

    .line 269
    .line 270
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 271
    .line 272
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 273
    .line 274
    invoke-virtual {v0}, Ll/dkb;->Z7()Z

    .line 275
    .line 276
    .line 277
    move-result v0

    .line 278
    if-eqz v0, :cond_7

    .line 279
    .line 280
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 281
    .line 282
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 283
    .line 284
    invoke-virtual {v0}, Ll/dkb;->W7()Z

    .line 285
    .line 286
    .line 287
    move-result v0

    .line 288
    if-nez v0, :cond_7

    .line 289
    .line 290
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 291
    .line 292
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 293
    .line 294
    invoke-virtual {v0}, Ll/dkb;->k8()Z

    .line 295
    .line 296
    .line 297
    move-result v0

    .line 298
    if-nez v0, :cond_7

    .line 299
    .line 300
    const/4 p2, 0x1

    .line 301
    :cond_7
    invoke-virtual {v4, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 302
    .line 303
    .line 304
    :cond_8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 305
    .line 306
    .line 307
    move-result-object p1

    .line 308
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 309
    .line 310
    .line 311
    move-result-object p1

    .line 312
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->U()Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 313
    .line 314
    .line 315
    goto :goto_5

    .line 316
    :goto_4
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 317
    .line 318
    .line 319
    :goto_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->M:Ll/l4g0;

    .line 320
    .line 321
    invoke-virtual {p1, v4}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 322
    .line 323
    .line 324
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->M:Ll/l4g0;

    .line 325
    .line 326
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 327
    .line 328
    .line 329
    return-void
.end method

.method public final Q()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/alifree/AliFreeUtils;->d(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/purchase/b;->O0(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x1

    .line 15
    if-ne v0, v1, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->b:Lcom/p1/mobile/putong/core/ui/alifree/AliFreeAutoView;

    .line 18
    .line 19
    new-instance v1, Ll/q9b0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/q9b0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/b;)V

    .line 22
    .line 23
    .line 24
    const-wide/16 v2, 0x1f4

    .line 25
    .line 26
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public final Q0(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/mib0;->j(Ljava/util/List;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, ","

    .line 6
    .line 7
    invoke-static {v0, v1}, Ll/jyb;->U(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->P0(Ljava/lang/String;Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    const-string p0, "platform"

    .line 15
    .line 16
    const-string p1, "android"

    .line 17
    .line 18
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string p1, "purchase_page_shown"

    .line 23
    .line 24
    invoke-static {p1, p0}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public R()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-static {v0}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    invoke-static {v0}, Ll/wib0;->s(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 20
    .line 21
    if-ne v0, v1, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    sget v0, Ll/dgc0;->i:I

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_1
    :goto_0
    sget v0, Ll/dgc0;->h:I

    .line 28
    .line 29
    :goto_1
    sget v1, Ll/rec0;->J2:I

    .line 30
    .line 31
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->r:Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v2, v1}, Lcom/p1/mobile/android/app/Dialog$e;->M(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->L(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->v()Lcom/p1/mobile/android/app/Dialog$e;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/u9b0;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/u9b0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/b;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->A(Landroid/content/DialogInterface$OnCancelListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v1, Ll/w9b0;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Ll/w9b0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/b;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Ll/x9b0;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/x9b0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/b;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->i0(Landroid/content/DialogInterface$OnKeyListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Ll/y9b0;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/y9b0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/b;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->K0(Lcom/p1/mobile/android/app/Dialog$i;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    sget-object v1, Ll/g6e;->a:Lcom/p1/mobile/android/app/Dialog$f;

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->y0(Lcom/p1/mobile/android/app/Dialog$f;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->D:Landroid/app/Dialog;

    .line 96
    .line 97
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/purchase/b;->M(Landroid/view/View;)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->j:Landroid/widget/FrameLayout;

    .line 105
    .line 106
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->e:Landroid/widget/FrameLayout;

    .line 107
    .line 108
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->k:Landroid/widget/LinearLayout;

    .line 109
    .line 110
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->f:Landroid/widget/LinearLayout;

    .line 111
    .line 112
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->l:Landroid/widget/LinearLayout;

    .line 113
    .line 114
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->g:Landroid/widget/LinearLayout;

    .line 115
    .line 116
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->i:Landroid/widget/LinearLayout;

    .line 117
    .line 118
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->d:Landroid/widget/LinearLayout;

    .line 119
    .line 120
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 121
    .line 122
    invoke-static {v0}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-eqz v0, :cond_2

    .line 127
    .line 128
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->d:Landroid/widget/LinearLayout;

    .line 129
    .line 130
    sget v0, Lcom/p1/mobile/putong/core/ui/purchase/b;->X:I

    .line 131
    .line 132
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 133
    .line 134
    .line 135
    :cond_2
    return-void
.end method

.method public R0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->z:Ll/l3m;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->z:Ll/l3m;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/l3m;->release()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->A:Ll/t5m;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->A:Ll/t5m;

    .line 23
    .line 24
    invoke-interface {v0}, Ll/t5m;->release()V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->B:Ll/i2m;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->B:Ll/i2m;

    .line 36
    .line 37
    invoke-interface {v0}, Ll/i2m;->release()V

    .line 38
    .line 39
    .line 40
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->J:Ll/kcg0;

    .line 41
    .line 42
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    const/4 v1, 0x0

    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->J:Ll/kcg0;

    .line 50
    .line 51
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 52
    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->J:Ll/kcg0;

    .line 55
    .line 56
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->K:Ll/kcg0;

    .line 57
    .line 58
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_4

    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->K:Ll/kcg0;

    .line 65
    .line 66
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 67
    .line 68
    .line 69
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->K:Ll/kcg0;

    .line 70
    .line 71
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->L:Ll/kcg0;

    .line 72
    .line 73
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public final S()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->s3()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    const-string v1, "oDiamond"

    .line 22
    .line 23
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->K5()Lrx/c;

    .line 34
    .line 35
    .line 36
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->K4()Lrx/subjects/a;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Ll/o9b0;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/o9b0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/b;)V

    .line 47
    .line 48
    .line 49
    new-instance v2, Ll/p9b0;

    .line 50
    .line 51
    invoke-direct {v2, p0}, Ll/p9b0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/b;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->L:Ll/kcg0;

    .line 63
    .line 64
    :cond_0
    return-void
.end method

.method public final T()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->h5()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    const-string v1, "svip"

    .line 22
    .line 23
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/r9b0;

    .line 34
    .line 35
    invoke-direct {v1}, Ll/r9b0;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/s9b0;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/s9b0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/b;)V

    .line 45
    .line 46
    .line 47
    new-instance v2, Ll/t9b0;

    .line 48
    .line 49
    invoke-direct {v2, p0}, Ll/t9b0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/b;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->K:Ll/kcg0;

    .line 61
    .line 62
    :cond_0
    return-void
.end method

.method public final U()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->l:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 8
    .line 9
    const/high16 v1, 0x41a00000    # 20.0f

    .line 10
    .line 11
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->k:Landroid/widget/LinearLayout;

    .line 18
    .line 19
    const/high16 v0, 0x40c00000    # 6.0f

    .line 20
    .line 21
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-static {p0, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public V()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->A:Ll/t5m;

    .line 2
    .line 3
    instance-of v0, p0, Ll/fl40;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Ll/fl40;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/fl40;->F()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public W()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->D:Landroid/app/Dialog;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->D:Landroid/app/Dialog;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

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

.method public final synthetic X()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/purchase/b;->u0(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic Y(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/b;->R0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic Z(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->E9()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/b;->R0()V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->M:Ll/l4g0;

    .line 16
    .line 17
    invoke-static {p1}, Ll/w1e;->e(Ll/l4g0;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->E:Ll/x20;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->I:Z

    .line 29
    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->E:Ll/x20;

    .line 33
    .line 34
    invoke-interface {p1}, Ll/x20;->call()V

    .line 35
    .line 36
    .line 37
    :cond_0
    const/4 p1, 0x0

    .line 38
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->s0(Z)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic a0(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 p3, 0x0

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    const/4 p1, 0x4

    .line 9
    if-ne p2, p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->T:Ll/y20;

    .line 12
    .line 13
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-interface {p1, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/b;->N0()V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->H:Ll/x20;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->H:Ll/x20;

    .line 32
    .line 33
    invoke-interface {p0}, Ll/x20;->call()V

    .line 34
    .line 35
    .line 36
    :cond_0
    return p3
.end method

.method public final synthetic b0(Lcom/p1/mobile/android/app/Dialog;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->T:Ll/y20;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/b;->N0()V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->G:Ll/x20;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->G:Ll/x20;

    .line 23
    .line 24
    invoke-interface {p0}, Ll/x20;->call()V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final synthetic c0(Lcom/google/common/base/Optional;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/google/common/base/Optional;->isPresent()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/p1/mobile/putong/core/data/RefundDetail;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->B:Ll/i2m;

    .line 14
    .line 15
    instance-of v0, p0, Ll/im60;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    check-cast p0, Ll/im60;

    .line 20
    .line 21
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/RefundDetail;->totalRefundAmount:D

    .line 22
    .line 23
    invoke-virtual {p0, v0, v1}, Ll/im60;->s0(D)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final synthetic d0(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->B:Ll/i2m;

    .line 2
    .line 3
    instance-of p1, p0, Ll/im60;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    check-cast p0, Ll/im60;

    .line 8
    .line 9
    const-wide/16 v0, 0x0

    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Ll/im60;->s0(D)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic e0(Lcom/google/common/base/Optional;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/google/common/base/Optional;->isPresent()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/p1/mobile/putong/core/data/RefundDetail;

    .line 12
    .line 13
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/RefundDetail;->totalRefundAmount:D

    .line 14
    .line 15
    const-wide/16 v2, 0x0

    .line 16
    .line 17
    cmpl-double p1, v0, v2

    .line 18
    .line 19
    if-lez p1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->B:Ll/i2m;

    .line 22
    .line 23
    instance-of p1, p0, Ll/im60;

    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    check-cast p0, Ll/im60;

    .line 28
    .line 29
    invoke-virtual {p0, v0, v1}, Ll/im60;->t0(D)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public final synthetic f0(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->B:Ll/i2m;

    .line 2
    .line 3
    instance-of p1, p0, Ll/im60;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    check-cast p0, Ll/im60;

    .line 8
    .line 9
    const-wide/16 v0, 0x0

    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Ll/im60;->t0(D)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic g0(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->D:Landroid/app/Dialog;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->D:Landroid/app/Dialog;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->D:Landroid/app/Dialog;

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->J0(Z)V

    .line 57
    .line 58
    .line 59
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->D:Landroid/app/Dialog;

    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 62
    .line 63
    .line 64
    :cond_4
    return-void
.end method

.method public final synthetic h0(Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->z:Ll/l3m;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->z:Ll/l3m;

    .line 10
    .line 11
    invoke-interface {v0, p1}, Ll/l3m;->b(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->B:Ll/i2m;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->B:Ll/i2m;

    .line 23
    .line 24
    invoke-interface {p0, p1}, Ll/i2m;->b(Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public final synthetic i0(Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->B:Ll/i2m;

    .line 2
    .line 3
    instance-of p1, p0, Ll/fhj;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    check-cast p0, Ll/fhj;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/fhj;->C0()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final synthetic j0(Lcom/p1/mobile/putong/data/PayMethod;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->S:Lcom/p1/mobile/putong/data/PayMethod;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->A:Ll/t5m;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->A:Ll/t5m;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ll/t5m;->e(Lcom/p1/mobile/putong/data/PayMethod;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final synthetic k0(ZZ)V
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 6
    .line 7
    if-ne p0, p1, :cond_0

    .line 8
    .line 9
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->R3:I

    .line 10
    .line 11
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic l0(Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->O0(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->B:Ll/i2m;

    .line 2
    .line 3
    instance-of v0, p1, Ll/fhj;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p1, Ll/fhj;

    .line 8
    .line 9
    iget-object p1, p1, Ll/im60;->x:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    invoke-static {}, Ll/cjj;->L()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {}, Ll/psd0;->B()Ll/gcg0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->D:Landroid/app/Dialog;

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/b;->N0()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic n0(Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->r:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/cjj;->M(Landroid/content/Context;Ljava/util/List;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic o0(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/b;->t0(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic p0(Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->r:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/cjj;->M(Landroid/content/Context;Ljava/util/List;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic q0(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/b;->t0(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public r0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->A:Ll/t5m;

    .line 2
    .line 3
    instance-of v0, p0, Ll/fl40;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Ll/fl40;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/fl40;->R()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final s0(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {}, Ll/nab0;->a()Ll/nab0;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->D:Landroid/app/Dialog;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Ll/nab0;->d(Landroid/app/Dialog;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-static {}, Ll/nab0;->a()Ll/nab0;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->D:Landroid/app/Dialog;

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Ll/nab0;->c(Landroid/app/Dialog;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final t0(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)V
    .locals 4
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
    new-instance v0, Ll/bab0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/bab0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p2, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->N:Z

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->B:Ll/i2m;

    .line 17
    .line 18
    invoke-interface {v1, v0}, Ll/i2m;->g(Z)V

    .line 19
    .line 20
    .line 21
    invoke-static {p1}, Ll/zry;->z(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ll/jzl;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->r:Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 28
    .line 29
    invoke-interface {v0, v1, v2, p1, p2}, Ll/jzl;->a(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->r:Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->w:Ljava/lang/String;

    .line 38
    .line 39
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->S:Lcom/p1/mobile/putong/data/PayMethod;

    .line 40
    .line 41
    invoke-static {p2, v0, v1, v2}, Ll/pab0;->c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Lcom/p1/mobile/putong/data/PayMethod;)Ll/t5m;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->A:Ll/t5m;

    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->f:Landroid/widget/LinearLayout;

    .line 48
    .line 49
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->v:Z

    .line 50
    .line 51
    invoke-interface {p2, v0, v1}, Ll/t5m;->a(Landroid/view/ViewGroup;Z)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->a:Landroid/widget/FrameLayout;

    .line 56
    .line 57
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    const/4 v1, 0x0

    .line 62
    if-eqz v0, :cond_1

    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->A:Ll/t5m;

    .line 65
    .line 66
    instance-of v2, v0, Ll/ip0;

    .line 67
    .line 68
    if-nez v2, :cond_0

    .line 69
    .line 70
    instance-of v2, v0, Ll/fl40;

    .line 71
    .line 72
    if-eqz v2, :cond_1

    .line 73
    .line 74
    check-cast v0, Ll/fl40;

    .line 75
    .line 76
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->a:Landroid/widget/FrameLayout;

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ll/fl40;->E(Z)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_0
    check-cast v0, Ll/ip0;

    .line 87
    .line 88
    invoke-interface {v0}, Ll/cqe0;->d()Lcom/p1/mobile/putong/core/ui/purchase/agreement/AgreementComponent;

    .line 89
    .line 90
    .line 91
    const/4 p0, 0x0

    .line 92
    throw p0

    .line 93
    :cond_1
    :goto_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-eqz v0, :cond_5

    .line 98
    .line 99
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->A:Ll/t5m;

    .line 100
    .line 101
    instance-of v2, v0, Ll/wl40;

    .line 102
    .line 103
    if-eqz v2, :cond_2

    .line 104
    .line 105
    check-cast v0, Ll/wl40;

    .line 106
    .line 107
    sget v2, Ll/qa00;->i:I

    .line 108
    .line 109
    invoke-virtual {v0, v2}, Ll/wl40;->d0(I)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->A:Ll/t5m;

    .line 113
    .line 114
    check-cast v0, Ll/wl40;

    .line 115
    .line 116
    invoke-virtual {v0, v2}, Ll/wl40;->f0(I)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->A:Ll/t5m;

    .line 120
    .line 121
    check-cast v0, Ll/wl40;

    .line 122
    .line 123
    invoke-virtual {v0, v1}, Ll/wl40;->c0(I)V

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->A:Ll/t5m;

    .line 127
    .line 128
    check-cast v0, Ll/wl40;

    .line 129
    .line 130
    new-instance v1, Ll/cab0;

    .line 131
    .line 132
    invoke-direct {v1, p0}, Ll/cab0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/b;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v0, v1}, Ll/ip0;->H(Ll/ip0$a;)V

    .line 136
    .line 137
    .line 138
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->B:Ll/i2m;

    .line 139
    .line 140
    instance-of v1, v0, Ll/im60;

    .line 141
    .line 142
    if-eqz v1, :cond_3

    .line 143
    .line 144
    check-cast v0, Ll/im60;

    .line 145
    .line 146
    new-instance v1, Lcom/p1/mobile/putong/core/ui/purchase/b$b;

    .line 147
    .line 148
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/purchase/b$b;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/b;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {v0, v1}, Ll/im60;->l0(Ll/z3m;)V

    .line 152
    .line 153
    .line 154
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->A:Ll/t5m;

    .line 155
    .line 156
    instance-of v1, v0, Ll/wl40;

    .line 157
    .line 158
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->U:Ll/y20;

    .line 159
    .line 160
    if-eqz v1, :cond_4

    .line 161
    .line 162
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->T:Ll/y20;

    .line 163
    .line 164
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->V:Ll/y20;

    .line 165
    .line 166
    invoke-interface {v0, p1, v2, v1, v3}, Ll/t5m;->f(Ljava/util/List;Ll/y20;Ll/y20;Ll/y20;)V

    .line 167
    .line 168
    .line 169
    goto :goto_1

    .line 170
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->T:Ll/y20;

    .line 171
    .line 172
    invoke-interface {v0, p1, v2, v1}, Ll/t5m;->h(Ljava/util/List;Ll/y20;Ll/y20;)V

    .line 173
    .line 174
    .line 175
    :goto_1
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 176
    .line 177
    const/4 v1, -0x1

    .line 178
    const/4 v2, -0x2

    .line 179
    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 180
    .line 181
    .line 182
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->f:Landroid/widget/LinearLayout;

    .line 183
    .line 184
    invoke-virtual {v1, p2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 185
    .line 186
    .line 187
    :cond_5
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->A:Ll/t5m;

    .line 188
    .line 189
    instance-of v0, p2, Ll/zul;

    .line 190
    .line 191
    if-eqz v0, :cond_6

    .line 192
    .line 193
    check-cast p2, Ll/zul;

    .line 194
    .line 195
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->R:Z

    .line 196
    .line 197
    invoke-interface {p2, v0}, Ll/zul;->g(Z)V

    .line 198
    .line 199
    .line 200
    :cond_6
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->A:Ll/t5m;

    .line 201
    .line 202
    instance-of v0, p2, Ll/fl40;

    .line 203
    .line 204
    if-eqz v0, :cond_7

    .line 205
    .line 206
    check-cast p2, Ll/fl40;

    .line 207
    .line 208
    const/4 v0, 0x1

    .line 209
    invoke-virtual {p2, v0}, Ll/fl40;->G(Z)V

    .line 210
    .line 211
    .line 212
    :cond_7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->Q0(Ljava/util/List;)V

    .line 213
    .line 214
    .line 215
    return-void
.end method

.method public final u0(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/alifree/AliFreeUtils;->d(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->b:Lcom/p1/mobile/putong/core/ui/alifree/AliFreeAutoView;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/alifree/AliFreeAutoView;->g()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->b:Lcom/p1/mobile/putong/core/ui/alifree/AliFreeAutoView;

    .line 11
    .line 12
    new-instance v1, Ll/aab0;

    .line 13
    .line 14
    invoke-direct {v1, p0, p1}, Ll/aab0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/b;Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final v0()V
    .locals 7

    .line 1
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->t:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->intl_no_ad:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->r:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    const/4 v6, 0x1

    .line 8
    if-ne v5, v0, :cond_0

    .line 9
    .line 10
    new-instance v0, Ll/ihj;

    .line 11
    .line 12
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 13
    .line 14
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->w:Ljava/lang/String;

    .line 15
    .line 16
    const/4 v4, 0x1

    .line 17
    invoke-direct/range {v0 .. v5}, Ll/ihj;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;ZLcom/p1/mobile/putong/core/data/Privilege;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->z:Ll/l3m;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 24
    .line 25
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->w:Ljava/lang/String;

    .line 26
    .line 27
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->u:Z

    .line 28
    .line 29
    invoke-static {v1, v0, v2, v3, v6}, Ll/pab0;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;ZZ)Ll/l3m;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->z:Ll/l3m;

    .line 34
    .line 35
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->z:Ll/l3m;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->e:Landroid/widget/FrameLayout;

    .line 38
    .line 39
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->v:Z

    .line 40
    .line 41
    invoke-interface {v0, v1, v2}, Ll/l3m;->a(Landroid/view/ViewGroup;Z)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    const/4 v2, -0x2

    .line 50
    const/4 v3, -0x1

    .line 51
    if-eqz v1, :cond_1

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->z:Ll/l3m;

    .line 54
    .line 55
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->C:Ljava/util/List;

    .line 56
    .line 57
    invoke-interface {v1, v4}, Ll/l3m;->c(Ljava/util/List;)V

    .line 58
    .line 59
    .line 60
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 61
    .line 62
    invoke-direct {v1, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 63
    .line 64
    .line 65
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->e:Landroid/widget/FrameLayout;

    .line 66
    .line 67
    invoke-virtual {v4, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->z:Ll/l3m;

    .line 71
    .line 72
    instance-of v1, v0, Ll/oud0;

    .line 73
    .line 74
    if-eqz v1, :cond_1

    .line 75
    .line 76
    check-cast v0, Ll/oud0;

    .line 77
    .line 78
    invoke-virtual {v0}, Ll/oud0;->g()V

    .line 79
    .line 80
    .line 81
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->r:Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 84
    .line 85
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->w:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {v0, v1, v4}, Ll/pab0;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;)Ll/i2m;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->B:Ll/i2m;

    .line 92
    .line 93
    instance-of v1, v0, Ll/fhj;

    .line 94
    .line 95
    if-eqz v1, :cond_2

    .line 96
    .line 97
    check-cast v0, Ll/fhj;

    .line 98
    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->t:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 100
    .line 101
    invoke-virtual {v0, v1}, Ll/fhj;->h0(Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->B:Ll/i2m;

    .line 105
    .line 106
    check-cast v0, Ll/fhj;

    .line 107
    .line 108
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->Q:Ljava/lang/Object;

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ll/im60;->q0(Ljava/lang/Object;)V

    .line 111
    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_2
    instance-of v1, v0, Ll/im60;

    .line 115
    .line 116
    if-eqz v1, :cond_3

    .line 117
    .line 118
    check-cast v0, Ll/im60;

    .line 119
    .line 120
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->t:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 121
    .line 122
    invoke-virtual {v0, v1}, Ll/im60;->h0(Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->B:Ll/i2m;

    .line 126
    .line 127
    check-cast v0, Ll/im60;

    .line 128
    .line 129
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->P:Ljava/lang/String;

    .line 130
    .line 131
    invoke-virtual {v0, v1}, Ll/im60;->m0(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->B:Ll/i2m;

    .line 135
    .line 136
    check-cast v0, Ll/im60;

    .line 137
    .line 138
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->Q:Ljava/lang/Object;

    .line 139
    .line 140
    invoke-virtual {v0, v1}, Ll/im60;->q0(Ljava/lang/Object;)V

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->B:Ll/i2m;

    .line 144
    .line 145
    check-cast v0, Ll/im60;

    .line 146
    .line 147
    invoke-virtual {v0, p0}, Ll/im60;->o0(Lcom/p1/mobile/putong/core/ui/purchase/b;)V

    .line 148
    .line 149
    .line 150
    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->B:Ll/i2m;

    .line 151
    .line 152
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->g:Landroid/widget/LinearLayout;

    .line 153
    .line 154
    iget-boolean v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->v:Z

    .line 155
    .line 156
    invoke-interface {v0, v1, v4}, Ll/i2m;->a(Landroid/view/ViewGroup;Z)Landroid/view/View;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    if-eqz v1, :cond_5

    .line 165
    .line 166
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->B:Ll/i2m;

    .line 167
    .line 168
    instance-of v4, v1, Ll/im60;

    .line 169
    .line 170
    if-eqz v4, :cond_4

    .line 171
    .line 172
    check-cast v1, Ll/im60;

    .line 173
    .line 174
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->x:Ll/a30;

    .line 175
    .line 176
    invoke-virtual {v1, v4}, Ll/im60;->k0(Ll/a30;)V

    .line 177
    .line 178
    .line 179
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->B:Ll/i2m;

    .line 180
    .line 181
    check-cast v1, Ll/im60;

    .line 182
    .line 183
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->y:Ll/a30;

    .line 184
    .line 185
    invoke-virtual {v1, v4}, Ll/im60;->j0(Ll/a30;)V

    .line 186
    .line 187
    .line 188
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->B:Ll/i2m;

    .line 189
    .line 190
    check-cast v1, Ll/im60;

    .line 191
    .line 192
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->W:Ll/y20;

    .line 193
    .line 194
    invoke-virtual {v1, v4}, Ll/im60;->n0(Ll/y20;)V

    .line 195
    .line 196
    .line 197
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->B:Ll/i2m;

    .line 198
    .line 199
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->w:Ljava/lang/String;

    .line 200
    .line 201
    invoke-interface {v1, v4}, Ll/i2m;->c(Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->B:Ll/i2m;

    .line 205
    .line 206
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->T:Ll/y20;

    .line 207
    .line 208
    invoke-interface {v1, v4}, Ll/i2m;->i(Ll/y20;)V

    .line 209
    .line 210
    .line 211
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 212
    .line 213
    invoke-direct {v1, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 214
    .line 215
    .line 216
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->g:Landroid/widget/LinearLayout;

    .line 217
    .line 218
    invoke-virtual {v2, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 219
    .line 220
    .line 221
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 222
    .line 223
    invoke-static {v0}, Ll/wib0;->w(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 224
    .line 225
    .line 226
    move-result v0

    .line 227
    if-nez v0, :cond_7

    .line 228
    .line 229
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 230
    .line 231
    invoke-static {v0}, Ll/wib0;->s(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 232
    .line 233
    .line 234
    move-result v0

    .line 235
    if-nez v0, :cond_7

    .line 236
    .line 237
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 238
    .line 239
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 240
    .line 241
    if-ne v0, v1, :cond_6

    .line 242
    .line 243
    goto :goto_2

    .line 244
    :cond_6
    return-void

    .line 245
    :cond_7
    :goto_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/b;->U()V

    .line 246
    .line 247
    .line 248
    sget-object v0, Lcom/p1/mobile/putong/core/ui/purchase/b$c;->a:[I

    .line 249
    .line 250
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 251
    .line 252
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 253
    .line 254
    .line 255
    move-result v1

    .line 256
    aget v0, v0, v1

    .line 257
    .line 258
    if-eq v0, v6, :cond_a

    .line 259
    .line 260
    const/4 v1, 0x2

    .line 261
    if-eq v0, v1, :cond_9

    .line 262
    .line 263
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->i:Landroid/widget/LinearLayout;

    .line 264
    .line 265
    const/4 v2, 0x3

    .line 266
    if-eq v0, v2, :cond_8

    .line 267
    .line 268
    sget v0, Ll/jbc0;->Fb:I

    .line 269
    .line 270
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 271
    .line 272
    .line 273
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->p:Lv/VImage;

    .line 274
    .line 275
    sget v1, Ll/jbc0;->U2:I

    .line 276
    .line 277
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 278
    .line 279
    .line 280
    goto :goto_3

    .line 281
    :cond_8
    sget v0, Ll/jbc0;->O0:I

    .line 282
    .line 283
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 284
    .line 285
    .line 286
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->p:Lv/VImage;

    .line 287
    .line 288
    sget v1, Ll/jbc0;->d1:I

    .line 289
    .line 290
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 291
    .line 292
    .line 293
    goto :goto_3

    .line 294
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->i:Landroid/widget/LinearLayout;

    .line 295
    .line 296
    sget v1, Ll/jbc0;->N0:I

    .line 297
    .line 298
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 299
    .line 300
    .line 301
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->p:Lv/VImage;

    .line 302
    .line 303
    sget v1, Ll/jbc0;->U2:I

    .line 304
    .line 305
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 306
    .line 307
    .line 308
    goto :goto_3

    .line 309
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->i:Landroid/widget/LinearLayout;

    .line 310
    .line 311
    sget v1, Ll/jbc0;->P0:I

    .line 312
    .line 313
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 314
    .line 315
    .line 316
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->p:Lv/VImage;

    .line 317
    .line 318
    sget v1, Ll/jbc0;->U2:I

    .line 319
    .line 320
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 321
    .line 322
    .line 323
    :goto_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->m:Landroid/widget/LinearLayout;

    .line 324
    .line 325
    invoke-static {v0, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 326
    .line 327
    .line 328
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->o:Landroid/widget/TextView;

    .line 329
    .line 330
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->r:Lcom/p1/mobile/android/app/Act;

    .line 331
    .line 332
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 333
    .line 334
    .line 335
    move-result v2

    .line 336
    if-eqz v2, :cond_b

    .line 337
    .line 338
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->f2:I

    .line 339
    .line 340
    goto :goto_4

    .line 341
    :cond_b
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->X1:I

    .line 342
    .line 343
    :goto_4
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->r:Lcom/p1/mobile/android/app/Act;

    .line 344
    .line 345
    sget v4, Lcom/p1/mobile/putong/core/pay/R$string;->h2:I

    .line 346
    .line 347
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 348
    .line 349
    .line 350
    move-result-object v3

    .line 351
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->r:Lcom/p1/mobile/android/app/Act;

    .line 352
    .line 353
    sget v5, Lcom/p1/mobile/putong/core/pay/R$string;->V6:I

    .line 354
    .line 355
    invoke-virtual {v4, v5}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 356
    .line 357
    .line 358
    move-result-object v4

    .line 359
    filled-new-array {v3, v4}, [Ljava/lang/Object;

    .line 360
    .line 361
    .line 362
    move-result-object v3

    .line 363
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 364
    .line 365
    .line 366
    move-result-object v2

    .line 367
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->r:Lcom/p1/mobile/android/app/Act;

    .line 368
    .line 369
    sget v4, Lcom/p1/mobile/putong/core/pay/R$string;->h2:I

    .line 370
    .line 371
    invoke-virtual {v3, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 372
    .line 373
    .line 374
    move-result-object v3

    .line 375
    invoke-static {}, Ll/zwk;->j()Ljava/lang/String;

    .line 376
    .line 377
    .line 378
    move-result-object v4

    .line 379
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->r:Lcom/p1/mobile/android/app/Act;

    .line 380
    .line 381
    sget v6, Lcom/p1/mobile/putong/core/pay/R$string;->V6:I

    .line 382
    .line 383
    invoke-virtual {v5, v6}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 384
    .line 385
    .line 386
    move-result-object v5

    .line 387
    invoke-static {}, Ll/zwk;->i()Ljava/lang/String;

    .line 388
    .line 389
    .line 390
    move-result-object v6

    .line 391
    filled-new-array {v3, v4, v5, v6}, [Ljava/lang/String;

    .line 392
    .line 393
    .line 394
    move-result-object v3

    .line 395
    invoke-static {v1, v2, v3}, Ll/z7a;->q0(Landroid/app/Activity;Ljava/lang/String;[Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    .line 396
    .line 397
    .line 398
    move-result-object v1

    .line 399
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 400
    .line 401
    .line 402
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->o:Landroid/widget/TextView;

    .line 403
    .line 404
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 405
    .line 406
    .line 407
    move-result-object v1

    .line 408
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 409
    .line 410
    .line 411
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->n:Landroid/widget/TextView;

    .line 412
    .line 413
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->G8:I

    .line 414
    .line 415
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 416
    .line 417
    .line 418
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->o:Landroid/widget/TextView;

    .line 419
    .line 420
    const/4 v1, 0x0

    .line 421
    const/high16 v2, 0x3f800000    # 1.0f

    .line 422
    .line 423
    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 424
    .line 425
    .line 426
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->o:Landroid/widget/TextView;

    .line 427
    .line 428
    const/4 v1, 0x0

    .line 429
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 430
    .line 431
    .line 432
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->p:Lv/VImage;

    .line 433
    .line 434
    new-instance v1, Ll/n9b0;

    .line 435
    .line 436
    invoke-direct {v1, p0}, Ll/n9b0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/b;)V

    .line 437
    .line 438
    .line 439
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 440
    .line 441
    .line 442
    return-void
.end method

.method public final w0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->s:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v1}, Ll/zry;->G(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 28
    .line 29
    const-string v3, "tttSvipGoogleplayFreeTrial"

    .line 30
    .line 31
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    new-instance v3, Ll/fab0;

    .line 40
    .line 41
    invoke-direct {v3}, Ll/fab0;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-static {v1, v2, v3}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    new-instance v2, Ll/gab0;

    .line 49
    .line 50
    invoke-direct {v2}, Ll/gab0;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    new-instance v2, Ll/hab0;

    .line 58
    .line 59
    invoke-direct {v2, p0}, Ll/hab0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/b;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    new-instance v2, Ll/iab0;

    .line 75
    .line 76
    invoke-direct {v2, p0, v0}, Ll/iab0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/b;Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    .line 77
    .line 78
    .line 79
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->J:Ll/kcg0;

    .line 88
    .line 89
    return-void

    .line 90
    :cond_0
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    new-instance v2, Ll/jab0;

    .line 95
    .line 96
    invoke-direct {v2}, Ll/jab0;-><init>()V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    new-instance v2, Ll/kab0;

    .line 104
    .line 105
    invoke-direct {v2}, Ll/kab0;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    new-instance v2, Ll/l9b0;

    .line 113
    .line 114
    invoke-direct {v2, p0}, Ll/l9b0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/b;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    new-instance v2, Ll/m9b0;

    .line 130
    .line 131
    invoke-direct {v2, p0, v0}, Ll/m9b0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/b;Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    .line 132
    .line 133
    .line 134
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-virtual {v1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->J:Ll/kcg0;

    .line 143
    .line 144
    return-void
.end method

.method public final x0(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->q:I

    .line 2
    .line 3
    return-void
.end method

.method public final y0(Lcom/p1/mobile/putong/core/data/Privilege;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->t:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->u:Z

    .line 4
    .line 5
    return-void
.end method

.method public final z0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b;->w:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
