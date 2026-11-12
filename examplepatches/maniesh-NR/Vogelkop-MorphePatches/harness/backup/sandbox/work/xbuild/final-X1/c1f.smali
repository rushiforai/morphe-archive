.class public final Lc1f;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/Object;

.field public b:Z

.field public c:Z

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;

.field public final f:Ljava/lang/Object;

.field public final g:Ljava/lang/Object;


# direct methods
.method public constructor <init>(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)V
    .registers 6

    const/4 v0, 0x0

    if-eqz p1, :cond_9

    .line 63
    const-string v1, ""

    invoke-static {v0, v1, p1}, Landroidx/core/graphics/drawable/IconCompat;->d(Landroid/content/res/Resources;Ljava/lang/String;I)Landroidx/core/graphics/drawable/IconCompat;

    move-result-object v0

    :cond_9
    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    invoke-direct {p0, v0, p2, p3, p1}, Lc1f;-><init>(Landroidx/core/graphics/drawable/IconCompat;Ljava/lang/CharSequence;Landroid/app/PendingIntent;Landroid/os/Bundle;)V

    return-void
.end method

.method public constructor <init>(Landroidx/core/graphics/drawable/IconCompat;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V
    .registers 5

    .line 62
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    invoke-direct {p0, p1, p2, p3, v0}, Lc1f;-><init>(Landroidx/core/graphics/drawable/IconCompat;Ljava/lang/CharSequence;Landroid/app/PendingIntent;Landroid/os/Bundle;)V

    return-void
.end method

.method public constructor <init>(Landroidx/core/graphics/drawable/IconCompat;Ljava/lang/CharSequence;Landroid/app/PendingIntent;Landroid/os/Bundle;)V
    .registers 6

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 65
    iput-boolean v0, p0, Lc1f;->b:Z

    .line 66
    iput-boolean v0, p0, Lc1f;->c:Z

    .line 67
    iput-object p1, p0, Lc1f;->d:Ljava/lang/Object;

    .line 68
    invoke-static {p2}, Ll1f;->c(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    iput-object p1, p0, Lc1f;->e:Ljava/lang/Object;

    .line 69
    iput-object p3, p0, Lc1f;->f:Ljava/lang/Object;

    .line 70
    iput-object p4, p0, Lc1f;->g:Ljava/lang/Object;

    const/4 p1, 0x0

    .line 71
    iput-object p1, p0, Lc1f;->a:Ljava/lang/Object;

    .line 72
    iput-boolean v0, p0, Lc1f;->b:Z

    .line 73
    iput-boolean v0, p0, Lc1f;->c:Z

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/RootView;Lx7i;)V
    .registers 4

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lc1f;->f:Ljava/lang/Object;

    .line 53
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lc1f;->a:Ljava/lang/Object;

    .line 54
    new-instance v0, Lode;

    .line 55
    invoke-direct {v0}, Lekc;-><init>()V

    .line 56
    iput-object v0, p0, Lc1f;->g:Ljava/lang/Object;

    const/4 v0, 0x1

    .line 57
    iput-boolean v0, p0, Lc1f;->b:Z

    .line 58
    iput-object p1, p0, Lc1f;->d:Ljava/lang/Object;

    .line 59
    iput-object p2, p0, Lc1f;->e:Ljava/lang/Object;

    .line 60
    new-instance p2, Ltxi;

    const/16 v0, 0x11

    invoke-direct {p2, p0, v0}, Ltxi;-><init>(Ljava/lang/Object;B)V

    sget-object p0, Lr5n;->a:Ljava/util/WeakHashMap;

    .line 61
    invoke-static {p1, p2}, Lh5n;->c(Landroid/view/View;Lbcf;)V

    return-void
.end method

.method public constructor <init>(Lndc;Lx5f;Leyi;Landroid/view/ViewGroup;Landroidx/recyclerview/widget/RecyclerView;Lcom/opera/android/suggestion/SuggestionManagerBridge;Lumi;ZLh42;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lc1f;->d:Ljava/lang/Object;

    iput-object p5, p0, Lc1f;->e:Ljava/lang/Object;

    new-instance v0, Ljqk;

    invoke-direct {v0, p7, p6, p2}, Ljqk;-><init>(Lumi;Lcom/opera/android/suggestion/SuggestionManagerBridge;Lx5f;)V

    iput-object p3, v0, Ljqk;->d:Leyi;

    iput-object v0, p0, Lc1f;->f:Ljava/lang/Object;

    new-instance p2, Lvqk;

    invoke-direct {p2, p5, p8}, Lvqk;-><init>(Landroidx/recyclerview/widget/RecyclerView;Z)V

    invoke-virtual {p5, p2}, Landroidx/recyclerview/widget/RecyclerView;->B0(Landroidx/recyclerview/widget/e;)V

    iput-object p2, p0, Lc1f;->g:Ljava/lang/Object;

    new-instance p2, Lnga;

    invoke-direct {p2, p4, p8}, Lnga;-><init>(Landroid/view/ViewGroup;Z)V

    iput-object p2, p0, Lc1f;->a:Ljava/lang/Object;

    new-instance p2, Ln6k;

    const/16 p3, 0xc

    invoke-direct {p2, p0, p3}, Ln6k;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lw4i;

    const/16 p3, 0x10

    invoke-direct {p0, p2, p3}, Lw4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p9, p1, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method

.method public static c(Landroid/view/View;)Lc1f;
    .registers 2

    :goto_0
    instance-of v0, p0, Lcom/opera/android/RootView;

    if-eqz v0, :cond_9

    check-cast p0, Lcom/opera/android/RootView;

    iget-object p0, p0, Lcom/opera/android/RootView;->x:Lc1f;

    return-object p0

    :cond_9
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/View;

    if-nez v0, :cond_13

    const/4 p0, 0x0

    return-object p0

    :cond_13
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    goto :goto_0
.end method


# virtual methods
.method public final a()Ld1f;
    .registers 15

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iget-object v2, p0, Lc1f;->a:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    if-eqz v2, :cond_3c

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x0

    :goto_15
    if-ge v4, v3, :cond_3c

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Lith;

    iget-boolean v6, v5, Lith;->d:Z

    if-nez v6, :cond_38

    iget-object v6, v5, Lith;->c:[Ljava/lang/CharSequence;

    if-eqz v6, :cond_2a

    array-length v6, v6

    if-nez v6, :cond_38

    :cond_2a
    iget-object v6, v5, Lith;->g:Ljava/util/HashSet;

    if-eqz v6, :cond_38

    invoke-virtual {v6}, Ljava/util/HashSet;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_38

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_15

    :cond_38
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_15

    :cond_3c
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_4e

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v2, v2, [Lith;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lith;

    :cond_4e
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_57

    const/4 v0, 0x0

    :goto_55
    move-object v6, v0

    goto :goto_64

    :cond_57
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Lith;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lith;

    goto :goto_55

    :goto_64
    new-instance v1, Ld1f;

    iget-object v0, p0, Lc1f;->d:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Landroidx/core/graphics/drawable/IconCompat;

    iget-object v0, p0, Lc1f;->e:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Ljava/lang/CharSequence;

    iget-object v0, p0, Lc1f;->f:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, Landroid/app/PendingIntent;

    iget-object v0, p0, Lc1f;->g:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Landroid/os/Bundle;

    iget-boolean v7, p0, Lc1f;->b:Z

    iget-boolean v9, p0, Lc1f;->c:Z

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v8, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-direct/range {v1 .. v13}, Ld1f;-><init>(Landroidx/core/graphics/drawable/IconCompat;Ljava/lang/CharSequence;Landroid/app/PendingIntent;Landroid/os/Bundle;[Lith;ZIZZIIZ)V

    return-object v1
.end method

.method public final b()V
    .registers 5

    iget-boolean v0, p0, Lc1f;->c:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lc1f;->c:Z

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lc1f;->f(Z)V

    iget-object v0, p0, Lc1f;->d:Ljava/lang/Object;

    check-cast v0, Leyi;

    iget-object v1, v0, Leyi;->d:Ljava/lang/Object;

    check-cast v1, Lmrk;

    iget-object v1, v1, Lmrk;->N:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Loqk;

    iget-object v2, v0, Leyi;->c:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/suggestion/Suggestion;

    iget-object v3, v1, Loqk;->d:Lcl0;

    invoke-virtual {v1, v2, v3}, Loqk;->a(Lcom/opera/android/suggestion/Suggestion;Lcl0;)V

    sget-object v2, Lcl0;->b:Lcl0;

    iput-object v2, v1, Loqk;->d:Lcl0;

    iget-object p0, p0, Lc1f;->f:Ljava/lang/Object;

    check-cast p0, Ljqk;

    invoke-virtual {p0}, Ljqk;->a()V

    invoke-virtual {v0}, Leyi;->j()V

    return-void
.end method

.method public final d(Lfck;)V
    .registers 4

    iget-object v0, p0, Lc1f;->f:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    invoke-interface {p1}, Lfck;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lc1f;->c:Z

    invoke-virtual {p0}, Lc1f;->e()V

    return-void
.end method

.method public final e()V
    .registers 1

    iget-object p0, p0, Lc1f;->e:Ljava/lang/Object;

    check-cast p0, Lx7i;

    invoke-virtual {p0}, Lx7i;->run()V

    return-void
.end method

.method public final f(Z)V
    .registers 3

    iget-boolean v0, p0, Lc1f;->b:Z

    if-eq v0, p1, :cond_17

    iput-boolean p1, p0, Lc1f;->b:Z

    iget-object p0, p0, Lc1f;->d:Ljava/lang/Object;

    check-cast p0, Leyi;

    iget-object p0, p0, Leyi;->d:Ljava/lang/Object;

    check-cast p0, Lmrk;

    iget-object p0, p0, Lmrk;->c:Lfbf;

    iget-object p0, p0, Lfbf;->a:Lgbf;

    iget-object p0, p0, Lgbf;->b:Lz43;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_17
    return-void
.end method

.method public final g(Lfck;)V
    .registers 3

    iget-object v0, p0, Lc1f;->f:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    invoke-interface {p1}, Lfck;->getView()Landroid/view/View;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lc1f;->c:Z

    invoke-virtual {p0}, Lc1f;->e()V

    return-void
.end method

.method public final h()V
    .registers 4

    iget-object v0, p0, Lc1f;->a:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    iget-boolean v1, p0, Lc1f;->c:Z

    if-eqz v1, :cond_18

    const/4 v1, 0x0

    iput-boolean v1, p0, Lc1f;->c:Z

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v1, p0, Lc1f;->f:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_19

    :cond_18
    return-void

    :cond_19
    iget-object v1, p0, Lc1f;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/RootView;

    new-instance v2, Lbp;

    invoke-direct {v2, p0}, Lbp;-><init>(Ljava/lang/Object;)V

    invoke-static {v1, v2}, Lq9n;->I(Landroid/view/View;Lp9n;)V

    new-instance p0, Lomj;

    const/16 v1, 0x8

    invoke-direct {p0, v1}, Lomj;-><init>(B)V

    invoke-static {v0, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    return-void
.end method
