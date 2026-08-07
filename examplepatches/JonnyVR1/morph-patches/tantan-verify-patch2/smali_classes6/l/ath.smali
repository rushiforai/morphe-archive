.class public Ll/ath;
.super Lcom/google/android/material/bottomsheet/BottomSheetDialog;
.source "SourceFile"


# instance fields
.field public a:Lv/VMenuBar;

.field public b:Landroidx/recyclerview/widget/RecyclerView;

.field public c:Lcom/p1/mobile/android/app/Act;

.field public d:Ll/xsh;

.field public e:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

.field public f:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/feed/data/NotifyUsers;",
            ">;"
        }
    .end annotation
.end field

.field public g:Lcom/p1/mobile/putong/feed/data/NotifyUsers;

.field public h:Ll/x20;

.field public i:Ll/l4g0;

.field public j:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;ILl/x20;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroidx/annotation/StyleRes;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;-><init>(Landroid/content/Context;I)V

    .line 2
    .line 3
    .line 4
    const-class p2, Landroid/app/Dialog;

    .line 5
    .line 6
    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    const-string v0, "p_at_list"

    .line 11
    .line 12
    invoke-static {v0, p2}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    iput-object p2, p0, Ll/ath;->i:Ll/l4g0;

    .line 17
    .line 18
    new-instance p2, Ll/ath$b;

    .line 19
    .line 20
    invoke-direct {p2, p0}, Ll/ath$b;-><init>(Ll/ath;)V

    .line 21
    .line 22
    .line 23
    iput-object p2, p0, Ll/ath;->j:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 24
    .line 25
    iput-object p3, p0, Ll/ath;->h:Ll/x20;

    .line 26
    .line 27
    invoke-direct {p0, p1}, Ll/ath;->v(Lcom/p1/mobile/android/app/Act;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic q(Ll/ath;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ath;->w(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic r(Ll/ath;Lcom/p1/mobile/putong/feed/data/NotifyUsers;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ath;->x(Lcom/p1/mobile/putong/feed/data/NotifyUsers;)V

    return-void
.end method

.method public static bridge synthetic s(Ll/ath;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ath;->e:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    return-object p0
.end method

.method private u()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ath;->a:Lv/VMenuBar;

    .line 2
    .line 3
    new-instance v1, Ll/zsh;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/zsh;-><init>(Ll/ath;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lv/VMenuBar;->setLeftRegionClick(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private v(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/ath;->c:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget p1, Ll/tec0;->s2:I

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const/4 v0, -0x1

    .line 17
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 18
    .line 19
    const/4 v0, -0x2

    .line 20
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 21
    .line 22
    const/16 v0, 0x11

    .line 23
    .line 24
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0, p1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 31
    .line 32
    .line 33
    sget p1, Ll/hdc0;->V1:I

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    check-cast p1, Lv/VMenuBar;

    .line 40
    .line 41
    iput-object p1, p0, Ll/ath;->a:Lv/VMenuBar;

    .line 42
    .line 43
    sget p1, Ll/hdc0;->c:I

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    .line 50
    .line 51
    iput-object p1, p0, Ll/ath;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/ath;->y()V

    .line 54
    .line 55
    .line 56
    invoke-direct {p0}, Ll/ath;->u()V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Ll/ath;->i:Ll/l4g0;

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/l4g0;->i()V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method private synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ath;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public A(Ll/y20;)Ll/ath;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/feed/data/NotifyUsers;",
            ">;)",
            "Ll/ath;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ath;->f:Ll/y20;

    .line 2
    .line 3
    return-object p0
.end method

.method public dismiss()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ath;->i:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ath;->h:Ll/x20;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/ath;->h:Ll/x20;

    .line 15
    .line 16
    invoke-interface {v0}, Ll/x20;->call()V

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public show()V
    .locals 3

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
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iput-object v1, p0, Ll/ath;->e:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 17
    .line 18
    iget-object v1, p0, Ll/ath;->c:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    sget v2, Ll/lbc0;->K0:I

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/ath;->e:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 34
    .line 35
    const/4 v1, 0x3

    .line 36
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/ath;->e:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 40
    .line 41
    iget-object v1, p0, Ll/ath;->j:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Ll/ath;->i:Ll/l4g0;

    .line 47
    .line 48
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public t(Z)Ll/ath;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public final synthetic x(Lcom/p1/mobile/putong/feed/data/NotifyUsers;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/ath;->g:Lcom/p1/mobile/putong/feed/data/NotifyUsers;

    .line 2
    .line 3
    iget-object p1, p0, Ll/ath;->f:Ll/y20;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/ath;->f:Ll/y20;

    .line 12
    .line 13
    iget-object v0, p0, Ll/ath;->g:Lcom/p1/mobile/putong/feed/data/NotifyUsers;

    .line 14
    .line 15
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    invoke-virtual {p0}, Ll/ath;->dismiss()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public y()V
    .locals 3

    .line 1
    new-instance v0, Ll/xsh;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ath;->c:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/xsh;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ll/ath;->d:Ll/xsh;

    .line 9
    .line 10
    new-instance v0, Ll/ath$a;

    .line 11
    .line 12
    iget-object v1, p0, Ll/ath;->c:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    invoke-direct {v0, p0, v1}, Ll/ath$a;-><init>(Ll/ath;Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/ath;->d:Ll/xsh;

    .line 22
    .line 23
    new-instance v2, Ll/ysh;

    .line 24
    .line 25
    invoke-direct {v2, p0}, Ll/ysh;-><init>(Ll/ath;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, v2}, Ll/xsh;->K(Ll/y20;)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Ll/ath;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 32
    .line 33
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/ath;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 37
    .line 38
    iget-object p0, p0, Ll/ath;->d:Ll/xsh;

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public z(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/NotifyUsers;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ath;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    xor-int/lit8 v1, v1, 0x1

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/ath;->d:Ll/xsh;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/xsh;->J(Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
