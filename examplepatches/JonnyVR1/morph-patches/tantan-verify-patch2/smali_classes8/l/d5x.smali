.class public Ll/d5x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Ll/myl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/b5x;",
        ">;",
        "Ll/myl;"
    }
.end annotation


# static fields
.field public static final l:I


# instance fields
.field public a:Lv/VFrame;

.field public b:Lv/VFrame;

.field public c:Landroid/view/View;

.field public d:Lv/VImage;

.field public e:Lv/VFrame_Shadow;

.field public f:Lv/VLinear;

.field public g:Lv/VText;

.field public h:Lcom/p1/mobile/android/app/Act;

.field public i:Ll/b5x;

.field public j:Ll/v7m;

.field public k:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x41c00000    # 24.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Ll/d5x;->l:I

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/d5x;->k:I

    .line 6
    .line 7
    iput-object p1, p0, Ll/d5x;->h:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a(Ll/d5x;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/d5x;->i(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic b(Ll/d5x;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/d5x;->f()V

    return-void
.end method

.method private synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d5x;->i:Ll/b5x;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/b5x;->s0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/d5x;->h:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/e5x;->b(Ll/d5x;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d5x;->j:Ll/v7m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v7m;->a(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ll/b5x;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/d5x;->i:Ll/b5x;

    .line 2
    .line 3
    return-void
.end method

.method public final f()V
    .locals 4

    .line 1
    iget v0, p0, Ll/d5x;->k:I

    .line 2
    .line 3
    sget v1, Ll/d5x;->l:I

    .line 4
    .line 5
    if-gt v0, v1, :cond_0

    .line 6
    .line 7
    int-to-float v0, v0

    .line 8
    int-to-float v1, v1

    .line 9
    div-float/2addr v0, v1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 12
    .line 13
    :goto_0
    iget-object v1, p0, Ll/d5x;->c:Landroid/view/View;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->tn()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    const-string v1, "#ECD3D3"

    .line 37
    .line 38
    :cond_1
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    iget-object p0, p0, Ll/d5x;->h:Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    check-cast p0, Lcom/p1/mobile/putong/core/ui/marry/profile/MarryProfileAct;

    .line 45
    .line 46
    const/high16 v2, 0x437f0000    # 255.0f

    .line 47
    .line 48
    mul-float/2addr v0, v2

    .line 49
    float-to-int v0, v0

    .line 50
    rsub-int v0, v0, 0xff

    .line 51
    .line 52
    invoke-static {v1}, Landroid/graphics/Color;->red(I)I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    invoke-static {v1}, Landroid/graphics/Color;->green(I)I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    invoke-static {v1}, Landroid/graphics/Color;->blue(I)I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    invoke-static {v0, v2, v3, v1}, Landroid/graphics/Color;->argb(IIII)I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/b5x;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/d5x;->e(Ll/b5x;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/d5x;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iget-object v0, p0, Ll/d5x;->a:Lv/VFrame;

    .line 14
    .line 15
    new-instance v1, Ll/d5x$a;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/d5x$a;-><init>(Ll/d5x;)V

    .line 18
    .line 19
    .line 20
    const-string v2, "profile"

    .line 21
    .line 22
    invoke-interface {p2, v0, v2, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Mj(Landroid/widget/FrameLayout;Ljava/lang/String;Landroidx/recyclerview/widget/RecyclerView$t;)Ll/v7m;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    iput-object p2, p0, Ll/d5x;->j:Ll/v7m;

    .line 27
    .line 28
    iget-object p2, p0, Ll/d5x;->f:Lv/VLinear;

    .line 29
    .line 30
    new-instance v0, Ll/c5x;

    .line 31
    .line 32
    invoke-direct {v0, p0}, Ll/c5x;-><init>(Ll/d5x;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/d5x;->g:Lv/VText;

    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->sl()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    return-object p1
.end method

.method public j(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d5x;->e:Lv/VFrame_Shadow;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
