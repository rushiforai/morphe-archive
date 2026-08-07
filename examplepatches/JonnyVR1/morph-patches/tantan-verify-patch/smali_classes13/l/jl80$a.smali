.class public Ll/jl80$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/jl80;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public A:Landroid/content/DialogInterface$OnDismissListener;

.field public B:Landroid/content/DialogInterface$OnCancelListener;

.field public C:Landroid/graphics/drawable/Drawable;

.field public D:I

.field public E:I

.field public F:I

.field public G:Landroid/text/method/MovementMethod;

.field public H:Z

.field public I:Z

.field public final a:Landroid/content/Context;

.field public b:I
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation
.end field

.field public c:Ljava/lang/CharSequence;

.field public d:Ljava/lang/CharSequence;

.field public e:Ljava/lang/CharSequence;

.field public f:I

.field public g:Ljava/lang/CharSequence;

.field public h:I
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation
.end field

.field public i:I
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation
.end field

.field public j:Ljava/lang/CharSequence;

.field public k:Ljava/lang/CharSequence;

.field public l:Ljava/lang/Runnable;

.field public m:Ljava/lang/Runnable;

.field public n:Ljava/lang/Runnable;

.field public o:Ljava/lang/Runnable;

.field public p:Z

.field public q:Ljava/lang/CharSequence;

.field public r:I

.field public s:Ljava/lang/Runnable;

.field public t:I

.field public u:Ljava/lang/CharSequence;

.field public v:Landroid/view/View;

.field public w:Ll/cf60;

.field public x:Z

.field public y:Z

.field public z:Landroid/content/DialogInterface$OnShowListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/jl80$a;->b:I

    .line 6
    .line 7
    const/16 v1, 0x11

    .line 8
    .line 9
    iput v1, p0, Ll/jl80$a;->f:I

    .line 10
    .line 11
    iput v0, p0, Ll/jl80$a;->h:I

    .line 12
    .line 13
    iput v0, p0, Ll/jl80$a;->i:I

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    iput v1, p0, Ll/jl80$a;->r:I

    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    iput-boolean v2, p0, Ll/jl80$a;->x:Z

    .line 20
    .line 21
    iput-boolean v2, p0, Ll/jl80$a;->y:Z

    .line 22
    .line 23
    iput v0, p0, Ll/jl80$a;->E:I

    .line 24
    .line 25
    iput v0, p0, Ll/jl80$a;->F:I

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    iput-object v0, p0, Ll/jl80$a;->G:Landroid/text/method/MovementMethod;

    .line 29
    .line 30
    iput-boolean v1, p0, Ll/jl80$a;->H:Z

    .line 31
    .line 32
    iput-boolean v1, p0, Ll/jl80$a;->I:Z

    .line 33
    .line 34
    iput-object p1, p0, Ll/jl80$a;->a:Landroid/content/Context;

    .line 35
    .line 36
    sget v0, Ll/abc0;->x:I

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, p0, Ll/jl80$a;->C:Landroid/graphics/drawable/Drawable;

    .line 43
    .line 44
    return-void
.end method

