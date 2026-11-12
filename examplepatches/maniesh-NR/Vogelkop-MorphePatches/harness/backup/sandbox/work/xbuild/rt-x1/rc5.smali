.class public final Lrc5;
.super Lpa3;
.source "SourceFile"


# static fields
.field public static final d:Lixh;

.field public static final e:Lixh;


# instance fields
.field public final synthetic b:B

.field public final c:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lixh;

    const/high16 v1, 0x41900000    # 18.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Lrc5;->d:Lixh;

    new-instance v0, Lixh;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Lrc5;->e:Lixh;

    return-void
.end method

.method public constructor <init>(Lhl4;Lhqk;Lpde;Lnv6;)V
    .registers 9

    const/4 v0, 0x2

    iput-byte v0, p0, Lrc5;->b:B

    iget-object p1, p1, Lhl4;->b:Landroidx/recyclerview/widget/RecyclerView;

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    new-instance v1, Ldt1;

    invoke-direct {v1}, Ldt1;-><init>()V

    new-instance v2, Lxj;

    const/16 v3, 0x1a

    invoke-direct {v2, p4, p2, v3}, Lxj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p2, Lt14;

    const/16 p4, 0x13

    invoke-direct {p2, p4}, Lt14;-><init>(B)V

    new-instance p4, La3j;

    const/4 v3, 0x4

    invoke-direct {p4, v3}, La3j;-><init>(B)V

    const-class v3, Lcom/opera/android/suggestion/Suggestion;

    invoke-virtual {v1, v3, v2, p2, p4}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    iput-object v1, p0, Lrc5;->c:Ljava/lang/Object;

    new-instance p2, Lou1;

    new-instance p4, Lixh;

    const/high16 v2, 0x41000000    # 8.0f

    invoke-direct {p4, v2}, Lixh;-><init>(F)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {p4, v2}, Ly7h;->k(Landroid/content/Context;)I

    move-result p4

    invoke-direct {p2, v0, p4}, Lou1;-><init>(BI)V

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    new-instance p2, Lz61;

    invoke-direct {p2, p1}, Lz61;-><init>(Landroid/view/View;)V

    iget-object p2, p2, Lz61;->b:Ljava/lang/Object;

    check-cast p2, Lkze;

    new-instance p4, Lwj;

    const/4 v0, 0x1

    invoke-direct {p4, p0, p1, v0}, Lwj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p3, p2, p4}, La26;->T(Lekc;Likc;Lf7f;)V

    return-void
.end method

.method public constructor <init>(Lkf;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Lrc5;->b:B

    .line 95
    iget-object v0, p1, Lkf;->b:Landroid/view/View;

    check-cast v0, Lcom/opera/android/suggestion/adapter/SuggestionListActionItem;

    .line 96
    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    .line 97
    iput-object p1, p0, Lrc5;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lkf;Lthk;Lnv6;Lhqk;ZZZ)V
    .registers 8

    const/4 p2, 0x0

    iput-byte p2, p0, Lrc5;->b:B

    .line 85
    iget-object p2, p1, Lkf;->b:Landroid/view/View;

    check-cast p2, Lcom/opera/android/suggestion/CompactSuggestionView;

    .line 86
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    .line 87
    iput-object p1, p0, Lrc5;->c:Ljava/lang/Object;

    .line 88
    iget-object p1, p1, Lkf;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/suggestion/CompactSuggestionView;

    .line 89
    iput-object p3, p1, Lcom/opera/android/suggestion/CompactSuggestionView;->d:Lnv6;

    .line 90
    iput-object p4, p1, Lcom/opera/android/suggestion/CompactSuggestionView;->c:Lhqk;

    .line 91
    iput-boolean p6, p1, Lcom/opera/android/suggestion/CompactSuggestionView;->h:Z

    .line 92
    iput-boolean p5, p1, Lcom/opera/android/suggestion/CompactSuggestionView;->i:Z

    if-eqz p7, :cond_22

    .line 93
    new-instance p2, Ljl4;

    const/16 p3, 0xe

    invoke-direct {p2, p0, p3}, Ljl4;-><init>(Ljava/lang/Object;B)V

    goto :goto_23

    :cond_22
    const/4 p2, 0x0

    .line 94
    :goto_23
    iput-object p2, p1, Lcom/opera/android/suggestion/CompactSuggestionView;->m:Ljl4;

    return-void
