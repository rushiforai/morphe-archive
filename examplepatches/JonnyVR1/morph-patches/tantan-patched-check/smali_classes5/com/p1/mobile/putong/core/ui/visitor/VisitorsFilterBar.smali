.class public Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# static fields
.field public static final m:I

.field public static final n:I


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Landroid/widget/LinearLayout;

.field public c:Lv/VCheckBox;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lv/VCheckBox;

.field public f:Landroid/widget/LinearLayout;

.field public g:Lv/VCheckBox;

.field public h:Landroid/widget/LinearLayout;

.field public i:Lv/VCheckBox;

.field public j:Lv/VRecyclerView;

.field public k:Ll/mam;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public l:Ll/ahm0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/f9c0;->d:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    sput v0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->m:I

    .line 14
    .line 15
    const-string v0, "#CC000000"

    .line 16
    .line 17
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    sput v0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->n:I

    .line 22
    .line 23
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->j(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->i(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->l(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->k(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/fhm0;->a(Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final f()Lcom/p1/mobile/android/app/Act;
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

.method public g()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->b:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->d:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->f:Landroid/widget/LinearLayout;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->h:Landroid/widget/LinearLayout;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->j:Lv/VRecyclerView;

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->m()V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->k:Ll/mam;

    .line 31
    .line 32
    invoke-interface {p0, v1}, Ll/mam;->b(Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public h(Ll/mam;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->k:Ll/mam;

    .line 2
    .line 3
    new-instance v0, Ll/ahm0;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->f()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, v1, p1}, Ll/ahm0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/mam;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->l:Ll/ahm0;

    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->j:Lv/VRecyclerView;

    .line 15
    .line 16
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->f()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->j:Lv/VRecyclerView;

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->l:Ll/ahm0;

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->b:Landroid/widget/LinearLayout;

    .line 36
    .line 37
    new-instance v0, Ll/bhm0;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/bhm0;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;)V

    .line 40
    .line 41
    .line 42
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->d:Landroid/widget/LinearLayout;

    .line 46
    .line 47
    new-instance v0, Ll/chm0;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Ll/chm0;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;)V

    .line 50
    .line 51
    .line 52
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->f:Landroid/widget/LinearLayout;

    .line 56
    .line 57
    new-instance v0, Ll/dhm0;

    .line 58
    .line 59
    invoke-direct {v0, p0}, Ll/dhm0;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;)V

    .line 60
    .line 61
    .line 62
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->h:Landroid/widget/LinearLayout;

    .line 66
    .line 67
    new-instance v0, Ll/ehm0;

    .line 68
    .line 69
    invoke-direct {v0, p0}, Ll/ehm0;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;)V

    .line 70
    .line 71
    .line 72
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->m()V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public final synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->b:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->p(I)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->g()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->d:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->p(I)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->g()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic k(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->f:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x2

    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->p(I)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->g()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic l(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->h:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bsj0;->u(Landroid/view/ViewGroup;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x3

    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->p(I)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->g()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final m()V
    .locals 5

    .line 1
    invoke-static {}, Ll/afm0;->a()Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->k:Ll/mam;

    .line 6
    .line 7
    invoke-interface {v1}, Ll/mam;->a()Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget v2, v1, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->minAge:I

    .line 12
    .line 13
    iget v3, v0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->minAge:I

    .line 14
    .line 15
    if-ne v2, v3, :cond_1

    .line 16
    .line 17
    iget v3, v1, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->maxAge:I

    .line 18
    .line 19
    iget v4, v0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->maxAge:I

    .line 20
    .line 21
    if-eq v3, v4, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->e:Lv/VCheckBox;

    .line 25
    .line 26
    const-string v3, "\u5e74\u9f84"

    .line 27
    .line 28
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->o(Lv/VCheckBox;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_1
    :goto_0
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->e:Lv/VCheckBox;

    .line 33
    .line 34
    iget v4, v1, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->maxAge:I

    .line 35
    .line 36
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/core/ui/visitor/e;->a(II)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {p0, v3, v2}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->n(Lv/VCheckBox;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :goto_1
    iget v2, v1, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->distance:I

    .line 44
    .line 45
    iget v3, v0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->distance:I

    .line 46
    .line 47
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->c:Lv/VCheckBox;

    .line 48
    .line 49
    if-eq v2, v3, :cond_2

    .line 50
    .line 51
    invoke-static {v2}, Lcom/p1/mobile/putong/core/ui/visitor/e;->b(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {p0, v4, v2}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->n(Lv/VCheckBox;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    goto :goto_2

    .line 59
    :cond_2
    const-string v2, "\u8ddd\u79bb"

    .line 60
    .line 61
    invoke-virtual {p0, v4, v2}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->o(Lv/VCheckBox;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :goto_2
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->sort:Lcom/p1/mobile/putong/core/data/VisitorSortType;

    .line 65
    .line 66
    iget-object v3, v0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->sort:Lcom/p1/mobile/putong/core/data/VisitorSortType;

    .line 67
    .line 68
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->g:Lv/VCheckBox;

    .line 73
    .line 74
    const-string v4, "\u6392\u5e8f"

    .line 75
    .line 76
    if-nez v2, :cond_3

    .line 77
    .line 78
    invoke-virtual {p0, v3, v4}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->n(Lv/VCheckBox;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    goto :goto_3

    .line 82
    :cond_3
    invoke-virtual {p0, v3, v4}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->o(Lv/VCheckBox;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    :goto_3
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->filter:Lcom/p1/mobile/putong/core/data/VisitorFilterType;

    .line 86
    .line 87
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->filter:Lcom/p1/mobile/putong/core/data/VisitorFilterType;

    .line 88
    .line 89
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->i:Lv/VCheckBox;

    .line 94
    .line 95
    const-string v2, "\u7b5b\u9009"

    .line 96
    .line 97
    if-nez v0, :cond_4

    .line 98
    .line 99
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->n(Lv/VCheckBox;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_4
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->o(Lv/VCheckBox;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public final n(Lv/VCheckBox;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2
    .line 3
    .line 4
    sget p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->m:I

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final o(Lv/VCheckBox;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2
    .line 3
    .line 4
    sget p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->n:I

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->b:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    move v3, v2

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v3, v1

    .line 10
    :goto_0
    invoke-static {v0, v3}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->d:Landroid/widget/LinearLayout;

    .line 14
    .line 15
    if-ne p1, v2, :cond_1

    .line 16
    .line 17
    move v3, v2

    .line 18
    goto :goto_1

    .line 19
    :cond_1
    move v3, v1

    .line 20
    :goto_1
    invoke-static {v0, v3}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->f:Landroid/widget/LinearLayout;

    .line 24
    .line 25
    const/4 v3, 0x2

    .line 26
    if-ne p1, v3, :cond_2

    .line 27
    .line 28
    move v4, v2

    .line 29
    goto :goto_2

    .line 30
    :cond_2
    move v4, v1

    .line 31
    :goto_2
    invoke-static {v0, v4}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->h:Landroid/widget/LinearLayout;

    .line 35
    .line 36
    const/4 v4, 0x3

    .line 37
    if-ne p1, v4, :cond_3

    .line 38
    .line 39
    move v1, v2

    .line 40
    :cond_3
    invoke-static {v0, v1}, Ll/bsj0;->t(Landroid/view/ViewGroup;Z)Z

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->j:Lv/VRecyclerView;

    .line 44
    .line 45
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->m()V

    .line 49
    .line 50
    .line 51
    if-nez p1, :cond_4

    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->c:Lv/VCheckBox;

    .line 54
    .line 55
    sget v1, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->m:I

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 58
    .line 59
    .line 60
    goto :goto_3

    .line 61
    :cond_4
    if-ne p1, v2, :cond_5

    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->e:Lv/VCheckBox;

    .line 64
    .line 65
    sget v1, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->m:I

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 68
    .line 69
    .line 70
    goto :goto_3

    .line 71
    :cond_5
    if-ne p1, v3, :cond_6

    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->g:Lv/VCheckBox;

    .line 74
    .line 75
    sget v1, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->m:I

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 78
    .line 79
    .line 80
    goto :goto_3

    .line 81
    :cond_6
    if-ne p1, v4, :cond_7

    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->i:Lv/VCheckBox;

    .line 84
    .line 85
    sget v1, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->m:I

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 88
    .line 89
    .line 90
    :cond_7
    :goto_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->l:Ll/ahm0;

    .line 91
    .line 92
    invoke-virtual {v0, p1}, Ll/ahm0;->I(I)V

    .line 93
    .line 94
    .line 95
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterBar;->k:Ll/mam;

    .line 96
    .line 97
    invoke-interface {p0, v2}, Ll/mam;->b(Z)V

    .line 98
    .line 99
    .line 100
    return-void
.end method