.method public static bridge synthetic A(Ll/jl80$a;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jl80$a;->k:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public static bridge synthetic B(Ll/jl80$a;)Landroid/content/DialogInterface$OnShowListener;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jl80$a;->z:Landroid/content/DialogInterface$OnShowListener;

    return-object p0
.end method

.method public static bridge synthetic C(Ll/jl80$a;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jl80$a;->d:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public static bridge synthetic D(Ll/jl80$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/jl80$a;->f:I

    return p0
.end method

.method public static bridge synthetic E(Ll/jl80$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/jl80$a;->F:I

    return p0
.end method

.method public static bridge synthetic F(Ll/jl80$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/jl80$a;->E:I

    return p0
.end method

.method public static bridge synthetic G(Ll/jl80$a;)Landroid/text/method/MovementMethod;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jl80$a;->G:Landroid/text/method/MovementMethod;

    return-object p0
.end method

.method public static bridge synthetic H(Ll/jl80$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/jl80$a;->D:I

    return p0
.end method

.method public static bridge synthetic I(Ll/jl80$a;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jl80$a;->c:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public static bridge synthetic J(Ll/jl80$a;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jl80$a;->s:Ljava/lang/Runnable;

    return-void
.end method

.method public static bridge synthetic K(Ll/jl80$a;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jl80$a;->l:Ljava/lang/Runnable;

    return-void
.end method

.method public static bridge synthetic L(Ll/jl80$a;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jl80$a;->n:Ljava/lang/Runnable;

    return-void
.end method

.method public static bridge synthetic a(Ll/jl80$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/jl80$a;->y:Z

    return p0
.end method

.method public static bridge synthetic b(Ll/jl80$a;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jl80$a;->C:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method public static bridge synthetic c(Ll/jl80$a;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jl80$a;->u:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/jl80$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/jl80$a;->t:I

    return p0
.end method

.method public static bridge synthetic e(Ll/jl80$a;)Landroid/content/DialogInterface$OnCancelListener;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jl80$a;->B:Landroid/content/DialogInterface$OnCancelListener;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/jl80$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/jl80$a;->x:Z

    return p0
.end method

.method public static bridge synthetic g(Ll/jl80$a;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jl80$a;->e:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public static bridge synthetic h(Ll/jl80$a;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jl80$a;->a:Landroid/content/Context;

    return-object p0
.end method

.method public static bridge synthetic i(Ll/jl80$a;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jl80$a;->v:Landroid/view/View;

    return-object p0
.end method

.method public static bridge synthetic j(Ll/jl80$a;)Landroid/content/DialogInterface$OnDismissListener;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jl80$a;->A:Landroid/content/DialogInterface$OnDismissListener;

    return-object p0
.end method

.method public static bridge synthetic k(Ll/jl80$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/jl80$a;->b:I

    return p0
.end method

.method public static bridge synthetic l(Ll/jl80$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/jl80$a;->p:Z

    return p0
.end method

.method public static bridge synthetic m(Ll/jl80$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/jl80$a;->I:Z

    return p0
.end method

.method public static bridge synthetic n(Ll/jl80$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/jl80$a;->H:Z

    return p0
.end method

.method public static bridge synthetic o(Ll/jl80$a;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jl80$a;->q:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public static bridge synthetic p(Ll/jl80$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/jl80$a;->r:I

    return p0
.end method

.method public static bridge synthetic q(Ll/jl80$a;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jl80$a;->o:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic r(Ll/jl80$a;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jl80$a;->s:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic s(Ll/jl80$a;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jl80$a;->l:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic t(Ll/jl80$a;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jl80$a;->m:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic u(Ll/jl80$a;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jl80$a;->n:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic v(Ll/jl80$a;)Ll/cf60;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jl80$a;->w:Ll/cf60;

    return-object p0
.end method

.method public static bridge synthetic w(Ll/jl80$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/jl80$a;->h:I

    return p0
.end method

.method public static bridge synthetic x(Ll/jl80$a;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jl80$a;->g:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public static bridge synthetic y(Ll/jl80$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/jl80$a;->i:I

    return p0
.end method

.method public static bridge synthetic z(Ll/jl80$a;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jl80$a;->j:Ljava/lang/CharSequence;

    return-object p0
.end method


# virtual methods
.method public M(Z)Ll/jl80$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/jl80$a;->y:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public N(Landroid/graphics/drawable/Drawable;)Ll/jl80$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jl80$a;->C:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public O()Ll/jl80;
    .locals 1

    .line 1
    new-instance v0, Ll/jl80;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/jl80;-><init>(Ll/jl80$a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public P(Z)Ll/jl80$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/jl80$a;->x:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public Q(I)Ll/jl80$a;
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/LayoutRes;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/jl80$a;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public R(Landroid/view/View;)Ll/jl80$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jl80$a;->v:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public S(I)Ll/jl80$a;
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iput p1, p0, Ll/jl80$a;->b:I

    .line 2
    .line 3
    return-object p0
.end method

.method public T(Z)Ll/jl80$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/jl80$a;->H:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public U(ILjava/lang/Runnable;)Ll/jl80$a;
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/jl80$a;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1, p2}, Ll/jl80$a;->X(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public varargs V(I[Ljava/lang/Object;)Ll/jl80$a;
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/jl80$a;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p2, p0, Ll/jl80$a;->s:Ljava/lang/Runnable;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Ll/jl80$a;->X(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public W(Ljava/lang/CharSequence;)Ll/jl80$a;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jl80$a;->s:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Ll/jl80$a;->X(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public X(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jl80$a;->q:Ljava/lang/CharSequence;

    .line 2
    .line 3
    iput-object p2, p0, Ll/jl80$a;->s:Ljava/lang/Runnable;

    .line 4
    .line 5
    return-object p0
.end method

.method public Y(I)Ll/jl80$a;
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iput p1, p0, Ll/jl80$a;->r:I

    .line 2
    .line 3
    return-object p0
.end method

.method public Z(I)Ll/jl80$a;
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/jl80$a;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Ll/jl80$a;->l:Ljava/lang/Runnable;

    .line 8
    .line 9
    invoke-virtual {p0, p1, v0}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public a0(ILjava/lang/Runnable;)Ll/jl80$a;
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/jl80$a;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1, p2}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public b0(Ljava/lang/CharSequence;)Ll/jl80$a;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jl80$a;->l:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jl80$a;->g:Ljava/lang/CharSequence;

    .line 2
    .line 3
    iput-object p2, p0, Ll/jl80$a;->l:Ljava/lang/Runnable;

    .line 4
    .line 5
    return-object p0
.end method

.method public d0(I)Ll/jl80$a;
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iput p1, p0, Ll/jl80$a;->h:I

    .line 2
    .line 3
    return-object p0
.end method

.method public e0(Z)Ll/jl80$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/jl80$a;->p:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public f0(ILjava/lang/Runnable;)Ll/jl80$a;
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/jl80$a;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1, p2}, Ll/jl80$a;->h0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public g0(Ljava/lang/CharSequence;)Ll/jl80$a;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jl80$a;->m:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Ll/jl80$a;->h0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public h0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jl80$a;->j:Ljava/lang/CharSequence;

    .line 2
    .line 3
    iput-object p2, p0, Ll/jl80$a;->m:Ljava/lang/Runnable;

    .line 4
    .line 5
    return-object p0
.end method

.method public i0(I)Ll/jl80$a;
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iput p1, p0, Ll/jl80$a;->i:I

    .line 2
    .line 3
    return-object p0
.end method

.method public j0(Ljava/lang/CharSequence;)Ll/jl80$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jl80$a;->k:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public k0(Ljava/lang/CharSequence;)Ll/jl80$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jl80$a;->e:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public l0(Landroid/content/DialogInterface$OnCancelListener;)Ll/jl80$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jl80$a;->B:Landroid/content/DialogInterface$OnCancelListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public m0(Ljava/lang/Runnable;)Ll/jl80$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jl80$a;->o:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method public n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jl80$a;->A:Landroid/content/DialogInterface$OnDismissListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public o0(Landroid/content/DialogInterface$OnShowListener;)Ll/jl80$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jl80$a;->z:Landroid/content/DialogInterface$OnShowListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public p0(Z)Ll/jl80$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/jl80$a;->I:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public q0(I)Ll/jl80$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/jl80$a;->f:I

    .line 2
    .line 3
    return-object p0
.end method

.method public r0()Ll/jl80;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jl80$a;->O()Ll/jl80;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/jl80;->show()V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method public varargs s0(I[Ljava/lang/Object;)Ll/jl80$a;
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/jl80$a;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public t0(Ljava/lang/CharSequence;)Ll/jl80$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jl80$a;->d:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public u0(II)Ll/jl80$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/jl80$a;->E:I

    .line 2
    .line 3
    iput p2, p0, Ll/jl80$a;->F:I

    .line 4
    .line 5
    return-object p0
.end method

.method public v0(Landroid/text/method/MovementMethod;)Ll/jl80$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jl80$a;->G:Landroid/text/method/MovementMethod;

    .line 2
    .line 3
    return-object p0
.end method

.method public w0(I)Ll/jl80$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/jl80$a;->D:I

    .line 2
    .line 3
    return-object p0
.end method

.method public varargs x0(I[Ljava/lang/Object;)Ll/jl80$a;
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/jl80$a;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public y0(Ljava/lang/CharSequence;)Ll/jl80$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jl80$a;->c:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method
