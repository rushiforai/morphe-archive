.class public final Lcu5;
.super Lab2;
.source "SourceFile"

# interfaces
.implements Ly9n;
.implements Lya2;
.implements Lev8;


# instance fields
.field public final d:Lq5g;

.field public final e:Ltsd;

.field public final f:Ltsd;

.field public final g:I

.field public final synthetic h:B

.field public final i:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Ltsd;Lkze;Ltsd;Lqkc;Lnoc;Lq4b;Lqe6;)V
    .registers 17

    const/4 v1, 0x1

    iput-byte v1, p0, Lcu5;->h:B

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0d0232

    const/4 v6, 0x0

    invoke-virtual {v1, v2, p1, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    const/4 v7, 0x0

    if-eqz v1, :cond_9f

    check-cast v1, Landroid/widget/LinearLayout;

    invoke-static {v1}, Lq5g;->b(Landroid/widget/LinearLayout;)Lq5g;

    move-result-object v1

    new-instance v5, Lq4b;

    const/16 v2, 0x11

    invoke-direct {v5, p5, v2}, Lq4b;-><init>(Ljava/lang/Object;B)V

    move-object v0, p0

    move-object v2, p2

    move-object v3, p4

    move-object v4, p5

    invoke-direct/range {v0 .. v5}, Lcu5;-><init>(Lq5g;Ltsd;Ltsd;Landroidx/recyclerview/widget/d;Lkotlin/jvm/functions/Function0;)V

    move-object/from16 v1, p8

    iput-object v1, p0, Lcu5;->i:Ljava/lang/Object;

    iget-object v1, p0, Lcu5;->d:Lq5g;

    iget-object v2, v1, Lq5g;->c:Ljava/lang/Object;

    check-cast v2, Landroid/widget/FrameLayout;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    iget-object v1, v1, Lq5g;->c:Ljava/lang/Object;

    check-cast v1, Landroid/widget/FrameLayout;

    const v3, 0x7f0d023d

    invoke-virtual {v2, v3, v1, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v1, 0x7f0a0650

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/google/android/material/button/MaterialButton;

    if-eqz v3, :cond_8d

    const v1, 0x7f0a06c5

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    if-eqz v4, :cond_8d

    new-instance v1, Lov0;

    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout;

    const/16 v5, 0x16

    invoke-direct {v1, v2, v3, v4, v5}, Lov0;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v4, Lsma;

    const/16 v5, 0x12

    invoke-direct {v4, p7, v5}, Lsma;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v3, Lks6;

    const/16 v4, 0x1c

    invoke-direct {v3, v1, v4}, Lks6;-><init>(Ljava/lang/Object;B)V

    invoke-static {p3, v2, v3}, Lxf8;->j0(Likc;Landroid/view/View;Lf7f;)V

    iget-object v0, p0, Lcu5;->d:Lq5g;

    iget-object v0, v0, Lq5g;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;

    new-instance v1, Lza3;

    const/4 v2, 0x2

    invoke-direct {v1, p6, v2}, Lza3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnScrollChangeListener(Landroid/view/View$OnScrollChangeListener;)V

    return-void

    :cond_8d
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    throw v7

    :cond_9f
    const-string v0, "rootView"

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    throw v7
.end method

.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Ltsd;Lkze;Ltsd;Lqt5;Lq2;)V
    .registers 15

    const/4 v0, 0x0

    iput-byte v0, p0, Lcu5;->h:B

    .line 165
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0d00da

    .line 166
    invoke-virtual {v1, v2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const/4 v1, 0x0

    if-eqz p1, :cond_80

    .line 167
    check-cast p1, Landroid/widget/LinearLayout;

    .line 168
    invoke-static {p1}, Lq5g;->b(Landroid/widget/LinearLayout;)Lq5g;

    move-result-object v3

    .line 169
    new-instance v7, Lunj;

    const/16 p1, 0x8

    invoke-direct {v7, p1}, Lunj;-><init>(B)V

    move-object v2, p0

    move-object v4, p2

    move-object v5, p4

    move-object v6, p5

    .line 170
    invoke-direct/range {v2 .. v7}, Lcu5;-><init>(Lq5g;Ltsd;Ltsd;Landroidx/recyclerview/widget/d;Lkotlin/jvm/functions/Function0;)V

    .line 171
    iput-object p6, v2, Lcu5;->i:Ljava/lang/Object;

    .line 172
    iget-object p0, v2, Lcu5;->d:Lq5g;

    iget-object p1, p0, Lq5g;->c:Ljava/lang/Object;

    check-cast p1, Landroid/widget/FrameLayout;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    .line 173
    iget-object p0, p0, Lq5g;->c:Ljava/lang/Object;

    check-cast p0, Landroid/widget/FrameLayout;

    const p2, 0x7f0d00dc

    .line 174
    invoke-virtual {p1, p2, p0, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 175
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const p0, 0x7f0a06c5

    .line 176
    invoke-static {p0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    if-eqz p2, :cond_6e

    .line 177
    new-instance p0, Lzt5;

    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-direct {p0, p1, p2, v0}, Lzt5;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Landroid/widget/TextView;B)V

    .line 178
    iget-object p2, v6, Lqt5;->h:Ljava/lang/Object;

    check-cast p2, Lpde;

    .line 179
    new-instance p4, Lbu5;

    invoke-direct {p4, p0, v2}, Lbu5;-><init>(Lzt5;Lcu5;)V

    invoke-static {p2, p1, p4}, Lxf8;->j0(Likc;Landroid/view/View;Lf7f;)V

    .line 180
    new-instance p2, Lbu5;

    invoke-direct {p2, p0}, Lbu5;-><init>(Lzt5;)V

    invoke-static {p3, p1, p2}, Lxf8;->j0(Likc;Landroid/view/View;Lf7f;)V

    return-void

    .line 181
    :cond_6e
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    .line 182
    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    throw v1

    .line 183
    :cond_80
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    throw v1
.end method

.method public constructor <init>(Lq5g;Ltsd;Ltsd;Landroidx/recyclerview/widget/d;Lkotlin/jvm/functions/Function0;)V
    .registers 8

    .line 184
    iget-object v0, p1, Lq5g;->b:Landroid/view/ViewGroup;

    check-cast v0, Landroid/widget/LinearLayout;

    .line 185
    invoke-direct {p0, v0}, Lab2;-><init>(Landroid/view/View;)V

    .line 186
    iput-object p1, p0, Lcu5;->d:Lq5g;

    .line 187
    iput-object p2, p0, Lcu5;->e:Ltsd;

    .line 188
    iput-object p3, p0, Lcu5;->f:Ltsd;

    .line 189
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const v1, 0x7f07096a

    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    iput p3, p0, Lcu5;->g:I

    .line 190
    iget-object p1, p1, Lq5g;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;

    .line 191
    invoke-virtual {p1, p4}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    .line 192
    new-instance p3, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;

    .line 193
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p4

    const v1, 0x7f070969

    invoke-virtual {p4, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p4

    .line 194
    sget-object v1, Lu1k;->a:Lu1k;

    .line 195
    invoke-direct {p3, p4, p5}, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;-><init>(ILkotlin/jvm/functions/Function0;)V

    invoke-virtual {p1, p3}, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    const/4 p3, 0x0

    .line 196
    invoke-virtual {p1, p3}, Landroidx/recyclerview/widget/RecyclerView;->B0(Landroidx/recyclerview/widget/e;)V

    const/4 p3, 0x0

    .line 197
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 198
    invoke-virtual {p1, p3}, Landroidx/recyclerview/widget/RecyclerView;->setClipToPadding(Z)V

    .line 199
    new-instance p1, Lqzg;

    const/16 p3, 0xe

    invoke-direct {p1, p0, p3}, Lqzg;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2, v0, p1}, Lxf8;->j0(Likc;Landroid/view/View;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final R()V
    .registers 4

    iget-byte v0, p0, Lcu5;->h:B

    const/4 v1, 0x0

    iget-object v2, p0, Lcu5;->d:Lq5g;

    packed-switch v0, :pswitch_data_3e

    invoke-virtual {p0}, Lab2;->a0()Lja2;

    move-result-object p0

    invoke-virtual {p0}, Lja2;->d()Z

    move-result v0

    if-eqz v0, :cond_1e

    iget-object v0, v2, Lq5g;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;

    iget-object v2, p0, Lja2;->a:Lu0g;

    iput-object v1, p0, Lja2;->a:Lu0g;

    invoke-virtual {v0, v2}, Landroid/view/View;->restoreHierarchyState(Landroid/util/SparseArray;)V

    goto :goto_26

    :cond_1e
    iget-object p0, v2, Lq5g;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->x0(I)V

    :goto_26
    return-void

    :pswitch_27
    invoke-virtual {p0}, Lab2;->a0()Lja2;

    move-result-object p0

    invoke-virtual {p0}, Lja2;->d()Z

    move-result v0

    if-eqz v0, :cond_3c

    iget-object v0, v2, Lq5g;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;

    iget-object v2, p0, Lja2;->a:Lu0g;

    iput-object v1, p0, Lja2;->a:Lu0g;

    invoke-virtual {v0, v2}, Landroid/view/View;->restoreHierarchyState(Landroid/util/SparseArray;)V

    :cond_3c
    return-void

    nop

    :pswitch_data_3e
    .packed-switch 0x1
        :pswitch_27
    .end packed-switch
.end method

.method public final T(Landroid/view/View;II)V
    .registers 6

    iget-byte p1, p0, Lcu5;->h:B

    iget-object p0, p0, Lcu5;->i:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_76

    check-cast p0, Lqe6;

    const/4 p1, 0x0

    const/4 v0, 0x1

    const/16 v1, 0x64

    if-ne p2, v1, :cond_57

    if-eq p3, v1, :cond_57

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Ltkc;

    iget-object p0, p0, Ltkc;->i:Ldqc;

    iget-object p2, p0, Ldqc;->c:Lj4c;

    invoke-virtual {p2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lvs6;

    iget-object p2, p2, Lvs6;->d:Lrs6;

    iget-object p2, p2, Lrs6;->a:Lb59;

    invoke-virtual {p2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/content/SharedPreferences;

    const-string v1, "bubble_shown"

    invoke-interface {p3, v1, p1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p3

    if-nez p3, :cond_4f

    invoke-virtual {p2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/content/SharedPreferences;

    const-string v1, "widget_visibility_count"

    invoke-interface {p3, v1, p1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p3

    invoke-virtual {p2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/content/SharedPreferences;

    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    add-int/2addr p3, v0

    invoke-interface {p2, v1, p3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_4f
    iget-object p2, p0, Ldqc;->d:Ljs6;

    invoke-virtual {p2, p1}, Ljs6;->c(I)V

    iput-boolean v0, p0, Ldqc;->i:Z

    goto :goto_68

    :cond_57
    if-nez p2, :cond_68

    if-eqz p3, :cond_68

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Ltkc;

    iget-object p0, p0, Ltkc;->i:Ldqc;

    iget-object p2, p0, Ldqc;->d:Ljs6;

    invoke-virtual {p2, v0}, Ljs6;->c(I)V

    iput-boolean p1, p0, Ldqc;->i:Z

    :cond_68
    :goto_68
    return-void

    :pswitch_69
    invoke-static {p2, p3}, Lr9i;->K(II)Z

    move-result p1

    if-eqz p1, :cond_74

    check-cast p0, Lq2;

    invoke-virtual {p0}, Lq2;->invoke()Ljava/lang/Object;

    :cond_74
    return-void

    nop

    :pswitch_data_76
    .packed-switch 0x0
        :pswitch_69
    .end packed-switch
.end method

.method public final X(Z)V
    .registers 2

    if-nez p1, :cond_5

    invoke-virtual {p0}, Lcu5;->R()V

    :cond_5
    return-void
.end method

.method public final Y()V
    .registers 1

    invoke-virtual {p0}, Lcu5;->t()V

    return-void
.end method

.method public final b0(I)Landroid/view/View;
    .registers 7

    iget-object v0, p0, Lcu5;->d:Lq5g;

    iget-object v1, v0, Lq5g;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    iget-object v0, v0, Lq5g;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;

    const v2, 0x7f0d03bc

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_64

    check-cast v0, Lcom/jensdriller/libs/undobar/MaxWidthLinearLayout;

    new-instance v2, Lkkf;

    const/16 v3, 0x14

    invoke-direct {v2, p0, v3}, Lkkf;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v3

    if-eqz v3, :cond_2e

    invoke-static {v3, v0, v2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_2e
    new-instance v2, Lz61;

    invoke-direct {v2, v0}, Lz61;-><init>(Landroid/view/View;)V

    iget-object v2, v2, Lz61;->b:Ljava/lang/Object;

    check-cast v2, Lkze;

    sget v3, Ld03;->e:I

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f0809a6

    invoke-static {v4, v3}, Lj14;->i0(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-static {v0, v3}, Lydp;->q(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    new-instance v3, Lwj;

    const/4 v4, 0x5

    invoke-direct {v3, p0, v0, v4}, Lwj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v4, p0, Lcu5;->f:Ltsd;

    invoke-static {v4, v2, v3}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance v3, Lqzg;

    const/16 v4, 0xf

    invoke-direct {v3, v0, v4}, Lqzg;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lcu5;->e:Ltsd;

    invoke-static {p0, v2, v3}, La26;->T(Lekc;Likc;Lf7f;)V

    const/4 p0, 0x1

    invoke-virtual {v1, p1, v0, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_64
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final onDestroy()V
    .registers 2

    iget-object p0, p0, Lcu5;->d:Lq5g;

    iget-object p0, p0, Lq5g;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    return-void
.end method

.method public final t()V
    .registers 3

    new-instance v0, Lu0g;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iget-object v1, p0, Lcu5;->d:Lq5g;

    iget-object v1, v1, Lq5g;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;

    invoke-virtual {v1, v0}, Landroid/view/View;->saveHierarchyState(Landroid/util/SparseArray;)V

    invoke-virtual {p0}, Lab2;->a0()Lja2;

    move-result-object p0

    iput-object v0, p0, Lja2;->a:Lu0g;

    return-void
.end method
