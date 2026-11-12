.class public final Ld7l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lb2l;


# instance fields
.field public final a:Lz4k;

.field public final b:Lb7l;

.field public final c:Laal;

.field public final d:Ltw2;

.field public final e:Lw6j;

.field public final f:Lwci;

.field public final g:Lh7f;

.field public final h:Lxbf;

.field public final i:Liga;

.field public j:Le7l;

.field public k:Z

.field public final l:Llqm;

.field public m:Z


# direct methods
.method public constructor <init>(Lilj;Ld7l;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lz4k;

    const/4 v1, 0x5

    invoke-direct {v0, p0, v1}, Lz4k;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Ld7l;->a:Lz4k;

    new-instance v0, Lb7l;

    invoke-direct {v0, p0}, Lb7l;-><init>(Ld7l;)V

    iput-object v0, p0, Ld7l;->b:Lb7l;

    new-instance v1, Lh7f;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Ld7l;->g:Lh7f;

    iget-object v1, p2, Ld7l;->c:Laal;

    iput-object v1, p0, Ld7l;->c:Laal;

    iget-object v2, p2, Ld7l;->d:Ltw2;

    iput-object v2, p0, Ld7l;->d:Ltw2;

    new-instance v2, Lw6j;

    iget-object v3, p2, Ld7l;->e:Lw6j;

    invoke-direct {v2, p0, v3}, Lw6j;-><init>(Ld7l;Lw6j;)V

    iput-object v2, p0, Ld7l;->e:Lw6j;

    iget-object v2, p2, Ld7l;->h:Lxbf;

    iput-object v2, p0, Ld7l;->h:Lxbf;

    new-instance v2, Lwci;

    const/4 v3, 0x6

    invoke-direct {v2, p0, v1, v3}, Lwci;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v2, p0, Ld7l;->f:Lwci;

    iget-object p2, p2, Ld7l;->i:Liga;

    iput-object p2, p0, Ld7l;->i:Liga;

    iput-object p1, p0, Ld7l;->j:Le7l;

    sget-object p2, Llqm;->l:Llqm;

    iput-object p2, p0, Ld7l;->l:Llqm;

    iget-object p0, p1, Lilj;->a:Lh7f;

    invoke-virtual {p0, v0}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public constructor <init>(Lxbf;Lilj;Ltw2;Laal;Liga;Lrc6;Llqm;)V
    .registers 10

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    new-instance v0, Lz4k;

    const/4 v1, 0x5

    invoke-direct {v0, p0, v1}, Lz4k;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Ld7l;->a:Lz4k;

    .line 72
    new-instance v0, Lb7l;

    invoke-direct {v0, p0}, Lb7l;-><init>(Ld7l;)V

    iput-object v0, p0, Ld7l;->b:Lb7l;

    .line 73
    new-instance v1, Lh7f;

    .line 74
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 75
    iput-object v1, p0, Ld7l;->g:Lh7f;

    .line 76
    iput-object p4, p0, Ld7l;->c:Laal;

    .line 77
    iput-object p3, p0, Ld7l;->d:Ltw2;

    .line 78
    new-instance p3, Lw6j;

    invoke-direct {p3, p0, p6}, Lw6j;-><init>(Ld7l;Lrc6;)V

    iput-object p3, p0, Ld7l;->e:Lw6j;

    .line 79
    iput-object p1, p0, Ld7l;->h:Lxbf;

    .line 80
    new-instance p1, Lwci;

    const/4 p3, 0x6

    invoke-direct {p1, p0, p4, p3}, Lwci;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p1, p0, Ld7l;->f:Lwci;

    .line 81
    iput-object p5, p0, Ld7l;->i:Liga;

    .line 82
    iput-object p2, p0, Ld7l;->j:Le7l;

    .line 83
    iput-object p7, p0, Ld7l;->l:Llqm;

    .line 84
    iget-object p0, p2, Lilj;->a:Lh7f;

    invoke-virtual {p0, v0}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public constructor <init>(Lxbf;Luy3;Ltw2;Laal;Liga;Lrc6;Llqm;)V
    .registers 11

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    new-instance v0, Lz4k;

    const/4 v1, 0x5

    invoke-direct {v0, p0, v1}, Lz4k;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Ld7l;->a:Lz4k;

    .line 87
    new-instance v1, Lb7l;

    invoke-direct {v1, p0}, Lb7l;-><init>(Ld7l;)V

    iput-object v1, p0, Ld7l;->b:Lb7l;

    .line 88
    new-instance v2, Lh7f;

    .line 89
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 90
    iput-object v2, p0, Ld7l;->g:Lh7f;

    .line 91
    iput-object p4, p0, Ld7l;->c:Laal;

    .line 92
    iput-object p3, p0, Ld7l;->d:Ltw2;

    .line 93
    new-instance p3, Lw6j;

    invoke-direct {p3, p0, p6}, Lw6j;-><init>(Ld7l;Lrc6;)V

    iput-object p3, p0, Ld7l;->e:Lw6j;

    .line 94
    iput-object p1, p0, Ld7l;->h:Lxbf;

    .line 95
    new-instance p1, Lwci;

    const/4 p3, 0x6

    invoke-direct {p1, p0, p4, p3}, Lwci;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p1, p0, Ld7l;->f:Lwci;

    .line 96
    iput-object p5, p0, Ld7l;->i:Liga;

    .line 97
    iput-object p2, p0, Ld7l;->j:Le7l;

    .line 98
    iput-object p7, p0, Ld7l;->l:Llqm;

    .line 99
    invoke-virtual {p2, v1}, Luy3;->w(Lb7l;)V

    .line 100
    iget-object p3, p2, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    .line 101
    iput-object p1, p3, Lcom/opera/android/browser/chromium/ChromiumContent;->p:Lcom/opera/android/browser/dialog/DialogDelegate;

    .line 102
    iput-object v0, p2, Luy3;->c:Lz4k;

    const/4 p1, 0x1

    .line 103
    iput-boolean p1, p0, Ld7l;->k:Z

    return-void
.end method


# virtual methods
.method public final A()Z
    .registers 1

    const/4 p0, 0x0

    throw p0
.end method

.method public final B()I
    .registers 1

    const/4 p0, 0x0

    throw p0
.end method

.method public final C(ZZLcom/opera/api/Callback;)V
    .registers 16

    iget-object v0, p0, Ld7l;->e:Lw6j;

    invoke-virtual {v0}, Lw6j;->h()Lknf;

    move-result-object v0

    if-eqz v0, :cond_73

    invoke-interface {v0}, Lknf;->r()V

    invoke-interface {v0}, Lknf;->getView()Lcom/opera/android/browser/OperaPageRootView;

    move-result-object v1

    invoke-interface {v0}, Lknf;->B()Likc;

    move-result-object v2

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lmnf;

    const/4 v3, 0x0

    if-nez p1, :cond_20

    iget v4, v2, Lmnf;->a:I

    move v5, v3

    goto :goto_24

    :cond_20
    iget v4, v2, Lmnf;->a:I

    move v5, v4

    move v4, v3

    :goto_24
    if-eqz p2, :cond_28

    move v2, v3

    goto :goto_2a

    :cond_28
    iget v2, v2, Lmnf;->b:I

    :goto_2a
    invoke-virtual {v1}, Landroid/view/View;->isAttachedToWindow()Z

    new-instance v6, Landroid/graphics/Canvas;

    invoke-direct {v6}, Landroid/graphics/Canvas;-><init>()V

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v7

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v8

    sub-int/2addr v8, v4

    sget-object v9, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v7, v8, v9}, Lz5i;->u(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v9

    const/4 v10, 0x0

    if-nez v9, :cond_4b

    invoke-interface {v0}, Lknf;->E()V

    invoke-interface {p3, v10}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_73

    :cond_4b
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v11

    if-eq v8, v11, :cond_54

    invoke-virtual {v6, v3, v3, v7, v8}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    :cond_54
    invoke-virtual {v6, v9}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    neg-int v3, v4

    int-to-float v3, v3

    const/4 v4, 0x0

    invoke-virtual {v6, v4, v3}, Landroid/graphics/Canvas;->translate(FF)V

    sput-object v6, Lj14;->x:Landroid/graphics/Canvas;

    :try_start_5f
    invoke-virtual {v1, v6}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V
    :try_end_62
    .catchall {:try_start_5f .. :try_end_62} :catchall_6f

    sput-object v10, Lj14;->x:Landroid/graphics/Canvas;

    invoke-interface {v0}, Lknf;->E()V

    invoke-static {v9, v5, v2}, Lyni;->a(Landroid/graphics/Bitmap;II)Lyni;

    move-result-object v1

    invoke-interface {p3, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_73

    :catchall_6f
    move-exception p0

    sput-object v10, Lj14;->x:Landroid/graphics/Canvas;

    throw p0

    :cond_73
    :goto_73
    if-eqz v0, :cond_76

    return-void

    :cond_76
    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0, p1, p2, p3}, Lb9l;->C(ZZLcom/opera/api/Callback;)V

    return-void
.end method

.method public final D(Ljava/lang/Runnable;)Lhh4;
    .registers 2

    const/4 p0, 0x0

    throw p0
.end method

.method public final E(IZLcom/opera/api/Callback;)V
    .registers 4

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0, p1, p2, p3}, Lb9l;->E(IZLcom/opera/api/Callback;)V

    return-void
