.class public Ll/bme0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/vle0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VFrame;

.field public b:Lv/VProgressBar;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lv/VList;

.field public e:Landroid/widget/FrameLayout;

.field public f:Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;

.field public g:Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;

.field public h:Ll/kbe0;

.field public i:I

.field public j:Landroidx/appcompat/widget/SearchView;

.field public k:Ll/vle0;

.field public l:Landroid/view/View;

.field public m:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Ll/bme0;->i:I

    .line 6
    .line 7
    iput-object p1, p0, Ll/bme0;->g:Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a(Ll/bme0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bme0;->n(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/bme0;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bme0;->p()Z

    move-result p0

    return p0
.end method

.method public static synthetic c(Ll/bme0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bme0;->q(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic d(Ll/bme0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bme0;->s(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic e(Ll/bme0;)Ll/vle0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bme0;->k:Ll/vle0;

    return-object p0
.end method

.method private j()Landroid/widget/TextView;
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/bme0;->g:Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/android/app/Act;->TOOLBAR_TITLE_VIEW_FILED:Ljava/lang/reflect/Field;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Landroid/widget/TextView;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    return-object p0

    .line 16
    :catch_0
    move-exception p0

    .line 17
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method private synthetic q(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->l:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput p1, p0, Ll/bme0;->i:I

    .line 11
    .line 12
    iget-object p0, p0, Ll/bme0;->d:Lv/VList;

    .line 13
    .line 14
    invoke-virtual {p0, p1, p1}, Landroid/widget/AbsListView;->setSelectionFromTop(II)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object v0, p0, Ll/bme0;->h:Ll/kbe0;

    .line 19
    .line 20
    sget-object v1, Ll/e1b;->i:[Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v1, p1}, Ll/jyb;->H([Ljava/lang/Object;Ljava/lang/Object;)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-virtual {v0, p1}, Ll/kbe0;->getPositionForSection(I)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-nez p1, :cond_1

    .line 31
    .line 32
    iget p1, p0, Ll/bme0;->i:I

    .line 33
    .line 34
    :cond_1
    iput p1, p0, Ll/bme0;->i:I

    .line 35
    .line 36
    iget-object p0, p0, Ll/bme0;->d:Lv/VList;

    .line 37
    .line 38
    const/high16 v0, 0x41000000    # 8.0f

    .line 39
    .line 40
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    neg-int v0, v0

    .line 45
    invoke-virtual {p0, p1, v0}, Landroid/widget/AbsListView;->setSelectionFromTop(II)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method private synthetic s(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/ame0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/ame0;-><init>(Ll/bme0;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private x(Z)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ll/bme0;->j()Landroid/widget/TextView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const-string v2, ""

    .line 7
    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    const/4 v3, 0x0

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p1, p0, Ll/bme0;->j:Landroidx/appcompat/widget/SearchView;

    .line 21
    .line 22
    invoke-virtual {p1, v2, v1}, Landroidx/appcompat/widget/SearchView;->setQuery(Ljava/lang/CharSequence;Z)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Ll/bme0;->h:Ll/kbe0;

    .line 26
    .line 27
    invoke-virtual {p1, v3}, Ll/kbe0;->y(Z)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/bme0;->d:Lv/VList;

    .line 31
    .line 32
    invoke-virtual {p1, v3}, Landroid/widget/AdapterView;->setSelection(I)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/bme0;->m:Landroid/view/View;

    .line 36
    .line 37
    invoke-virtual {p0, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    iget-object p1, p0, Ll/bme0;->m:Landroid/view/View;

    .line 42
    .line 43
    invoke-virtual {p1, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 44
    .line 45
    .line 46
    new-instance p1, Ll/ode;

    .line 47
    .line 48
    iget-object v1, p0, Ll/bme0;->g:Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;

    .line 49
    .line 50
    invoke-direct {p1, v1}, Ll/ode;-><init>(Landroid/content/Context;)V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Ll/bme0;->g:Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;

    .line 54
    .line 55
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    sget v3, Ll/c9c0;->O1:I

    .line 60
    .line 61
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    invoke-virtual {p1, v1}, Ll/ode;->c(I)V

    .line 66
    .line 67
    .line 68
    const/high16 v1, 0x3f800000    # 1.0f

    .line 69
    .line 70
    invoke-virtual {p1, v1}, Ll/ode;->e(F)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Ll/bme0;->j:Landroidx/appcompat/widget/SearchView;

    .line 74
    .line 75
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Ll/bme0;->l:Landroid/view/View;

    .line 79
    .line 80
    const/16 v1, 0x8

    .line 81
    .line 82
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Ll/bme0;->k:Ll/vle0;

    .line 86
    .line 87
    invoke-virtual {p0, v2}, Ll/vle0;->s0(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    if-eqz p0, :cond_2

    .line 95
    .line 96
    const/4 p0, 0x4

    .line 97
    invoke-virtual {v0, p0}, Landroid/view/View;->setVisibility(I)V

    .line 98
    .line 99
    .line 100
    :cond_2
    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/School;Z)V
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "selected_school"

    .line 7
    .line 8
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    const-string p1, "highConfidenceError"

    .line 12
    .line 13
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/bme0;->g:Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;

    .line 17
    .line 18
    const/4 p2, -0x1

    .line 19
    invoke-virtual {p1, p2, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/bme0;->g:Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/bme0;->g:Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/cme0;->b(Ll/bme0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public i(Ll/vle0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bme0;->k:Ll/vle0;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/vle0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/bme0;->i(Ll/vle0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bme0;->f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bme0;->c:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x4

    .line 9
    if-ne v0, v2, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/bme0;->c:Landroid/widget/FrameLayout;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/bme0;->b:Lv/VProgressBar;

    .line 17
    .line 18
    invoke-virtual {v0}, Lv/VProgressBar;->b()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/bme0;->b:Lv/VProgressBar;

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object v0, p0, Ll/bme0;->j:Landroidx/appcompat/widget/SearchView;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Ll/bme0;->j:Landroidx/appcompat/widget/SearchView;

    .line 35
    .line 36
    invoke-virtual {v0}, Landroidx/appcompat/widget/SearchView;->isIconified()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_1

    .line 41
    .line 42
    iget-object p0, p0, Ll/bme0;->k:Ll/vle0;

    .line 43
    .line 44
    const-string v0, ""

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Ll/vle0;->s0(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    iget-object v0, p0, Ll/bme0;->h:Ll/kbe0;

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ll/kbe0;->y(Z)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Ll/bme0;->d:Lv/VList;

    .line 56
    .line 57
    invoke-virtual {p0, v1}, Landroid/widget/AdapterView;->setSelection(I)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public l(Landroid/view/Menu;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bme0;->g:Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getMenuInflater()Landroid/view/MenuInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/app/PutongAct;->initSearchMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)Ll/bkj0;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Landroidx/appcompat/widget/SearchView;

    .line 14
    .line 15
    iput-object v0, p0, Ll/bme0;->j:Landroidx/appcompat/widget/SearchView;

    .line 16
    .line 17
    iget-object v1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v1, Landroid/view/View;

    .line 20
    .line 21
    iput-object v1, p0, Ll/bme0;->l:Landroid/view/View;

    .line 22
    .line 23
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast p1, Landroid/view/View;

    .line 26
    .line 27
    iput-object p1, p0, Ll/bme0;->m:Landroid/view/View;

    .line 28
    .line 29
    iget-object p1, p0, Ll/bme0;->g:Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;

    .line 30
    .line 31
    sget v1, Lcom/p1/mobile/putong/core/R$string;->aq:I

    .line 32
    .line 33
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/SearchView;->setQueryHint(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/bme0;->j:Landroidx/appcompat/widget/SearchView;

    .line 41
    .line 42
    new-instance v0, Ll/xle0;

    .line 43
    .line 44
    invoke-direct {v0, p0}, Ll/xle0;-><init>(Ll/bme0;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView;->setOnSearchClickListener(Landroid/view/View$OnClickListener;)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/bme0;->j:Landroidx/appcompat/widget/SearchView;

    .line 51
    .line 52
    new-instance v0, Ll/bme0$a;

    .line 53
    .line 54
    invoke-direct {v0, p0}, Ll/bme0$a;-><init>(Ll/bme0;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView;->setOnQueryTextListener(Landroidx/appcompat/widget/SearchView$m;)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Ll/bme0;->j:Landroidx/appcompat/widget/SearchView;

    .line 61
    .line 62
    new-instance v0, Ll/yle0;

    .line 63
    .line 64
    invoke-direct {v0, p0}, Ll/yle0;-><init>(Ll/bme0;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView;->setOnCloseListener(Landroidx/appcompat/widget/SearchView$l;)V

    .line 68
    .line 69
    .line 70
    iget-object p0, p0, Ll/bme0;->j:Landroidx/appcompat/widget/SearchView;

    .line 71
    .line 72
    const/4 p1, 0x0

    .line 73
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/SearchView;->setIconified(Z)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public m()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bme0;->j:Landroidx/appcompat/widget/SearchView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/widget/SearchView;->isIconified()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-direct {p0, p1}, Ll/bme0;->x(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic p()Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Ll/bme0;->x(Z)V

    .line 3
    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bme0;->g:Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/R$string;->z0:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/kbe0;

    .line 13
    .line 14
    iget-object v1, p0, Ll/bme0;->g:Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ll/kbe0;-><init>(Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/bme0;->h:Ll/kbe0;

    .line 20
    .line 21
    iget-object v1, p0, Ll/bme0;->d:Lv/VList;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Lv/VList;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/bme0;->f:Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;

    .line 27
    .line 28
    iget-object v1, p0, Ll/bme0;->e:Landroid/widget/FrameLayout;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->setDialog(Landroid/widget/FrameLayout;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/bme0;->f:Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;

    .line 34
    .line 35
    new-instance v1, Ll/zle0;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/zle0;-><init>(Ll/bme0;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView;->setOnTouchingLetterChangedListener(Lcom/p1/mobile/putong/core/ui/secretcrush/ScrollIndexView$a;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/bme0;->c:Landroid/widget/FrameLayout;

    .line 44
    .line 45
    const/4 v1, 0x4

    .line 46
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Ll/bme0;->b:Lv/VProgressBar;

    .line 50
    .line 51
    const/4 v0, 0x0

    .line 52
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public u()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/bme0;->d:Lv/VList;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/AdapterView;->setSelection(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public v()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bme0;->j:Landroidx/appcompat/widget/SearchView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/appcompat/widget/SearchView;->isIconified()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/bme0;->j:Landroidx/appcompat/widget/SearchView;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/SearchView;->setIconified(Z)V

    .line 13
    .line 14
    .line 15
    return v0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public w(Lcom/p1/mobile/putong/core/data/School;Z)V
    .locals 3

    .line 1
    iget-object p2, p0, Ll/bme0;->g:Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;

    .line 2
    .line 3
    invoke-virtual {p2}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const-string v0, "needHighConfidenceJudge"

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/School;->id:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v0, p0, Ll/bme0;->g:Lcom/p1/mobile/putong/core/ui/campus/SelectSchoolAct;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v2, "preSelectedSchoolId"

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    if-nez p2, :cond_0

    .line 35
    .line 36
    iget-object p0, p0, Ll/bme0;->k:Ll/vle0;

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Ll/vle0;->t0(Lcom/p1/mobile/putong/core/data/School;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    invoke-virtual {p0, p1, v1}, Ll/bme0;->A(Lcom/p1/mobile/putong/core/data/School;Z)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public y()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/bme0;->h:Ll/kbe0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Ll/kbe0;->y(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public z()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/bme0;->h:Ll/kbe0;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Ll/kbe0;->y(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
