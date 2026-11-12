.class public final Llji;
.super Landroid/print/a;
.source "SourceFile"


# instance fields
.field public final synthetic a:Landroid/print/PrintAttributes;

.field public final synthetic b:Lqji;


# direct methods
.method public constructor <init>(Lqji;Landroid/print/PrintAttributes;)V
    .registers 3

    invoke-direct {p0}, Landroid/print/a;-><init>()V

    iput-object p2, p0, Llji;->a:Landroid/print/PrintAttributes;

    iput-object p1, p0, Llji;->b:Lqji;

    return-void
.end method


# virtual methods
.method public final onLayoutCancelled()V
    .registers 3

    iget-object v0, p0, Llji;->b:Lqji;

    iget-object v1, v0, Lqji;->h:Llji;

    if-ne p0, v1, :cond_d

    invoke-virtual {v0}, Lqji;->a()V

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Lqji;->f(I)V

    :cond_d
    return-void
.end method

.method public final onLayoutFailed(Ljava/lang/CharSequence;)V
    .registers 3

    iget-object p1, p0, Llji;->b:Lqji;

    iget-object v0, p1, Lqji;->h:Llji;

    if-ne p0, v0, :cond_23

    const/4 p0, 0x0

    iput-object p0, p1, Lqji;->h:Llji;

    iget-object p0, p1, Lqji;->c:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_f
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1f

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnji;

    invoke-virtual {v0}, Lnji;->b()V

    goto :goto_f

    :cond_1f
    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Lqji;->f(I)V

    :cond_23
    return-void
.end method

.method public final onLayoutFinished(Landroid/print/PrintDocumentInfo;Z)V
    .registers 4

    iget-object p2, p0, Llji;->b:Lqji;

    iget-object v0, p2, Lqji;->h:Llji;

    if-ne p0, v0, :cond_17

    const/4 v0, 0x0

    iput-object v0, p2, Lqji;->h:Llji;

    iget-object p0, p0, Llji;->a:Landroid/print/PrintAttributes;

    iput-object p0, p2, Lqji;->f:Landroid/print/PrintAttributes;

    invoke-virtual {p1}, Landroid/print/PrintDocumentInfo;->getName()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p2, Lqji;->m:Ljava/lang/String;

    const/4 p0, 0x2

    invoke-virtual {p2, p0}, Lqji;->f(I)V

    :cond_17
    return-void
.end method