.end method

.method public constructor <init>(Lswc;)V
    .registers 3

    const/4 v0, 0x3

    iput-byte v0, p0, Lrc5;->b:B

    .line 98
    iget-object v0, p1, Lswc;->b:Landroid/widget/FrameLayout;

    .line 99
    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    .line 100
    iput-object p1, p0, Lrc5;->c:Ljava/lang/Object;

    return-void
.end method

.method public static Z(Landroid/graphics/drawable/Drawable;Landroid/content/Context;I)Landroid/graphics/drawable/LayerDrawable;
    .registers 7

    new-instance v0, Landroid/graphics/drawable/LayerDrawable;

    new-instance v1, Lp05;

    const v2, 0x7f04021b

    const v3, 0x7f06063b

    invoke-static {v2, p1, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v2

    sget-object v3, Lrc5;->e:Lixh;

    invoke-virtual {v3, p1}, Ly7h;->k(Landroid/content/Context;)I

    move-result p1

    int-to-float p1, p1

    invoke-direct {v1, p1, v2, p2}, Lp05;-><init>(FII)V

    const/4 p1, 0x2

    new-array p1, p1, [Landroid/graphics/drawable/Drawable;

    const/4 p2, 0x0

    aput-object p0, p1, p2

    const/4 p0, 0x1

    aput-object v1, p1, p0

    invoke-direct {v0, p1}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    const/16 p1, 0x11

    invoke-virtual {v0, p2, p1}, Landroid/graphics/drawable/LayerDrawable;->setLayerGravity(II)V

    invoke-virtual {v0, p0, p1}, Landroid/graphics/drawable/LayerDrawable;->setLayerGravity(II)V

    return-object v0
.end method


# virtual methods
.method public final U(Lgqk;Ljava/lang/String;)V
    .registers 12

    iget-byte v0, p0, Lrc5;->b:B

    const/4 v1, 0x1

    iget-object v2, p0, Lrc5;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_132

    :pswitch_8
    return-void

    :pswitch_9
    check-cast p1, Lzpk;

    check-cast v2, Lswc;

    iget-object p2, v2, Lswc;->c:Lcom/opera/android/custom_views/StylingTextView;

    iget-object p1, p1, Lzpk;->c:Lrxh;

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p1, p0}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :pswitch_1f
    check-cast p1, Leqk;

    check-cast v2, Lkf;

    iget-object p0, v2, Lkf;->b:Landroid/view/View;

    check-cast p0, Lcom/opera/android/suggestion/adapter/SuggestionListActionItem;

    iput-boolean v1, p0, Lcom/opera/android/suggestion/adapter/SuggestionListActionItem;->a:Z

    new-instance p2, Lgf;

    invoke-direct {p2, p1, v1}, Lgf;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p0, v2, Lkf;->c:Ljava/lang/Object;

    check-cast p0, Landroid/widget/TextView;

    iget-object p1, p1, Leqk;->d:Lrxh;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p1, p2}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :pswitch_43
    check-cast p1, Lbqk;

    check-cast v2, Lkf;

    iget-object p0, v2, Lkf;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/suggestion/CompactSuggestionView;

    iget v0, p1, Lgqk;->a:I

    const/16 v2, 0x12

    if-ne v0, v2, :cond_53

    const/4 v0, 0x3

    goto :goto_54

    :cond_53
    const/4 v0, 0x2

    :goto_54
    iput-byte v0, p0, Lcom/opera/android/suggestion/CompactSuggestionView;->k:B

    iget-object p1, p1, Lbqk;->c:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x0

    const/16 v3, 0x14

    if-le v0, v3, :cond_65

    invoke-virtual {p1, v2, v3}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object p1

    :cond_65
    iget-object p0, p0, Lcom/opera/android/suggestion/CompactSuggestionView;->b:Ld5o;

    iput-object p1, p0, Ld5o;->a:Ljava/lang/Object;

    iput-object p2, p0, Ld5o;->b:Ljava/lang/Object;

    iget-object p0, p0, Ld5o;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/suggestion/CompactSuggestionView;

    iget-object p1, p0, Lcom/opera/android/suggestion/CompactSuggestionView;->e:Ljava/util/ArrayList;

    iget-object p2, p0, Lcom/opera/android/suggestion/CompactSuggestionView;->b:Ld5o;

    :goto_73
    iget-object v0, p2, Ld5o;->a:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-le v0, v3, :cond_91

    new-instance v0, Lqc5;

    iget-object v3, p0, Lcom/opera/android/suggestion/CompactSuggestionView;->m:Ljl4;

    invoke-direct {v0, p0, p0, v3}, Lqc5;-><init>(Lcom/opera/android/suggestion/CompactSuggestionView;Lcom/opera/android/suggestion/CompactSuggestionView;Ljl4;)V

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, v0, Lqc5;->b:Lcom/opera/android/suggestion/CompactSuggestionChip;

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_73

    :cond_91
    move v0, v2

    :cond_92
    :goto_92
    iget-object v3, p2, Ld5o;->a:Ljava/lang/Object;

    check-cast v3, Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v0, v3, :cond_f7

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lqc5;

    iget-object v4, p2, Ld5o;->a:Ljava/lang/Object;

    check-cast v4, Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/opera/android/suggestion/Suggestion;

    iget-object v5, p2, Ld5o;->a:Ljava/lang/Object;

    check-cast v5, Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    add-int/lit8 v0, v0, 0x1

    int-to-double v5, v0

    const-wide/high16 v7, 0x3fe0000000000000L    # 0.5

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v5

    const-wide/high16 v7, 0x3ff0000000000000L    # 1.0

    div-double/2addr v7, v5

    double-to-float v5, v7

    iput v2, v3, Lqc5;->e:I

    iput-object v4, v3, Lqc5;->d:Lcom/opera/android/suggestion/Suggestion;

    iget-object v6, v3, Lqc5;->b:Lcom/opera/android/suggestion/CompactSuggestionChip;

    iget-object v7, v4, Lcom/opera/android/suggestion/Suggestion;->b:Ljava/lang/String;

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v6, v2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v6, v2}, Landroid/view/View;->setPressed(Z)V

    iget v4, v4, Lcom/opera/android/suggestion/Suggestion;->a:I

    const/16 v7, 0x1c

    if-ne v4, v7, :cond_d9

    move v4, v1

    goto :goto_da

    :cond_d9
    move v4, v2

    :goto_da
    invoke-virtual {v6, v4}, Landroid/view/View;->setSelected(Z)V

    invoke-virtual {v6}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->jumpToCurrentState()V

    iget-object v4, v3, Lqc5;->c:Ljxb;

    iput v5, v4, Ljxb;->b:F

    invoke-virtual {v3}, Lqc5;->a()V

    iget-object v4, v3, Lqc5;->f:Lcom/opera/android/suggestion/CompactSuggestionView;

    iget-object v4, v4, Lcom/opera/android/suggestion/CompactSuggestionView;->d:Lnv6;

    if-eqz v4, :cond_92

    iget-object v3, v3, Lqc5;->d:Lcom/opera/android/suggestion/Suggestion;

    invoke-virtual {v4, v3}, Lnv6;->D(Lcom/opera/android/suggestion/Suggestion;)V

    goto :goto_92

    :cond_f7
    iget-object p2, p2, Ld5o;->a:Ljava/lang/Object;

    check-cast p2, Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    :goto_ff
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p2, v0, :cond_124

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqc5;

    iput v2, v0, Lqc5;->e:I

    const/4 v1, 0x0

    iput-object v1, v0, Lqc5;->d:Lcom/opera/android/suggestion/Suggestion;

    iget-object v1, v0, Lqc5;->b:Lcom/opera/android/suggestion/CompactSuggestionChip;

    const/16 v3, 0x8

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, v0, Lqc5;->c:Ljxb;

    const/4 v1, 0x0

    iput v1, v0, Ljxb;->b:F

    const v1, 0x7fffffff

    iput v1, v0, Ljxb;->a:I

    add-int/lit8 p2, p2, 0x1

    goto :goto_ff

    :cond_124
    iput v2, p0, Lcom/opera/android/suggestion/CompactSuggestionView;->g:I

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/opera/android/suggestion/CompactSuggestionView;->a(I)V

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void

    nop

    :pswitch_data_132
    .packed-switch 0x0
        :pswitch_43
        :pswitch_1f
        :pswitch_8
        :pswitch_9
    .end packed-switch
