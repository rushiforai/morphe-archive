.class public abstract Lfk3;
.super Lm93;
.source "SourceFile"


# instance fields
.field public final A:B

.field public final B:Lek3;


# direct methods
.method public constructor <init>(II)V
    .registers 4

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lm93;-><init>(II)V

    new-instance p1, Lek3;

    invoke-direct {p1, p0}, Lek3;-><init>(Lfk3;)V

    iput-object p1, p0, Lfk3;->B:Lek3;

    iput-byte p2, p0, Lfk3;->A:B

    return-void
.end method


# virtual methods
.method public final G0(Ljava/lang/String;)V
    .registers 3

    iget-byte p0, p0, Lfk3;->A:B

    const/4 v0, 0x0

    invoke-static {p0, v0, p1, v0}, Lhj;->b(IILjava/lang/String;Z)V

    invoke-static {}, LJ/N;->MqE$051l()V

    return-void
.end method

.method public final H0()Ljava/util/Collection;
    .registers 1

    iget-byte p0, p0, Lfk3;->A:B

    invoke-static {p0}, Lhj;->a(I)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public final I0()V
    .registers 4

    iget-byte p0, p0, Lfk3;->A:B

    invoke-static {p0}, Lhj;->a(I)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {v2, p0, v1, v2}, Lhj;->b(IILjava/lang/String;Z)V

    goto :goto_a

    :cond_1b
    invoke-static {}, LJ/N;->MqE$051l()V

    return-void
.end method

.method public final J0(Ljava/util/ArrayList;)V
    .registers 7

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_6
    if-ge v2, v0, :cond_16

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Ljava/lang/String;

    iget-byte v4, p0, Lfk3;->A:B

    invoke-static {v1, v4, v3, v1}, Lhj;->b(IILjava/lang/String;Z)V

    goto :goto_6

    :cond_16
    sget-object p0, Lhj;->a:Li7f;

    invoke-static {}, LJ/N;->MqE$051l()V

    return-void
.end method

.method public final onDestroyView()V
    .registers 3

    iget-object v0, p0, Lfk3;->B:Lek3;

    sget-object v1, Lhj;->a:Li7f;

    invoke-virtual {v1, v0}, Li7f;->c(Ljava/lang/Object;)Z

    invoke-super {p0}, Lm93;->onDestroyView()V

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 3

    invoke-super {p0, p1, p2}, Lm93;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p0, p0, Lfk3;->B:Lek3;

    sget-object p1, Lhj;->a:Li7f;

    invoke-virtual {p1, p0}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method