.end method

.method public final bridge synthetic F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, La2l;

    invoke-virtual {p0, p1}, Ld7l;->e0(La2l;)V

    return-void
.end method

.method public final G()Ljava/lang/String;
    .registers 1

    const/4 p0, 0x0

    throw p0
.end method

.method public final bridge synthetic H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, La2l;

    invoke-virtual {p0, p1}, Ld7l;->s0(La2l;)V

    return-void
.end method

.method public final I()Ljava/lang/String;
    .registers 1

    const/4 p0, 0x0

    throw p0
.end method

.method public final J()Z
    .registers 2

    invoke-virtual {p0}, Ld7l;->n0()Z

    move-result v0

    if-nez v0, :cond_10

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->J()Z

    move-result p0

    if-eqz p0, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_10
    const/4 p0, 0x0

    return p0
.end method

.method public final K()I
    .registers 1

    const/4 p0, 0x0

    throw p0
.end method

.method public final M(Z)Z
    .registers 2

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0, p1}, Lb9l;->M(Z)Z

    move-result p0

    return p0
.end method

.method public final N()V
    .registers 1

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->N()V

    return-void
.end method

.method public final O()Z
    .registers 2

    iget-object v0, p0, Ld7l;->e:Lw6j;

    iget-object v0, v0, Lw6j;->d:Ljava/lang/Object;

    check-cast v0, Lknf;

    if-nez v0, :cond_12

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->O()Z

    move-result p0

    if-nez p0, :cond_12

    const/4 p0, 0x0

    return p0

    :cond_12
    const/4 p0, 0x1

    return p0
