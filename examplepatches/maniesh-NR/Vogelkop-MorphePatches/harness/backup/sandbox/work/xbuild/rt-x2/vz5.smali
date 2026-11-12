.class public final Lvz5;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:Z

.field public d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;

.field public final f:Ljava/lang/Object;

.field public final g:Ljava/lang/Object;

.field public h:Ljava/lang/Object;

.field public i:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/view/View;Landroid/graphics/Rect;Ly1n;)V
    .registers 6

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    .line 58
    new-array v0, v0, [I

    iput-object v0, p0, Lvz5;->d:Ljava/lang/Object;

    .line 59
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lvz5;->h:Ljava/lang/Object;

    .line 60
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lvz5;->i:Ljava/lang/Object;

    const/4 v1, -0x1

    .line 61
    iput v1, p0, Lvz5;->a:I

    .line 62
    iput v1, p0, Lvz5;->b:I

    .line 63
    iput-object p1, p0, Lvz5;->e:Ljava/lang/Object;

    .line 64
    iput-object p2, p0, Lvz5;->f:Ljava/lang/Object;

    .line 65
    iput-object p3, p0, Lvz5;->g:Ljava/lang/Object;

    const/4 p0, 0x0

    .line 66
    aput v1, v0, p0

    const/4 p0, 0x1

    .line 67
    aput v1, v0, p0

    return-void
.end method

.method public constructor <init>(Lcz4;Lumi;Ld7h;)V
    .registers 13

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Li5m;

    iget-object v1, p0, Lvz5;->e:Ljava/lang/Object;

    move-object v5, v1

    check-cast v5, Loji;

    const/4 v6, 0x2

    const-wide/16 v7, 0x0

    const/4 v2, -0x1

    const-string v3, ""

    const-string v4, ""

    move-object v1, p0

    invoke-direct/range {v0 .. v8}, Lj5m;-><init>(Lvz5;ILjava/lang/String;Ljava/lang/String;Loji;IJ)V

    iput-object v0, v1, Lvz5;->d:Ljava/lang/Object;

    new-instance p0, Loji;

    invoke-direct {p0, v1}, Loji;-><init>(Ljava/lang/Object;)V

    iput-object p0, v1, Lvz5;->e:Ljava/lang/Object;

    new-instance p0, Lkze;

    invoke-direct {p0, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p0, v1, Lvz5;->f:Ljava/lang/Object;

    const/4 p0, -0x1

    iput p0, v1, Lvz5;->b:I

    iget-object p0, p1, Lcz4;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    sget-object p1, Lcom/opera/android/browser/chromium/ChromiumContent;->V:Lorg/chromium/url/GURL;

    new-instance p1, Leme;

    invoke-direct {p1, p0}, Leme;-><init>(Ljava/lang/Object;)V

    iput-object p1, v1, Lvz5;->g:Ljava/lang/Object;

    iput-object p2, v1, Lvz5;->h:Ljava/lang/Object;

    iput-object p3, v1, Lvz5;->i:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Llrd;Lgrd;Ljava/lang/String;Ljava/lang/String;IZILcod;)V
    .registers 13

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    iget-object v0, p2, Lgrd;->a:Ljava/lang/String;

    .line 76
    invoke-interface {p1}, Llrd;->b()Ljava/lang/String;

    move-result-object v1

    .line 77
    const-string v2, "route:"

    .line 78
    const-string v3, "/"

    .line 79
    invoke-static {v2, p3, v3, v0, v3}, Lz1m;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 82
    iput-object v0, p0, Lvz5;->e:Ljava/lang/Object;

    .line 83
    iput-object p1, p0, Lvz5;->d:Ljava/lang/Object;

    .line 84
    iput-object p2, p0, Lvz5;->h:Ljava/lang/Object;

    .line 85
    iput-object p3, p0, Lvz5;->f:Ljava/lang/Object;

    .line 86
    iput-object p4, p0, Lvz5;->g:Ljava/lang/Object;

    .line 87
    iput p5, p0, Lvz5;->a:I

    .line 88
    iput-boolean p6, p0, Lvz5;->c:Z

    .line 89
    iput p7, p0, Lvz5;->b:I

    .line 90
    iput-object p8, p0, Lvz5;->i:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lz05;Lqre;Ls9i;Lx5f;)V
    .registers 6

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 69
    iput v0, p0, Lvz5;->b:I

    .line 70
    iput-object p1, p0, Lvz5;->e:Ljava/lang/Object;

    .line 71
    iput-object p2, p0, Lvz5;->f:Ljava/lang/Object;

    .line 72
    iput-object p3, p0, Lvz5;->d:Ljava/lang/Object;

    .line 73
    iput-object p4, p0, Lvz5;->g:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 3

    const/4 v0, 0x0

    iput v0, p0, Lvz5;->a:I

    const/4 v1, 0x0

    iput-object v1, p0, Lvz5;->h:Ljava/lang/Object;

    iput-boolean v0, p0, Lvz5;->c:Z

    return-void
