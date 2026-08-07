.class public Ll/lj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/lj0$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/kj0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VFrame;

.field public b:Landroid/widget/LinearLayout;

.field public c:Lv/VImage;

.field public d:Lv/VText;

.field public e:Lv/VPullUpRecyclerView;

.field public f:Lv/VProgressBar;

.field public g:Ll/ej0;

.field public h:Lcom/p1/mobile/putong/core/newui/messages/AllPairsAct;

.field public i:Ll/kj0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/AllPairsAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/lj0;->h:Lcom/p1/mobile/putong/core/newui/messages/AllPairsAct;

    .line 5
    .line 6
    return-void
.end method

.method public static bridge synthetic a(Ll/lj0;Landroid/widget/LinearLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lj0;->b:Landroid/widget/LinearLayout;

    return-void
.end method

.method public static bridge synthetic b(Ll/lj0;Lv/VImage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lj0;->c:Lv/VImage;

    return-void
.end method

.method public static bridge synthetic c(Ll/lj0;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lj0;->d:Lv/VText;

    return-void
.end method

.method public static bridge synthetic d(Ll/lj0;Lv/VPullUpRecyclerView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lj0;->e:Lv/VPullUpRecyclerView;

    return-void
.end method

.method public static bridge synthetic e(Ll/lj0;Lv/VProgressBar;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lj0;->f:Lv/VProgressBar;

    return-void
.end method

.method public static bridge synthetic f(Ll/lj0;Lv/VFrame;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lj0;->a:Lv/VFrame;

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/lj0;->h:Lcom/p1/mobile/putong/core/newui/messages/AllPairsAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/lj0$b;->a(Ll/lj0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/kj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/lj0;->j(Ll/kj0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/lj0;->i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Ll/lj0;->a:Lv/VFrame;

    .line 6
    .line 7
    const/4 p2, -0x1

    .line 8
    invoke-virtual {p0, p2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method

.method public j(Ll/kj0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lj0;->i:Ll/kj0;

    .line 2
    .line 3
    return-void
.end method

.method public k()Ll/ej0;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lj0;->g:Ll/ej0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/ej0;

    .line 6
    .line 7
    iget-object v1, p0, Ll/lj0;->h:Lcom/p1/mobile/putong/core/newui/messages/AllPairsAct;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ll/ej0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/lj0;->g:Ll/ej0;

    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Ll/lj0;->g:Ll/ej0;

    .line 15
    .line 16
    return-object p0
.end method

.method public l(ZZ)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x4

    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/lj0;->b:Landroid/widget/LinearLayout;

    .line 6
    .line 7
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/lj0;->f:Lv/VProgressBar;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/lj0;->e:Lv/VPullUpRecyclerView;

    .line 16
    .line 17
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object p1, p0, Ll/lj0;->b:Landroid/widget/LinearLayout;

    .line 22
    .line 23
    if-eqz p2, :cond_1

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ll/lj0;->f:Lv/VProgressBar;

    .line 29
    .line 30
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/lj0;->e:Lv/VPullUpRecyclerView;

    .line 34
    .line 35
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/lj0;->f:Lv/VProgressBar;

    .line 43
    .line 44
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Ll/lj0;->e:Lv/VPullUpRecyclerView;

    .line 48
    .line 49
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public m()V
    .locals 3

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 2
    .line 3
    iget-object v1, p0, Ll/lj0;->h:Lcom/p1/mobile/putong/core/newui/messages/AllPairsAct;

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Ll/lj0;->e:Lv/VPullUpRecyclerView;

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/lj0;->e:Lv/VPullUpRecyclerView;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/lj0;->k()Ll/ej0;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/zg6;->e()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Ll/lj0;->e:Lv/VPullUpRecyclerView;

    .line 30
    .line 31
    new-instance v1, Ll/lj0$a;

    .line 32
    .line 33
    invoke-direct {v1, p0, v0}, Ll/lj0$a;-><init>(Ll/lj0;Landroidx/recyclerview/widget/RecyclerView;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addOnItemTouchListener(Landroidx/recyclerview/widget/RecyclerView$s;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public n(Ll/vg60;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/lj0;->k()Ll/ej0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/ej0;->G(Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    const/4 v0, 0x0

    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move p1, v0

    .line 28
    :goto_0
    invoke-virtual {p0, v0, p1}, Ll/lj0;->l(ZZ)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public p()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lj0;->d:Lv/VText;

    .line 2
    .line 3
    const-string v1, "\u6682\u65f6\u6ca1\u6709\u672a\u804a\u914d\u5bf9"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/lj0;->c:Lv/VImage;

    .line 9
    .line 10
    sget v0, Ll/dbc0;->k0:I

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public q(Ljava/lang/CharSequence;)V
    .locals 2

    .line 1
    :try_start_0
    sget-object v0, Lcom/p1/mobile/android/app/Act;->TOOLBAR_TITLE_VIEW_FILED:Ljava/lang/reflect/Field;

    .line 2
    .line 3
    iget-object v1, p0, Ll/lj0;->h:Lcom/p1/mobile/putong/core/newui/messages/AllPairsAct;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/widget/TextView;

    .line 14
    .line 15
    const/high16 v1, 0x420c0000    # 35.0f

    .line 16
    .line 17
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    neg-int v1, v1

    .line 22
    int-to-float v1, v1

    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 24
    .line 25
    .line 26
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 29
    .line 30
    .line 31
    const-string v1, "#CC000000"

    .line 32
    .line 33
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :catch_0
    move-exception v0

    .line 42
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 46
    .line 47
    .line 48
    :goto_0
    iget-object p0, p0, Ll/lj0;->h:Lcom/p1/mobile/putong/core/newui/messages/AllPairsAct;

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method
