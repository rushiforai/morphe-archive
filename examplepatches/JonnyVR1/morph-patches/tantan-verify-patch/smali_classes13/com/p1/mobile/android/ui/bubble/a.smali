.class public Lcom/p1/mobile/android/ui/bubble/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/f3m;
.implements Ll/d3m;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/android/ui/bubble/a$a;,
        Lcom/p1/mobile/android/ui/bubble/a$b;,
        Lcom/p1/mobile/android/ui/bubble/a$c;,
        Lcom/p1/mobile/android/ui/bubble/a$d;
    }
.end annotation


# static fields
.field public static N:I = 0x1

.field public static O:I = 0x10

.field public static P:I = 0x100

.field public static Q:I = 0x1000

.field public static R:I = 0x100000


# instance fields
.field public A:Z

.field public B:I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field

.field public C:I

.field public D:Z

.field public E:Z

.field public F:Ljava/lang/Integer;

.field public G:Lcom/p1/mobile/android/ui/bubble/a$a;

.field public H:I

.field public I:I

.field public J:Z

.field public K:Ll/z2m;

.field public L:Ljava/lang/String;

.field public M:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public a:[I

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:J

.field public k:Lcom/p1/mobile/android/ui/bubble/a$b;

.field public l:Lcom/p1/mobile/android/ui/bubble/a$c;

.field public m:Lcom/p1/mobile/android/ui/bubble/a$d;

.field public n:Z

.field public o:Z

.field public p:I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field

.field public q:Ljava/lang/String;

.field public r:Ljava/lang/CharSequence;

.field public s:F

.field public t:I

.field public u:Ljava/lang/Integer;

.field public v:I

.field public w:Landroid/view/View;

.field public x:Z

.field public y:Landroid/view/View;

.field public z:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/android/ui/bubble/a;->v:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-boolean v1, p0, Lcom/p1/mobile/android/ui/bubble/a;->D:Z

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    iput-object v2, p0, Lcom/p1/mobile/android/ui/bubble/a;->L:Ljava/lang/String;

    .line 12
    .line 13
    sget v2, Lcom/p1/mobile/android/ui/bubble/a;->N:I

    .line 14
    .line 15
    sget v3, Lcom/p1/mobile/android/ui/bubble/a;->R:I

    .line 16
    .line 17
    or-int/2addr v2, v3

    .line 18
    iput v2, p0, Lcom/p1/mobile/android/ui/bubble/a;->b:I

    .line 19
    .line 20
    const/high16 v2, 0x40e00000    # 7.0f

    .line 21
    .line 22
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    iput v2, p0, Lcom/p1/mobile/android/ui/bubble/a;->g:I

    .line 27
    .line 28
    sget v2, Ll/qa00;->i:I

    .line 29
    .line 30
    iput v2, p0, Lcom/p1/mobile/android/ui/bubble/a;->i:I

    .line 31
    .line 32
    iput v1, p0, Lcom/p1/mobile/android/ui/bubble/a;->e:I

    .line 33
    .line 34
    iput v1, p0, Lcom/p1/mobile/android/ui/bubble/a;->f:I

    .line 35
    .line 36
    const/16 v2, 0x4b

    .line 37
    .line 38
    iput v2, p0, Lcom/p1/mobile/android/ui/bubble/a;->h:I

    .line 39
    .line 40
    const-wide/16 v2, -0x1

    .line 41
    .line 42
    iput-wide v2, p0, Lcom/p1/mobile/android/ui/bubble/a;->j:J

    .line 43
    .line 44
    iput-boolean v1, p0, Lcom/p1/mobile/android/ui/bubble/a;->n:Z

    .line 45
    .line 46
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    sget v3, Ll/z8c0;->t:I

    .line 51
    .line 52
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    filled-new-array {v2}, [I

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    iput-object v2, p0, Lcom/p1/mobile/android/ui/bubble/a;->a:[I

    .line 61
    .line 62
    const/high16 v2, 0x41800000    # 16.0f

    .line 63
    .line 64
    iput v2, p0, Lcom/p1/mobile/android/ui/bubble/a;->s:F

    .line 65
    .line 66
    iput-boolean v1, p0, Lcom/p1/mobile/android/ui/bubble/a;->o:Z

    .line 67
    .line 68
    iput v0, p0, Lcom/p1/mobile/android/ui/bubble/a;->p:I

    .line 69
    .line 70
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    sget v0, Ll/z8c0;->k:I

    .line 75
    .line 76
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    iput p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->B:I

    .line 81
    .line 82
    const/4 p1, 0x1

    .line 83
    iput-boolean p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->x:Z

    .line 84
    .line 85
    return-void
.end method


# virtual methods
.method public A(Landroid/view/View;)Lcom/p1/mobile/android/ui/bubble/a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->y:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public B(I)Lcom/p1/mobile/android/ui/bubble/a;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->e:I

    .line 2
    .line 3
    return-object p0
.end method

.method public C(I)Lcom/p1/mobile/android/ui/bubble/a;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->C:I

    .line 2
    .line 3
    return-object p0
.end method

.method public D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->r:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public E(Z)Lcom/p1/mobile/android/ui/bubble/a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->o:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public F(Z)Lcom/p1/mobile/android/ui/bubble/a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->J:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public G(I)Lcom/p1/mobile/android/ui/bubble/a;
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/ColorRes;
        .end annotation
    .end param

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->p:I

    .line 12
    .line 13
    return-object p0
.end method

.method public H(IIII)Lcom/p1/mobile/android/ui/bubble/a;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/a$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/android/ui/bubble/a$a;-><init>(Lcom/p1/mobile/android/ui/bubble/a;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/android/ui/bubble/a;->G:Lcom/p1/mobile/android/ui/bubble/a$a;

    .line 7
    .line 8
    iput p1, v0, Lcom/p1/mobile/android/ui/bubble/a$a;->a:I

    .line 9
    .line 10
    iput p2, v0, Lcom/p1/mobile/android/ui/bubble/a$a;->b:I

    .line 11
    .line 12
    iput p3, v0, Lcom/p1/mobile/android/ui/bubble/a$a;->c:I

    .line 13
    .line 14
    iput p4, v0, Lcom/p1/mobile/android/ui/bubble/a$a;->d:I

    .line 15
    .line 16
    return-object p0
.end method

.method public I(I)Lcom/p1/mobile/android/ui/bubble/a;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->t:I

    .line 2
    .line 3
    return-object p0
.end method

.method public J(F)Lcom/p1/mobile/android/ui/bubble/a;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->s:F

    .line 2
    .line 3
    return-object p0
.end method

.method public K(I)Lcom/p1/mobile/android/ui/bubble/a;
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->F:Ljava/lang/Integer;

    .line 6
    .line 7
    return-object p0
.end method

.method public L(I)Lcom/p1/mobile/android/ui/bubble/a;
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/ColorRes;
        .end annotation
    .end param

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->B:I

    .line 12
    .line 13
    return-object p0
.end method

.method public M(Z)Lcom/p1/mobile/android/ui/bubble/a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->z:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public N(Lcom/p1/mobile/android/ui/bubble/a$d;)Lcom/p1/mobile/android/ui/bubble/a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->m:Lcom/p1/mobile/android/ui/bubble/a$d;

    .line 2
    .line 3
    return-object p0
.end method

.method public a()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/bubble/a;->M:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lcom/p1/mobile/android/ui/bubble/a;->M:Ljava/lang/ref/WeakReference;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Landroid/view/View;

    .line 22
    .line 23
    iget-object v2, p0, Lcom/p1/mobile/android/ui/bubble/a;->L:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, p0, v1, v2}, Lcom/p1/mobile/android/ui/bubble/d;->s(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    return p0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    return p0
.end method

.method public b(J)Lcom/p1/mobile/android/ui/bubble/a;
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-gtz v0, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iput-wide p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->j:J

    .line 9
    .line 10
    return-object p0
.end method

.method public c(Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->L:Ljava/lang/String;

    .line 2
    .line 3
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 4
    .line 5
    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->M:Ljava/lang/ref/WeakReference;

    .line 9
    .line 10
    return-void
.end method

.method public d(Lcom/p1/mobile/android/ui/bubble/a$b;)Lcom/p1/mobile/android/ui/bubble/a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->k:Lcom/p1/mobile/android/ui/bubble/a$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Z)Lcom/p1/mobile/android/ui/bubble/a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->n:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Z)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/android/ui/bubble/a;->L:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public g(Ll/al80;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Ll/al80;->f()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public h(Ll/al80;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/al80;->g()Ll/f3m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of p0, p0, Lcom/p1/mobile/android/ui/bubble/a;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/al80;->i()Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1}, Ll/al80;->g()Ll/f3m;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lcom/p1/mobile/android/ui/bubble/a;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/al80;->i()Ljava/lang/ref/WeakReference;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Landroid/view/View;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/al80;->f()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0, v0, v1, p1}, Lcom/p1/mobile/android/ui/bubble/d;->s(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    const/4 p0, 0x1

    .line 43
    return p0

    .line 44
    :cond_0
    const/4 p0, 0x0

    .line 45
    return p0
.end method

.method public i(Ll/z2m;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->K:Ll/z2m;

    .line 2
    .line 3
    return-void
.end method

.method public j(Lcom/p1/mobile/android/ui/bubble/a$c;)Lcom/p1/mobile/android/ui/bubble/a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->l:Lcom/p1/mobile/android/ui/bubble/a$c;

    .line 2
    .line 3
    return-object p0
.end method

.method public varargs k([I)Lcom/p1/mobile/android/ui/bubble/a;
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    array-length v0, p1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->a:[I

    .line 8
    .line 9
    :cond_1
    :goto_0
    return-object p0
.end method

.method public l(I)Lcom/p1/mobile/android/ui/bubble/a;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->g:I

    .line 2
    .line 3
    return-object p0
.end method

.method public n(Z)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/android/ui/bubble/a;->L:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public o(II)Lcom/p1/mobile/android/ui/bubble/a;
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/android/ui/bubble/a;->O:I

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    sget v0, Lcom/p1/mobile/android/ui/bubble/a;->P:I

    .line 6
    .line 7
    if-ne p1, v0, :cond_1

    .line 8
    .line 9
    :cond_0
    if-gtz p2, :cond_2

    .line 10
    .line 11
    :cond_1
    return-object p0

    .line 12
    :cond_2
    iget v0, p0, Lcom/p1/mobile/android/ui/bubble/a;->b:I

    .line 13
    .line 14
    or-int/2addr p1, v0

    .line 15
    iput p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->b:I

    .line 16
    .line 17
    iput p2, p0, Lcom/p1/mobile/android/ui/bubble/a;->v:I

    .line 18
    .line 19
    return-object p0
.end method

.method public p(I)Lcom/p1/mobile/android/ui/bubble/a;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->h:I

    .line 2
    .line 3
    return-object p0
.end method

.method public q(I)Lcom/p1/mobile/android/ui/bubble/a;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->b:I

    .line 2
    .line 3
    return-object p0
.end method

.method public r(Ljava/lang/String;)Lcom/p1/mobile/android/ui/bubble/a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->q:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public s(Landroid/view/View;)Lcom/p1/mobile/android/ui/bubble/a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->w:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public t(Z)Lcom/p1/mobile/android/ui/bubble/a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->x:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public u(I)Lcom/p1/mobile/android/ui/bubble/a;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->c:I

    .line 2
    .line 3
    return-object p0
.end method

.method public v(I)Lcom/p1/mobile/android/ui/bubble/a;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->H:I

    .line 2
    .line 3
    return-object p0
.end method

.method public w(I)Lcom/p1/mobile/android/ui/bubble/a;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->I:I

    .line 2
    .line 3
    return-object p0
.end method

.method public x(I)Lcom/p1/mobile/android/ui/bubble/a;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->d:I

    .line 2
    .line 3
    return-object p0
.end method

.method public y(Z)Lcom/p1/mobile/android/ui/bubble/a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->A:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public z(I)Lcom/p1/mobile/android/ui/bubble/a;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/ui/bubble/a;->i:I

    .line 2
    .line 3
    return-object p0
.end method
