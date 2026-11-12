.class public final Lc9j;
.super Llj;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u0007\u0018\u00002\u00020\u0001:\u0002\u0004\u0005B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0006"
    }
    d2 = {
        "Lc9j;",
        "Llj;",
        "<init>",
        "()V",
        "b9j",
        "y8j",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final synthetic w:[Lxtb;

.field public static final x:Lcs;


# instance fields
.field public final r:Lzyk;

.field public final s:Lzyk;

.field public t:Lov0;

.field public final u:Ljp3;

.field public v:Lh63;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ld6h;

    const-class v1, Lc9j;

    const-string v2, "emptyAdapterHelper"

    const-string v3, "getEmptyAdapterHelper()Lcom/opera/android/view/EmptyAdapterHelper;"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x1

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    sput-object v1, Lc9j;->w:[Lxtb;

    new-instance v0, Lcs;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lcs;-><init>(B)V

    sput-object v0, Lc9j;->x:Lcs;

    return-void
.end method

.method public constructor <init>()V
    .registers 4

    const v0, 0x7f0d01f6

    invoke-static {v0}, Lu7k;->j(I)Lu7k;

    move-result-object v0

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    new-instance v0, Lyse;

    const/16 v1, 0xe

    invoke-direct {v0, p0, v1}, Lyse;-><init>(Landroidx/fragment/app/Fragment;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lc9j;->r:Lzyk;

    new-instance v0, Lu8j;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lu8j;-><init>(Lc9j;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lc9j;->s:Lzyk;

    new-instance v0, Ljp3;

    new-instance v1, Lu8j;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lu8j;-><init>(Lc9j;B)V

    invoke-direct {v0, v1}, Ljp3;-><init>(Lkotlin/jvm/functions/Function0;)V

    iput-object v0, p0, Lc9j;->u:Ljp3;

    return-void
.end method


# virtual methods
.method public final G0()V
    .registers 2

    iget-object v0, p0, Lc9j;->t:Lov0;

    iget-object v0, v0, Lov0;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-static {v0}, Lq9n;->u(Landroid/view/View;)Z

    iget-object p0, p0, Lc9j;->t:Lov0;

    iget-object p0, p0, Lov0;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p0}, Landroid/view/View;->clearFocus()V

    return-void
.end method

.method public final H0()Lyz7;
    .registers 3

    sget-object v0, Lc9j;->w:[Lxtb;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object v1, p0, Lc9j;->u:Ljp3;

    invoke-virtual {v1, p0, v0}, Ljp3;->a(Landroidx/fragment/app/Fragment;Lxtb;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyz7;

    return-object p0
.end method

.method public final I0(Z)V
    .registers 6

    iget-object v0, p0, Lc9j;->r:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lo9j;

    iget-object v1, p0, Lc9j;->t:Lov0;

    iget-object v1, v1, Lov0;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    if-eqz v1, :cond_19

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_1a

    :cond_19
    const/4 v1, 0x0

    :goto_1a
    iget-boolean v2, v0, Lo9j;->h:Z

    const/4 v3, 0x1

    if-nez v2, :cond_28

    iput-boolean v3, v0, Lo9j;->h:Z

    iget-object v2, v0, Lo9j;->e:Lorm;

    check-cast v2, Lx5f;

    invoke-virtual {v2, v3}, Lx5f;->S(I)V

    :cond_28
    if-eqz p1, :cond_3b

    if-eqz v1, :cond_3b

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_3b

    new-instance v2, Ll9j;

    invoke-direct {v2, v0, v1, v3}, Ll9j;-><init>(Lo9j;Ljava/lang/String;B)V

    invoke-virtual {v0, v2}, Lo9j;->f(Ln5o;)V

    goto :goto_44

    :cond_3b
    new-instance v2, Ll9j;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v1, v3}, Ll9j;-><init>(Lo9j;Ljava/lang/String;B)V

    invoke-virtual {v0, v2}, Lo9j;->f(Ln5o;)V

    :goto_44
    if-nez p1, :cond_49

    invoke-virtual {p0}, Lc9j;->G0()V

    :cond_49
    return-void
.end method

.method public final J0(Z)V
    .registers 4

    if-eqz p1, :cond_12

    invoke-virtual {p0}, Lc9j;->H0()Lyz7;

    move-result-object p1

    iget-boolean p1, p1, Lyz7;->d:Z

    if-nez p1, :cond_38

    invoke-virtual {p0}, Lc9j;->H0()Lyz7;

    move-result-object p0

    invoke-virtual {p0}, Lyz7;->c()V

    return-void

    :cond_12
    invoke-virtual {p0}, Lc9j;->H0()Lyz7;

    move-result-object p1

    iget-boolean p1, p1, Lyz7;->d:Z

    if-eqz p1, :cond_38

    invoke-virtual {p0}, Lc9j;->H0()Lyz7;

    move-result-object p0

    const/4 p1, 0x0

    iput-boolean p1, p0, Lyz7;->d:Z

    iget-object p0, p0, Lyz7;->b:Lwz7;

    iget-boolean v0, p0, Lwz7;->e:Z

    if-eqz v0, :cond_38

    iput-boolean p1, p0, Lwz7;->e:Z

    iget-object v0, p0, Lwz7;->f:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v0, :cond_35

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    if-eqz v0, :cond_35

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/f;->setMeasurementCacheEnabled(Z)V

    :cond_35
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->notifyItemRemoved(I)V

    :cond_38
    return-void
.end method

.method public final l0(Z)V
    .registers 2

    if-nez p1, :cond_5

    invoke-virtual {p0}, Lc9j;->G0()V

    :cond_5
    invoke-super {p0, p1}, Lk24;->l0(Z)V

    return-void
.end method

.method public final onDestroyView()V
    .registers 2

    invoke-super {p0}, Lltl;->onDestroyView()V

    const/4 v0, 0x0

    iput-object v0, p0, Lc9j;->t:Lov0;

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 7

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p1, p0, Lc9j;->t:Lov0;

    iget-object p1, p1, Lov0;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {p0}, Lc9j;->H0()Lyz7;

    move-result-object p2

    iget-object p2, p2, Lyz7;->c:Lx93;

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iget-object p1, p0, Lc9j;->t:Lov0;

    iget-object p1, p1, Lov0;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/FadingRecyclerView;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/opera/android/custom_views/RecyclerViewForScreenshot;->B0(Landroidx/recyclerview/widget/e;)V

    iget-object p1, p0, Lc9j;->t:Lov0;

    iget-object p1, p1, Lov0;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/FadingRecyclerView;

    new-instance p2, Lem3;

    const/4 v0, 0x4

    invoke-direct {p2, p0, v0}, Lem3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->n(Lnph;)V

    iget-object p1, p0, Lc9j;->t:Lov0;

    iget-object p1, p1, Lov0;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    new-instance p2, Lys7;

    const/4 v0, 0x3

    invoke-direct {p2, p0, v0}, Lys7;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    new-instance p2, Lh63;

    const/4 v0, 0x5

    invoke-direct {p2, p0, v0}, Lh63;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    iput-object p2, p0, Lc9j;->v:Lh63;

    new-instance p2, Lmni;

    const/16 v0, 0x9

    invoke-direct {p2, p1, v0}, Lmni;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    iget-object p1, p0, Lc9j;->r:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lo9j;

    iget-object p1, p1, Lo9j;->f:Ln9j;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    new-instance v0, Lw4i;

    const/4 v1, 0x7

    invoke-direct {v0, p0, v1}, Lw4i;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lq59;

    new-instance v2, Lel7;

    const/4 v3, 0x1

    invoke-direct {v2, p0, v3}, Lel7;-><init>(Ljava/lang/Object;B)V

    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    const/4 v2, 0x0

    invoke-direct {v1, v0, p0, v2}, Lq59;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, p2, v1}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method

.method public final y0(Landroid/view/LayoutInflater;Lcom/opera/android/StatusBarDrawingFrameLayout;)V
    .registers 6

    const/4 p1, 0x0

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0a037c

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/AnimationEmptyListView;

    if-eqz v0, :cond_48

    const p2, 0x7f0a0384

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;

    if-eqz v0, :cond_48

    const p2, 0x7f0a0600

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/FadingRecyclerView;

    if-eqz v0, :cond_48

    const p2, 0x7f0a093d

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    if-eqz v1, :cond_48

    const p2, 0x7f0a0bba

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/LayoutDirectionToolbar;

    if-eqz v2, :cond_48

    new-instance p2, Lov0;

    check-cast p1, Landroid/widget/LinearLayout;

    const/16 v2, 0x10

    invoke-direct {p2, p1, v0, v1, v2}, Lov0;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p2, p0, Lc9j;->t:Lov0;

    return-void

    :cond_48
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public final z0()V
    .registers 2

    iget-object v0, p0, Lc9j;->t:Lov0;

    iget-object v0, v0, Lov0;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-static {v0}, Lz4o;->q0(Landroid/view/View;)V

    iget-object p0, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lz4o;->r0(Lcom/opera/android/StatusBarDrawingFrameLayout;Ldxh;)V

    return-void
.end method