.end method

.method public final V()Z
    .registers 2

    iget-byte v0, p0, Lrc5;->b:B

    packed-switch v0, :pswitch_data_28

    invoke-super {p0}, Lpa3;->V()Z

    move-result p0

    return p0

    :pswitch_a
    iget-object p0, p0, Lrc5;->c:Ljava/lang/Object;

    check-cast p0, Lkf;

    iget-object p0, p0, Lkf;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/suggestion/CompactSuggestionView;

    iget-boolean v0, p0, Lcom/opera/android/suggestion/CompactSuggestionView;->h:Z

    if-eqz v0, :cond_19

    const/16 v0, 0x14

    goto :goto_1b

    :cond_19
    const/16 v0, 0xa

    :goto_1b
    iget-object p0, p0, Lcom/opera/android/suggestion/CompactSuggestionView;->e:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-ge p0, v0, :cond_25

    const/4 p0, 0x1

    goto :goto_26

    :cond_25
    const/4 p0, 0x0

    :goto_26
    return p0

    nop

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final X()V
    .registers 4

    iget-byte v0, p0, Lrc5;->b:B

    packed-switch v0, :pswitch_data_30

    return-void

    :pswitch_6
    iget-object p0, p0, Lrc5;->c:Ljava/lang/Object;

    check-cast p0, Lkf;

    iget-object p0, p0, Lkf;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/suggestion/CompactSuggestionView;

    iget-object v0, p0, Lcom/opera/android/suggestion/CompactSuggestionView;->e:Ljava/util/ArrayList;

    iget-boolean v1, p0, Lcom/opera/android/suggestion/CompactSuggestionView;->h:Z

    if-eqz v1, :cond_17

    const/16 v1, 0x14

    goto :goto_19

    :cond_17
    const/16 v1, 0xa

    :goto_19
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v2, v1, :cond_2e

    new-instance v1, Lqc5;

    iget-object v2, p0, Lcom/opera/android/suggestion/CompactSuggestionView;->m:Ljl4;

    invoke-direct {v1, p0, p0, v2}, Lqc5;-><init>(Lcom/opera/android/suggestion/CompactSuggestionView;Lcom/opera/android/suggestion/CompactSuggestionView;Ljl4;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, v1, Lqc5;->b:Lcom/opera/android/suggestion/CompactSuggestionChip;

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :cond_2e
    return-void

    nop

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final Y()V
    .registers 3

    iget-byte v0, p0, Lrc5;->b:B

    packed-switch v0, :pswitch_data_1e

    return-void

    :pswitch_6
    iget-object p0, p0, Lrc5;->c:Ljava/lang/Object;

    check-cast p0, Lkf;

    iget-object v0, p0, Lkf;->b:Landroid/view/View;

    check-cast v0, Lcom/opera/android/suggestion/adapter/SuggestionListActionItem;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/opera/android/suggestion/adapter/SuggestionListActionItem;->a:Z

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p0, p0, Lkf;->c:Ljava/lang/Object;

    check-cast p0, Landroid/widget/TextView;

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    nop

    :pswitch_data_1e
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method
