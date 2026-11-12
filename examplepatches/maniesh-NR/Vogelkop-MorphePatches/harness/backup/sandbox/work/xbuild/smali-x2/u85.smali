.class public final Lu85;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf21;


# instance fields
.field public a:Z

.field public b:I

.field public final c:I

.field public final d:Landroid/content/Context;

.field public final e:Ljava/lang/Object;

.field public final f:Ljava/lang/Object;

.field public g:Ljava/lang/Object;

.field public final h:Ljava/lang/Object;

.field public i:Ljava/lang/Object;

.field public j:Ljava/lang/Object;

.field public k:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/View;)V
    .registers 13

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lu85;->b:I

    new-instance v2, Lj39;

    const v0, 0x7f1506a6

    invoke-direct {v2, p1, v0}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    iput-object v2, p0, Lu85;->d:Landroid/content/Context;

    iput-object p2, p0, Lu85;->e:Ljava/lang/Object;

    const p1, 0x7f0a0351

    invoke-virtual {p2, p1}, Landroid/view/View;->setId(I)V

    invoke-virtual {p2, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    new-instance p1, Lho3;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Lho3;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lu85;->f:Ljava/lang/Object;

    invoke-virtual {p2, p1}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    new-instance p1, Lc21;

    invoke-direct {p1, p0, v0}, Lc21;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Landroid/widget/ListView;

    invoke-direct {v1, v2}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lu85;->j:Ljava/lang/Object;

    new-instance v6, Lq8n;

    invoke-direct {v6, p2}, Lq8n;-><init>(Landroid/view/View;)V

    iget-object v3, v6, Lq8n;->p:Lvz5;

    iget-boolean v4, v3, Lvz5;->c:Z

    if-eq v0, v4, :cond_42

    iput-boolean v0, v3, Lvz5;->c:Z

    invoke-virtual {v3, v0}, Lvz5;->d(Z)V

    :cond_42
    new-instance v4, Landroid/util/TypedValue;

    invoke-direct {v4}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {v2}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v5

    const v7, 0x7f0407bc

    invoke-virtual {v5, v7, v4, v0}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget v4, v4, Landroid/util/TypedValue;->resourceId:I

    invoke-static {v4, v2}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    iput-object v4, p0, Lu85;->k:Ljava/lang/Object;

    new-instance v5, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const/4 v7, 0x0

    invoke-virtual {v5, v7}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v8

    const v9, 0x7f0407bb

    invoke-static {v9, v8}, Lna2;->u(ILandroid/content/Context;)I

    move-result v8

    int-to-float v8, v8

    invoke-virtual {v5, v8}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {v1, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setClipToOutline(Z)V

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v4, v1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    iget v5, v1, Landroid/graphics/Rect;->bottom:I

    iget v8, v1, Landroid/graphics/Rect;->top:I

    new-instance v9, Landroid/graphics/Rect;

    invoke-direct {v9, v7, v5, v7, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    iget-object v5, v3, Lvz5;->h:Ljava/lang/Object;

    check-cast v5, Landroid/graphics/Rect;

    invoke-virtual {v5, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_98

    invoke-virtual {v5, v9}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    invoke-virtual {v3, v0}, Lvz5;->d(Z)V

    :cond_98
    iget v3, v1, Landroid/graphics/Rect;->right:I

    iget v1, v1, Landroid/graphics/Rect;->left:I

    add-int/2addr v3, v1

    iput v3, p0, Lu85;->c:I

    new-instance v1, Le21;

    new-instance v5, Lmv1;

    const/4 v3, 0x4

    invoke-direct {v5, p0, v3}, Lmv1;-><init>(Ljava/lang/Object;B)V

    move-object v3, p2

    invoke-direct/range {v1 .. v6}, Le21;-><init>(Landroid/content/Context;Landroid/view/View;Landroid/graphics/drawable/Drawable;Ljava/util/function/Supplier;Lq8n;)V

    iput-object p1, v1, Le21;->f:Landroid/widget/PopupWindow$OnDismissListener;

    iput-object p0, v1, Le21;->g:Lf21;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0701b8

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    int-to-float p1, p1

    iput p1, v1, Le21;->j:F

    iput-boolean v0, v1, Le21;->h:Z

    iput-boolean v0, v1, Le21;->i:Z

    iput-boolean v0, v1, Le21;->k:Z

    iput-boolean v0, v1, Le21;->l:Z

    new-instance p1, Li21;

    invoke-direct {p1, v1}, Li21;-><init>(Le21;)V

    iput-object p1, p0, Lu85;->h:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lpde;Lp6l;Lt8k;Llg;Lfd;Lhv3;Ltsd;Ltsd;II)V
    .registers 12

    .line 205
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 206
    iput-object p1, p0, Lu85;->d:Landroid/content/Context;

    .line 207
    iput-object p3, p0, Lu85;->e:Ljava/lang/Object;

    .line 208
    iput-object p4, p0, Lu85;->f:Ljava/lang/Object;

    .line 209
    iput-object p5, p0, Lu85;->g:Ljava/lang/Object;

    .line 210
    iput-object p6, p0, Lu85;->h:Ljava/lang/Object;

    .line 211
    iput-object p7, p0, Lu85;->i:Ljava/lang/Object;

    .line 212
    iput-object p8, p0, Lu85;->j:Ljava/lang/Object;

    .line 213
    iput p10, p0, Lu85;->b:I

    .line 214
    iput p11, p0, Lu85;->c:I

    .line 215
    new-instance p1, Lpde;

    invoke-virtual {p0}, Lu85;->a()Lq85;

    move-result-object p3

    .line 216
    invoke-direct {p1, p3}, Lekc;-><init>(Ljava/lang/Object;)V

    .line 217
    iput-object p1, p0, Lu85;->k:Ljava/lang/Object;

    .line 218
    new-instance p1, Lr85;

    const/4 p3, 0x0

    invoke-direct {p1, p0, p3}, Lr85;-><init>(Ljava/lang/Object;B)V

    .line 219
    new-instance p4, Ls85;

    invoke-direct {p4, p0, p3}, Ls85;-><init>(Lu85;B)V

    invoke-static {p5, p2, p1, p4}, La26;->U(Lw6f;Likc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    .line 220
    new-instance p1, Lyc;

    const/4 p4, 0x3

    invoke-direct {p1, p0, p4}, Lyc;-><init>(Ljava/lang/Object;B)V

    .line 221
    new-instance p4, Ls85;

    const/4 p5, 0x1

    invoke-direct {p4, p0, p5}, Ls85;-><init>(Lu85;B)V

    invoke-static {p6, p2, p1, p4}, La26;->U(Lw6f;Likc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    .line 222
    new-instance p1, Lt85;

    invoke-direct {p1, p0, p3}, Lt85;-><init>(Lu85;B)V

    invoke-static {p9, p2, p1}, La26;->T(Lekc;Likc;Lf7f;)V

    .line 223
    new-instance p1, Lt85;

    invoke-direct {p1, p0, p5}, Lt85;-><init>(Lu85;B)V

    invoke-static {p8, p2, p1}, La26;->T(Lekc;Likc;Lf7f;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lr0k;ILgdb;Lndc;ILjava/lang/Runnable;Lcom/opera/api/Callback;)V
    .registers 12

    .line 224
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 225
    new-instance v0, La9e;

    invoke-direct {v0, p0}, La9e;-><init>(Lu85;)V

    iput-object v0, p0, Lu85;->f:Ljava/lang/Object;

    .line 226
    new-instance v1, Lob;

    const/16 v2, 0x8

    invoke-direct {v1, p0, v2}, Lob;-><init>(Ljava/lang/Object;B)V

    iput-object v1, p0, Lu85;->g:Ljava/lang/Object;

    .line 227
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lu85;->d:Landroid/content/Context;

    .line 228
    iput-object p2, p0, Lu85;->e:Ljava/lang/Object;

    .line 229
    iput p3, p0, Lu85;->b:I

    .line 230
    iput p6, p0, Lu85;->c:I

    .line 231
    iput-object p4, p0, Lu85;->j:Ljava/lang/Object;

    .line 232
    iput-object p5, p0, Lu85;->k:Ljava/lang/Object;

    .line 233
    iput-object p7, p0, Lu85;->h:Ljava/lang/Object;

    .line 234
    iput-object p8, p0, Lu85;->i:Ljava/lang/Object;

    if-eqz p5, :cond_30

    .line 235
    invoke-interface {p5}, Lndc;->getLifecycle()Ltcc;

    move-result-object p0

    invoke-virtual {p0, v1}, Ltcc;->a(Lmdc;)V

    .line 236
    :cond_30
    invoke-interface {p2, v0}, Lr0k;->e(La9e;)V

    return-void
.end method

.method public static d(Landroid/content/Context;Lr0k;ILgdb;Lndc;ILjava/lang/Runnable;Lcom/opera/api/Callback;)Lu85;
    .registers 17

    if-nez p2, :cond_7

    invoke-interface {p6}, Ljava/lang/Runnable;->run()V

    const/4 p0, 0x0

    return-object p0

    :cond_7
    new-instance v0, Lu85;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-object v4, p3

    move-object v5, p4

    move v6, p5

    move-object v7, p6

    move-object/from16 v8, p7

    invoke-direct/range {v0 .. v8}, Lu85;-><init>(Landroid/content/Context;Lr0k;ILgdb;Lndc;ILjava/lang/Runnable;Lcom/opera/api/Callback;)V

    invoke-interface/range {p1 .. p2}, Lr0k;->g(I)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    new-instance p1, Lkqd;

    const/4 p2, 0x3

    invoke-direct {p1, v0, p2}, Lkqd;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    return-object v0
.end method


# virtual methods
.method public final a()Lq85;
    .registers 11

    new-instance v0, Lq85;

    iget-boolean v1, p0, Lu85;->a:Z

    iget-object v2, p0, Lu85;->g:Ljava/lang/Object;

    check-cast v2, Llg;

    invoke-virtual {v2}, Llg;->b()Leri;

    move-result-object v2

    sget-object v3, Lpc;->y:Lpc;

    iget-object v4, p0, Lu85;->h:Ljava/lang/Object;

    check-cast v4, Lfd;

    invoke-virtual {v4, v3}, Lfd;->e(Lpc;)Ljf;

    move-result-object v5

    const/4 v6, 0x0

    if-eqz v5, :cond_20

    new-instance v7, Lo24;

    invoke-direct {v7, v3, v5}, Lo24;-><init>(Lpc;Ljf;)V

    move-object v3, v7

    goto :goto_21

    :cond_20
    move-object v3, v6

    :goto_21
    sget-object v5, Lpc;->v:Lpc;

    invoke-virtual {v4, v5}, Lfd;->e(Lpc;)Ljf;

    move-result-object v7

    if-eqz v7, :cond_2f

    new-instance v8, Lo24;

    invoke-direct {v8, v5, v7}, Lo24;-><init>(Lpc;Ljf;)V

    goto :goto_30

    :cond_2f
    move-object v8, v6

    :goto_30
    iget-object v5, p0, Lu85;->j:Ljava/lang/Object;

    check-cast v5, Ltsd;

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_a6

    iget-object v5, p0, Lu85;->d:Landroid/content/Context;

    invoke-static {v5}, Lr9n;->i(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v7

    invoke-virtual {v7}, Landroid/graphics/Rect;->height()I

    move-result v7

    invoke-static {v7, v5}, Lddh;->s(ILandroid/content/Context;)Lgpj;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    if-eqz v5, :cond_a6

    const/4 v7, 0x1

    if-eq v5, v7, :cond_5e

    const/4 v9, 0x2

    if-eq v5, v9, :cond_5e

    invoke-static {}, Lh9o;->p()V

    return-object v6

    :cond_5e
    iget-object v5, p0, Lu85;->f:Ljava/lang/Object;

    check-cast v5, Lt8k;

    iget-object v5, v5, Lt8k;->d:Lr8k;

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    if-eqz v5, :cond_a6

    if-ne v5, v7, :cond_a9

    iget-object v5, p0, Lu85;->e:Ljava/lang/Object;

    check-cast v5, Lp6l;

    sget-object v7, Lp6l;->a:Lp6l;

    if-ne v5, v7, :cond_a6

    sget-object v5, Lpc;->z:Lpc;

    invoke-virtual {v4, v5}, Lfd;->b(Lpc;)Z

    move-result v7

    if-nez v7, :cond_84

    sget-object v7, Lpc;->m:Lpc;

    invoke-virtual {v4, v7}, Lfd;->b(Lpc;)Z

    move-result v7

    if-eqz v7, :cond_a6

    :cond_84
    sget-object v7, Lpc;->A:Lpc;

    invoke-virtual {v4, v7}, Lfd;->b(Lpc;)Z

    move-result v9

    if-eqz v9, :cond_a6

    new-instance v6, Lzm8;

    invoke-virtual {v4, v5}, Lfd;->b(Lpc;)Z

    move-result v4

    if-eqz v4, :cond_99

    invoke-virtual {p0, v5}, Lu85;->e(Lpc;)Lo24;

    move-result-object v4

    goto :goto_9f

    :cond_99
    sget-object v4, Lpc;->m:Lpc;

    invoke-virtual {p0, v4}, Lu85;->e(Lpc;)Lo24;

    move-result-object v4

    :goto_9f
    invoke-virtual {p0, v7}, Lu85;->e(Lpc;)Lo24;

    move-result-object p0

    invoke-direct {v6, v4, p0}, Lzm8;-><init>(Lo24;Lo24;)V

    :cond_a6
    move-object v5, v6

    move-object v4, v8

    goto :goto_ad

    :cond_a9
    invoke-static {}, Lh9o;->p()V

    return-object v6

    :goto_ad
    invoke-direct/range {v0 .. v5}, Lq85;-><init>(ZLeri;Lo24;Lo24;Lzm8;)V

    return-object v0
.end method

.method public final b(Landroid/graphics/Rect;Z)V
    .registers 3

    iget-object p0, p0, Lu85;->k:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    return-void
.end method

.method public final c()V
    .registers 4

    iget-boolean v0, p0, Lu85;->a:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lu85;->a:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lu85;->j:Ljava/lang/Object;

    iget-object v1, p0, Lu85;->k:Ljava/lang/Object;

    check-cast v1, Lndc;

    if-eqz v1, :cond_1e

    invoke-interface {v1}, Lndc;->getLifecycle()Ltcc;

    move-result-object v1

    iget-object v2, p0, Lu85;->g:Ljava/lang/Object;

    check-cast v2, Lob;

    invoke-virtual {v1, v2}, Ltcc;->b(Lmdc;)V

    iput-object v0, p0, Lu85;->k:Ljava/lang/Object;

    :cond_1e
    iget-object v0, p0, Lu85;->e:Ljava/lang/Object;

    check-cast v0, Lr0k;

    iget-object p0, p0, Lu85;->f:Ljava/lang/Object;

    check-cast p0, La9e;

    invoke-interface {v0, p0}, Lr0k;->f(La9e;)V

    return-void
.end method

.method public final e(Lpc;)Lo24;
    .registers 3

    new-instance v0, Lo24;

    iget-object p0, p0, Lu85;->h:Ljava/lang/Object;

    check-cast p0, Lfd;

    invoke-virtual {p0, p1}, Lfd;->e(Lpc;)Ljf;

    move-result-object p0

    if-nez p0, :cond_10

    sget-object p0, Lfd;->e:Ljf;

    sget-object p0, Lfd;->e:Ljf;

    :cond_10
    invoke-direct {v0, p1, p0}, Lo24;-><init>(Lpc;Ljf;)V

    return-object v0
.end method

.method public final f()V
    .registers 10

    iget-object v0, p0, Lu85;->e:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    iget-object v1, p0, Lu85;->j:Ljava/lang/Object;

    check-cast v1, Landroid/widget/ListView;

    iget-object v2, p0, Lu85;->h:Ljava/lang/Object;

    check-cast v2, Li21;

    iget-object v3, v2, Li21;->h:Leq1;

    invoke-virtual {v3}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v3

    const/4 v4, 0x0

    iput-boolean v4, v2, Li21;->s:Z

    const/4 v5, 0x1

    iput-boolean v5, v2, Li21;->t:Z

    iget-object v5, p0, Lu85;->d:Landroid/content/Context;

    check-cast v5, Lj39;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v5, v5, Landroid/util/DisplayMetrics;->widthPixels:I

    iget-object v6, p0, Lu85;->i:Ljava/lang/Object;

    check-cast v6, Landroid/widget/ArrayAdapter;

    const/4 v7, 0x0

    invoke-static {v6, v7}, Lojm;->a(Landroid/widget/ListAdapter;Landroid/widget/ListView;)[I

    move-result-object v6

    aget v6, v6, v4

    iget v7, p0, Lu85;->c:I

    add-int v8, v6, v7

    if-ge v5, v8, :cond_43

    sub-int/2addr v5, v7

    invoke-virtual {v2}, Li21;->b()I

    move-result v0

    invoke-static {v5, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, v2, Li21;->o:I

    goto :goto_63

    :cond_43
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v5

    if-ge v5, v6, :cond_54

    invoke-virtual {v2}, Li21;->b()I

    move-result v0

    invoke-static {v8, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, v2, Li21;->o:I

    goto :goto_63

    :cond_54
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    add-int/2addr v0, v7

    invoke-virtual {v2}, Li21;->b()I

    move-result v5

    invoke-static {v0, v5}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, v2, Li21;->o:I

    :goto_63
    invoke-virtual {v2}, Li21;->d()V

    invoke-virtual {v1, v4}, Landroid/widget/ListView;->setDividerHeight(I)V

    iget-boolean v0, p0, Lu85;->a:Z

    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutDirection(I)V

    if-nez v3, :cond_7c

    iget-object v0, p0, Lu85;->g:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    const/16 v0, 0x20

    invoke-virtual {v1, v0}, Landroid/view/View;->sendAccessibilityEvent(I)V

    :cond_7c
    iget v0, p0, Lu85;->b:I

    if-ltz v0, :cond_86

    invoke-virtual {v1, v0}, Landroid/widget/ListView;->setSelection(I)V

    const/4 v0, -0x1

    iput v0, p0, Lu85;->b:I

    :cond_86
    return-void
.end method

.method public final g()V
    .registers 2

    iget-object v0, p0, Lu85;->k:Ljava/lang/Object;

    check-cast v0, Lpde;

    invoke-virtual {p0}, Lu85;->a()Lq85;

    move-result-object p0

    invoke-static {v0, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void
.end method

.method public final h(Lqop;)V
    .registers 9

    iget-object v0, p0, Lu85;->h:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Runnable;

    iget-object v1, p0, Lu85;->i:Ljava/lang/Object;

    check-cast v1, Lcom/opera/api/Callback;

    iget-object v2, p0, Lu85;->e:Ljava/lang/Object;

    check-cast v2, Lr0k;

    iget v3, p0, Lu85;->b:I

    iget-boolean v4, p0, Lu85;->a:Z

    if-nez v4, :cond_83

    iget v4, p1, Lqop;->a:I

    if-ne v4, v3, :cond_83

    iget v4, p1, Lqop;->b:I

    const/4 v5, 0x3

    iget-object v6, p0, Lu85;->d:Landroid/content/Context;

    if-eq v4, v5, :cond_72

    const/4 v5, 0x5

    if-eq v4, v5, :cond_60

    const/4 v0, 0x6

    if-eq v4, v0, :cond_49

    const/4 v0, 0x7

    if-eq v4, v0, :cond_40

    const/16 v0, 0x8

    if-ne v4, v0, :cond_83

    :try_start_2a
    iget-object v0, p0, Lu85;->j:Ljava/lang/Object;

    check-cast v0, Lgdb;

    if-eqz v0, :cond_38

    iget v1, p0, Lu85;->c:I

    invoke-interface {v2, p1, v0, v1}, Lr0k;->d(Lqop;Lgdb;I)Z

    move-result p1
    :try_end_36
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_2a .. :try_end_36} :catch_38

    if-nez p1, :cond_83

    :catch_38
    :cond_38
    iget-boolean p0, p0, Lu85;->a:Z

    if-nez p0, :cond_83

    invoke-interface {v2, v3}, Lr0k;->b(I)Lcom/google/android/gms/tasks/Task;

    goto :goto_83

    :cond_40
    invoke-virtual {p0}, Lu85;->c()V

    const-string p0, "canceled"

    invoke-interface {v1, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_49
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "failed: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p1, p1, Lqop;->c:I

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Lu85;->c()V

    invoke-interface {v1, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_60
    invoke-virtual {p0}, Lu85;->c()V

    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v6}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-static {p0}, Lb8h;->n(Lcom/opera/android/OperaApplication;)V

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    return-void

    :cond_72
    invoke-virtual {p0}, Lu85;->c()V

    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v6}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-static {p0}, Lb8h;->n(Lcom/opera/android/OperaApplication;)V

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    :cond_83
    :goto_83
    return-void
.end method