.end method

.method public final P()I
    .registers 1

    const/4 p0, 0x0

    throw p0
.end method

.method public final Q(Lcom/opera/api/Callback;)Z
    .registers 2

    const/4 p0, 0x0

    throw p0
.end method

.method public final R()Lzg;
    .registers 1

    const/4 p0, 0x0

    throw p0
.end method

.method public final S()Z
    .registers 1

    const/4 p0, 0x0

    throw p0
.end method

.method public final U()Lvz5;
    .registers 1

    const/4 p0, 0x0

    throw p0
.end method

.method public final V()V
    .registers 2

    iget-object v0, p0, Ld7l;->e:Lw6j;

    iget-object v0, v0, Lw6j;->d:Ljava/lang/Object;

    check-cast v0, Lknf;

    if-eqz v0, :cond_b

    invoke-interface {v0}, Lknf;->u()V

    :cond_b
    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->V()V

    return-void
.end method

.method public final W(Z)V
    .registers 3

    iget-object v0, p0, Ld7l;->e:Lw6j;

    iget-object v0, v0, Lw6j;->d:Ljava/lang/Object;

    check-cast v0, Lknf;

    if-eqz v0, :cond_11

    if-eqz p1, :cond_e

    invoke-interface {v0}, Lknf;->F()V

    goto :goto_11

    :cond_e
    invoke-interface {v0}, Lknf;->a()V

    :cond_11
    :goto_11
    iget-boolean v0, p0, Ld7l;->k:Z

    if-nez v0, :cond_25

    iget-object v0, p0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lwqm;->w(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_25

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ld7l;->r0(Z)V

    :cond_25
    iget-object v0, p0, Ld7l;->j:Le7l;

    invoke-interface {v0, p1}, Le7l;->W(Z)V

    iget-object v0, p0, Ld7l;->g:Lh7f;

    if-eqz p1, :cond_42

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p1

    :goto_32
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_56

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, La2l;

    invoke-interface {v0, p0}, La2l;->G(Lb2l;)V

    goto :goto_32

    :cond_42
    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p1

    :goto_46
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_56

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, La2l;

    invoke-interface {v0, p0}, La2l;->S(Ld7l;)V

    goto :goto_46

    :cond_56
    return-void
.end method

.method public final X()V
    .registers 1

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->X()V

    return-void
.end method

.method public final Y()I
    .registers 1

    const/4 p0, 0x0

    throw p0
.end method

.method public final Z(Llsc;)V
    .registers 4

    iget-boolean v0, p0, Ld7l;->k:Z

    if-eqz v0, :cond_a

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0, p1}, Le7l;->Z(Llsc;)V

    return-void

    :cond_a
    iget-object v0, p1, Lksc;->a:Ljava/lang/String;

    invoke-static {v0}, Lwqm;->w(Ljava/lang/String;)Z

    move-result v0

    iget-object v1, p0, Ld7l;->j:Le7l;

    if-eqz v0, :cond_18

    invoke-interface {v1, p1}, Le7l;->Z(Llsc;)V

    return-void

    :cond_18
    invoke-interface {v1}, Lb9l;->isActive()Z

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Ld7l;->r0(Z)V

    iget-object v1, p0, Ld7l;->j:Le7l;

    invoke-interface {v1, p1}, Le7l;->Z(Llsc;)V

    if-eqz v0, :cond_2d

    iget-object p0, p0, Ld7l;->j:Le7l;

    const/4 p1, 0x1

    invoke-interface {p0, p1}, Le7l;->W(Z)V

    :cond_2d
    return-void
