.class public abstract Ldej;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lpim;
.implements Lndc;


# instance fields
.field public final a:Li7f;

.field public final b:Lmej;


# direct methods
.method public constructor <init>(Lmej;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Ldej;->a:Li7f;

    iput-object p1, p0, Ldej;->b:Lmej;

    new-instance v0, Lof;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lof;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p1, v0}, Lmej;->i(Ly6f;)V

    return-void
.end method


# virtual methods
.method public abstract a(Landroid/content/Context;)Landroid/view/View;
.end method

.method public final b()V
    .registers 2

    iget-object p0, p0, Ldej;->b:Lmej;

    sget-object v0, Lhjm;->a:Lhjm;

    invoke-interface {p0, v0}, Lmej;->Q(Lhjm;)V

    return-void
.end method

.method public c(Lhjm;)V
    .registers 3

    iget-object p0, p0, Ldej;->a:Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_6
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ly6f;

    invoke-interface {v0, p1}, Ly6f;->a(Lhjm;)V

    goto :goto_6

    :cond_16
    return-void
.end method

.method public final getLifecycle()Ltcc;
    .registers 1

    iget-object p0, p0, Ldej;->b:Lmej;

    invoke-interface {p0}, Lndc;->getLifecycle()Ltcc;

    move-result-object p0

    return-object p0
.end method
