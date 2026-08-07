.class public Lcom/p1/mobile/putong/core/ui/report/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/report/e$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Lcom/p1/mobile/putong/core/ui/report/d;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VText;

.field public b:Lv/VText;

.field public c:Lv/VRecycler_Fixed;

.field public d:Lv/VEditText;

.field public e:Lv/VText;

.field public f:Lv/VButton;

.field public final g:Landroid/content/Context;

.field public h:Lcom/p1/mobile/putong/core/ui/report/d;

.field public i:Lcom/p1/mobile/putong/core/ui/report/e$c;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/report/e;->g:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/report/e;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/report/e;->k(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/ui/report/e;)Lcom/p1/mobile/putong/core/ui/report/e$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/report/e;->i:Lcom/p1/mobile/putong/core/ui/report/e$c;

    return-object p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/ui/report/e;)Lcom/p1/mobile/putong/core/ui/report/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/report/e;->h:Lcom/p1/mobile/putong/core/ui/report/d;

    return-object p0
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/report/e;->g:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/e1d0;->b(Lcom/p1/mobile/putong/core/ui/report/e;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public e(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/report/e;->d:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/report/e;->i(Ljava/util/List;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/report/e;->i:Lcom/p1/mobile/putong/core/ui/report/e$c;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/report/e$c;->J(Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/core/ui/report/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/report/e;->h:Lcom/p1/mobile/putong/core/ui/report/d;

    .line 2
    .line 3
    return-void
.end method

.method public i(Ljava/util/List;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, " "

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/report/e;->f:Lv/VButton;

    .line 10
    .line 11
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    const/4 v0, 0x5

    .line 16
    if-lt p2, v0, :cond_0

    .line 17
    .line 18
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-nez p1, :cond_0

    .line 23
    .line 24
    const/4 p1, 0x1

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p1, 0x0

    .line 27
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/report/d;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/report/e;->f(Lcom/p1/mobile/putong/core/ui/report/d;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/report/e;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/report/e;->b:Lv/VText;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Am:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Bm:I

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    filled-new-array {v1}, [Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    sget v3, Ll/c9c0;->L:I

    .line 44
    .line 45
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    const/4 v3, 0x2

    .line 50
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-static {v0, v1, v2, v3}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    .line 60
    .line 61
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/report/e;->c:Lv/VRecycler_Fixed;

    .line 62
    .line 63
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/report/e;->g:Landroid/content/Context;

    .line 66
    .line 67
    const/4 v2, 0x4

    .line 68
    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 72
    .line 73
    .line 74
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/report/e;->c:Lv/VRecycler_Fixed;

    .line 75
    .line 76
    new-instance v0, Lcom/p1/mobile/putong/core/ui/report/e$a;

    .line 77
    .line 78
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/report/e$a;-><init>(Lcom/p1/mobile/putong/core/ui/report/e;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 82
    .line 83
    .line 84
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/report/e;->c:Lv/VRecycler_Fixed;

    .line 85
    .line 86
    new-instance v0, Lcom/p1/mobile/putong/core/ui/report/e$c;

    .line 87
    .line 88
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/report/e$c;-><init>(Lcom/p1/mobile/putong/core/ui/report/e;)V

    .line 89
    .line 90
    .line 91
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/report/e;->i:Lcom/p1/mobile/putong/core/ui/report/e$c;

    .line 92
    .line 93
    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 94
    .line 95
    .line 96
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/report/e;->e:Lv/VText;

    .line 97
    .line 98
    const-string p2, "0/100"

    .line 99
    .line 100
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    .line 102
    .line 103
    return-object p1
.end method

.method public final j(Lcom/p1/mobile/putong/core/ui/report/ReportCategory;)I
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->isGP()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/core/ui/report/ReportAct;

    .line 12
    .line 13
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/report/ReportAct;->h:Z

    .line 14
    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    sget p0, Lcom/p1/mobile/putong/core/R$string;->mm:I

    .line 18
    .line 19
    return p0

    .line 20
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->isCategorised()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    sget p0, Lcom/p1/mobile/putong/core/R$string;->km:I

    .line 27
    .line 28
    return p0

    .line 29
    :cond_1
    sget p0, Lcom/p1/mobile/putong/core/R$string;->lm:I

    .line 30
    .line 31
    return p0
.end method

.method public final synthetic k(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/report/e;->h:Lcom/p1/mobile/putong/core/ui/report/d;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/report/e;->d:Lv/VEditText;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/report/d;->s0(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public l(Lcom/p1/mobile/putong/core/ui/report/ReportCategory;Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/report/e;->a:Lv/VText;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget v2, p1, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->resId:I

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/report/e;->d:Lv/VEditText;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/report/e;->j(Lcom/p1/mobile/putong/core/ui/report/ReportCategory;)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHint(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/report/e;->d:Lv/VEditText;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/widget/TextView;->getFilters()[Landroid/text/InputFilter;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/4 v1, 0x1

    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    new-array v0, v1, [Landroid/text/InputFilter;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    array-length v2, v0

    .line 38
    add-int/2addr v2, v1

    .line 39
    invoke-static {v0, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, [Landroid/text/InputFilter;

    .line 44
    .line 45
    :goto_0
    array-length v2, v0

    .line 46
    sub-int/2addr v2, v1

    .line 47
    sget-object v1, Ll/vum;->a:Landroid/text/InputFilter;

    .line 48
    .line 49
    aput-object v1, v0, v2

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/report/e;->d:Lv/VEditText;

    .line 52
    .line 53
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/report/e;->d:Lv/VEditText;

    .line 57
    .line 58
    new-instance v1, Lcom/p1/mobile/putong/core/ui/report/e$b;

    .line 59
    .line 60
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/report/e$b;-><init>(Lcom/p1/mobile/putong/core/ui/report/e;Lcom/p1/mobile/putong/core/ui/report/ReportCategory;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/report/e;->f:Lv/VButton;

    .line 67
    .line 68
    invoke-virtual {p1, p2}, Landroid/view/View;->setEnabled(Z)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/report/e;->f:Lv/VButton;

    .line 72
    .line 73
    new-instance p2, Ll/a1d0;

    .line 74
    .line 75
    invoke-direct {p2, p0}, Ll/a1d0;-><init>(Lcom/p1/mobile/putong/core/ui/report/e;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public m()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/report/e;->d:Lv/VEditText;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method
