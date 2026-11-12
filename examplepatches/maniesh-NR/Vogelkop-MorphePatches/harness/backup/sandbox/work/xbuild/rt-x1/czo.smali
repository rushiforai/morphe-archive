.class public final Lczo;
.super Ljsd;
.source "SourceFile"


# instance fields
.field public c:Landroid/view/View;

.field public d:Lu2p;


# virtual methods
.method public final b(Lcie;Lw06;)V
    .registers 6

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-lez v0, :cond_9

    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    :cond_9
    new-instance v0, Lu2p;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Laoo;-><init>(Landroid/content/Context;Landroid/view/View;)V

    iput-object v0, p0, Lczo;->d:Lu2p;

    invoke-static {v0, p1}, Ljsd;->c(Laoo;Lcie;)V

    sget-object p1, Lw06;->h:Lw06;

    if-ne p2, p1, :cond_25

    iget-object p1, p0, Lczo;->c:Landroid/view/View;

    if-eqz p1, :cond_25

    iget-object p0, p0, Lczo;->d:Lu2p;

    invoke-virtual {p0, p1}, Laoo;->v(Landroid/view/View;)V

    :cond_25
    invoke-static {p2}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    return-void
.end method

.method public final e(Lcie;)V
    .registers 2

    invoke-super {p0, p1}, Ljsd;->e(Lcie;)V

    iget-object p0, p0, Lczo;->d:Lu2p;

    if-eqz p0, :cond_a

    invoke-virtual {p0}, Laoo;->unregister()V

    :cond_a
    return-void
.end method
