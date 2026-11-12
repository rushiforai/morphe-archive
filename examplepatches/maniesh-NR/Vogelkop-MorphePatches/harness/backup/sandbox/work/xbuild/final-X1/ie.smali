.class public abstract Lie;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lge;

.field public final b:Lk6l;

.field public final c:Lu4l;

.field public final d:Ls9i;

.field public final e:Lx9l;

.field public final f:Ljava/util/LinkedHashSet;

.field public final g:Lhe;

.field public final h:Ldkf;

.field public i:I

.field public final j:Ljava/util/LinkedHashMap;


# direct methods
.method public constructor <init>(Lge;Lk6l;Lu4l;Ls9i;Lx9l;Ljava/util/LinkedHashSet;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lie;->a:Lge;

    iput-object p2, p0, Lie;->b:Lk6l;

    iput-object p3, p0, Lie;->c:Lu4l;

    iput-object p4, p0, Lie;->d:Ls9i;

    iput-object p5, p0, Lie;->e:Lx9l;

    iput-object p6, p0, Lie;->f:Ljava/util/LinkedHashSet;

    new-instance p2, Lhe;

    const/4 p3, 0x0

    invoke-direct {p2, p0, p3}, Lhe;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Lie;->g:Lhe;

    iget-object p1, p1, Lge;->k:Ldkf;

    if-nez p1, :cond_1c

    const/4 p1, 0x0

    :cond_1c
    iput-object p1, p0, Lie;->h:Ldkf;

    const/4 p1, 0x1

    iput p1, p0, Lie;->i:I

    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p1, p0, Lie;->j:Ljava/util/LinkedHashMap;

    return-void
.end method

.method public static c(Landroid/view/Menu;)V
    .registers 3

    const-string v0, ""

    const/4 v1, 0x0

    invoke-interface {p0, v1, v1, v1, v0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p0

    const v0, 0x7f0d010e

    invoke-interface {p0, v0}, Landroid/view/MenuItem;->setActionView(I)Landroid/view/MenuItem;

    move-result-object p0

    invoke-interface {p0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/Menu;Lfe;)V
    .registers 6

    iget v0, p0, Lie;->i:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lie;->i:I

    iget-object v1, p0, Lie;->j:Ljava/util/LinkedHashMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p2}, Lfe;->b()Lpxh;

    move-result-object v1

    iget-object p0, p0, Lie;->h:Ldkf;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v1, v2}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p1

    invoke-virtual {p2}, Lfe;->a()Lb8h;

    move-result-object p2

    invoke-virtual {p2, p0}, Lb8h;->f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-interface {p1, p0}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    return-void
.end method

