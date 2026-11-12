.class public final Lymh;
.super Lonh;
.source "SourceFile"


# instance fields
.field public final b:Lq5g;

.field public final c:Lgnh;

.field public d:Lhj8;

.field public final e:Lwf;


# direct methods
.method public constructor <init>(Lq5g;Lgnh;Likc;Lyqa;Lro9;Ljvk;)V
    .registers 17

    iget-object v0, p1, Lq5g;->b:Landroid/view/ViewGroup;

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lymh;->b:Lq5g;

    iput-object p2, p0, Lymh;->c:Lgnh;

    new-instance v1, Lwf;

    iget-object v2, p1, Lq5g;->d:Ljava/lang/Object;

    check-cast v2, Landroidx/recyclerview/widget/RecyclerView;

    new-instance v3, Lz61;

    invoke-direct {v3, v2}, Lz61;-><init>(Landroid/view/View;)V

    iget-object v3, v3, Lz61;->b:Ljava/lang/Object;

    move-object v5, v3

    check-cast v5, Lkze;

    const/4 v3, 0x5

    invoke-direct {v1, v3}, Lwf;-><init>(B)V

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Landroidx/recyclerview/widget/d;->setHasStableIds(Z)V

    new-instance v4, Lws1;

    const/16 v9, 0xe

    move-object v6, p2

    move-object v7, p3

    move-object v8, p4

    invoke-direct/range {v4 .. v9}, Lws1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p2, Lj9h;

    const/16 p3, 0x8

    invoke-direct {p2, p3}, Lj9h;-><init>(B)V

    new-instance p3, La3j;

    const/4 v5, 0x4

    invoke-direct {p3, v5}, La3j;-><init>(B)V

    const-class v5, Lzmh;

    invoke-virtual {v1, v5, v4, p2, p3}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    iput-object v1, p0, Lymh;->e:Lwf;

    new-instance p2, Lflb;

    new-instance p3, Lnvk;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    move-object/from16 v5, p6

    invoke-direct {p3, v4, v5}, Lnvk;-><init>(Landroid/content/Context;Ljvk;)V

    invoke-direct {p2, p3}, Lflb;-><init>(Lblb;)V

    iget-object p1, p1, Lq5g;->c:Ljava/lang/Object;

    check-cast p1, Lfbl;

    iget-object p3, p1, Lfbl;->e:Landroid/view/View;

    check-cast p3, Lcom/opera/android/custom_views/StylingImageView;

    new-instance v4, Lkkf;

    const/16 v5, 0xa

    invoke-direct {v4, p0, v5}, Lkkf;-><init>(Ljava/lang/Object;B)V

    invoke-static {p3}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v5

    if-eqz v5, :cond_69

    invoke-static {v5, p3, v4}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_69
    invoke-virtual {v0, v3}, Landroid/view/View;->setClipToOutline(Z)V

    iget-object p3, p1, Lfbl;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v0, Lxmh;

    const/4 v4, 0x0

    invoke-direct {v0, p0, v4}, Lxmh;-><init>(Lymh;B)V

    invoke-virtual {p3, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p3, p1, Lfbl;->c:Landroid/view/View;

    check-cast p3, Lcom/opera/android/custom_views/StylingImageButton;

    new-instance v0, Lxmh;

    invoke-direct {v0, p0, v3}, Lxmh;-><init>(Lymh;B)V

    invoke-virtual {p3, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p1, Lfbl;->d:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageButton;

    new-instance p3, Lxmh;

    const/4 v0, 0x2

    invoke-direct {p3, p0, v0}, Lxmh;-><init>(Lymh;B)V

    invoke-virtual {p1, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p0, Lk56;

    invoke-direct {p0}, Lk56;-><init>()V

    invoke-virtual {v2, p0}, Landroidx/recyclerview/widget/RecyclerView;->B0(Landroidx/recyclerview/widget/e;)V

    invoke-virtual {v2, p5}, Landroidx/recyclerview/widget/RecyclerView;->D0(Lro9;)V

    new-instance p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    invoke-direct {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>()V

    invoke-virtual {v2, p0}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    invoke-virtual {v2, v4}, Landroidx/recyclerview/widget/RecyclerView;->setNestedScrollingEnabled(Z)V

    invoke-virtual {p2, v2}, Lflb;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void
.end method


# virtual methods
.method public final U()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final V()Ljava/util/List;
    .registers 1

    iget-object p0, p0, Lymh;->d:Lhj8;

    if-eqz p0, :cond_7

    iget-object p0, p0, Lhj8;->b:Ljava/util/ArrayList;

    goto :goto_8

    :cond_7
    const/4 p0, 0x0

    :goto_8
    if-nez p0, :cond_c

    sget-object p0, Ll08;->a:Ll08;

    :cond_c
    return-object p0
.end method

.method public final X()V
    .registers 6

    iget-object v0, p0, Lymh;->d:Lhj8;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v1, v0, Lhj8;->a:Lm4l;

    invoke-virtual {v1}, Lm4l;->b()Lk4l;

    move-result-object v1

    iget-object p0, p0, Lymh;->b:Lq5g;

    iget-object p0, p0, Lq5g;->c:Ljava/lang/Object;

    check-cast p0, Lfbl;

    iget-object p0, p0, Lfbl;->e:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    new-instance v2, Lg8i;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lg8i;-><init>(Landroid/content/Context;)V

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    iget-object v0, v0, Lhj8;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const/4 v4, 0x1

    invoke-static {v0, v4}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    const-string v4, "%d"

    invoke-static {v3, v4, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    if-le v4, v3, :cond_44

    const-string v0, "\u2026"

    :cond_44
    iput-object v0, v2, Lg8i;->e:Ljava/lang/String;

    iget-object v0, v1, Lk4l;->b:Ldxh;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcxh;->a(Landroid/content/Context;)I

    move-result v0

    iput v0, v2, Lg8i;->f:I

    iget-object v0, v1, Lk4l;->a:Ldxh;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcxh;->a(Landroid/content/Context;)I

    move-result v0

    iput v0, v2, Lg8i;->c:I

    const v0, 0x7f07089d

    iput v0, v2, Lg8i;->b:I

    const v0, 0x7f07089e

    iput v0, v2, Lg8i;->g:I

    invoke-virtual {v2}, Lg8i;->a()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
