.class public Ll/az90;
.super Ll/ep90;
.source "SourceFile"


# instance fields
.field public A:Lv/VText_Tags;

.field public B:Lv/VText_Tags;

.field public C:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public D:Landroid/widget/ImageView;

.field public E:Landroid/widget/ImageView;

.field public F:Landroid/widget/ImageView;

.field public G:Landroid/widget/ImageView;

.field public H:Landroid/widget/ImageView;

.field public I:Landroid/widget/ImageView;

.field public J:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public final K:[Ljava/lang/String;

.field public u:Lv/VLinear_Dividers;

.field public v:Lv/VText;

.field public w:Lv/VText_Tags;

.field public x:Lv/VText_Tags;

.field public y:Lv/VText_Tags;

.field public z:Lv/VText_Tags;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 6
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ep90;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/az90;->C:Ljava/util/HashSet;

    .line 10
    .line 11
    sget-object p1, Lcom/p1/mobile/putong/data/Profile;->TAG_CATEGORIES:[Ljava/lang/String;

    .line 12
    .line 13
    array-length p2, p1

    .line 14
    const/4 v0, 0x0

    .line 15
    :goto_0
    if-ge v0, p2, :cond_1

    .line 16
    .line 17
    aget-object v1, p1, v0

    .line 18
    .line 19
    const-string v2, "personality"

    .line 20
    .line 21
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-nez v2, :cond_0

    .line 26
    .line 27
    iget-object v2, p0, Ll/az90;->C:Ljava/util/HashSet;

    .line 28
    .line 29
    invoke-virtual {v2, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    new-instance p1, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object p1, p0, Ll/az90;->J:Ljava/util/List;

    .line 41
    .line 42
    const-string v4, "literature"

    .line 43
    .line 44
    const-string v5, "places"

    .line 45
    .line 46
    const-string v0, "sports"

    .line 47
    .line 48
    const-string v1, "music"

    .line 49
    .line 50
    const-string v2, "food"

    .line 51
    .line 52
    const-string v3, "movies"

    .line 53
    .line 54
    filled-new-array/range {v0 .. v5}, [Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iput-object p1, p0, Ll/az90;->K:[Ljava/lang/String;

    .line 59
    .line 60
    return-void
.end method

.method public static synthetic R(Ll/az90;Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/az90;->d0(Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic S(Ll/az90;Ljava/util/List;Ljava/util/List;Ljava/lang/Integer;Ljava/lang/Boolean;)Landroid/text/SpannableStringBuilder;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/az90;->e0(Ljava/util/List;Ljava/util/List;Ljava/lang/Integer;Ljava/lang/Boolean;)Landroid/text/SpannableStringBuilder;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic T(Ll/az90;Lv/VText_Tags;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/az90;->b0(Lv/VText_Tags;Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic U(Ljava/lang/String;Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic V(Ljava/lang/String;Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic W(Ll/az90;Lv/VText_Tags;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/az90;->c0(Lv/VText_Tags;)V

    return-void
.end method

.method public static synthetic X(Ljava/util/List;Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

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

.method private Z()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/az90;->w:Lv/VText_Tags;

    .line 2
    .line 3
    iget-object v1, p0, Ll/az90;->x:Lv/VText_Tags;

    .line 4
    .line 5
    iget-object v2, p0, Ll/az90;->A:Lv/VText_Tags;

    .line 6
    .line 7
    iget-object v3, p0, Ll/az90;->z:Lv/VText_Tags;

    .line 8
    .line 9
    iget-object v4, p0, Ll/az90;->y:Lv/VText_Tags;

    .line 10
    .line 11
    iget-object v5, p0, Ll/az90;->B:Lv/VText_Tags;

    .line 12
    .line 13
    filled-new-array/range {v0 .. v5}, [Lv/VText_Tags;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/sy90;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/sy90;-><init>(Ll/az90;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public O()Ll/t3m;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/on2;->c:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ll/t3m;

    .line 4
    .line 5
    return-object p0
.end method

.method public Y(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/bz90;->b(Ll/az90;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final a0()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Tag;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 12
    .line 13
    new-instance v1, Ll/vy90;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/vy90;-><init>(Ll/az90;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public final synthetic b0(Lv/VText_Tags;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    instance-of p2, p2, Landroid/text/Spanned;

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Landroid/text/Spanned;

    .line 14
    .line 15
    invoke-static {p1}, Ll/e1b;->U0(Landroid/text/Spanned;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    :goto_0
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    return p0
.end method

.method public final synthetic c0(Lv/VText_Tags;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->m0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    new-instance v0, Ll/zy90;

    .line 16
    .line 17
    invoke-direct {v0, p0, p1}, Ll/zy90;-><init>(Ll/az90;Lv/VText_Tags;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic d0(Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/az90;->C:Ljava/util/HashSet;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic e0(Ljava/util/List;Ljava/util/List;Ljava/lang/Integer;Ljava/lang/Boolean;)Landroid/text/SpannableStringBuilder;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p3, p4, p2}, Ll/ep90;->H(Ljava/util/List;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/util/List;)Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f0(Lcom/p1/mobile/putong/data/User;)V
    .locals 7

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/t3m;->P1()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0}, Ll/t3m;->me()Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 32
    .line 33
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    new-instance v1, Ll/ty90;

    .line 37
    .line 38
    invoke-direct {v1, v0}, Ll/ty90;-><init>(Ljava/util/List;)V

    .line 39
    .line 40
    .line 41
    invoke-static {p1, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    new-instance v2, Ll/uy90;

    .line 46
    .line 47
    invoke-direct {v2, v0}, Ll/uy90;-><init>(Ljava/util/List;)V

    .line 48
    .line 49
    .line 50
    invoke-static {p1, v2}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    move-object v0, v1

    .line 55
    :goto_0
    iget-object v1, p0, Ll/az90;->w:Lv/VText_Tags;

    .line 56
    .line 57
    iget-object v2, p0, Ll/az90;->x:Lv/VText_Tags;

    .line 58
    .line 59
    iget-object v3, p0, Ll/az90;->y:Lv/VText_Tags;

    .line 60
    .line 61
    iget-object v4, p0, Ll/az90;->z:Lv/VText_Tags;

    .line 62
    .line 63
    iget-object v5, p0, Ll/az90;->A:Lv/VText_Tags;

    .line 64
    .line 65
    iget-object v6, p0, Ll/az90;->B:Lv/VText_Tags;

    .line 66
    .line 67
    filled-new-array/range {v1 .. v6}, [Lv/VText_Tags;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {p0, p1, v0, v1}, Ll/az90;->g0(Ljava/util/List;Ljava/util/List;[Lv/VText_Tags;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final g0(Ljava/util/List;Ljava/util/List;[Lv/VText_Tags;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Tag;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Tag;",
            ">;[",
            "Lv/VText_Tags;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/az90;->J:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move v1, v0

    .line 8
    :goto_0
    array-length v2, p3

    .line 9
    if-ge v1, v2, :cond_5

    .line 10
    .line 11
    iget-object v2, p0, Ll/az90;->K:[Ljava/lang/String;

    .line 12
    .line 13
    aget-object v2, v2, v1

    .line 14
    .line 15
    new-instance v3, Ll/wy90;

    .line 16
    .line 17
    invoke-direct {v3, v2}, Ll/wy90;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p2, v3}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    new-instance v4, Ll/xy90;

    .line 25
    .line 26
    invoke-direct {v4, v2}, Ll/xy90;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p1, v4}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    aget-object v5, p3, v1

    .line 34
    .line 35
    sget-object v6, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 36
    .line 37
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 38
    .line 39
    .line 40
    aget-object v5, p3, v1

    .line 41
    .line 42
    new-instance v6, Ll/yy90;

    .line 43
    .line 44
    invoke-direct {v6, p0, v3, v4}, Ll/yy90;-><init>(Ll/az90;Ljava/util/List;Ljava/util/List;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v5, v6}, Lv/VText_Tags;->setTags(Ll/rcj;)V

    .line 48
    .line 49
    .line 50
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 51
    .line 52
    .line 53
    move-result v5

    .line 54
    if-eqz v5, :cond_0

    .line 55
    .line 56
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    .line 57
    .line 58
    .line 59
    move-result v5

    .line 60
    if-eqz v5, :cond_0

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    invoke-interface {v5}, Ll/t3m;->m0()Z

    .line 67
    .line 68
    .line 69
    move-result v5

    .line 70
    if-nez v5, :cond_0

    .line 71
    .line 72
    aget-object v5, p3, v1

    .line 73
    .line 74
    const/16 v6, 0x8

    .line 75
    .line 76
    invoke-virtual {p0, v5, v6}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 77
    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_0
    aget-object v5, p3, v1

    .line 81
    .line 82
    invoke-virtual {p0, v5, v0}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 83
    .line 84
    .line 85
    :goto_1
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 86
    .line 87
    .line 88
    move-result-object v5

    .line 89
    invoke-interface {v5}, Ll/t3m;->m0()Z

    .line 90
    .line 91
    .line 92
    move-result v5

    .line 93
    if-eqz v5, :cond_4

    .line 94
    .line 95
    new-instance v5, Ljava/util/ArrayList;

    .line 96
    .line 97
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 98
    .line 99
    .line 100
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 101
    .line 102
    .line 103
    move-result v6

    .line 104
    if-nez v6, :cond_1

    .line 105
    .line 106
    invoke-interface {v5, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 107
    .line 108
    .line 109
    :cond_1
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 110
    .line 111
    .line 112
    move-result v3

    .line 113
    if-nez v3, :cond_2

    .line 114
    .line 115
    invoke-interface {v5, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 116
    .line 117
    .line 118
    :cond_2
    const-string v3, "sports"

    .line 119
    .line 120
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 121
    .line 122
    .line 123
    move-result v2

    .line 124
    if-eqz v2, :cond_4

    .line 125
    .line 126
    iget-object v2, p0, Ll/az90;->v:Lv/VText;

    .line 127
    .line 128
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 129
    .line 130
    .line 131
    move-result v3

    .line 132
    if-lez v3, :cond_3

    .line 133
    .line 134
    const/high16 v3, 0x41400000    # 12.0f

    .line 135
    .line 136
    :goto_2
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 137
    .line 138
    .line 139
    move-result v3

    .line 140
    goto :goto_3

    .line 141
    :cond_3
    const/high16 v3, 0x40800000    # 4.0f

    .line 142
    .line 143
    goto :goto_2

    .line 144
    :goto_3
    invoke-static {v2, v3}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 145
    .line 146
    .line 147
    :cond_4
    add-int/lit8 v1, v1, 0x1

    .line 148
    .line 149
    goto/16 :goto_0

    .line 150
    .line 151
    :cond_5
    return-void
.end method

.method public j(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/on2;->j(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/az90;->v:Lv/VText;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-interface {v0}, Ll/nol;->act()Landroid/app/Activity;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v1, Ll/c9c0;->Q1:I

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-interface {p1}, Ll/t3m;->m0()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-nez p1, :cond_0

    .line 38
    .line 39
    invoke-direct {p0}, Ll/az90;->Z()V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public l()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->m0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/az90;->a0()Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Interest;->tags:Ljava/util/List;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-interface {p0}, Ll/t3m;->P1()Z

    .line 43
    .line 44
    .line 45
    const/4 p0, 0x1

    .line 46
    return p0

    .line 47
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 48
    return p0
.end method

.method public s(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->H2()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0, p1}, Ll/az90;->Y(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public t()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/az90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/az90;->f0(Lcom/p1/mobile/putong/data/User;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