.method public final b(Landroid/view/SubMenu;Lu3l;Ljava/util/Set;)V
    .registers 14

    sget-object v0, Lyd;->a:Lyd;

    invoke-virtual {p0, p1, v0}, Lie;->a(Landroid/view/Menu;Lfe;)V

    iget-object v0, p0, Lie;->d:Ls9i;

    iget-object v0, v0, Ls9i;->d:Ljava/lang/Object;

    check-cast v0, Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqyi;

    instance-of v0, v0, Lpyi;

    if-eqz v0, :cond_c2

    iget-object v0, p0, Lie;->b:Lk6l;

    invoke-static {v0, p2}, Lexg;->s(Lk6l;Lu3l;)Ljava/util/List;

    move-result-object p2

    check-cast p2, Ljava/lang/Iterable;

    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_21
    :goto_21
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_c2

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlin/Pair;

    iget-object v1, v0, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    iget-object v2, p0, Lie;->c:Lu4l;

    invoke-virtual {v2, v1}, Lu4l;->a(I)Lm4l;

    move-result-object v1

    iget-object v0, v0, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    iget v2, v1, Lm4l;->a:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {p3, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_21

    new-instance v2, Lvd;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-virtual {v1}, Lm4l;->b()Lk4l;

    move-result-object v3

    const/high16 v4, 0x41c00000    # 24.0f

    iget-object v5, p0, Lie;->h:Ldkf;

    invoke-static {v5, v4}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v4

    iget-object v6, v3, Lk4l;->a:Ldxh;

    invoke-virtual {v6, v5}, Lcxh;->a(Landroid/content/Context;)I

    move-result v6

    invoke-static {v4, v6}, Lj14;->D(II)Landroid/graphics/drawable/ShapeDrawable;

    move-result-object v4

    sget v6, Lb0j;->d:I

    new-instance v6, Landroid/graphics/drawable/LayerDrawable;

    const/4 v7, 0x1

    new-array v8, v7, [Landroid/graphics/drawable/Drawable;

    const/4 v9, 0x0

    aput-object v4, v8, v9

    invoke-direct {v6, v8}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v6, v9, v9}, Landroid/graphics/drawable/LayerDrawable;->setId(II)V

    new-instance v4, Lb0j;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    filled-new-array {v8}, [Ljava/lang/Integer;

    move-result-object v8

    invoke-direct {v4, v6, v8}, Lb0j;-><init>(Landroid/graphics/drawable/LayerDrawable;[Ljava/lang/Integer;)V

    new-instance v6, Lngl;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v8

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, v7}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    const-string v7, "%d"

    invoke-static {v8, v7, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const/4 v7, 0x2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v8

    if-le v8, v7, :cond_a5

    const-string v0, "\u2026"

    :cond_a5
    sget-object v7, Landroid/graphics/Typeface;->SANS_SERIF:Landroid/graphics/Typeface;

    const/high16 v8, 0x41400000    # 12.0f

    invoke-static {v5, v8}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v8

    iget-object v3, v3, Lk4l;->b:Ldxh;

    invoke-virtual {v3, v5}, Lcxh;->a(Landroid/content/Context;)I

    move-result v3

    invoke-direct {v6, v0, v7, v8, v3}, Lngl;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    invoke-static {v4, v6}, Lj14;->p(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/LayerDrawable;

    move-result-object v0

    invoke-direct {v2, v1, v0}, Lvd;-><init>(Lm4l;Landroid/graphics/drawable/LayerDrawable;)V

    invoke-virtual {p0, p1, v2}, Lie;->a(Landroid/view/Menu;Lfe;)V

    goto/16 :goto_21

    :cond_c2
    return-void
.end method

.method public final d(Landroid/view/Menu;Lfe;)Landroid/view/SubMenu;
    .registers 6

    iget v0, p0, Lie;->i:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lie;->i:I

    iget-object v1, p0, Lie;->j:Ljava/util/LinkedHashMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p2}, Lfe;->b()Lpxh;

    move-result-object v1

    iget-object p0, p0, Lie;->h:Ldkf;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v1, v2}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->addSubMenu(IIILjava/lang/CharSequence;)Landroid/view/SubMenu;

    move-result-object p1

    invoke-virtual {p2}, Lfe;->a()Lb8h;

    move-result-object p2

    invoke-virtual {p2, p0}, Lb8h;->f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-interface {p1, p0}, Landroid/view/SubMenu;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/SubMenu;

    invoke-interface {p1}, Landroid/view/SubMenu;->clearHeader()V

    invoke-interface {p1}, Landroid/view/SubMenu;->getItem()Landroid/view/MenuItem;

    move-result-object p0

    const p2, 0x7f0d031d

    invoke-interface {p0, p2}, Landroid/view/MenuItem;->setActionView(I)Landroid/view/MenuItem;

    invoke-interface {p1}, Landroid/view/SubMenu;->getItem()Landroid/view/MenuItem;

    move-result-object p0

    invoke-interface {p0}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_55

    const p2, 0x7f0a0066

    invoke-virtual {p0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/ImageView;

    if-eqz p0, :cond_55

    const p2, 0x7f08051d

    invoke-virtual {p0, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    :cond_55
    return-object p1
.end method

.method public e(Landroid/view/Menu;)V
    .registers 3

    iget-object p1, p0, Lie;->h:Ldkf;

    invoke-static {p1}, Lzi4;->y(Landroid/content/Context;)Lm24;

    move-result-object p1

    iget-object v0, p0, Lie;->g:Lhe;

    invoke-interface {p1, v0}, Lm24;->a(Ll24;)V

    iget-object p0, p0, Lie;->e:Lx9l;

    invoke-interface {p0}, Lx9l;->o()V

    return-void
.end method