.end method

.method public final a()Lcom/opera/android/browser/TabInfo;
    .registers 1

    const/4 p0, 0x0

    throw p0
.end method

.method public final b()V
    .registers 3

    iget-object v0, p0, Ld7l;->e:Lw6j;

    iget-object v1, v0, Lw6j;->d:Ljava/lang/Object;

    check-cast v1, Lknf;

    if-eqz v1, :cond_b

    invoke-interface {v1}, Lknf;->y()V

    :cond_b
    iget-object v0, v0, Lw6j;->d:Ljava/lang/Object;

    check-cast v0, Lknf;

    if-eqz v0, :cond_12

    return-void

    :cond_12
    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->b()V

    return-void
.end method

.method public final b0()Lqwi;
    .registers 1

    const/4 p0, 0x0

    throw p0
.end method

.method public final c()V
    .registers 5

    invoke-virtual {p0}, Ld7l;->i()Lcom/opera/android/browser/NavigationHistory;

    move-result-object v0

    check-cast v0, Liuh;

    iget-object v1, v0, Liuh;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/browser/NavigationHistory;

    invoke-interface {v1}, Lcom/opera/android/browser/NavigationHistory;->d()I

    move-result v2

    if-lez v2, :cond_42

    invoke-interface {v1}, Lcom/opera/android/browser/NavigationHistory;->j()I

    move-result v1

    invoke-virtual {v0, v1}, Liuh;->i(I)Lcom/opera/android/browser/NavigationEntry;

    move-result-object v0

    invoke-interface {v0}, Lcom/opera/android/browser/NavigationEntry;->getId()I

    move-result v0

    iget-object v1, p0, Ld7l;->e:Lw6j;

    iget-object v2, v1, Lw6j;->c:Ljava/lang/Object;

    check-cast v2, Landroid/util/SparseArray;

    iget-object v1, v1, Lw6j;->b:Ljava/lang/Object;

    check-cast v1, Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lknf;

    invoke-virtual {v1}, Landroid/util/SparseArray;->clear()V

    if-eqz v3, :cond_34

    invoke-virtual {v1, v0, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_34
    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Parcelable;

    invoke-virtual {v2}, Landroid/util/SparseArray;->clear()V

    if-eqz v1, :cond_42

    invoke-virtual {v2, v0, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_42
    iget-object v0, p0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->c()V

    iget-object v0, p0, Ld7l;->g:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_4d
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5d

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, La2l;

    invoke-interface {v1, p0}, La2l;->r(Ld7l;)V

    goto :goto_4d

    :cond_5d
    return-void
.end method

.method public final c0()Z
    .registers 1

    const/4 p0, 0x0

    throw p0
.end method

.method public final d()V
    .registers 1

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->d()V

    return-void
.end method

.method public final d0(Ljava/lang/String;ZLcom/opera/api/Callback;)V
    .registers 4

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0, p1, p2, p3}, Lb9l;->d0(Ljava/lang/String;ZLcom/opera/api/Callback;)V

    return-void
.end method

.method public final dispose()V
    .registers 3

    const/4 v0, 0x1

    iput-boolean v0, p0, Ld7l;->m:Z

    iget-object v0, p0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->dispose()V

    iget-object v0, p0, Ld7l;->e:Lw6j;

    iget-object v1, v0, Lw6j;->b:Ljava/lang/Object;

    check-cast v1, Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->clear()V

    iget-object v0, v0, Lw6j;->c:Ljava/lang/Object;

    check-cast v0, Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    iget-object v0, p0, Ld7l;->g:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_1e
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2e

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, La2l;

    invoke-interface {v1, p0}, La2l;->R(Ld7l;)V

    goto :goto_1e

    :cond_2e
    return-void
.end method

.method public final e0(La2l;)V
    .registers 2

    iget-object p0, p0, Ld7l;->g:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final f()Z
    .registers 2

    iget-boolean v0, p0, Ld7l;->m:Z

    if-nez v0, :cond_e

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->f()Z

    move-result p0

    if-eqz p0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method

.method public final f0()Ljava/lang/String;
    .registers 2

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p0

    const-string v0, "article_id"

    invoke-static {p0, v0}, Lcom/opera/android/browser/UrlMangler;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final g()Z
    .registers 1

    const/4 p0, 0x0

    throw p0
.end method

.method public final g0()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Ld7l;->e:Lw6j;

    invoke-virtual {v0}, Lw6j;->h()Lknf;

    move-result-object v0

    if-eqz v0, :cond_d

    invoke-interface {v0}, Lknf;->z()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_d
    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/opera/android/browser/BrowserUtils;->getDisplayString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getId()I
    .registers 1

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->getId()I

    move-result p0

    return p0
.end method

.method public final getUrl()Ljava/lang/String;
    .registers 1

    const/4 p0, 0x0

    throw p0
.end method

.method public final h0()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/opera/android/browser/BrowserUtils;->getExternalUrlWithFallback(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final i()Lcom/opera/android/browser/NavigationHistory;
    .registers 3

    iget-object v0, p0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->i()Lcom/opera/android/browser/NavigationHistory;

    move-result-object v0

    new-instance v1, Liuh;

    invoke-direct {v1, p0, v0}, Liuh;-><init>(Ld7l;Lcom/opera/android/browser/NavigationHistory;)V

    return-object v1
.end method

.method public final i0()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/opera/android/browser/BrowserUtils;->getRendererUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final isActive()Z
    .registers 1

    const/4 p0, 0x0

    throw p0
.end method

.method public final isAudioMuted()Z
    .registers 1

    const/4 p0, 0x0

    throw p0
.end method

.method public final isLoading()Z
    .registers 1

    const/4 p0, 0x0

    throw p0
.end method

.method public final j0()J
    .registers 7

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/opera/android/browser/BrowserUtils;->b(Ljava/lang/String;)Lzg;

    move-result-object p0

    if-eqz p0, :cond_40

    sget-object v0, Leti;->a:Lq6e;

    const/4 v1, 0x0

    if-eqz v0, :cond_39

    iget-object p0, p0, Lzg;->c:Ljava/lang/Object;

    check-cast p0, Lzg;

    iget-object p0, p0, Lzg;->b:Ljava/lang/Object;

    check-cast p0, Landroid/net/Uri;

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    iget-object v0, v0, Lq6e;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    :cond_24
    if-ge v3, v2, :cond_39

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Leri;

    invoke-interface {v4}, Leri;->getUrl()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_24

    move-object v1, v4

    :cond_39
    if-eqz v1, :cond_40

    invoke-interface {v1}, Leri;->getId()J

    move-result-wide v0

    return-wide v0

    :cond_40
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public final k(Z)V
    .registers 2

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0, p1}, Lb9l;->k(Z)V

    return-void
.end method

.method public final k0()Ljava/lang/String;
    .registers 3

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p0

    const-string v0, "article_share_url"

    invoke-static {p0, v0}, Lcom/opera/android/browser/UrlMangler;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_16

    invoke-static {p0}, Lcom/opera/android/browser/BrowserUtils;->getExternalUrlWithFallback(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_16
    return-object v0
.end method

.method public final l0()Ljava/lang/String;
    .registers 1

    invoke-virtual {p0}, Ld7l;->t()Lesk;

    move-result-object p0

    invoke-interface {p0}, Lesk;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public final m()Z
    .registers 1

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->m()Z

    move-result p0

    return p0
.end method

.method public final m0()Lyul;
    .registers 2

    iget-object v0, p0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->isLoading()Z

    move-result v0

    if-eqz v0, :cond_b

    sget-object p0, Lyul;->d:Lyul;

    return-object p0

    :cond_b
    invoke-virtual {p0}, Ld7l;->n0()Z

    move-result v0

    if-eqz v0, :cond_21

    iget-object p0, p0, Ld7l;->e:Lw6j;

    iget-object p0, p0, Lw6j;->d:Ljava/lang/Object;

    check-cast p0, Lknf;

    if-nez p0, :cond_1c

    sget-object p0, Lyul;->e:Lyul;

    return-object p0

    :cond_1c
    invoke-interface {p0}, Lknf;->x()Lyul;

    move-result-object p0

    return-object p0

    :cond_21
    sget-object p0, Lyul;->d:Lyul;

    return-object p0
.end method

.method public final n()Z
    .registers 2

    iget-boolean v0, p0, Ld7l;->m:Z

    if-nez v0, :cond_e

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->n()Z

    move-result p0

    if-eqz p0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method

.method public final n0()Z
    .registers 2

    iget-object v0, p0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v0

    iget-object p0, p0, Ld7l;->i:Liga;

    invoke-interface {p0, v0}, Liga;->g(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public final o()V
    .registers 3

    iget-object v0, p0, Ld7l;->e:Lw6j;

    iget-object v1, v0, Lw6j;->d:Ljava/lang/Object;

    check-cast v1, Lknf;

    if-eqz v1, :cond_b

    invoke-interface {v1}, Lknf;->o()V

    :cond_b
    iget-object v0, v0, Lw6j;->d:Ljava/lang/Object;

    check-cast v0, Lknf;

    if-eqz v0, :cond_12

    return-void

    :cond_12
    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->o()V

    return-void
.end method

.method public final o0()Z
    .registers 1

    iget-object p0, p0, Ld7l;->e:Lw6j;

    iget-object p0, p0, Lw6j;->d:Ljava/lang/Object;

    check-cast p0, Lknf;

    if-eqz p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method

.method public final p()V
    .registers 3

    iget-object v0, p0, Ld7l;->e:Lw6j;

    iget-object v1, v0, Lw6j;->d:Ljava/lang/Object;

    check-cast v1, Lknf;

    if-eqz v1, :cond_b

    invoke-interface {v1}, Lknf;->y()V

    :cond_b
    iget-object v0, v0, Lw6j;->d:Ljava/lang/Object;

    check-cast v0, Lknf;

    if-eqz v0, :cond_12

    return-void

    :cond_12
    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->p()V

    return-void
.end method

.method public final p0()V
    .registers 3

    iget-object v0, p0, Ld7l;->g:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_6
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_16

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, La2l;

    invoke-interface {v1, p0}, La2l;->q(Ld7l;)V

    goto :goto_6

    :cond_16
    return-void
.end method

.method public final q()V
    .registers 3

    iget-object v0, p0, Ld7l;->e:Lw6j;

    iget-object v1, v0, Lw6j;->d:Ljava/lang/Object;

    check-cast v1, Lknf;

    if-eqz v1, :cond_b

    invoke-interface {v1}, Lknf;->q()V

    :cond_b
    iget-object v0, v0, Lw6j;->d:Ljava/lang/Object;

    check-cast v0, Lknf;

    if-eqz v0, :cond_12

    return-void

    :cond_12
    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->q()V

    return-void
.end method

.method public final q0(ILjava/lang/Runnable;)V
    .registers 5

    iget-boolean v0, p0, Ld7l;->k:Z

    if-eqz v0, :cond_8

    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    return-void

    :cond_8
    iget-object v0, p0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->i()Lcom/opera/android/browser/NavigationHistory;

    move-result-object v0

    invoke-interface {v0}, Lcom/opera/android/browser/NavigationHistory;->j()I

    move-result v1

    add-int/2addr v1, p1

    invoke-interface {v0, v1}, Lcom/opera/android/browser/NavigationHistory;->i(I)Lcom/opera/android/browser/NavigationEntry;

    move-result-object p1

    invoke-interface {p1}, Lcom/opera/android/browser/NavigationEntry;->getUrl()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lwqm;->w(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_25

    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    return-void

    :cond_25
    iget-object p1, p0, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->isActive()Z

    move-result p1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ld7l;->r0(Z)V

    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    if-eqz p1, :cond_3a

    iget-object p0, p0, Ld7l;->j:Le7l;

    const/4 p1, 0x1

    invoke-interface {p0, p1}, Le7l;->W(Z)V

    :cond_3a
    return-void
.end method

.method public final r()Z
    .registers 1

    const/4 p0, 0x0

    throw p0
.end method

.method public final r0(Z)V
    .registers 11

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iget-object v1, p0, Ld7l;->j:Le7l;

    check-cast v1, Lilj;

    iget-object v2, v1, Lilj;->b:Lvzk;

    iget v3, v1, Lilj;->e:I

    iget-object v4, v1, Lilj;->f:Lcom/opera/android/browser/TabInfo;

    iget-object v5, v1, Lilj;->c:Ljke;

    iget-boolean v1, v1, Lilj;->d:Z

    iget-object v6, v2, Lvzk;->b:Ljava/lang/Object;

    check-cast v6, Lhz4;

    const/4 v7, 0x0

    invoke-virtual {v6, v1, v7}, Lhz4;->a(ZLorg/chromium/content_public/browser/WebContents;)Lcom/opera/android/browser/chromium/ChromiumContent;

    move-result-object v1

    invoke-interface {v5, v1, v3, v0}, Ljke;->B(Lcom/opera/android/browser/chromium/ChromiumContent;ILjava/util/HashMap;)V

    new-instance v5, Luy3;

    invoke-direct {v5, v2, v1, v3, v4}, Luy3;-><init>(Lvzk;Lcom/opera/android/browser/chromium/ChromiumContent;ILcom/opera/android/browser/TabInfo;)V

    iget-object v1, p0, Ld7l;->e:Lw6j;

    iget-object v2, v1, Lw6j;->b:Ljava/lang/Object;

    check-cast v2, Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->clone()Landroid/util/SparseArray;

    move-result-object v3

    invoke-virtual {v2}, Landroid/util/SparseArray;->clear()V

    const/4 v4, 0x0

    move v6, v4

    :goto_33
    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v7

    if-ge v6, v7, :cond_59

    invoke-virtual {v3, v6}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    if-eqz v7, :cond_56

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-virtual {v3, v6}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lknf;

    invoke-virtual {v2, v7, v8}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    :cond_56
    add-int/lit8 v6, v6, 0x1

    goto :goto_33

    :cond_59
    iget-object v1, v1, Lw6j;->c:Ljava/lang/Object;

    check-cast v1, Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->clone()Landroid/util/SparseArray;

    move-result-object v2

    invoke-virtual {v1}, Landroid/util/SparseArray;->clear()V

    :goto_64
    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v3

    if-ge v4, v3, :cond_8a

    invoke-virtual {v2, v4}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    if-eqz v3, :cond_87

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v4}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/os/Parcelable;

    invoke-virtual {v1, v3, v6}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    :cond_87
    add-int/lit8 v4, v4, 0x1

    goto :goto_64

    :cond_8a
    iget-object v0, p0, Ld7l;->b:Lb7l;

    invoke-virtual {v5, v0}, Luy3;->w(Lb7l;)V

    iget-object v0, p0, Ld7l;->f:Lwci;

    iget-object v1, v5, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iput-object v0, v1, Lcom/opera/android/browser/chromium/ChromiumContent;->p:Lcom/opera/android/browser/dialog/DialogDelegate;

    iget-object v0, p0, Ld7l;->a:Lz4k;

    iput-object v0, v5, Luy3;->c:Lz4k;

    const/4 v0, 0x1

    if-eqz p1, :cond_a7

    iget-object p1, p0, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->isActive()Z

    move-result p1

    if-eqz p1, :cond_a7

    invoke-virtual {v5, v0}, Luy3;->W(Z)V

    :cond_a7
    iput-object v5, p0, Ld7l;->j:Le7l;

    iput-boolean v0, p0, Ld7l;->k:Z

    return-void
.end method

.method public final s(Lcom/opera/android/browser/TabInfo;)Z
    .registers 2

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0, p1}, Lb9l;->s(Lcom/opera/android/browser/TabInfo;)Z

    move-result p0

    return p0
.end method

.method public final s0(La2l;)V
    .registers 2

    iget-object p0, p0, Ld7l;->g:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final setAudioMuted(Z)V
    .registers 3

    iget-boolean v0, p0, Ld7l;->k:Z

    if-nez v0, :cond_8

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ld7l;->r0(Z)V

    :cond_8
    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0, p1}, Lb9l;->setAudioMuted(Z)V

    return-void
.end method

.method public final show()V
    .registers 1

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->show()V

    return-void
.end method

.method public final t()Lesk;
    .registers 3

    iget-object v0, p0, Ld7l;->e:Lw6j;

    invoke-virtual {v0}, Lw6j;->h()Lknf;

    move-result-object v0

    if-eqz v0, :cond_13

    invoke-interface {v0}, Lknf;->n()Ljava/lang/String;

    move-result-object p0

    new-instance v0, Lsy3;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lsy3;-><init>(Ljava/lang/String;B)V

    return-object v0

    :cond_13
    new-instance v0, Lb59;

    invoke-direct {v0, p0}, Lb59;-><init>(Ld7l;)V

    return-object v0
.end method

.method public final u()V
    .registers 1

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->u()V

    return-void
.end method

.method public final v()Z
    .registers 2

    iget-object v0, p0, Ld7l;->e:Lw6j;

    iget-object v0, v0, Lw6j;->d:Ljava/lang/Object;

    check-cast v0, Lknf;

    if-eqz v0, :cond_d

    invoke-interface {v0}, Lknf;->w()Z

    move-result p0

    return p0

    :cond_d
    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->v()Z

    move-result p0

    return p0
.end method

.method public final x(Landroid/net/Uri;Lcom/opera/api/Callback;)Z
    .registers 3

    const/4 p0, 0x0

    throw p0
.end method

.method public final y()Lt59;
    .registers 1

    const/4 p0, 0x0

    throw p0
.end method

.method public final z()Z
    .registers 1

    const/4 p0, 0x0

    throw p0
.end method