.end method

.method public final b()V
    .registers 12

    iget-boolean v0, p0, Lvz5;->c:Z

    if-eqz v0, :cond_8c

    iget v0, p0, Lvz5;->b:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_8c

    iget-object v0, p0, Lvz5;->f:Ljava/lang/Object;

    check-cast v0, Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lj5m;

    iget v4, v0, Lj5m;->a:I

    iget v2, p0, Lvz5;->b:I

    if-eq v4, v2, :cond_1c

    iput v1, p0, Lvz5;->b:I

    return-void

    :cond_1c
    iput v1, p0, Lvz5;->b:I

    iget-object p0, p0, Lvz5;->g:Ljava/lang/Object;

    check-cast p0, Leme;

    iget-object v6, v0, Lj5m;->b:Ljava/lang/String;

    iget-object v7, v0, Lj5m;->c:Ljava/lang/String;

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-wide v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_8c

    sget-object v0, Lt8;->a:Landroid/content/Context;

    invoke-static {v0}, Le3j;->t(Landroid/content/Context;)Le3j;

    move-result-object v1

    invoke-virtual {v1}, Lno7;->i()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ld3j;

    const/16 v2, 0xc

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Ld3j;->d(IZ)Lc3j;

    move-result-object v1

    const-string v2, "437df5be521b02c593ba73aaeeb4dc79361918c4e6dcbd2a5b58aa88a1b4f20b"

    const-string v3, "translation.opera-api.com"

    if-eqz v1, :cond_5b

    iget-object v5, v1, Lc3j;->d:Ljava/lang/Comparable;

    check-cast v5, Ljava/lang/String;

    invoke-static {v5, v3}, Laik;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iget-object v1, v1, Lqsh;->b:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-static {v1, v2}, Laik;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :cond_5b
    move-object v9, v2

    invoke-static {v0}, Li0l;->h(Landroid/content/Context;)Lcom/opera/android/Lazy;

    move-result-object v0

    move-object v1, v3

    iget-wide v2, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    iget v5, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->l:I

    new-instance p0, Landroid/net/Uri$Builder;

    invoke-direct {p0}, Landroid/net/Uri$Builder;-><init>()V

    const-string v8, "https"

    invoke-virtual {p0, v8}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v1, "api/translate"

    invoke-virtual {p0, v1}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    move-object v10, p0

    check-cast v10, Ljava/lang/String;

    invoke-static/range {v2 .. v10}, LJ/N;->MubyJW6F(JIILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_8c
    return-void
.end method

.method public final c(Ljava/util/EnumSet;)V
    .registers 12

    iget-object v0, p0, Lvz5;->f:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, Lqre;

    iget-object v0, v4, Lqre;->b:Lyqe;

    iget-object v1, p0, Lvz5;->i:Ljava/lang/Object;

    check-cast v1, Lj92;

    if-eqz v1, :cond_d4

    iget-object v1, p0, Lvz5;->h:Ljava/lang/Object;

    check-cast v1, Lash;

    if-nez v1, :cond_d4

    iget-object v1, p0, Lvz5;->e:Ljava/lang/Object;

    if-eqz v0, :cond_24

    invoke-virtual {v0}, Lyqe;->a()Z

    move-result v2

    if-eqz v2, :cond_24

    move-object v2, v1

    check-cast v2, Lz05;

    iget-object v2, v2, Lz05;->i:Lbre;

    if-eqz v2, :cond_d4

    :cond_24
    iget-object v2, p0, Lvz5;->i:Ljava/lang/Object;

    check-cast v2, Lj92;

    invoke-interface {v2}, Lj92;->b()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v3, 0x0

    move v5, v3

    move v6, v5

    :cond_33
    :goto_33
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    const/4 v8, 0x1

    if-eqz v7, :cond_58

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcdg;

    iget-object v9, v7, Lcdg;->a:Ll5b;

    iget-boolean v9, v9, Ll5b;->b:Z

    if-eqz v9, :cond_48

    move v2, v8

    goto :goto_59

    :cond_48
    iget-object v9, v7, Lcdg;->b:Ll5b;

    iget-boolean v9, v9, Ll5b;->b:Z

    if-eqz v9, :cond_50

    move v6, v8

    goto :goto_33

    :cond_50
    iget-object v7, v7, Lcdg;->c:Ll5b;

    iget-boolean v7, v7, Ll5b;->b:Z

    if-eqz v7, :cond_33

    move v5, v8

    goto :goto_33

    :cond_58
    move v2, v3

    :goto_59
    const/4 v7, -0x1

    if-eqz v5, :cond_61

    iget v9, p0, Lvz5;->b:I

    if-ne v9, v7, :cond_61

    move v2, v8

    :cond_61
    const/4 v9, 0x3

    if-eqz v2, :cond_6a

    iget v2, p0, Lvz5;->a:I

    if-gtz v2, :cond_71

    move v9, v8

    goto :goto_71

    :cond_6a
    if-nez v5, :cond_71

    if-eqz v6, :cond_70

    const/4 v9, 0x2

    goto :goto_71

    :cond_70
    move v9, v3

    :cond_71
    :goto_71
    if-eqz v9, :cond_d4

    if-ne v9, v8, :cond_77

    iput v7, p0, Lvz5;->b:I

    :cond_77
    iget-object v2, p0, Lvz5;->d:Ljava/lang/Object;

    check-cast v2, Ls9i;

    move-object v6, v1

    check-cast v6, Lz05;

    iget v5, p0, Lvz5;->b:I

    if-eqz p1, :cond_8a

    sget-object v1, Lvc9;->a:Lvc9;

    invoke-virtual {p1, v1}, Ljava/util/AbstractCollection;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_8b

    :cond_8a
    move v8, v3

    :cond_8b
    iget-object p1, v2, Ls9i;->e:Ljava/lang/Object;

    check-cast p1, Luy8;

    if-eqz p1, :cond_d1

    if-eqz v0, :cond_b2

    iget-object p1, v0, Lyqe;->a:Ljava/lang/String;

    const-string v0, "clip_"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_b2

    new-instance v1, Lfab;

    iget-object p1, v2, Ls9i;->b:Ljava/lang/Object;

    check-cast p1, Landroid/content/Context;

    iget-object v0, v2, Ls9i;->d:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Lvr9;

    iget-object v0, v2, Ls9i;->e:Ljava/lang/Object;

    move-object v7, v0

    check-cast v7, Luy8;

    move-object v2, p1

    invoke-direct/range {v1 .. v8}, Lfab;-><init>(Landroid/content/Context;Lywh;Lqre;ILz05;Luy8;Z)V

    goto :goto_c6

    :cond_b2
    new-instance v1, Lash;

    iget-object p1, v2, Ls9i;->b:Ljava/lang/Object;

    check-cast p1, Landroid/content/Context;

    iget-object v0, v2, Ls9i;->d:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Lvr9;

    iget-object v0, v2, Ls9i;->e:Ljava/lang/Object;

    move-object v7, v0

    check-cast v7, Luy8;

    move-object v2, p1

    invoke-direct/range {v1 .. v8}, Lash;-><init>(Landroid/content/Context;Lywh;Lqre;ILz05;Luy8;Z)V

    :goto_c6
    iput-object v1, p0, Lvz5;->h:Ljava/lang/Object;

    new-instance p1, Lbp;

    invoke-direct {p1, p0, v9}, Lbp;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v1, p1}, Ln82;->U(Lm82;)V

    return-void

    :cond_d1
    invoke-static {}, Lh9o;->e()V

    :cond_d4
    return-void
