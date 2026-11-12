.class public final Lrg5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmej;
.implements Lsni;


# instance fields
.field public final a:Ldx3;

.field public final b:Lh7f;

.field public final c:Ltni;

.field public d:Lhjm;

.field public e:Lch5;

.field public f:Z

.field public g:Lsni;

.field public final h:Lt0g;

.field public final i:Lqg5;

.field public final j:Lqdc;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lq9n;->p(Landroid/content/Context;)Ldx3;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_36

    iput-object p1, p0, Lrg5;->a:Ldx3;

    new-instance v1, Lh7f;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lrg5;->b:Lh7f;

    iget-object p1, p1, Ldx3;->l:Ltni;

    iput-object p1, p0, Lrg5;->c:Ltni;

    sget-object p1, Lhjm;->b:Lhjm;

    iput-object p1, p0, Lrg5;->d:Lhjm;

    invoke-static {v0}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object p1

    iput-object p1, p0, Lrg5;->h:Lt0g;

    new-instance p1, Lqg5;

    invoke-direct {p1, p0}, Lqg5;-><init>(Lrg5;)V

    iput-object p1, p0, Lrg5;->i:Lqg5;

    new-instance p1, Lqdc;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Lqdc;-><init>(Lndc;Z)V

    sget-object v0, Lqcc;->c:Lqcc;

    invoke-virtual {p1, v0}, Lqdc;->g(Lqcc;)V

    iput-object p1, p0, Lrg5;->j:Lqdc;

    return-void

    :cond_36
    const-string p0, "ComposeSheetHost requires a BrowserBaseActivity context"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public final Q(Lhjm;)V
    .registers 3

    iget-boolean v0, p0, Lrg5;->f:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    iput-object p1, p0, Lrg5;->d:Lhjm;

    iget-object p0, p0, Lrg5;->h:Lt0g;

    invoke-virtual {p0, p1}, Lt0g;->setValue(Ljava/lang/Object;)V

    return-void
.end method

.method public final U(Landroid/view/View;)V
    .registers 4

    iget-boolean v0, p0, Lrg5;->f:Z

    if-nez v0, :cond_24

    move-object v0, p1

    check-cast v0, Lch5;

    iput-object v0, p0, Lrg5;->e:Lch5;

    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    iget-object v1, p0, Lrg5;->a:Ldx3;

    invoke-virtual {v1, p1, v0}, Lfp1;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lrg5;->f:Z

    iget-object p1, p0, Lrg5;->j:Lqdc;

    sget-object v0, Lqcc;->e:Lqcc;

    invoke-virtual {p1, v0}, Lqdc;->g(Lqcc;)V

    iget-object p1, p0, Lrg5;->c:Ltni;

    invoke-virtual {p1, p0}, Ltni;->a(Lsni;)V

    return-void

    :cond_24
    const-string p0, "ComposeSheetHost.show called twice"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-void
.end method

.method public final Y(Z)V
    .registers 2

    iget-object p0, p0, Lrg5;->g:Lsni;

    if-eqz p0, :cond_7

    invoke-interface {p0, p1}, Lsni;->Y(Z)V

    :cond_7
    return-void
.end method

.method public final getContext()Landroid/content/Context;
    .registers 1

    iget-object p0, p0, Lrg5;->a:Ldx3;

    return-object p0
.end method

.method public final getLifecycle()Ltcc;
    .registers 1

    iget-object p0, p0, Lrg5;->j:Lqdc;

    return-object p0
.end method

.method public final i(Ly6f;)V
    .registers 2

    iget-object p0, p0, Lrg5;->b:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final x(Lsni;)V
    .registers 2

    iput-object p1, p0, Lrg5;->g:Lsni;

    return-void
.end method
