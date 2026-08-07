.class public Ll/w30$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/w30;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public A:Landroid/view/View$OnClickListener;

.field public B:Landroid/view/View$OnClickListener;

.field public C:Ll/w30$d;

.field public D:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lv/VListCell$a;",
            ">;"
        }
    .end annotation
.end field

.field public E:Landroid/content/Context;

.field public a:Ljava/lang/CharSequence;

.field public b:Ljava/lang/CharSequence;

.field public c:Ljava/lang/CharSequence;

.field public d:Ljava/lang/CharSequence;

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:Landroid/graphics/Typeface;

.field public j:Landroid/graphics/Typeface;

.field public k:Landroid/graphics/Typeface;

.field public l:Landroid/graphics/Typeface;

.field public m:I

.field public n:I

.field public o:Landroid/graphics/Typeface;

.field public p:Landroid/graphics/Typeface;

.field public q:I

.field public r:Z

.field public s:Z

.field public t:[I

.field public u:[I

.field public v:[I

.field public w:[I

.field public x:Landroid/content/DialogInterface$OnCancelListener;

.field public y:Landroid/content/DialogInterface$OnShowListener;

.field public z:Landroid/content/DialogInterface$OnDismissListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7fffffff

    .line 5
    .line 6
    .line 7
    iput v0, p0, Ll/w30$b;->e:I

    .line 8
    .line 9
    iput v0, p0, Ll/w30$b;->f:I

    .line 10
    .line 11
    iput v0, p0, Ll/w30$b;->g:I

    .line 12
    .line 13
    iput v0, p0, Ll/w30$b;->h:I

    .line 14
    .line 15
    iput v0, p0, Ll/w30$b;->m:I

    .line 16
    .line 17
    iput v0, p0, Ll/w30$b;->n:I

    .line 18
    .line 19
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 20
    .line 21
    iput-object v0, p0, Ll/w30$b;->o:Landroid/graphics/Typeface;

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Ll/w30$b;->r:Z

    .line 25
    .line 26
    iput-boolean v0, p0, Ll/w30$b;->s:Z

    .line 27
    .line 28
    iput-object p1, p0, Ll/w30$b;->E:Landroid/content/Context;

    .line 29
    .line 30
    return-void
.end method

.method public static bridge synthetic A(Ll/w30$b;)Landroid/view/View$OnClickListener;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w30$b;->A:Landroid/view/View$OnClickListener;

    return-object p0
.end method

.method public static bridge synthetic B(Ll/w30$b;)Ll/w30$d;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w30$b;->C:Ll/w30$d;

    return-object p0
.end method

.method public static bridge synthetic C(Ll/w30$b;)Landroid/content/DialogInterface$OnShowListener;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w30$b;->y:Landroid/content/DialogInterface$OnShowListener;

    return-object p0
.end method

.method public static bridge synthetic D(Ll/w30$b;)[I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w30$b;->w:[I

    return-object p0
.end method

.method public static bridge synthetic E(Ll/w30$b;)[I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w30$b;->u:[I

    return-object p0
.end method

.method public static bridge synthetic a(Ll/w30$b;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/w30$b;->r:Z

    return p0
.end method

.method public static bridge synthetic b(Ll/w30$b;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/w30$b;->s:Z

    return p0
.end method

.method public static bridge synthetic c(Ll/w30$b;)[I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w30$b;->v:[I

    return-object p0
.end method

.method public static bridge synthetic d(Ll/w30$b;)[I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w30$b;->t:[I

    return-object p0
.end method

.method public static bridge synthetic e(Ll/w30$b;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w30$b;->D:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/w30$b;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w30$b;->E:Landroid/content/Context;

    return-object p0
.end method

.method public static bridge synthetic g(Ll/w30$b;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w30$b;->d:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public static bridge synthetic h(Ll/w30$b;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/w30$b;->h:I

    return p0
.end method

.method public static bridge synthetic i(Ll/w30$b;)Landroid/graphics/Typeface;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w30$b;->l:Landroid/graphics/Typeface;

    return-object p0
.end method

.method public static bridge synthetic j(Ll/w30$b;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w30$b;->c:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public static bridge synthetic k(Ll/w30$b;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/w30$b;->g:I

    return p0
.end method

.method public static bridge synthetic l(Ll/w30$b;)Landroid/graphics/Typeface;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w30$b;->k:Landroid/graphics/Typeface;

    return-object p0
.end method

.method public static bridge synthetic m(Ll/w30$b;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w30$b;->b:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public static bridge synthetic n(Ll/w30$b;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/w30$b;->f:I

    return p0
.end method

.method public static bridge synthetic o(Ll/w30$b;)Landroid/graphics/Typeface;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w30$b;->j:Landroid/graphics/Typeface;

    return-object p0
.end method

.method public static bridge synthetic p(Ll/w30$b;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w30$b;->a:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public static bridge synthetic q(Ll/w30$b;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/w30$b;->e:I

    return p0
.end method

.method public static bridge synthetic r(Ll/w30$b;)Landroid/graphics/Typeface;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w30$b;->i:Landroid/graphics/Typeface;

    return-object p0
.end method

.method public static bridge synthetic s(Ll/w30$b;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/w30$b;->q:I

    return p0
.end method

.method public static bridge synthetic t(Ll/w30$b;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/w30$b;->n:I

    return p0
.end method

.method public static bridge synthetic u(Ll/w30$b;)Landroid/graphics/Typeface;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w30$b;->p:Landroid/graphics/Typeface;

    return-object p0
.end method

.method public static bridge synthetic v(Ll/w30$b;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/w30$b;->m:I

    return p0
.end method

.method public static bridge synthetic w(Ll/w30$b;)Landroid/graphics/Typeface;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w30$b;->o:Landroid/graphics/Typeface;

    return-object p0
.end method

.method public static bridge synthetic x(Ll/w30$b;)Landroid/content/DialogInterface$OnCancelListener;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w30$b;->x:Landroid/content/DialogInterface$OnCancelListener;

    return-object p0
.end method

.method public static bridge synthetic y(Ll/w30$b;)Landroid/content/DialogInterface$OnDismissListener;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w30$b;->z:Landroid/content/DialogInterface$OnDismissListener;

    return-object p0
.end method

.method public static bridge synthetic z(Ll/w30$b;)Landroid/view/View$OnClickListener;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w30$b;->B:Landroid/view/View$OnClickListener;

    return-object p0
.end method


# virtual methods
.method public F()Ll/w30;
    .locals 2

    .line 1
    new-instance v0, Ll/w30;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/w30;-><init>(Ll/w30$b;Ll/x30;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public G(Z)Ll/w30$b;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/w30$b;->s:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public H(I)Ll/w30$b;
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/w30$b;->E:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Ll/w30$b;->c:Ljava/lang/CharSequence;

    .line 8
    .line 9
    return-object p0
.end method

.method public I(Ljava/lang/CharSequence;)Ll/w30$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w30$b;->c:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public J(I)Ll/w30$b;
    .locals 0

    .line 1
    iput p1, p0, Ll/w30$b;->g:I

    .line 2
    .line 3
    return-object p0
.end method

.method public K(I)Ll/w30$b;
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/w30$b;->E:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Ll/w30$b;->b:Ljava/lang/CharSequence;

    .line 8
    .line 9
    return-object p0
.end method

.method public L(Ljava/lang/CharSequence;)Ll/w30$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w30$b;->b:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public M(I)Ll/w30$b;
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/w30$b;->E:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Ll/w30$b;->a:Ljava/lang/CharSequence;

    .line 8
    .line 9
    return-object p0
.end method

.method public N(Ljava/lang/CharSequence;)Ll/w30$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w30$b;->a:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public O(I)Ll/w30$b;
    .locals 0

    .line 1
    iput p1, p0, Ll/w30$b;->q:I

    .line 2
    .line 3
    return-object p0
.end method

.method public P(Landroid/graphics/Typeface;)Ll/w30$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w30$b;->o:Landroid/graphics/Typeface;

    .line 2
    .line 3
    return-object p0
.end method

.method public Q(Ljava/util/List;)Ll/w30$b;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/CharSequence;",
            ">;)",
            "Ll/w30$b;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ljava/lang/CharSequence;

    .line 21
    .line 22
    new-instance v2, Lv/VListCell$a;

    .line 23
    .line 24
    invoke-direct {v2, v1}, Lv/VListCell$a;-><init>(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iput-object v0, p0, Ll/w30$b;->D:Ljava/util/List;

    .line 32
    .line 33
    return-object p0
.end method

.method public R([I[I)Ll/w30$b;
    .locals 2

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    array-length v0, p2

    .line 6
    array-length v1, p1

    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    iput-object p2, p0, Ll/w30$b;->t:[I

    .line 10
    .line 11
    iput-object p1, p0, Ll/w30$b;->u:[I

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string p0, "header title Color And Pos must be matched!"

    .line 15
    .line 16
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public S(Landroid/content/DialogInterface$OnCancelListener;)Ll/w30$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w30$b;->x:Landroid/content/DialogInterface$OnCancelListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public T(Landroid/content/DialogInterface$OnDismissListener;)Ll/w30$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w30$b;->z:Landroid/content/DialogInterface$OnDismissListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public U(Landroid/view/View$OnClickListener;)Ll/w30$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w30$b;->B:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public V(Ll/w30$d;)Ll/w30$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w30$b;->C:Ll/w30$d;

    .line 2
    .line 3
    return-object p0
.end method

.method public W(Landroid/content/DialogInterface$OnShowListener;)Ll/w30$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w30$b;->y:Landroid/content/DialogInterface$OnShowListener;

    .line 2
    .line 3
    return-object p0
.end method
