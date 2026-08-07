.class public Ll/u5d0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/u5d0$a;
    }
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Z

.field public i:I

.field public j:Landroid/view/View;

.field public k:Ljava/lang/String;

.field public l:Ljava/lang/Runnable;

.field public m:Ljava/lang/String;

.field public n:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/u5d0;->j:Landroid/view/View;

    .line 6
    .line 7
    iput-object v0, p0, Ll/u5d0;->l:Ljava/lang/Runnable;

    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic a(Ll/u5d0;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u5d0;->l:Ljava/lang/Runnable;

    return-void
.end method

.method public static bridge synthetic b(Ll/u5d0;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u5d0;->k:Ljava/lang/String;

    return-void
.end method

.method public static bridge synthetic c(Ll/u5d0;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/u5d0;->c:I

    return-void
.end method

.method public static bridge synthetic d(Ll/u5d0;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u5d0;->m:Ljava/lang/String;

    return-void
.end method

.method public static bridge synthetic e(Ll/u5d0;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/u5d0;->i:I

    return-void
.end method

.method public static bridge synthetic f(Ll/u5d0;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u5d0;->n:Ljava/lang/String;

    return-void
.end method

.method public static bridge synthetic g(Ll/u5d0;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/u5d0;->h:Z

    return-void
.end method

.method public static bridge synthetic h(Ll/u5d0;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u5d0;->g:Ljava/lang/String;

    return-void
.end method

.method public static bridge synthetic i(Ll/u5d0;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u5d0;->f:Ljava/lang/String;

    return-void
.end method

.method public static bridge synthetic j(Ll/u5d0;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/u5d0;->d:I

    return-void
.end method

.method public static bridge synthetic k(Ll/u5d0;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u5d0;->e:Ljava/lang/String;

    return-void
.end method

.method public static bridge synthetic l(Ll/u5d0;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/u5d0;->b:I

    return-void
.end method

.method public static bridge synthetic m(Ll/u5d0;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/u5d0;->a:I

    return-void
.end method


# virtual methods
.method public n()Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u5d0;->l:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method public o()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u5d0;->k:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public p()I
    .locals 0

    .line 1
    iget p0, p0, Ll/u5d0;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public q()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u5d0;->m:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public r(Landroid/content/Context;)Landroid/view/View;
    .locals 2

    .line 1
    iget v0, p0, Ll/u5d0;->i:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-gtz v0, :cond_0

    .line 5
    .line 6
    return-object v1

    .line 7
    :cond_0
    iget-object v0, p0, Ll/u5d0;->j:Landroid/view/View;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget v0, p0, Ll/u5d0;->i:I

    .line 17
    .line 18
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Ll/u5d0;->j:Landroid/view/View;

    .line 23
    .line 24
    return-object p1
.end method

.method public s()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u5d0;->n:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public t()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u5d0;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public u()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u5d0;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public v()I
    .locals 0

    .line 1
    iget p0, p0, Ll/u5d0;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public w()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u5d0;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public x()I
    .locals 0

    .line 1
    iget p0, p0, Ll/u5d0;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public y()I
    .locals 0

    .line 1
    iget p0, p0, Ll/u5d0;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public z()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/u5d0;->h:Z

    .line 2
    .line 3
    return p0
.end method