.end method

.method public final d(Z)V
    .registers 12

    iget-object v0, p0, Lvz5;->f:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/Rect;

    iget-object v1, p0, Lvz5;->d:Ljava/lang/Object;

    check-cast v1, [I

    const/4 v2, 0x0

    aget v3, v1, v2

    const/4 v4, 0x1

    aget v5, v1, v4

    iget v6, p0, Lvz5;->a:I

    iget v7, p0, Lvz5;->b:I

    iget-object v8, p0, Lvz5;->e:Ljava/lang/Object;

    check-cast v8, Landroid/view/View;

    invoke-virtual {v8, v1}, Landroid/view/View;->getLocationInWindow([I)V

    aget v9, v1, v2

    invoke-static {v9, v2}, Ljava/lang/Math;->max(II)I

    move-result v9

    aput v9, v1, v2

    aget v9, v1, v4

    invoke-static {v9, v2}, Ljava/lang/Math;->max(II)I

    move-result v9

    aput v9, v1, v4

    invoke-virtual {v8}, Landroid/view/View;->getWidth()I

    move-result v9

    iput v9, p0, Lvz5;->a:I

    invoke-virtual {v8}, Landroid/view/View;->getHeight()I

    move-result v9

    iput v9, p0, Lvz5;->b:I

    if-nez p1, :cond_46

    aget p1, v1, v2

    if-ne p1, v3, :cond_46

    aget p1, v1, v4

    if-ne p1, v5, :cond_46

    iget p1, p0, Lvz5;->a:I

    if-ne p1, v6, :cond_46

    if-ne v9, v7, :cond_46

    return-void

    :cond_46
    aget p1, v1, v2

    iput p1, v0, Landroid/graphics/Rect;->left:I

    aget v1, v1, v4

    iput v1, v0, Landroid/graphics/Rect;->top:I

    invoke-virtual {v8}, Landroid/view/View;->getWidth()I

    move-result v1

    add-int/2addr v1, p1

    iput v1, v0, Landroid/graphics/Rect;->right:I

    iget p1, v0, Landroid/graphics/Rect;->top:I

    invoke-virtual {v8}, Landroid/view/View;->getHeight()I

    move-result v1

    add-int/2addr v1, p1

    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    iget p1, v0, Landroid/graphics/Rect;->left:I

    iget-object v3, p0, Lvz5;->h:Ljava/lang/Object;

    check-cast v3, Landroid/graphics/Rect;

    iget v5, v3, Landroid/graphics/Rect;->left:I

    add-int/2addr p1, v5

    iput p1, v0, Landroid/graphics/Rect;->left:I

    iget v5, v0, Landroid/graphics/Rect;->top:I

    iget v6, v3, Landroid/graphics/Rect;->top:I

    add-int/2addr v5, v6

    iput v5, v0, Landroid/graphics/Rect;->top:I

    iget v6, v0, Landroid/graphics/Rect;->right:I

    iget v7, v3, Landroid/graphics/Rect;->right:I

    sub-int/2addr v6, v7

    iput v6, v0, Landroid/graphics/Rect;->right:I

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v1, v3

    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    iget-object v3, p0, Lvz5;->i:Ljava/lang/Object;

    check-cast v3, Landroid/graphics/Rect;

    iget v7, v3, Landroid/graphics/Rect;->left:I

    sub-int/2addr p1, v7

    iput p1, v0, Landroid/graphics/Rect;->left:I

    iget p1, v3, Landroid/graphics/Rect;->top:I

    sub-int/2addr v5, p1

    iput v5, v0, Landroid/graphics/Rect;->top:I

    iget p1, v3, Landroid/graphics/Rect;->right:I

    add-int/2addr v6, p1

    iput v6, v0, Landroid/graphics/Rect;->right:I

    iget p1, v3, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v1, p1

    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    iget-boolean p1, p0, Lvz5;->c:Z

    if-nez p1, :cond_d3

    invoke-virtual {v8}, Landroid/view/View;->getLayoutDirection()I

    move-result p1

    if-ne p1, v4, :cond_9f

    move v2, v4

    :cond_9f
    iget p1, v0, Landroid/graphics/Rect;->left:I

    sget-object v1, Lr5n;->a:Ljava/util/WeakHashMap;

    if-eqz v2, :cond_aa

    invoke-virtual {v8}, Landroid/view/View;->getPaddingEnd()I

    move-result v1

    goto :goto_ae

    :cond_aa
    invoke-virtual {v8}, Landroid/view/View;->getPaddingStart()I

    move-result v1

    :goto_ae
    add-int/2addr p1, v1

    iput p1, v0, Landroid/graphics/Rect;->left:I

    iget p1, v0, Landroid/graphics/Rect;->right:I

    if-eqz v2, :cond_ba

    invoke-virtual {v8}, Landroid/view/View;->getPaddingStart()I

    move-result v1

    goto :goto_be

    :cond_ba
    invoke-virtual {v8}, Landroid/view/View;->getPaddingEnd()I

    move-result v1

    :goto_be
    sub-int/2addr p1, v1

    iput p1, v0, Landroid/graphics/Rect;->right:I

    iget p1, v0, Landroid/graphics/Rect;->top:I

    invoke-virtual {v8}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    add-int/2addr v1, p1

    iput v1, v0, Landroid/graphics/Rect;->top:I

    iget p1, v0, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v8}, Landroid/view/View;->getPaddingBottom()I

    move-result v1

    sub-int/2addr p1, v1

    iput p1, v0, Landroid/graphics/Rect;->bottom:I

    :cond_d3
    iget p1, v0, Landroid/graphics/Rect;->left:I

    iget v1, v0, Landroid/graphics/Rect;->right:I

    invoke-static {p1, v1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, v0, Landroid/graphics/Rect;->right:I

    iget p1, v0, Landroid/graphics/Rect;->top:I

    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    invoke-static {p1, v1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, v0, Landroid/graphics/Rect;->bottom:I

    iget p1, v0, Landroid/graphics/Rect;->right:I

    invoke-virtual {v8}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result p1

    iput p1, v0, Landroid/graphics/Rect;->right:I

    iget p1, v0, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v8}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result p1

    iput p1, v0, Landroid/graphics/Rect;->bottom:I

    iget-object p0, p0, Lvz5;->g:Ljava/lang/Object;

    check-cast p0, Ly1n;

    invoke-virtual {p0}, Ly1n;->run()V

    return-void
.end method
